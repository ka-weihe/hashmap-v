 #ifndef V_COMMIT_HASH
 #define V_COMMIT_HASH "b173cea"
 #endif
 #include <inttypes.h>
 
 // All custom defines      : no_bounds_checking
 // Turned ON custom defines: no_bounds_checking
 #define CUSTOM_DEFINE_no_bounds_checking
 //
 
 

//#include <inttypes.h>  // int64_t etc
//#include <stdint.h>  // int64_t etc

//================================== 1TYPEDEFS ================================*/

typedef int64_t i64;
typedef int16_t i16;
typedef int8_t i8;
typedef uint64_t u64;
typedef uint32_t u32;
typedef uint16_t u16;
typedef uint8_t byte;
typedef uint32_t rune;
typedef float f32;
typedef double f64;
typedef unsigned char* byteptr;
typedef int* intptr;
typedef void* voidptr;
typedef char* charptr;
typedef struct array array;
typedef struct map map;
typedef array array_string;
typedef array array_int;
typedef array array_byte;
typedef array array_f32;
typedef array array_f64;
typedef array array_u16;
typedef array array_u32;
typedef array array_u64;
typedef map map_int;
typedef map map_string;
#ifndef bool
	typedef int bool;
	#define true 1
	#define false 0
#endif

 

//#include <inttypes.h>  // int64_t etc
#include <stdio.h>  // TODO remove all these includes, define all function signatures and types manually
#include <stdlib.h>

//#include "fns.h"
#include <signal.h>
#include <stdarg.h> // for va_list
#include <string.h> // memcpy

#if INTPTR_MAX == INT32_MAX
    #define TARGET_IS_32BIT 1
#elif INTPTR_MAX == INT64_MAX
    #define TARGET_IS_64BIT 1
#else
    #error "The environment is not 32 or 64-bit."
#endif

#if defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__ || defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN || defined(__BIG_ENDIAN__) || defined(__ARMEB__) || defined(__THUMBEB__) || defined(__AARCH64EB__) || defined(_MIBSEB) || defined(__MIBSEB) || defined(__MIBSEB__)
    #define TARGET_ORDER_IS_BIG
#elif defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ || defined(__BYTE_ORDER) && __BYTE_ORDER == __LITTLE_ENDIAN || defined(__LITTLE_ENDIAN__) || defined(__ARMEL__) || defined(__THUMBEL__) || defined(__AARCH64EL__) || defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__) || defined(_M_AMD64) || defined(_M_X64) || defined(_M_IX86)
    #define TARGET_ORDER_IS_LITTLE
#else
    #error "Unknown architecture endianness"
#endif

#ifndef _WIN32
#include <ctype.h>
#include <locale.h> // tolower
#include <sys/time.h>
#include <unistd.h> // sleep
extern char **environ;
#endif

#if defined(__CYGWIN__) && !defined(_WIN32)
#error Cygwin is not supported, please use MinGW or Visual Studio.
#endif


#ifdef __linux__
#include <sys/types.h>
#include <sys/wait.h> // os__wait uses wait on nix
#endif

#ifdef __FreeBSD__
#include <sys/types.h>
#include <sys/wait.h> // os__wait uses wait on nix
#endif

#ifdef __DragonFly__
#include <sys/types.h>
#include <sys/wait.h> // os__wait uses wait on nix
#endif

#ifdef __OpenBSD__
#include <sys/types.h>
#include <sys/resource.h>
#include <sys/wait.h> // os__wait uses wait on nix
#endif

#ifdef __NetBSD__
#include <sys/wait.h> // os__wait uses wait on nix
#endif



#define EMPTY_STRUCT_DECLARATION
#define EMPTY_STRUCT_INITIALIZATION 0
// Due to a tcc bug, the length of an array needs to be specified, but GCC crashes if it is...
#define EMPTY_ARRAY_OF_ELEMS(x,n) (x[])
#define TCCSKIP(x) x

#ifdef __TINYC__
#undef EMPTY_STRUCT_DECLARATION
#undef EMPTY_STRUCT_INITIALIZATION
#define EMPTY_STRUCT_DECLARATION char _dummy
#define EMPTY_STRUCT_INITIALIZATION 0
#undef EMPTY_ARRAY_OF_ELEMS
#define EMPTY_ARRAY_OF_ELEMS(x,n) (x[n])
#undef TCCSKIP
#define TCCSKIP(x)
#endif

// for __offset_of
#ifndef __offsetof
#define __offsetof(s,memb) \
    ((size_t)((char *)&((s *)0)->memb - (char *)0))
#endif

#define OPTION_CAST(x) (x)

#ifndef V64_PRINTFORMAT
#ifdef PRIx64
#define V64_PRINTFORMAT "0x%"PRIx64
#elif defined(__WIN32__)
#define V64_PRINTFORMAT "0x%I64x"
#elif defined(__LINUX__) && defined(__LP64__)
#define V64_PRINTFORMAT "0x%lx"
#else
#define V64_PRINTFORMAT "0x%llx"
#endif
#endif



#ifdef _WIN32
#define WINVER 0x0600
#ifdef _WIN32_WINNT
#undef _WIN32_WINNT
#endif
#define _WIN32_WINNT 0x0600
#define WIN32_LEAN_AND_MEAN
#define _UNICODE
#define UNICODE
#include <windows.h>

#include <io.h> // _waccess
#include <direct.h> // _wgetcwd
//#include <WinSock2.h>
#ifdef _MSC_VER

// On MSVC these are the same (as long as /volatile:ms is passed)
#define _Atomic volatile

// MSVC cannot parse some things properly
#undef EMPTY_STRUCT_DECLARATION
#undef OPTION_CAST

#define EMPTY_STRUCT_DECLARATION int ____dummy_variable
#define OPTION_CAST(x)

#include <dbghelp.h>
#pragma comment(lib, "Dbghelp.lib")

extern wchar_t **_wenviron;

#endif

#else
#include <pthread.h>
#endif


//============================== HELPER C MACROS =============================*/
#define _PUSH(arr, val, tmp, tmp_typ) {tmp_typ tmp = (val); array_push(arr, &tmp);}
#define _PUSH_MANY(arr, val, tmp, tmp_typ) {tmp_typ tmp = (val); array_push_many(arr, tmp.data, tmp.len);}
#define _IN(typ, val, arr) array_##typ##_contains(arr, val)
#define _IN_MAP(val, m) map_exists(m, val)
#define DEFAULT_EQUAL(a, b) (a == b)
#define DEFAULT_NOT_EQUAL(a, b) (a != b)
#define DEFAULT_LT(a, b) (a < b)
#define DEFAULT_LE(a, b) (a <= b)
#define DEFAULT_GT(a, b) (a > b)
#define DEFAULT_GE(a, b) (a >= b)

// NB: macro_fXX_eq and macro_fXX_ne are NOT used
// in the generated C code. They are here just for
// completeness/testing.

#define macro_f64_eq(a, b) (a == b)
#define macro_f64_ne(a, b) (a != b)
#define macro_f64_lt(a, b) (a <  b)
#define macro_f64_le(a, b) (a <= b)
#define macro_f64_gt(a, b) (a >  b)
#define macro_f64_ge(a, b) (a >= b)

#define macro_f32_eq(a, b) (a == b)
#define macro_f32_ne(a, b) (a != b)
#define macro_f32_lt(a, b) (a <  b)
#define macro_f32_le(a, b) (a <= b)
#define macro_f32_gt(a, b) (a >  b)
#define macro_f32_ge(a, b) (a >= b)

//================================== GLOBALS =================================*/
byte g_str_buf[1024];
int load_so(byteptr);
void reload_so();

// ============== wyhash ==============
//	Author: Wang Yi <godspeed_china@yeah.net>
#ifndef wyhash_version_4
#define wyhash_version_4
#include	<stdint.h>
#include	<string.h>
#if defined(_MSC_VER) && defined(_M_X64)
#include <intrin.h>
#pragma	intrinsic(_umul128)
#endif
const	uint64_t	_wyp0=0xa0761d6478bd642full,	_wyp1=0xe7037ed1a0b428dbull,	_wyp2=0x8ebc6af09c88c6e3ull,	_wyp3=0x589965cc75374cc3ull,	_wyp4=0x1d8e4e27c47d124full;
static	inline	uint64_t	_wyrotr(uint64_t v, unsigned k) {	return	(v>>k)|(v<<(64-k));	}
static	inline	uint64_t	_wymum(uint64_t	A,	uint64_t	B) {
#ifdef	WYHASH32
	uint64_t    hh=(A>>32)*(B>>32), hl=(A>>32)*(unsigned)B, lh=(unsigned)A*(B>>32), ll=(uint64_t)(unsigned)A*(unsigned)B;
	return  _wyrotr(hl,32)^_wyrotr(lh,32)^hh^ll;
#else
	#ifdef __SIZEOF_INT128__
		__uint128_t	r=A;	r*=B;	return	(r>>64)^r;
	#elif	defined(_MSC_VER) && defined(_M_X64)
		A=_umul128(A, B, &B);	return	A^B;
	#else
		uint64_t	ha=A>>32,	hb=B>>32,	la=(uint32_t)A,	lb=(uint32_t)B,	hi, lo;
		uint64_t	rh=ha*hb,	rm0=ha*lb,	rm1=hb*la,	rl=la*lb,	t=rl+(rm0<<32),	c=t<rl;
		lo=t+(rm1<<32);	c+=lo<t;hi=rh+(rm0>>32)+(rm1>>32)+c;	return hi^lo;
	#endif
#endif
}
#ifndef WYHASH_LITTLE_ENDIAN
	#if	defined(_WIN32) || defined(__LITTLE_ENDIAN__) || (defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)
		#define WYHASH_LITTLE_ENDIAN 1
	#elif	defined(__BIG_ENDIAN__) || (defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
		#define WYHASH_LITTLE_ENDIAN 0
	#endif
#endif
#if(WYHASH_LITTLE_ENDIAN) || defined(__TINYC__)
static	inline	uint64_t	_wyr8(const	uint8_t	*p)	{	uint64_t	v;	memcpy(&v,  p,  8);	return  v;	}
static	inline	uint64_t	_wyr4(const	uint8_t	*p)	{	unsigned	v;	memcpy(&v,  p,  4);	return  v;	}
#else
	#if defined(__GNUC__) || defined(__INTEL_COMPILER)
static	inline	uint64_t	_wyr8(const	uint8_t	*p)	{	uint64_t	v;	memcpy(&v,  p,  8);	return   __builtin_bswap64(v);	}
static	inline	uint64_t	_wyr4(const	uint8_t	*p)	{	unsigned	v;	memcpy(&v,  p,  4);	return   __builtin_bswap32(v);	}
	#elif	defined(_MSC_VER)
static	inline	uint64_t	_wyr8(const	uint8_t	*p)	{	uint64_t	v;	memcpy(&v,  p,  8);	return  _byteswap_uint64(v);}
static	inline	uint64_t	_wyr4(const	uint8_t	*p)	{	unsigned	v;	memcpy(&v,  p,  4);	return  _byteswap_ulong(v);	}
	#endif
#endif
static	inline	uint64_t	_wyr3(const	uint8_t	*p,	unsigned	k) {	return	(((uint64_t)p[0])<<16)|(((uint64_t)p[k>>1])<<8)|p[k-1];	}
static	inline	uint64_t	wyhash(const void* key,	uint64_t	len,	uint64_t	seed) {
	const	uint8_t	*p=(const	uint8_t*)key;	uint64_t	i=len&63;
	#if defined(__GNUC__) || defined(__INTEL_COMPILER)
		#define	_like_(x)	__builtin_expect(x,1)
		#define	_unlike_(x)	__builtin_expect(x,0)
	#else
		#define _like_(x)  (x)
		#define _unlike_(x)  (x)
	#endif
	if(_unlike_(!i)) {	}
	else	if(_unlike_(i<4))	seed=_wymum(_wyr3(p,i)^seed^_wyp0,seed^_wyp1);
	else	if(_like_(i<=8))	seed=_wymum(_wyr4(p)^seed^_wyp0,_wyr4(p+i-4)^seed^_wyp1);
	else	if(_like_(i<=16))	seed=_wymum(_wyr8(p)^seed^_wyp0,_wyr8(p+i-8)^seed^_wyp1);
	else	if(_like_(i<=24))	seed=_wymum(_wyr8(p)^seed^_wyp0,_wyr8(p+8)^seed^_wyp1)^_wymum(_wyr8(p+i-8)^seed^_wyp2,seed^_wyp3);
	else	if(_like_(i<=32))	seed=_wymum(_wyr8(p)^seed^_wyp0,_wyr8(p+8)^seed^_wyp1)^_wymum(_wyr8(p+16)^seed^_wyp2,_wyr8(p+i-8)^seed^_wyp3);
	else{	seed=_wymum(_wyr8(p)^seed^_wyp0,_wyr8(p+8)^seed^_wyp1)^_wymum(_wyr8(p+16)^seed^_wyp2,_wyr8(p+24)^seed^_wyp3)^_wymum(_wyr8(p+i-32)^seed^_wyp1,_wyr8(p+i-24)^seed^_wyp2)^_wymum(_wyr8(p+i-16)^seed^_wyp3,_wyr8(p+i-8)^seed^_wyp0);	}
	if(_like_(i==len))	return	_wymum(seed,len^_wyp4);
	uint64_t	see1=seed,	see2=seed,	see3=seed;
	for(p+=i,i=len-i;	_like_(i>=64); i-=64,p+=64) {
		seed=_wymum(_wyr8(p)^seed^_wyp0,_wyr8(p+8)^seed^_wyp1);		see1=_wymum(_wyr8(p+16)^see1^_wyp2,_wyr8(p+24)^see1^_wyp3);
		see2=_wymum(_wyr8(p+32)^see2^_wyp1,_wyr8(p+40)^see2^_wyp2);	see3=_wymum(_wyr8(p+48)^see3^_wyp3,_wyr8(p+56)^see3^_wyp0);
	}
	return	_wymum(seed^see1^see2,see3^len^_wyp4);
}
static	inline	uint64_t	wyhash64(uint64_t	A, uint64_t	B) {	return	_wymum(_wymum(A^_wyp0,	B^_wyp1),	_wyp2);	}
static	inline	uint64_t	wyrand(uint64_t	*seed) {	*seed+=_wyp0;	return	_wymum(*seed^_wyp1,*seed);	}
static	inline	double	wy2u01(uint64_t	r) {	const	double	_wynorm=1.0/(1ull<<52);	return	(r>>11)*_wynorm;	}
static	inline	double	wy2gau(uint64_t	r) {	const	double	_wynorm=1.0/(1ull<<20);	return	((r&0x1fffff)+((r>>21)&0x1fffff)+((r>>42)&0x1fffff))*_wynorm-3.0;	}
static inline uint64_t fastest_hash(const void *key, size_t len, uint64_t seed) {
  const uint8_t *p = (const uint8_t *)key;
  return _like_(len >= 4) ? (_wyr4(p) + _wyr4(p + len - 4)) * (_wyr4(p + (len >> 1) - 2) ^ seed) : (_like_(len) ? _wyr3(p, len) * (_wyp0 ^ seed) : seed);
}
#endif


 int g_test_oks = 0;
 int g_test_fails = 0;
#define builtin__hashbits  24
#define builtin__cached_hashbits  16
#define builtin__init_log_capicity  5
#define builtin__init_max_load_factor  0.8
#define builtin__min_load_factor  0.3
#define builtin__extra_metas_inc  4
#define builtin__degree  6
#define builtin__CP_UTF8  65001
#define strconv__DIGITS  18
#define strconv__fsm_a  0
#define strconv__fsm_b  1
#define strconv__fsm_c  2
#define strconv__fsm_d  3
#define strconv__fsm_e  4
#define strconv__fsm_f  5
#define strconv__fsm_g  6
#define strconv__fsm_h  7
#define strconv__fsm_i  8
#define strconv__FSM_STOP  9
#define strconv__parser_ok  0
#define strconv__parser_pzero  1
#define strconv__parser_mzero  2
#define strconv__parser_pinf  3
#define strconv__parser_minf  4
#define strconv__DPOINT  '.'
#define strconv__PLUS  '+'
#define strconv__MINUS  '-'
#define strconv__ZERO  '0'
#define strconv__NINE  '9'
#define strconv__int_size  32
#define btree__degree  6
#define btree__max_length  11
#define time__seconds_per_minute  60
#define math__bias  1023
#define math__e  2.71828182845904523536028747135266249775724709369995957496696763
#define math__pi  3.14159265358979323846264338327950288419716939937510582097494459
#define math__phi  1.61803398874989484820458683436563811772030917980576286213544862
#define math__tau  6.28318530717958647692528676655900576839433879875021164194988918
#define math__sqrt2  1.41421356237309504880168872420969807856967187537694807317667974
#define math__sqrt_e  1.64872127070012814684865078781416357165377610071014801157507931
#define math__sqrt_pi  1.77245385090551602729816748334114518279754945612238712821380779
#define math__sqrt_tau  2.50662827463100050241576528481104525300698674060993831662992357
#define math__sqrt_phi  1.27201964951406896425242246173749149171560804184009624861664038
#define math__ln2  0.693147180559945309417232121458176568075500134360255254120680009
#define math__ln10  2.30258509299404568401799145468436420760110148862877297603332790
#define math__max_i8  127
#define math__max_i16  32767
#define math__max_i32  2147483647
#define math__max_i64 UINT64_C( 9223372036854775807)
#define math__max_u8  255
#define math__max_u16  65535
#define math__max_u32  4294967295
#define math__max_u64 UINT64_C( 18446744073709551615)
#define math_dot_bits__max_u32  4294967295
#define math_dot_bits__max_u64 UINT64_C( 18446744073709551615)
#define strconv_dot_ftoa__maxexp32  255
#define strconv_dot_ftoa__maxexp64  2047
#define strconv_dot_ftoa__pow5_num_bits_32  61
#define strconv_dot_ftoa__pow5_inv_num_bits_32  59
#define strconv_dot_ftoa__pow5_num_bits_64  121
#define strconv_dot_ftoa__pow5_inv_num_bits_64  122
#define hashmap__hashbits  24
#define hashmap__cached_hashbits  16
#define hashmap__init_log_capicity  5
#define hashmap__init_max_load_factor  0.8
#define hashmap__min_load_factor  0.3
#define hashmap__extra_metas_inc  4
#include <float.h>
#include <time.h>
#include <math.h>
typedef struct array array;
typedef array array_string;
typedef array array_int;
typedef array array_bool;
typedef array array_byte;
typedef array array_char;
typedef array array_voidptr;
typedef struct KeyValue KeyValue;
typedef struct DenseArray DenseArray;
typedef struct map map;
typedef struct Option Option;
typedef struct SortedMap SortedMap;
typedef struct mapnode mapnode;
typedef struct string string;
typedef struct ustring ustring;
typedef struct RepIndex RepIndex;
typedef array array_RepIndex;
typedef Option Option_int;
typedef Option Option_int;
typedef struct strings__Builder strings__Builder;
typedef union strconv__Float64u strconv__Float64u;
typedef struct _V_MulRet_u32_V_u32_V_u32 _V_MulRet_u32_V_u32_V_u32;
typedef struct strconv__PrepNumber strconv__PrepNumber;
typedef struct _V_MulRet_int_V_strconv__PrepNumber _V_MulRet_int_V_strconv__PrepNumber;
typedef struct btree__Bnode btree__Bnode;
typedef struct btree__Tree btree__Tree;
typedef struct rand__Pcg32 rand__Pcg32;
typedef struct rand__Splitmix64 rand__Splitmix64;
typedef Option Option_time__Time;
typedef Option Option_time__Time;
typedef struct time__Time time__Time;
typedef Option Option_int;
typedef struct _V_MulRet_int_V_int_V_int _V_MulRet_int_V_int_V_int;
typedef struct _V_MulRet_u32_V_u32 _V_MulRet_u32_V_u32;
typedef struct _V_MulRet_u64_V_u64 _V_MulRet_u64_V_u64;
typedef struct strconv_dot_ftoa__Dec32 strconv_dot_ftoa__Dec32;
typedef union strconv_dot_ftoa__Uf32 strconv_dot_ftoa__Uf32;
typedef struct _V_MulRet_strconv_dot_ftoa__Dec32_V_bool _V_MulRet_strconv_dot_ftoa__Dec32_V_bool;
typedef struct strconv_dot_ftoa__Uint128 strconv_dot_ftoa__Uint128;
typedef struct strconv_dot_ftoa__Dec64 strconv_dot_ftoa__Dec64;
typedef union strconv_dot_ftoa__Uf64 strconv_dot_ftoa__Uf64;
typedef struct _V_MulRet_strconv_dot_ftoa__Dec64_V_bool _V_MulRet_strconv_dot_ftoa__Dec64_V_bool;
typedef array array_u64;
typedef array array_strconv_dot_ftoa__Uint128;
typedef struct hashmap__Hashmap hashmap__Hashmap;
typedef struct hashmap__Kv hashmap__Kv;
typedef struct hashmap__DenseArr hashmap__DenseArr;
typedef struct _V_MulRet_u64_V_u32 _V_MulRet_u64_V_u32;
typedef array array_ptr_void;
typedef Option Option_int;
typedef Option Option_int;
typedef Option Option_time__Time;
typedef Option Option_time__Time;
typedef int time__FormatTime;
typedef int time__FormatDate;
typedef int time__FormatDelimiter;
typedef Option Option_int;
struct string {
	byte* str;
	int len;
};

struct array {
	void* data;
	int len;
	int cap;
	int element_size;
};

struct KeyValue {
	string key;
	void* value;
};

struct DenseArray {
	KeyValue* data;
	u32 cap;
	u32 size;
};

struct map {
	int value_bytes;
	u32 cap;
	byte window;
	byte shift;
	DenseArray key_values;
	u32* metas;
	f32 max_load_factor;
	u32 extra_metas;
	int size;
};

struct Option {
	byte data  [300 ];
	string error;
	int ecode;
	bool ok;
	bool is_none;
};


//----
struct SortedMap {
	int value_bytes;
	mapnode* root;
	int size;
};

struct mapnode {
	string keys  [11 ];
	voidptr values  [11 ];
	voidptr* children;
	int size;
};

struct ustring {
	string s;
	array_int runes;
	int len;
};

struct RepIndex {
	int idx;
	int val_idx;
};

struct strings__Builder {
	array_byte buf;
	int len;
	int initial_size;
};

union strconv__Float64u {
	f64 f;
	u64 u;
};

struct _V_MulRet_u32_V_u32_V_u32 {
	u32 var_0;
	u32 var_1;
	u32 var_2;
};

struct strconv__PrepNumber {
	bool negative;
	int exponent;
	u64 mantissa;
};

struct btree__Bnode {
	string keys  [btree__max_length ];
	int values  [btree__max_length ];
	voidptr* children;
	int size;
};

struct btree__Tree {
	btree__Bnode* root;
	int size;
};

struct rand__Pcg32 {
	u64 state;
	u64 inc;
};

struct rand__Splitmix64 {
	u64 state;
};

struct time__Time {
	int year;
	int month;
	int day;
	int hour;
	int minute;
	int second;
	int v_unix;
};

struct _V_MulRet_int_V_int_V_int {
	int var_0;
	int var_1;
	int var_2;
};

struct _V_MulRet_u32_V_u32 {
	u32 var_0;
	u32 var_1;
};

struct _V_MulRet_u64_V_u64 {
	u64 var_0;
	u64 var_1;
};

struct strconv_dot_ftoa__Dec32 {
	u32 m;
	int e;
};

union strconv_dot_ftoa__Uf32 {
	f32 f;
	u32 u;
};

struct strconv_dot_ftoa__Uint128 {
	u64 lo;
	u64 hi;
};

struct strconv_dot_ftoa__Dec64 {
	u64 m;
	int e;
};

union strconv_dot_ftoa__Uf64 {
	f64 f;
	u64 u;
};

struct hashmap__Kv {
	string key;
	int value;
};

struct hashmap__DenseArr {
	hashmap__Kv* data;
	u32 cap;
	u32 size;
};

struct _V_MulRet_u64_V_u32 {
	u64 var_0;
	u32 var_1;
};

struct _V_MulRet_int_V_strconv__PrepNumber {
	int var_0;
	strconv__PrepNumber var_1;
};

struct _V_MulRet_strconv_dot_ftoa__Dec32_V_bool {
	strconv_dot_ftoa__Dec32 var_0;
	bool var_1;
};

struct _V_MulRet_strconv_dot_ftoa__Dec64_V_bool {
	strconv_dot_ftoa__Dec64 var_0;
	bool var_1;
};

struct hashmap__Hashmap {
	u32 cap;
	byte window;
	byte shift;
	hashmap__DenseArr key_values;
	u32* metas;
	f32 max_load_factor;
	u32 extra_metas;
	int size;
};



string _STR(const char*, ...);


string _STR_TMP(const char*, ...);

array new_array (int mylen, int cap, int elm_size);
array make (int len, int cap, int elm_size);
array new_array_from_c_array (int len, int cap, int elm_size, void* c_array);
array new_array_from_c_array_no_alloc (int len, int cap, int elm_size, void* c_array);
void array_ensure_cap (array* a, int required);
array array_repeat (array a, int count);
void array_sort_with_compare (array* a, void* compare);
void array_insert (array* a, int i, void* val);
void array_prepend (array* a, void* val);
void v_array_delete (array* a, int i);
void array_clear (array* a);
void array_trim (array* a, int index);
void* array_get (array a, int i);
void* array_first (array a);
void* array_last (array a);
array array_slice (array a, int start, int _end);
array array_slice2 (array a, int start, int _end, bool end_max);
array array_clone (array* a);
array array_slice_clone (array* a, int start, int _end);
void array_set (array* a, int i, void* val);
void array_push (array* a, void* val);
void array_push_many (array* a3, void* val, int size);
array array_reverse (array a);
void v_array_free (array a);
string array_string_str (array_string a);
string array_int_str (array_int a);
string array_bool_str (array_bool a);
string array_byte_hex (array_byte b);
int copy (array_byte dst, array_byte src);
int compare_ints (int* a, int* b);
void array_int_sort (array_int* a);
int array_string_index (array_string a, string v);
int array_int_index (array_int a, int v);
int array_byte_index (array_byte a, byte v);
int array_char_index (array_char a, char v);
int array_int_reduce (array_int a, int (*iter)( int accum, int curr /*FFF*/ ), int accum_start);
bool array_string_eq (array_string a1, array_string a2);
int compare_i64 (i64* a, i64* b);
int compare_f64 (f64* a, f64* b);
int compare_f32 (f32* a, f32* b);
array_voidptr array_pointers (array a);
void builtin__init ();
void v_exit (int code);
bool isnil (void* v);
void print_backtrace_skipping_top_frames (int skipframes);
void print_backtrace ();
void panic_debug (int line_no, string file, string mod, string fn_name, string s);
void v_panic (string s);
void eprintln (string s);
void eprint (string s);
void print (string s);
void looo ();
byte* v_malloc (int n);
byte* v_calloc (int n);
byte* vcalloc (int n);
void v_free (void* ptr);
void* memdup (void* src, int sz);
void v_ptr_free (void* ptr);
int is_atty (int fd);
void println (string s);
bool print_backtrace_skipping_top_frames_msvc (int skipframes);
bool print_backtrace_skipping_top_frames_mingw (int skipframes);
bool print_backtrace_skipping_top_frames_nix (int xskipframes);
bool print_backtrace_skipping_top_frames_mac (int skipframes);
bool print_backtrace_skipping_top_frames_freebsd (int skipframes);
bool print_backtrace_skipping_top_frames_linux (int skipframes);
int backtrace (void* a, int b);
byteptr* backtrace_symbols (void* , int );
void backtrace_symbols_fd (void* , int , int );
int proc_pidpath (int , void* , int );
static inline string f64_str (f64 d);
static inline string f64_strsci (f64 x, int digit_num);
static inline string f64_strlong (f64 x);
static inline string f32_str (f32 d);
static inline string f32_strsci (f32 x, int digit_num);
static inline string f32_strlong (f32 x);
static inline f32 f32_abs (f32 a);
static inline f64 f64_abs (f64 a);
static inline bool f64_eq (f64 a, f64 b);
static inline bool f32_eq (f32 a, f32 b);
bool f64_eqbit (f64 a, f64 b);
bool f32_eqbit (f32 a, f32 b);
bool f64_ne (f64 a, f64 b);
bool f32_ne (f32 a, f32 b);
bool f64_nebit (f64 a, f64 b);
bool f32_nebit (f32 a, f32 b);
bool f64_lt (f64 a, f64 b);
bool f32_lt (f32 a, f32 b);
bool f64_ltbit (f64 a, f64 b);
bool f32_ltbit (f32 a, f32 b);
bool f64_le (f64 a, f64 b);
bool f32_le (f32 a, f32 b);
bool f64_lebit (f64 a, f64 b);
bool f32_lebit (f32 a, f32 b);
bool f64_gt (f64 a, f64 b);
bool f32_gt (f32 a, f32 b);
bool f64_gtbit (f64 a, f64 b);
bool f32_gtbit (f32 a, f32 b);
bool f64_ge (f64 a, f64 b);
bool f32_ge (f32 a, f32 b);
bool f64_gebit (f64 a, f64 b);
bool f32_gebit (f32 a, f32 b);
string ptr_str (void* ptr);
static inline string int_str_l (int nn, int max);
string i8_str (i8 n);
string i16_str (i16 n);
string u16_str (u16 n);
string int_str (int n);
string u32_str (u32 nn);
string i64_str (i64 nn);
string u64_str (u64 nn);
string bool_str (bool b);
string int_hex (int nn);
string u64_hex (u64 nn);
string i64_hex (i64 nn);
bool array_byte_contains (array_byte a, byte val);
string rune_str (rune c);
string byte_str (byte c);
bool byte_is_capital (byte c);
array_byte array_byte_clone (array_byte b);
static inline DenseArray new_dense_array ();
static inline u32 DenseArray_push (DenseArray* d, KeyValue kv);
void DenseArray_zeros_to_end (DenseArray* d);
map new_map (int n, int value_bytes);
map new_map_init (int n, int value_bytes, string* keys, void* values);
void map_set (map* m, string key, void* value);
void map_expand (map* m);
void map_shrink (map* m);
void map_rehash (map* m);
void map_cached_rehash (map* m, u32 old_cap);
static inline bool map_get (map m, string key, void* out);
static inline bool map_exists (map m, string key);
void v_map_delete (map* m, string key);
array_string map_keys (map* m);
void v_map_free (map m);
void map_print (map m);
string map_string_str (map_string m);
Option opt_ok (void* data, int size);
Option opt_none ();
Option v_error (string s);
Option error_with_code (string s, int code);
SortedMap new_sorted_map (int n, int value_bytes);
SortedMap new_sorted_map_init (int n, int value_bytes, string* keys, void* values);
mapnode* new_node ();
void SortedMap_set (SortedMap* m, string key, void* value);
void mapnode_split_child (mapnode* n, int child_index, mapnode* y);
bool SortedMap_get (SortedMap m, string key, void* out);
bool SortedMap_exists (SortedMap m, string key);
int mapnode_find_key (mapnode* n, string k);
bool mapnode_remove_key (mapnode* n, string k);
void mapnode_remove_from_leaf (mapnode* n, int idx);
void mapnode_remove_from_non_leaf (mapnode* n, int idx);
void mapnode_fill (mapnode* n, int idx);
void mapnode_borrow_from_prev (mapnode* n, int idx);
void mapnode_borrow_from_next (mapnode* n, int idx);
void mapnode_merge (mapnode* n, int idx);
void v_SortedMap_delete (SortedMap* m, string key);
int mapnode_subkeys (mapnode* n, array_string* keys, int at);
array_string SortedMap_keys (SortedMap* m);
void v_mapnode_free (mapnode* n);
void v_SortedMap_free (SortedMap* m);
void SortedMap_print (SortedMap m);
int vstrlen (byte* s);
string tos (byte* s, int len);
string tos_clone (byte* s);
string tos2 (byte* s);
string tos3 (charptr s);
string string_clone (string a);
string cstring_to_vstring (byte* cstr);
string string_replace_once (string s, string rep, string with);
string string_replace (string s, string rep, string with);
int compare_rep_index (RepIndex* a, RepIndex* b);
void array_RepIndex_sort (array_RepIndex* a);
string string_replace_each (string s, array_string vals);
bool string_bool (string s);
int v_string_int (string s);
i64 string_i64 (string s);
i8 string_i8 (string s);
i16 string_i16 (string s);
f32 string_f32 (string s);
f64 string_f64 (string s);
u16 string_u16 (string s);
u32 string_u32 (string s);
u64 string_u64 (string s);
bool string_eq (string s, string a);
bool string_ne (string s, string a);
bool string_lt (string s, string a);
bool string_le (string s, string a);
bool string_gt (string s, string a);
bool string_ge (string s, string a);
string string_add (string s, string a);
array_string string_split (string s, string delim);
array_string string_split_nth (string s, string delim, int nth);
array_string string_split_into_lines (string s);
string string_left (string s, int n);
string string_right (string s, int n);
string string_substr2 (string s, int start, int _end, bool end_max);
string string_substr (string s, int start, int end);
int string_index_old (string s, string p);
Option_int string_index (string s, string p);
int string_index_kmp (string s, string p);
int string_index_any (string s, string chars);
Option_int string_last_index (string s, string p);
int string_index_after (string s, string p, int start);
int string_index_byte (string s, byte c);
int string_last_index_byte (string s, byte c);
int string_count (string s, string substr);
bool string_contains (string s, string p);
bool string_starts_with (string s, string p);
bool string_ends_with (string s, string p);
string string_to_lower (string s);
string string_to_upper (string s);
string string_capitalize (string s);
string string_title (string s);
string string_find_between (string s, string start, string end);
bool array_string_contains (array_string ar, string val);
bool array_int_contains (array_int ar, int val);
bool byte_is_space (byte c);
string string_trim_space (string s);
string string_trim (string s, string cutset);
string string_trim_left (string s, string cutset);
string string_trim_right (string s, string cutset);
int compare_strings (string* a, string* b);
int compare_strings_by_len (string* a, string* b);
int compare_lower_strings (string* a, string* b);
void array_string_sort (array_string* s);
void array_string_sort_ignore_case (array_string* s);
void array_string_sort_by_len (array_string* s);
ustring string_ustring (string s);
ustring string_ustring_tmp (string s);
bool ustring_eq (ustring u, ustring a);
bool ustring_ne (ustring u, ustring a);
bool ustring_lt (ustring u, ustring a);
bool ustring_le (ustring u, ustring a);
bool ustring_gt (ustring u, ustring a);
bool ustring_ge (ustring u, ustring a);
ustring ustring_add (ustring u, ustring a);
int ustring_index_after (ustring u, ustring p, int start);
int ustring_count (ustring u, ustring substr);
string ustring_substr (ustring u, int _start, int _end);
string ustring_left (ustring u, int pos);
string ustring_right (ustring u, int pos);
byte string_at (string s, int idx);
string ustring_at (ustring u, int idx);
void v_ustring_free (ustring u);
bool byte_is_digit (byte c);
bool byte_is_hex_digit (byte c);
bool byte_is_oct_digit (byte c);
bool byte_is_bin_digit (byte c);
bool byte_is_letter (byte c);
void v_string_free (string s);
string string_all_before (string s, string dot);
string string_all_before_last (string s, string dot);
string string_all_after (string s, string dot);
string string_after (string s, string dot);
string array_string_join (array_string a, string del);
string array_string_join_lines (array_string s);
string string_reverse (string s);
string string_limit (string s, int max);
bool byte_is_white (byte c);
int string_hash (string s);
array_byte string_bytes (string s);
string string_repeat (string s, int count);
int utf8_char_len (byte b);
string utf32_to_str (u32 code);
string utf32_to_str_no_malloc (u32 code, void* buf);
int string_utf32_code (string _rune);
u16* string_to_wide (string _str);
string string_from_wide (u16* _wstr);
string string_from_wide2 (u16* _wstr, int len);
int utf8_len (byte c);
int utf8_getchar ();
strings__Builder strings__new_builder (int initial_size);
void strings__Builder_write_bytes (strings__Builder* b, byte* bytes, int howmany);
void strings__Builder_write_b (strings__Builder* b, byte data);
void strings__Builder_write (strings__Builder* b, string s);
void strings__Builder_go_back (strings__Builder* b, int n);
void strings__Builder_writeln (strings__Builder* b, string s);
string strings__Builder_str (strings__Builder* b);
void strings__Builder_free (strings__Builder* b);
int strings__levenshtein_distance (string a, string b);
f32 strings__levenshtein_distance_percentage (string a, string b);
f32 strings__dice_coefficient (string s1, string s2);
string strings__repeat (byte c, int n);
string strings__repeat_string (string s, int n);
u64 hash_dot_wyhash__rand_u64 (u64* seed);
static inline u64 hash_dot_wyhash__wyhash_c (byte* key, u64 len, u64 seed);
static inline u64 hash_dot_wyhash__sum64_string (string key, u64 seed);
static inline u64 hash_dot_wyhash__sum64 (array_byte key, u64 seed);
static inline u64 hash_dot_wyhash__wyhash64 (byte* key, u64 len, u64 seed_);
static inline u64 hash_dot_wyhash__wyrotr (u64 v, u32 k);
static inline u64 hash_dot_wyhash__wymum (u64 a, u64 b);
static inline u64 hash_dot_wyhash__wyr3 (byte* p, u64 k);
static inline u64 hash_dot_wyhash__wyr4 (byte* p);
static inline u64 hash_dot_wyhash__wyr8 (byte* p);
_V_MulRet_u32_V_u32_V_u32 strconv__lsr96 (u32 s2, u32 s1, u32 s0);
_V_MulRet_u32_V_u32_V_u32 strconv__lsl96 (u32 s2, u32 s1, u32 s0);
_V_MulRet_u32_V_u32_V_u32 strconv__add96 (u32 s2, u32 s1, u32 s0, u32 d2, u32 d1, u32 d0);
_V_MulRet_u32_V_u32_V_u32 strconv__sub96 (u32 s2, u32 s1, u32 s0, u32 d2, u32 d1, u32 d0);
bool strconv__is_digit (byte x);
bool strconv__is_space (byte x);
bool strconv__is_exp (byte x);
_V_MulRet_int_V_strconv__PrepNumber strconv__parser (string s);
u64 strconv__converter (strconv__PrepNumber* pn);
f64 strconv__atof64 (string s);
byte strconv__byte_to_lower (byte c);
u64 strconv__common_parse_uint (string s, int _base, int _bit_size, bool error_on_non_digit, bool error_on_high_digit);
u64 strconv__parse_uint (string s, int _base, int _bit_size);
i64 strconv__common_parse_int (string _s, int base, int _bit_size, bool error_on_non_digit, bool error_on_high_digit);
i64 strconv__parse_int (string _s, int base, int _bit_size);
int strconv__atoi (string s);
bool strconv__underscore_ok (string s);
btree__Bnode* btree__new_bnode ();
btree__Tree btree__new_tree ();
void btree__Tree_set (btree__Tree* t, string key, int value);
void btree__Bnode_split_child (btree__Bnode* n, int child_index, btree__Bnode* y);
int btree__Tree_get (btree__Tree t, string key);
bool btree__Tree_exists (btree__Tree t, string key);
int btree__Bnode_find_key (btree__Bnode n, string k);
bool btree__Bnode_remove_key (btree__Bnode* n, string k);
void btree__Bnode_remove_from_leaf (btree__Bnode* n, int idx);
void btree__Bnode_remove_from_non_leaf (btree__Bnode* n, int idx);
void btree__Bnode_fill (btree__Bnode* n, int idx);
void btree__Bnode_borrow_from_prev (btree__Bnode* n, int idx);
void btree__Bnode_borrow_from_next (btree__Bnode* n, int idx);
void btree__Bnode_merge (btree__Bnode* n, int idx);
void btree__Tree_delete (btree__Tree* t, string k);
void btree__Bnode_free (btree__Bnode n);
void btree__Tree_free (btree__Tree t);
int btree__Bnode_subkeys (btree__Bnode n, array_string* keys, int at);
array_string btree__Tree_keys (btree__Tree t);
rand__Pcg32 rand__new_pcg32 (u64 initstate, u64 initseq);
static inline u32 rand__Pcg32_next (rand__Pcg32* rng);
static inline u32 rand__Pcg32_bounded_next (rand__Pcg32* rng, u32 bound);
void rand__seed (int s);
int rand__next (int max);
int rand__rand_r (int* seed);
rand__Splitmix64 rand__new_splitmix64 (u64 seed);
static inline u64 rand__Splitmix64_next (rand__Splitmix64* rng);
static inline u64 rand__Splitmix64_bounded_next (rand__Splitmix64* rng, u64 bound);
string time__Time_format (time__Time t);
string time__Time_format_ss (time__Time t);
string time__Time_hhmm (time__Time t);
string time__Time_hhmmss (time__Time t);
string time__Time_hhmm12 (time__Time t);
string time__Time_ymmdd (time__Time t);
string time__Time_ddmmy (time__Time t);
string time__Time_md (time__Time t);
string time__Time_clean (time__Time t);
string time__Time_clean12 (time__Time t);
string time__Time_get_fmt_time_str (time__Time t, time__FormatTime fmt_time);
string time__Time_get_fmt_date_str (time__Time t, time__FormatDelimiter fmt_dlmtr, time__FormatDate fmt_date);
string time__Time_get_fmt_str (time__Time t, time__FormatDelimiter fmt_dlmtr, time__FormatTime fmt_time, time__FormatDate fmt_date);
Option_time__Time time__parse (string s);
Option_time__Time time__parse_rfc2822 (string s);
time__Time time__now ();
string time__Time_smonth (time__Time t);
time__Time time__new_time (time__Time t);
int time__Time_calc_unix (time__Time* t);
time__Time time__Time_add_seconds (time__Time t, int seconds);
time__Time time__Time_add_days (time__Time t, int days);
int time__since (time__Time t);
string time__Time_relative (time__Time t);
int time__day_of_week (int y, int m, int d);
int time__Time_day_of_week (time__Time t);
string time__Time_weekday_str (time__Time t);
i64 time__ticks ();
void time__sleep (int seconds);
void time__sleep_ms (int milliseconds);
void time__usleep (int microseconds);
bool time__is_leap_year (int year);
Option_int time__days_in_month (int month, int year);
string time__Time_str (time__Time t);
time__Time time__convert_ctime (struct /*TM*/ tm t);
int time__make_unix_time (struct /*TM*/ tm t);
time__Time time__unix (int abs);
static inline _V_MulRet_int_V_int_V_int time__calculate_date_from_offset (int day_offset_);
static inline _V_MulRet_int_V_int_V_int time__calculate_time_from_offset (int second_offset_);
f64 math__inf (int sign);
f64 math__nan ();
bool math__is_nan (f64 f);
bool math__is_inf (f64 f, int sign);
f64 math__abs (f64 a);
f64 math__acos (f64 a);
f64 math__asin (f64 a);
f64 math__atan (f64 a);
f64 math__atan2 (f64 a, f64 b);
f64 math__cbrt (f64 a);
f64 math__ceil (f64 a);
f64 math__cos (f64 a);
f32 math__cosf (f32 a);
f64 math__cosh (f64 a);
f64 math__degrees (f64 radians);
f64 math__exp (f64 a);
array_int math__digits (int _n, int base);
f64 math__erf (f64 a);
f64 math__erfc (f64 a);
f64 math__exp2 (f64 a);
f64 math__floor (f64 a);
f64 math__fmod (f64 a, f64 b);
f64 math__gamma (f64 a);
i64 math__gcd (i64 a_, i64 b_);
f64 math__hypot (f64 a, f64 b);
i64 math__lcm (i64 a, i64 b);
f64 math__log (f64 a);
f64 math__log2 (f64 a);
f64 math__log10 (f64 a);
f64 math__log_gamma (f64 a);
f64 math__log_n (f64 a, f64 b);
f64 math__max (f64 a, f64 b);
f64 math__min (f64 a, f64 b);
f64 math__pow (f64 a, f64 b);
f32 math__powf (f32 a, f32 b);
f64 math__radians (f64 degrees);
f64 math__round (f64 f);
f64 math__sin (f64 a);
f32 math__sinf (f32 a);
f64 math__sinh (f64 a);
f64 math__sqrt (f64 a);
f32 math__sqrtf (f32 a);
f64 math__tan (f64 a);
f32 math__tanf (f32 a);
f64 math__tanh (f64 a);
f64 math__trunc (f64 a);
f64 math__aprox_sin (f64 a);
f64 math__aprox_cos (f64 a);
u32 math__f32_bits (f32 f);
f32 math__f32_from_bits (u32 b);
u64 math__f64_bits (f64 f);
f64 math__f64_from_bits (u64 b);
int math_dot_bits__leading_zeros_8 (byte x);
int math_dot_bits__leading_zeros_16 (u16 x);
int math_dot_bits__leading_zeros_32 (u32 x);
int math_dot_bits__leading_zeros_64 (u64 x);
int math_dot_bits__trailing_zeros_8 (byte x);
int math_dot_bits__trailing_zeros_16 (u16 x);
int math_dot_bits__trailing_zeros_32 (u32 x);
int math_dot_bits__trailing_zeros_64 (u64 x);
int math_dot_bits__ones_count_8 (byte x);
int math_dot_bits__ones_count_16 (u16 x);
int math_dot_bits__ones_count_32 (u32 x);
int math_dot_bits__ones_count_64 (u64 x);
static inline byte math_dot_bits__rotate_left_8 (byte x, int k);
static inline u16 math_dot_bits__rotate_left_16 (u16 x, int k);
static inline u32 math_dot_bits__rotate_left_32 (u32 x, int k);
static inline u64 math_dot_bits__rotate_left_64 (u64 x, int k);
static inline byte math_dot_bits__reverse_8 (byte x);
static inline u16 math_dot_bits__reverse_16 (u16 x);
static inline u32 math_dot_bits__reverse_32 (u32 x);
static inline u64 math_dot_bits__reverse_64 (u64 x);
static inline u16 math_dot_bits__reverse_bytes_16 (u16 x);
static inline u32 math_dot_bits__reverse_bytes_32 (u32 x);
static inline u64 math_dot_bits__reverse_bytes_64 (u64 x);
int math_dot_bits__len_8 (byte x);
int math_dot_bits__len_16 (u16 x);
int math_dot_bits__len_32 (u32 x);
int math_dot_bits__len_64 (u64 x);
_V_MulRet_u32_V_u32 math_dot_bits__add_32 (u32 x, u32 y, u32 carry);
_V_MulRet_u64_V_u64 math_dot_bits__add_64 (u64 x, u64 y, u64 carry);
_V_MulRet_u32_V_u32 math_dot_bits__sub_32 (u32 x, u32 y, u32 borrow);
_V_MulRet_u64_V_u64 math_dot_bits__sub_64 (u64 x, u64 y, u64 borrow);
_V_MulRet_u32_V_u32 math_dot_bits__mul_32 (u32 x, u32 y);
_V_MulRet_u64_V_u64 math_dot_bits__mul_64 (u64 x, u64 y);
_V_MulRet_u32_V_u32 math_dot_bits__div_32 (u32 hi, u32 lo, u32 y);
_V_MulRet_u64_V_u64 math_dot_bits__div_64 (u64 hi, u64 lo, u64 y1);
u32 math_dot_bits__rem_32 (u32 hi, u32 lo, u32 y);
u64 math_dot_bits__rem_64 (u64 hi, u64 lo, u64 y);
string strconv_dot_ftoa__Dec32_get_string_32 (strconv_dot_ftoa__Dec32 d, bool neg, int n_digit);
_V_MulRet_strconv_dot_ftoa__Dec32_V_bool strconv_dot_ftoa__f32_to_decimal_exact_int (u32 i_mant, u32 exp);
strconv_dot_ftoa__Dec32 strconv_dot_ftoa__f32_to_decimal (u32 mant, u32 exp);
string strconv_dot_ftoa__f32_to_str (f32 f, int n_digit);
string strconv_dot_ftoa__Dec64_get_string_64 (strconv_dot_ftoa__Dec64 d, bool neg, int n_digit);
_V_MulRet_strconv_dot_ftoa__Dec64_V_bool strconv_dot_ftoa__f64_to_decimal_exact_int (u64 i_mant, u64 exp);
strconv_dot_ftoa__Dec64 strconv_dot_ftoa__f64_to_decimal (u64 mant, u64 exp);
string strconv_dot_ftoa__f64_to_str (f64 f, int n_digit);
static inline string strconv_dot_ftoa__ftoa_64 (f64 f);
static inline string strconv_dot_ftoa__ftoa_long_64 (f64 f);
static inline string strconv_dot_ftoa__ftoa_32 (f32 f);
static inline string strconv_dot_ftoa__ftoa_long_32 (f32 f);
void strconv_dot_ftoa__assert1 (bool t, string msg);
static inline int strconv_dot_ftoa__bool_to_int (bool b);
static inline u32 strconv_dot_ftoa__bool_to_u32 (bool b);
static inline u64 strconv_dot_ftoa__bool_to_u64 (bool b);
string strconv_dot_ftoa__get_string_special (bool neg, bool expZero, bool mantZero);
int strconv_dot_ftoa__decimal_len_32 (u32 u);
u32 strconv_dot_ftoa__mul_shift_32 (u32 m, u64 mul, int ishift);
u32 strconv_dot_ftoa__mul_pow5_invdiv_pow2 (u32 m, u32 q, int j);
u32 strconv_dot_ftoa__mul_pow5_div_pow2 (u32 m, u32 i, int j);
u32 strconv_dot_ftoa__pow5_factor_32 (u32 i_v);
bool strconv_dot_ftoa__multiple_of_power_of_five_32 (u32 v, u32 p);
bool strconv_dot_ftoa__multiple_of_power_of_two_32 (u32 v, u32 p);
u32 strconv_dot_ftoa__log10_pow2 (int e);
u32 strconv_dot_ftoa__log10_pow5 (int e);
int strconv_dot_ftoa__pow5_bits (int e);
int strconv_dot_ftoa__decimal_len_64 (u64 u);
u64 strconv_dot_ftoa__shift_right_128 (strconv_dot_ftoa__Uint128 v, int shift);
u64 strconv_dot_ftoa__mul_shift_64 (u64 m, strconv_dot_ftoa__Uint128 mul, int shift);
u32 strconv_dot_ftoa__pow5_factor_64 (u64 v_i);
bool strconv_dot_ftoa__multiple_of_power_of_five_64 (u64 v, u32 p);
bool strconv_dot_ftoa__multiple_of_power_of_two_64 (u64 v, u32 p);
string strconv_dot_ftoa__f32_to_str_l (f64 f);
string strconv_dot_ftoa__f64_to_str_l (f64 f);
hashmap__Hashmap hashmap__new_hmap ();
static inline hashmap__DenseArr hashmap__new_dense_arr ();
static inline u32 hashmap__DenseArr_push (hashmap__DenseArr* d, hashmap__Kv value);
void hashmap__DenseArr_zeros_to_end (hashmap__DenseArr* d);
static inline _V_MulRet_u64_V_u32 hashmap__Hashmap_key_to_index (hashmap__Hashmap h, string key);
static inline _V_MulRet_u64_V_u32 hashmap__meta_less (u32* metas, u64 i, u32 m);
static inline void hashmap__Hashmap_meta_greater (hashmap__Hashmap* h, u64 i, u32 m, u32 kvi);
static inline u32* hashmap__Hashmap_meta_greater2 (hashmap__Hashmap* h, u32* met, u64 i, u32 m, u32 kvi);
void hashmap__Hashmap_set (hashmap__Hashmap* h, string key, int value);
void hashmap__Hashmap_rehash (hashmap__Hashmap* h);
void hashmap__Hashmap_cached_rehash (hashmap__Hashmap* h, u32 old_cap);
void hashmap__Hashmap_expand (hashmap__Hashmap* h);
void hashmap__Hashmap_shrink (hashmap__Hashmap* h);
static inline int hashmap__Hashmap_get (hashmap__Hashmap h, string key);
bool hashmap__Hashmap_exists (hashmap__Hashmap h, string key);
void hashmap__Hashmap_delete (hashmap__Hashmap* h, string key);
array_string hashmap__Hashmap_keys (hashmap__Hashmap h);
void hashmap__Hashmap_free (hashmap__Hashmap h);
void hashmap__Hashmap_set_max_load_factor (hashmap__Hashmap* h, f32 new_lf);
array_string main__generate_strings (int len, int amount);
void main__test_1 ();
void main__test_2 ();
void main__test_3 ();
void main__test_4 ();
void main__test_5 ();
void main__test_6 ();
void main__test_7 ();
void main__test_8 ();
void main__test_9 ();
void main__test_10 ();
void main__main ();

byte* g_m2_buf; // global
byte* g_m2_ptr; // global
byte* g_m2_buf; // global
byte* g_m2_ptr; // global
i64 total_m =  0; // global
int nr_mallocs =  0; // global
string builtin__digit_pairs;
int builtin__init_capicity;
int builtin__init_cap;
u32 builtin__hash_mask;
u32 builtin__probe_inc;
u32 builtin__max_probe;
int builtin__mid_index;
int builtin__max_size;
int builtin__children_bytes;
array_int g_ustring_runes; // global
u64 hash_dot_wyhash__wyp0;
u64 hash_dot_wyhash__wyp1;
u64 hash_dot_wyhash__wyp2;
u64 hash_dot_wyhash__wyp3;
u64 hash_dot_wyhash__wyp4;
u64 strconv__DOUBLE_PLUS_ZERO;
u64 strconv__DOUBLE_MINUS_ZERO;
u64 strconv__DOUBLE_PLUS_INFINITY;
u64 strconv__DOUBLE_MINUS_INFINITY;
u32 strconv__TEN;
u64 strconv__max_u64;
int btree__mid_index;
int btree__min_length;
int btree__children_size;
string time__days_string;
array_int time__month_days;
string time__months_string;
i64 time__absolute_zero_year;
int time__seconds_per_hour;
int time__seconds_per_day;
int time__seconds_per_week;
int time__days_per_400_years;
int time__days_per_100_years;
int time__days_per_4_years;
array_int time__days_before;
#define time__time__FormatTime_hhmm12 0
#define time__time__FormatTime_hhmm24 1
#define time__time__FormatTime_hhmmss12 2
#define time__time__FormatTime_hhmmss24 3
#define time__time__FormatTime_no_time 4
#define time__time__FormatDate_ddmmyy 0
#define time__time__FormatDate_ddmmyyyy 1
#define time__time__FormatDate_mmddyy 2
#define time__time__FormatDate_mmddyyyy 3
#define time__time__FormatDate_mmmd 4
#define time__time__FormatDate_mmmdd 5
#define time__time__FormatDate_mmmddyyyy 6
#define time__time__FormatDate_no_date 7
#define time__time__FormatDate_yyyymmdd 8
#define time__time__FormatDelimiter_dot 0
#define time__time__FormatDelimiter_hyphen 1
#define time__time__FormatDelimiter_slash 2
#define time__time__FormatDelimiter_space 3
u64 math__uvnan;
u64 math__uvinf;
u64 math__uvneginf;
u64 math__uvone;
int math__mask;
int math__shift;
u64 math__sign_mask;
u64 math__frac_mask;
f32 math__log2_e;
f32 math__log10_e;
f32 math__max_f32;
f32 math__smallest_non_zero_f32;
f32 math__max_f64;
f32 math__smallest_non_zero_f64;
int math__min_i8;
int math__min_i16;
int math__min_i32;
u64 math__min_i64;
u32 math_dot_bits__de_bruijn32;
array_byte math_dot_bits__de_bruijn32tab;
u64 math_dot_bits__de_bruijn64;
array_byte math_dot_bits__de_bruijn64tab;
u64 math_dot_bits__m0;
u64 math_dot_bits__m1;
u64 math_dot_bits__m2;
u64 math_dot_bits__m3;
u64 math_dot_bits__m4;
u64 math_dot_bits__two32;
u64 math_dot_bits__mask32;
string math_dot_bits__overflow_error;
string math_dot_bits__divide_error;
array_byte math_dot_bits__ntz_8_tab;
array_byte math_dot_bits__pop_8_tab;
array_byte math_dot_bits__rev_8_tab;
array_byte math_dot_bits__len_8_tab;
u32 strconv_dot_ftoa__mantbits32;
u32 strconv_dot_ftoa__expbits32;
u32 strconv_dot_ftoa__bias32;
u32 strconv_dot_ftoa__mantbits64;
u32 strconv_dot_ftoa__expbits64;
u32 strconv_dot_ftoa__bias64;
array_u64 strconv_dot_ftoa__powers_of_10;
array_u64 strconv_dot_ftoa__pow5_split_32;
array_u64 strconv_dot_ftoa__pow5_inv_split_32;
array_strconv_dot_ftoa__Uint128 strconv_dot_ftoa__pow5_split_64;
array_strconv_dot_ftoa__Uint128 strconv_dot_ftoa__pow5_inv_split_64;
int hashmap__init_capicity;
int hashmap__init_cap;
u32 hashmap__hash_mask;
u32 hashmap__probe_inc;
u32 hashmap__max_probe;


 array new_array (int mylen, int cap, int elm_size) {
int cap_= (( cap == 0 ) ? ( 1 ) : ( cap )) ;
array arr= (array) { .len =  mylen , .cap =  cap_ , .element_size =  elm_size , .data =  vcalloc ( cap_ * elm_size ) } ;
return  arr ;
 }
 array make (int len, int cap, int elm_size) {
return  new_array ( len , cap , elm_size ) ;
 }
 array new_array_from_c_array (int len, int cap, int elm_size, void* c_array) {
int cap_= (( cap == 0 ) ? ( 1 ) : ( cap )) ;
array arr= (array) { .len =  len , .cap =  cap , .element_size =  elm_size , .data =  vcalloc ( cap_ * elm_size ) } ;
 memcpy ( arr .data ,  c_array ,  len * elm_size ) ;
return  arr ;
 }
 array new_array_from_c_array_no_alloc (int len, int cap, int elm_size, void* c_array) {
array arr= (array) { .len =  len , .cap =  cap , .element_size =  elm_size , .data =  c_array } ;
return  arr ;
 }
 void array_ensure_cap (array* a, int required) {
 if ( required <= a ->cap ) {
 
 return ;
 }
 ;
int cap= (( a ->cap == 0 ) ? ( 2 ) : ( a ->cap * 2 )) ;
 while ( required > cap ) {
 
 cap  *=  2 ;
 }
 ;
 if ( a ->cap == 0 ) {
 a ->data  =  vcalloc ( cap * a ->element_size ) ;
 }
  else { 
 a ->data  =  realloc ( a ->data ,  cap * a ->element_size ) ;
 }
 ;
 a ->cap  =  cap ;
 }
 array array_repeat (array a, int count) {
 if ( count < 0 ) {
 v_panic ( _STR("array.repeat: count is negative: %d", count) ) ;
 }
 ;
int size= count * a .len * a .element_size ;
 if ( size == 0 ) {
 size  =  a .element_size ;
 }
 ;
array arr= (array) { .len =  count * a .len , .cap =  count * a .len , .element_size =  a .element_size , .data =  vcalloc ( size ) } ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  count; tmp2++) {
 int i = tmp2;
 
 memcpy ((byte*) arr .data + i * a .len * a .element_size ,  a .data ,  a .len * a .element_size ) ;
 }
 ;
return  arr ;
 }
 void array_sort_with_compare (array* a, void* compare) {
 qsort ( a ->data ,  a ->len ,  a ->element_size ,  compare ) ;
 }
 void array_insert (array* a, int i, void* val) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( i < 0  ||  i > a ->len ) {
 v_panic ( _STR("array.insert: index out of range (i == %d, a.len == %d)", i, a ->len) ) ;
 }
 ;
 #endif
 ;
 array_ensure_cap ( a ,  a ->len + 1 ) ;
int size= a ->element_size ;
 memmove ((byte*) a ->data + ( i + 1 ) * size , (byte*) a ->data + i * size ,  ( a ->len - i ) * size ) ;
 memcpy ((byte*) a ->data + i * size ,  val ,  size ) ;
 a ->len ++ ;
 }
 void array_prepend (array* a, void* val) {
 array_insert ( a ,  0 , val ) ;
 }
 void v_array_delete (array* a, int i) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( i < 0  ||  i >= a ->len ) {
 v_panic ( _STR("array.delete: index out of range (i == %d, a.len == %d)", i, a ->len) ) ;
 }
 ;
 #endif
 ;
int size= a ->element_size ;
 memmove ((byte*) a ->data + i * size , (byte*) a ->data + ( i + 1 ) * size ,  ( a ->len - i ) * size ) ;
 a ->len -- ;
 }
 void array_clear (array* a) {
 a ->len  =  0 ;
 }
 void array_trim (array* a, int index) {
 if ( index < a ->len ) {
 a ->len  =  index ;
 }
 ;
 }
 void* array_get (array a, int i) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( i < 0  ||  i >= a .len ) {
 v_panic ( _STR("array.get: index out of range (i == %d, a.len == %d)", i, a .len) ) ;
 }
 ;
 #endif
 ;
return (byte*) a .data + i * a .element_size ;
 }
 void* array_first (array a) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( a .len == 0 ) {
 v_panic ( tos3("array.first: array is empty") ) ;
 }
 ;
 #endif
 ;
return (byte*) a .data + 0 ;
 }
 void* array_last (array a) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( a .len == 0 ) {
 v_panic ( tos3("array.last: array is empty") ) ;
 }
 ;
 #endif
 ;
return (byte*) a .data + ( a .len - 1 ) * a .element_size ;
 }
 array array_slice (array a, int start, int _end) {
int end= _end ;
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( start > end ) {
 v_panic ( _STR("array.slice: invalid slice index (%d > %d)", start, end) ) ;
 }
 ;
 if ( end > a .len ) {
 v_panic ( _STR("array.slice: slice bounds out of range (%d >= %d)", end, a .len) ) ;
 }
 ;
 if ( start < 0 ) {
 v_panic ( _STR("array.slice: slice bounds out of range (%d < 0)", start) ) ;
 }
 ;
 #endif
 ;
int l= end - start ;
array res= (array) { .element_size =  a .element_size , .data = (byte*) a .data + start * a .element_size , .len =  l , .cap =  l } ;
return  res ;
 }
 array array_slice2 (array a, int start, int _end, bool end_max) {
int end= (( end_max ) ? ( a .len ) : ( _end )) ;
return  array_slice ( a ,  start , end ) ;
 }
 array array_clone (array* a) {
int size= a ->cap * a ->element_size ;
 if ( size == 0 ) {
 size ++ ;
 }
 ;
array arr= (array) { .len =  a ->len , .cap =  a ->cap , .element_size =  a ->element_size , .data =  vcalloc ( size ) } ;
 memcpy ( arr .data ,  a ->data ,  a ->cap * a ->element_size ) ;
return  arr ;
 }
 array array_slice_clone (array* a, int start, int _end) {
int end= _end ;
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( start > end ) {
 v_panic ( _STR("array.slice: invalid slice index (%d > %d)", start, end) ) ;
 }
 ;
 if ( end > a ->len ) {
 v_panic ( _STR("array.slice: slice bounds out of range (%d >= %d)", end, a ->len) ) ;
 }
 ;
 if ( start < 0 ) {
 v_panic ( _STR("array.slice: slice bounds out of range (%d < 0)", start) ) ;
 }
 ;
 #endif
 ;
int l= end - start ;
array res= (array) { .element_size =  a ->element_size , .data = (byte*) a ->data + start * a ->element_size , .len =  l , .cap =  l } ;
return  array_clone (& /* ? */ res ) ;
 }
 void array_set (array* a, int i, void* val) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( i < 0  ||  i >= a ->len ) {
 v_panic ( _STR("array.set: index out of range (i == %d, a.len == %d)", i, a ->len) ) ;
 }
 ;
 #endif
 ;
 memcpy ((byte*) a ->data + a ->element_size * i ,  val ,  a ->element_size ) ;
 }
 void array_push (array* a, void* val) {
 array_ensure_cap ( a ,  a ->len + 1 ) ;
 memcpy ((byte*) a ->data + a ->element_size * a ->len ,  val ,  a ->element_size ) ;
 a ->len ++ ;
 }
 void array_push_many (array* a3, void* val, int size) {
 if ( a3 ->data == val ) {
array copy= array_clone (& /* ? */* a3 ) ;
 array_ensure_cap ( a3 ,  a3 ->len + size ) ;
 memcpy ((byte*) a3 ->data + a3 ->element_size * a3 ->len ,  copy .data ,  a3 ->element_size * size ) ;
 }
  else { 
 array_ensure_cap ( a3 ,  a3 ->len + size ) ;
 memcpy ((byte*) a3 ->data + a3 ->element_size * a3 ->len ,  val ,  a3 ->element_size * size ) ;
 }
 ;
 a3 ->len  +=  size ;
 }
 array array_reverse (array a) {
 if ( a .len < 2 ) {
return  a ;
 }
 ;
array arr= (array) { .len =  a .len , .cap =  a .cap , .element_size =  a .element_size , .data =  vcalloc ( a .cap * a .element_size ) } ;
 int tmp3 =  0;
 ;
for (int tmp4 = tmp3; tmp4 <  a .len; tmp4++) {
 int i = tmp4;
 
 memcpy ((byte*) arr .data + i * arr .element_size ,  & ( *(array*) array_get(  a , a .len - 1 - i) ) ,  arr .element_size ) ;
 }
 ;
return  arr ;
 }
 void v_array_free (array a) {
 free ( a .data ) ;
 }
 string array_string_str (array_string a) {
strings__Builder sb= strings__new_builder ( a .len * 3 ) ;
 strings__Builder_write (& /* ? */ sb ,  tos3("[") ) ;
 int tmp7 =  0;
 ;
for (int tmp8 = tmp7; tmp8 <  a .len; tmp8++) {
 int i = tmp8;
 
string val= ( *(string*) array_get(  a , i) ) ;
 strings__Builder_write (& /* ? */ sb ,  tos3("\"") ) ;
 strings__Builder_write (& /* ? */ sb ,  val ) ;
 strings__Builder_write (& /* ? */ sb ,  tos3("\"") ) ;
 if ( i < a .len - 1 ) {
 strings__Builder_write (& /* ? */ sb ,  tos3(", ") ) ;
 }
 ;
 }
 ;
 strings__Builder_write (& /* ? */ sb ,  tos3("]") ) ;
return  strings__Builder_str (& /* ? */ sb ) ;
 }
 string array_int_str (array_int a) {
strings__Builder sb= strings__new_builder ( a .len * 13 ) ;
 strings__Builder_write (& /* ? */ sb ,  tos3("[") ) ;
 int tmp11 =  0;
 ;
for (int tmp12 = tmp11; tmp12 <  a .len; tmp12++) {
 int i = tmp12;
 
 strings__Builder_write (& /* ? */ sb ,  int_str ( ( *(int*) array_get(  a , i) ) ) ) ;
 if ( i < a .len - 1 ) {
 strings__Builder_write (& /* ? */ sb ,  tos3(", ") ) ;
 }
 ;
 }
 ;
 strings__Builder_write (& /* ? */ sb ,  tos3("]") ) ;
return  strings__Builder_str (& /* ? */ sb ) ;
 }
 string array_bool_str (array_bool a) {
strings__Builder sb= strings__new_builder ( a .len * 3 ) ;
 strings__Builder_write (& /* ? */ sb ,  tos3("[") ) ;
 int tmp15 =  0;
 ;
for (int tmp16 = tmp15; tmp16 <  a .len; tmp16++) {
 int i = tmp16;
 
bool val= ( *(bool*) array_get(  a , i) ) ;
 if ( val ) {
 strings__Builder_write (& /* ? */ sb ,  tos3("true") ) ;
 }
  else { 
 strings__Builder_write (& /* ? */ sb ,  tos3("false") ) ;
 }
 ;
 if ( i < a .len - 1 ) {
 strings__Builder_write (& /* ? */ sb ,  tos3(", ") ) ;
 }
 ;
 }
 ;
 strings__Builder_write (& /* ? */ sb ,  tos3("]") ) ;
return  strings__Builder_str (& /* ? */ sb ) ;
 }
 string array_byte_hex (array_byte b) {
byte* hex= v_malloc ( b .len * 2 + 1 ) ;
int dst_i= 0 ;
 array_byte tmp19 =  b;
 for (int tmp20 = 0; tmp20 < tmp19.len; tmp20++) {
 byte i = ((byte *) tmp19 . data)[tmp20];
 
byte n0= i  >>  4 ;
 hex [/*ptr!*/ dst_i ++ ]/*rbyte 1*/  =  (( n0 < 10 ) ? ( n0 + '0' ) : ( n0 + 87 )) ;
byte n1= i & 0xF ;
 hex [/*ptr!*/ dst_i ++ ]/*rbyte 1*/  =  (( n1 < 10 ) ? ( n1 + '0' ) : ( n1 + 87 )) ;
 }
 ;
 hex [/*ptr!*/ dst_i ]/*rbyte 1*/  =  '\0' ;
return  tos ( hex , dst_i ) ;
 }
 int copy (array_byte dst, array_byte src) {
 if ( dst .len > 0  &&  src .len > 0 ) {
int min= 0 ;
 min  =  (( dst .len < src .len ) ? ( dst .len ) : ( src .len )) ;
 memcpy ( dst .data ,   array_slice2(  src , 0 , min , false)  .data ,  dst .element_size * min ) ;
return  min ;
 }
 ;
return  0 ;
 }
 int compare_ints (int* a, int* b) {
 if ( * a < * b ) {
return  - 1 ;
 }
 ;
 if ( * a > * b ) {
return  1 ;
 }
 ;
return  0 ;
 }
 void array_int_sort (array_int* a) {
 array_sort_with_compare ( a , & /*112 e="void*" g="fn (int*,int*) int" */ compare_ints ) ;
 }
 int array_string_index (array_string a, string v) {
 int tmp23 =  0;
 ;
for (int tmp24 = tmp23; tmp24 <  a .len; tmp24++) {
 int i = tmp24;
 
 if (string_eq( ( *(string*) array_get(  a , i) ) , v ) ) {
return  i ;
 }
 ;
 }
 ;
return  - 1 ;
 }
 int array_int_index (array_int a, int v) {
 int tmp27 =  0;
 ;
for (int tmp28 = tmp27; tmp28 <  a .len; tmp28++) {
 int i = tmp28;
 
 if ( ( *(int*) array_get(  a , i) ) == v ) {
return  i ;
 }
 ;
 }
 ;
return  - 1 ;
 }
 int array_byte_index (array_byte a, byte v) {
 int tmp31 =  0;
 ;
for (int tmp32 = tmp31; tmp32 <  a .len; tmp32++) {
 int i = tmp32;
 
 if ( ( *(byte*) array_get(  a , i) ) == v ) {
return  i ;
 }
 ;
 }
 ;
return  - 1 ;
 }
 int array_char_index (array_char a, char v) {
 int tmp35 =  0;
 ;
for (int tmp36 = tmp35; tmp36 <  a .len; tmp36++) {
 int i = tmp36;
 
 if ( ( *(char*) array_get(  a , i) ) == v ) {
return  i ;
 }
 ;
 }
 ;
return  - 1 ;
 }
 int array_int_reduce (array_int a, int (*iter)( int accum, int curr /*FFF*/ ), int accum_start) {
int _accum= accum_start ;
 array_int tmp39 =  a;
 for (int tmp40 = 0; tmp40 < tmp39.len; tmp40++) {
 int i = ((int *) tmp39 . data)[tmp40];
 
 _accum  =  iter ( _accum , i ) ;
 }
 ;
return  _accum ;
 }
 bool array_string_eq (array_string a1, array_string a2) {
 if ( a1 .len != a2 .len ) {
return  0 ;
 }
 ;
 int tmp41 =  0;
 ;
for (int tmp42 = tmp41; tmp42 <  a1 .len; tmp42++) {
 int i = tmp42;
 
 if (string_ne( ( *(string*) array_get(  a1 , i) ) , ( *(string*) array_get(  a2 , i) ) ) ) {
return  0 ;
 }
 ;
 }
 ;
return  1 ;
 }
 int compare_i64 (i64* a, i64* b) {
 if ( * a < * b ) {
return  - 1 ;
 }
 ;
 if ( * a > * b ) {
return  1 ;
 }
 ;
return  0 ;
 }
 int compare_f64 (f64* a, f64* b) {
 if (macro_f64_lt( * a , * b ) ) {
return  - 1 ;
 }
 ;
 if (macro_f64_gt( * a , * b ) ) {
return  1 ;
 }
 ;
return  0 ;
 }
 int compare_f32 (f32* a, f32* b) {
 if (macro_f32_lt( * a , * b ) ) {
return  - 1 ;
 }
 ;
 if (macro_f32_gt( * a , * b ) ) {
return  1 ;
 }
 ;
return  0 ;
 }
 array_voidptr array_pointers (array a) {
array_ptr_void res=new_array_from_c_array(0, 0, sizeof(void*), EMPTY_ARRAY_OF_ELEMS( void*, 0 ) {   TCCSKIP(0) }) ;
 int tmp47 =  0;
 ;
for (int tmp48 = tmp47; tmp48 <  a .len; tmp48++) {
 int i = tmp48;
 
_PUSH(& res , ( /*typ = array_ptr_void   tmp_typ=void**/(byte*) a .data + i * a .element_size ), tmp49, void*) ;
 }
 ;
return  res ;
 }
 void builtin__init () {
 #ifdef _WIN32
 #endif
 ;
 }
 void v_exit (int code) {
 exit ( code ) ;
 }
 bool isnil (void* v) {
return  v == 0 ;
 }
 void print_backtrace_skipping_top_frames (int skipframes) {
 #ifdef _WIN32
 #else
 if ( print_backtrace_skipping_top_frames_nix ( skipframes ) ) {
 
 return ;
 }
 ;
 #endif
 ;
 println ( tos3("print_backtrace_skipping_top_frames is not implemented on this platform for now...\n") ) ;
 }
 void print_backtrace () {
 print_backtrace_skipping_top_frames ( 2 ) ;
 }
 void panic_debug (int line_no, string file, string mod, string fn_name, string s) {
 println ( tos3("================ V panic ================") ) ;
printf( "   module: %.*s\n", mod.len, mod.str ) ;
printf( " function: %.*s()\n", fn_name.len, fn_name.str ) ;
printf( "     file: %.*s\n", file.len, file.str ) ;
 println (string_add( tos3("     line: ") , int_str ( line_no ) ) ) ;
printf( "  message: %.*s\n", s.len, s.str ) ;
 println ( tos3("=========================================") ) ;
 print_backtrace_skipping_top_frames ( 1 ) ;
 exit ( 1 ) ;
 }
 void v_panic (string s) {
printf( "V panic: %.*s\n", s.len, s.str ) ;
 print_backtrace ( ) ;
 exit ( 1 ) ;
 }
 void eprintln (string s) {
 if ( isnil ( s .str ) ) {
 v_panic ( tos3("eprintln(NIL)") ) ;
 }
 ;
 #ifndef _WIN32
 fflush ( stdout ) ;
 fflush ( stderr ) ;
 fprintf ( stderr ,  "%.*s\n" ,  s .len , (char*) s .str ) ;
 fflush ( stderr ) ;
 
 return ;
 #endif
 ;
 println ( s ) ;
 }
 void eprint (string s) {
 if ( isnil ( s .str ) ) {
 v_panic ( tos3("eprint(NIL)") ) ;
 }
 ;
 #ifndef _WIN32
 fflush ( stdout ) ;
 fflush ( stderr ) ;
 fprintf ( stderr ,  "%.*s" ,  s .len , (char*) s .str ) ;
 fflush ( stderr ) ;
 
 return ;
 #endif
 ;
 print ( s ) ;
 }
 void print (string s) {
 #ifdef _WIN32
 #else
 printf ( "%.*s" ,  s .len , (char*) s .str ) ;
 #endif
 ;
 }
 void looo () {
 }
 byte* v_malloc (int n) {
 if ( n <= 0 ) {
 v_panic ( tos3("malloc(<=0)") ) ;
 }
 ;
 #ifdef VPREALLOC
byte* res= g_m2_ptr ;
 g_m2_ptr  +=  n ;
 nr_mallocs ++ ;
return  res ;
 #else
byte* ptr= malloc ( n ) ;
 if ( ptr == 0 ) {
 v_panic ( _STR("malloc(%d) failed", n) ) ;
 }
 ;
return  ptr ;
 #endif
 ;
 }
 byte* v_calloc (int n) {
return  calloc ( n ,  1 ) ;
 }
 byte* vcalloc (int n) {
 if ( n <= 0 ) {
 v_panic ( tos3("calloc(<=0)") ) ;
 }
 ;
return  calloc ( n ,  1 ) ;
 }
 void v_free (void* ptr) {
 free ( ptr ) ;
 }
 void* memdup (void* src, int sz) {
byte* mem= v_malloc ( sz ) ;
return  memcpy ((char*) mem ,  src ,  sz ) ;
 }
 void v_ptr_free (void* ptr) {
 free ( ptr ) ;
 }
 int is_atty (int fd) {
 #ifdef _WIN32
 #else
return  isatty ( fd ) ;
 #endif
 ;
 }
 void println (string s) {
 printf ( "%.*s\n" ,  s .len , (char*) s .str ) ;
 }
 bool print_backtrace_skipping_top_frames_msvc (int skipframes) {
 println ( tos3("not implemented, see builtin_windows.v") ) ;
return  0 ;
 }
 bool print_backtrace_skipping_top_frames_mingw (int skipframes) {
 println ( tos3("not implemented, see builtin_windows.v") ) ;
return  0 ;
 }
 bool print_backtrace_skipping_top_frames_nix (int xskipframes) {
int skipframes= xskipframes + 2 ;
 #ifdef __APPLE__
 #endif
 ;
 #ifdef __linux__
return  print_backtrace_skipping_top_frames_linux ( skipframes ) ;
 #endif
 ;
 #ifdef __FreeBSD__
 #endif
 ;
return  0 ;
 }
 bool print_backtrace_skipping_top_frames_mac (int skipframes) {
 #ifdef __APPLE__
 #endif
 ;
return  1 ;
 }
 bool print_backtrace_skipping_top_frames_freebsd (int skipframes) {
 #ifdef __FreeBSD__
 #endif
 ;
return  1 ;
 }
 bool print_backtrace_skipping_top_frames_linux (int skipframes) {
 #ifdef __TINYC__
printf( "TODO: print_backtrace_skipping_top_frames_linux %d with tcc fails tests with \"stack smashing detected\" .\n", skipframes ) ;
return  0 ;
 #endif
 ;
 #ifndef __ANDROID__
 #ifdef __GLIBC__
byte* buffer  [100 ] ;
int nr_ptrs= backtrace ( buffer ,  100 ) ;
int nr_actual_frames= nr_ptrs - skipframes ;
array_string sframes=new_array_from_c_array(0, 0, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 0 ) {   TCCSKIP(0) }) ;
byteptr* csymbols= backtrace_symbols ( & buffer [ skipframes ]/*rbyte* 0*/ ,  nr_actual_frames ) ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  nr_actual_frames; tmp2++) {
 int i = tmp2;
 
_PUSH(& sframes , ( /*typ = array_string   tmp_typ=string*/ tos2 ( csymbols [/*ptr!*/ i ]/*rbyteptr 0*/ ) ), tmp3, string) ;
 }
 ;
 array_string tmp4 =  sframes;
 for (int tmp5 = 0; tmp5 < tmp4.len; tmp5++) {
 string sframe = ((string *) tmp4 . data)[tmp5];
 
string executable= string_all_before ( sframe ,  tos3("(") ) ;
string addr= string_all_before ( string_all_after ( sframe ,  tos3("[") ) ,  tos3("]") ) ;
string beforeaddr= string_all_before ( sframe ,  tos3("[") ) ;
string cmd= _STR("addr2line -e %.*s %.*s", executable.len, executable.str, addr.len, addr.str) ;
void* f= popen ((char*) cmd .str ,  "r" ) ;
 if ( isnil ( f ) ) {
 println ( sframe ) ;
 continue
 ;
 }
 ;
byte buf  [1000 ] = { 0 } ;
string output= tos3("") ;
 while ( fgets ( ((charptr)( buf ) ) ,  1000 ,  f ) != 0 ) {
 
 output = string_add( output,  tos ( buf , vstrlen ( buf ) ) ) ;
 }
 ;
 output  = string_add( string_trim_space ( output ) , tos3(":") ) ;
 if ( pclose ( f ) != 0 ) {
 println ( sframe ) ;
 continue
 ;
 }
 ;
 if ( (string_eq( output ,  tos3("??:0:") )  || string_eq( output,  tos3("??:?:") ) ) ) {
 output  =  tos3("") ;
 }
 ;
 output  =  string_replace ( output ,  tos3(" (discriminator") , tos3(": (d.") ) ;
printf( "%-46s | %14s | %.*s\n", output.str, addr.str, beforeaddr.len, beforeaddr.str ) ;
 }
 ;
return  1 ;
 #else
 println ( tos3("backtrace_symbols_fd is missing, so printing backtraces is not available.\n") ) ;
 println ( tos3("Some libc implementations like musl simply do not provide it.") ) ;
 #endif
 ;
 #endif
 ;
return  0 ;
 }
 int backtrace (void* a, int b);
 byteptr* backtrace_symbols (void* , int );
 void backtrace_symbols_fd (void* , int , int );
 int proc_pidpath (int , void* , int );
 static inline string f64_str (f64 d) {
return  strconv_dot_ftoa__ftoa_64 ( d ) ;
 }
 static inline string f64_strsci (f64 x, int digit_num) {
int n_digit= digit_num ;
 if ( n_digit < 1 ) {
 n_digit  =  1 ;
 }
  else  if ( n_digit > 17 ) {
 n_digit  =  17 ;
 }
 ;
return  strconv_dot_ftoa__f64_to_str ( x , n_digit ) ;
 }
 static inline string f64_strlong (f64 x) {
return  strconv_dot_ftoa__f64_to_str_l ( x ) ;
 }
 static inline string f32_str (f32 d) {
return  strconv_dot_ftoa__ftoa_32 ( d ) ;
 }
 static inline string f32_strsci (f32 x, int digit_num) {
int n_digit= digit_num ;
 if ( n_digit < 1 ) {
 n_digit  =  1 ;
 }
  else  if ( n_digit > 8 ) {
 n_digit  =  8 ;
 }
 ;
return  strconv_dot_ftoa__f32_to_str ( x , n_digit ) ;
 }
 static inline string f32_strlong (f32 x) {
return  strconv_dot_ftoa__f32_to_str_l ( x ) ;
 }
 static inline f32 f32_abs (f32 a) {
return  (( a < 0 ) ? ( - a ) : ( a )) ;
 }
 static inline f64 f64_abs (f64 a) {
return  (( a < 0 ) ? ( - a ) : ( a )) ;
 }
 static inline bool f64_eq (f64 a, f64 b) {
return  f64_abs ( a - b ) <= DBL_EPSILON ;
 }
 static inline bool f32_eq (f32 a, f32 b) {
return  f32_abs ( a - b ) <= FLT_EPSILON ;
 }
 bool f64_eqbit (f64 a, f64 b) {
return  DEFAULT_EQUAL ( a ,  b ) ;
 }
 bool f32_eqbit (f32 a, f32 b) {
return  DEFAULT_EQUAL ( a ,  b ) ;
 }
 bool f64_ne (f64 a, f64 b) {
return  ! f64_eq ( a ,  b ) ;
 }
 bool f32_ne (f32 a, f32 b) {
return  ! f32_eq ( a ,  b ) ;
 }
 bool f64_nebit (f64 a, f64 b) {
return  DEFAULT_NOT_EQUAL ( a ,  b ) ;
 }
 bool f32_nebit (f32 a, f32 b) {
return  DEFAULT_NOT_EQUAL ( a ,  b ) ;
 }
 bool f64_lt (f64 a, f64 b) {
return  f64_ne ( a ,  b )  &&  f64_ltbit ( a ,  b ) ;
 }
 bool f32_lt (f32 a, f32 b) {
return  f32_ne ( a ,  b )  &&  f32_ltbit ( a ,  b ) ;
 }
 bool f64_ltbit (f64 a, f64 b) {
return  DEFAULT_LT ( a ,  b ) ;
 }
 bool f32_ltbit (f32 a, f32 b) {
return  DEFAULT_LT ( a ,  b ) ;
 }
 bool f64_le (f64 a, f64 b) {
return  ! f64_gt ( a ,  b ) ;
 }
 bool f32_le (f32 a, f32 b) {
return  ! f32_gt ( a ,  b ) ;
 }
 bool f64_lebit (f64 a, f64 b) {
return  DEFAULT_LE ( a ,  b ) ;
 }
 bool f32_lebit (f32 a, f32 b) {
return  DEFAULT_LE ( a ,  b ) ;
 }
 bool f64_gt (f64 a, f64 b) {
return  f64_ne ( a ,  b )  &&  f64_gtbit ( a ,  b ) ;
 }
 bool f32_gt (f32 a, f32 b) {
return  f32_ne ( a ,  b )  &&  f32_gtbit ( a ,  b ) ;
 }
 bool f64_gtbit (f64 a, f64 b) {
return  DEFAULT_GT ( a ,  b ) ;
 }
 bool f32_gtbit (f32 a, f32 b) {
return  DEFAULT_GT ( a ,  b ) ;
 }
 bool f64_ge (f64 a, f64 b) {
return  ! f64_lt ( a ,  b ) ;
 }
 bool f32_ge (f32 a, f32 b) {
return  ! f32_lt ( a ,  b ) ;
 }
 bool f64_gebit (f64 a, f64 b) {
return  DEFAULT_GE ( a ,  b ) ;
 }
 bool f32_gebit (f32 a, f32 b) {
return  DEFAULT_GE ( a ,  b ) ;
 }
 string ptr_str (void* ptr) {
string buf1= u64_hex ( ((u64)( ptr ) ) ) ;
return  buf1 ;
 }
 static inline string int_str_l (int nn, int max) {
int n= nn ;
int d= 0 ;
 if ( n == 0 ) {
return  tos3("0") ;
 }
 ;
byte* buf= v_malloc ( max + 1 ) ;
bool is_neg= 0 ;
 if ( n < 0 ) {
 n  =  - n ;
 is_neg  =  1 ;
 }
 ;
int index= max ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  '\0' ;
 while ( n > 0 ) {
 
int n1= n / 100 ;
 d  =  ( ( n - ( n1 * 100 ) )  <<  1 ) ;
 n  =  n1 ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ++ ]/*rbyte 0*/ ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ]/*rbyte 0*/ ;
 }
 ;
 index ++ ;
 if ( d < 20 ) {
 index ++ ;
 }
 ;
 if ( is_neg ) {
 index -- ;
 buf [/*ptr!*/ index ]/*rbyte 1*/  =  '-' ;
 }
 ;
return  tos ((byte*) buf + index , ( max - index ) ) ;
 }
 string i8_str (i8 n) {
return  int_str_l ( ((int)( n ) ) ,  5 ) ;
 }
 string i16_str (i16 n) {
return  int_str_l ( ((int)( n ) ) ,  7 ) ;
 }
 string u16_str (u16 n) {
return  int_str_l ( ((int)( n ) ) ,  7 ) ;
 }
 string int_str (int n) {
return  int_str_l ( n ,  12 ) ;
 }
 string u32_str (u32 nn) {
u32 n= nn ;
u32 d= ((u32)( 0 ) ) ;
 if ( n == 0 ) {
return  tos3("0") ;
 }
 ;
int max= 12 ;
byte* buf= v_malloc ( max + 1 ) ;
int index= max ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  '\0' ;
 while ( n > 0 ) {
 
u32 n1= n / ((u32)( 100 ) ) ;
 d  =  ( ( n - ( n1 * ((u32)( 100 ) ) ) )  <<  ((u32)( 1 ) ) ) ;
 n  =  n1 ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ++ ]/*rbyte 0*/ ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ]/*rbyte 0*/ ;
 }
 ;
 index ++ ;
 if ( d < ((u32)( 20 ) ) ) {
 index ++ ;
 }
 ;
return  tos ((byte*) buf + index , ( max - index ) ) ;
 }
 string i64_str (i64 nn) {
i64 n= nn ;
i64 d= ((i64)( 0 ) ) ;
 if ( n == 0 ) {
return  tos3("0") ;
 }
 ;
int max= 20 ;
byte* buf= vcalloc ( max + 1 ) ;
bool is_neg= 0 ;
 if ( n < 0 ) {
 n  =  - n ;
 is_neg  =  1 ;
 }
 ;
int index= max ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  '\0' ;
 while ( n > 0 ) {
 
i64 n1= n / ((i64)( 100 ) ) ;
 d  =  ( ( n - ( n1 * ((i64)( 100 ) ) ) )  <<  ((i64)( 1 ) ) ) ;
 n  =  n1 ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ++ ]/*rbyte 0*/ ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ]/*rbyte 0*/ ;
 }
 ;
 index ++ ;
 if ( d < ((i64)( 20 ) ) ) {
 index ++ ;
 }
 ;
 if ( is_neg ) {
 index -- ;
 buf [/*ptr!*/ index ]/*rbyte 1*/  =  '-' ;
 }
 ;
return  tos ((byte*) buf + index , ( max - index ) ) ;
 }
 string u64_str (u64 nn) {
u64 n= nn ;
int d= 0 ;
 if ( n == 0 ) {
return  tos3("0") ;
 }
 ;
int max= 20 ;
byte* buf= vcalloc ( max + 1 ) ;
int index= max ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  '\0' ;
 while ( n > 0 ) {
 
u64 n1= n / 100 ;
 d  =  ( ( n - ( n1 * 100 ) )  <<  1 ) ;
 n  =  n1 ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ++ ]/*rbyte 0*/ ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  builtin__digit_pairs .str[ d ]/*rbyte 0*/ ;
 }
 ;
 index ++ ;
 if ( d < 20 ) {
 index ++ ;
 }
 ;
return  tos ((byte*) buf + index , ( max - index ) ) ;
 }
 string bool_str (bool b) {
 if ( b ) {
return  tos3("true") ;
 }
 ;
return  tos3("false") ;
 }
 string int_hex (int nn) {
u32 n= ((u32)( nn ) ) ;
int max= 10 ;
byte* buf= v_malloc ( max + 1 ) ;
int index= max ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  '\0' ;
 while ( n > 0 ) {
 
u32 d= n & 0xF ;
 n  =  n  >>  4 ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  (( d < 10 ) ? ( d + '0' ) : ( d + 87 )) ;
 }
 ;
 index ++ ;
return  tos ((byte*) buf + index , ( max - index ) ) ;
 }
 string u64_hex (u64 nn) {
u64 n= nn ;
int max= 18 ;
byte* buf= v_malloc ( max + 1 ) ;
int index= max ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  '\0' ;
 while ( n > 0 ) {
 
u64 d= n & 0xF ;
 n  =  n  >>  4 ;
 buf [/*ptr!*/ index -- ]/*rbyte 1*/  =  (( d < 10 ) ? ( d + '0' ) : ( d + 87 )) ;
 }
 ;
 index ++ ;
return  tos ((byte*) buf + index , ( max - index ) ) ;
 }
 string i64_hex (i64 nn) {
u64 n= ((u64)( nn ) ) ;
return  u64_hex ( n ) ;
 }
 bool array_byte_contains (array_byte a, byte val) {
 array_byte tmp1 =  a;
 for (int tmp2 = 0; tmp2 < tmp1.len; tmp2++) {
 byte aa = ((byte *) tmp1 . data)[tmp2];
 
 if ( aa == val ) {
return  1 ;
 }
 ;
 }
 ;
return  0 ;
 }
 string rune_str (rune c) {
int fst_byte= ((int)( c ) )  >>  8 * 3 & 0xff ;
int len= utf8_char_len ( fst_byte ) ;
string str= (string) { .len =  len , .str =  v_malloc ( len + 1 ) } ;
 int tmp3 =  0;
 ;
for (int tmp4 = tmp3; tmp4 <  len; tmp4++) {
 int i = tmp4;
 
 str .str [/*ptr!*/ i ]/*rbyte 1*/  =  ((int)( c ) )  >>  8 * ( 3 - i ) & 0xff ;
 }
 ;
 str .str [/*ptr!*/ len ]/*rbyte 1*/  =  '\0' ;
return  str ;
 }
 string byte_str (byte c) {
string str= (string) { .len =  1 , .str =  v_malloc ( 2 ) } ;
 str .str [/*ptr!*/ 0 ]/*rbyte 1*/  =  c ;
 str .str [/*ptr!*/ 1 ]/*rbyte 1*/  =  '\0' ;
return  str ;
 }
 bool byte_is_capital (byte c) {
return  c >= 'A'  &&  c <= 'Z' ;
 }
 array_byte array_byte_clone (array_byte b) {
array_byte res= array_repeat (new_array_from_c_array(1, 1, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 1 ) {  ((byte)( 0 ) )  }) ,  b .len ) ;
 int tmp5 =  0;
 ;
for (int tmp6 = tmp5; tmp6 <  b .len; tmp6++) {
 int i = tmp6;
 
array_set(&/*q*/ res , i , & (byte []) {  ( *(byte*) array_get(  b , i) ) }) ;
 }
 ;
return  res ;
 }
 static inline DenseArray new_dense_array () {
 {
return  (DenseArray) { .data =  ((KeyValue*)( v_malloc ( 8 * sizeof( KeyValue) ) ) ) , .cap =  8 , .size =  0 } ;
 }
 ;
 }
 static inline u32 DenseArray_push (DenseArray* d, KeyValue kv) {
 if ( d ->cap == d ->size ) {
 d ->cap  +=  d ->cap  >>  3 ;
 d ->data  =  ((KeyValue*)( realloc ( d ->data ,  sizeof( KeyValue) * d ->cap ) ) ) ;
 }
 ;
u32 push_index= d ->size ;
 d ->data [/*ptr!*/ push_index ]/*rKeyValue 1*/  =  kv ;
 d ->size ++ ;
return  push_index ;
 }
 void DenseArray_zeros_to_end (DenseArray* d) {
u32 count= ((u32)( 0 ) ) ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  d ->size; tmp2++) {
 int i = tmp2;
 
 if ( d ->data [/*ptr!*/ i ]/*rKeyValue 1*/ .key .str != 0 ) {
KeyValue tmp= d ->data [/*ptr!*/ count ]/*rKeyValue 1*/ ;
 d ->data [/*ptr!*/ count ]/*rKeyValue 1*/  =  d ->data [/*ptr!*/ i ]/*rKeyValue 1*/ ;
 d ->data [/*ptr!*/ i ]/*rKeyValue 1*/  =  tmp ;
 count ++ ;
 }
 ;
 }
 ;
 d ->size  =  count ;
 d ->cap  =  (( count < 8 ) ? ( 8 ) : ( count )) ;
 d ->data  =  ((KeyValue*)( realloc ( d ->data ,  sizeof( KeyValue) * d ->cap ) ) ) ;
 }
 map new_map (int n, int value_bytes) {
return  (map) { .value_bytes =  value_bytes , .cap =  builtin__init_cap , .window =  builtin__cached_hashbits , .shift =  builtin__init_log_capicity , .key_values =  new_dense_array ( ) , .metas =  ((u32*)( vcalloc ( sizeof( u32) * ( builtin__init_capicity + builtin__extra_metas_inc ) ) ) ) , .max_load_factor =  builtin__init_max_load_factor , .extra_metas =  builtin__extra_metas_inc , .size =  0 } ;
 }
 map new_map_init (int n, int value_bytes, string* keys, void* values) {
map out= new_map ( n , value_bytes ) ;
 int tmp3 =  0;
 ;
for (int tmp4 = tmp3; tmp4 <  n; tmp4++) {
 int i = tmp4;
 
 map_set (& /* ? */ out ,  keys [/*ptr!*/ i ]/*rstring 0*/ ,(byte*) values + i * value_bytes ) ;
 }
 ;
return  out ;
 }
 void map_set (map* m, string key, void* value) {
 if (macro_f32_gt( ( ((f32)( m ->size  <<  1 ) ) / ((f32)( m ->cap ) ) ) , m ->max_load_factor ) ) {
 map_expand ( m ) ;
 }
 ;
u64 hash= hash_dot_wyhash__wyhash_c ( key .str , ((u64)( key .len ) ) , 0 ) ;
u32 meta= ((u32)( ( ( hash  >>  m ->shift ) & builtin__hash_mask ) | builtin__probe_inc ) ) ;
u64 index= hash & m ->cap ;
 while ( meta < m ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
 while ( meta == m ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
u32 kv_index= m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 if (string_eq( key , m ->key_values .data [/*ptr!*/ kv_index ]/*rKeyValue 1*/ .key ) ) {
 memcpy ( m ->key_values .data [/*ptr!*/ kv_index ]/*rKeyValue 1*/ .value ,  value ,  m ->value_bytes ) ;
 
 return ;
 }
 ;
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
KeyValue kv= (KeyValue) { .key =  key , .value =  v_malloc ( m ->value_bytes ) } ;
 memcpy ( kv .value ,  value ,  m ->value_bytes ) ;
u32 kv_index= DenseArray_push (& /* ? */ m ->key_values ,  kv ) ;
 while ( m ->metas [/*ptr!*/ index ]/*ru32 1*/ != 0 ) {
 
 if ( meta > m ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
u32 tmp_meta= m ->metas [/*ptr!*/ index ]/*ru32 1*/ ;
 m ->metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 meta  =  tmp_meta ;
u32 tmp_index= m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 kv_index  =  tmp_index ;
 }
 ;
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
u32 probe_count= ( meta  >>  builtin__hashbits ) - 1 ;
 if ( ( probe_count  <<  1 ) == m ->extra_metas ) {
 if ( ( meta & builtin__max_probe ) == builtin__max_probe ) {
 map_expand ( m ) ;
 map_set ( m ,  kv .key , kv .value ) ;
 
 return ;
 }
 ;
 m ->extra_metas  +=  builtin__extra_metas_inc ;
u32 mem_size= ( m ->cap + 2 + m ->extra_metas ) ;
 m ->metas  =  ((u32*)( realloc ( m ->metas ,  sizeof( u32) * mem_size ) ) ) ;
 memset ((u32*)(u32*) m ->metas + mem_size - builtin__extra_metas_inc ,  0 ,  sizeof( u32) * builtin__extra_metas_inc ) ;
 }
 ;
 m ->metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 m ->size ++ ;
 }
 void map_expand (map* m) {
u32 old_cap= m ->cap ;
 m ->cap  =  ( ( m ->cap + 2 )  <<  1 ) - 2 ;
 if ( m ->window == 0 ) {
 m ->shift  +=  builtin__cached_hashbits ;
 map_rehash ( m ) ;
 m ->window  =  builtin__cached_hashbits ;
 }
  else { 
 map_cached_rehash ( m ,  old_cap ) ;
 }
 ;
 m ->window -- ;
 }
 void map_shrink (map* m) {
 DenseArray_zeros_to_end (& /* ? */ m ->key_values ) ;
 m ->cap  =  ( ( m ->cap + 2 )  >>  1 ) - 2 ;
 if ( m ->window == 16 ) {
 m ->shift  -=  builtin__cached_hashbits ;
 m ->window  =  0 ;
 }
 ;
 map_rehash ( m ) ;
 m ->window ++ ;
 }
 void map_rehash (map* m) {
int meta_bytes= sizeof( u32) * ( m ->cap + 2 + m ->extra_metas ) ;
 m ->metas  =  ((u32*)( realloc ( m ->metas ,  meta_bytes ) ) ) ;
 memset ( m ->metas ,  0 ,  meta_bytes ) ;
 for (
u32 i= ((u32)( 0 ) )  ;  i < m ->key_values .size  ;  i ++ ) { 
 
 if ( m ->key_values .data [/*ptr!*/ i ]/*rKeyValue 1*/ .key .str == 0 ) {
 continue
 ;
 }
 ;
KeyValue kv= m ->key_values .data [/*ptr!*/ i ]/*rKeyValue 1*/ ;
u64 hash= hash_dot_wyhash__wyhash_c ( kv .key .str , ((u64)( kv .key .len ) ) , 0 ) ;
u32 meta= ((u32)( ( ( hash  >>  m ->shift ) & builtin__hash_mask ) | builtin__probe_inc ) ) ;
u64 index= hash & m ->cap ;
 while ( meta < m ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
u32 kv_index= i ;
 while ( m ->metas [/*ptr!*/ index ]/*ru32 1*/ != 0 ) {
 
 if ( meta > m ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
u32 tmp_meta= m ->metas [/*ptr!*/ index ]/*ru32 1*/ ;
 m ->metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 meta  =  tmp_meta ;
u32 tmp_index= m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 kv_index  =  tmp_index ;
 }
 ;
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
u32 probe_count= ( meta  >>  builtin__hashbits ) - 1 ;
 if ( ( probe_count  <<  1 ) == m ->extra_metas ) {
 if ( ( meta & builtin__max_probe ) == builtin__max_probe ) {
 map_expand ( m ) ;
 
 return ;
 }
 ;
 m ->extra_metas  +=  builtin__extra_metas_inc ;
u32 mem_size= ( m ->cap + 2 + m ->extra_metas ) ;
 m ->metas  =  ((u32*)( realloc ( m ->metas ,  sizeof( u32) * mem_size ) ) ) ;
 memset ((u32*)(u32*) m ->metas + mem_size - builtin__extra_metas_inc ,  0 ,  sizeof( u32) * builtin__extra_metas_inc ) ;
 }
 ;
 m ->metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 }
 ;
 }
 void map_cached_rehash (map* m, u32 old_cap) {
u32* new_meta= ((u32*)( vcalloc ( sizeof( u32) * ( m ->cap + 2 + m ->extra_metas ) ) ) ) ;
u32 old_extra_metas= m ->extra_metas ;
 for (
int i= 0  ;  i <= old_cap + old_extra_metas  ;  i  +=  2 ) { 
 
 if ( m ->metas [/*ptr!*/ i ]/*ru32 1*/ == 0 ) {
 continue
 ;
 }
 ;
u32 old_meta= m ->metas [/*ptr!*/ i ]/*ru32 1*/ ;
u64 old_probe_count= ((u64)( ( old_meta  >>  builtin__hashbits ) - 1 ) )  <<  1 ;
int old_index= ( i - old_probe_count ) & ( m ->cap  >>  1 ) ;
u64 index= ((u64)( old_index ) ) | ( old_meta  <<  m ->shift ) & m ->cap ;
u32 meta= ( old_meta & builtin__hash_mask ) | builtin__probe_inc ;
 while ( meta < new_meta [/*ptr!*/ index ]/*ru32 1*/ ) {
 
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
u32 kv_index= m ->metas [/*ptr!*/ i + 1 ]/*ru32 1*/ ;
 while ( new_meta [/*ptr!*/ index ]/*ru32 1*/ != 0 ) {
 
 if ( meta > new_meta [/*ptr!*/ index ]/*ru32 1*/ ) {
u32 tmp_meta= new_meta [/*ptr!*/ index ]/*ru32 1*/ ;
 new_meta [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 meta  =  tmp_meta ;
u32 tmp_index= new_meta [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 new_meta [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 kv_index  =  tmp_index ;
 }
 ;
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
u32 probe_count= ( meta  >>  builtin__hashbits ) - 1 ;
 if ( ( probe_count  <<  1 ) == m ->extra_metas ) {
 if ( ( meta & builtin__max_probe ) == builtin__max_probe ) {
 v_free ( new_meta ) ;
 map_expand ( m ) ;
 
 return ;
 }
 ;
 m ->extra_metas  +=  builtin__extra_metas_inc ;
u32 mem_size= ( m ->cap + 2 + m ->extra_metas ) ;
 new_meta  =  ((u32*)( realloc ( new_meta ,  sizeof( u32) * mem_size ) ) ) ;
 memset ((u32*)(u32*) new_meta + mem_size - builtin__extra_metas_inc ,  0 ,  sizeof( u32) * builtin__extra_metas_inc ) ;
 }
 ;
 new_meta [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 new_meta [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 }
 ;
 {
 v_free ( m ->metas ) ;
 }
 ;
 m ->metas  =  new_meta ;
 }
 static inline bool map_get (map m, string key, void* out) {
u64 hash= hash_dot_wyhash__wyhash_c ( key .str , ((u64)( key .len ) ) , 0 ) ;
u64 index= hash & m .cap ;
u32 meta= ((u32)( ( ( hash  >>  m .shift ) & builtin__hash_mask ) | builtin__probe_inc ) ) ;
 while ( meta < m .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
 while ( meta == m .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
u32 kv_index= m .metas [/*ptr!*/ index + 1 ]/*ru32 0*/ ;
 if (string_eq( key , m .key_values .data [/*ptr!*/ kv_index ]/*rKeyValue 0*/ .key ) ) {
 memcpy ( out ,  m .key_values .data [/*ptr!*/ kv_index ]/*rKeyValue 0*/ .value ,  m .value_bytes ) ;
return  1 ;
 }
 ;
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
return  0 ;
 }
 static inline bool map_exists (map m, string key) {
 if ( m .value_bytes == 0 ) {
return  0 ;
 }
 ;
u64 hash= hash_dot_wyhash__wyhash_c ( key .str , ((u64)( key .len ) ) , 0 ) ;
u64 index= hash & m .cap ;
u32 meta= ((u32)( ( ( hash  >>  m .shift ) & builtin__hash_mask ) | builtin__probe_inc ) ) ;
 while ( meta < m .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
 while ( meta == m .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
u32 kv_index= m .metas [/*ptr!*/ index + 1 ]/*ru32 0*/ ;
 if (string_eq( key , m .key_values .data [/*ptr!*/ kv_index ]/*rKeyValue 0*/ .key ) ) {
return  1 ;
 }
 ;
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
return  0 ;
 }
 void v_map_delete (map* m, string key) {
u64 hash= hash_dot_wyhash__wyhash_c ( key .str , ((u64)( key .len ) ) , 0 ) ;
u64 index= hash & m ->cap ;
u32 meta= ((u32)( ( ( hash  >>  m ->shift ) & builtin__hash_mask ) | builtin__probe_inc ) ) ;
 while ( meta < m ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
 while ( meta == m ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
u32 kv_index= m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 if (string_eq( key , m ->key_values .data [/*ptr!*/ kv_index ]/*rKeyValue 1*/ .key ) ) {
 memset ( & m ->key_values .data [/*ptr!*/ kv_index ]/*rKeyValue 1*/ ,  0 ,  sizeof( KeyValue) ) ;
u64 old_index= index ;
 index  +=  2 ;
u32 cur_meta= m ->metas [/*ptr!*/ index ]/*ru32 1*/ ;
u32 cur_index= m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 while ( ( cur_meta  >>  builtin__hashbits ) > 1 ) {
 
 m ->metas [/*ptr!*/ old_index ]/*ru32 1*/  =  cur_meta - builtin__probe_inc ;
 m ->metas [/*ptr!*/ old_index + 1 ]/*ru32 1*/  =  cur_index ;
 old_index  =  index ;
 index  +=  2 ;
 cur_meta  =  m ->metas [/*ptr!*/ index ]/*ru32 1*/ ;
 cur_index  =  m ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 }
 ;
 m ->metas [/*ptr!*/ old_index ]/*ru32 1*/  =  0 ;
 m ->size -- ;
 if ( m ->cap == 30 ) {
 
 return ;
 }
 ;
 if (macro_f32_lt( ( ((f32)( m ->size  <<  1 ) ) / ((f32)( m ->cap ) ) ) , builtin__min_load_factor ) ) {
 map_shrink ( m ) ;
 }
 ;
 
 return ;
 }
 ;
 index  +=  2 ;
 meta  +=  builtin__probe_inc ;
 }
 ;
 }
 array_string map_keys (map* m) {
array_string keys= array_repeat (new_array_from_c_array(1, 1, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 1 ) {  tos3("")  }) ,  m ->size ) ;
 if ( m ->value_bytes == 0 ) {
return  keys ;
 }
 ;
int j= 0 ;
 for (
u32 i= ((u32)( 0 ) )  ;  i < m ->key_values .size  ;  i ++ ) { 
 
 if ( m ->key_values .data [/*ptr!*/ i ]/*rKeyValue 0*/ .key .str == 0 ) {
 continue
 ;
 }
 ;
array_set(&/*q*/ keys , j , & (string []) {  m ->key_values .data [/*ptr!*/ i ]/*rKeyValue 0*/ .key }) ;
 j ++ ;
 }
 ;
return  keys ;
 }
 void v_map_free (map m) {
 {
 v_free ( m .metas ) ;
 v_free ( m .key_values .data ) ;
 }
 ;
 }
 void map_print (map m) {
 println ( tos3("TODO") ) ;
 }
 string map_string_str (map_string m) {
 if ( m .size == 0 ) {
return  tos3("{}") ;
 }
 ;
strings__Builder sb= strings__new_builder ( 50 ) ;
 strings__Builder_writeln (& /* ? */ sb ,  tos3("{") ) ;
 map_string tmp5 =  m;
 array_string keys_tmp5 = map_keys(& tmp5 ); 
 for (int l = 0; l < keys_tmp5 .len; l++) {
 string key = ((string*)keys_tmp5 .data)[l];
 string val = tos3(""); map_get(tmp5, key, & val);
 
 strings__Builder_writeln (& /* ? */ sb ,  _STR("  \"%.*s\" => \"%.*s\"", key.len, key.str, val.len, val.str) ) ;
 }
 ;
 strings__Builder_writeln (& /* ? */ sb ,  tos3("}") ) ;
return  strings__Builder_str (& /* ? */ sb ) ;
 }
 Option opt_ok (void* data, int size) {
 if ( size >= 300 ) {
 v_panic ( _STR("option size too big: %d (max is 300), this is a temporary limit", size) ) ;
 }
 ;
Option res= (Option) { .ok =  1 , .error =  tos3("") , .ecode =  0 , .is_none =  0 } ;
 memcpy ( res .data ,  data ,  size ) ;
return  res ;
 }
 Option opt_none () {
return  (Option) { .is_none =  1 , .error =  tos3("") , .ecode =  0 , .ok =  0 , } ;
 }
 Option v_error (string s) {
return  (Option) { .error =  s , .ecode =  0 , .ok =  0 , .is_none =  0 } ;
 }
 Option error_with_code (string s, int code) {
return  (Option) { .error =  s , .ecode =  code , .ok =  0 , .is_none =  0 } ;
 }
 SortedMap new_sorted_map (int n, int value_bytes) {
return  (SortedMap) { .value_bytes =  value_bytes , .root =  new_node ( ) , .size =  0 } ;
 }
 SortedMap new_sorted_map_init (int n, int value_bytes, string* keys, void* values) {
SortedMap out= new_sorted_map ( n , value_bytes ) ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  n; tmp2++) {
 int i = tmp2;
 
 SortedMap_set (& /* ? */ out ,  keys [/*ptr!*/ i ]/*rstring 0*/ ,(byte*) values + i * value_bytes ) ;
 }
 ;
return  out ;
 }
 mapnode* new_node () {
return  (mapnode*)memdup(&(mapnode) { .children =  0 , .size =  0 , } , sizeof(mapnode)) ;
 }
 void SortedMap_set (SortedMap* m, string key, void* value) {
mapnode* node= m ->root ;
int child_index= 0 ;
mapnode* parent= ((mapnode*)( 0 ) ) ;
 while (1) { 
 if ( node ->size == builtin__max_size ) {
 if ( isnil ( parent ) ) {
 parent  =  new_node ( ) ;
 m ->root  =  parent ;
 }
 ;
 mapnode_split_child ( parent ,  child_index , node ) ;
 if (string_eq( key , parent ->keys [ child_index ]/*rstring 1*/ ) ) {
 memcpy ( parent ->values [ child_index ]/*rvoidptr 1*/ ,  value ,  m ->value_bytes ) ;
 
 return ;
 }
 ;
 node  =  ((string_lt( key , parent ->keys [ child_index ]/*rstring 1*/ ) ) ? ( ((mapnode*)( parent ->children [/*ptr!*/ child_index ]/*rvoidptr 1*/ ) ) ) : ( ((mapnode*)( parent ->children [/*ptr!*/ child_index + 1 ]/*rvoidptr 1*/ ) ) )) ;
 }
 ;
int i= 0 ;
 while ( i < node ->size  && string_gt( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 
 i ++ ;
 }
 ;
 if ( i != node ->size  && string_eq( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 memcpy ( node ->values [ i ]/*rvoidptr 1*/ ,  value ,  m ->value_bytes ) ;
 
 return ;
 }
 ;
 if ( isnil ( node ->children ) ) {
int j= node ->size - 1 ;
 while ( j >= 0  && string_lt( key , node ->keys [ j ]/*rstring 1*/ ) ) {
 
 node ->keys [ j + 1 ]/*rstring 1*/  =  node ->keys [ j ]/*rstring 1*/ ;
 node ->values [ j + 1 ]/*rvoidptr 1*/  =  node ->values [ j ]/*rvoidptr 1*/ ;
 j -- ;
 }
 ;
 node ->keys [ j + 1 ]/*rstring 1*/  =  key ;
 node ->values [ j + 1 ]/*rvoidptr 1*/  =  v_malloc ( m ->value_bytes ) ;
 memcpy ( node ->values [ j + 1 ]/*rvoidptr 1*/ ,  value ,  m ->value_bytes ) ;
 node ->size ++ ;
 m ->size ++ ;
 
 return ;
 }
 ;
 parent  =  node ;
 child_index  =  i ;
 node  =  ((mapnode*)( node ->children [/*ptr!*/ child_index ]/*rvoidptr 1*/ ) ) ;
 }
 ;
 }
 void mapnode_split_child (mapnode* n, int child_index, mapnode* y) {
mapnode* z= new_node ( ) ;
 z ->size  =  builtin__mid_index ;
 y ->size  =  builtin__mid_index ;
 for (
int j= builtin__mid_index - 1  ;  j >= 0  ;  j -- ) { 
 
 z ->keys [ j ]/*rstring 1*/  =  y ->keys [ j + builtin__degree ]/*rstring 1*/ ;
 z ->values [ j ]/*rvoidptr 1*/  =  y ->values [ j + builtin__degree ]/*rvoidptr 1*/ ;
 }
 ;
 if ( ! isnil ( y ->children ) ) {
 z ->children  =  ((voidptr*)( v_malloc ( builtin__children_bytes ) ) ) ;
 for (
int jj= builtin__degree - 1  ;  jj >= 0  ;  jj -- ) { 
 
 z ->children [/*ptr!*/ jj ]/*rvoidptr 1*/  =  y ->children [/*ptr!*/ jj + builtin__degree ]/*rvoidptr 1*/ ;
 }
 ;
 }
 ;
 if ( isnil ( n ->children ) ) {
 n ->children  =  ((voidptr*)( v_malloc ( builtin__children_bytes ) ) ) ;
 }
 ;
 n ->children [/*ptr!*/ n ->size + 1 ]/*rvoidptr 1*/  =  n ->children [/*ptr!*/ n ->size ]/*rvoidptr 1*/ ;
 for (
int j= n ->size  ;  j > child_index  ;  j -- ) { 
 
 n ->keys [ j ]/*rstring 1*/  =  n ->keys [ j - 1 ]/*rstring 1*/ ;
 n ->values [ j ]/*rvoidptr 1*/  =  n ->values [ j - 1 ]/*rvoidptr 1*/ ;
 n ->children [/*ptr!*/ j ]/*rvoidptr 1*/  =  n ->children [/*ptr!*/ j - 1 ]/*rvoidptr 1*/ ;
 }
 ;
 n ->keys [ child_index ]/*rstring 1*/  =  y ->keys [ builtin__mid_index ]/*rstring 1*/ ;
 n ->values [ child_index ]/*rvoidptr 1*/  =  y ->values [ builtin__mid_index ]/*rvoidptr 1*/ ;
 n ->children [/*ptr!*/ child_index ]/*rvoidptr 1*/  =  ((voidptr)( y ) ) ;
 n ->children [/*ptr!*/ child_index + 1 ]/*rvoidptr 1*/  =  ((voidptr)( z ) ) ;
 n ->size ++ ;
 }
 bool SortedMap_get (SortedMap m, string key, void* out) {
mapnode* node= m .root ;
 while (1) { 
int i= node ->size - 1 ;
 while ( i >= 0  && string_lt( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 
 i -- ;
 }
 ;
 if ( i != - 1  && string_eq( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 memcpy ( out ,  node ->values [ i ]/*rvoidptr 1*/ ,  m .value_bytes ) ;
return  1 ;
 }
 ;
 if ( isnil ( node ->children ) ) {
 break
 ;
 }
 ;
 node  =  ((mapnode*)( node ->children [/*ptr!*/ i + 1 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
return  0 ;
 }
 bool SortedMap_exists (SortedMap m, string key) {
 if ( isnil ( m .root ) ) {
return  0 ;
 }
 ;
mapnode* node= m .root ;
 while (1) { 
int i= node ->size - 1 ;
 while ( i >= 0  && string_lt( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 
 i -- ;
 }
 ;
 if ( i != - 1  && string_eq( key , node ->keys [ i ]/*rstring 1*/ ) ) {
return  1 ;
 }
 ;
 if ( isnil ( node ->children ) ) {
 break
 ;
 }
 ;
 node  =  ((mapnode*)( node ->children [/*ptr!*/ i + 1 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
return  0 ;
 }
 int mapnode_find_key (mapnode* n, string k) {
int idx= 0 ;
 while ( idx < n ->size  && string_lt( n ->keys [ idx ]/*rstring 0*/ , k ) ) {
 
 idx ++ ;
 }
 ;
return  idx ;
 }
 bool mapnode_remove_key (mapnode* n, string k) {
int idx= mapnode_find_key (& /* ? */* n ,  k ) ;
 if ( idx < n ->size  && string_eq( n ->keys [ idx ]/*rstring 1*/ , k ) ) {
 if ( isnil ( n ->children ) ) {
 mapnode_remove_from_leaf ( n ,  idx ) ;
 }
  else { 
 mapnode_remove_from_non_leaf ( n ,  idx ) ;
 }
 ;
return  1 ;
 }
  else { 
 if ( isnil ( n ->children ) ) {
return  0 ;
 }
 ;
bool flag= (( idx == n ->size ) ? ( 1 ) : ( 0 )) ;
 if ( ( ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ->size < builtin__degree ) {
 mapnode_fill ( n ,  idx ) ;
 }
 ;
 if ( flag  &&  idx > n ->size ) {
return  mapnode_remove_key ( ( ((mapnode*)( n ->children [/*ptr!*/ idx - 1 ]/*rvoidptr 1*/ ) ) ) ,  k ) ;
 }
  else { 
return  mapnode_remove_key ( ( ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ,  k ) ;
 }
 ;
 }
 ;
 }
 void mapnode_remove_from_leaf (mapnode* n, int idx) {
 for (
int i= idx + 1  ;  i < n ->size  ;  i ++ ) { 
 
 n ->keys [ i - 1 ]/*rstring 1*/  =  n ->keys [ i ]/*rstring 1*/ ;
 n ->values [ i - 1 ]/*rvoidptr 1*/  =  n ->values [ i ]/*rvoidptr 1*/ ;
 }
 ;
 n ->size -- ;
 }
 void mapnode_remove_from_non_leaf (mapnode* n, int idx) {
string k= n ->keys [ idx ]/*rstring 1*/ ;
 if ( ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ->size >= builtin__degree ) {
mapnode* current= ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
 while ( ! isnil ( current ->children ) ) {
 
 current  =  ((mapnode*)( current ->children [/*ptr!*/ current ->size ]/*rvoidptr 1*/ ) ) ;
 }
 ;
string predecessor= current ->keys [ current ->size - 1 ]/*rstring 1*/ ;
 n ->keys [ idx ]/*rstring 1*/  =  predecessor ;
 n ->values [ idx ]/*rvoidptr 1*/  =  current ->values [ current ->size - 1 ]/*rvoidptr 1*/ ;
 mapnode_remove_key ( ( ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ,  predecessor ) ; 
 }
  else  if ( ((mapnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ->size >= builtin__degree ) {
mapnode* current= ((mapnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ;
 while ( ! isnil ( current ->children ) ) {
 
 current  =  ((mapnode*)( current ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
string successor= current ->keys [ 0 ]/*rstring 1*/ ;
 n ->keys [ idx ]/*rstring 1*/  =  successor ;
 n ->values [ idx ]/*rvoidptr 1*/  =  current ->values [ 0 ]/*rvoidptr 1*/ ;
 mapnode_remove_key ( ( ((mapnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ) ,  successor ) ; 
 }
  else { 
 mapnode_merge ( n ,  idx ) ;
 mapnode_remove_key ( ( ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ,  k ) ; 
 }
 ;
 }
 void mapnode_fill (mapnode* n, int idx) {
 if ( idx != 0  &&  ((mapnode*)( n ->children [/*ptr!*/ idx - 1 ]/*rvoidptr 1*/ ) ) ->size >= builtin__degree ) {
 mapnode_borrow_from_prev ( n ,  idx ) ;
 }
  else  if ( idx != n ->size  &&  ((mapnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ->size >= builtin__degree ) {
 mapnode_borrow_from_next ( n ,  idx ) ;
 }
  else  if ( idx != n ->size ) {
 mapnode_merge ( n ,  idx ) ;
 }
  else { 
 mapnode_merge ( n ,  idx - 1 ) ;
 }
 ;
 }
 void mapnode_borrow_from_prev (mapnode* n, int idx) {
mapnode* child= ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
mapnode* sibling= ((mapnode*)( n ->children [/*ptr!*/ idx - 1 ]/*rvoidptr 1*/ ) ) ;
 for (
int i= child ->size - 1  ;  i >= 0  ;  i -- ) { 
 
 child ->keys [ i + 1 ]/*rstring 1*/  =  child ->keys [ i ]/*rstring 1*/ ;
 child ->values [ i + 1 ]/*rvoidptr 1*/  =  child ->values [ i ]/*rvoidptr 1*/ ;
 }
 ;
 if ( ! isnil ( child ->children ) ) {
 for (
int i= child ->size  ;  i >= 0  ;  i -- ) { 
 
 child ->children [/*ptr!*/ i + 1 ]/*rvoidptr 1*/  =  child ->children [/*ptr!*/ i ]/*rvoidptr 1*/ ;
 }
 ;
 }
 ;
 child ->keys [ 0 ]/*rstring 1*/  =  n ->keys [ idx - 1 ]/*rstring 1*/ ;
 child ->values [ 0 ]/*rvoidptr 1*/  =  n ->values [ idx - 1 ]/*rvoidptr 1*/ ;
 if ( ! isnil ( child ->children ) ) {
 child ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ sibling ->size ]/*rvoidptr 1*/ ;
 }
 ;
 n ->keys [ idx - 1 ]/*rstring 1*/  =  sibling ->keys [ sibling ->size - 1 ]/*rstring 1*/ ;
 n ->values [ idx - 1 ]/*rvoidptr 1*/  =  sibling ->values [ sibling ->size - 1 ]/*rvoidptr 1*/ ;
 child ->size ++ ;
 sibling ->size -- ;
 }
 void mapnode_borrow_from_next (mapnode* n, int idx) {
mapnode* child= ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
mapnode* sibling= ((mapnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ;
 child ->keys [ child ->size ]/*rstring 1*/  =  n ->keys [ idx ]/*rstring 1*/ ;
 child ->values [ child ->size ]/*rvoidptr 1*/  =  n ->values [ idx ]/*rvoidptr 1*/ ;
 if ( ! isnil ( child ->children ) ) {
 child ->children [/*ptr!*/ child ->size + 1 ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/ ;
 }
 ;
 n ->keys [ idx ]/*rstring 1*/  =  sibling ->keys [ 0 ]/*rstring 1*/ ;
 n ->values [ idx ]/*rvoidptr 1*/  =  sibling ->values [ 0 ]/*rvoidptr 1*/ ;
 for (
int i= 1  ;  i < sibling ->size  ;  i ++ ) { 
 
 sibling ->keys [ i - 1 ]/*rstring 1*/  =  sibling ->keys [ i ]/*rstring 1*/ ;
 sibling ->values [ i - 1 ]/*rvoidptr 1*/  =  sibling ->values [ i ]/*rvoidptr 1*/ ;
 }
 ;
 if ( ! isnil ( sibling ->children ) ) {
 for (
int i= 1  ;  i <= sibling ->size  ;  i ++ ) { 
 
 sibling ->children [/*ptr!*/ i - 1 ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ i ]/*rvoidptr 1*/ ;
 }
 ;
 }
 ;
 child ->size ++ ;
 sibling ->size -- ;
 }
 void mapnode_merge (mapnode* n, int idx) {
mapnode* child= ((mapnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
mapnode* sibling= ((mapnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ;
 child ->keys [ builtin__mid_index ]/*rstring 1*/  =  n ->keys [ idx ]/*rstring 1*/ ;
 child ->values [ builtin__mid_index ]/*rvoidptr 1*/  =  n ->values [ idx ]/*rvoidptr 1*/ ;
 int tmp3 =  0;
 ;
for (int tmp4 = tmp3; tmp4 <  sibling ->size; tmp4++) {
 int i = tmp4;
 
 child ->keys [ i + builtin__degree ]/*rstring 1*/  =  sibling ->keys [ i ]/*rstring 0*/ ;
 child ->values [ i + builtin__degree ]/*rvoidptr 1*/  =  sibling ->values [ i ]/*rvoidptr 0*/ ;
 }
 ;
 if ( ! isnil ( child ->children ) ) {
 for (
int i= 0  ;  i <= sibling ->size  ;  i ++ ) { 
 
 child ->children [/*ptr!*/ i + builtin__degree ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ i ]/*rvoidptr 0*/ ;
 }
 ;
 }
 ;
 for (
int i= idx + 1  ;  i < n ->size  ;  i ++ ) { 
 
 n ->keys [ i - 1 ]/*rstring 1*/  =  n ->keys [ i ]/*rstring 1*/ ;
 n ->values [ i - 1 ]/*rvoidptr 1*/  =  n ->values [ i ]/*rvoidptr 1*/ ;
 }
 ;
 for (
int i= idx + 2  ;  i <= n ->size  ;  i ++ ) { 
 
 n ->children [/*ptr!*/ i - 1 ]/*rvoidptr 1*/  =  n ->children [/*ptr!*/ i ]/*rvoidptr 1*/ ;
 }
 ;
 child ->size  +=  sibling ->size + 1 ;
 n ->size -- ;
 }
 void v_SortedMap_delete (SortedMap* m, string key) {
 if ( m ->root ->size == 0 ) {
 
 return ;
 }
 ;
bool removed= mapnode_remove_key ( m ->root ,  key ) ;
 if ( removed ) {
 m ->size -- ;
 }
 ;
 if ( m ->root ->size == 0 ) {
 if ( isnil ( m ->root ->children ) ) {
 
 return ;
 }
  else { 
 m ->root  =  ((mapnode*)( m ->root ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
 }
 ;
 }
 int mapnode_subkeys (mapnode* n, array_string* keys, int at) {
int position= at ;
 if ( ! isnil ( n ->children ) ) {
 int tmp5 =  0;
 ;
for (int tmp6 = tmp5; tmp6 <  n ->size; tmp6++) {
 int i = tmp6;
 
mapnode* child= ((mapnode*)( n ->children [/*ptr!*/ i ]/*rvoidptr 0*/ ) ) ;
 position  +=  mapnode_subkeys (& /* ? */* child ,  keys , position ) ;
array_set( keys , position , & (string []) {  n ->keys [ i ]/*rstring 0*/ }) ;
 position ++ ;
 }
 ;
mapnode* child= ((mapnode*)( n ->children [/*ptr!*/ n ->size ]/*rvoidptr 0*/ ) ) ;
 position  +=  mapnode_subkeys (& /* ? */* child ,  keys , position ) ;
 }
  else { 
 int tmp7 =  0;
 ;
for (int tmp8 = tmp7; tmp8 <  n ->size; tmp8++) {
 int i = tmp8;
 
array_set( keys , position + i , & (string []) {  n ->keys [ i ]/*rstring 0*/ }) ;
 }
 ;
 position  +=  n ->size ;
 }
 ;
return  position - at ;
 }
 array_string SortedMap_keys (SortedMap* m) {
array_string keys= array_repeat (new_array_from_c_array(1, 1, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 1 ) {  tos3("")  }) ,  m ->size ) ;
 if ( isnil ( m ->root )  ||  m ->root ->size == 0 ) {
return  keys ;
 }
 ;
 mapnode_subkeys (& /* ? */* m ->root , & /*111*/ (array[]){ keys }[0]  , 0 ) ;
return  keys ;
 }
 void v_mapnode_free (mapnode* n) {
 println ( tos3("TODO") ) ;
 }
 void v_SortedMap_free (SortedMap* m) {
 if ( isnil ( m ->root ) ) {
 
 return ;
 }
 ;
 v_mapnode_free ( m ->root ) ;
 }
 void SortedMap_print (SortedMap m) {
 println ( tos3("TODO") ) ;
 }
 int vstrlen (byte* s) {
return  strlen ( ((charptr)( s ) ) ) ;
 }
 string tos (byte* s, int len) {
 if ( s == 0 ) {
 v_panic ( tos3("tos(): nil string") ) ;
 }
 ;
return  (string) { .str =  s , .len =  len } ;
 }
 string tos_clone (byte* s) {
 if ( s == 0 ) {
 v_panic ( tos3("tos: nil string") ) ;
 }
 ;
return  string_clone ( tos2 ( s ) ) ;
 }
 string tos2 (byte* s) {
 if ( s == 0 ) {
 v_panic ( tos3("tos2: nil string") ) ;
 }
 ;
return  (string) { .str =  s , .len =  vstrlen ( s ) } ;
 }
 string tos3 (charptr s) {
 if ( s == 0 ) {
 v_panic ( tos3("tos3: nil string") ) ;
 }
 ;
return  (string) { .str =  ((byteptr)( s ) ) , .len =  strlen ( s ) } ;
 }
 string string_clone (string a) {
string b= (string) { .len =  a .len , .str =  v_malloc ( a .len + 1 ) } ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  a .len; tmp2++) {
 int i = tmp2;
 
 b .str [/*ptr!*/ i ]/*rbyte 1*/  =  a .str [/*ptr!*/ i ]/*rbyte 0*/ ;
 }
 ;
 b .str [/*ptr!*/ a .len ]/*rbyte 1*/  =  '\0' ;
return  b ;
 }
 string cstring_to_vstring (byte* cstr) {
int slen= strlen ((char*) cstr ) ;
byteptr s= ((byteptr)( memdup ( cstr , slen + 1 ) ) ) ;
 s [/*ptr!*/ slen ]/*rbyteptr 1*/  =  '\0' ;
return  tos ( s , slen ) ;
 }
 string string_replace_once (string s, string rep, string with) {
Option_int tmp3 =  string_index ( s ,  rep ) ;
 int index;
 if (!tmp3 .ok) {
 string err = tmp3 . error;
 int errcode = tmp3 . ecode;
return  s ;
 }
 index = *(int*)tmp3.data;
 ;
return string_add(string_add( string_substr ( s ,  0 , index ) , with ) , string_substr ( s ,  index + rep .len , s .len ) ) ;
 }
 string string_replace (string s, string rep, string with) {
 if ( s .len == 0  ||  rep .len == 0 ) {
return  s ;
 }
 ;
array_int idxs=new_array_from_c_array(0, 0, sizeof(int), EMPTY_ARRAY_OF_ELEMS( int, 0 ) {   TCCSKIP(0) }) ;
int idx= 0 ;
 while (1) { 
 idx  =  string_index_after ( s ,  rep , idx ) ;
 if ( idx == - 1 ) {
 break
 ;
 }
 ;
_PUSH(& idxs , ( /*typ = array_int   tmp_typ=int*/ idx ), tmp4, int) ;
 idx  +=  rep .len ;
 }
 ;
 if ( idxs .len == 0 ) {
return  s ;
 }
 ;
int new_len= s .len + idxs .len * ( with .len - rep .len ) ;
byte* b= v_malloc ( new_len + 1 ) ;
int idx_pos= 0 ;
int cur_idx= ( *(int*) array_get(  idxs , idx_pos) ) ;
int b_i= 0 ;
 for (
int i= 0  ;  i < s .len  ;  i ++ ) { 
 
 if ( i == cur_idx ) {
 int tmp7 =  0;
 ;
for (int tmp8 = tmp7; tmp8 <  with .len; tmp8++) {
 int j = tmp8;
 
 b [/*ptr!*/ b_i ]/*rbyte 1*/  =  with .str[ j ]/*rbyte 0*/ ;
 b_i ++ ;
 }
 ;
 i  +=  rep .len - 1 ;
 idx_pos ++ ;
 if ( idx_pos < idxs .len ) {
 cur_idx  =  ( *(int*) array_get(  idxs , idx_pos) ) ;
 }
 ;
 }
  else { 
 b [/*ptr!*/ b_i ]/*rbyte 1*/  =  s .str[ i ]/*rbyte 0*/ ;
 b_i ++ ;
 }
 ;
 }
 ;
 b [/*ptr!*/ new_len ]/*rbyte 1*/  =  '\0' ;
return  tos ( b , new_len ) ;
 }
 int compare_rep_index (RepIndex* a, RepIndex* b) {
 if ( a ->idx < b ->idx ) {
return  - 1 ;
 }
 ;
 if ( a ->idx > b ->idx ) {
return  1 ;
 }
 ;
return  0 ;
 }
 void array_RepIndex_sort (array_RepIndex* a) {
 array_sort_with_compare ( a , & /*112 e="void*" g="fn (RepIndex*,RepIndex*) int" */ compare_rep_index ) ;
 }
 string string_replace_each (string s, array_string vals) {
 if ( s .len == 0  ||  vals .len == 0 ) {
return  s ;
 }
 ;
 if ( vals .len % 2 != 0 ) {
 println ( tos3("string.replace_many(): odd number of strings") ) ;
return  s ;
 }
 ;
int new_len= s .len ;
array_RepIndex idxs=new_array_from_c_array(0, 0, sizeof(RepIndex), EMPTY_ARRAY_OF_ELEMS( RepIndex, 0 ) {   TCCSKIP(0) }) ;
int idx= 0 ;
 for (
int rep_i= 0  ;  rep_i < vals .len  ;  rep_i  +=  2 ) { 
 
string rep= ( *(string*) array_get(  vals , rep_i) ) ;
string with= ( *(string*) array_get(  vals , rep_i + 1) ) ;
 while (1) { 
 idx  =  string_index_after ( s ,  rep , idx ) ;
 if ( idx == - 1 ) {
 break
 ;
 }
 ;
_PUSH(& idxs , ( /*typ = array_RepIndex   tmp_typ=RepIndex*/ (RepIndex) { .idx =  idx , .val_idx =  rep_i } ), tmp15, RepIndex) ;
 idx ++ ;
 new_len  +=  with .len - rep .len ;
 }
 ;
 }
 ;
 if ( idxs .len == 0 ) {
return  s ;
 }
 ;
 array_RepIndex_sort (& /* ? */ idxs ) ;
byte* b= v_malloc ( new_len + 1 ) ;
int idx_pos= 0 ;
RepIndex cur_idx= ( *(RepIndex*) array_get(  idxs , idx_pos) ) ;
int b_i= 0 ;
 for (
int i= 0  ;  i < s .len  ;  i ++ ) { 
 
 if ( i == cur_idx .idx ) {
string rep= ( *(string*) array_get(  vals , cur_idx .val_idx) ) ;
string with= ( *(string*) array_get(  vals , cur_idx .val_idx + 1) ) ;
 int tmp22 =  0;
 ;
for (int tmp23 = tmp22; tmp23 <  with .len; tmp23++) {
 int j = tmp23;
 
 b [/*ptr!*/ b_i ]/*rbyte 1*/  =  with .str[ j ]/*rbyte 0*/ ;
 b_i ++ ;
 }
 ;
 i  +=  rep .len - 1 ;
 idx_pos ++ ;
 if ( idx_pos < idxs .len ) {
 cur_idx  =  ( *(RepIndex*) array_get(  idxs , idx_pos) ) ;
 }
 ;
 }
  else { 
 b [/*ptr!*/ b_i ]/*rbyte 1*/  =  s .str [/*ptr!*/ i ]/*rbyte 0*/ ;
 b_i ++ ;
 }
 ;
 }
 ;
 b [/*ptr!*/ new_len ]/*rbyte 1*/  =  '\0' ;
return  tos ( b , new_len ) ;
 }
 bool string_bool (string s) {
return string_eq( s , tos3("true") )  || string_eq( s , tos3("t") ) ;
 }
 int v_string_int (string s) {
return  ((int)( strconv__common_parse_int ( s , 0 , 32 , 0 , 0 ) ) ) ;
 }
 i64 string_i64 (string s) {
return  strconv__common_parse_int ( s , 0 , 64 , 0 , 0 ) ;
 }
 i8 string_i8 (string s) {
return  ((i8)( strconv__common_parse_int ( s , 0 , 8 , 0 , 0 ) ) ) ;
 }
 i16 string_i16 (string s) {
return  ((i16)( strconv__common_parse_int ( s , 0 , 16 , 0 , 0 ) ) ) ;
 }
 f32 string_f32 (string s) {
return  ((f32)( strconv__atof64 ( s ) ) ) ;
 }
 f64 string_f64 (string s) {
return  strconv__atof64 ( s ) ;
 }
 u16 string_u16 (string s) {
return  ((u16)( strconv__common_parse_uint ( s , 0 , 16 , 0 , 0 ) ) ) ;
 }
 u32 string_u32 (string s) {
return  ((u32)( strconv__common_parse_uint ( s , 0 , 32 , 0 , 0 ) ) ) ;
 }
 u64 string_u64 (string s) {
return  strconv__common_parse_uint ( s , 0 , 64 , 0 , 0 ) ;
 }
 bool string_eq (string s, string a) {
 if ( isnil ( s .str ) ) {
 v_panic ( tos3("string.eq(): nil string") ) ;
return false;
 ;
 }
 ;
 if ( s .len != a .len ) {
return  0 ;
 }
 ;
 int tmp26 =  0;
 ;
for (int tmp27 = tmp26; tmp27 <  s .len; tmp27++) {
 int i = tmp27;
 
 if ( s .str[ i ]/*rbyte 0*/ != a .str[ i ]/*rbyte 0*/ ) {
return  0 ;
 }
 ;
 }
 ;
return  1 ;
 }
 bool string_ne (string s, string a) {
return  ! string_eq ( s ,  a ) ;
 }
 bool string_lt (string s, string a) {
 int tmp28 =  0;
 ;
for (int tmp29 = tmp28; tmp29 <  s .len; tmp29++) {
 int i = tmp29;
 
 if ( i >= a .len  ||  s .str[ i ]/*rbyte 0*/ > a .str[ i ]/*rbyte 0*/ ) {
return  0 ;
 }
  else  if ( s .str[ i ]/*rbyte 0*/ < a .str[ i ]/*rbyte 0*/ ) {
return  1 ;
 }
 ;
 }
 ;
 if ( s .len < a .len ) {
return  1 ;
 }
 ;
return  0 ;
 }
 bool string_le (string s, string a) {
return  string_lt ( s ,  a )  ||  string_eq ( s ,  a ) ;
 }
 bool string_gt (string s, string a) {
return  ! string_le ( s ,  a ) ;
 }
 bool string_ge (string s, string a) {
return  ! string_lt ( s ,  a ) ;
 }
 string string_add (string s, string a) {
int new_len= a .len + s .len ;
string res= (string) { .len =  new_len , .str =  v_malloc ( new_len + 1 ) } ;
 int tmp30 =  0;
 ;
for (int tmp31 = tmp30; tmp31 <  s .len; tmp31++) {
 int j = tmp31;
 
 res .str[ j ]/*rbyte 1*/  =  s .str[ j ]/*rbyte 0*/ ;
 }
 ;
 int tmp32 =  0;
 ;
for (int tmp33 = tmp32; tmp33 <  a .len; tmp33++) {
 int j = tmp33;
 
 res .str[ s .len + j ]/*rbyte 1*/  =  a .str[ j ]/*rbyte 0*/ ;
 }
 ;
 res .str [/*ptr!*/ new_len ]/*rbyte 1*/  =  '\0' ;
return  res ;
 }
 array_string string_split (string s, string delim) {
return  string_split_nth ( s ,  delim , 0 ) ;
 }
 array_string string_split_nth (string s, string delim, int nth) {
array_string res=new_array_from_c_array(0, 0, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 0 ) {   TCCSKIP(0) }) ;
int i= 0 ;
 if ( delim .len == 0 ) {
 i  =  1 ;
 string tmp34 =  s;
 ;
for (int tmp35 = 0; tmp35 < tmp34 .len; tmp35 ++) {
 byte ch = tmp34.str[tmp35];
 
 if ( nth > 0  &&  i >= nth ) {
_PUSH(& res , ( /*typ = array_string   tmp_typ=string*/ string_substr ( s ,  i , s .len ) ), tmp36, string) ;
 break
 ;
 }
 ;
_PUSH(& res , ( /*typ = array_string   tmp_typ=string*/ byte_str ( ch ) ), tmp37, string) ;
 i ++ ;
 }
 ;
return  res ;
 }
 ;
int start= 0 ;
int nth_1= nth - 1 ;
 while ( i <= s .len ) {
 
bool is_delim= s .str[ i ]/*rbyte 0*/ == delim .str[ 0 ]/*rbyte 0*/ ;
int j= 0 ;
 while ( is_delim  &&  j < delim .len ) {
 
 is_delim  =  is_delim  &&  s .str[ i + j ]/*rbyte 0*/ == delim .str[ j ]/*rbyte 0*/ ;
 j ++ ;
 }
 ;
bool last= i == s .len - 1 ;
 if ( is_delim  ||  last ) {
 if ( ! is_delim  &&  last ) {
 i ++ ;
 }
 ;
string val= string_substr ( s ,  start , i ) ;
 if ( string_starts_with ( val ,  delim ) ) {
 val  =  string_right ( val ,  delim .len ) ;
 }
 ;
bool was_last= nth > 0  &&  res .len == nth_1 ;
 if ( was_last ) {
_PUSH(& res , ( /*typ = array_string   tmp_typ=string*/ string_right ( s ,  start ) ), tmp38, string) ;
 break
 ;
 }
 ;
_PUSH(& res , ( /*typ = array_string   tmp_typ=string*/ val ), tmp39, string) ;
 start  =  i + delim .len ;
 }
 ;
 i ++ ;
 }
 ;
 if ( string_ends_with ( s ,  delim )  &&  ( nth < 1  ||  res .len < nth ) ) {
_PUSH(& res , ( /*typ = array_string   tmp_typ=string*/ tos3("") ), tmp40, string) ;
 }
 ;
return  res ;
 }
 array_string string_split_into_lines (string s) {
array_string res=new_array_from_c_array(0, 0, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 0 ) {   TCCSKIP(0) }) ;
 if ( s .len == 0 ) {
return  res ;
 }
 ;
int start= 0 ;
 for (
int i= 0  ;  i < s .len  ;  i ++ ) { 
 
bool is_lf= s .str[ i ]/*rbyte 0*/ == '\n' ;
bool is_crlf= i != s .len - 1  &&  s .str[ i ]/*rbyte 0*/ == '\r'  &&  s .str[ i + 1 ]/*rbyte 0*/ == '\n' ;
bool is_eol= is_lf  ||  is_crlf ;
bool is_last= (( is_crlf ) ? ( i == s .len - 2 ) : ( i == s .len - 1 )) ;
 if ( is_eol  ||  is_last ) {
 if ( is_last  &&  ! is_eol ) {
 i ++ ;
 }
 ;
string line= string_substr ( s ,  start , i ) ;
_PUSH(& res , ( /*typ = array_string   tmp_typ=string*/ line ), tmp41, string) ;
 if ( is_crlf ) {
 i ++ ;
 }
 ;
 start  =  i + 1 ;
 }
 ;
 }
 ;
return  res ;
 }
 string string_left (string s, int n) {
 if ( n >= s .len ) {
return  s ;
 }
 ;
return  string_substr ( s ,  0 , n ) ;
 }
 string string_right (string s, int n) {
 if ( n >= s .len ) {
return  tos3("") ;
 }
 ;
return  string_substr ( s ,  n , s .len ) ;
 }
 string string_substr2 (string s, int start, int _end, bool end_max) {
int end= (( end_max ) ? ( s .len ) : ( _end )) ;
return  string_substr ( s ,  start , end ) ;
 }
 string string_substr (string s, int start, int end) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( start > end  ||  start > s .len  ||  end > s .len  ||  start < 0  ||  end < 0 ) {
 v_panic ( _STR("substr(%d, %d) out of bounds (len=%d)", start, end, s .len) ) ;
 }
 ;
 #endif
 ;
int len= end - start ;
string res= (string) { .len =  len , .str =  v_malloc ( len + 1 ) } ;
 int tmp42 =  0;
 ;
for (int tmp43 = tmp42; tmp43 <  len; tmp43++) {
 int i = tmp43;
 
 res .str [/*ptr!*/ i ]/*rbyte 1*/  =  s .str [/*ptr!*/ start + i ]/*rbyte 0*/ ;
 }
 ;
 res .str [/*ptr!*/ len ]/*rbyte 1*/  =  '\0' ;
return  res ;
 }
 int string_index_old (string s, string p) {
 if ( p .len > s .len  ||  p .len == 0 ) {
return  - 1 ;
 }
 ;
int i= 0 ;
 while ( i < s .len ) {
 
int j= 0 ;
 while ( j < p .len  &&  s .str[ i + j ]/*rbyte 0*/ == p .str[ j ]/*rbyte 0*/ ) {
 
 j ++ ;
 }
 ;
 if ( j == p .len ) {
return  i ;
 }
 ;
 i ++ ;
 }
 ;
return  - 1 ;
 }
 Option_int string_index (string s, string p) {
 if ( p .len > s .len  ||  p .len == 0 ) {
return  opt_none() ;
 }
 ;
int i= 0 ;
 while ( i < s .len ) {
 
int j= 0 ;
 while ( j < p .len  &&  s .str[ i + j ]/*rbyte 0*/ == p .str[ j ]/*rbyte 0*/ ) {
 
 j ++ ;
 }
 ;
 if ( j == p .len ) {
int tmp44 = OPTION_CAST(int)( i); 
 return opt_ok(&tmp44, sizeof(int)) ;
 }
 ;
 i ++ ;
 }
 ;
return  opt_none() ;
 }
 int string_index_kmp (string s, string p) {
 if ( p .len > s .len ) {
return  - 1 ;
 }
 ;
array_int prefix= array_repeat (new_array_from_c_array(1, 1, sizeof(int), EMPTY_ARRAY_OF_ELEMS( int, 1 ) {  0  }) ,  p .len ) ;
int j= 0 ;
 for (
int i= 1  ;  i < p .len  ;  i ++ ) { 
 
 while ( p .str[ j ]/*rbyte 0*/ != p .str[ i ]/*rbyte 0*/  &&  j > 0 ) {
 
 j  =  ( *(int*) array_get(  prefix , j - 1) ) ;
 }
 ;
 if ( p .str[ j ]/*rbyte 0*/ == p .str[ i ]/*rbyte 0*/ ) {
 j ++ ;
 }
 ;
array_set(&/*q*/ prefix , i , & (int []) {  j }) ;
 }
 ;
 j  =  0 ;
 int tmp47 =  0;
 ;
for (int tmp48 = tmp47; tmp48 <  s .len; tmp48++) {
 int i = tmp48;
 
 while ( p .str[ j ]/*rbyte 0*/ != s .str[ i ]/*rbyte 0*/  &&  j > 0 ) {
 
 j  =  ( *(int*) array_get(  prefix , j - 1) ) ;
 }
 ;
 if ( p .str[ j ]/*rbyte 0*/ == s .str[ i ]/*rbyte 0*/ ) {
 j ++ ;
 }
 ;
 if ( j == p .len ) {
return  i - p .len + 1 ;
 }
 ;
 }
 ;
return  - 1 ;
 }
 int string_index_any (string s, string chars) {
 string tmp51 =  chars;
 ;
for (int tmp52 = 0; tmp52 < tmp51 .len; tmp52 ++) {
 byte c = tmp51.str[tmp52];
 
Option_int tmp53 =  string_index ( s ,  byte_str ( c ) ) ;
 int index;
 if (!tmp53 .ok) {
 string err = tmp53 . error;
 int errcode = tmp53 . ecode;
 continue
 ;
 }
 index = *(int*)tmp53.data;
 ;
return  index ;
 }
 ;
return  - 1 ;
 }
 Option_int string_last_index (string s, string p) {
 if ( p .len > s .len  ||  p .len == 0 ) {
return  opt_none() ;
 }
 ;
int i= s .len - p .len ;
 while ( i >= 0 ) {
 
int j= 0 ;
 while ( j < p .len  &&  s .str[ i + j ]/*rbyte 0*/ == p .str[ j ]/*rbyte 0*/ ) {
 
 j ++ ;
 }
 ;
 if ( j == p .len ) {
int tmp54 = OPTION_CAST(int)( i); 
 return opt_ok(&tmp54, sizeof(int)) ;
 }
 ;
 i -- ;
 }
 ;
return  opt_none() ;
 }
 int string_index_after (string s, string p, int start) {
 if ( p .len > s .len ) {
return  - 1 ;
 }
 ;
int strt= start ;
 if ( start < 0 ) {
 strt  =  0 ;
 }
 ;
 if ( start >= s .len ) {
return  - 1 ;
 }
 ;
int i= strt ;
 while ( i < s .len ) {
 
int j= 0 ;
int ii= i ;
 while ( j < p .len  &&  s .str[ ii ]/*rbyte 0*/ == p .str[ j ]/*rbyte 0*/ ) {
 
 j ++ ;
 ii ++ ;
 }
 ;
 if ( j == p .len ) {
return  i ;
 }
 ;
 i ++ ;
 }
 ;
return  - 1 ;
 }
 int string_index_byte (string s, byte c) {
 int tmp55 =  0;
 ;
for (int tmp56 = tmp55; tmp56 <  s .len; tmp56++) {
 int i = tmp56;
 
 if ( s .str[ i ]/*rbyte 0*/ == c ) {
return  i ;
 }
 ;
 }
 ;
return  - 1 ;
 }
 int string_last_index_byte (string s, byte c) {
 for (
int i= s .len - 1  ;  i >= 0  ;  i -- ) { 
 
 if ( s .str[ i ]/*rbyte 0*/ == c ) {
return  i ;
 }
 ;
 }
 ;
return  - 1 ;
 }
 int string_count (string s, string substr) {
 if ( s .len == 0  ||  substr .len == 0 ) {
return  0 ;
 }
 ;
 if ( substr .len > s .len ) {
return  0 ;
 }
 ;
int n= 0 ;
int i= 0 ;
 while (1) { 
 i  =  string_index_after ( s ,  substr , i ) ;
 if ( i == - 1 ) {
return  n ;
 }
 ;
 i  +=  substr .len ;
 n ++ ;
 }
 ;
return  0 ;
 }
 bool string_contains (string s, string p) {
Option_int tmp57 =  string_index ( s ,  p ) ;
 if (!tmp57 .ok) {
 string err = tmp57 . error;
 int errcode = tmp57 . ecode;
return  0 ;
 }
 ;
return  1 ;
 }
 bool string_starts_with (string s, string p) {
 if ( p .len > s .len ) {
return  0 ;
 }
 ;
 int tmp58 =  0;
 ;
for (int tmp59 = tmp58; tmp59 <  p .len; tmp59++) {
 int i = tmp59;
 
 if ( s .str[ i ]/*rbyte 0*/ != p .str[ i ]/*rbyte 0*/ ) {
return  0 ;
 }
 ;
 }
 ;
return  1 ;
 }
 bool string_ends_with (string s, string p) {
 if ( p .len > s .len ) {
return  0 ;
 }
 ;
 int tmp60 =  0;
 ;
for (int tmp61 = tmp60; tmp61 <  p .len; tmp61++) {
 int i = tmp61;
 
 if ( p .str[ i ]/*rbyte 0*/ != s .str[ s .len - p .len + i ]/*rbyte 0*/ ) {
return  0 ;
 }
 ;
 }
 ;
return  1 ;
 }
 string string_to_lower (string s) {
byte* b= v_malloc ( s .len + 1 ) ;
 int tmp62 =  0;
 ;
for (int tmp63 = tmp62; tmp63 <  s .len; tmp63++) {
 int i = tmp63;
 
 b [/*ptr!*/ i ]/*rbyte 1*/  =  tolower ( s .str [/*ptr!*/ i ]/*rbyte 0*/ ) ;
 }
 ;
return  tos ( b , s .len ) ;
 }
 string string_to_upper (string s) {
byte* b= v_malloc ( s .len + 1 ) ;
 int tmp64 =  0;
 ;
for (int tmp65 = tmp64; tmp65 <  s .len; tmp65++) {
 int i = tmp65;
 
 b [/*ptr!*/ i ]/*rbyte 1*/  =  toupper ( s .str [/*ptr!*/ i ]/*rbyte 0*/ ) ;
 }
 ;
return  tos ( b , s .len ) ;
 }
 string string_capitalize (string s) {
 if ( s .len == 0 ) {
return  tos3("") ;
 }
 ;
string sl= string_to_lower ( s ) ;
string cap=string_add( string_to_upper ( byte_str ( sl .str[ 0 ]/*rbyte 0*/ ) ) , string_right ( sl ,  1 ) ) ;
return  cap ;
 }
 string string_title (string s) {
array_string words= string_split ( s ,  tos3(" ") ) ;
array_string tit=new_array_from_c_array(0, 0, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 0 ) {   TCCSKIP(0) }) ;
 array_string tmp66 =  words;
 for (int tmp67 = 0; tmp67 < tmp66.len; tmp67++) {
 string word = ((string *) tmp66 . data)[tmp67];
 
_PUSH(& tit , ( /*typ = array_string   tmp_typ=string*/ string_capitalize ( word ) ), tmp68, string) ;
 }
 ;
string title= array_string_join ( tit ,  tos3(" ") ) ;
return  title ;
 }
 string string_find_between (string s, string start, string end) {
Option_int tmp69 =  string_index ( s ,  start ) ;
 int start_pos;
 if (!tmp69 .ok) {
 string err = tmp69 . error;
 int errcode = tmp69 . ecode;
return  tos3("") ;
 }
 start_pos = *(int*)tmp69.data;
 ;
string val= string_right ( s ,  start_pos + start .len ) ;
Option_int tmp70 =  string_index ( val ,  end ) ;
 int end_pos;
 if (!tmp70 .ok) {
 string err = tmp70 . error;
 int errcode = tmp70 . ecode;
return  val ;
 }
 end_pos = *(int*)tmp70.data;
 ;
return  string_left ( val ,  end_pos ) ;
 }
 bool array_string_contains (array_string ar, string val) {
 array_string tmp71 =  ar;
 for (int tmp72 = 0; tmp72 < tmp71.len; tmp72++) {
 string s = ((string *) tmp71 . data)[tmp72];
 
 if (string_eq( s , val ) ) {
return  1 ;
 }
 ;
 }
 ;
return  0 ;
 }
 bool array_int_contains (array_int ar, int val) {
 array_int tmp73 =  ar;
 for (int i = 0; i < tmp73.len; i++) {
 int s = ((int *) tmp73 . data)[i];
 
 if ( s == val ) {
return  1 ;
 }
 ;
 }
 ;
return  0 ;
 }
 bool byte_is_space (byte c) {
return  ( c  == ' '  ||  c ==  '\n'  ||  c ==  '\t'  ||  c ==  '\v'  ||  c ==  '\f'  ||  c ==  '\r'  ||  c ==  0x85  ||  c ==  0xa0 ) ;
 }
 string string_trim_space (string s) {
return  string_trim ( s ,  tos3(" \n\t\v\f\r") ) ;
 }
 string string_trim (string s, string cutset) {
 if ( s .len < 1  ||  cutset .len < 1 ) {
return  s ;
 }
 ;
array_byte cs_arr= string_bytes ( cutset ) ;
int pos_left= 0 ;
int pos_right= s .len - 1 ;
bool cs_match= 1 ;
 while ( pos_left <= s .len  &&  pos_right >= - 1  &&  cs_match ) {
 
 cs_match  =  0 ;
 if ((_IN(byte, ( s .str[ pos_left ]/*rbyte 0*/ ),  cs_arr )) ) {
 pos_left ++ ;
 cs_match  =  1 ;
 }
 ;
 if ((_IN(byte, ( s .str[ pos_right ]/*rbyte 0*/ ),  cs_arr )) ) {
 pos_right -- ;
 cs_match  =  1 ;
 }
 ;
 if ( pos_left > pos_right ) {
return  tos3("") ;
 }
 ;
 }
 ;
return  string_substr ( s ,  pos_left , pos_right + 1 ) ;
 }
 string string_trim_left (string s, string cutset) {
 if ( s .len < 1  ||  cutset .len < 1 ) {
return  s ;
 }
 ;
array_byte cs_arr= string_bytes ( cutset ) ;
int pos= 0 ;
 while ( pos <= s .len  && (_IN(byte, ( s .str[ pos ]/*rbyte 0*/ ),  cs_arr )) ) {
 
 pos ++ ;
 }
 ;
return  string_right ( s ,  pos ) ;
 }
 string string_trim_right (string s, string cutset) {
 if ( s .len < 1  ||  cutset .len < 1 ) {
return  s ;
 }
 ;
array_byte cs_arr= string_bytes ( cutset ) ;
int pos= s .len - 1 ;
 while ( pos >= - 1  && (_IN(byte, ( s .str[ pos ]/*rbyte 0*/ ),  cs_arr )) ) {
 
 pos -- ;
 }
 ;
return  string_left ( s ,  pos + 1 ) ;
 }
 int compare_strings (string* a, string* b) {
 if ( string_lt (* a , * b ) ) {
return  - 1 ;
 }
 ;
 if ( string_gt (* a , * b ) ) {
return  1 ;
 }
 ;
return  0 ;
 }
 int compare_strings_by_len (string* a, string* b) {
 if ( a ->len < b ->len ) {
return  - 1 ;
 }
 ;
 if ( a ->len > b ->len ) {
return  1 ;
 }
 ;
return  0 ;
 }
 int compare_lower_strings (string* a, string* b) {
string aa= string_to_lower (* a ) ;
string bb= string_to_lower (* b ) ;
return  compare_strings (& /*114*/ aa ,& /*114*/ bb ) ;
 }
 void array_string_sort (array_string* s) {
 array_sort_with_compare ( s , & /*112 e="void*" g="fn (string*,string*) int" */ compare_strings ) ;
 }
 void array_string_sort_ignore_case (array_string* s) {
 array_sort_with_compare ( s , & /*112 e="void*" g="fn (string*,string*) int" */ compare_lower_strings ) ;
 }
 void array_string_sort_by_len (array_string* s) {
 array_sort_with_compare ( s , & /*112 e="void*" g="fn (string*,string*) int" */ compare_strings_by_len ) ;
 }
 ustring string_ustring (string s) {
ustring res= (ustring) { .s =  s , .runes =  new_array ( 0 , s .len , sizeof( int) ) , .len =  0 } ;
 for (
int i= 0  ;  i < s .len  ;  i ++ ) { 
 
int char_len= utf8_char_len ( s .str [/*ptr!*/ i ]/*rbyte 0*/ ) ;
_PUSH(& res .runes , ( /*typ = array_int   tmp_typ=int*/ i ), tmp74, int) ;
 i  +=  char_len - 1 ;
 res .len ++ ;
 }
 ;
return  res ;
 }
 ustring string_ustring_tmp (string s) {
 if ( g_ustring_runes .len == 0 ) {
 g_ustring_runes  =  new_array ( 0 , 128 , sizeof( int) ) ;
 }
 ;
ustring res= (ustring) { .s =  s , .runes =  new_array(0, 1, sizeof( int )) , .len =  0 } ;
 res .runes  =  g_ustring_runes ;
 res .runes .len  =  s .len ;
int j= 0 ;
 for (
int i= 0  ;  i < s .len  ;  i ++ ) { 
 
int char_len= utf8_char_len ( s .str [/*ptr!*/ i ]/*rbyte 0*/ ) ;
array_set(&/*q*/ res .runes , j , & (int []) {  i }) ;
 j ++ ;
 i  +=  char_len - 1 ;
 res .len ++ ;
 }
 ;
return  res ;
 }
 bool ustring_eq (ustring u, ustring a) {
 if ( u .len != a .len  || string_ne( u .s , a .s ) ) {
return  0 ;
 }
 ;
return  1 ;
 }
 bool ustring_ne (ustring u, ustring a) {
return  ! ustring_eq ( u ,  a ) ;
 }
 bool ustring_lt (ustring u, ustring a) {
return string_lt( u .s , a .s ) ;
 }
 bool ustring_le (ustring u, ustring a) {
return  ustring_lt ( u ,  a )  ||  ustring_eq ( u ,  a ) ;
 }
 bool ustring_gt (ustring u, ustring a) {
return  ! ustring_le ( u ,  a ) ;
 }
 bool ustring_ge (ustring u, ustring a) {
return  ! ustring_lt ( u ,  a ) ;
 }
 ustring ustring_add (ustring u, ustring a) {
ustring res= (ustring) { .s = string_add( u .s , a .s ) , .runes =  new_array ( 0 , u .s .len + a .s .len , sizeof( int) ) , .len =  0 } ;
int j= 0 ;
 for (
int i= 0  ;  i < u .s .len  ;  i ++ ) { 
 
int char_len= utf8_char_len ( u .s .str [/*ptr!*/ i ]/*rbyte 0*/ ) ;
_PUSH(& res .runes , ( /*typ = array_int   tmp_typ=int*/ j ), tmp75, int) ;
 i  +=  char_len - 1 ;
 j  +=  char_len ;
 res .len ++ ;
 }
 ;
 for (
int i= 0  ;  i < a .s .len  ;  i ++ ) { 
 
int char_len= utf8_char_len ( a .s .str [/*ptr!*/ i ]/*rbyte 0*/ ) ;
_PUSH(& res .runes , ( /*typ = array_int   tmp_typ=int*/ j ), tmp76, int) ;
 i  +=  char_len - 1 ;
 j  +=  char_len ;
 res .len ++ ;
 }
 ;
return  res ;
 }
 int ustring_index_after (ustring u, ustring p, int start) {
 if ( p .len > u .len ) {
return  - 1 ;
 }
 ;
int strt= start ;
 if ( start < 0 ) {
 strt  =  0 ;
 }
 ;
 if ( start > u .len ) {
return  - 1 ;
 }
 ;
int i= strt ;
 while ( i < u .len ) {
 
int j= 0 ;
int ii= i ;
 while ( j < p .len  && string_eq( ustring_at ( u ,  ii ) , ustring_at ( p ,  j ) ) ) {
 
 j ++ ;
 ii ++ ;
 }
 ;
 if ( j == p .len ) {
return  i ;
 }
 ;
 i ++ ;
 }
 ;
return  - 1 ;
 }
 int ustring_count (ustring u, ustring substr) {
 if ( u .len == 0  ||  substr .len == 0 ) {
return  0 ;
 }
 ;
 if ( substr .len > u .len ) {
return  0 ;
 }
 ;
int n= 0 ;
int i= 0 ;
 while (1) { 
 i  =  ustring_index_after ( u ,  substr , i ) ;
 if ( i == - 1 ) {
return  n ;
 }
 ;
 i  +=  substr .len ;
 n ++ ;
 }
 ;
return  0 ;
 }
 string ustring_substr (ustring u, int _start, int _end) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( _start > _end  ||  _start > u .len  ||  _end > u .len  ||  _start < 0  ||  _end < 0 ) {
 v_panic ( _STR("substr(%d, %d) out of bounds (len=%d)", _start, _end, u .len) ) ;
 }
 ;
 #endif
 ;
int end= (( _end >= u .len ) ? ( u .s .len ) : ( ( *(int*) array_get(  u .runes , _end) ) )) ;
return  string_substr ( u .s ,  ( *(int*) array_get(  u .runes , _start) ) , end ) ;
 }
 string ustring_left (ustring u, int pos) {
 if ( pos >= u .len ) {
return  u .s ;
 }
 ;
return  ustring_substr ( u ,  0 , pos ) ;
 }
 string ustring_right (ustring u, int pos) {
 if ( pos >= u .len ) {
return  tos3("") ;
 }
 ;
return  ustring_substr ( u ,  pos , u .len ) ;
 }
 byte string_at (string s, int idx) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( idx < 0  ||  idx >= s .len ) {
 v_panic ( _STR("string index out of range: %d / %d", idx, s .len) ) ;
 }
 ;
 #endif
 ;
return  s .str [/*ptr!*/ idx ]/*rbyte 0*/ ;
 }
 string ustring_at (ustring u, int idx) {
 #ifndef CUSTOM_DEFINE_no_bounds_checking
 if ( idx < 0  ||  idx >= u .len ) {
 v_panic ( _STR("string index out of range: %d / %d", idx, u .runes .len) ) ;
 }
 ;
 #endif
 ;
return  ustring_substr ( u ,  idx , idx + 1 ) ;
 }
 void v_ustring_free (ustring u) {
 v_array_free ( u .runes ) ;
 }
 bool byte_is_digit (byte c) {
return  c >= '0'  &&  c <= '9' ;
 }
 bool byte_is_hex_digit (byte c) {
return  byte_is_digit ( c )  ||  ( c >= 'a'  &&  c <= 'f' )  ||  ( c >= 'A'  &&  c <= 'F' ) ;
 }
 bool byte_is_oct_digit (byte c) {
return  c >= '0'  &&  c <= '7' ;
 }
 bool byte_is_bin_digit (byte c) {
return  c == '0'  ||  c == '1' ;
 }
 bool byte_is_letter (byte c) {
return  ( c >= 'a'  &&  c <= 'z' )  ||  ( c >= 'A'  &&  c <= 'Z' ) ;
 }
 void v_string_free (string s) {
 v_free ( s .str ) ;
 }
 string string_all_before (string s, string dot) {
Option_int tmp81 =  string_index ( s ,  dot ) ;
 int pos;
 if (!tmp81 .ok) {
 string err = tmp81 . error;
 int errcode = tmp81 . ecode;
return  s ;
 }
 pos = *(int*)tmp81.data;
 ;
return  string_left ( s ,  pos ) ;
 }
 string string_all_before_last (string s, string dot) {
Option_int tmp82 =  string_last_index ( s ,  dot ) ;
 int pos;
 if (!tmp82 .ok) {
 string err = tmp82 . error;
 int errcode = tmp82 . ecode;
return  s ;
 }
 pos = *(int*)tmp82.data;
 ;
return  string_left ( s ,  pos ) ;
 }
 string string_all_after (string s, string dot) {
Option_int tmp83 =  string_last_index ( s ,  dot ) ;
 int pos;
 if (!tmp83 .ok) {
 string err = tmp83 . error;
 int errcode = tmp83 . ecode;
return  s ;
 }
 pos = *(int*)tmp83.data;
 ;
return  string_right ( s ,  pos + dot .len ) ;
 }
 string string_after (string s, string dot) {
return  string_all_after ( s ,  dot ) ;
 }
 string array_string_join (array_string a, string del) {
 if ( a .len == 0 ) {
return  tos3("") ;
 }
 ;
int len= 0 ;
 array_string tmp84 =  a;
 for (int i = 0; i < tmp84.len; i++) {
 string val = ((string *) tmp84 . data)[i];
 
 len  +=  val .len + del .len ;
 }
 ;
 len  -=  del .len ;
string res= tos3("") ;
 res .len  =  len ;
 res .str  =  v_malloc ( res .len + 1 ) ;
int idx= 0 ;
 array_string tmp85 =  a;
 for (int i = 0; i < tmp85.len; i++) {
 string val = ((string *) tmp85 . data)[i];
 
 int tmp86 =  0;
 ;
for (int tmp87 = tmp86; tmp87 <  val .len; tmp87++) {
 int j = tmp87;
 
byte c= val .str[ j ]/*rbyte 0*/ ;
 res .str [/*ptr!*/ idx ]/*rbyte 1*/  =  val .str [/*ptr!*/ j ]/*rbyte 0*/ ;
 idx ++ ;
 }
 ;
 if ( i != a .len - 1 ) {
 int tmp88 =  0;
 ;
for (int tmp89 = tmp88; tmp89 <  del .len; tmp89++) {
 int k = tmp89;
 
 res .str [/*ptr!*/ idx ]/*rbyte 1*/  =  del .str [/*ptr!*/ k ]/*rbyte 0*/ ;
 idx ++ ;
 }
 ;
 }
 ;
 }
 ;
 res .str [/*ptr!*/ res .len ]/*rbyte 1*/  =  '\0' ;
return  res ;
 }
 string array_string_join_lines (array_string s) {
return  array_string_join ( s ,  tos3("\n") ) ;
 }
 string string_reverse (string s) {
 if ( s .len == 0  ||  s .len == 1 ) {
return  s ;
 }
 ;
string res= (string) { .len =  s .len , .str =  v_malloc ( s .len ) } ;
 for (
int i= s .len - 1  ;  i >= 0  ;  i -- ) { 
 
 res .str [/*ptr!*/ s .len - i - 1 ]/*rbyte 1*/  =  s .str[ i ]/*rbyte 0*/ ;
 }
 ;
return  res ;
 }
 string string_limit (string s, int max) {
ustring u= string_ustring ( s ) ;
 if ( u .len <= max ) {
return  s ;
 }
 ;
return  ustring_substr ( u ,  0 , max ) ;
 }
 bool byte_is_white (byte c) {
 v_panic ( tos3("Use `string.is_space` instead of `string.is_white") ) ;
return false;
 ;
 }
 int string_hash (string s) {
int h= 0 ;
 if ( h == 0  &&  s .len > 0 ) {
 string tmp90 =  s;
 ;
for (int tmp91 = 0; tmp91 < tmp90 .len; tmp91 ++) {
 byte c = tmp90.str[tmp91];
 
 h  =  h * 31 + ((int)( c ) ) ;
 }
 ;
 }
 ;
return  h ;
 }
 array_byte string_bytes (string s) {
 if ( s .len == 0 ) {
return new_array_from_c_array(0, 0, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 0 ) {   TCCSKIP(0) }) ;
 }
 ;
array_byte buf= array_repeat (new_array_from_c_array(1, 1, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 1 ) {  ((byte)( 0 ) )  }) ,  s .len ) ;
 memcpy ( buf .data , (char*) s .str ,  s .len ) ;
return  buf ;
 }
 string string_repeat (string s, int count) {
 if ( count < 0 ) {
 v_panic ( _STR("string.repeat: count is negative: %d", count) ) ;
 }
  else  if ( count == 0 ) {
return  tos3("") ;
 }
  else  if ( count == 1 ) {
return  s ;
 }
 ;
byte* ret= v_malloc ( s .len * count + 1 ) ;
 int tmp92 =  0;
 ;
for (int tmp93 = tmp92; tmp93 <  count; tmp93++) {
 int i = tmp93;
 
 int tmp94 =  0;
 ;
for (int tmp95 = tmp94; tmp95 <  s .len; tmp95++) {
 int j = tmp95;
 
 ret [/*ptr!*/ i * s .len + j ]/*rbyte 1*/  =  s .str[ j ]/*rbyte 0*/ ;
 }
 ;
 }
 ;
 ret [/*ptr!*/ s .len * count ]/*rbyte 1*/  =  0 ;
return  (tos2((byte *) ret ) ) ;
 }
 int utf8_char_len (byte b) {
return  ( ( 0xe5000000  >>  ( ( b  >>  3 ) & 0x1e ) ) & 3 ) + 1 ;
 }
 string utf32_to_str (u32 code) {
int icode= ((int)( code ) ) ;
byte* buffer= v_malloc ( 5 ) ;
 if ( icode <= 127 ) {
 buffer [/*ptr!*/ 0 ]/*rbyte 1*/  =  icode ;
return  tos ( buffer , 1 ) ;
 }
 ;
 if ( ( icode <= 2047 ) ) {
 buffer [/*ptr!*/ 0 ]/*rbyte 1*/  =  192 | ( icode  >>  6 ) ;
 buffer [/*ptr!*/ 1 ]/*rbyte 1*/  =  128 | ( icode & 63 ) ;
return  tos ( buffer , 2 ) ;
 }
 ;
 if ( ( icode <= 65535 ) ) {
 buffer [/*ptr!*/ 0 ]/*rbyte 1*/  =  224 | ( icode  >>  12 ) ;
 buffer [/*ptr!*/ 1 ]/*rbyte 1*/  =  128 | ( ( icode  >>  6 ) & 63 ) ;
 buffer [/*ptr!*/ 2 ]/*rbyte 1*/  =  128 | ( icode & 63 ) ;
return  tos ( buffer , 3 ) ;
 }
 ;
 if ( ( icode <= 1114111 ) ) {
 buffer [/*ptr!*/ 0 ]/*rbyte 1*/  =  240 | ( icode  >>  18 ) ;
 buffer [/*ptr!*/ 1 ]/*rbyte 1*/  =  128 | ( ( icode  >>  12 ) & 63 ) ;
 buffer [/*ptr!*/ 2 ]/*rbyte 1*/  =  128 | ( ( icode  >>  6 ) & 63 ) ;
 buffer [/*ptr!*/ 3 ]/*rbyte 1*/  =  128 | ( icode & 63 ) ;
return  tos ( buffer , 4 ) ;
 }
 ;
return  tos3("") ;
 }
 string utf32_to_str_no_malloc (u32 code, void* buf) {
int icode= ((int)( code ) ) ;
byteptr buffer= ((byteptr)( buf ) ) ;
 if ( icode <= 127 ) {
 buffer [/*ptr!*/ 0 ]/*rbyteptr 1*/  =  icode ;
return  tos ( buffer , 1 ) ;
 }
 ;
 if ( ( icode <= 2047 ) ) {
 buffer [/*ptr!*/ 0 ]/*rbyteptr 1*/  =  192 | ( icode  >>  6 ) ;
 buffer [/*ptr!*/ 1 ]/*rbyteptr 1*/  =  128 | ( icode & 63 ) ;
return  tos ( buffer , 2 ) ;
 }
 ;
 if ( ( icode <= 65535 ) ) {
 buffer [/*ptr!*/ 0 ]/*rbyteptr 1*/  =  224 | ( icode  >>  12 ) ;
 buffer [/*ptr!*/ 1 ]/*rbyteptr 1*/  =  128 | ( ( icode  >>  6 ) & 63 ) ;
 buffer [/*ptr!*/ 2 ]/*rbyteptr 1*/  =  128 | ( icode & 63 ) ;
return  tos ( buffer , 3 ) ;
 }
 ;
 if ( ( icode <= 1114111 ) ) {
 buffer [/*ptr!*/ 0 ]/*rbyteptr 1*/  =  240 | ( icode  >>  18 ) ;
 buffer [/*ptr!*/ 1 ]/*rbyteptr 1*/  =  128 | ( ( icode  >>  12 ) & 63 ) ;
 buffer [/*ptr!*/ 2 ]/*rbyteptr 1*/  =  128 | ( ( icode  >>  6 ) & 63 ) ;
 buffer [/*ptr!*/ 3 ]/*rbyteptr 1*/  =  128 | ( icode & 63 ) ;
return  tos ( buffer , 4 ) ;
 }
 ;
return  tos3("") ;
 }
 int string_utf32_code (string _rune) {
 if ( _rune .len == 0 ) {
return  0 ;
 }
 ;
 if ( _rune .len == 1 ) {
return  ((int)( _rune .str[ 0 ]/*rbyte 0*/ ) ) ;
 }
 ;
byte b= ((byte)( ((int)( _rune .str[ 0 ]/*rbyte 0*/ ) ) ) ) ;
 b  =  b  <<  _rune .len ;
int res= ((int)( b ) ) ;
int shift= 6 - _rune .len ;
 for (
int i= 1  ;  i < _rune .len  ;  i ++ ) { 
 
int c= ((int)( _rune .str[ i ]/*rbyte 0*/ ) ) ;
 res  =  res  <<  shift ;
 res  |=  c & 63 ;
 shift  =  6 ;
 }
 ;
return  res ;
 }
 u16* string_to_wide (string _str) {
 #ifdef _WIN32
 #else
return  0 ;
 #endif
 ;
 }
 string string_from_wide (u16* _wstr) {
 #ifdef _WIN32
 #else
return  tos3("") ;
 #endif
 ;
 }
 string string_from_wide2 (u16* _wstr, int len) {
 #ifdef _WIN32
 #else
return  tos3("") ;
 #endif
 ;
 }
 int utf8_len (byte c) {
int b= 0 ;
byte x= c ;
 if ( ( ( x & 240 ) != 0 ) ) {
 x  >>=  4 ;
 }
  else { 
 b  +=  4 ;
 }
 ;
 if ( ( ( x & 12 ) != 0 ) ) {
 x  >>=  2 ;
 }
  else { 
 b  +=  2 ;
 }
 ;
 if ( ( ( x & 2 ) == 0 ) ) {
 b ++ ;
 }
 ;
return  b ;
 }
 int utf8_getchar () {
int c= getchar ( ) ;
int len= utf8_len ( ~ c ) ;
 if ( c < 0 ) {
return  0 ;
 }
  else  if ( len == 0 ) {
return  c ;
 }
  else  if ( len == 1 ) {
return  - 1 ;
 }
  else { 
int uc= c & ( ( 1  <<  ( 7 - len ) ) - 1 ) ;
 for (
int i= 0  ;  i + 1 < len  ;  i ++ ) { 
 
int c2= getchar ( ) ;
 if ( c2 != - 1  &&  ( c2  >>  6 ) == 2 ) {
 uc  <<=  6 ;
 uc  |=  ( c2 & 63 ) ;
 }
  else  if ( c2 == - 1 ) {
return  0 ;
 }
  else { 
return  - 1 ;
 }
 ;
 }
 ;
return  uc ;
 }
 ;
 }
 strings__Builder strings__new_builder (int initial_size) {
return  (strings__Builder) { .buf =  make ( 0 , initial_size , 1 ) , .initial_size =  initial_size , .len =  0 , } ;
 }
 void strings__Builder_write_bytes (strings__Builder* b, byte* bytes, int howmany) {
 array_push_many (& /* ? */ b ->buf ,  bytes , howmany ) ;
 b ->len  +=  howmany ;
 }
 void strings__Builder_write_b (strings__Builder* b, byte data) {
_PUSH(& b ->buf , ( /*typ = array_byte   tmp_typ=byte*/ data ), tmp1, byte) ;
 b ->len ++ ;
 }
 void strings__Builder_write (strings__Builder* b, string s) {
 if (string_eq( s , tos3("") ) ) {
 
 return ;
 }
 ;
 array_push_many (& /* ? */ b ->buf ,  s .str , s .len ) ;
 b ->len  +=  s .len ;
 }
 void strings__Builder_go_back (strings__Builder* b, int n) {
 array_trim (& /* ? */ b ->buf ,  b ->buf .len - n ) ;
 b ->len  -=  n ;
 }
 void strings__Builder_writeln (strings__Builder* b, string s) {
 array_push_many (& /* ? */ b ->buf ,  s .str , s .len ) ;
_PUSH(& b ->buf , ( /*typ = array_byte   tmp_typ=byte*/ '\n' ), tmp2, byte) ;
 b ->len  +=  s .len + 1 ;
 }
 string strings__Builder_str (strings__Builder* b) {
_PUSH(& b ->buf , ( /*typ = array_byte   tmp_typ=byte*/ '\0' ), tmp3, byte) ;
return  (tos((byte *) b ->buf .data ,  b ->len ) ) ;
 }
 void strings__Builder_free (strings__Builder* b) {
 {
 v_free ( b ->buf .data ) ;
 }
 ;
 b ->buf  =  make ( 0 , b ->initial_size , 1 ) ;
 b ->len  =  0 ;
 }
 int strings__levenshtein_distance (string a, string b) {
array_int f= array_repeat (new_array_from_c_array(1, 1, sizeof(int), EMPTY_ARRAY_OF_ELEMS( int, 1 ) {  0  }) ,  b .len + 1 ) ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  f .len; tmp2++) {
 int j = tmp2;
 
array_set(&/*q*/ f , j , & (int []) {  j }) ;
 }
 ;
 string tmp3 =  a;
 ;
for (int tmp4 = 0; tmp4 < tmp3 .len; tmp4 ++) {
 byte ca = tmp3.str[tmp4];
 
int j= 1 ;
int fj1= ( *(int*) array_get(  f , 0) ) ;
 ( *(int*) array_get(  f , 0) ) ++ ;
 string tmp9 =  b;
 ;
for (int tmp10 = 0; tmp10 < tmp9 .len; tmp10 ++) {
 byte cb = tmp9.str[tmp10];
 
int mn= (( ( *(int*) array_get(  f , j) ) + 1 <= ( *(int*) array_get(  f , j - 1) ) + 1 ) ? ( ( *(int*) array_get(  f , j) ) + 1 ) : ( ( *(int*) array_get(  f , j - 1) ) + 1 )) ;
 if ( cb != ca ) {
 mn  =  (( mn <= fj1 + 1 ) ? ( mn ) : ( fj1 + 1 )) ;
 }
  else { 
 mn  =  (( mn <= fj1 ) ? ( mn ) : ( fj1 )) ;
 }
 ;
 fj1  =  ( *(int*) array_get(  f , j) ) ;
array_set(&/*q*/ f , j , & (int []) {  mn }) ;
 j ++ ;
 }
 ;
 }
 ;
return  ( *(int*) array_get(  f , f .len - 1) ) ;
 }
 f32 strings__levenshtein_distance_percentage (string a, string b) {
int d= strings__levenshtein_distance ( a , b ) ;
int l= (( a .len >= b .len ) ? ( a .len ) : ( b .len )) ;
return  ( 1.00 - ((f32)( d ) ) / ((f32)( l ) ) ) * 100.00 ;
 }
 f32 strings__dice_coefficient (string s1, string s2) {
 if ( s1 .len == 0  ||  s2 .len == 0 ) {
return  0.0 ;
 }
 ;
 if (string_eq( s1 , s2 ) ) {
return  1.0 ;
 }
 ;
 if ( s1 .len < 2  ||  s2 .len < 2 ) {
return  0.0 ;
 }
 ;
string a= (( s1 .len > s2 .len ) ? ( s1 ) : ( s2 )) ;
string b= ((string_eq( a , s1 ) ) ? ( s2 ) : ( s1 )) ;
map_int first_bigrams= new_map(1, sizeof(int)) ;
 int tmp23 =  0;
 ;
for (int tmp24 = tmp23; tmp24 <  a .len - 1; tmp24++) {
 int i = tmp24;
 
string bigram= string_substr2( a ,  i , i + 2 , false) ; 
 int tmp27 = 0; bool tmp28 = map_get(/*similarity.v : 55*/ first_bigrams , bigram, & tmp27); 

int q= (((_IN_MAP( ( bigram ),  first_bigrams )) ) ? ( tmp27 + 1 ) : ( 1 )) ;
map_set(& first_bigrams , bigram , & (int []) {  q }) ;
 }
 ;
int intersection_size= 0 ;
 int tmp29 =  0;
 ;
for (int tmp30 = tmp29; tmp30 <  b .len - 1; tmp30++) {
 int i = tmp30;
 
string bigram= string_substr2( b ,  i , i + 2 , false) ; 
 int tmp33 = 0; bool tmp34 = map_get(/*similarity.v : 61*/ first_bigrams , bigram, & tmp33); 

int count= (((_IN_MAP( ( bigram ),  first_bigrams )) ) ? ( tmp33 ) : ( 0 )) ;
 if ( count > 0 ) {
map_set(& first_bigrams , bigram , & (int []) {  count - 1 }) ;
 intersection_size ++ ;
 }
 ;
 }
 ;
return  ( 2.0 * intersection_size ) / ( ((f32)( a .len ) ) + ((f32)( b .len ) ) - 2 ) ;
 }
 string strings__repeat (byte c, int n) {
 if ( n <= 0 ) {
return  tos3("") ;
 }
 ;
byte* bytes= ((byte*)( 0 ) ) ;
 {
 bytes  =  v_malloc ( n + 1 ) ;
 }
 ;
 memset ((char*) bytes ,  c ,  n ) ;
 bytes [/*ptr!*/ n ]/*rbyte 1*/  =  '0' ;
return  (tos((byte *) bytes ,  n ) ) ;
 }
 string strings__repeat_string (string s, int n) {
 if ( n <= 0  ||  s .len == 0 ) {
return  tos3("") ;
 }
 ;
int slen= s .len ;
int blen= slen * n ;
byte* bytes= ((byte*)( 0 ) ) ;
 {
 bytes  =  v_malloc ( blen + 1 ) ;
 }
 ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  n; tmp2++) {
 int bi = tmp2;
 
int bislen= bi * slen ;
 int tmp3 =  0;
 ;
for (int tmp4 = tmp3; tmp4 <  slen; tmp4++) {
 int si = tmp4;
 
 bytes [/*ptr!*/ bislen + si ]/*rbyte 1*/  =  string_at( s ,  si) ;
 }
 ;
 }
 ;
 bytes [/*ptr!*/ blen ]/*rbyte 1*/  =  '0' ;
return  (tos((byte *) bytes ,  blen ) ) ;
 }
 u64 hash_dot_wyhash__rand_u64 (u64* seed) {
return  0 ;
 }
 static inline u64 hash_dot_wyhash__wyhash_c (byte* key, u64 len, u64 seed) {
return  wyhash ((char*) key ,  len ,  seed ) ;
 }
 static inline u64 hash_dot_wyhash__sum64_string (string key, u64 seed) {
return  hash_dot_wyhash__wyhash64 ( key .str , ((u64)( key .len ) ) , seed ) ;
 }
 static inline u64 hash_dot_wyhash__sum64 (array_byte key, u64 seed) {
return  hash_dot_wyhash__wyhash64 ( key .data , ((u64)( key .len ) ) , seed ) ;
 }
 static inline u64 hash_dot_wyhash__wyhash64 (byte* key, u64 len, u64 seed_) {
 if ( len == 0 ) {
return  0 ;
 }
 ;
byte* p= & key [/*ptr!*/ 0 ]/*rbyte 0*/ ;
u64 seed= seed_ ;
u64 i= len & 63 ;
 if ( i < 4 ) {
 seed  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr3 ( p , i ) ^ seed ^ hash_dot_wyhash__wyp0 , seed ^ hash_dot_wyhash__wyp1 ) ;
 }
  else  if ( i <= 8 ) {
 seed  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr4 ( p ) ^ seed ^ hash_dot_wyhash__wyp0 , hash_dot_wyhash__wyr4 ((byte*)(byte*) p + i - 4 ) ^ seed ^ hash_dot_wyhash__wyp1 ) ;
 }
  else  if ( i <= 16 ) {
 seed  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ( p ) ^ seed ^ hash_dot_wyhash__wyp0 , hash_dot_wyhash__wyr8 ((byte*)(byte*) p + i - 8 ) ^ seed ^ hash_dot_wyhash__wyp1 ) ;
 }
  else  if ( i <= 24 ) {
 seed  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ( p ) ^ seed ^ hash_dot_wyhash__wyp0 , hash_dot_wyhash__wyr8 ((byte*) p + 8 ) ^ seed ^ hash_dot_wyhash__wyp1 ) ^ hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*)(byte*) p + i - 8 ) ^ seed ^ hash_dot_wyhash__wyp2 , seed ^ hash_dot_wyhash__wyp3 ) ;
 }
  else  if ( i <= 32 ) {
 seed  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ( p ) ^ seed ^ hash_dot_wyhash__wyp0 , hash_dot_wyhash__wyr8 ((byte*) p + 8 ) ^ seed ^ hash_dot_wyhash__wyp1 ) ^ hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*) p + 16 ) ^ seed ^ hash_dot_wyhash__wyp2 , hash_dot_wyhash__wyr8 ((byte*)(byte*) p + i - 8 ) ^ seed ^ hash_dot_wyhash__wyp3 ) ;
 }
  else { 
 seed  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ( p ) ^ seed ^ hash_dot_wyhash__wyp0 , hash_dot_wyhash__wyr8 ((byte*) p + 8 ) ^ seed ^ hash_dot_wyhash__wyp1 ) ^ hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*) p + 16 ) ^ seed ^ hash_dot_wyhash__wyp2 , hash_dot_wyhash__wyr8 ((byte*) p + 24 ) ^ seed ^ hash_dot_wyhash__wyp3 ) ^ hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*)(byte*) p + i - 32 ) ^ seed ^ hash_dot_wyhash__wyp1 , hash_dot_wyhash__wyr8 ((byte*)(byte*) p + i - 24 ) ^ seed ^ hash_dot_wyhash__wyp2 ) ^ hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*)(byte*) p + i - 16 ) ^ seed ^ hash_dot_wyhash__wyp3 , hash_dot_wyhash__wyr8 ((byte*)(byte*) p + i - 8 ) ^ seed ^ hash_dot_wyhash__wyp0 ) ;
 }
 ;
 if ( i == len ) {
return  hash_dot_wyhash__wymum ( seed , len ^ hash_dot_wyhash__wyp4 ) ;
 }
 ;
u64 see1= seed ;
u64 see2= seed ;
u64 see3= seed ;
 p  = (byte*) p + i ;
 for (
 i  =  len - i  ;  i >= 64  ;  i  -=  64 ) { 
 
 seed  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ( p ) ^ seed ^ hash_dot_wyhash__wyp0 , hash_dot_wyhash__wyr8 ((byte*) p + 8 ) ^ seed ^ hash_dot_wyhash__wyp1 ) ;
 see1  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*) p + 16 ) ^ see1 ^ hash_dot_wyhash__wyp2 , hash_dot_wyhash__wyr8 ((byte*) p + 24 ) ^ see1 ^ hash_dot_wyhash__wyp3 ) ;
 see2  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*) p + 32 ) ^ see2 ^ hash_dot_wyhash__wyp1 , hash_dot_wyhash__wyr8 ((byte*) p + 40 ) ^ see2 ^ hash_dot_wyhash__wyp2 ) ;
 see3  =  hash_dot_wyhash__wymum ( hash_dot_wyhash__wyr8 ((byte*) p + 48 ) ^ see3 ^ hash_dot_wyhash__wyp3 , hash_dot_wyhash__wyr8 ((byte*) p + 56 ) ^ see3 ^ hash_dot_wyhash__wyp0 ) ;
 p  = (byte*) p + 64 ;
 }
 ;
return  hash_dot_wyhash__wymum ( seed ^ see1 ^ see2 , see3 ^ len ^ hash_dot_wyhash__wyp4 ) ;
 }
 static inline u64 hash_dot_wyhash__wyrotr (u64 v, u32 k) {
return  ( v  >>  k ) | ( v  <<  ( 64 - k ) ) ;
 }
 static inline u64 hash_dot_wyhash__wymum (u64 a, u64 b) {
u32 mask32= ((u32)( 4294967295 ) ) ;
u64 x0= a & mask32 ;
u64 x1= a  >>  32 ;
u64 y0= b & mask32 ;
u64 y1= b  >>  32 ;
u64 w0= x0 * y0 ;
u64 t= x1 * y0 + ( w0  >>  32 ) ;
u64 w1= t & mask32 ;
u64 w2= t  >>  32 ;
 w1  +=  x0 * y1 ;
u64 hi= x1 * y1 + w2 + ( w1  >>  32 ) ;
u64 lo= a * b ;
return  hi ^ lo ;
 }
 static inline u64 hash_dot_wyhash__wyr3 (byte* p, u64 k) {
return  ( ((u64)( p [/*ptr!*/ 0 ]/*rbyte 0*/ ) )  <<  16 ) | ( ((u64)( p [/*ptr!*/ k  >>  1 ]/*rbyte 0*/ ) )  <<  8 ) | ((u64)( p [/*ptr!*/ k - 1 ]/*rbyte 0*/ ) ) ;
 }
 static inline u64 hash_dot_wyhash__wyr4 (byte* p) {
return  ((u32)( p [/*ptr!*/ 0 ]/*rbyte 0*/ ) ) | ( ((u32)( p [/*ptr!*/ 1 ]/*rbyte 0*/ ) )  <<  ((u32)( 8 ) ) ) | ( ((u32)( p [/*ptr!*/ 2 ]/*rbyte 0*/ ) )  <<  ((u32)( 16 ) ) ) | ( ((u32)( p [/*ptr!*/ 3 ]/*rbyte 0*/ ) )  <<  ((u32)( 24 ) ) ) ;
 }
 static inline u64 hash_dot_wyhash__wyr8 (byte* p) {
return  ((u64)( p [/*ptr!*/ 0 ]/*rbyte 0*/ ) ) | ( ((u64)( p [/*ptr!*/ 1 ]/*rbyte 0*/ ) )  <<  8 ) | ( ((u64)( p [/*ptr!*/ 2 ]/*rbyte 0*/ ) )  <<  16 ) | ( ((u64)( p [/*ptr!*/ 3 ]/*rbyte 0*/ ) )  <<  24 ) | ( ((u64)( p [/*ptr!*/ 4 ]/*rbyte 0*/ ) )  <<  32 ) | ( ((u64)( p [/*ptr!*/ 5 ]/*rbyte 0*/ ) )  <<  40 ) | ( ((u64)( p [/*ptr!*/ 6 ]/*rbyte 0*/ ) )  <<  48 ) | ( ((u64)( p [/*ptr!*/ 7 ]/*rbyte 0*/ ) )  <<  56 ) ;
 }
 _V_MulRet_u32_V_u32_V_u32 strconv__lsr96 (u32 s2, u32 s1, u32 s0) {
u32 r0= ((u32)( 0 ) ) ;
u32 r1= ((u32)( 0 ) ) ;
u32 r2= ((u32)( 0 ) ) ;
 r0  =  ( s0  >>  1 ) | ( ( s1 & ((u32)( 1 ) ) )  <<  31 ) ;
 r1  =  ( s1  >>  1 ) | ( ( s2 & ((u32)( 1 ) ) )  <<  31 ) ;
 r2  =  s2  >>  1 ;
return (_V_MulRet_u32_V_u32_V_u32){.var_0=r2,.var_1=r1,.var_2=r0} ;
 }
 _V_MulRet_u32_V_u32_V_u32 strconv__lsl96 (u32 s2, u32 s1, u32 s0) {
u32 r0= ((u32)( 0 ) ) ;
u32 r1= ((u32)( 0 ) ) ;
u32 r2= ((u32)( 0 ) ) ;
 r2  =  ( s2  <<  1 ) | ( ( s1 & ( ((u32)( 1 ) )  <<  31 ) )  >>  31 ) ;
 r1  =  ( s1  <<  1 ) | ( ( s0 & ( ((u32)( 1 ) )  <<  31 ) )  >>  31 ) ;
 r0  =  s0  <<  1 ;
return (_V_MulRet_u32_V_u32_V_u32){.var_0=r2,.var_1=r1,.var_2=r0} ;
 }
 _V_MulRet_u32_V_u32_V_u32 strconv__add96 (u32 s2, u32 s1, u32 s0, u32 d2, u32 d1, u32 d0) {
u64 w= ((u64)( 0 ) ) ;
u32 r0= ((u32)( 0 ) ) ;
u32 r1= ((u32)( 0 ) ) ;
u32 r2= ((u32)( 0 ) ) ;
 w  =  ((u64)( s0 ) ) + ((u64)( d0 ) ) ;
 r0  =  ((u32)( w ) ) ;
 w  >>=  32 ;
 w  +=  ((u64)( s1 ) ) + ((u64)( d1 ) ) ;
 r1  =  ((u32)( w ) ) ;
 w  >>=  32 ;
 w  +=  ((u64)( s2 ) ) + ((u64)( d2 ) ) ;
 r2  =  ((u32)( w ) ) ;
return (_V_MulRet_u32_V_u32_V_u32){.var_0=r2,.var_1=r1,.var_2=r0} ;
 }
 _V_MulRet_u32_V_u32_V_u32 strconv__sub96 (u32 s2, u32 s1, u32 s0, u32 d2, u32 d1, u32 d0) {
u64 w= ((u64)( 0 ) ) ;
u32 r0= ((u32)( 0 ) ) ;
u32 r1= ((u32)( 0 ) ) ;
u32 r2= ((u32)( 0 ) ) ;
 w  =  ((u64)( s0 ) ) - ((u64)( d0 ) ) ;
 r0  =  ((u32)( w ) ) ;
 w  >>=  32 ;
 w  +=  ((u64)( s1 ) ) - ((u64)( d1 ) ) ;
 r1  =  ((u32)( w ) ) ;
 w  >>=  32 ;
 w  +=  ((u64)( s2 ) ) - ((u64)( d2 ) ) ;
 r2  =  ((u32)( w ) ) ;
return (_V_MulRet_u32_V_u32_V_u32){.var_0=r2,.var_1=r1,.var_2=r0} ;
 }
 bool strconv__is_digit (byte x) {
return  ( x >= strconv__ZERO  &&  x <= strconv__NINE ) == 1 ;
 }
 bool strconv__is_space (byte x) {
return  ( ( x >= 0x89  &&  x <= 0x13 )  ||  x == 0x20 ) == 1 ;
 }
 bool strconv__is_exp (byte x) {
return  ( x == 'E'  ||  x == 'e' ) == 1 ;
 }
 _V_MulRet_int_V_strconv__PrepNumber strconv__parser (string s) {
int state= strconv__fsm_a ;
int digx= 0 ;
byte c= ' ' ;
int result= strconv__parser_ok ;
bool expneg= 0 ;
int expexp= 0 ;
int i= 0 ;
strconv__PrepNumber pn= (strconv__PrepNumber) { .negative =   0 , .exponent =   0 , .mantissa =   ((u64)( 0 ) ) } ;
 while ( state != strconv__FSM_STOP ) {
  
 int tmp1 =  state; 

 if ( tmp1 ==  strconv__fsm_a ) { 
 if ( strconv__is_space ( c ) == 1 ) {
 c  =  string_at( s ,  i ++) ;
 }
  else { 
 state  =  strconv__fsm_b ;
 }
 ;
 }
 else  if ( tmp1 ==  strconv__fsm_b ) { 
 state  =  strconv__fsm_c ;
 if ( c == strconv__PLUS ) {
 c  =  string_at( s ,  i ++) ;
 }
  else  if ( c == strconv__MINUS ) {
 pn .negative  =  1 ;
 c  =  string_at( s ,  i ++) ;
 }
  else  if ( strconv__is_digit ( c ) ) {
 }
  else  if ( c == strconv__DPOINT ) {
 }
  else { 
 state  =  strconv__FSM_STOP ;
 }
 ;
 }
 else  if ( tmp1 ==  strconv__fsm_c ) { 
 if ( c == strconv__ZERO ) {
 c  =  string_at( s ,  i ++) ;
 }
  else  if ( c == strconv__DPOINT ) {
 c  =  string_at( s ,  i ++) ;
 state  =  strconv__fsm_d ;
 }
  else { 
 state  =  strconv__fsm_e ;
 }
 ;
 }
 else  if ( tmp1 ==  strconv__fsm_d ) { 
 if ( c == strconv__ZERO ) {
 c  =  string_at( s ,  i ++) ;
 if ( pn .exponent > - 2147483647 ) {
 pn .exponent -- ;
 }
 ;
 }
  else { 
 state  =  strconv__fsm_f ;
 }
 ;
 }
 else  if ( tmp1 ==  strconv__fsm_e ) { 
 if ( strconv__is_digit ( c ) ) {
 if ( digx < strconv__DIGITS ) {
 pn .mantissa  *=  10 ;
 pn .mantissa  +=  ((u64)( c - strconv__ZERO ) ) ;
 digx ++ ;
 }
  else  if ( pn .exponent < 2147483647 ) {
 pn .exponent ++ ;
 }
 ;
 c  =  string_at( s ,  i ++) ;
 }
  else  if ( c == strconv__DPOINT ) {
 c  =  string_at( s ,  i ++) ;
 state  =  strconv__fsm_f ;
 }
  else { 
 state  =  strconv__fsm_f ;
 }
 ;
 }
 else  if ( tmp1 ==  strconv__fsm_f ) { 
 if ( strconv__is_digit ( c ) ) {
 if ( digx < strconv__DIGITS ) {
 pn .mantissa  *=  10 ;
 pn .mantissa  +=  ((u64)( c - strconv__ZERO ) ) ;
 pn .exponent -- ;
 digx ++ ;
 }
 ;
 c  =  string_at( s ,  i ++) ;
 }
  else  if ( strconv__is_exp ( c ) ) {
 c  =  string_at( s ,  i ++) ;
 state  =  strconv__fsm_g ;
 }
  else { 
 state  =  strconv__fsm_g ;
 }
 ;
 }
 else  if ( tmp1 ==  strconv__fsm_g ) { 
 if ( c == strconv__PLUS ) {
 c  =  string_at( s ,  i ++) ;
 }
  else  if ( c == strconv__MINUS ) {
 expneg  =  1 ;
 c  =  string_at( s ,  i ++) ;
 }
 ;
 state  =  strconv__fsm_h ;
 }
 else  if ( tmp1 ==  strconv__fsm_h ) { 
 if ( c == strconv__ZERO ) {
 c  =  string_at( s ,  i ++) ;
 }
  else { 
 state  =  strconv__fsm_i ;
 }
 ;
 }
 else  if ( tmp1 ==  strconv__fsm_i ) { 
 if ( strconv__is_digit ( c ) ) {
 if ( expexp < 214748364 ) {
 expexp  *=  10 ;
 expexp  +=  ((int)( c - strconv__ZERO ) ) ;
 }
 ;
 c  =  string_at( s ,  i ++) ;
 }
  else { 
 state  =  strconv__FSM_STOP ;
 }
 ;
 }
 else // default:
 { 
 }
 ;
 if ( i >= s .len ) {
 state  =  strconv__FSM_STOP ;
 }
 ;
 }
 ;
 if ( expneg ) {
 expexp  =  - expexp ;
 }
 ;
 pn .exponent  +=  expexp ;
 if ( pn .mantissa == 0 ) {
 if ( pn .negative ) {
 result  =  strconv__parser_mzero ;
 }
  else { 
 result  =  strconv__parser_pzero ;
 }
 ;
 }
  else  if ( ( pn .exponent > 309 ) ) {
 if ( pn .negative ) {
 result  =  strconv__parser_minf ;
 }
  else { 
 result  =  strconv__parser_pinf ;
 }
 ;
 }
  else  if ( pn .exponent < - 328 ) {
 if ( pn .negative ) {
 result  =  strconv__parser_mzero ;
 }
  else { 
 result  =  strconv__parser_pzero ;
 }
 ;
 }
 ;
return (_V_MulRet_int_V_strconv__PrepNumber){.var_0=result,.var_1=pn} ;
 }
 u64 strconv__converter (strconv__PrepNumber* pn) {
int binexp= 92 ;
u32 s2= ((u32)( 0 ) ) ;
u32 s1= ((u32)( 0 ) ) ;
u32 s0= ((u32)( 0 ) ) ;
u32 q2= ((u32)( 0 ) ) ;
u32 q1= ((u32)( 0 ) ) ;
u32 q0= ((u32)( 0 ) ) ;
u32 r2= ((u32)( 0 ) ) ;
u32 r1= ((u32)( 0 ) ) ;
u32 r0= ((u32)( 0 ) ) ;
u32 mask28= ((u32)( 0xF  <<  28 ) ) ;
u64 result= ((u64)( 0 ) ) ;
 s0  =  ((u32)( pn ->mantissa & ((u64)( 0x00000000FFFFFFFF ) ) ) ) ;
 s1  =  ((u32)( pn ->mantissa  >>  32 ) ) ;
 s2  =  ((u32)( 0 ) ) ;
 while ( pn ->exponent > 0 ) {
 
_V_MulRet_u32_V_u32_V_u32 _V_mret_1328_q2_q1_q0= strconv__lsl96 ( s2 , s1 , s0 ) ;
 q2 = _V_mret_1328_q2_q1_q0.var_0 ;
 q1 = _V_mret_1328_q2_q1_q0.var_1 ;
 q0 = _V_mret_1328_q2_q1_q0.var_2 ;
_V_MulRet_u32_V_u32_V_u32 _V_mret_1342_r2_r1_r0= strconv__lsl96 ( q2 , q1 , q0 ) ;
 r2 = _V_mret_1342_r2_r1_r0.var_0 ;
 r1 = _V_mret_1342_r2_r1_r0.var_1 ;
 r0 = _V_mret_1342_r2_r1_r0.var_2 ;
_V_MulRet_u32_V_u32_V_u32 _V_mret_1356_s2_s1_s0= strconv__lsl96 ( r2 , r1 , r0 ) ;
 s2 = _V_mret_1356_s2_s1_s0.var_0 ;
 s1 = _V_mret_1356_s2_s1_s0.var_1 ;
 s0 = _V_mret_1356_s2_s1_s0.var_2 ;
_V_MulRet_u32_V_u32_V_u32 _V_mret_1370_s2_s1_s0= strconv__add96 ( s2 , s1 , s0 , q2 , q1 , q0 ) ;
 s2 = _V_mret_1370_s2_s1_s0.var_0 ;
 s1 = _V_mret_1370_s2_s1_s0.var_1 ;
 s0 = _V_mret_1370_s2_s1_s0.var_2 ;
 pn ->exponent -- ;
 while ( ( s2 & mask28 ) != 0 ) {
 
_V_MulRet_u32_V_u32_V_u32 _V_mret_1403_q2_q1_q0= strconv__lsr96 ( s2 , s1 , s0 ) ;
 q2 = _V_mret_1403_q2_q1_q0.var_0 ;
 q1 = _V_mret_1403_q2_q1_q0.var_1 ;
 q0 = _V_mret_1403_q2_q1_q0.var_2 ;
 binexp ++ ;
 s2  =  q2 ;
 s1  =  q1 ;
 s0  =  q0 ;
 }
 ;
 }
 ;
 while ( pn ->exponent < 0 ) {
 
 while ( ! ( ( s2 & ( ((u32)( 1 ) )  <<  31 ) ) != 0 ) ) {
 
_V_MulRet_u32_V_u32_V_u32 _V_mret_1456_q2_q1_q0= strconv__lsl96 ( s2 , s1 , s0 ) ;
 q2 = _V_mret_1456_q2_q1_q0.var_0 ;
 q1 = _V_mret_1456_q2_q1_q0.var_1 ;
 q0 = _V_mret_1456_q2_q1_q0.var_2 ;
 binexp -- ;
 s2  =  q2 ;
 s1  =  q1 ;
 s0  =  q0 ;
 }
 ;
 q2  =  s2 / strconv__TEN ;
 r1  =  s2 % strconv__TEN ;
 r2  =  ( s1  >>  8 ) | ( r1  <<  24 ) ;
 q1  =  r2 / strconv__TEN ;
 r1  =  r2 % strconv__TEN ;
 r2  =  ( ( s1 & ((u32)( 0xFF ) ) )  <<  16 ) | ( s0  >>  16 ) | ( r1  <<  24 ) ;
 r0  =  r2 / strconv__TEN ;
 r1  =  r2 % strconv__TEN ;
 q1  =  ( q1  <<  8 ) | ( ( r0 & ((u32)( 0x00FF0000 ) ) )  >>  16 ) ;
 q0  =  r0  <<  16 ;
 r2  =  ( s0 & ((u32)( 0xFFFF ) ) ) | ( r1  <<  16 ) ;
 q0  |=  r2 / strconv__TEN ;
 s2  =  q2 ;
 s1  =  q1 ;
 s0  =  q0 ;
 pn ->exponent ++ ;
 }
 ;
 if ( s2 != 0  ||  s1 != 0  ||  s0 != 0 ) {
 while ( ( s2 & mask28 ) == 0 ) {
 
_V_MulRet_u32_V_u32_V_u32 _V_mret_1633_q2_q1_q0= strconv__lsl96 ( s2 , s1 , s0 ) ;
 q2 = _V_mret_1633_q2_q1_q0.var_0 ;
 q1 = _V_mret_1633_q2_q1_q0.var_1 ;
 q0 = _V_mret_1633_q2_q1_q0.var_2 ;
 binexp -- ;
 s2  =  q2 ;
 s1  =  q1 ;
 s0  =  q0 ;
 }
 ;
 }
 ;
int nbit= 7 ;
u32 check_round_bit= ((u32)( 1 ) )  <<  ((u32)( nbit ) ) ;
u32 check_round_mask= ((u32)( 0xFFFFFFFF ) )  <<  ((u32)( nbit ) ) ;
 if ( ( s1 & check_round_bit ) != 0 ) {
 if ( ( s1 & ~ check_round_mask ) != 0 ) {
_V_MulRet_u32_V_u32_V_u32 _V_mret_1704_s2_s1_s0= strconv__add96 ( s2 , s1 , s0 , 0 , check_round_bit , 0 ) ;
 s2 = _V_mret_1704_s2_s1_s0.var_0 ;
 s1 = _V_mret_1704_s2_s1_s0.var_1 ;
 s0 = _V_mret_1704_s2_s1_s0.var_2 ;
 }
  else { 
 if ( ( s1 & ( check_round_bit  <<  ((u32)( 1 ) ) ) ) != 0 ) {
_V_MulRet_u32_V_u32_V_u32 _V_mret_1743_s2_s1_s0= strconv__add96 ( s2 , s1 , s0 , 0 , check_round_bit , 0 ) ;
 s2 = _V_mret_1743_s2_s1_s0.var_0 ;
 s1 = _V_mret_1743_s2_s1_s0.var_1 ;
 s0 = _V_mret_1743_s2_s1_s0.var_2 ;
 }
 ;
 }
 ;
 s1  =  s1 & check_round_mask ;
 s0  =  ((u32)( 0 ) ) ;
 if (( s2 & ( mask28  <<  ((u32)( 1 ) ) ) ) != 0 ) {
_V_MulRet_u32_V_u32_V_u32 _V_mret_1790_q2_q1_q0= strconv__lsr96 ( s2 , s1 , s0 ) ;
 q2 = _V_mret_1790_q2_q1_q0.var_0 ;
 q1 = _V_mret_1790_q2_q1_q0.var_1 ;
 q0 = _V_mret_1790_q2_q1_q0.var_2 ;
 binexp -- ;
 s2  =  q2 ;
 s1  =  q1 ;
 s0  =  q0 ;
 }
 ;
 }
 ;
 binexp  +=  1023 ;
 if ( binexp > 2046 ) {
 if ( pn ->negative ) {
 result  =  strconv__DOUBLE_MINUS_INFINITY ;
 }
  else { 
 result  =  strconv__DOUBLE_PLUS_INFINITY ;
 }
 ;
 }
  else  if ( binexp < 1 ) {
 if ( pn ->negative ) {
 result  =  strconv__DOUBLE_MINUS_ZERO ;
 }
  else { 
 result  =  strconv__DOUBLE_PLUS_ZERO ;
 }
 ;
 }
  else  if ( s2 != 0 ) {
u64 q= ((u64)( 0 ) ) ;
u64 binexs2= ((u64)( binexp ) )  <<  52 ;
 q  =  ( ((u64)( s2 & ~ mask28 ) )  <<  24 ) | ( ( ((u64)( s1 ) ) + ((u64)( 128 ) ) )  >>  8 ) | binexs2 ;
 if ( pn ->negative ) {
 q  |=  ( ((u64)( 1 ) )  <<  63 ) ;
 }
 ;
 result  =  q ;
 }
 ;
return  result ;
 }
 f64 strconv__atof64 (string s) {
strconv__PrepNumber pn= (strconv__PrepNumber) { .negative =   0 , .exponent =   0 , .mantissa =   ((u64)( 0 ) ) } ;
int res_parsing= 0 ;
strconv__Float64u res= (strconv__Float64u) { .f =  0.0 , .u =   ((u64)( 0 ) ) } ;
_V_MulRet_int_V_strconv__PrepNumber _V_mret_1961_res_parsing_pn= strconv__parser (string_add( s , tos3(" ") ) ) ;
 res_parsing = _V_mret_1961_res_parsing_pn.var_0 ;
 pn = _V_mret_1961_res_parsing_pn.var_1 ; 
 int tmp30 =  res_parsing; 

 if ( tmp30 ==  strconv__parser_ok ) { 
 res .u  =  strconv__converter (& /*114*/ pn ) ;
 }
 else  if ( tmp30 ==  strconv__parser_pzero ) { 
 res .u  =  strconv__DOUBLE_PLUS_ZERO ;
 }
 else  if ( tmp30 ==  strconv__parser_mzero ) { 
 res .u  =  strconv__DOUBLE_MINUS_ZERO ;
 }
 else  if ( tmp30 ==  strconv__parser_pinf ) { 
 res .u  =  strconv__DOUBLE_PLUS_INFINITY ;
 }
 else  if ( tmp30 ==  strconv__parser_minf ) { 
 res .u  =  strconv__DOUBLE_MINUS_INFINITY ;
 }
 else // default:
 { 
 }
 ;
return  res .f ;
 }
 byte strconv__byte_to_lower (byte c) {
return  c | ( 'x' - 'X' ) ;
 }
 u64 strconv__common_parse_uint (string s, int _base, int _bit_size, bool error_on_non_digit, bool error_on_high_digit) {
int bit_size= _bit_size ;
int base= _base ;
 if ( s .len < 1  ||  ! strconv__underscore_ok ( s ) ) {
return  ((u64)( 0 ) ) ;
 }
 ;
bool base0= base == 0 ;
int start_index= 0 ;
 if ( 2 <= base  &&  base <= 36 ) {
 }
  else  if ( base == 0 ) {
 base  =  10 ;
 if ( string_at( s ,  0) == '0' ) {
 if ( s .len >= 3  &&  strconv__byte_to_lower ( string_at( s ,  1) ) == 'b' ) {
 base  =  2 ;
 start_index  +=  2 ;
 }
  else  if ( s .len >= 3  &&  strconv__byte_to_lower ( string_at( s ,  1) ) == 'o' ) {
 base  =  8 ;
 start_index  +=  2 ;
 }
  else  if ( s .len >= 3  &&  strconv__byte_to_lower ( string_at( s ,  1) ) == 'x' ) {
 base  =  16 ;
 start_index  +=  2 ;
 }
  else  if ( s .len >= 2  &&  ( string_at( s ,  1) >= '0'  &&  string_at( s ,  1) <= '9' ) ) {
 base  =  10 ;
 start_index ++ ;
 }
  else { 
 base  =  8 ;
 start_index ++ ;
 }
 ;
 }
 ;
 }
  else { 
return  ((u64)( 0 ) ) ;
 }
 ;
 if ( bit_size == 0 ) {
 bit_size  =  strconv__int_size ;
 }
  else  if ( bit_size < 0  ||  bit_size > 64 ) {
return  ((u64)( 0 ) ) ;
 }
 ;
u64 cutoff= strconv__max_u64 / ((u64)( base ) ) + ((u64)( 1 ) ) ;
u64 max_val= (( bit_size == 64 ) ? ( strconv__max_u64 ) : ( ( ((u64)( 1 ) )  <<  ((u64)( bit_size ) ) ) - ((u64)( 1 ) ) )) ;
bool underscores= 0 ;
u64 n= ((u64)( 0 ) ) ;
 int tmp13 =  start_index;
 ;
for (int tmp14 = tmp13; tmp14 <  s .len; tmp14++) {
 int i = tmp14;
 
byte c= string_at( s ,  i) ;
byte cl= strconv__byte_to_lower ( c ) ;
byte d= ((byte)( 0 ) ) ;
 if ( c == '_'  &&  base0 ) {
 underscores  =  1 ;
 continue
 ;
 }
  else  if ( '0' <= c  &&  c <= '9' ) {
 d  =  c - '0' ;
 }
  else  if ( 'a' <= cl  &&  cl <= 'z' ) {
 d  =  cl - 'a' + 10 ;
 }
  else { 
 if ( error_on_non_digit ) {
return  ((u64)( 0 ) ) ;
 }
  else { 
 break
 ;
 }
 ;
 }
 ;
 if ( d >= ((byte)( base ) ) ) {
 if ( error_on_high_digit ) {
return  ((u64)( 0 ) ) ;
 }
  else { 
 break
 ;
 }
 ;
 }
 ;
 if ( n >= cutoff ) {
return  max_val ;
 }
 ;
 n  *=  ((u64)( base ) ) ;
u64 n1= n + ((u64)( d ) ) ;
 if ( n1 < n  ||  n1 > max_val ) {
return  max_val ;
 }
 ;
 n  =  n1 ;
 }
 ;
 if ( underscores  &&  ! strconv__underscore_ok ( s ) ) {
return  ((u64)( 0 ) ) ;
 }
 ;
return  n ;
 }
 u64 strconv__parse_uint (string s, int _base, int _bit_size) {
return  strconv__common_parse_uint ( s , _base , _bit_size , 1 , 1 ) ;
 }
 i64 strconv__common_parse_int (string _s, int base, int _bit_size, bool error_on_non_digit, bool error_on_high_digit) {
string s= _s ;
int bit_size= _bit_size ;
 if ( s .len < 1 ) {
return  ((i64)( 0 ) ) ;
 }
 ;
bool neg= 0 ;
 if ( string_at( s ,  0) == '+' ) {
 s  =  string_substr2( s ,  1 , -1, true) ;
 }
  else  if ( string_at( s ,  0) == '-' ) {
 neg  =  1 ;
 s  =  string_substr2( s ,  1 , -1, true) ;
 }
 ;
u64 un= strconv__common_parse_uint ( s , base , bit_size , error_on_non_digit , error_on_high_digit ) ;
 if ( un == 0 ) {
return  ((i64)( 0 ) ) ;
 }
 ;
 if ( bit_size == 0 ) {
 bit_size  =  strconv__int_size ;
 }
 ;
u64 cutoff= ((u64)( 1 ) )  <<  ((u64)( bit_size - 1 ) ) ;
 if ( ! neg  &&  un >= cutoff ) {
return  ((i64)( cutoff - ((u64)( 1 ) ) ) ) ;
 }
 ;
 if ( neg  &&  un > cutoff ) {
return  - ((i64)( cutoff ) ) ;
 }
 ;
return  (( neg ) ? ( - ((i64)( un ) ) ) : ( ((i64)( un ) ) )) ;
 }
 i64 strconv__parse_int (string _s, int base, int _bit_size) {
return  strconv__common_parse_int ( _s , base , _bit_size , 1 , 1 ) ;
 }
 int strconv__atoi (string s) {
 if ( ( strconv__int_size == 32  &&  ( 0 < s .len  &&  s .len < 10 ) )  ||  ( strconv__int_size == 64  &&  ( 0 < s .len  &&  s .len < 19 ) ) ) {
int start_idx= 0 ;
 if ( string_at( s ,  0) == '-'  ||  string_at( s ,  0) == '+' ) {
 start_idx ++ ;
 if ( s .len - start_idx < 1 ) {
return  0 ;
 }
 ;
 }
 ;
int n= 0 ;
 int tmp29 =  start_idx;
 ;
for (int tmp30 = tmp29; tmp30 <  s .len; tmp30++) {
 int i = tmp30;
 
byte ch= string_at( s ,  i) - '0' ;
 if ( ch > 9 ) {
return  0 ;
 }
 ;
 n  =  n * 10 + ((int)( ch ) ) ;
 }
 ;
return  (( string_at( s ,  0) == '-' ) ? ( - n ) : ( n )) ;
 }
 ;
i64 int64= strconv__parse_int ( s , 10 , 0 ) ;
return  ((int)( int64 ) ) ;
 }
 bool strconv__underscore_ok (string s) {
byte saw= '^' ;
int i= 0 ;
 if ( s .len >= 1  &&  ( string_at( s ,  0) == '-'  ||  string_at( s ,  0) == '+' ) ) {
 i ++ ;
 }
 ;
bool hex= 0 ;
 if ( s .len - i >= 2  &&  string_at( s ,  i) == '0'  &&  ( strconv__byte_to_lower ( string_at( s ,  i + 1) ) == 'b'  ||  strconv__byte_to_lower ( string_at( s ,  i + 1) ) == 'o'  ||  strconv__byte_to_lower ( string_at( s ,  i + 1) ) == 'x' ) ) {
 saw  =  '0' ;
 hex  =  strconv__byte_to_lower ( string_at( s ,  i + 1) ) == 'x' ;
 i  +=  2 ;
 }
 ;
 for (
  ;  i < s .len  ;  i ++ ) { 
 
 if ( ( '0' <= string_at( s ,  i)  &&  string_at( s ,  i) <= '9' )  ||  ( hex  &&  'a' <= strconv__byte_to_lower ( string_at( s ,  i) )  &&  strconv__byte_to_lower ( string_at( s ,  i) ) <= 'f' ) ) {
 saw  =  '0' ;
 continue
 ;
 }
 ;
 if ( string_at( s ,  i) == '_' ) {
 if ( saw != '0' ) {
return  0 ;
 }
 ;
 saw  =  '_' ;
 continue
 ;
 }
 ;
 if ( saw == '_' ) {
return  0 ;
 }
 ;
 saw  =  '!' ;
 }
 ;
return  saw != '_' ;
 }
 btree__Bnode* btree__new_bnode () {
return  (btree__Bnode*)memdup(&(btree__Bnode) { .children =  0 , .size =  0 , } , sizeof(btree__Bnode)) ;
 }
 btree__Tree btree__new_tree () {
return  (btree__Tree) { .root =  btree__new_bnode ( ) , .size =  0 } ;
 }
 void btree__Tree_set (btree__Tree* t, string key, int value) {
btree__Bnode* node= t ->root ;
int child_index= 0 ;
btree__Bnode* parent= ((btree__Bnode*)( 0 ) ) ;
 while (1) { 
 if ( node ->size == btree__max_length ) {
 if ( parent == 0 ) {
 parent  =  btree__new_bnode ( ) ;
 t ->root  =  parent ;
 }
 ;
 btree__Bnode_split_child ( parent ,  child_index , node ) ;
 if (string_eq( key , parent ->keys [ child_index ]/*rstring 1*/ ) ) {
 parent ->values [ child_index ]/*rint 1*/  =  value ;
 
 return ;
 }
 ;
 node  =  ((string_lt( key , parent ->keys [ child_index ]/*rstring 1*/ ) ) ? ( ((btree__Bnode*)( parent ->children [/*ptr!*/ child_index ]/*rvoidptr 1*/ ) ) ) : ( ((btree__Bnode*)( parent ->children [/*ptr!*/ child_index + 1 ]/*rvoidptr 1*/ ) ) )) ;
 }
 ;
int i= 0 ;
 while ( i < node ->size  && string_gt( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 
 i ++ ;
 }
 ;
 if ( i != node ->size  && string_eq( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 node ->values [ i ]/*rint 1*/  =  value ;
 
 return ;
 }
 ;
 if ( node ->children == 0 ) {
int j= node ->size - 1 ;
 while ( j >= 0  && string_lt( key , node ->keys [ j ]/*rstring 1*/ ) ) {
 
 node ->keys [ j + 1 ]/*rstring 1*/  =  node ->keys [ j ]/*rstring 1*/ ;
 node ->values [ j + 1 ]/*rint 1*/  =  node ->values [ j ]/*rint 1*/ ;
 j -- ;
 }
 ;
 node ->keys [ j + 1 ]/*rstring 1*/  =  key ;
 node ->values [ j + 1 ]/*rint 1*/  =  value ;
 node ->size ++ ;
 t ->size ++ ;
 
 return ;
 }
 ;
 parent  =  node ;
 child_index  =  i ;
 node  =  ((btree__Bnode*)( node ->children [/*ptr!*/ child_index ]/*rvoidptr 1*/ ) ) ;
 }
 ;
 }
 void btree__Bnode_split_child (btree__Bnode* n, int child_index, btree__Bnode* y) {
btree__Bnode* z= btree__new_bnode ( ) ;
 z ->size  =  btree__mid_index ;
 y ->size  =  btree__mid_index ;
 for (
int j= btree__mid_index - 1  ;  j >= 0  ;  j -- ) { 
 
 z ->keys [ j ]/*rstring 1*/  =  y ->keys [ j + btree__degree ]/*rstring 1*/ ;
 z ->values [ j ]/*rint 1*/  =  y ->values [ j + btree__degree ]/*rint 1*/ ;
 }
 ;
 if ( y ->children != 0 ) {
 z ->children  =  ((voidptr*)( v_malloc ( btree__children_size ) ) ) ;
 for (
int j= btree__degree - 1  ;  j >= 0  ;  j -- ) { 
 
 z ->children [/*ptr!*/ j ]/*rvoidptr 1*/  =  y ->children [/*ptr!*/ j + btree__degree ]/*rvoidptr 1*/ ;
 }
 ;
 }
 ;
 if ( n ->children == 0 ) {
 n ->children  =  ((voidptr*)( v_malloc ( btree__children_size ) ) ) ;
 }
 ;
 n ->children [/*ptr!*/ n ->size + 1 ]/*rvoidptr 1*/  =  n ->children [/*ptr!*/ n ->size ]/*rvoidptr 1*/ ;
 for (
int j= n ->size  ;  j > child_index  ;  j -- ) { 
 
 n ->keys [ j ]/*rstring 1*/  =  n ->keys [ j - 1 ]/*rstring 1*/ ;
 n ->values [ j ]/*rint 1*/  =  n ->values [ j - 1 ]/*rint 1*/ ;
 n ->children [/*ptr!*/ j ]/*rvoidptr 1*/  =  n ->children [/*ptr!*/ j - 1 ]/*rvoidptr 1*/ ;
 }
 ;
 n ->keys [ child_index ]/*rstring 1*/  =  y ->keys [ btree__mid_index ]/*rstring 1*/ ;
 n ->values [ child_index ]/*rint 1*/  =  y ->values [ btree__mid_index ]/*rint 1*/ ;
 n ->children [/*ptr!*/ child_index ]/*rvoidptr 1*/  =  ((voidptr)( y ) ) ;
 n ->children [/*ptr!*/ child_index + 1 ]/*rvoidptr 1*/  =  ((voidptr)( z ) ) ;
 n ->size ++ ;
 }
 int btree__Tree_get (btree__Tree t, string key) {
btree__Bnode* node= t .root ;
 while (1) { 
int i= node ->size - 1 ;
 while ( i >= 0  && string_lt( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 
 i -- ;
 }
 ;
 if ( i != - 1  && string_eq( key , node ->keys [ i ]/*rstring 1*/ ) ) {
return  node ->values [ i ]/*rint 1*/ ;
 }
 ;
 if ( node ->children == 0 ) {
 break
 ;
 }
 ;
 node  =  ((btree__Bnode*)( node ->children [/*ptr!*/ i + 1 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
return  0 ;
 }
 bool btree__Tree_exists (btree__Tree t, string key) {
btree__Bnode* node= t .root ;
 while (1) { 
int i= node ->size - 1 ;
 while ( i >= 0  && string_lt( key , node ->keys [ i ]/*rstring 1*/ ) ) {
 
 i -- ;
 }
 ;
 if ( i != - 1  && string_eq( key , node ->keys [ i ]/*rstring 1*/ ) ) {
return  1 ;
 }
 ;
 if ( node ->children == 0 ) {
 break
 ;
 }
 ;
 node  =  ((btree__Bnode*)( node ->children [/*ptr!*/ i + 1 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
return  0 ;
 }
 int btree__Bnode_find_key (btree__Bnode n, string k) {
int idx= 0 ;
 while ( idx < n .size  && string_lt( n .keys [ idx ]/*rstring 0*/ , k ) ) {
 
 idx ++ ;
 }
 ;
return  idx ;
 }
 bool btree__Bnode_remove_key (btree__Bnode* n, string k) {
int idx= btree__Bnode_find_key (* n ,  k ) ;
 if ( idx < n ->size  && string_eq( n ->keys [ idx ]/*rstring 1*/ , k ) ) {
 if ( n ->children == 0 ) {
 btree__Bnode_remove_from_leaf ( n ,  idx ) ;
 }
  else { 
 btree__Bnode_remove_from_non_leaf ( n ,  idx ) ;
 }
 ;
return  1 ;
 }
  else { 
 if ( n ->children == 0 ) {
return  0 ;
 }
 ;
bool flag= (( idx == n ->size ) ? ( 1 ) : ( 0 )) ;
 if ( ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ->size < btree__degree ) {
 btree__Bnode_fill ( n ,  idx ) ;
 }
 ;
 if ( flag  &&  idx > n ->size ) {
return  btree__Bnode_remove_key ( ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx - 1 ]/*rvoidptr 1*/ ) ) ) ,  k ) ;
 }
  else { 
return  btree__Bnode_remove_key ( ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ,  k ) ;
 }
 ;
 }
 ;
 }
 void btree__Bnode_remove_from_leaf (btree__Bnode* n, int idx) {
 for (
int i= idx + 1  ;  i < n ->size  ;  i ++ ) { 
 
 n ->keys [ i - 1 ]/*rstring 1*/  =  n ->keys [ i ]/*rstring 1*/ ;
 n ->values [ i - 1 ]/*rint 1*/  =  n ->values [ i ]/*rint 1*/ ;
 }
 ;
 n ->size -- ;
 }
 void btree__Bnode_remove_from_non_leaf (btree__Bnode* n, int idx) {
string k= n ->keys [ idx ]/*rstring 1*/ ;
 if ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ->size >= btree__degree ) {
btree__Bnode* current= ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
 while ( current ->children != 0 ) {
 
 current  =  ((btree__Bnode*)( current ->children [/*ptr!*/ current ->size ]/*rvoidptr 1*/ ) ) ;
 }
 ;
string predecessor= current ->keys [ current ->size - 1 ]/*rstring 1*/ ;
 n ->keys [ idx ]/*rstring 1*/  =  predecessor ;
 n ->values [ idx ]/*rint 1*/  =  current ->values [ current ->size - 1 ]/*rint 1*/ ;
 btree__Bnode_remove_key ( ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ,  predecessor ) ; 
 }
  else  if ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ->size >= btree__degree ) {
btree__Bnode* current= ((btree__Bnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ;
 while ( current ->children != 0 ) {
 
 current  =  ((btree__Bnode*)( current ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
string successor= current ->keys [ 0 ]/*rstring 1*/ ;
 n ->keys [ idx ]/*rstring 1*/  =  successor ;
 n ->values [ idx ]/*rint 1*/  =  current ->values [ 0 ]/*rint 1*/ ;
 btree__Bnode_remove_key ( ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ) ,  successor ) ; 
 }
  else { 
 btree__Bnode_merge ( n ,  idx ) ;
 btree__Bnode_remove_key ( ( ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ) ,  k ) ; 
 }
 ;
 }
 void btree__Bnode_fill (btree__Bnode* n, int idx) {
 if ( idx != 0  &&  ((btree__Bnode*)( n ->children [/*ptr!*/ idx - 1 ]/*rvoidptr 1*/ ) ) ->size >= btree__degree ) {
 btree__Bnode_borrow_from_prev ( n ,  idx ) ;
 }
  else  if ( idx != n ->size  &&  ((btree__Bnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ->size >= btree__degree ) {
 btree__Bnode_borrow_from_next ( n ,  idx ) ;
 }
  else  if ( idx != n ->size ) {
 btree__Bnode_merge ( n ,  idx ) ;
 }
  else { 
 btree__Bnode_merge ( n ,  idx - 1 ) ;
 }
 ;
 }
 void btree__Bnode_borrow_from_prev (btree__Bnode* n, int idx) {
btree__Bnode* child= ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
btree__Bnode* sibling= ((btree__Bnode*)( n ->children [/*ptr!*/ idx - 1 ]/*rvoidptr 1*/ ) ) ;
 for (
int i= child ->size - 1  ;  i >= 0  ;  i -- ) { 
 
 child ->keys [ i + 1 ]/*rstring 1*/  =  child ->keys [ i ]/*rstring 1*/ ;
 child ->values [ i + 1 ]/*rint 1*/  =  child ->values [ i ]/*rint 1*/ ;
 }
 ;
 if ( child ->children != 0 ) {
 for (
int i= child ->size  ;  i >= 0  ;  i -- ) { 
 
 child ->children [/*ptr!*/ i + 1 ]/*rvoidptr 1*/  =  child ->children [/*ptr!*/ i ]/*rvoidptr 1*/ ;
 }
 ;
 }
 ;
 child ->keys [ 0 ]/*rstring 1*/  =  n ->keys [ idx - 1 ]/*rstring 1*/ ;
 child ->values [ 0 ]/*rint 1*/  =  n ->values [ idx - 1 ]/*rint 1*/ ;
 if ( child ->children != 0 ) {
 child ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ sibling ->size ]/*rvoidptr 1*/ ;
 }
 ;
 n ->keys [ idx - 1 ]/*rstring 1*/  =  sibling ->keys [ sibling ->size - 1 ]/*rstring 1*/ ;
 n ->values [ idx - 1 ]/*rint 1*/  =  sibling ->values [ sibling ->size - 1 ]/*rint 1*/ ;
 child ->size ++ ;
 sibling ->size -- ;
 }
 void btree__Bnode_borrow_from_next (btree__Bnode* n, int idx) {
btree__Bnode* child= ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
btree__Bnode* sibling= ((btree__Bnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ;
 child ->keys [ child ->size ]/*rstring 1*/  =  n ->keys [ idx ]/*rstring 1*/ ;
 child ->values [ child ->size ]/*rint 1*/  =  n ->values [ idx ]/*rint 1*/ ;
 if ( child ->children != 0 ) {
 child ->children [/*ptr!*/ child ->size + 1 ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/ ;
 }
 ;
 n ->keys [ idx ]/*rstring 1*/  =  sibling ->keys [ 0 ]/*rstring 1*/ ;
 n ->values [ idx ]/*rint 1*/  =  sibling ->values [ 0 ]/*rint 1*/ ;
 for (
int i= 1  ;  i < sibling ->size  ;  i ++ ) { 
 
 sibling ->keys [ i - 1 ]/*rstring 1*/  =  sibling ->keys [ i ]/*rstring 1*/ ;
 sibling ->values [ i - 1 ]/*rint 1*/  =  sibling ->values [ i ]/*rint 1*/ ;
 }
 ;
 if ( sibling ->children != 0 ) {
 for (
int i= 1  ;  i <= sibling ->size  ;  i ++ ) { 
 
 sibling ->children [/*ptr!*/ i - 1 ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ i ]/*rvoidptr 1*/ ;
 }
 ;
 }
 ;
 child ->size ++ ;
 sibling ->size -- ;
 }
 void btree__Bnode_merge (btree__Bnode* n, int idx) {
btree__Bnode* child= ((btree__Bnode*)( n ->children [/*ptr!*/ idx ]/*rvoidptr 1*/ ) ) ;
btree__Bnode* sibling= ((btree__Bnode*)( n ->children [/*ptr!*/ idx + 1 ]/*rvoidptr 1*/ ) ) ;
 child ->keys [ btree__min_length ]/*rstring 1*/  =  n ->keys [ idx ]/*rstring 1*/ ;
 child ->values [ btree__min_length ]/*rint 1*/  =  n ->values [ idx ]/*rint 1*/ ;
 for (
int i= 0  ;  i < sibling ->size  ;  i ++ ) { 
 
 child ->keys [ i + btree__degree ]/*rstring 1*/  =  sibling ->keys [ i ]/*rstring 0*/ ;
 child ->values [ i + btree__degree ]/*rint 1*/  =  sibling ->values [ i ]/*rint 0*/ ;
 }
 ;
 if ( child ->children != 0 ) {
 for (
int i= 0  ;  i <= sibling ->size  ;  i ++ ) { 
 
 child ->children [/*ptr!*/ i + btree__degree ]/*rvoidptr 1*/  =  sibling ->children [/*ptr!*/ i ]/*rvoidptr 0*/ ;
 }
 ;
 }
 ;
 for (
int i= idx + 1  ;  i < n ->size  ;  i ++ ) { 
 
 n ->keys [ i - 1 ]/*rstring 1*/  =  n ->keys [ i ]/*rstring 1*/ ;
 n ->values [ i - 1 ]/*rint 1*/  =  n ->values [ i ]/*rint 1*/ ;
 }
 ;
 for (
int i= idx + 2  ;  i <= n ->size  ;  i ++ ) { 
 
 n ->children [/*ptr!*/ i - 1 ]/*rvoidptr 1*/  =  n ->children [/*ptr!*/ i ]/*rvoidptr 1*/ ;
 }
 ;
 child ->size  +=  sibling ->size + 1 ;
 n ->size -- ;
 }
 void btree__Tree_delete (btree__Tree* t, string k) {
 if ( t ->root ->size == 0 ) {
 
 return ;
 }
 ;
bool removed= btree__Bnode_remove_key ( t ->root ,  k ) ;
 if ( removed ) {
 t ->size -- ;
 }
 ;
 if ( t ->root ->size == 0 ) {
 if ( t ->root ->children == 0 ) {
 
 return ;
 }
  else { 
 t ->root  =  ((btree__Bnode*)( t ->root ->children [/*ptr!*/ 0 ]/*rvoidptr 1*/ ) ) ;
 }
 ;
 }
 ;
 }
 void btree__Bnode_free (btree__Bnode n) {
 if ( ! isnil ( n .children ) ) {
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  n .size + 1; tmp2++) {
 int i = tmp2;
 
 btree__Bnode_free (* ((btree__Bnode*)( n .children [/*ptr!*/ i ]/*rvoidptr 0*/ ) ) ) ; 
 }
 ;
 }
 ;
 v_free ( n .children ) ;
 v_free (& /*112 e="void*" g="btree__Bnode" */ n ) ;
 }
 void btree__Tree_free (btree__Tree t) {
 if ( isnil ( t .root ) ) {
 
 return ;
 }
 ;
 btree__Bnode_free (* t .root ) ;
 }
 int btree__Bnode_subkeys (btree__Bnode n, array_string* keys, int at) {
int position= at ;
 if ( ( n .children != 0 ) ) {
 int tmp3 =  0;
 ;
for (int tmp4 = tmp3; tmp4 <  n .size; tmp4++) {
 int i = tmp4;
 
btree__Bnode* child= ((btree__Bnode*)( n .children [/*ptr!*/ i ]/*rvoidptr 0*/ ) ) ;
 position  +=  btree__Bnode_subkeys (* child ,  keys , position ) ;
array_set( keys , position , & (string []) {  n .keys [ i ]/*rstring 0*/ }) ;
 position ++ ;
 }
 ;
btree__Bnode* child= ((btree__Bnode*)( n .children [/*ptr!*/ n .size ]/*rvoidptr 0*/ ) ) ;
 position  +=  btree__Bnode_subkeys (* child ,  keys , position ) ;
 }
  else { 
 int tmp5 =  0;
 ;
for (int tmp6 = tmp5; tmp6 <  n .size; tmp6++) {
 int i = tmp6;
 
array_set( keys , position + i , & (string []) {  n .keys [ i ]/*rstring 0*/ }) ;
 }
 ;
 position  +=  n .size ;
 }
 ;
return  position - at ;
 }
 array_string btree__Tree_keys (btree__Tree t) {
array_string keys= array_repeat (new_array_from_c_array(1, 1, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 1 ) {  tos3("")  }) ,  t .size ) ;
 if ( ( t .root ->size == 0 ) ) {
return  keys ;
 }
 ;
 btree__Bnode_subkeys (* t .root , & /*111*/ (array[]){ keys }[0]  , 0 ) ;
return  keys ;
 }
 rand__Pcg32 rand__new_pcg32 (u64 initstate, u64 initseq) {
rand__Pcg32 rng= (rand__Pcg32) { .state =  0 , .inc =  0 } ;
 rng .state  =  ((u64)( 0 ) ) ;
 rng .inc  =  ( initseq  <<  ((u64)( 1 ) ) ) | ((u64)( 1 ) ) ;
 rand__Pcg32_next (& /* ? */ rng ) ;
 rng .state  +=  initstate ;
 rand__Pcg32_next (& /* ? */ rng ) ;
return  rng ;
 }
 static inline u32 rand__Pcg32_next (rand__Pcg32* rng) {
u64 oldstate= rng ->state ;
 rng ->state  =  oldstate * ( 6364136223846793005 ) + rng ->inc ;
u32 xorshifted= ((u32)( ( ( oldstate  >>  ((u64)( 18 ) ) ) ^ oldstate )  >>  ((u64)( 27 ) ) ) ) ;
u32 rot= ((u32)( oldstate  >>  ((u64)( 59 ) ) ) ) ;
return  ( ( xorshifted  >>  rot ) | ( xorshifted  <<  ( ( - rot ) & ((u32)( 31 ) ) ) ) ) ;
 }
 static inline u32 rand__Pcg32_bounded_next (rand__Pcg32* rng, u32 bound) {
u32 threshold= ( - bound % bound ) ;
 while (1) { 
u32 r= rand__Pcg32_next ( rng ) ;
 if ( r >= threshold ) {
return  ( r % bound ) ;
 }
 ;
 }
 ;
return  ((u32)( 0 ) ) ;
 }
 void rand__seed (int s) {
 srand ( s ) ;
 }
 int rand__next (int max) {
return  rand ( ) % max ;
 }
 int rand__rand_r (int* seed) {
 {
int* rs= seed ;
int ns= ( * rs * 1103515245 + 12345 ) ;
 * rs  =  ns ; 
return  ns & 0x7fffffff ;
 }
 ;
 }
 rand__Splitmix64 rand__new_splitmix64 (u64 seed) {
return  (rand__Splitmix64) { seed } ;
 }
 static inline u64 rand__Splitmix64_next (rand__Splitmix64* rng) {
 rng ->state  +=  ( 0x9e3779b97f4a7c15 ) ;
u64 z= rng ->state ;
 z  =  ( z ^ ( ( z  >>  ((u64)( 30 ) ) ) ) ) * ( 0xbf58476d1ce4e5b9 ) ;
 z  =  ( z ^ ( ( z  >>  ((u64)( 27 ) ) ) ) ) * ( 0x94d049bb133111eb ) ;
return  z ^ ( z  >>  ( 31 ) ) ;
 }
 static inline u64 rand__Splitmix64_bounded_next (rand__Splitmix64* rng, u64 bound) {
u64 threshold= - bound % bound ;
 while (1) { 
u64 r= rand__Splitmix64_next ( rng ) ;
 if ( r >= threshold ) {
return  r % bound ;
 }
 ;
 }
 ;
return  ((u64)( 0 ) ) ;
 }
 string time__Time_format (time__Time t) {
return  time__Time_get_fmt_str ( t ,  time__time__FormatDelimiter_hyphen , time__time__FormatTime_hhmm24 , time__time__FormatDate_yyyymmdd ) ;
 }
 string time__Time_format_ss (time__Time t) {
return  time__Time_get_fmt_str ( t ,  time__time__FormatDelimiter_hyphen , time__time__FormatTime_hhmmss24 , time__time__FormatDate_yyyymmdd ) ;
 }
 string time__Time_hhmm (time__Time t) {
return  time__Time_get_fmt_time_str ( t ,  time__time__FormatTime_hhmm24 ) ;
 }
 string time__Time_hhmmss (time__Time t) {
return  time__Time_get_fmt_time_str ( t ,  time__time__FormatTime_hhmmss24 ) ;
 }
 string time__Time_hhmm12 (time__Time t) {
return  time__Time_get_fmt_time_str ( t ,  time__time__FormatTime_hhmm12 ) ;
 }
 string time__Time_ymmdd (time__Time t) {
return  time__Time_get_fmt_date_str ( t ,  time__time__FormatDelimiter_hyphen , time__time__FormatDate_yyyymmdd ) ;
 }
 string time__Time_ddmmy (time__Time t) {
return  time__Time_get_fmt_date_str ( t ,  time__time__FormatDelimiter_dot , time__time__FormatDate_ddmmyyyy ) ;
 }
 string time__Time_md (time__Time t) {
return  time__Time_get_fmt_date_str ( t ,  time__time__FormatDelimiter_space , time__time__FormatDate_mmmd ) ;
 }
 string time__Time_clean (time__Time t) {
time__Time now= time__now ( ) ;
 if ( t .month == now .month  &&  t .year == now .year  &&  t .day == now .day ) {
return  time__Time_get_fmt_time_str ( t ,  time__time__FormatTime_hhmm24 ) ;
 }
 ;
 if ( t .year == now .year ) {
return  time__Time_get_fmt_str ( t ,  time__time__FormatDelimiter_space , time__time__FormatTime_hhmm24 , time__time__FormatDate_mmmd ) ;
 }
 ;
return  time__Time_format ( t ) ;
 }
 string time__Time_clean12 (time__Time t) {
time__Time now= time__now ( ) ;
 if ( t .month == now .month  &&  t .year == now .year  &&  t .day == now .day ) {
return  time__Time_get_fmt_time_str ( t ,  time__time__FormatTime_hhmm12 ) ;
 }
 ;
 if ( t .year == now .year ) {
return  time__Time_get_fmt_str ( t ,  time__time__FormatDelimiter_space , time__time__FormatTime_hhmm12 , time__time__FormatDate_mmmd ) ;
 }
 ;
return  time__Time_format ( t ) ;
 }
 string time__Time_get_fmt_time_str (time__Time t, time__FormatTime fmt_time) {
 if ( fmt_time == time__time__FormatTime_no_time ) {
return  tos3("") ;
 }
 ;
string tp= (( t .hour > 11 ) ? ( tos3("p.m.") ) : ( tos3("a.m.") )) ;
int hour= (( t .hour > 12 ) ? ( t .hour - 12 ) : ( (( t .hour == 0 ) ? ( 12 ) : ( t .hour )))) ; 
 time__FormatTime tmp1 =  fmt_time; 

return  ( ( tmp1 ==  time__time__FormatTime_hhmm12 ) ? ( _STR("%d:%02d %.*s", hour, t .minute, tp.len, tp.str) ) : ( ( tmp1 ==  time__time__FormatTime_hhmm24 ) ? ( _STR("%02d:%02d", t .hour, t .minute) ) : ( ( tmp1 ==  time__time__FormatTime_hhmmss12 ) ? ( _STR("%d:%02d:%02d %.*s", hour, t .minute, t .second, tp.len, tp.str) ) : ( ( tmp1 ==  time__time__FormatTime_hhmmss24 ) ? ( _STR("%02d:%02d:%02d", t .hour, t .minute, t .second) ) :( _STR("unknown enumeration %d", fmt_time) ))))) ;
 }
 string time__Time_get_fmt_date_str (time__Time t, time__FormatDelimiter fmt_dlmtr, time__FormatDate fmt_date) {
 if ( fmt_date == time__time__FormatDate_no_date ) {
return  tos3("") ;
 }
 ;
string month= _STR("%.*s", time__Time_smonth ( t ).len, time__Time_smonth ( t ).str) ;
string year= string_substr2( int_str ( t .year ) ,  2 , -1, true) ; 
 time__FormatDate tmp4 =  fmt_date; 
 
 time__FormatDelimiter tmp5 =  fmt_dlmtr; 

return  string_replace ( ( ( tmp4 ==  time__time__FormatDate_ddmmyy ) ? ( _STR("%02d|%02d|%.*s", t .day, t .month, year.len, year.str) ) : ( ( tmp4 ==  time__time__FormatDate_ddmmyyyy ) ? ( _STR("%02d|%02d|%d", t .day, t .month, t .year) ) : ( ( tmp4 ==  time__time__FormatDate_mmddyy ) ? ( _STR("%02d|%02d|%.*s", t .month, t .day, year.len, year.str) ) : ( ( tmp4 ==  time__time__FormatDate_mmddyyyy ) ? ( _STR("%02d|%02d|%d", t .month, t .day, t .year) ) : ( ( tmp4 ==  time__time__FormatDate_mmmd ) ? ( _STR("%.*s|%d", month.len, month.str, t .day) ) : ( ( tmp4 ==  time__time__FormatDate_mmmdd ) ? ( _STR("%.*s|%02d", month.len, month.str, t .day) ) : ( ( tmp4 ==  time__time__FormatDate_mmmddyyyy ) ? ( _STR("%.*s|%02d|%d", month.len, month.str, t .day, t .year) ) : ( ( tmp4 ==  time__time__FormatDate_yyyymmdd ) ? ( _STR("%d|%02d|%02d", t .year, t .month, t .day) ) :( _STR("unknown enumeration %d", fmt_date) ))))))))) ,  tos3("|") , ( ( tmp5 ==  time__time__FormatDelimiter_dot ) ? ( tos3(".") ) : ( ( tmp5 ==  time__time__FormatDelimiter_hyphen ) ? ( tos3("-") ) : ( ( tmp5 ==  time__time__FormatDelimiter_slash ) ? ( tos3("/") ) : ( ( tmp5 ==  time__time__FormatDelimiter_space ) ? ( tos3(" ") ) :( _STR("unknown enumeration %d", fmt_dlmtr) ))))) ) ;
 }
 string time__Time_get_fmt_str (time__Time t, time__FormatDelimiter fmt_dlmtr, time__FormatTime fmt_time, time__FormatDate fmt_date) {
 if ( fmt_date == time__time__FormatDate_no_date ) {
 if ( fmt_time == time__time__FormatTime_no_time ) {
return  tos3("") ;
 }
  else { 
return  time__Time_get_fmt_time_str ( t ,  fmt_time ) ;
 }
 ;
 }
  else { 
 if ( fmt_time != time__time__FormatTime_no_time ) {
return string_add(string_add( time__Time_get_fmt_date_str ( t ,  fmt_dlmtr , fmt_date ) , tos3(" ") ) , time__Time_get_fmt_time_str ( t ,  fmt_time ) ) ;
 }
  else { 
return  time__Time_get_fmt_date_str ( t ,  fmt_dlmtr , fmt_date ) ;
 }
 ;
 }
 ;
 }
 Option_time__Time time__parse (string s) {
Option_int tmp1 =  string_index ( s ,  tos3(" ") ) ;
 int pos;
 if (!tmp1 .ok) {
 string err = tmp1 . error;
 int errcode = tmp1 . ecode;
return  v_error ( _STR("Invalid time format: %.*s", s.len, s.str) ) ;
 }
 pos = *(int*)tmp1.data;
 ;
string symd= string_substr2( s ,  0 , pos , false) ;
array_string ymd= string_split ( symd ,  tos3("-") ) ;
 if ( ymd .len != 3 ) {
return  v_error ( _STR("Invalid time format: %.*s", s.len, s.str) ) ;
 }
 ;
string shms= string_substr2( s ,  pos , -1, true) ;
array_string hms= string_split ( shms ,  tos3(":") ) ;
string hour= string_substr2( ( *(string*) array_get(  hms , 0) ) ,  1 , -1, true) ;
string minute= ( *(string*) array_get(  hms , 1) ) ;
string second= ( *(string*) array_get(  hms , 2) ) ;
time__Time tmp20 = OPTION_CAST(time__Time)( time__new_time ( (time__Time) { .year =  v_string_int ( ( *(string*) array_get(  ymd , 0) ) ) , .month =  v_string_int ( ( *(string*) array_get(  ymd , 1) ) ) , .day =  v_string_int ( ( *(string*) array_get(  ymd , 2) ) ) , .hour =  v_string_int ( hour ) , .minute =  v_string_int ( minute ) , .second =  v_string_int ( second ) , .v_unix =  0 } )); 
 return opt_ok(&tmp20, sizeof(time__Time)) ;
 }
 Option_time__Time time__parse_rfc2822 (string s) {
array_string fields= string_split ( s ,  tos3(" ") ) ;
 if ( fields .len < 5 ) {
return  v_error ( _STR("Invalid time format: %.*s", s.len, s.str) ) ;
 }
 ;
Option_int tmp23 =  string_index ( time__months_string ,  ( *(string*) array_get(  fields , 2) ) ) ;
 int pos;
 if (!tmp23 .ok) {
 string err = tmp23 . error;
 int errcode = tmp23 . ecode;
return  v_error ( _STR("Invalid time format: %.*s", s.len, s.str) ) ;
 }
 pos = *(int*)tmp23.data;
 ;
int mm= pos / 3 + 1 ;
byteptr tmstr= ((byteptr)( 0 ) ) ;
 {
 tmstr  =  v_malloc ( s .len * 2 ) ;
 }
 ;
int count= sprintf ( ((charptr)( tmstr ) ) , (char*) tos3("%s-%02d-%s %s") .str , (char*) ( *(string*) array_get(  fields , 3) ) .str ,  mm , (char*) ( *(string*) array_get(  fields , 1) ) .str , (char*) ( *(string*) array_get(  fields , 4) ) .str ) ;
Option_time__Time tmp30 =  time__parse ( tos ( tmstr , count ) ) ;
 time__Time t;
 if (!tmp30 .ok) {
 string err = tmp30 . error;
 int errcode = tmp30 . ecode;
return  v_error ( _STR("Invalid time format: %.*s", s.len, s.str) ) ;
 }
 t = *(time__Time*)tmp30.data;
 ;
time__Time tmp31 = OPTION_CAST(time__Time)( t); 
 return opt_ok(&tmp31, sizeof(time__Time)) ;
 }
 time__Time time__now () {
time_t t= time ( 0 ) ; 
 struct /*C.Foo(0)*/  

tm* now= 0 ;
 now  =  localtime ( & t ) ;
return  time__convert_ctime (* now ) ;
 }
 string time__Time_smonth (time__Time t) {
int i= t .month - 1 ;
return  string_substr2( time__months_string ,  i * 3 , ( i + 1 ) * 3 , false) ;
 }
 time__Time time__new_time (time__Time t) {
return  (time__Time) { .year =  t .year , .month =  t .month , .day =  t .day , .hour =  t .hour , .minute =  t .minute , .second =  t .second , .v_unix =  time__Time_calc_unix (& /* ? */ t ) } ;
 }
 int time__Time_calc_unix (time__Time* t) {
 if ( t ->v_unix != 0 ) {
return  t ->v_unix ;
 }

struct /*TM*/ tm tt= (struct tm) { .tm_sec =  t ->second , .tm_min =  t ->minute , .tm_hour =  t ->hour , .tm_mday =  t ->day , .tm_mon =  t ->month - 1 , .tm_year =  t ->year - 1900 , .tm_gmtoff =  0 } ;
return  time__make_unix_time ( tt ) ;
 }
 time__Time time__Time_add_seconds (time__Time t, int seconds) {
return  time__unix ( t .v_unix + seconds ) ;
 }
 time__Time time__Time_add_days (time__Time t, int days) {
return  time__unix ( t .v_unix + days * 3600 * 24 ) ;
 }
 int time__since (time__Time t) {
return  0 ;
 }
 string time__Time_relative (time__Time t) {
time__Time now= time__now ( ) ;
int secs= now .v_unix - t .v_unix ;
 if ( secs <= 30 ) {
return  tos3("now") ;
 }
 ;
 if ( secs < 60 ) {
return  tos3("1m") ;
 }
 ;
 if ( secs < 3600 ) {
return  _STR("%dm", secs / 60) ;
 }
 ;
 if ( secs < 3600 * 24 ) {
return  _STR("%dh", secs / 3600) ;
 }
 ;
 if ( secs < 3600 * 24 * 5 ) {
return  _STR("%dd", secs / 3600 / 24) ;
 }
 ;
 if ( secs > 3600 * 24 * 10000 ) {
return  tos3("") ;
 }
 ;
return  time__Time_md ( t ) ;
 }
 int time__day_of_week (int y, int m, int d) {
array_int t=new_array_from_c_array(12, 12, sizeof(int), EMPTY_ARRAY_OF_ELEMS( int, 12 ) {  0 ,  3 ,  2 ,  5 ,  0 ,  3 ,  5 ,  1 ,  4 ,  6 ,  2 ,  4  }) ;
int sy= y ;
 if ( ( m < 3 ) ) {
 sy  =  sy - 1 ;
 }
 ;
return  ( sy + sy / 4 - sy / 100 + sy / 400 + ( *(int*) array_get(  t , m - 1) ) + d - 1 ) % 7 + 1 ;
 }
 int time__Time_day_of_week (time__Time t) {
return  time__day_of_week ( t .year , t .month , t .day ) ;
 }
 string time__Time_weekday_str (time__Time t) {
int i= time__Time_day_of_week ( t ) - 1 ;
return  string_substr2( time__days_string ,  i * 3 , ( i + 1 ) * 3 , false) ;
 }
 i64 time__ticks () {
 #ifdef _WIN32
 #else 
 struct /*c struct init*/ 

timeval ts ;
 gettimeofday ( & ts ,  0 ) ;
return  ((i64)( ts .tv_sec * ((u64)( 1000 ) ) + ( ts .tv_usec / ((u64)( 1000 ) ) ) ) ) ;
 #endif
 ;
 }
 void time__sleep (int seconds) {
 #ifdef _WIN32
 #else
 sleep ( seconds ) ;
 #endif
 ;
 }
 void time__sleep_ms (int milliseconds) {
 #ifdef _WIN32
 #else
 usleep ( milliseconds * 1000 ) ;
 #endif
 ;
 }
 void time__usleep (int microseconds) {
 #ifdef _WIN32
 #else
 usleep ( microseconds ) ;
 #endif
 ;
 }
 bool time__is_leap_year (int year) {
return  ( year % 4 == 0 )  &&  ( year % 100 != 0  ||  year % 400 == 0 ) ;
 }
 Option_int time__days_in_month (int month, int year) {
 if ( month > 12  ||  month < 1 ) {
return  v_error ( _STR("Invalid month: %d", month) ) ;
 }
 ;
int extra= (( month == 2  &&  time__is_leap_year ( year ) ) ? ( 1 ) : ( 0 )) ;
int res= ( *(int*) array_get(  time__month_days , month - 1) ) + extra ;
int tmp9 = OPTION_CAST(int)( res); 
 return opt_ok(&tmp9, sizeof(int)) ;
 }
 string time__Time_str (time__Time t) {
return  time__Time_format_ss ( t ) ;
 }
 time__Time time__convert_ctime (struct /*TM*/ tm t) {
return  (time__Time) { .year =  t .tm_year + 1900 , .month =  t .tm_mon + 1 , .day =  t .tm_mday , .hour =  t .tm_hour , .minute =  t .tm_min , .second =  t .tm_sec , .v_unix =  time__make_unix_time ( t ) } ;
 }
 int time__make_unix_time (struct /*TM*/ tm t) {
return  ((int)( timegm ( & t ) ) ) ;
 }
 time__Time time__unix (int abs) {
int day_offset= abs / time__seconds_per_day ;
 if ( abs % time__seconds_per_day < 0 ) {
 day_offset -- ;
 }
 ;
_V_MulRet_int_V_int_V_int _V_mret_34_year_month_day= time__calculate_date_from_offset ( day_offset ) ;
 int year = _V_mret_34_year_month_day.var_0 ;
 int month = _V_mret_34_year_month_day.var_1 ;
 int day = _V_mret_34_year_month_day.var_2 ;
_V_MulRet_int_V_int_V_int _V_mret_44_hr_min_sec= time__calculate_time_from_offset ( abs % time__seconds_per_day ) ;
 int hr = _V_mret_44_hr_min_sec.var_0 ;
 int min = _V_mret_44_hr_min_sec.var_1 ;
 int sec = _V_mret_44_hr_min_sec.var_2 ;
return  (time__Time) { .year =  year , .month =  month , .day =  day , .hour =  hr , .minute =  min , .second =  sec , .v_unix =  abs } ;
 }
 static inline _V_MulRet_int_V_int_V_int time__calculate_date_from_offset (int day_offset_) {
int day_offset= day_offset_ ;
int year= 2001 ;
 day_offset  -=  31 * 365 + 8 ;
 year  +=  ( day_offset / time__days_per_400_years ) * 400 ;
 day_offset  %=  time__days_per_400_years ;
 if ( day_offset == time__days_per_100_years * 4 ) {
 year  +=  300 ;
 day_offset  -=  time__days_per_100_years * 3 ;
 }
  else { 
 year  +=  ( day_offset / time__days_per_100_years ) * 100 ;
 day_offset  %=  time__days_per_100_years ;
 }
 ;
 if ( day_offset == time__days_per_4_years * 25 ) {
 year  +=  96 ;
 day_offset  -=  time__days_per_4_years * 24 ;
 }
  else { 
 year  +=  ( day_offset / time__days_per_4_years ) * 4 ;
 day_offset  %=  time__days_per_4_years ;
 }
 ;
 if ( day_offset == 365 * 4 ) {
 year  +=  3 ;
 day_offset  -=  365 * 3 ;
 }
  else { 
 year  +=  ( day_offset / 365 ) ;
 day_offset  %=  365 ;
 }
 ;
 if ( day_offset < 0 ) {
 year -- ;
 if ( time__is_leap_year ( year ) ) {
 day_offset  +=  366 ;
 }
  else { 
 day_offset  +=  365 ;
 }
 ;
 }
 ;
 if ( time__is_leap_year ( year ) ) {
 if ( day_offset > 31 + 29 - 1 ) {
 day_offset -- ;
 }
  else  if ( day_offset == 31 + 29 - 1 ) {
return (_V_MulRet_int_V_int_V_int){.var_0=year,.var_1=2,.var_2=29} ;
 }
 ;
 }
 ;
int estimated_month= day_offset / 31 ;
 while ( day_offset >= ( *(int*) array_get(  time__days_before , estimated_month + 1) ) ) {
 
 estimated_month ++ ;
 }
 ;
 while ( day_offset < ( *(int*) array_get(  time__days_before , estimated_month) ) ) {
 
 if ( estimated_month == 0 ) {
 break
 ;
 }
 ;
 estimated_month -- ;
 }
 ;
 day_offset  -=  ( *(int*) array_get(  time__days_before , estimated_month) ) ;
return (_V_MulRet_int_V_int_V_int){.var_0=year,.var_1=estimated_month + 1,.var_2=day_offset + 1} ;
 }
 static inline _V_MulRet_int_V_int_V_int time__calculate_time_from_offset (int second_offset_) {
int second_offset= second_offset_ ;
 if ( second_offset < 0 ) {
 second_offset  +=  time__seconds_per_day ;
 }
 ;
int hour= second_offset / time__seconds_per_hour ;
 second_offset  %=  time__seconds_per_hour ;
int min= second_offset / time__seconds_per_minute ;
 second_offset  %=  time__seconds_per_minute ;
return (_V_MulRet_int_V_int_V_int){.var_0=hour,.var_1=min,.var_2=second_offset} ;
 }
 f64 math__inf (int sign) {
u64 v= (( sign >= 0 ) ? ( math__uvinf ) : ( math__uvneginf )) ;
return  math__f64_from_bits ( v ) ;
 }
 f64 math__nan () {
return  math__f64_from_bits ( math__uvnan ) ;
 }
 bool math__is_nan (f64 f) {
return f64_ne( f , f ) ;
 }
 bool math__is_inf (f64 f, int sign) {
return  ( sign >= 0  && macro_f64_gt( f , math__max_f64 ) )  ||  ( sign <= 0  && macro_f64_lt( f , - math__max_f64 ) ) ;
 }
 f64 math__abs (f64 a) {
return  fabs ( a ) ;
 }
 f64 math__acos (f64 a) {
return  acos ( a ) ;
 }
 f64 math__asin (f64 a) {
return  asin ( a ) ;
 }
 f64 math__atan (f64 a) {
return  atan ( a ) ;
 }
 f64 math__atan2 (f64 a, f64 b) {
return  atan2 ( a ,  b ) ;
 }
 f64 math__cbrt (f64 a) {
return  cbrt ( a ) ;
 }
 f64 math__ceil (f64 a) {
return  ceil ( a ) ;
 }
 f64 math__cos (f64 a) {
return  cos ( a ) ;
 }
 f32 math__cosf (f32 a) {
return  cosf ( a ) ;
 }
 f64 math__cosh (f64 a) {
return  cosh ( a ) ;
 }
 f64 math__degrees (f64 radians) {
return  radians * ( 180.0 / math__pi ) ;
 }
 f64 math__exp (f64 a) {
return  exp ( a ) ;
 }
 array_int math__digits (int _n, int base) {
 if ( base < 2 ) {
 v_panic ( _STR("digits: Cannot find digits of n with base %d", base) ) ;
 }
 ;
int n= _n ;
int sign= 1 ;
 if ( n < 0 ) {
 sign  =  - 1 ;
 n  =  - n ;
 }
 ;
array_int res=new_array_from_c_array(0, 0, sizeof(int), EMPTY_ARRAY_OF_ELEMS( int, 0 ) {   TCCSKIP(0) }) ;
 while ( n != 0 ) {
 
_PUSH(& res , ( /*typ = array_int   tmp_typ=int*/ ( n % base ) * sign ), tmp1, int) ;
 n  /=  base ;
 }
 ;
return  res ;
 }
 f64 math__erf (f64 a) {
return  erf ( a ) ;
 }
 f64 math__erfc (f64 a) {
return  erfc ( a ) ;
 }
 f64 math__exp2 (f64 a) {
return  exp2 ( a ) ;
 }
 f64 math__floor (f64 a) {
return  floor ( a ) ;
 }
 f64 math__fmod (f64 a, f64 b) {
return  fmod ( a ,  b ) ;
 }
 f64 math__gamma (f64 a) {
return  tgamma ( a ) ;
 }
 i64 math__gcd (i64 a_, i64 b_) {
i64 a= a_ ;
i64 b= b_ ;
 if ( a < 0 ) {
 a  =  - a ;
 }
 ;
 if ( b < 0 ) {
 b  =  - b ;
 }
 ;
 while ( b != 0 ) {
 
 a  %=  b ;
 if ( a == 0 ) {
return  b ;
 }
 ;
 b  %=  a ;
 }
 ;
return  a ;
 }
 f64 math__hypot (f64 a, f64 b) {
return  hypot ( a ,  b ) ;
 }
 i64 math__lcm (i64 a, i64 b) {
 if ( a == 0 ) {
return  a ;
 }
 ;
i64 res= a * ( b / math__gcd ( b , a ) ) ;
 if ( res < 0 ) {
return  - res ;
 }
 ;
return  res ;
 }
 f64 math__log (f64 a) {
return  log ( a ) ;
 }
 f64 math__log2 (f64 a) {
return  log2 ( a ) ;
 }
 f64 math__log10 (f64 a) {
return  log10 ( a ) ;
 }
 f64 math__log_gamma (f64 a) {
return  lgamma ( a ) ;
 }
 f64 math__log_n (f64 a, f64 b) {
return  log ( a ) / log ( b ) ;
 }
 f64 math__max (f64 a, f64 b) {
 if (macro_f64_gt( a , b ) ) {
return  a ;
 }
 ;
return  b ;
 }
 f64 math__min (f64 a, f64 b) {
 if (macro_f64_lt( a , b ) ) {
return  a ;
 }
 ;
return  b ;
 }
 f64 math__pow (f64 a, f64 b) {
return  pow ( a ,  b ) ;
 }
 f32 math__powf (f32 a, f32 b) {
return  powf ( a ,  b ) ;
 }
 f64 math__radians (f64 degrees) {
return  degrees * ( math__pi / 180.0 ) ;
 }
 f64 math__round (f64 f) {
return  round ( f ) ;
 }
 f64 math__sin (f64 a) {
return  sin ( a ) ;
 }
 f32 math__sinf (f32 a) {
return  sinf ( a ) ;
 }
 f64 math__sinh (f64 a) {
return  sinh ( a ) ;
 }
 f64 math__sqrt (f64 a) {
return  sqrt ( a ) ;
 }
 f32 math__sqrtf (f32 a) {
return  sqrtf ( a ) ;
 }
 f64 math__tan (f64 a) {
return  tan ( a ) ;
 }
 f32 math__tanf (f32 a) {
return  tanf ( a ) ;
 }
 f64 math__tanh (f64 a) {
return  tanh ( a ) ;
 }
 f64 math__trunc (f64 a) {
return  trunc ( a ) ;
 }
 f64 math__aprox_sin (f64 a) {
f32 a0= 1.91059300966915117e-31 ;
f32 a1= 1.00086760103908896 ;
f32 a2= - 1.21276126894734565e-2 ;
f32 a3= - 1.38078780785773762e-1 ;
f32 a4= - 2.67353392911981221e-2 ;
f32 a5= 2.08026600266304389e-2 ;
f32 a6= - 3.03996055049204407e-3 ;
f32 a7= 1.38235642404333740e-4 ;
return  a0 + a * ( a1 + a * ( a2 + a * ( a3 + a * ( a4 + a * ( a5 + a * ( a6 + a * a7 ) ) ) ) ) ) ;
 }
 f64 math__aprox_cos (f64 a) {
f32 a0= 9.9995999154986614e-1 ;
f32 a1= 1.2548995793001028e-3 ;
f32 a2= - 5.0648546280678015e-1 ;
f32 a3= 1.2942246466519995e-2 ;
f32 a4= 2.8668384702547972e-2 ;
f32 a5= 7.3726485210586547e-3 ;
f32 a6= - 3.8510875386947414e-3 ;
f32 a7= 4.7196604604366623e-4 ;
f32 a8= - 1.8776444013090451e-5 ;
return  a0 + a * ( a1 + a * ( a2 + a * ( a3 + a * ( a4 + a * ( a5 + a * ( a6 + a * ( a7 + a * a8 ) ) ) ) ) ) ) ;
 }
 u32 math__f32_bits (f32 f) {
u32* p= ((u32*)( & f ) ) ;
return  * p ;
 }
 f32 math__f32_from_bits (u32 b) {
f32* p= ((f32*)( & b ) ) ;
return  * p ;
 }
 u64 math__f64_bits (f64 f) {
u64* p= ((u64*)( & f ) ) ;
return  * p ;
 }
 f64 math__f64_from_bits (u64 b) {
f64* p= ((f64*)( & b ) ) ;
return  * p ;
 }
 int math_dot_bits__leading_zeros_8 (byte x) {
return  8 - math_dot_bits__len_8 ( x ) ;
 }
 int math_dot_bits__leading_zeros_16 (u16 x) {
return  16 - math_dot_bits__len_16 ( x ) ;
 }
 int math_dot_bits__leading_zeros_32 (u32 x) {
return  32 - math_dot_bits__len_32 ( x ) ;
 }
 int math_dot_bits__leading_zeros_64 (u64 x) {
return  64 - math_dot_bits__len_64 ( x ) ;
 }
 int math_dot_bits__trailing_zeros_8 (byte x) {
return  ((int)( ( *(byte*) array_get(  math_dot_bits__ntz_8_tab , x) ) ) ) ;
 }
 int math_dot_bits__trailing_zeros_16 (u16 x) {
 if ( x == 0 ) {
return  16 ;
 }
 ;
return  ((int)( ( *(byte*) array_get(  math_dot_bits__de_bruijn32tab , ((u32)( x & - x ) ) * math_dot_bits__de_bruijn32  >>  ( 32 - 5 )) ) ) ) ;
 }
 int math_dot_bits__trailing_zeros_32 (u32 x) {
 if ( x == 0 ) {
return  32 ;
 }
 ;
return  ((int)( ( *(byte*) array_get(  math_dot_bits__de_bruijn32tab , ( x & - x ) * math_dot_bits__de_bruijn32  >>  ( 32 - 5 )) ) ) ) ;
 }
 int math_dot_bits__trailing_zeros_64 (u64 x) {
 if ( x == 0 ) {
return  64 ;
 }
 ;
return  ((int)( ( *(byte*) array_get(  math_dot_bits__de_bruijn64tab , ( x & - x ) * math_dot_bits__de_bruijn64  >>  ( 64 - 6 )) ) ) ) ;
 }
 int math_dot_bits__ones_count_8 (byte x) {
return  ((int)( ( *(byte*) array_get(  math_dot_bits__pop_8_tab , x) ) ) ) ;
 }
 int math_dot_bits__ones_count_16 (u16 x) {
return  ((int)( ( *(byte*) array_get(  math_dot_bits__pop_8_tab , x  >>  8) ) + ( *(byte*) array_get(  math_dot_bits__pop_8_tab , x & ((u16)( 0xff ) )) ) ) ) ;
 }
 int math_dot_bits__ones_count_32 (u32 x) {
return  ((int)( ( *(byte*) array_get(  math_dot_bits__pop_8_tab , x  >>  24) ) + ( *(byte*) array_get(  math_dot_bits__pop_8_tab , x  >>  16 & 0xff) ) + ( *(byte*) array_get(  math_dot_bits__pop_8_tab , x  >>  8 & 0xff) ) + ( *(byte*) array_get(  math_dot_bits__pop_8_tab , x & ((u32)( 0xff ) )) ) ) ) ;
 }
 int math_dot_bits__ones_count_64 (u64 x) {
u64 y= ( x  >>  ((u64)( 1 ) ) & ( math_dot_bits__m0 & math_dot_bits__max_u64 ) ) + ( x & ( math_dot_bits__m0 & math_dot_bits__max_u64 ) ) ;
 y  =  ( y  >>  ((u64)( 2 ) ) & ( math_dot_bits__m1 & math_dot_bits__max_u64 ) ) + ( y & ( math_dot_bits__m1 & math_dot_bits__max_u64 ) ) ;
 y  =  ( ( y  >>  4 ) + y ) & ( math_dot_bits__m2 & math_dot_bits__max_u64 ) ;
 y  +=  y  >>  8 ;
 y  +=  y  >>  16 ;
 y  +=  y  >>  32 ;
return  ((int)( y ) ) & ( ( 1  <<  7 ) - 1 ) ;
 }
 static inline byte math_dot_bits__rotate_left_8 (byte x, int k) {
byte n= ((byte)( 8 ) ) ;
byte s= ((byte)( k ) ) & ( n - ((byte)( 1 ) ) ) ;
return  ( ( x  <<  s ) | ( x  >>  ( n - s ) ) ) ;
 }
 static inline u16 math_dot_bits__rotate_left_16 (u16 x, int k) {
u16 n= ((u16)( 16 ) ) ;
u16 s= ((u16)( k ) ) & ( n - ((u16)( 1 ) ) ) ;
return  ( ( x  <<  s ) | ( x  >>  ( n - s ) ) ) ;
 }
 static inline u32 math_dot_bits__rotate_left_32 (u32 x, int k) {
u32 n= ((u32)( 32 ) ) ;
u32 s= ((u32)( k ) ) & ( n - ((u32)( 1 ) ) ) ;
return  ( ( x  <<  s ) | ( x  >>  ( n - s ) ) ) ;
 }
 static inline u64 math_dot_bits__rotate_left_64 (u64 x, int k) {
u64 n= ((u64)( 64 ) ) ;
u64 s= ((u64)( k ) ) & ( n - ((u64)( 1 ) ) ) ;
return  ( ( x  <<  s ) | ( x  >>  ( n - s ) ) ) ;
 }
 static inline byte math_dot_bits__reverse_8 (byte x) {
return  ( *(byte*) array_get(  math_dot_bits__rev_8_tab , x) ) ;
 }
 static inline u16 math_dot_bits__reverse_16 (u16 x) {
return  ((u16)( ( *(byte*) array_get(  math_dot_bits__rev_8_tab , x  >>  8) ) ) ) | ( ((u16)( ( *(byte*) array_get(  math_dot_bits__rev_8_tab , x & ((u16)( 0xff ) )) ) ) )  <<  8 ) ;
 }
 static inline u32 math_dot_bits__reverse_32 (u32 x) {
u32 y= ( ( x  >>  ((u32)( 1 ) ) & ( math_dot_bits__m0 & math_dot_bits__max_u32 ) ) | ( ( x & ( math_dot_bits__m0 & math_dot_bits__max_u32 ) )  <<  1 ) ) ;
 y  =  ( ( y  >>  ((u32)( 2 ) ) & ( math_dot_bits__m1 & math_dot_bits__max_u32 ) ) | ( ( y & ( math_dot_bits__m1 & math_dot_bits__max_u32 ) )  <<  ((u32)( 2 ) ) ) ) ;
 y  =  ( ( y  >>  ((u32)( 4 ) ) & ( math_dot_bits__m2 & math_dot_bits__max_u32 ) ) | ( ( y & ( math_dot_bits__m2 & math_dot_bits__max_u32 ) )  <<  ((u32)( 4 ) ) ) ) ;
return  math_dot_bits__reverse_bytes_32 ( y ) ;
 }
 static inline u64 math_dot_bits__reverse_64 (u64 x) {
u64 y= ( ( x  >>  ((u64)( 1 ) ) & ( math_dot_bits__m0 & math_dot_bits__max_u64 ) ) | ( ( x & ( math_dot_bits__m0 & math_dot_bits__max_u64 ) )  <<  1 ) ) ;
 y  =  ( ( y  >>  ((u64)( 2 ) ) & ( math_dot_bits__m1 & math_dot_bits__max_u64 ) ) | ( ( y & ( math_dot_bits__m1 & math_dot_bits__max_u64 ) )  <<  2 ) ) ;
 y  =  ( ( y  >>  ((u64)( 4 ) ) & ( math_dot_bits__m2 & math_dot_bits__max_u64 ) ) | ( ( y & ( math_dot_bits__m2 & math_dot_bits__max_u64 ) )  <<  4 ) ) ;
return  math_dot_bits__reverse_bytes_64 ( y ) ;
 }
 static inline u16 math_dot_bits__reverse_bytes_16 (u16 x) {
return  ( x  >>  8 ) | ( x  <<  8 ) ;
 }
 static inline u32 math_dot_bits__reverse_bytes_32 (u32 x) {
u32 y= ( ( x  >>  ((u32)( 8 ) ) & ( math_dot_bits__m3 & math_dot_bits__max_u32 ) ) | ( ( x & ( math_dot_bits__m3 & math_dot_bits__max_u32 ) )  <<  ((u32)( 8 ) ) ) ) ;
return  ( y  >>  16 ) | ( y  <<  16 ) ;
 }
 static inline u64 math_dot_bits__reverse_bytes_64 (u64 x) {
u64 y= ( ( x  >>  ((u64)( 8 ) ) & ( math_dot_bits__m3 & math_dot_bits__max_u64 ) ) | ( ( x & ( math_dot_bits__m3 & math_dot_bits__max_u64 ) )  <<  ((u64)( 8 ) ) ) ) ;
 y  =  ( ( y  >>  ((u64)( 16 ) ) & ( math_dot_bits__m4 & math_dot_bits__max_u64 ) ) | ( ( y & ( math_dot_bits__m4 & math_dot_bits__max_u64 ) )  <<  ((u64)( 16 ) ) ) ) ;
return  ( y  >>  32 ) | ( y  <<  32 ) ;
 }
 int math_dot_bits__len_8 (byte x) {
return  ((int)( ( *(byte*) array_get(  math_dot_bits__len_8_tab , x) ) ) ) ;
 }
 int math_dot_bits__len_16 (u16 x) {
u16 y= x ;
int n= 0 ;
 if ( y >= 1  <<  8 ) {
 y  >>=  8 ;
 n  =  8 ;
 }
 ;
return  n + ((int)( ( *(byte*) array_get(  math_dot_bits__len_8_tab , y) ) ) ) ;
 }
 int math_dot_bits__len_32 (u32 x) {
u32 y= x ;
int n= 0 ;
 if ( y >= 1  <<  16 ) {
 y  >>=  16 ;
 n  =  16 ;
 }
 ;
 if ( y >= 1  <<  8 ) {
 y  >>=  8 ;
 n  +=  8 ;
 }
 ;
return  n + ((int)( ( *(byte*) array_get(  math_dot_bits__len_8_tab , y) ) ) ) ;
 }
 int math_dot_bits__len_64 (u64 x) {
u64 y= x ;
int n= 0 ;
 if ( y >= ((u64)( 1 ) )  <<  ((u64)( 32 ) ) ) {
 y  >>=  32 ;
 n  =  32 ;
 }
 ;
 if ( y >= ((u64)( 1 ) )  <<  ((u64)( 16 ) ) ) {
 y  >>=  16 ;
 n  +=  16 ;
 }
 ;
 if ( y >= ((u64)( 1 ) )  <<  ((u64)( 8 ) ) ) {
 y  >>=  8 ;
 n  +=  8 ;
 }
 ;
return  n + ((int)( ( *(byte*) array_get(  math_dot_bits__len_8_tab , y) ) ) ) ;
 }
 _V_MulRet_u32_V_u32 math_dot_bits__add_32 (u32 x, u32 y, u32 carry) {
u64 sum64= ((u64)( x ) ) + ((u64)( y ) ) + ((u64)( carry ) ) ;
u32 sum= ((u32)( sum64 ) ) ;
u32 carry_out= ((u32)( sum64  >>  32 ) ) ;
return (_V_MulRet_u32_V_u32){.var_0=sum,.var_1=carry_out} ;
 }
 _V_MulRet_u64_V_u64 math_dot_bits__add_64 (u64 x, u64 y, u64 carry) {
u64 sum= x + y + carry ;
u64 carry_out= ( ( x & y ) | ( ( x | y ) & ~ sum ) )  >>  63 ;
return (_V_MulRet_u64_V_u64){.var_0=sum,.var_1=carry_out} ;
 }
 _V_MulRet_u32_V_u32 math_dot_bits__sub_32 (u32 x, u32 y, u32 borrow) {
u32 diff= x - y - borrow ;
u32 borrow_out= ( ( ~ x & y ) | ( ~ ( x ^ y ) & diff ) )  >>  31 ;
return (_V_MulRet_u32_V_u32){.var_0=diff,.var_1=borrow_out} ;
 }
 _V_MulRet_u64_V_u64 math_dot_bits__sub_64 (u64 x, u64 y, u64 borrow) {
u64 diff= x - y - borrow ;
u64 borrow_out= ( ( ~ x & y ) | ( ~ ( x ^ y ) & diff ) )  >>  63 ;
return (_V_MulRet_u64_V_u64){.var_0=diff,.var_1=borrow_out} ;
 }
 _V_MulRet_u32_V_u32 math_dot_bits__mul_32 (u32 x, u32 y) {
u64 tmp= ((u64)( x ) ) * ((u64)( y ) ) ;
u32 hi= ((u32)( tmp  >>  32 ) ) ;
u32 lo= ((u32)( tmp ) ) ;
return (_V_MulRet_u32_V_u32){.var_0=hi,.var_1=lo} ;
 }
 _V_MulRet_u64_V_u64 math_dot_bits__mul_64 (u64 x, u64 y) {
u64 x0= x & math_dot_bits__mask32 ;
u64 x1= x  >>  32 ;
u64 y0= y & math_dot_bits__mask32 ;
u64 y1= y  >>  32 ;
u64 w0= x0 * y0 ;
u64 t= x1 * y0 + ( w0  >>  32 ) ;
u64 w1= t & math_dot_bits__mask32 ;
u64 w2= t  >>  32 ;
 w1  +=  x0 * y1 ;
u64 hi= x1 * y1 + w2 + ( w1  >>  32 ) ;
u64 lo= x * y ;
return (_V_MulRet_u64_V_u64){.var_0=hi,.var_1=lo} ;
 }
 _V_MulRet_u32_V_u32 math_dot_bits__div_32 (u32 hi, u32 lo, u32 y) {
 if ( y != 0  &&  y <= hi ) {
 v_panic ( math_dot_bits__overflow_error ) ;
 }
 ;
u64 z= ( ((u64)( hi ) )  <<  32 ) | ((u64)( lo ) ) ;
u32 quo= ((u32)( z / ((u64)( y ) ) ) ) ;
u32 rem= ((u32)( z % ((u64)( y ) ) ) ) ;
return (_V_MulRet_u32_V_u32){.var_0=quo,.var_1=rem} ;
 }
 _V_MulRet_u64_V_u64 math_dot_bits__div_64 (u64 hi, u64 lo, u64 y1) {
u64 y= y1 ;
 if ( y == 0 ) {
 v_panic ( math_dot_bits__overflow_error ) ;
 }
 ;
 if ( y <= hi ) {
 v_panic ( math_dot_bits__overflow_error ) ;
 }
 ;
u32 s= ((u32)( math_dot_bits__leading_zeros_64 ( y ) ) ) ;
 y  <<=  s ;
u64 yn1= y  >>  32 ;
u64 yn0= y & math_dot_bits__mask32 ;
u64 un32= ( hi  <<  s ) | ( lo  >>  ( 64 - s ) ) ;
u64 un10= lo  <<  s ;
u64 un1= un10  >>  32 ;
u64 un0= un10 & math_dot_bits__mask32 ;
u64 q1= un32 / yn1 ;
u64 rhat= un32 - q1 * yn1 ;
 while ( q1 >= math_dot_bits__two32  ||  q1 * yn0 > math_dot_bits__two32 * rhat + un1 ) {
 
 q1 -- ;
 rhat  +=  yn1 ;
 if ( rhat >= math_dot_bits__two32 ) {
 break
 ;
 }
 ;
 }
 ;
u64 un21= un32 * math_dot_bits__two32 + un1 - q1 * y ;
u64 q0= un21 / yn1 ;
 rhat  =  un21 - q0 * yn1 ;
 while ( q0 >= math_dot_bits__two32  ||  q0 * yn0 > math_dot_bits__two32 * rhat + un0 ) {
 
 q0 -- ;
 rhat  +=  yn1 ;
 if ( rhat >= math_dot_bits__two32 ) {
 break
 ;
 }
 ;
 }
 ;
return (_V_MulRet_u64_V_u64){.var_0=q1 * math_dot_bits__two32 + q0,.var_1=( un21 * math_dot_bits__two32 + un0 - q0 * y )  >>  s} ;
 }
 u32 math_dot_bits__rem_32 (u32 hi, u32 lo, u32 y) {
return  ((u32)( ( ((u64)( hi ) )  <<  32 | ((u64)( lo ) ) ) % ((u64)( y ) ) ) ) ;
 }
 u64 math_dot_bits__rem_64 (u64 hi, u64 lo, u64 y) {
_V_MulRet_u64_V_u64 _V_mret_2270___rem= math_dot_bits__div_64 ( hi % y , lo , y ) ;
 u64 rem = _V_mret_2270___rem.var_1 ;
return  rem ;
 }
 string strconv_dot_ftoa__Dec32_get_string_32 (strconv_dot_ftoa__Dec32 d, bool neg, int n_digit) {
u32 out= d .m ;
int out_len= strconv_dot_ftoa__decimal_len_32 ( out ) ;
array_byte buf= array_repeat (new_array_from_c_array(1, 1, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 1 ) {  ((byte)( 0 ) )  }) ,  out_len + 5 + 1 + 1 ) ;
int i= 0 ;
 if ( n_digit > 0  &&  out_len > n_digit ) {
 out_len  =  n_digit + 1 ;
 }
 ;
 if ( neg ) {
array_set(&/*q*/ buf , i , & (byte []) {  '-' }) ;
 i ++ ;
 }
 ;
int disp= 0 ;
 if ( out_len <= 1 ) {
 disp  =  1 ;
 }
 ;
int y= i + out_len ;
int x= 0 ;
 while ( x < ( out_len - disp - 1 ) ) {
 
array_set(&/*q*/ buf , y - x , & (byte []) {  '0' + ((byte)( out % 10 ) ) }) ;
 out  /=  10 ;
 i ++ ;
 x ++ ;
 }
 ;
 if ( out_len >= 1 ) {
array_set(&/*q*/ buf , y - x , & (byte []) {  '.' }) ;
 x ++ ;
 i ++ ;
 }
 ;
 if ( y - x >= 0 ) {
array_set(&/*q*/ buf , y - x , & (byte []) {  '0' + ((byte)( out % 10 ) ) }) ;
 i ++ ;
 }
 ;
array_set(&/*q*/ buf , i , & (byte []) {  'e' }) ;
 i ++ ;
int exp= d .e + out_len - 1 ;
 if ( exp < 0 ) {
array_set(&/*q*/ buf , i , & (byte []) {  '-' }) ;
 i ++ ;
 exp  =  - exp ;
 }
  else { 
array_set(&/*q*/ buf , i , & (byte []) {  '+' }) ;
 i ++ ;
 }
 ;
int d1= exp % 10 ;
int d0= exp / 10 ;
array_set(&/*q*/ buf , i , & (byte []) {  '0' + ((byte)( d0 ) ) }) ;
 i ++ ;
array_set(&/*q*/ buf , i , & (byte []) {  '0' + ((byte)( d1 ) ) }) ;
 i ++ ;
array_set(&/*q*/ buf , i , & (byte []) {  0 }) ;
return  tos ( ((byteptr)( & ( *(byte*) array_get(  buf , 0) ) ) ) , i ) ;
 }
 _V_MulRet_strconv_dot_ftoa__Dec32_V_bool strconv_dot_ftoa__f32_to_decimal_exact_int (u32 i_mant, u32 exp) {
strconv_dot_ftoa__Dec32 d= (strconv_dot_ftoa__Dec32) { .m =   ((u32)( 0 ) ) , .e =   0 } ;
u32 e= exp - strconv_dot_ftoa__bias32 ;
 if ( e > strconv_dot_ftoa__mantbits32 ) {
return (_V_MulRet_strconv_dot_ftoa__Dec32_V_bool){.var_0=d,.var_1=0} ;
 }
 ;
u32 shift= strconv_dot_ftoa__mantbits32 - e ;
u32 mant= i_mant | 0x00800000 ;
 d .m  =  mant  >>  shift ;
 if ( ( d .m  <<  shift ) != mant ) {
return (_V_MulRet_strconv_dot_ftoa__Dec32_V_bool){.var_0=d,.var_1=0} ;
 }
 ;
 while ( ( d .m % 10 ) == 0 ) {
 
 d .m  /=  10 ;
 d .e ++ ;
 }
 ;
return (_V_MulRet_strconv_dot_ftoa__Dec32_V_bool){.var_0=d,.var_1=1} ;
 }
 strconv_dot_ftoa__Dec32 strconv_dot_ftoa__f32_to_decimal (u32 mant, u32 exp) {
int e2= 0 ;
u32 m2= ((u32)( 0 ) ) ;
 if ( exp == 0 ) {
 e2  =  1 - strconv_dot_ftoa__bias32 - strconv_dot_ftoa__mantbits32 - 2 ;
 m2  =  mant ;
 }
  else { 
 e2  =  ((int)( exp ) ) - strconv_dot_ftoa__bias32 - strconv_dot_ftoa__mantbits32 - 2 ;
 m2  =  ( ((u32)( 1 ) )  <<  strconv_dot_ftoa__mantbits32 ) | mant ;
 }
 ;
bool even= ( m2 & 1 ) == 0 ;
bool accept_bounds= even ;
u32 mv= ((u32)( 4 * m2 ) ) ;
u32 mp= ((u32)( 4 * m2 + 2 ) ) ;
u32 mm_shift= strconv_dot_ftoa__bool_to_u32 ( mant != 0  ||  exp <= 1 ) ;
u32 mm= ((u32)( 4 * m2 - 1 - mm_shift ) ) ;
u32 vr= ((u32)( 0 ) ) ;
u32 vp= ((u32)( 0 ) ) ;
u32 vm= ((u32)( 0 ) ) ;
int e10= 0 ;
bool vm_is_trailing_zeros= 0 ;
bool vr_is_trailing_zeros= 0 ;
byte last_removed_digit= ((byte)( 0 ) ) ;
 if ( e2 >= 0 ) {
u32 q= strconv_dot_ftoa__log10_pow2 ( e2 ) ;
 e10  =  ((int)( q ) ) ;
int k= strconv_dot_ftoa__pow5_inv_num_bits_32 + strconv_dot_ftoa__pow5_bits ( ((int)( q ) ) ) - 1 ;
int i= - e2 + ((int)( q ) ) + k ;
 vr  =  strconv_dot_ftoa__mul_pow5_invdiv_pow2 ( mv , q , i ) ;
 vp  =  strconv_dot_ftoa__mul_pow5_invdiv_pow2 ( mp , q , i ) ;
 vm  =  strconv_dot_ftoa__mul_pow5_invdiv_pow2 ( mm , q , i ) ;
 if ( q != 0  &&  ( vp - 1 ) / 10 <= vm / 10 ) {
int l= strconv_dot_ftoa__pow5_inv_num_bits_32 + strconv_dot_ftoa__pow5_bits ( ((int)( q - 1 ) ) ) - 1 ;
 last_removed_digit  =  ((byte)( strconv_dot_ftoa__mul_pow5_invdiv_pow2 ( mv , q - 1 , - e2 + ((int)( q - 1 ) ) + l ) % 10 ) ) ;
 }
 ;
 if ( q <= 9 ) {
 if ( mv % 5 == 0 ) {
 vr_is_trailing_zeros  =  strconv_dot_ftoa__multiple_of_power_of_five_32 ( mv , q ) ;
 }
  else  if ( accept_bounds ) {
 vm_is_trailing_zeros  =  strconv_dot_ftoa__multiple_of_power_of_five_32 ( mm , q ) ;
 }
  else  if ( strconv_dot_ftoa__multiple_of_power_of_five_32 ( mp , q ) ) {
 vp -- ;
 }
 ;
 }
 ;
 }
  else { 
u32 q= strconv_dot_ftoa__log10_pow5 ( - e2 ) ;
 e10  =  ((int)( q ) ) + e2 ;
int i= - e2 - ((int)( q ) ) ;
int k= strconv_dot_ftoa__pow5_bits ( i ) - strconv_dot_ftoa__pow5_num_bits_32 ;
int j= ((int)( q ) ) - k ;
 vr  =  strconv_dot_ftoa__mul_pow5_div_pow2 ( mv , ((u32)( i ) ) , j ) ;
 vp  =  strconv_dot_ftoa__mul_pow5_div_pow2 ( mp , ((u32)( i ) ) , j ) ;
 vm  =  strconv_dot_ftoa__mul_pow5_div_pow2 ( mm , ((u32)( i ) ) , j ) ;
 if ( q != 0  &&  ( ( vp - 1 ) / 10 ) <= vm / 10 ) {
 j  =  ((int)( q ) ) - 1 - ( strconv_dot_ftoa__pow5_bits ( i + 1 ) - strconv_dot_ftoa__pow5_num_bits_32 ) ;
 last_removed_digit  =  ((byte)( strconv_dot_ftoa__mul_pow5_div_pow2 ( mv , ((u32)( i + 1 ) ) , j ) % 10 ) ) ;
 }
 ;
 if ( q <= 1 ) {
 vr_is_trailing_zeros  =  1 ;
 if ( accept_bounds ) {
 vm_is_trailing_zeros  =  mm_shift == 1 ;
 }
  else { 
 vp -- ;
 }
 ;
 }
  else  if ( q < 31 ) {
 vr_is_trailing_zeros  =  strconv_dot_ftoa__multiple_of_power_of_two_32 ( mv , q - 1 ) ;
 }
 ;
 }
 ;
int removed= 0 ;
u32 out= ((u32)( 0 ) ) ;
 if ( vm_is_trailing_zeros  ||  vr_is_trailing_zeros ) {
 while ( vp / 10 > vm / 10 ) {
 
 vm_is_trailing_zeros  =  vm_is_trailing_zeros  &&  ( vm % 10 ) == 0 ;
 vr_is_trailing_zeros  =  vr_is_trailing_zeros  &&  ( last_removed_digit == 0 ) ;
 last_removed_digit  =  ((byte)( vr % 10 ) ) ;
 vr  /=  10 ;
 vp  /=  10 ;
 vm  /=  10 ;
 removed ++ ;
 }
 ;
 if ( vm_is_trailing_zeros ) {
 while ( vm % 10 == 0 ) {
 
 vr_is_trailing_zeros  =  vr_is_trailing_zeros  &&  ( last_removed_digit == 0 ) ;
 last_removed_digit  =  ((byte)( vr % 10 ) ) ;
 vr  /=  10 ;
 vp  /=  10 ;
 vm  /=  10 ;
 removed ++ ;
 }
 ;
 }
 ;
 if ( vr_is_trailing_zeros  &&  ( last_removed_digit == 5 )  &&  ( vr % 2 ) == 0 ) {
 last_removed_digit  =  4 ;
 }
 ;
 out  =  vr ;
 if ( ( vr == vm  &&  ( ! accept_bounds  ||  ! vm_is_trailing_zeros ) )  ||  last_removed_digit >= 5 ) {
 out ++ ;
 }
 ;
 }
  else { 
 while ( vp / 10 > vm / 10 ) {
 
 last_removed_digit  =  ((byte)( vr % 10 ) ) ;
 vr  /=  10 ;
 vp  /=  10 ;
 vm  /=  10 ;
 removed ++ ;
 }
 ;
 out  =  vr + strconv_dot_ftoa__bool_to_u32 ( vr == vm  ||  last_removed_digit >= 5 ) ;
 }
 ;
return  (strconv_dot_ftoa__Dec32) { .m =  out , .e =  e10 + removed } ;
 }
 string strconv_dot_ftoa__f32_to_str (f32 f, int n_digit) {
strconv_dot_ftoa__Uf32 u1= (strconv_dot_ftoa__Uf32) { .f =   ((f32)( 0 ) ) , .u =  0 } ;
 u1 .f  =  f ;
u32 u= u1 .u ;
bool neg= ( u  >>  ( strconv_dot_ftoa__mantbits32 + strconv_dot_ftoa__expbits32 ) ) != 0 ;
u32 mant= u & ( ( ((u32)( 1 ) )  <<  strconv_dot_ftoa__mantbits32 ) - ((u32)( 1 ) ) ) ;
u32 exp= ( u  >>  strconv_dot_ftoa__mantbits32 ) & ( ( ((u32)( 1 ) )  <<  strconv_dot_ftoa__expbits32 ) - ((u32)( 1 ) ) ) ;
 if ( ( exp == strconv_dot_ftoa__maxexp32 )  ||  ( exp == 0  &&  mant == 0 ) ) {
return  strconv_dot_ftoa__get_string_special ( neg , exp == 0 , mant == 0 ) ;
 }
 ;
_V_MulRet_strconv_dot_ftoa__Dec32_V_bool _V_mret_1289_d_ok= strconv_dot_ftoa__f32_to_decimal_exact_int ( mant , exp ) ;
 strconv_dot_ftoa__Dec32 d = _V_mret_1289_d_ok.var_0 ;
 bool ok = _V_mret_1289_d_ok.var_1 ;
 if ( ! ok ) {
 d  =  strconv_dot_ftoa__f32_to_decimal ( mant , exp ) ;
 }
 ;
return  strconv_dot_ftoa__Dec32_get_string_32 ( d ,  neg , n_digit ) ;
 }
 string strconv_dot_ftoa__Dec64_get_string_64 (strconv_dot_ftoa__Dec64 d, bool neg, int n_digit) {
u64 out= d .m ;
int out_len= strconv_dot_ftoa__decimal_len_64 ( out ) ;
array_byte buf= array_repeat (new_array_from_c_array(1, 1, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 1 ) {  ((byte)( 0 ) )  }) ,  out_len + 6 + 1 + 1 ) ;
int i= 0 ;
 if ( n_digit > 0  &&  out_len > n_digit ) {
 out_len  =  n_digit + 1 ;
 }
 ;
 if ( neg ) {
array_set(&/*q*/ buf , i , & (byte []) {  '-' }) ;
 i ++ ;
 }
 ;
int disp= 0 ;
 if ( out_len <= 1 ) {
 disp  =  1 ;
 }
 ;
int y= i + out_len ;
int x= 0 ;
 while ( x < ( out_len - disp - 1 ) ) {
 
array_set(&/*q*/ buf , y - x , & (byte []) {  '0' + ((byte)( out % 10 ) ) }) ;
 out  /=  10 ;
 i ++ ;
 x ++ ;
 }
 ;
 if ( out_len >= 1 ) {
array_set(&/*q*/ buf , y - x , & (byte []) {  '.' }) ;
 x ++ ;
 i ++ ;
 }
 ;
 if ( y - x >= 0 ) {
array_set(&/*q*/ buf , y - x , & (byte []) {  '0' + ((byte)( out % 10 ) ) }) ;
 i ++ ;
 }
 ;
array_set(&/*q*/ buf , i , & (byte []) {  'e' }) ;
 i ++ ;
int exp= d .e + out_len - 1 ;
 if ( exp < 0 ) {
array_set(&/*q*/ buf , i , & (byte []) {  '-' }) ;
 i ++ ;
 exp  =  - exp ;
 }
  else { 
array_set(&/*q*/ buf , i , & (byte []) {  '+' }) ;
 i ++ ;
 }
 ;
int d2= exp % 10 ;
 exp  /=  10 ;
int d1= exp % 10 ;
int d0= exp / 10 ;
 if ( d0 > 0 ) {
array_set(&/*q*/ buf , i , & (byte []) {  '0' + ((byte)( d0 ) ) }) ;
 i ++ ;
 }
 ;
array_set(&/*q*/ buf , i , & (byte []) {  '0' + ((byte)( d1 ) ) }) ;
 i ++ ;
array_set(&/*q*/ buf , i , & (byte []) {  '0' + ((byte)( d2 ) ) }) ;
 i ++ ;
array_set(&/*q*/ buf , i , & (byte []) {  0 }) ;
return  tos ( ((byteptr)( & ( *(byte*) array_get(  buf , 0) ) ) ) , i ) ;
 }
 _V_MulRet_strconv_dot_ftoa__Dec64_V_bool strconv_dot_ftoa__f64_to_decimal_exact_int (u64 i_mant, u64 exp) {
strconv_dot_ftoa__Dec64 d= (strconv_dot_ftoa__Dec64) { .m =   ((u64)( 0 ) ) , .e =   0 } ;
u64 e= exp - strconv_dot_ftoa__bias64 ;
 if ( e > strconv_dot_ftoa__mantbits64 ) {
return (_V_MulRet_strconv_dot_ftoa__Dec64_V_bool){.var_0=d,.var_1=0} ;
 }
 ;
u32 shift= strconv_dot_ftoa__mantbits64 - e ;
u64 mant= i_mant | 0x0010000000000000 ;
 d .m  =  mant  >>  shift ;
 if ( ( d .m  <<  shift ) != mant ) {
return (_V_MulRet_strconv_dot_ftoa__Dec64_V_bool){.var_0=d,.var_1=0} ;
 }
 ;
 while ( ( d .m % 10 ) == 0 ) {
 
 d .m  /=  10 ;
 d .e ++ ;
 }
 ;
return (_V_MulRet_strconv_dot_ftoa__Dec64_V_bool){.var_0=d,.var_1=1} ;
 }
 strconv_dot_ftoa__Dec64 strconv_dot_ftoa__f64_to_decimal (u64 mant, u64 exp) {
int e2= 0 ;
u64 m2= ((u64)( 0 ) ) ;
 if ( exp == 0 ) {
 e2  =  1 - strconv_dot_ftoa__bias64 - strconv_dot_ftoa__mantbits64 - 2 ;
 m2  =  mant ;
 }
  else { 
 e2  =  ((int)( exp ) ) - strconv_dot_ftoa__bias64 - strconv_dot_ftoa__mantbits64 - 2 ;
 m2  =  ( ((u64)( 1 ) )  <<  strconv_dot_ftoa__mantbits64 ) | mant ;
 }
 ;
bool even= ( m2 & 1 ) == 0 ;
bool accept_bounds= even ;
u64 mv= ((u64)( 4 * m2 ) ) ;
u64 mm_shift= strconv_dot_ftoa__bool_to_u64 ( mant != 0  ||  exp <= 1 ) ;
u64 vr= ((u64)( 0 ) ) ;
u64 vp= ((u64)( 0 ) ) ;
u64 vm= ((u64)( 0 ) ) ;
int e10= 0 ;
bool vm_is_trailing_zeros= 0 ;
bool vr_is_trailing_zeros= 0 ;
 if ( e2 >= 0 ) {
u32 q= strconv_dot_ftoa__log10_pow2 ( e2 ) - strconv_dot_ftoa__bool_to_u32 ( e2 > 3 ) ;
 e10  =  ((int)( q ) ) ;
int k= strconv_dot_ftoa__pow5_inv_num_bits_64 + strconv_dot_ftoa__pow5_bits ( ((int)( q ) ) ) - 1 ;
int i= - e2 + ((int)( q ) ) + k ;
strconv_dot_ftoa__Uint128 mul= ( *(strconv_dot_ftoa__Uint128*) array_get(  strconv_dot_ftoa__pow5_inv_split_64 , q) ) ;
 vr  =  strconv_dot_ftoa__mul_shift_64 ( ((u64)( 4 ) ) * m2 , mul , i ) ;
 vp  =  strconv_dot_ftoa__mul_shift_64 ( ((u64)( 4 ) ) * m2 + ((u64)( 2 ) ) , mul , i ) ;
 vm  =  strconv_dot_ftoa__mul_shift_64 ( ((u64)( 4 ) ) * m2 - ((u64)( 1 ) ) - mm_shift , mul , i ) ;
 if ( q <= 21 ) {
 if ( mv % 5 == 0 ) {
 vr_is_trailing_zeros  =  strconv_dot_ftoa__multiple_of_power_of_five_64 ( mv , q ) ;
 }
  else  if ( accept_bounds ) {
 vm_is_trailing_zeros  =  strconv_dot_ftoa__multiple_of_power_of_five_64 ( mv - 1 - mm_shift , q ) ;
 }
  else  if ( strconv_dot_ftoa__multiple_of_power_of_five_64 ( mv + 2 , q ) ) {
 vp -- ;
 }
 ;
 }
 ;
 }
  else { 
u32 q= strconv_dot_ftoa__log10_pow5 ( - e2 ) - strconv_dot_ftoa__bool_to_u32 ( - e2 > 1 ) ;
 e10  =  ((int)( q ) ) + e2 ;
int i= - e2 - ((int)( q ) ) ;
int k= strconv_dot_ftoa__pow5_bits ( i ) - strconv_dot_ftoa__pow5_num_bits_64 ;
int j= ((int)( q ) ) - k ;
strconv_dot_ftoa__Uint128 mul= ( *(strconv_dot_ftoa__Uint128*) array_get(  strconv_dot_ftoa__pow5_split_64 , i) ) ;
 vr  =  strconv_dot_ftoa__mul_shift_64 ( ((u64)( 4 ) ) * m2 , mul , j ) ;
 vp  =  strconv_dot_ftoa__mul_shift_64 ( ((u64)( 4 ) ) * m2 + ((u64)( 2 ) ) , mul , j ) ;
 vm  =  strconv_dot_ftoa__mul_shift_64 ( ((u64)( 4 ) ) * m2 - ((u64)( 1 ) ) - mm_shift , mul , j ) ;
 if ( q <= 1 ) {
 vr_is_trailing_zeros  =  1 ;
 if ( accept_bounds ) {
 vm_is_trailing_zeros  =  ( mm_shift == 1 ) ;
 }
  else { 
 vp -- ;
 }
 ;
 }
  else  if ( q < 63 ) {
 vr_is_trailing_zeros  =  strconv_dot_ftoa__multiple_of_power_of_two_64 ( mv , q - 1 ) ;
 }
 ;
 }
 ;
int removed= 0 ;
byte last_removed_digit= ((byte)( 0 ) ) ;
u64 out= ((u64)( 0 ) ) ;
 if ( vm_is_trailing_zeros  ||  vr_is_trailing_zeros ) {
 while (1) { 
u64 vp_div_10= vp / 10 ;
u64 vm_div_10= vm / 10 ;
 if ( vp_div_10 <= vm_div_10 ) {
 break
 ;
 }
 ;
u64 vm_mod_10= vm % 10 ;
u64 vr_div_10= vr / 10 ;
u64 vr_mod_10= vr % 10 ;
 vm_is_trailing_zeros  =  vm_is_trailing_zeros  &&  vm_mod_10 == 0 ;
 vr_is_trailing_zeros  =  vr_is_trailing_zeros  &&  ( last_removed_digit == 0 ) ;
 last_removed_digit  =  ((byte)( vr_mod_10 ) ) ;
 vr  =  vr_div_10 ;
 vp  =  vp_div_10 ;
 vm  =  vm_div_10 ;
 removed ++ ;
 }
 ;
 if ( vm_is_trailing_zeros ) {
 while (1) { 
u64 vm_div_10= vm / 10 ;
u64 vm_mod_10= vm % 10 ;
 if ( vm_mod_10 != 0 ) {
 break
 ;
 }
 ;
u64 vp_div_10= vp / 10 ;
u64 vr_div_10= vr / 10 ;
u64 vr_mod_10= vr % 10 ;
 vr_is_trailing_zeros  =  vr_is_trailing_zeros  &&  ( last_removed_digit == 0 ) ;
 last_removed_digit  =  ((byte)( vr_mod_10 ) ) ;
 vr  =  vr_div_10 ;
 vp  =  vp_div_10 ;
 vm  =  vm_div_10 ;
 removed ++ ;
 }
 ;
 }
 ;
 if ( vr_is_trailing_zeros  &&  ( last_removed_digit == 5 )  &&  ( vr % 2 ) == 0 ) {
 last_removed_digit  =  4 ;
 }
 ;
 out  =  vr ;
 if ( ( vr == vm  &&  ( ! accept_bounds  ||  ! vm_is_trailing_zeros ) )  ||  last_removed_digit >= 5 ) {
 out ++ ;
 }
 ;
 }
  else { 
bool round_up= 0 ;
 while ( vp / 100 > vm / 100 ) {
 
 round_up  =  ( vr % 100 ) >= 50 ;
 vr  /=  100 ;
 vp  /=  100 ;
 vm  /=  100 ;
 removed  +=  2 ;
 }
 ;
 while ( vp / 10 > vm / 10 ) {
 
 round_up  =  ( vr % 10 ) >= 5 ;
 vr  /=  10 ;
 vp  /=  10 ;
 vm  /=  10 ;
 removed ++ ;
 }
 ;
 out  =  vr + strconv_dot_ftoa__bool_to_u64 ( vr == vm  ||  round_up ) ;
 }
 ;
return  (strconv_dot_ftoa__Dec64) { .m =  out , .e =  e10 + removed } ;
 }
 string strconv_dot_ftoa__f64_to_str (f64 f, int n_digit) {
strconv_dot_ftoa__Uf64 u1= (strconv_dot_ftoa__Uf64) { .f =   ((f64)( 0 ) ) , .u =  0 } ;
 u1 .f  =  f ;
u64 u= u1 .u ;
bool neg= ( u  >>  ( strconv_dot_ftoa__mantbits64 + strconv_dot_ftoa__expbits64 ) ) != 0 ;
u64 mant= u & ( ( ((u64)( 1 ) )  <<  strconv_dot_ftoa__mantbits64 ) - ((u64)( 1 ) ) ) ;
u64 exp= ( u  >>  strconv_dot_ftoa__mantbits64 ) & ( ( ((u64)( 1 ) )  <<  strconv_dot_ftoa__expbits64 ) - ((u64)( 1 ) ) ) ;
 if ( ( exp == strconv_dot_ftoa__maxexp64 )  ||  ( exp == 0  &&  mant == 0 ) ) {
return  strconv_dot_ftoa__get_string_special ( neg , exp == 0 , mant == 0 ) ;
 }
 ;
_V_MulRet_strconv_dot_ftoa__Dec64_V_bool _V_mret_1353_d_ok= strconv_dot_ftoa__f64_to_decimal_exact_int ( mant , exp ) ;
 strconv_dot_ftoa__Dec64 d = _V_mret_1353_d_ok.var_0 ;
 bool ok = _V_mret_1353_d_ok.var_1 ;
 if ( ! ok ) {
 d  =  strconv_dot_ftoa__f64_to_decimal ( mant , exp ) ;
 }
 ;
return  strconv_dot_ftoa__Dec64_get_string_64 ( d ,  neg , n_digit ) ;
 }
 static inline string strconv_dot_ftoa__ftoa_64 (f64 f) {
return  strconv_dot_ftoa__f64_to_str ( f , 17 ) ;
 }
 static inline string strconv_dot_ftoa__ftoa_long_64 (f64 f) {
return  strconv_dot_ftoa__f64_to_str_l ( f ) ;
 }
 static inline string strconv_dot_ftoa__ftoa_32 (f32 f) {
return  strconv_dot_ftoa__f32_to_str ( f , 8 ) ;
 }
 static inline string strconv_dot_ftoa__ftoa_long_32 (f32 f) {
return  strconv_dot_ftoa__f32_to_str_l ( f ) ;
 }
 void strconv_dot_ftoa__assert1 (bool t, string msg) {
 if ( ! t ) {
 v_panic ( msg ) ;
 }
 ;
 }
 static inline int strconv_dot_ftoa__bool_to_int (bool b) {
 if ( b ) {
return  1 ;
 }
 ;
return  0 ;
 }
 static inline u32 strconv_dot_ftoa__bool_to_u32 (bool b) {
 if ( b ) {
return  ((u32)( 1 ) ) ;
 }
 ;
return  ((u32)( 0 ) ) ;
 }
 static inline u64 strconv_dot_ftoa__bool_to_u64 (bool b) {
 if ( b ) {
return  ((u64)( 1 ) ) ;
 }
 ;
return  ((u64)( 0 ) ) ;
 }
 string strconv_dot_ftoa__get_string_special (bool neg, bool expZero, bool mantZero) {
 if ( ! mantZero ) {
return  tos3("nan") ;
 }
 ;
 if ( ! expZero ) {
 if ( neg ) {
return  tos3("-inf") ;
 }
  else { 
return  tos3("+inf") ;
 }
 ;
 }
 ;
 if ( neg ) {
return  tos3("-0e+00") ;
 }
 ;
return  tos3("0e+00") ;
 }
 int strconv_dot_ftoa__decimal_len_32 (u32 u) {
 strconv_dot_ftoa__assert1 ( u < 1000000000 , tos3("too big") ) ;
 if ( u >= 100000000 ) {
return  9 ;
 }
  else  if ( u >= 10000000 ) {
return  8 ;
 }
  else  if ( u >= 1000000 ) {
return  7 ;
 }
  else  if ( u >= 100000 ) {
return  6 ;
 }
  else  if ( u >= 10000 ) {
return  5 ;
 }
  else  if ( u >= 1000 ) {
return  4 ;
 }
  else  if ( u >= 100 ) {
return  3 ;
 }
  else  if ( u >= 10 ) {
return  2 ;
 }
 ;
return  1 ;
 }
 u32 strconv_dot_ftoa__mul_shift_32 (u32 m, u64 mul, int ishift) {
 bool tmp1 =  ishift > 32 ;

/// sline: ""
if (!tmp1) {
	g_test_fails++;
	eprintln(tos3("/mnt/c/v/vlib/strconv/ftoa/utilities.v:100: FAILED: strconv_dot_ftoa__mul_shift_32()"));
	eprintln(tos3("Source: "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
_V_MulRet_u64_V_u64 _V_mret_259_hi_lo= math_dot_bits__mul_64 ( ((u64)( m ) ) , mul ) ;
 u64 hi = _V_mret_259_hi_lo.var_0 ;
 u64 lo = _V_mret_259_hi_lo.var_1 ;
u64 shifted_sum= ( lo  >>  ((u64)( ishift ) ) ) + ( hi  <<  ((u64)( 64 - ishift ) ) ) ;
 strconv_dot_ftoa__assert1 ( shifted_sum <= math__max_u32 , tos3("shiftedSum <= math.max_u32") ) ;
return  ((u32)( shifted_sum ) ) ;
 }
 u32 strconv_dot_ftoa__mul_pow5_invdiv_pow2 (u32 m, u32 q, int j) {
return  strconv_dot_ftoa__mul_shift_32 ( m , ( *(u64*) array_get(  strconv_dot_ftoa__pow5_inv_split_32 , q) ) , j ) ;
 }
 u32 strconv_dot_ftoa__mul_pow5_div_pow2 (u32 m, u32 i, int j) {
return  strconv_dot_ftoa__mul_shift_32 ( m , ( *(u64*) array_get(  strconv_dot_ftoa__pow5_split_32 , i) ) , j ) ;
 }
 u32 strconv_dot_ftoa__pow5_factor_32 (u32 i_v) {
u32 v= i_v ;
 for (
u32 n= ((u32)( 0 ) )  ;   ;  n ++ ) { 
 
u32 q= v / 5 ;
u32 r= v % 5 ;
 if ( r != 0 ) {
return  n ;
 }
 ;
 v  =  q ;
 }
 ;
return  v ;
 }
 bool strconv_dot_ftoa__multiple_of_power_of_five_32 (u32 v, u32 p) {
return  strconv_dot_ftoa__pow5_factor_32 ( v ) >= p ;
 }
 bool strconv_dot_ftoa__multiple_of_power_of_two_32 (u32 v, u32 p) {
return  ((u32)( math_dot_bits__trailing_zeros_32 ( v ) ) ) >= p ;
 }
 u32 strconv_dot_ftoa__log10_pow2 (int e) {
 strconv_dot_ftoa__assert1 ( e >= 0 , tos3("e >= 0") ) ;
 strconv_dot_ftoa__assert1 ( e <= 1650 , tos3("e <= 1650") ) ;
return  ( ((u32)( e ) ) * 78913 )  >>  18 ;
 }
 u32 strconv_dot_ftoa__log10_pow5 (int e) {
 strconv_dot_ftoa__assert1 ( e >= 0 , tos3("e >= 0") ) ;
 strconv_dot_ftoa__assert1 ( e <= 2620 , tos3("e <= 2620") ) ;
return  ( ((u32)( e ) ) * 732923 )  >>  20 ;
 }
 int strconv_dot_ftoa__pow5_bits (int e) {
 strconv_dot_ftoa__assert1 ( e >= 0 , tos3("e >= 0") ) ;
 strconv_dot_ftoa__assert1 ( e <= 3528 , tos3("e <= 3528") ) ;
return  ((int)( ( ( ((u32)( e ) ) * 1217359 )  >>  19 ) + 1 ) ) ;
 }
 int strconv_dot_ftoa__decimal_len_64 (u64 u) {
int log2= 64 - math_dot_bits__leading_zeros_64 ( u ) - 1 ;
int t= ( log2 + 1 ) * 1233  >>  12 ;
return  t - strconv_dot_ftoa__bool_to_int ( u < ( *(u64*) array_get(  strconv_dot_ftoa__powers_of_10 , t) ) ) + 1 ;
 }
 u64 strconv_dot_ftoa__shift_right_128 (strconv_dot_ftoa__Uint128 v, int shift) {
 strconv_dot_ftoa__assert1 ( shift < 64 , tos3("shift < 64") ) ;
return  ( v .hi  <<  ((u64)( 64 - shift ) ) ) | ( v .lo  >>  ((u32)( shift ) ) ) ;
 }
 u64 strconv_dot_ftoa__mul_shift_64 (u64 m, strconv_dot_ftoa__Uint128 mul, int shift) {
_V_MulRet_u64_V_u64 _V_mret_676_hihi_hilo= math_dot_bits__mul_64 ( m , mul .hi ) ;
 u64 hihi = _V_mret_676_hihi_hilo.var_0 ;
 u64 hilo = _V_mret_676_hihi_hilo.var_1 ;
_V_MulRet_u64_V_u64 _V_mret_690_lohi__= math_dot_bits__mul_64 ( m , mul .lo ) ;
 u64 lohi = _V_mret_690_lohi__.var_0 ;
strconv_dot_ftoa__Uint128 sum= (strconv_dot_ftoa__Uint128) { .hi =  hihi , .lo =  lohi + hilo } ;
 if ( sum .lo < lohi ) {
 sum .hi ++ ;
 }
 ;
return  strconv_dot_ftoa__shift_right_128 ( sum , shift - 64 ) ;
 }
 u32 strconv_dot_ftoa__pow5_factor_64 (u64 v_i) {
u64 v= v_i ;
 for (
u32 n= ((u32)( 0 ) )  ;   ;  n ++ ) { 
 
u64 q= v / 5 ;
u64 r= v % 5 ;
 if ( r != 0 ) {
return  n ;
 }
 ;
 v  =  q ;
 }
 ;
return  ((u32)( 0 ) ) ;
 }
 bool strconv_dot_ftoa__multiple_of_power_of_five_64 (u64 v, u32 p) {
return  strconv_dot_ftoa__pow5_factor_64 ( v ) >= p ;
 }
 bool strconv_dot_ftoa__multiple_of_power_of_two_64 (u64 v, u32 p) {
return  ((u32)( math_dot_bits__trailing_zeros_64 ( v ) ) ) >= p ;
 }
 string strconv_dot_ftoa__f32_to_str_l (f64 f) {
return  strconv_dot_ftoa__f64_to_str_l ( ((f32)( f ) ) ) ;
 }
 string strconv_dot_ftoa__f64_to_str_l (f64 f) {
string s= strconv_dot_ftoa__f64_to_str ( f , 18 ) ;
 if ( s .len > 2  &&  ( string_at( s ,  0) == 'N'  ||  string_at( s ,  1) == 'i' ) ) {
return  s ;
 }
 ;
bool m_sgn_flag= 0 ;
int sgn= 1 ;
byte b  [26 ] = { 0 } ;
int d_pos= 1 ;
int i= 0 ;
int i1= 0 ;
int exp= 0 ;
int exp_sgn= 1 ;
 string tmp12 =  s;
 ;
for (int tmp13 = 0; tmp13 < tmp12 .len; tmp13 ++) {
 byte c = tmp12.str[tmp13];
 
 if ( c == '-' ) {
 sgn  =  - 1 ;
 i ++ ;
 }
  else  if ( c == '+' ) {
 sgn  =  1 ;
 i ++ ;
 }
  else  if ( c >= '0'  &&  c <= '9' ) {
 b [ i1 ++ ]/*rbyte 1*/  =  c ;
 i ++ ;
 }
  else  if ( c == '.' ) {
 if ( sgn > 0 ) {
 d_pos  =  i ;
 }
  else { 
 d_pos  =  i - 1 ;
 }
 ;
 i ++ ;
 }
  else  if ( c == 'e' ) {
 i ++ ;
 break
 ;
 }
  else { 
return  tos3("Float conversion error!!") ;
 }
 ;
 }
 ;
 b [ i1 ]/*rbyte 1*/  =  0 ;
 if ( string_at( s ,  i) == '-' ) {
 exp_sgn  =  - 1 ;
 i ++ ;
 }
  else  if ( string_at( s ,  i) == '+' ) {
 exp_sgn  =  1 ;
 i ++ ;
 }
 ;
 string tmp18 =  string_substr2( s ,  i , -1, true);
 ;
for (int tmp21 = 0; tmp21 < tmp18 .len; tmp21 ++) {
 byte c = tmp18.str[tmp21];
 
 exp  =  exp * 10 + ((int)( c - '0' ) ) ;
 }
 ;
array_byte res= array_repeat (new_array_from_c_array(1, 1, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 1 ) {  '0'  }) ,  exp + 32 ) ;
int r_i= 0 ;
 if ( sgn == 1 ) {
 if ( m_sgn_flag ) {
array_set(&/*q*/ res , r_i ++ , & (byte []) {  '+' }) ;
 }
 ;
 }
  else { 
array_set(&/*q*/ res , r_i ++ , & (byte []) {  '-' }) ;
 }
 ;
 i  =  0 ;
 if ( exp_sgn >= 0 ) {
 while ( b [ i ]/*rbyte 1*/ != 0 ) {
 
array_set(&/*q*/ res , r_i ++ , & (byte []) {  b [ i ]/*rbyte 1*/ }) ;
 i ++ ;
 if ( i >= d_pos  &&  exp >= 0 ) {
 if ( exp == 0 ) {
array_set(&/*q*/ res , r_i ++ , & (byte []) {  '.' }) ;
 }
 ;
 exp -- ;
 }
 ;
 }
 ;
 while ( exp >= 0 ) {
 
array_set(&/*q*/ res , r_i ++ , & (byte []) {  '0' }) ;
 exp -- ;
 }
 ;
 }
  else { 
bool dot_p= 1 ;
 while ( exp > 0 ) {
 
array_set(&/*q*/ res , r_i ++ , & (byte []) {  '0' }) ;
 exp -- ;
 if ( dot_p ) {
array_set(&/*q*/ res , r_i ++ , & (byte []) {  '.' }) ;
 dot_p  =  0 ;
 }
 ;
 }
 ;
 while ( b [ i ]/*rbyte 1*/ != 0 ) {
 
array_set(&/*q*/ res , r_i ++ , & (byte []) {  b [ i ]/*rbyte 1*/ }) ;
 i ++ ;
 }
 ;
 }
 ;
array_set(&/*q*/ res , r_i , & (byte []) {  0 }) ;
return  tos ( & ( *(byte*) array_get(  res , 0) ) , r_i ) ;
 }
 hashmap__Hashmap hashmap__new_hmap () {
return  (hashmap__Hashmap) { .cap =  hashmap__init_cap , .shift =  hashmap__init_log_capicity , .window =  hashmap__cached_hashbits , .key_values =  hashmap__new_dense_arr ( ) , .metas =  ((u32*)( vcalloc ( sizeof( u32) * ( hashmap__init_capicity + hashmap__extra_metas_inc ) ) ) ) , .max_load_factor =  hashmap__init_max_load_factor , .extra_metas =  hashmap__extra_metas_inc , .size =  0 } ;
 }
 static inline hashmap__DenseArr hashmap__new_dense_arr () {
 {
return  (hashmap__DenseArr) { .data =  ((hashmap__Kv*)( v_malloc ( 8 * sizeof( hashmap__Kv) ) ) ) , .cap =  8 , .size =  0 } ;
 }
 ;
 }
 static inline u32 hashmap__DenseArr_push (hashmap__DenseArr* d, hashmap__Kv value) {
 if ( d ->cap == d ->size ) {
 d ->cap  +=  d ->cap  >>  3 ;
 d ->data  =  ((hashmap__Kv*)( realloc ( d ->data ,  sizeof( hashmap__Kv) * d ->cap ) ) ) ;
 }
 ;
u32 push_index= d ->size ;
 d ->data [/*ptr!*/ push_index ]/*rhashmap__Kv 1*/  =  value ;
 d ->size ++ ;
return  push_index ;
 }
 void hashmap__DenseArr_zeros_to_end (hashmap__DenseArr* d) {
u32 count= ((u32)( 0 ) ) ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  d ->size; tmp2++) {
 int i = tmp2;
 
 if ( d ->data [/*ptr!*/ i ]/*rhashmap__Kv 1*/ .key .str != 0 ) {
hashmap__Kv tmp= d ->data [/*ptr!*/ count ]/*rhashmap__Kv 1*/ ;
 d ->data [/*ptr!*/ count ]/*rhashmap__Kv 1*/  =  d ->data [/*ptr!*/ i ]/*rhashmap__Kv 1*/ ;
 d ->data [/*ptr!*/ i ]/*rhashmap__Kv 1*/  =  tmp ;
 count ++ ;
 }
 ;
 }
 ;
 d ->size  =  count ;
 d ->cap  =  (( count <= 8 ) ? ( 8 ) : ( count )) ;
 d ->data  =  ((hashmap__Kv*)( realloc ( d ->data ,  sizeof( hashmap__Kv) * d ->cap ) ) ) ;
 }
 static inline _V_MulRet_u64_V_u32 hashmap__Hashmap_key_to_index (hashmap__Hashmap h, string key) {
u64 hash= hash_dot_wyhash__wyhash_c ( key .str , ((u64)( key .len ) ) , 0 ) ;
u64 index= hash & h .cap ;
u32 meta= ((u32)( ( ( hash  >>  h .shift ) & hashmap__hash_mask ) | hashmap__probe_inc ) ) ;
return (_V_MulRet_u64_V_u32){.var_0=index,.var_1=meta} ;
 }
 static inline _V_MulRet_u64_V_u32 hashmap__meta_less (u32* metas, u64 i, u32 m) {
u64 index= i ;
u32 meta= m ;
 while ( meta < metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
return (_V_MulRet_u64_V_u32){.var_0=index,.var_1=meta} ;
 }
 static inline void hashmap__Hashmap_meta_greater (hashmap__Hashmap* h, u64 i, u32 m, u32 kvi) {
u32 meta= m ;
u64 index= i ;
u32 kv_index= kvi ;
 while ( h ->metas [/*ptr!*/ index ]/*ru32 1*/ != 0 ) {
 
 if ( meta > h ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
u32 tmp_meta= h ->metas [/*ptr!*/ index ]/*ru32 1*/ ;
 h ->metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 meta  =  tmp_meta ;
u32 tmp_index= h ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 h ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 kv_index  =  tmp_index ;
 }
 ;
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
 h ->metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 h ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
u32 probe_count= ( meta  >>  hashmap__hashbits ) - 1 ;
 if ( ( probe_count  <<  1 ) == h ->extra_metas ) {
 h ->extra_metas  +=  hashmap__extra_metas_inc ;
u32 mem_size= ( h ->cap + 2 + h ->extra_metas ) ;
 h ->metas  =  ((u32*)( realloc ( h ->metas ,  sizeof( u32) * mem_size ) ) ) ;
 memset ((u32*)(u32*) h ->metas + mem_size - hashmap__extra_metas_inc ,  0 ,  sizeof( u32) * hashmap__extra_metas_inc ) ;
 if ( probe_count == 252 ) {
 hashmap__Hashmap_expand ( h ) ;
 }
 ;
 }
 ;
 }
 static inline u32* hashmap__Hashmap_meta_greater2 (hashmap__Hashmap* h, u32* met, u64 i, u32 m, u32 kvi) {
u32* metas= met ;
u32 meta= m ;
u64 index= i ;
u32 kv_index= kvi ;
 while ( metas [/*ptr!*/ index ]/*ru32 1*/ != 0 ) {
 
 if ( meta > metas [/*ptr!*/ index ]/*ru32 1*/ ) {
u32 tmp_meta= metas [/*ptr!*/ index ]/*ru32 1*/ ;
 metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 meta  =  tmp_meta ;
u32 tmp_index= metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
 kv_index  =  tmp_index ;
 }
 ;
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
 metas [/*ptr!*/ index ]/*ru32 1*/  =  meta ;
 metas [/*ptr!*/ index + 1 ]/*ru32 1*/  =  kv_index ;
u32 probe_count= ( meta  >>  hashmap__hashbits ) - 1 ;
 if ( ( probe_count  <<  1 ) == h ->extra_metas ) {
 h ->extra_metas  +=  hashmap__extra_metas_inc ;
u32 mem_size= ( h ->cap + 2 + h ->extra_metas ) ;
 metas  =  ((u32*)( realloc ( metas ,  sizeof( u32) * mem_size ) ) ) ;
 memset ((u32*)(u32*) metas + mem_size - hashmap__extra_metas_inc ,  0 ,  sizeof( u32) * hashmap__extra_metas_inc ) ;
 if ( probe_count == 252 ) {
 hashmap__Hashmap_expand ( h ) ;
 }
 ;
 }
 ;
return  metas ;
 }
 void hashmap__Hashmap_set (hashmap__Hashmap* h, string key, int value) {
f32 load_factor= ((f32)( h ->size  <<  1 ) ) / ((f32)( h ->cap ) ) ;
 if (macro_f32_gt( load_factor , h ->max_load_factor ) ) {
 hashmap__Hashmap_expand ( h ) ;
 }
 ;
_V_MulRet_u64_V_u32 _V_mret_977_index_meta= hashmap__Hashmap_key_to_index (* h ,  key ) ;
 u64 index = _V_mret_977_index_meta.var_0 ;
 u32 meta = _V_mret_977_index_meta.var_1 ;
_V_MulRet_u64_V_u32 _V_mret_987_index_meta= hashmap__meta_less ( h ->metas , index , meta ) ;
 index = _V_mret_987_index_meta.var_0 ;
 meta = _V_mret_987_index_meta.var_1 ;
 while ( meta == h ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
u32 kv_index= h ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 if (string_eq( key , h ->key_values .data [/*ptr!*/ kv_index ]/*rhashmap__Kv 1*/ .key ) ) {
 h ->key_values .data [/*ptr!*/ kv_index ]/*rhashmap__Kv 1*/ .value  =  value ;
 
 return ;
 }
 ;
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
hashmap__Kv kv= (hashmap__Kv) { key , value } ;
u32 kv_index= hashmap__DenseArr_push (& /* ? */ h ->key_values ,  kv ) ;
 h ->metas  =  hashmap__Hashmap_meta_greater2 ( h ,  h ->metas , index , meta , kv_index ) ;
 h ->size ++ ;
 }
 void hashmap__Hashmap_rehash (hashmap__Hashmap* h) {
int meta_bytes= sizeof( u32) * ( h ->cap + 2 + h ->extra_metas ) ;
 h ->metas  =  ((u32*)( realloc ( h ->metas ,  meta_bytes ) ) ) ;
 memset ( h ->metas ,  0 ,  meta_bytes ) ;
 for (
u32 i= ((u32)( 0 ) )  ;  i < h ->key_values .size  ;  i ++ ) { 
 
 if ( h ->key_values .data [/*ptr!*/ i ]/*rhashmap__Kv 1*/ .key .str == 0 ) {
 continue
 ;
 }
 ;
_V_MulRet_u64_V_u32 _V_mret_1193_index_meta= hashmap__Hashmap_key_to_index (* h ,  h ->key_values .data [/*ptr!*/ i ]/*rhashmap__Kv 1*/ .key ) ;
 u64 index = _V_mret_1193_index_meta.var_0 ;
 u32 meta = _V_mret_1193_index_meta.var_1 ;
_V_MulRet_u64_V_u32 _V_mret_1212_index_meta= hashmap__meta_less ( h ->metas , index , meta ) ;
 index = _V_mret_1212_index_meta.var_0 ;
 meta = _V_mret_1212_index_meta.var_1 ;
 h ->metas  =  hashmap__Hashmap_meta_greater2 ( h ,  h ->metas , index , meta , i ) ;
 }
 ;
 }
 void hashmap__Hashmap_cached_rehash (hashmap__Hashmap* h, u32 old_cap) {
u32* new_meta= ((u32*)( vcalloc ( sizeof( u32) * ( h ->cap + 2 + h ->extra_metas ) ) ) ) ;
u32 old_extra_metas= h ->extra_metas ;
 for (
int i= 0  ;  i <= old_cap + old_extra_metas  ;  i  +=  2 ) { 
 
 if ( h ->metas [/*ptr!*/ i ]/*ru32 1*/ == 0 ) {
 continue
 ;
 }
 ;
u32 old_meta= h ->metas [/*ptr!*/ i ]/*ru32 1*/ ;
u64 old_probe_count= ((u64)( ( old_meta  >>  hashmap__hashbits ) - 1 ) )  <<  1 ;
int old_index= ( i - old_probe_count ) & ( h ->cap  >>  1 ) ;
u64 index= ((u64)( old_index ) ) | ( old_meta  <<  h ->shift ) & h ->cap ;
u32 meta= ( old_meta & hashmap__hash_mask ) | hashmap__probe_inc ;
_V_MulRet_u64_V_u32 _V_mret_1382_index_meta= hashmap__meta_less ( new_meta , index , meta ) ;
 index = _V_mret_1382_index_meta.var_0 ;
 meta = _V_mret_1382_index_meta.var_1 ;
u32 kv_index= h ->metas [/*ptr!*/ i + 1 ]/*ru32 1*/ ;
 new_meta  =  hashmap__Hashmap_meta_greater2 ( h ,  new_meta , index , meta , kv_index ) ;
 }
 ;
 {
 v_free ( h ->metas ) ;
 }
 ;
 h ->metas  =  new_meta ;
 }
 void hashmap__Hashmap_expand (hashmap__Hashmap* h) {
u32 old_cap= h ->cap ;
 h ->cap  =  ( ( h ->cap + 2 )  <<  1 ) - 2 ;
 if ( h ->window == 0 ) {
 h ->shift  +=  hashmap__cached_hashbits ;
 hashmap__Hashmap_rehash ( h ) ;
 h ->window  =  hashmap__cached_hashbits ;
 }
  else { 
 hashmap__Hashmap_cached_rehash ( h ,  old_cap ) ;
 }
 ;
 h ->window -- ;
 }
 void hashmap__Hashmap_shrink (hashmap__Hashmap* h) {
 hashmap__DenseArr_zeros_to_end (& /* ? */ h ->key_values ) ;
 h ->cap  =  ( ( h ->cap + 2 )  >>  1 ) - 2 ;
 if ( h ->window == 16 ) {
 h ->shift  -=  hashmap__cached_hashbits ;
 h ->window  =  0 ;
 }
 ;
 hashmap__Hashmap_rehash ( h ) ;
 h ->window ++ ;
 }
 static inline int hashmap__Hashmap_get (hashmap__Hashmap h, string key) {
_V_MulRet_u64_V_u32 _V_mret_1583_index_meta= hashmap__Hashmap_key_to_index ( h ,  key ) ;
 u64 index = _V_mret_1583_index_meta.var_0 ;
 u32 meta = _V_mret_1583_index_meta.var_1 ;
 while ( meta < h .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
 while ( meta == h .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
u32 kv_index= h .metas [/*ptr!*/ index + 1 ]/*ru32 0*/ ;
 if (string_eq( key , h .key_values .data [/*ptr!*/ kv_index ]/*rhashmap__Kv 0*/ .key ) ) {
return  h .key_values .data [/*ptr!*/ kv_index ]/*rhashmap__Kv 0*/ .value ;
 }
 ;
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
return  0 ;
 }
 bool hashmap__Hashmap_exists (hashmap__Hashmap h, string key) {
_V_MulRet_u64_V_u32 _V_mret_1681_index_meta= hashmap__Hashmap_key_to_index ( h ,  key ) ;
 u64 index = _V_mret_1681_index_meta.var_0 ;
 u32 meta = _V_mret_1681_index_meta.var_1 ;
 while ( meta < h .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
 while ( meta == h .metas [/*ptr!*/ index ]/*ru32 0*/ ) {
 
u32 kv_index= h .metas [/*ptr!*/ index + 1 ]/*ru32 0*/ ;
 if (string_eq( key , h .key_values .data [/*ptr!*/ kv_index ]/*rhashmap__Kv 0*/ .key ) ) {
return  1 ;
 }
 ;
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
return  0 ;
 }
 void hashmap__Hashmap_delete (hashmap__Hashmap* h, string key) {
_V_MulRet_u64_V_u32 _V_mret_1770_index_meta= hashmap__Hashmap_key_to_index (* h ,  key ) ;
 u64 index = _V_mret_1770_index_meta.var_0 ;
 u32 meta = _V_mret_1770_index_meta.var_1 ;
 while ( meta < h ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
 while ( meta == h ->metas [/*ptr!*/ index ]/*ru32 1*/ ) {
 
u32 kv_index= h ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 if (string_eq( key , h ->key_values .data [/*ptr!*/ kv_index ]/*rhashmap__Kv 1*/ .key ) ) {
 memset ( & h ->key_values .data [/*ptr!*/ kv_index ]/*rhashmap__Kv 1*/ ,  0 ,  sizeof( hashmap__Kv) ) ;
u64 old_index= index ;
 index  +=  2 ;
u32 cur_meta= h ->metas [/*ptr!*/ index ]/*ru32 1*/ ;
u32 cur_index= h ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 while ( ( cur_meta  >>  hashmap__hashbits ) > 1 ) {
 
 h ->metas [/*ptr!*/ old_index ]/*ru32 1*/  =  cur_meta - hashmap__probe_inc ;
 h ->metas [/*ptr!*/ old_index + 1 ]/*ru32 1*/  =  cur_index ;
 old_index  =  index ;
 index  +=  2 ;
 cur_meta  =  h ->metas [/*ptr!*/ index ]/*ru32 1*/ ;
 cur_index  =  h ->metas [/*ptr!*/ index + 1 ]/*ru32 1*/ ;
 }
 ;
 h ->metas [/*ptr!*/ old_index ]/*ru32 1*/  =  0 ;
 h ->size -- ;
 if ( h ->cap == 30 ) {
 
 return ;
 }
 ;
 if (macro_f32_lt( ( ((f32)( h ->size  <<  1 ) ) / ((f32)( h ->cap ) ) ) , hashmap__min_load_factor ) ) {
 hashmap__Hashmap_shrink ( h ) ;
 }
 ;
 
 return ;
 }
 ;
 index  +=  2 ;
 meta  +=  hashmap__probe_inc ;
 }
 ;
 }
 array_string hashmap__Hashmap_keys (hashmap__Hashmap h) {
array_string keys= array_repeat (new_array_from_c_array(1, 1, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 1 ) {  tos3("")  }) ,  h .size ) ;
int j= 0 ;
 for (
u32 i= ((u32)( 0 ) )  ;  i < h .key_values .size  ;  i ++ ) { 
 
 if ( h .key_values .data [/*ptr!*/ i ]/*rhashmap__Kv 0*/ .key .str == 0 ) {
 continue
 ;
 }
 ;
array_set(&/*q*/ keys , j , & (string []) {  h .key_values .data [/*ptr!*/ i ]/*rhashmap__Kv 0*/ .key }) ;
 j ++ ;
 }
 ;
return  keys ;
 }
 void hashmap__Hashmap_free (hashmap__Hashmap h) {
 {
 v_free ( h .metas ) ;
 v_free ( h .key_values .data ) ;
 }
 ;
 }
 void hashmap__Hashmap_set_max_load_factor (hashmap__Hashmap* h, f32 new_lf) {
 if (macro_f32_gt( new_lf , 1.0 ) ) {
 h ->max_load_factor  =  1.0 ;
 }
  else  if (macro_f32_lt( new_lf , 0.1 ) ) {
 h ->max_load_factor  =  0.5 ;
 }
  else { 
 h ->max_load_factor  =  new_lf ;
 }
 ;
 }
 array_string main__generate_strings (int len, int amount) {
array_string arr=new_array_from_c_array(0, 0, sizeof(string), EMPTY_ARRAY_OF_ELEMS( string, 0 ) {   TCCSKIP(0) }) ;
 int tmp1 =  0;
 ;
for (int tmp2 = tmp1; tmp2 <  amount; tmp2++) {
 
array_byte buf=new_array_from_c_array(0, 0, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 0 ) {   TCCSKIP(0) }) ;
 int tmp3 =  0;
 ;
for (int tmp4 = tmp3; tmp4 <  len; tmp4++) {
 
_PUSH(& buf , ( /*typ = array_byte   tmp_typ=byte*/ ((byte)( rand__next ( ((int)( 'z' ) ) - ((int)( 'a' ) ) ) + 'a' ) ) ), tmp5, byte) ;
 }
 ;
_PUSH(& arr , ( /*typ = array_string   tmp_typ=string*/ (tos2((byte *) buf .data ) ) ), tmp6, string) ;
 }
 ;
return  arr ;
 }
 void main__test_1 () {
hashmap__Hashmap m= hashmap__new_hmap ( ) ;
 int tmp7 =  1;
 ;
for (int tmp8 = tmp7; tmp8 <  1000000; tmp8++) {
 int i = tmp8;
 
 hashmap__Hashmap_set (& /* ? */ m ,  int_str ( i ) , i ) ;
 }
 ;
 int tmp9 =  1;
 ;
for (int tmp10 = tmp9; tmp10 <  1000000; tmp10++) {
 int i = tmp10;
 
 hashmap__Hashmap_set (& /* ? */ m ,  int_str ( i ) , i + 1 ) ;
 }
 ;
 int tmp11 =  1;
 ;
for (int tmp12 = tmp11; tmp12 <  1000000; tmp12++) {
 int i = tmp12;
 
 bool tmp13 =  hashmap__Hashmap_get ( m ,  int_str ( i ) ) == ( i + 1 ) ;

/// sline: "		assert m.get(i.str()) == (i + 1)"
if (!tmp13) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:27: FAILED: test_1()"));
	eprintln(tos3("Source: 		assert m.get(i.str()) == (i + 1)"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 }
 void main__test_2 () {
int amount= 100000 - rand__next ( 50000 ) ;
int len= 20 - rand__next ( 6 ) ;
array_string arr= main__generate_strings ( len , amount ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
 int tmp14 =  0;
 ;
for (int tmp15 = tmp14; tmp15 <  amount; tmp15++) {
 int i = tmp15;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 bool tmp18 =  i == hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) ;

/// sline: "		assert i == b.get(arr[i]) "
if (!tmp18) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:38: FAILED: test_2()"));
	eprintln(tos3("Source: 		assert i == b.get(arr[i]) "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 int tmp21 =  0;
 ;
for (int tmp22 = tmp21; tmp22 <  amount; tmp22++) {
 int i = tmp22;
 
 bool tmp23 =  i == hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) ;

/// sline: "		assert i == b.get(arr[i]) "
if (!tmp23) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:41: FAILED: test_2()"));
	eprintln(tos3("Source: 		assert i == b.get(arr[i]) "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 }
 void main__test_3 () {
 int tmp26 =  1;
 ;
for (int tmp27 = tmp26; tmp27 <  4; tmp27++) {
 int x = tmp27;
 
int amount= 100000 - rand__next ( 50000 ) ;
array_string arr= main__generate_strings ( x * 5 , amount ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
btree__Tree c= btree__new_tree ( ) ;
 int tmp28 =  0;
 ;
for (int tmp29 = tmp28; tmp29 <  amount; tmp29++) {
 int i = tmp29;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 btree__Tree_set (& /* ? */ c ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 bool tmp34 =  btree__Tree_get ( c ,  ( *(string*) array_get(  arr , i) ) ) == hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) ;

/// sline: "			assert c.get(arr[i]) == b.get(arr[i]) "
if (!tmp34) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:54: FAILED: test_3()"));
	eprintln(tos3("Source: 			assert c.get(arr[i]) == b.get(arr[i]) "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 int tmp39 =  0;
 ;
for (int tmp40 = tmp39; tmp40 <  amount; tmp40++) {
 int i = tmp40;
 
 bool tmp41 =  btree__Tree_get ( c ,  ( *(string*) array_get(  arr , i) ) ) == hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) ;

/// sline: "			assert c.get(arr[i]) == b.get(arr[i]) "
if (!tmp41) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:57: FAILED: test_3()"));
	eprintln(tos3("Source: 			assert c.get(arr[i]) == b.get(arr[i]) "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 }
 ;
 }
 void main__test_4 () {
int amount= 100000 - rand__next ( 50000 ) ;
int len= 20 - rand__next ( 6 ) ;
array_string arr= main__generate_strings ( len , amount ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
 int tmp46 =  0;
 ;
for (int tmp47 = tmp46; tmp47 <  amount; tmp47++) {
 int i = tmp47;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 }
 ;
 int tmp50 =  0;
 ;
for (int tmp51 = tmp50; tmp51 <  amount; tmp51++) {
 int i = tmp51;
 
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
 bool tmp54 =  hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) == 0 ;

/// sline: "		assert b.get(arr[i]) == 0 "
if (!tmp54) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:72: FAILED: test_4()"));
	eprintln(tos3("Source: 		assert b.get(arr[i]) == 0 "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 bool tmp57 =  b .size == 0 ;

/// sline: "	assert b.size == 0"
if (!tmp57) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:74: FAILED: test_4()"));
	eprintln(tos3("Source: 	assert b.size == 0"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 void main__test_5 () {
int amount= 200000 - rand__next ( 100000 ) ;
int len= 20 - rand__next ( 6 ) ;
array_string arr= main__generate_strings ( len , amount ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
 int tmp58 =  0;
 ;
for (int tmp59 = tmp58; tmp59 <  10; tmp59++) {
 
 int tmp60 =  0;
 ;
for (int tmp61 = tmp60; tmp61 <  amount; tmp61++) {
 int i = tmp61;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 }
 ;
 int tmp64 =  0;
 ;
for (int tmp65 = tmp64; tmp65 <  amount; tmp65++) {
 int i = tmp65;
 
 bool tmp66 =  b .size == amount - i ;

/// sline: "			assert b.size == amount - i"
if (!tmp66) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:87: FAILED: test_5()"));
	eprintln(tos3("Source: 			assert b.size == amount - i"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
 bool tmp69 =  hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) == 0 ;

/// sline: "			assert b.get(arr[i]) == 0 "
if (!tmp69) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:89: FAILED: test_5()"));
	eprintln(tos3("Source: 			assert b.get(arr[i]) == 0 "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 int tmp72 =  0;
 ;
for (int tmp73 = tmp72; tmp73 <  amount; tmp73++) {
 int i = tmp73;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 bool tmp76 =  hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) == i ;

/// sline: "			assert b.get(arr[i]) == i"
if (!tmp76) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:93: FAILED: test_5()"));
	eprintln(tos3("Source: 			assert b.get(arr[i]) == i"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 int tmp79 =  0;
 ;
for (int tmp80 = tmp79; tmp80 <  amount; tmp80++) {
 int i = tmp80;
 
 bool tmp81 =  hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) == i ;

/// sline: "			assert b.get(arr[i]) == i"
if (!tmp81) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:96: FAILED: test_5()"));
	eprintln(tos3("Source: 			assert b.get(arr[i]) == i"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
array_string keys1= hashmap__Hashmap_keys ( b ) ;
 int tmp84 =  0;
 ;
for (int tmp85 = tmp84; tmp85 <  1000; tmp85++) {
 int i = tmp85;
 
 bool tmp86 = (_IN(string, ( ( *(string*) array_get(  arr , i) ) ),  keys1 )) ;

/// sline: "			assert arr[i] in keys1"
if (!tmp86) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:100: FAILED: test_5()"));
	eprintln(tos3("Source: 			assert arr[i] in keys1"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 int tmp89 =  0;
 ;
for (int tmp90 = tmp89; tmp90 <  amount; tmp90++) {
 int i = tmp90;
 
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
 bool tmp93 =  hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) == 0 ;

/// sline: "			assert b.get(arr[i]) == 0"
if (!tmp93) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:104: FAILED: test_5()"));
	eprintln(tos3("Source: 			assert b.get(arr[i]) == 0"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 int tmp96 =  0;
 ;
for (int tmp97 = tmp96; tmp97 <  amount; tmp97++) {
 int i = tmp97;
 
 bool tmp98 =  hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) == 0 ;

/// sline: "			assert b.get(arr[i]) == 0"
if (!tmp98) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:107: FAILED: test_5()"));
	eprintln(tos3("Source: 			assert b.get(arr[i]) == 0"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 bool tmp101 =  b .size == 0 ;

/// sline: "		assert b.size == 0"
if (!tmp101) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:109: FAILED: test_5()"));
	eprintln(tos3("Source: 		assert b.size == 0"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 }
 void main__test_6 () {
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
btree__Tree c= btree__new_tree ( ) ;
 int tmp102 =  0;
 ;
for (int tmp103 = tmp102; tmp103 <  10; tmp103++) {
 
int amount= 20000 - rand__next ( 10000 ) ;
array_string arr= main__generate_strings ( 5 , amount ) ;
 int tmp104 =  0;
 ;
for (int tmp105 = tmp104; tmp105 <  amount; tmp105++) {
 int i = tmp105;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 btree__Tree_set (& /* ? */ c ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 }
 ;
 int tmp110 =  0;
 ;
for (int tmp111 = tmp110; tmp111 <  amount; tmp111++) {
 int i = tmp111;
 
 bool tmp112 =  c .size == b .size ;

/// sline: "			assert c.size == b.size"
if (!tmp112) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:125: FAILED: test_6()"));
	eprintln(tos3("Source: 			assert c.size == b.size"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 bool tmp113 =  btree__Tree_get ( c ,  ( *(string*) array_get(  arr , i) ) ) == hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) ;

/// sline: "			assert c.get(arr[i]) == b.get(arr[i])"
if (!tmp113) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:126: FAILED: test_6()"));
	eprintln(tos3("Source: 			assert c.get(arr[i]) == b.get(arr[i])"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 btree__Tree_delete (& /* ? */ c ,  ( *(string*) array_get(  arr , i) ) ) ;
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
array_byte buf=new_array_from_c_array(0, 0, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 0 ) {   TCCSKIP(0) }) ;
 int tmp122 =  0;
 ;
for (int tmp123 = tmp122; tmp123 <  5; tmp123++) {
 int j = tmp123;
 
_PUSH(& buf , ( /*typ = array_byte   tmp_typ=byte*/ ((byte)( rand__next ( ((int)( 'z' ) ) - ((int)( 'a' ) ) ) + 'a' ) ) ), tmp124, byte) ;
 }
 ;
string s= (tos2((byte *) buf .data ) ) ;
 btree__Tree_delete (& /* ? */ c ,  s ) ;
 hashmap__Hashmap_delete (& /* ? */ b ,  s ) ;
 }
 ;
 }
 ;
 bool tmp125 =  btree__Tree_keys ( c ) .len == hashmap__Hashmap_keys ( b ) .len ;

/// sline: "	assert c.keys().len == b.keys().len"
if (!tmp125) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:138: FAILED: test_6()"));
	eprintln(tos3("Source: 	assert c.keys().len == b.keys().len"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 bool tmp126 =  c .size == b .size ;

/// sline: "	assert c.size == b.size"
if (!tmp126) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:139: FAILED: test_6()"));
	eprintln(tos3("Source: 	assert c.size == b.size"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 void main__test_7 () {
int amount= 150000 - rand__next ( 100000 ) ;
array_string arr= main__generate_strings ( 5 , amount ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
 int tmp127 =  0;
 ;
for (int tmp128 = tmp127; tmp128 <  amount; tmp128++) {
 int i = tmp128;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 }
 ;
 int tmp131 =  0;
 ;
for (int tmp132 = tmp131; tmp132 <  amount; tmp132++) {
 int i = tmp132;
 
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
 hashmap__Hashmap_exists ( b ,  ( *(string*) array_get(  arr , i) ) ) ;
 }
 ;
 bool tmp137 =  b .size == 0 ;

/// sline: "	assert b.size == 0 "
if (!tmp137) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:153: FAILED: test_7()"));
	eprintln(tos3("Source: 	assert b.size == 0 "));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 void main__test_8 () {
int amount= 300000 - rand__next ( 150000 ) ;
array_string arr= main__generate_strings ( 5 , amount ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
btree__Tree c= btree__new_tree ( ) ;
 int tmp138 =  0;
 ;
for (int tmp139 = tmp138; tmp139 <  amount; tmp139++) {
 int i = tmp139;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 btree__Tree_set (& /* ? */ c ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 }
 ;
array_string arr1= hashmap__Hashmap_keys ( b ) ;
 array_string_sort (& /* ? */ arr1 ) ;
array_string arr2= btree__Tree_keys ( c ) ;
 array_string_sort (& /* ? */ arr2 ) ;
 int tmp144 =  0;
 ;
for (int tmp145 = tmp144; tmp145 <  arr1 .len - 1; tmp145++) {
 int i = tmp145;
 
 bool tmp146 = string_eq( ( *(string*) array_get(  arr2 , i) ) , ( *(string*) array_get(  arr2 , i) ) ) ;

/// sline: "		assert arr2[i] == arr2[i]"
if (!tmp146) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:170: FAILED: test_8()"));
	eprintln(tos3("Source: 		assert arr2[i] == arr2[i]"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 bool tmp151 =  hashmap__Hashmap_keys ( b ) .len == btree__Tree_keys ( c ) .len ;

/// sline: "	assert b.keys().len == c.keys().len"
if (!tmp151) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:172: FAILED: test_8()"));
	eprintln(tos3("Source: 	assert b.keys().len == c.keys().len"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 bool tmp152 =  b .size == c .size ;

/// sline: "	assert b.size == c.size"
if (!tmp152) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:173: FAILED: test_8()"));
	eprintln(tos3("Source: 	assert b.size == c.size"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 int tmp153 =  0;
 ;
for (int tmp154 = tmp153; tmp154 <  amount; tmp154++) {
 int i = tmp154;
 
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
 btree__Tree_delete (& /* ? */ c ,  ( *(string*) array_get(  arr , i) ) ) ;
 }
 ;
 bool tmp159 =  hashmap__Hashmap_keys ( b ) .len == btree__Tree_keys ( c ) .len ;

/// sline: "	assert b.keys().len == c.keys().len"
if (!tmp159) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:178: FAILED: test_8()"));
	eprintln(tos3("Source: 	assert b.keys().len == c.keys().len"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 bool tmp160 =  b .size == c .size ;

/// sline: "	assert b.size == c.size"
if (!tmp160) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:179: FAILED: test_8()"));
	eprintln(tos3("Source: 	assert b.size == c.size"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 void main__test_9 () {
int amount= rand__next ( 8000 ) ;
array_string arr= main__generate_strings ( 5 , amount ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
btree__Tree c= btree__new_tree ( ) ;
 int tmp161 =  0;
 ;
for (int tmp162 = tmp161; tmp162 <  amount; tmp162++) {
 int i = tmp162;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 btree__Tree_set (& /* ? */ c ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 }
 ;
 int tmp167 =  0;
 ;
for (int tmp168 = tmp167; tmp168 <  amount; tmp168++) {
 int i = tmp168;
 
 bool tmp169 =  btree__Tree_keys ( c ) .len == hashmap__Hashmap_keys ( b ) .len ;

/// sline: "		assert c.keys().len == b.keys().len"
if (!tmp169) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:192: FAILED: test_9()"));
	eprintln(tos3("Source: 		assert c.keys().len == b.keys().len"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 bool tmp170 =  c .size == b .size ;

/// sline: "		assert c.size == b.size"
if (!tmp170) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:193: FAILED: test_9()"));
	eprintln(tos3("Source: 		assert c.size == b.size"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 bool tmp171 =  btree__Tree_get ( c ,  ( *(string*) array_get(  arr , i) ) ) == hashmap__Hashmap_get ( b ,  ( *(string*) array_get(  arr , i) ) ) ;

/// sline: "		assert c.get(arr[i]) == b.get(arr[i])"
if (!tmp171) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:194: FAILED: test_9()"));
	eprintln(tos3("Source: 		assert c.get(arr[i]) == b.get(arr[i])"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 btree__Tree_delete (& /* ? */ c ,  ( *(string*) array_get(  arr , i) ) ) ;
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
 }
 ;
 bool tmp180 =  btree__Tree_keys ( c ) .len == hashmap__Hashmap_keys ( b ) .len ;

/// sline: "	assert c.keys().len == b.keys().len"
if (!tmp180) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:198: FAILED: test_9()"));
	eprintln(tos3("Source: 	assert c.keys().len == b.keys().len"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 bool tmp181 =  c .size == b .size ;

/// sline: "	assert c.size == b.size"
if (!tmp181) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:199: FAILED: test_9()"));
	eprintln(tos3("Source: 	assert c.size == b.size"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 void main__test_10 () {
int amount= rand__next ( 50000 ) ;
int len= 20 - rand__next ( 6 ) ;
hashmap__Hashmap b= hashmap__new_hmap ( ) ;
array_string arr= main__generate_strings ( len , amount ) ;
 int tmp182 =  0;
 ;
for (int tmp183 = tmp182; tmp183 <  10; tmp183++) {
 
 int tmp184 =  0;
 ;
for (int tmp185 = tmp184; tmp185 <  amount; tmp185++) {
 int i = tmp185;
 
 hashmap__Hashmap_set (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) , i ) ;
 }
 ;
array_string keys= hashmap__Hashmap_keys ( b ) ;
 int tmp188 =  0;
 ;
for (int tmp189 = tmp188; tmp189 <  amount; tmp189++) {
 int i = tmp189;
 
 bool tmp190 = string_eq( ( *(string*) array_get(  keys , i) ) , ( *(string*) array_get(  arr , i) ) ) ;

/// sline: "			assert keys[i] == arr[i]"
if (!tmp190) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:214: FAILED: test_10()"));
	eprintln(tos3("Source: 			assert keys[i] == arr[i]"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 }
 ;
 int tmp195 =  0;
 ;
for (int tmp196 = tmp195; tmp196 <  amount; tmp196++) {
 int i = tmp196;
 
 hashmap__Hashmap_delete (& /* ? */ b ,  ( *(string*) array_get(  arr , i) ) ) ;
 }
 ;
 bool tmp199 =  b .size == 0 ;

/// sline: "		assert b.size == 0"
if (!tmp199) {
	g_test_fails++;
	eprintln(tos3("monkeytest.v:220: FAILED: test_10()"));
	eprintln(tos3("Source: 		assert b.size == 0"));
   v_panic(tos3("An assertion failed."));
   exit(1);
} else {
	g_test_oks++;
}

 ;
 v_array_free ( keys ) ;
 }
 ;
 }
 void main__main () {
int seed= ((int)( time__ticks ( ) ) ) ;
 rand__seed ( seed ) ;
printf( "%.*s \n", int_hex ( seed ).len, int_hex ( seed ).str ) ;
 main__test_1 ( ) ;
 main__test_2 ( ) ;
 main__test_3 ( ) ;
 main__test_4 ( ) ;
 main__test_5 ( ) ;
 main__test_6 ( ) ;
 main__test_7 ( ) ;
 main__test_8 ( ) ;
 main__test_9 ( ) ;
 main__test_10 ( ) ;
 }
 void init() {
#if VPREALLOC
g_m2_buf = malloc(50 * 1000 * 1000);
g_m2_ptr = g_m2_buf;
puts("allocated 50 mb");
#endif

builtin__digit_pairs =  tos3("00102030405060708090011121314151617181910212223242526272829203132333435363738393041424344454647484940515253545556575859506162636465666768696071727374757677787970818283848586878889809192939495969798999");
builtin__init_capicity =  1  <<  builtin__init_log_capicity;
builtin__init_cap =  builtin__init_capicity - 2;
builtin__hash_mask =  ((u32)( 0x00FFFFFF ) );
builtin__probe_inc =  ((u32)( 0x01000000 ) );
builtin__max_probe =  ((u32)( 0xFF000000 ) );
builtin__mid_index =  builtin__degree - 1;
builtin__max_size =  2 * builtin__degree - 1;
builtin__children_bytes =  sizeof( void*) * ( builtin__max_size + 1 );
hash_dot_wyhash__wyp0 =  0xa0761d6478bd642f;
hash_dot_wyhash__wyp1 =  0xe7037ed1a0b428db;
hash_dot_wyhash__wyp2 =  0x8ebc6af09c88c6e3;
hash_dot_wyhash__wyp3 =  0x589965cc75374cc3;
hash_dot_wyhash__wyp4 =  0x1d8e4e27c47d124f;
strconv__DOUBLE_PLUS_ZERO =  ((u64)( 0x0000000000000000 ) );
strconv__DOUBLE_MINUS_ZERO =  0x8000000000000000;
strconv__DOUBLE_PLUS_INFINITY =  0x7FF0000000000000;
strconv__DOUBLE_MINUS_INFINITY =  0xFFF0000000000000;
strconv__TEN =  ((u32)( 10 ) );
strconv__max_u64 =  ((u64)( UINT64_MAX ) );
btree__mid_index =  btree__degree - 1;
btree__min_length =  btree__degree - 1;
btree__children_size =  sizeof( void*) * ( btree__max_length + 1 );
time__days_string =  tos3("MonTueWedThuFriSatSun");
time__month_days = new_array_from_c_array(12, 12, sizeof(int), EMPTY_ARRAY_OF_ELEMS( int, 12 ) {  31 ,  28 ,  31 ,  30 ,  31 ,  30 ,  31 ,  31 ,  30 ,  31 ,  30 ,  31  });
time__months_string =  tos3("JanFebMarAprMayJunJulAugSepOctNovDec");
time__absolute_zero_year =  ((i64)( - 292277022399 ) );
time__seconds_per_hour =  60 * time__seconds_per_minute;
time__seconds_per_day =  24 * time__seconds_per_hour;
time__seconds_per_week =  7 * time__seconds_per_day;
time__days_per_400_years =  365 * 400 + 97;
time__days_per_100_years =  365 * 100 + 24;
time__days_per_4_years =  365 * 4 + 1;
time__days_before = new_array_from_c_array(13, 13, sizeof(int), EMPTY_ARRAY_OF_ELEMS( int, 13 ) {  0 ,  31 ,  31 + 28 ,  31 + 28 + 31 ,  31 + 28 + 31 + 30 ,  31 + 28 + 31 + 30 + 31 ,  31 + 28 + 31 + 30 + 31 + 30 ,  31 + 28 + 31 + 30 + 31 + 30 + 31 ,  31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 ,  31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 ,  31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 ,  31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 ,  31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 31 ,   });
math__uvnan =  0x7FF8000000000001;
math__uvinf =  0x7FF0000000000000;
math__uvneginf =  0xFFF0000000000000;
math__uvone =  0x3FF0000000000000;
math__mask =  0x7FF;
math__shift =  64 - 11 - 1;
math__sign_mask =  ( ((u64)( 1 ) )  <<  63 );
math__frac_mask =  ( ( ((u64)( 1 ) )  <<  ((u64)( math__shift ) ) ) - ((u64)( 1 ) ) );
math__log2_e =  1.0 / math__ln2;
math__log10_e =  1.0 / math__ln10;
math__max_f32 =  3.40282346638528859811704183484516925440e+38;
math__smallest_non_zero_f32 =  1.401298464324817070923729583289916131280e-45;
math__max_f64 =  1.797693134862315708145274237317043567981e+308;
math__smallest_non_zero_f64 =  4.940656458412465441765687928682213723651e-324;
math__min_i8 =  - 128;
math__min_i16 =  - 32768;
math__min_i32 =  - 2147483648;
math__min_i64 =  - 9223372036854775807 - 1;
math_dot_bits__de_bruijn32 =  ((u32)( 0x077CB531 ) );
math_dot_bits__de_bruijn32tab = new_array_from_c_array(32, 32, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 32 ) {  ((byte)( 0 ) ) ,  1 ,  28 ,  2 ,  29 ,  14 ,  24 ,  3 ,  30 ,  22 ,  20 ,  15 ,  25 ,  17 ,  4 ,  8 ,  31 ,  27 ,  13 ,  23 ,  21 ,  19 ,  16 ,  7 ,  26 ,  12 ,  18 ,  6 ,  11 ,  5 ,  10 ,  9 ,   });
math_dot_bits__de_bruijn64 =  ( 0x03f79d71b4ca8b09 );
math_dot_bits__de_bruijn64tab = new_array_from_c_array(64, 64, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 64 ) {  ((byte)( 0 ) ) ,  1 ,  56 ,  2 ,  57 ,  49 ,  28 ,  3 ,  61 ,  58 ,  42 ,  50 ,  38 ,  29 ,  17 ,  4 ,  62 ,  47 ,  59 ,  36 ,  45 ,  43 ,  51 ,  22 ,  53 ,  39 ,  33 ,  30 ,  24 ,  18 ,  12 ,  5 ,  63 ,  55 ,  48 ,  27 ,  60 ,  41 ,  37 ,  16 ,  46 ,  35 ,  44 ,  21 ,  52 ,  32 ,  23 ,  11 ,  54 ,  26 ,  40 ,  15 ,  34 ,  20 ,  31 ,  10 ,  25 ,  14 ,  19 ,  9 ,  13 ,  8 ,  7 ,  6 ,   });
math_dot_bits__m0 =  0x5555555555555555;
math_dot_bits__m1 =  0x3333333333333333;
math_dot_bits__m2 =  0x0f0f0f0f0f0f0f0f;
math_dot_bits__m3 =  0x00ff00ff00ff00ff;
math_dot_bits__m4 =  0x0000ffff0000ffff;
math_dot_bits__two32 =  0x100000000;
math_dot_bits__mask32 =  math_dot_bits__two32 - 1;
math_dot_bits__overflow_error =  tos3("Overflow Error");
math_dot_bits__divide_error =  tos3("Divide Error");
math_dot_bits__ntz_8_tab = new_array_from_c_array(256, 256, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 256 ) {  ((byte)( 0x08 ) ) ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x05 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x06 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x05 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x07 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x05 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x06 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x05 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x04 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,  0x03 ,  0x00 ,  0x01 ,  0x00 ,  0x02 ,  0x00 ,  0x01 ,  0x00 ,   });
math_dot_bits__pop_8_tab = new_array_from_c_array(256, 256, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 256 ) {  ((byte)( 0x00 ) ) ,  0x01 ,  0x01 ,  0x02 ,  0x01 ,  0x02 ,  0x02 ,  0x03 ,  0x01 ,  0x02 ,  0x02 ,  0x03 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x01 ,  0x02 ,  0x02 ,  0x03 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x01 ,  0x02 ,  0x02 ,  0x03 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x01 ,  0x02 ,  0x02 ,  0x03 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x05 ,  0x06 ,  0x06 ,  0x07 ,  0x01 ,  0x02 ,  0x02 ,  0x03 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x05 ,  0x06 ,  0x06 ,  0x07 ,  0x02 ,  0x03 ,  0x03 ,  0x04 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x05 ,  0x06 ,  0x06 ,  0x07 ,  0x03 ,  0x04 ,  0x04 ,  0x05 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x05 ,  0x06 ,  0x06 ,  0x07 ,  0x04 ,  0x05 ,  0x05 ,  0x06 ,  0x05 ,  0x06 ,  0x06 ,  0x07 ,  0x05 ,  0x06 ,  0x06 ,  0x07 ,  0x06 ,  0x07 ,  0x07 ,  0x08 ,   });
math_dot_bits__rev_8_tab = new_array_from_c_array(256, 256, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 256 ) {  ((byte)( 0x00 ) ) ,  0x80 ,  0x40 ,  0xc0 ,  0x20 ,  0xa0 ,  0x60 ,  0xe0 ,  0x10 ,  0x90 ,  0x50 ,  0xd0 ,  0x30 ,  0xb0 ,  0x70 ,  0xf0 ,  0x08 ,  0x88 ,  0x48 ,  0xc8 ,  0x28 ,  0xa8 ,  0x68 ,  0xe8 ,  0x18 ,  0x98 ,  0x58 ,  0xd8 ,  0x38 ,  0xb8 ,  0x78 ,  0xf8 ,  0x04 ,  0x84 ,  0x44 ,  0xc4 ,  0x24 ,  0xa4 ,  0x64 ,  0xe4 ,  0x14 ,  0x94 ,  0x54 ,  0xd4 ,  0x34 ,  0xb4 ,  0x74 ,  0xf4 ,  0x0c ,  0x8c ,  0x4c ,  0xcc ,  0x2c ,  0xac ,  0x6c ,  0xec ,  0x1c ,  0x9c ,  0x5c ,  0xdc ,  0x3c ,  0xbc ,  0x7c ,  0xfc ,  0x02 ,  0x82 ,  0x42 ,  0xc2 ,  0x22 ,  0xa2 ,  0x62 ,  0xe2 ,  0x12 ,  0x92 ,  0x52 ,  0xd2 ,  0x32 ,  0xb2 ,  0x72 ,  0xf2 ,  0x0a ,  0x8a ,  0x4a ,  0xca ,  0x2a ,  0xaa ,  0x6a ,  0xea ,  0x1a ,  0x9a ,  0x5a ,  0xda ,  0x3a ,  0xba ,  0x7a ,  0xfa ,  0x06 ,  0x86 ,  0x46 ,  0xc6 ,  0x26 ,  0xa6 ,  0x66 ,  0xe6 ,  0x16 ,  0x96 ,  0x56 ,  0xd6 ,  0x36 ,  0xb6 ,  0x76 ,  0xf6 ,  0x0e ,  0x8e ,  0x4e ,  0xce ,  0x2e ,  0xae ,  0x6e ,  0xee ,  0x1e ,  0x9e ,  0x5e ,  0xde ,  0x3e ,  0xbe ,  0x7e ,  0xfe ,  0x01 ,  0x81 ,  0x41 ,  0xc1 ,  0x21 ,  0xa1 ,  0x61 ,  0xe1 ,  0x11 ,  0x91 ,  0x51 ,  0xd1 ,  0x31 ,  0xb1 ,  0x71 ,  0xf1 ,  0x09 ,  0x89 ,  0x49 ,  0xc9 ,  0x29 ,  0xa9 ,  0x69 ,  0xe9 ,  0x19 ,  0x99 ,  0x59 ,  0xd9 ,  0x39 ,  0xb9 ,  0x79 ,  0xf9 ,  0x05 ,  0x85 ,  0x45 ,  0xc5 ,  0x25 ,  0xa5 ,  0x65 ,  0xe5 ,  0x15 ,  0x95 ,  0x55 ,  0xd5 ,  0x35 ,  0xb5 ,  0x75 ,  0xf5 ,  0x0d ,  0x8d ,  0x4d ,  0xcd ,  0x2d ,  0xad ,  0x6d ,  0xed ,  0x1d ,  0x9d ,  0x5d ,  0xdd ,  0x3d ,  0xbd ,  0x7d ,  0xfd ,  0x03 ,  0x83 ,  0x43 ,  0xc3 ,  0x23 ,  0xa3 ,  0x63 ,  0xe3 ,  0x13 ,  0x93 ,  0x53 ,  0xd3 ,  0x33 ,  0xb3 ,  0x73 ,  0xf3 ,  0x0b ,  0x8b ,  0x4b ,  0xcb ,  0x2b ,  0xab ,  0x6b ,  0xeb ,  0x1b ,  0x9b ,  0x5b ,  0xdb ,  0x3b ,  0xbb ,  0x7b ,  0xfb ,  0x07 ,  0x87 ,  0x47 ,  0xc7 ,  0x27 ,  0xa7 ,  0x67 ,  0xe7 ,  0x17 ,  0x97 ,  0x57 ,  0xd7 ,  0x37 ,  0xb7 ,  0x77 ,  0xf7 ,  0x0f ,  0x8f ,  0x4f ,  0xcf ,  0x2f ,  0xaf ,  0x6f ,  0xef ,  0x1f ,  0x9f ,  0x5f ,  0xdf ,  0x3f ,  0xbf ,  0x7f ,  0xff ,   });
math_dot_bits__len_8_tab = new_array_from_c_array(256, 256, sizeof(byte), EMPTY_ARRAY_OF_ELEMS( byte, 256 ) {  ((byte)( 0x00 ) ) ,  0x01 ,  0x02 ,  0x02 ,  0x03 ,  0x03 ,  0x03 ,  0x03 ,  0x04 ,  0x04 ,  0x04 ,  0x04 ,  0x04 ,  0x04 ,  0x04 ,  0x04 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x05 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x06 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x07 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,  0x08 ,   });
strconv_dot_ftoa__mantbits32 =  ((u32)( 23 ) );
strconv_dot_ftoa__expbits32 =  ((u32)( 8 ) );
strconv_dot_ftoa__bias32 =  ((u32)( 127 ) );
strconv_dot_ftoa__mantbits64 =  ((u32)( 52 ) );
strconv_dot_ftoa__expbits64 =  ((u32)( 11 ) );
strconv_dot_ftoa__bias64 =  ((u32)( 1023 ) );
strconv_dot_ftoa__powers_of_10 = new_array_from_c_array(18, 18, sizeof(u64), EMPTY_ARRAY_OF_ELEMS( u64, 18 ) {  ((u64)( 1e0 ) ) ,  ((u64)( 1e1 ) ) ,  ((u64)( 1e2 ) ) ,  ((u64)( 1e3 ) ) ,  ((u64)( 1e4 ) ) ,  ((u64)( 1e5 ) ) ,  ((u64)( 1e6 ) ) ,  ((u64)( 1e7 ) ) ,  ((u64)( 1e8 ) ) ,  ((u64)( 1e9 ) ) ,  ((u64)( 1e10 ) ) ,  ((u64)( 1e11 ) ) ,  ((u64)( 1e12 ) ) ,  ((u64)( 1e13 ) ) ,  ((u64)( 1e14 ) ) ,  ((u64)( 1e15 ) ) ,  ((u64)( 1e16 ) ) ,  ((u64)( 1e17 ) )  });
strconv_dot_ftoa__pow5_split_32 = new_array_from_c_array(47, 47, sizeof(u64), EMPTY_ARRAY_OF_ELEMS( u64, 47 ) {  1152921504606846976 ,  1441151880758558720 ,  1801439850948198400 ,  2251799813685248000 ,  1407374883553280000 ,  1759218604441600000 ,  2199023255552000000 ,  1374389534720000000 ,  1717986918400000000 ,  2147483648000000000 ,  1342177280000000000 ,  1677721600000000000 ,  2097152000000000000 ,  1310720000000000000 ,  1638400000000000000 ,  2048000000000000000 ,  1280000000000000000 ,  1600000000000000000 ,  2000000000000000000 ,  1250000000000000000 ,  1562500000000000000 ,  1953125000000000000 ,  1220703125000000000 ,  1525878906250000000 ,  1907348632812500000 ,  1192092895507812500 ,  1490116119384765625 ,  1862645149230957031 ,  1164153218269348144 ,  1455191522836685180 ,  1818989403545856475 ,  2273736754432320594 ,  1421085471520200371 ,  1776356839400250464 ,  2220446049250313080 ,  1387778780781445675 ,  1734723475976807094 ,  2168404344971008868 ,  1355252715606880542 ,  1694065894508600678 ,  2117582368135750847 ,  1323488980084844279 ,  1654361225106055349 ,  2067951531382569187 ,  1292469707114105741 ,  1615587133892632177 ,  2019483917365790221  });
strconv_dot_ftoa__pow5_inv_split_32 = new_array_from_c_array(31, 31, sizeof(u64), EMPTY_ARRAY_OF_ELEMS( u64, 31 ) {  576460752303423489 ,  461168601842738791 ,  368934881474191033 ,  295147905179352826 ,  472236648286964522 ,  377789318629571618 ,  302231454903657294 ,  483570327845851670 ,  386856262276681336 ,  309485009821345069 ,  495176015714152110 ,  396140812571321688 ,  316912650057057351 ,  507060240091291761 ,  405648192073033409 ,  324518553658426727 ,  519229685853482763 ,  415383748682786211 ,  332306998946228969 ,  531691198313966350 ,  425352958651173080 ,  340282366920938464 ,  544451787073501542 ,  435561429658801234 ,  348449143727040987 ,  557518629963265579 ,  446014903970612463 ,  356811923176489971 ,  570899077082383953 ,  456719261665907162 ,  365375409332725730  });
strconv_dot_ftoa__pow5_split_64 = new_array_from_c_array(326, 326, sizeof(strconv_dot_ftoa__Uint128), EMPTY_ARRAY_OF_ELEMS( strconv_dot_ftoa__Uint128, 326 ) {  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x0100000000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x0140000000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x0190000000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01f4000000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x0138800000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x0186a00000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01e8480000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01312d0000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x017d784000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01dcd65000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x012a05f200000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x0174876e80000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01d1a94a20000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x012309ce54000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x016bcc41e9000000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01c6bf5263400000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x011c37937e080000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x016345785d8a0000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01bc16d674ec8000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01158e460913d000 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x015af1d78b58c400 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01b1ae4d6e2ef500 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x010f0cf064dd5920 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x0152d02c7e14af68 } ,  (strconv_dot_ftoa__Uint128) { 0x0000000000000000 , 0x01a784379d99db42 } ,  (strconv_dot_ftoa__Uint128) { 0x4000000000000000 , 0x0108b2a2c2802909 } ,  (strconv_dot_ftoa__Uint128) { 0x9000000000000000 , 0x014adf4b7320334b } ,  (strconv_dot_ftoa__Uint128) { 0x7400000000000000 , 0x019d971e4fe8401e } ,  (strconv_dot_ftoa__Uint128) { 0x0880000000000000 , 0x01027e72f1f12813 } ,  (strconv_dot_ftoa__Uint128) { 0xcaa0000000000000 , 0x01431e0fae6d7217 } ,  (strconv_dot_ftoa__Uint128) { 0xbd48000000000000 , 0x0193e5939a08ce9d } ,  (strconv_dot_ftoa__Uint128) { 0x2c9a000000000000 , 0x01f8def8808b0245 } ,  (strconv_dot_ftoa__Uint128) { 0x3be0400000000000 , 0x013b8b5b5056e16b } ,  (strconv_dot_ftoa__Uint128) { 0x0ad8500000000000 , 0x018a6e32246c99c6 } ,  (strconv_dot_ftoa__Uint128) { 0x8d8e640000000000 , 0x01ed09bead87c037 } ,  (strconv_dot_ftoa__Uint128) { 0xb878fe8000000000 , 0x013426172c74d822 } ,  (strconv_dot_ftoa__Uint128) { 0x66973e2000000000 , 0x01812f9cf7920e2b } ,  (strconv_dot_ftoa__Uint128) { 0x403d0da800000000 , 0x01e17b84357691b6 } ,  (strconv_dot_ftoa__Uint128) { 0xe826288900000000 , 0x012ced32a16a1b11 } ,  (strconv_dot_ftoa__Uint128) { 0x622fb2ab40000000 , 0x0178287f49c4a1d6 } ,  (strconv_dot_ftoa__Uint128) { 0xfabb9f5610000000 , 0x01d6329f1c35ca4b } ,  (strconv_dot_ftoa__Uint128) { 0x7cb54395ca000000 , 0x0125dfa371a19e6f } ,  (strconv_dot_ftoa__Uint128) { 0x5be2947b3c800000 , 0x016f578c4e0a060b } ,  (strconv_dot_ftoa__Uint128) { 0x32db399a0ba00000 , 0x01cb2d6f618c878e } ,  (strconv_dot_ftoa__Uint128) { 0xdfc9040047440000 , 0x011efc659cf7d4b8 } ,  (strconv_dot_ftoa__Uint128) { 0x17bb450059150000 , 0x0166bb7f0435c9e7 } ,  (strconv_dot_ftoa__Uint128) { 0xddaa16406f5a4000 , 0x01c06a5ec5433c60 } ,  (strconv_dot_ftoa__Uint128) { 0x8a8a4de845986800 , 0x0118427b3b4a05bc } ,  (strconv_dot_ftoa__Uint128) { 0xad2ce16256fe8200 , 0x015e531a0a1c872b } ,  (strconv_dot_ftoa__Uint128) { 0x987819baecbe2280 , 0x01b5e7e08ca3a8f6 } ,  (strconv_dot_ftoa__Uint128) { 0x1f4b1014d3f6d590 , 0x0111b0ec57e6499a } ,  (strconv_dot_ftoa__Uint128) { 0xa71dd41a08f48af4 , 0x01561d276ddfdc00 } ,  (strconv_dot_ftoa__Uint128) { 0xd0e549208b31adb1 , 0x01aba4714957d300 } ,  (strconv_dot_ftoa__Uint128) { 0x828f4db456ff0c8e , 0x010b46c6cdd6e3e0 } ,  (strconv_dot_ftoa__Uint128) { 0xa33321216cbecfb2 , 0x014e1878814c9cd8 } ,  (strconv_dot_ftoa__Uint128) { 0xcbffe969c7ee839e , 0x01a19e96a19fc40e } ,  (strconv_dot_ftoa__Uint128) { 0x3f7ff1e21cf51243 , 0x0105031e2503da89 } ,  (strconv_dot_ftoa__Uint128) { 0x8f5fee5aa43256d4 , 0x014643e5ae44d12b } ,  (strconv_dot_ftoa__Uint128) { 0x7337e9f14d3eec89 , 0x0197d4df19d60576 } ,  (strconv_dot_ftoa__Uint128) { 0x1005e46da08ea7ab , 0x01fdca16e04b86d4 } ,  (strconv_dot_ftoa__Uint128) { 0x8a03aec4845928cb , 0x013e9e4e4c2f3444 } ,  (strconv_dot_ftoa__Uint128) { 0xac849a75a56f72fd , 0x018e45e1df3b0155 } ,  (strconv_dot_ftoa__Uint128) { 0x17a5c1130ecb4fbd , 0x01f1d75a5709c1ab } ,  (strconv_dot_ftoa__Uint128) { 0xeec798abe93f11d6 , 0x013726987666190a } ,  (strconv_dot_ftoa__Uint128) { 0xaa797ed6e38ed64b , 0x0184f03e93ff9f4d } ,  (strconv_dot_ftoa__Uint128) { 0x1517de8c9c728bde , 0x01e62c4e38ff8721 } ,  (strconv_dot_ftoa__Uint128) { 0xad2eeb17e1c7976b , 0x012fdbb0e39fb474 } ,  (strconv_dot_ftoa__Uint128) { 0xd87aa5ddda397d46 , 0x017bd29d1c87a191 } ,  (strconv_dot_ftoa__Uint128) { 0x4e994f5550c7dc97 , 0x01dac74463a989f6 } ,  (strconv_dot_ftoa__Uint128) { 0xf11fd195527ce9de , 0x0128bc8abe49f639 } ,  (strconv_dot_ftoa__Uint128) { 0x6d67c5faa71c2456 , 0x0172ebad6ddc73c8 } ,  (strconv_dot_ftoa__Uint128) { 0x88c1b77950e32d6c , 0x01cfa698c95390ba } ,  (strconv_dot_ftoa__Uint128) { 0x957912abd28dfc63 , 0x0121c81f7dd43a74 } ,  (strconv_dot_ftoa__Uint128) { 0xbad75756c7317b7c , 0x016a3a275d494911 } ,  (strconv_dot_ftoa__Uint128) { 0x298d2d2c78fdda5b , 0x01c4c8b1349b9b56 } ,  (strconv_dot_ftoa__Uint128) { 0xd9f83c3bcb9ea879 , 0x011afd6ec0e14115 } ,  (strconv_dot_ftoa__Uint128) { 0x50764b4abe865297 , 0x0161bcca7119915b } ,  (strconv_dot_ftoa__Uint128) { 0x2493de1d6e27e73d , 0x01ba2bfd0d5ff5b2 } ,  (strconv_dot_ftoa__Uint128) { 0x56dc6ad264d8f086 , 0x01145b7e285bf98f } ,  (strconv_dot_ftoa__Uint128) { 0x2c938586fe0f2ca8 , 0x0159725db272f7f3 } ,  (strconv_dot_ftoa__Uint128) { 0xf7b866e8bd92f7d2 , 0x01afcef51f0fb5ef } ,  (strconv_dot_ftoa__Uint128) { 0xfad34051767bdae3 , 0x010de1593369d1b5 } ,  (strconv_dot_ftoa__Uint128) { 0x79881065d41ad19c , 0x015159af80444623 } ,  (strconv_dot_ftoa__Uint128) { 0x57ea147f49218603 , 0x01a5b01b605557ac } ,  (strconv_dot_ftoa__Uint128) { 0xb6f24ccf8db4f3c1 , 0x01078e111c3556cb } ,  (strconv_dot_ftoa__Uint128) { 0xa4aee003712230b2 , 0x014971956342ac7e } ,  (strconv_dot_ftoa__Uint128) { 0x4dda98044d6abcdf , 0x019bcdfabc13579e } ,  (strconv_dot_ftoa__Uint128) { 0xf0a89f02b062b60b , 0x010160bcb58c16c2 } ,  (strconv_dot_ftoa__Uint128) { 0xacd2c6c35c7b638e , 0x0141b8ebe2ef1c73 } ,  (strconv_dot_ftoa__Uint128) { 0x98077874339a3c71 , 0x01922726dbaae390 } ,  (strconv_dot_ftoa__Uint128) { 0xbe0956914080cb8e , 0x01f6b0f092959c74 } ,  (strconv_dot_ftoa__Uint128) { 0xf6c5d61ac8507f38 , 0x013a2e965b9d81c8 } ,  (strconv_dot_ftoa__Uint128) { 0x34774ba17a649f07 , 0x0188ba3bf284e23b } ,  (strconv_dot_ftoa__Uint128) { 0x01951e89d8fdc6c8 , 0x01eae8caef261aca } ,  (strconv_dot_ftoa__Uint128) { 0x40fd3316279e9c3d , 0x0132d17ed577d0be } ,  (strconv_dot_ftoa__Uint128) { 0xd13c7fdbb186434c , 0x017f85de8ad5c4ed } ,  (strconv_dot_ftoa__Uint128) { 0x458b9fd29de7d420 , 0x01df67562d8b3629 } ,  (strconv_dot_ftoa__Uint128) { 0xcb7743e3a2b0e494 , 0x012ba095dc7701d9 } ,  (strconv_dot_ftoa__Uint128) { 0x3e5514dc8b5d1db9 , 0x017688bb5394c250 } ,  (strconv_dot_ftoa__Uint128) { 0x4dea5a13ae346527 , 0x01d42aea2879f2e4 } ,  (strconv_dot_ftoa__Uint128) { 0xb0b2784c4ce0bf38 , 0x01249ad2594c37ce } ,  (strconv_dot_ftoa__Uint128) { 0x5cdf165f6018ef06 , 0x016dc186ef9f45c2 } ,  (strconv_dot_ftoa__Uint128) { 0xf416dbf7381f2ac8 , 0x01c931e8ab871732 } ,  (strconv_dot_ftoa__Uint128) { 0xd88e497a83137abd , 0x011dbf316b346e7f } ,  (strconv_dot_ftoa__Uint128) { 0xceb1dbd923d8596c , 0x01652efdc6018a1f } ,  (strconv_dot_ftoa__Uint128) { 0xc25e52cf6cce6fc7 , 0x01be7abd3781eca7 } ,  (strconv_dot_ftoa__Uint128) { 0xd97af3c1a40105dc , 0x01170cb642b133e8 } ,  (strconv_dot_ftoa__Uint128) { 0x0fd9b0b20d014754 , 0x015ccfe3d35d80e3 } ,  (strconv_dot_ftoa__Uint128) { 0xd3d01cde90419929 , 0x01b403dcc834e11b } ,  (strconv_dot_ftoa__Uint128) { 0x6462120b1a28ffb9 , 0x01108269fd210cb1 } ,  (strconv_dot_ftoa__Uint128) { 0xbd7a968de0b33fa8 , 0x0154a3047c694fdd } ,  (strconv_dot_ftoa__Uint128) { 0x2cd93c3158e00f92 , 0x01a9cbc59b83a3d5 } ,  (strconv_dot_ftoa__Uint128) { 0x3c07c59ed78c09bb , 0x010a1f5b81324665 } ,  (strconv_dot_ftoa__Uint128) { 0x8b09b7068d6f0c2a , 0x014ca732617ed7fe } ,  (strconv_dot_ftoa__Uint128) { 0x2dcc24c830cacf34 , 0x019fd0fef9de8dfe } ,  (strconv_dot_ftoa__Uint128) { 0xdc9f96fd1e7ec180 , 0x0103e29f5c2b18be } ,  (strconv_dot_ftoa__Uint128) { 0x93c77cbc661e71e1 , 0x0144db473335deee } ,  (strconv_dot_ftoa__Uint128) { 0x38b95beb7fa60e59 , 0x01961219000356aa } ,  (strconv_dot_ftoa__Uint128) { 0xc6e7b2e65f8f91ef , 0x01fb969f40042c54 } ,  (strconv_dot_ftoa__Uint128) { 0xfc50cfcffbb9bb35 , 0x013d3e2388029bb4 } ,  (strconv_dot_ftoa__Uint128) { 0x3b6503c3faa82a03 , 0x018c8dac6a0342a2 } ,  (strconv_dot_ftoa__Uint128) { 0xca3e44b4f9523484 , 0x01efb1178484134a } ,  (strconv_dot_ftoa__Uint128) { 0xbe66eaf11bd360d2 , 0x0135ceaeb2d28c0e } ,  (strconv_dot_ftoa__Uint128) { 0x6e00a5ad62c83907 , 0x0183425a5f872f12 } ,  (strconv_dot_ftoa__Uint128) { 0x0980cf18bb7a4749 , 0x01e412f0f768fad7 } ,  (strconv_dot_ftoa__Uint128) { 0x65f0816f752c6c8d , 0x012e8bd69aa19cc6 } ,  (strconv_dot_ftoa__Uint128) { 0xff6ca1cb527787b1 , 0x017a2ecc414a03f7 } ,  (strconv_dot_ftoa__Uint128) { 0xff47ca3e2715699d , 0x01d8ba7f519c84f5 } ,  (strconv_dot_ftoa__Uint128) { 0xbf8cde66d86d6202 , 0x0127748f9301d319 } ,  (strconv_dot_ftoa__Uint128) { 0x2f7016008e88ba83 , 0x017151b377c247e0 } ,  (strconv_dot_ftoa__Uint128) { 0x3b4c1b80b22ae923 , 0x01cda62055b2d9d8 } ,  (strconv_dot_ftoa__Uint128) { 0x250f91306f5ad1b6 , 0x012087d4358fc827 } ,  (strconv_dot_ftoa__Uint128) { 0xee53757c8b318623 , 0x0168a9c942f3ba30 } ,  (strconv_dot_ftoa__Uint128) { 0x29e852dbadfde7ac , 0x01c2d43b93b0a8bd } ,  (strconv_dot_ftoa__Uint128) { 0x3a3133c94cbeb0cc , 0x0119c4a53c4e6976 } ,  (strconv_dot_ftoa__Uint128) { 0xc8bd80bb9fee5cff , 0x016035ce8b6203d3 } ,  (strconv_dot_ftoa__Uint128) { 0xbaece0ea87e9f43e , 0x01b843422e3a84c8 } ,  (strconv_dot_ftoa__Uint128) { 0x74d40c9294f238a7 , 0x01132a095ce492fd } ,  (strconv_dot_ftoa__Uint128) { 0xd2090fb73a2ec6d1 , 0x0157f48bb41db7bc } ,  (strconv_dot_ftoa__Uint128) { 0x068b53a508ba7885 , 0x01adf1aea12525ac } ,  (strconv_dot_ftoa__Uint128) { 0x8417144725748b53 , 0x010cb70d24b7378b } ,  (strconv_dot_ftoa__Uint128) { 0x651cd958eed1ae28 , 0x014fe4d06de5056e } ,  (strconv_dot_ftoa__Uint128) { 0xfe640faf2a8619b2 , 0x01a3de04895e46c9 } ,  (strconv_dot_ftoa__Uint128) { 0x3efe89cd7a93d00f , 0x01066ac2d5daec3e } ,  (strconv_dot_ftoa__Uint128) { 0xcebe2c40d938c413 , 0x014805738b51a74d } ,  (strconv_dot_ftoa__Uint128) { 0x426db7510f86f518 , 0x019a06d06e261121 } ,  (strconv_dot_ftoa__Uint128) { 0xc9849292a9b4592f , 0x0100444244d7cab4 } ,  (strconv_dot_ftoa__Uint128) { 0xfbe5b73754216f7a , 0x01405552d60dbd61 } ,  (strconv_dot_ftoa__Uint128) { 0x7adf25052929cb59 , 0x01906aa78b912cba } ,  (strconv_dot_ftoa__Uint128) { 0x1996ee4673743e2f , 0x01f485516e7577e9 } ,  (strconv_dot_ftoa__Uint128) { 0xaffe54ec0828a6dd , 0x0138d352e5096af1 } ,  (strconv_dot_ftoa__Uint128) { 0x1bfdea270a32d095 , 0x018708279e4bc5ae } ,  (strconv_dot_ftoa__Uint128) { 0xa2fd64b0ccbf84ba , 0x01e8ca3185deb719 } ,  (strconv_dot_ftoa__Uint128) { 0x05de5eee7ff7b2f4 , 0x01317e5ef3ab3270 } ,  (strconv_dot_ftoa__Uint128) { 0x0755f6aa1ff59fb1 , 0x017dddf6b095ff0c } ,  (strconv_dot_ftoa__Uint128) { 0x092b7454a7f3079e , 0x01dd55745cbb7ecf } ,  (strconv_dot_ftoa__Uint128) { 0x65bb28b4e8f7e4c3 , 0x012a5568b9f52f41 } ,  (strconv_dot_ftoa__Uint128) { 0xbf29f2e22335ddf3 , 0x0174eac2e8727b11 } ,  (strconv_dot_ftoa__Uint128) { 0x2ef46f9aac035570 , 0x01d22573a28f19d6 } ,  (strconv_dot_ftoa__Uint128) { 0xdd58c5c0ab821566 , 0x0123576845997025 } ,  (strconv_dot_ftoa__Uint128) { 0x54aef730d6629ac0 , 0x016c2d4256ffcc2f } ,  (strconv_dot_ftoa__Uint128) { 0x29dab4fd0bfb4170 , 0x01c73892ecbfbf3b } ,  (strconv_dot_ftoa__Uint128) { 0xfa28b11e277d08e6 , 0x011c835bd3f7d784 } ,  (strconv_dot_ftoa__Uint128) { 0x38b2dd65b15c4b1f , 0x0163a432c8f5cd66 } ,  (strconv_dot_ftoa__Uint128) { 0xc6df94bf1db35de7 , 0x01bc8d3f7b3340bf } ,  (strconv_dot_ftoa__Uint128) { 0xdc4bbcf772901ab0 , 0x0115d847ad000877 } ,  (strconv_dot_ftoa__Uint128) { 0xd35eac354f34215c , 0x015b4e5998400a95 } ,  (strconv_dot_ftoa__Uint128) { 0x48365742a30129b4 , 0x01b221effe500d3b } ,  (strconv_dot_ftoa__Uint128) { 0x0d21f689a5e0ba10 , 0x010f5535fef20845 } ,  (strconv_dot_ftoa__Uint128) { 0x506a742c0f58e894 , 0x01532a837eae8a56 } ,  (strconv_dot_ftoa__Uint128) { 0xe4851137132f22b9 , 0x01a7f5245e5a2ceb } ,  (strconv_dot_ftoa__Uint128) { 0x6ed32ac26bfd75b4 , 0x0108f936baf85c13 } ,  (strconv_dot_ftoa__Uint128) { 0x4a87f57306fcd321 , 0x014b378469b67318 } ,  (strconv_dot_ftoa__Uint128) { 0x5d29f2cfc8bc07e9 , 0x019e056584240fde } ,  (strconv_dot_ftoa__Uint128) { 0xfa3a37c1dd7584f1 , 0x0102c35f729689ea } ,  (strconv_dot_ftoa__Uint128) { 0xb8c8c5b254d2e62e , 0x014374374f3c2c65 } ,  (strconv_dot_ftoa__Uint128) { 0x26faf71eea079fb9 , 0x01945145230b377f } ,  (strconv_dot_ftoa__Uint128) { 0xf0b9b4e6a48987a8 , 0x01f965966bce055e } ,  (strconv_dot_ftoa__Uint128) { 0x5674111026d5f4c9 , 0x013bdf7e0360c35b } ,  (strconv_dot_ftoa__Uint128) { 0x2c111554308b71fb , 0x018ad75d8438f432 } ,  (strconv_dot_ftoa__Uint128) { 0xb7155aa93cae4e7a , 0x01ed8d34e547313e } ,  (strconv_dot_ftoa__Uint128) { 0x326d58a9c5ecf10c , 0x013478410f4c7ec7 } ,  (strconv_dot_ftoa__Uint128) { 0xff08aed437682d4f , 0x01819651531f9e78 } ,  (strconv_dot_ftoa__Uint128) { 0x3ecada89454238a3 , 0x01e1fbe5a7e78617 } ,  (strconv_dot_ftoa__Uint128) { 0x873ec895cb496366 , 0x012d3d6f88f0b3ce } ,  (strconv_dot_ftoa__Uint128) { 0x290e7abb3e1bbc3f , 0x01788ccb6b2ce0c2 } ,  (strconv_dot_ftoa__Uint128) { 0xb352196a0da2ab4f , 0x01d6affe45f818f2 } ,  (strconv_dot_ftoa__Uint128) { 0xb0134fe24885ab11 , 0x01262dfeebbb0f97 } ,  (strconv_dot_ftoa__Uint128) { 0x9c1823dadaa715d6 , 0x016fb97ea6a9d37d } ,  (strconv_dot_ftoa__Uint128) { 0x031e2cd19150db4b , 0x01cba7de5054485d } ,  (strconv_dot_ftoa__Uint128) { 0x21f2dc02fad2890f , 0x011f48eaf234ad3a } ,  (strconv_dot_ftoa__Uint128) { 0xaa6f9303b9872b53 , 0x01671b25aec1d888 } ,  (strconv_dot_ftoa__Uint128) { 0xd50b77c4a7e8f628 , 0x01c0e1ef1a724eaa } ,  (strconv_dot_ftoa__Uint128) { 0xc5272adae8f199d9 , 0x01188d357087712a } ,  (strconv_dot_ftoa__Uint128) { 0x7670f591a32e004f , 0x015eb082cca94d75 } ,  (strconv_dot_ftoa__Uint128) { 0xd40d32f60bf98063 , 0x01b65ca37fd3a0d2 } ,  (strconv_dot_ftoa__Uint128) { 0xc4883fd9c77bf03e , 0x0111f9e62fe44483 } ,  (strconv_dot_ftoa__Uint128) { 0xb5aa4fd0395aec4d , 0x0156785fbbdd55a4 } ,  (strconv_dot_ftoa__Uint128) { 0xe314e3c447b1a760 , 0x01ac1677aad4ab0d } ,  (strconv_dot_ftoa__Uint128) { 0xaded0e5aaccf089c , 0x010b8e0acac4eae8 } ,  (strconv_dot_ftoa__Uint128) { 0xd96851f15802cac3 , 0x014e718d7d7625a2 } ,  (strconv_dot_ftoa__Uint128) { 0x8fc2666dae037d74 , 0x01a20df0dcd3af0b } ,  (strconv_dot_ftoa__Uint128) { 0x39d980048cc22e68 , 0x010548b68a044d67 } ,  (strconv_dot_ftoa__Uint128) { 0x084fe005aff2ba03 , 0x01469ae42c8560c1 } ,  (strconv_dot_ftoa__Uint128) { 0x4a63d8071bef6883 , 0x0198419d37a6b8f1 } ,  (strconv_dot_ftoa__Uint128) { 0x9cfcce08e2eb42a4 , 0x01fe52048590672d } ,  (strconv_dot_ftoa__Uint128) { 0x821e00c58dd309a7 , 0x013ef342d37a407c } ,  (strconv_dot_ftoa__Uint128) { 0xa2a580f6f147cc10 , 0x018eb0138858d09b } ,  (strconv_dot_ftoa__Uint128) { 0x8b4ee134ad99bf15 , 0x01f25c186a6f04c2 } ,  (strconv_dot_ftoa__Uint128) { 0x97114cc0ec80176d , 0x0137798f428562f9 } ,  (strconv_dot_ftoa__Uint128) { 0xfcd59ff127a01d48 , 0x018557f31326bbb7 } ,  (strconv_dot_ftoa__Uint128) { 0xfc0b07ed7188249a , 0x01e6adefd7f06aa5 } ,  (strconv_dot_ftoa__Uint128) { 0xbd86e4f466f516e0 , 0x01302cb5e6f642a7 } ,  (strconv_dot_ftoa__Uint128) { 0xace89e3180b25c98 , 0x017c37e360b3d351 } ,  (strconv_dot_ftoa__Uint128) { 0x1822c5bde0def3be , 0x01db45dc38e0c826 } ,  (strconv_dot_ftoa__Uint128) { 0xcf15bb96ac8b5857 , 0x01290ba9a38c7d17 } ,  (strconv_dot_ftoa__Uint128) { 0xc2db2a7c57ae2e6d , 0x01734e940c6f9c5d } ,  (strconv_dot_ftoa__Uint128) { 0x3391f51b6d99ba08 , 0x01d022390f8b8375 } ,  (strconv_dot_ftoa__Uint128) { 0x403b393124801445 , 0x01221563a9b73229 } ,  (strconv_dot_ftoa__Uint128) { 0x904a077d6da01956 , 0x016a9abc9424feb3 } ,  (strconv_dot_ftoa__Uint128) { 0x745c895cc9081fac , 0x01c5416bb92e3e60 } ,  (strconv_dot_ftoa__Uint128) { 0x48b9d5d9fda513cb , 0x011b48e353bce6fc } ,  (strconv_dot_ftoa__Uint128) { 0x5ae84b507d0e58be , 0x01621b1c28ac20bb } ,  (strconv_dot_ftoa__Uint128) { 0x31a25e249c51eeee , 0x01baa1e332d728ea } ,  (strconv_dot_ftoa__Uint128) { 0x5f057ad6e1b33554 , 0x0114a52dffc67992 } ,  (strconv_dot_ftoa__Uint128) { 0xf6c6d98c9a2002aa , 0x0159ce797fb817f6 } ,  (strconv_dot_ftoa__Uint128) { 0xb4788fefc0a80354 , 0x01b04217dfa61df4 } ,  (strconv_dot_ftoa__Uint128) { 0xf0cb59f5d8690214 , 0x010e294eebc7d2b8 } ,  (strconv_dot_ftoa__Uint128) { 0x2cfe30734e83429a , 0x0151b3a2a6b9c767 } ,  (strconv_dot_ftoa__Uint128) { 0xf83dbc9022241340 , 0x01a6208b50683940 } ,  (strconv_dot_ftoa__Uint128) { 0x9b2695da15568c08 , 0x0107d457124123c8 } ,  (strconv_dot_ftoa__Uint128) { 0xc1f03b509aac2f0a , 0x0149c96cd6d16cba } ,  (strconv_dot_ftoa__Uint128) { 0x726c4a24c1573acd , 0x019c3bc80c85c7e9 } ,  (strconv_dot_ftoa__Uint128) { 0xe783ae56f8d684c0 , 0x0101a55d07d39cf1 } ,  (strconv_dot_ftoa__Uint128) { 0x616499ecb70c25f0 , 0x01420eb449c8842e } ,  (strconv_dot_ftoa__Uint128) { 0xf9bdc067e4cf2f6c , 0x019292615c3aa539 } ,  (strconv_dot_ftoa__Uint128) { 0x782d3081de02fb47 , 0x01f736f9b3494e88 } ,  (strconv_dot_ftoa__Uint128) { 0x4b1c3e512ac1dd0c , 0x013a825c100dd115 } ,  (strconv_dot_ftoa__Uint128) { 0x9de34de57572544f , 0x018922f31411455a } ,  (strconv_dot_ftoa__Uint128) { 0x455c215ed2cee963 , 0x01eb6bafd91596b1 } ,  (strconv_dot_ftoa__Uint128) { 0xcb5994db43c151de , 0x0133234de7ad7e2e } ,  (strconv_dot_ftoa__Uint128) { 0x7e2ffa1214b1a655 , 0x017fec216198ddba } ,  (strconv_dot_ftoa__Uint128) { 0x1dbbf89699de0feb , 0x01dfe729b9ff1529 } ,  (strconv_dot_ftoa__Uint128) { 0xb2957b5e202ac9f3 , 0x012bf07a143f6d39 } ,  (strconv_dot_ftoa__Uint128) { 0x1f3ada35a8357c6f , 0x0176ec98994f4888 } ,  (strconv_dot_ftoa__Uint128) { 0x270990c31242db8b , 0x01d4a7bebfa31aaa } ,  (strconv_dot_ftoa__Uint128) { 0x5865fa79eb69c937 , 0x0124e8d737c5f0aa } ,  (strconv_dot_ftoa__Uint128) { 0xee7f791866443b85 , 0x016e230d05b76cd4 } ,  (strconv_dot_ftoa__Uint128) { 0x2a1f575e7fd54a66 , 0x01c9abd04725480a } ,  (strconv_dot_ftoa__Uint128) { 0x5a53969b0fe54e80 , 0x011e0b622c774d06 } ,  (strconv_dot_ftoa__Uint128) { 0xf0e87c41d3dea220 , 0x01658e3ab7952047 } ,  (strconv_dot_ftoa__Uint128) { 0xed229b5248d64aa8 , 0x01bef1c9657a6859 } ,  (strconv_dot_ftoa__Uint128) { 0x3435a1136d85eea9 , 0x0117571ddf6c8138 } ,  (strconv_dot_ftoa__Uint128) { 0x4143095848e76a53 , 0x015d2ce55747a186 } ,  (strconv_dot_ftoa__Uint128) { 0xd193cbae5b2144e8 , 0x01b4781ead1989e7 } ,  (strconv_dot_ftoa__Uint128) { 0xe2fc5f4cf8f4cb11 , 0x0110cb132c2ff630 } ,  (strconv_dot_ftoa__Uint128) { 0x1bbb77203731fdd5 , 0x0154fdd7f73bf3bd } ,  (strconv_dot_ftoa__Uint128) { 0x62aa54e844fe7d4a , 0x01aa3d4df50af0ac } ,  (strconv_dot_ftoa__Uint128) { 0xbdaa75112b1f0e4e , 0x010a6650b926d66b } ,  (strconv_dot_ftoa__Uint128) { 0xad15125575e6d1e2 , 0x014cffe4e7708c06 } ,  (strconv_dot_ftoa__Uint128) { 0x585a56ead360865b , 0x01a03fde214caf08 } ,  (strconv_dot_ftoa__Uint128) { 0x37387652c41c53f8 , 0x010427ead4cfed65 } ,  (strconv_dot_ftoa__Uint128) { 0x850693e7752368f7 , 0x014531e58a03e8be } ,  (strconv_dot_ftoa__Uint128) { 0x264838e1526c4334 , 0x01967e5eec84e2ee } ,  (strconv_dot_ftoa__Uint128) { 0xafda4719a7075402 , 0x01fc1df6a7a61ba9 } ,  (strconv_dot_ftoa__Uint128) { 0x0de86c7008649481 , 0x013d92ba28c7d14a } ,  (strconv_dot_ftoa__Uint128) { 0x9162878c0a7db9a1 , 0x018cf768b2f9c59c } ,  (strconv_dot_ftoa__Uint128) { 0xb5bb296f0d1d280a , 0x01f03542dfb83703 } ,  (strconv_dot_ftoa__Uint128) { 0x5194f9e568323906 , 0x01362149cbd32262 } ,  (strconv_dot_ftoa__Uint128) { 0xe5fa385ec23ec747 , 0x0183a99c3ec7eafa } ,  (strconv_dot_ftoa__Uint128) { 0x9f78c67672ce7919 , 0x01e494034e79e5b9 } ,  (strconv_dot_ftoa__Uint128) { 0x03ab7c0a07c10bb0 , 0x012edc82110c2f94 } ,  (strconv_dot_ftoa__Uint128) { 0x04965b0c89b14e9c , 0x017a93a2954f3b79 } ,  (strconv_dot_ftoa__Uint128) { 0x45bbf1cfac1da243 , 0x01d9388b3aa30a57 } ,  (strconv_dot_ftoa__Uint128) { 0x8b957721cb92856a , 0x0127c35704a5e676 } ,  (strconv_dot_ftoa__Uint128) { 0x2e7ad4ea3e7726c4 , 0x0171b42cc5cf6014 } ,  (strconv_dot_ftoa__Uint128) { 0x3a198a24ce14f075 , 0x01ce2137f7433819 } ,  (strconv_dot_ftoa__Uint128) { 0xc44ff65700cd1649 , 0x0120d4c2fa8a030f } ,  (strconv_dot_ftoa__Uint128) { 0xb563f3ecc1005bdb , 0x016909f3b92c83d3 } ,  (strconv_dot_ftoa__Uint128) { 0xa2bcf0e7f14072d2 , 0x01c34c70a777a4c8 } ,  (strconv_dot_ftoa__Uint128) { 0x65b61690f6c847c3 , 0x011a0fc668aac6fd } ,  (strconv_dot_ftoa__Uint128) { 0xbf239c35347a59b4 , 0x016093b802d578bc } ,  (strconv_dot_ftoa__Uint128) { 0xeeec83428198f021 , 0x01b8b8a6038ad6eb } ,  (strconv_dot_ftoa__Uint128) { 0x7553d20990ff9615 , 0x01137367c236c653 } ,  (strconv_dot_ftoa__Uint128) { 0x52a8c68bf53f7b9a , 0x01585041b2c477e8 } ,  (strconv_dot_ftoa__Uint128) { 0x6752f82ef28f5a81 , 0x01ae64521f7595e2 } ,  (strconv_dot_ftoa__Uint128) { 0x8093db1d57999890 , 0x010cfeb353a97dad } ,  (strconv_dot_ftoa__Uint128) { 0xe0b8d1e4ad7ffeb4 , 0x01503e602893dd18 } ,  (strconv_dot_ftoa__Uint128) { 0x18e7065dd8dffe62 , 0x01a44df832b8d45f } ,  (strconv_dot_ftoa__Uint128) { 0x6f9063faa78bfefd , 0x0106b0bb1fb384bb } ,  (strconv_dot_ftoa__Uint128) { 0x4b747cf9516efebc , 0x01485ce9e7a065ea } ,  (strconv_dot_ftoa__Uint128) { 0xde519c37a5cabe6b , 0x019a742461887f64 } ,  (strconv_dot_ftoa__Uint128) { 0x0af301a2c79eb703 , 0x01008896bcf54f9f } ,  (strconv_dot_ftoa__Uint128) { 0xcdafc20b798664c4 , 0x0140aabc6c32a386 } ,  (strconv_dot_ftoa__Uint128) { 0x811bb28e57e7fdf5 , 0x0190d56b873f4c68 } ,  (strconv_dot_ftoa__Uint128) { 0xa1629f31ede1fd72 , 0x01f50ac6690f1f82 } ,  (strconv_dot_ftoa__Uint128) { 0xa4dda37f34ad3e67 , 0x013926bc01a973b1 } ,  (strconv_dot_ftoa__Uint128) { 0x0e150c5f01d88e01 , 0x0187706b0213d09e } ,  (strconv_dot_ftoa__Uint128) { 0x919a4f76c24eb181 , 0x01e94c85c298c4c5 } ,  (strconv_dot_ftoa__Uint128) { 0x7b0071aa39712ef1 , 0x0131cfd3999f7afb } ,  (strconv_dot_ftoa__Uint128) { 0x59c08e14c7cd7aad , 0x017e43c8800759ba } ,  (strconv_dot_ftoa__Uint128) { 0xf030b199f9c0d958 , 0x01ddd4baa0093028 } ,  (strconv_dot_ftoa__Uint128) { 0x961e6f003c1887d7 , 0x012aa4f4a405be19 } ,  (strconv_dot_ftoa__Uint128) { 0xfba60ac04b1ea9cd , 0x01754e31cd072d9f } ,  (strconv_dot_ftoa__Uint128) { 0xfa8f8d705de65440 , 0x01d2a1be4048f907 } ,  (strconv_dot_ftoa__Uint128) { 0xfc99b8663aaff4a8 , 0x0123a516e82d9ba4 } ,  (strconv_dot_ftoa__Uint128) { 0x3bc0267fc95bf1d2 , 0x016c8e5ca239028e } ,  (strconv_dot_ftoa__Uint128) { 0xcab0301fbbb2ee47 , 0x01c7b1f3cac74331 } ,  (strconv_dot_ftoa__Uint128) { 0x1eae1e13d54fd4ec , 0x011ccf385ebc89ff } ,  (strconv_dot_ftoa__Uint128) { 0xe659a598caa3ca27 , 0x01640306766bac7e } ,  (strconv_dot_ftoa__Uint128) { 0x9ff00efefd4cbcb1 , 0x01bd03c81406979e } ,  (strconv_dot_ftoa__Uint128) { 0x23f6095f5e4ff5ef , 0x0116225d0c841ec3 } ,  (strconv_dot_ftoa__Uint128) { 0xecf38bb735e3f36a , 0x015baaf44fa52673 } ,  (strconv_dot_ftoa__Uint128) { 0xe8306ea5035cf045 , 0x01b295b1638e7010 } ,  (strconv_dot_ftoa__Uint128) { 0x911e4527221a162b , 0x010f9d8ede39060a } ,  (strconv_dot_ftoa__Uint128) { 0x3565d670eaa09bb6 , 0x015384f295c7478d } ,  (strconv_dot_ftoa__Uint128) { 0x82bf4c0d2548c2a3 , 0x01a8662f3b391970 } ,  (strconv_dot_ftoa__Uint128) { 0x51b78f88374d79a6 , 0x01093fdd8503afe6 } ,  (strconv_dot_ftoa__Uint128) { 0xe625736a4520d810 , 0x014b8fd4e6449bdf } ,  (strconv_dot_ftoa__Uint128) { 0xdfaed044d6690e14 , 0x019e73ca1fd5c2d7 } ,  (strconv_dot_ftoa__Uint128) { 0xebcd422b0601a8cc , 0x0103085e53e599c6 } ,  (strconv_dot_ftoa__Uint128) { 0xa6c092b5c78212ff , 0x0143ca75e8df0038 } ,  (strconv_dot_ftoa__Uint128) { 0xd070b763396297bf , 0x0194bd136316c046 } ,  (strconv_dot_ftoa__Uint128) { 0x848ce53c07bb3daf , 0x01f9ec583bdc7058 } ,  (strconv_dot_ftoa__Uint128) { 0x52d80f4584d5068d , 0x013c33b72569c637 } ,  (strconv_dot_ftoa__Uint128) { 0x278e1316e60a4831 , 0x018b40a4eec437c5 }  });
strconv_dot_ftoa__pow5_inv_split_64 = new_array_from_c_array(292, 292, sizeof(strconv_dot_ftoa__Uint128), EMPTY_ARRAY_OF_ELEMS( strconv_dot_ftoa__Uint128, 292 ) {  (strconv_dot_ftoa__Uint128) { 0x0000000000000001 , 0x0400000000000000 } ,  (strconv_dot_ftoa__Uint128) { 0x3333333333333334 , 0x0333333333333333 } ,  (strconv_dot_ftoa__Uint128) { 0x28f5c28f5c28f5c3 , 0x028f5c28f5c28f5c } ,  (strconv_dot_ftoa__Uint128) { 0xed916872b020c49c , 0x020c49ba5e353f7c } ,  (strconv_dot_ftoa__Uint128) { 0xaf4f0d844d013a93 , 0x0346dc5d63886594 } ,  (strconv_dot_ftoa__Uint128) { 0x8c3f3e0370cdc876 , 0x029f16b11c6d1e10 } ,  (strconv_dot_ftoa__Uint128) { 0xd698fe69270b06c5 , 0x0218def416bdb1a6 } ,  (strconv_dot_ftoa__Uint128) { 0xf0f4ca41d811a46e , 0x035afe535795e90a } ,  (strconv_dot_ftoa__Uint128) { 0xf3f70834acdae9f1 , 0x02af31dc4611873b } ,  (strconv_dot_ftoa__Uint128) { 0x5cc5a02a23e254c1 , 0x0225c17d04dad296 } ,  (strconv_dot_ftoa__Uint128) { 0xfad5cd10396a2135 , 0x036f9bfb3af7b756 } ,  (strconv_dot_ftoa__Uint128) { 0xfbde3da69454e75e , 0x02bfaffc2f2c92ab } ,  (strconv_dot_ftoa__Uint128) { 0x2fe4fe1edd10b918 , 0x0232f33025bd4223 } ,  (strconv_dot_ftoa__Uint128) { 0x4ca19697c81ac1bf , 0x0384b84d092ed038 } ,  (strconv_dot_ftoa__Uint128) { 0x3d4e1213067bce33 , 0x02d09370d4257360 } ,  (strconv_dot_ftoa__Uint128) { 0x643e74dc052fd829 , 0x024075f3dceac2b3 } ,  (strconv_dot_ftoa__Uint128) { 0x6d30baf9a1e626a7 , 0x039a5652fb113785 } ,  (strconv_dot_ftoa__Uint128) { 0x2426fbfae7eb5220 , 0x02e1dea8c8da92d1 } ,  (strconv_dot_ftoa__Uint128) { 0x1cebfcc8b9890e80 , 0x024e4bba3a487574 } ,  (strconv_dot_ftoa__Uint128) { 0x94acc7a78f41b0cc , 0x03b07929f6da5586 } ,  (strconv_dot_ftoa__Uint128) { 0xaa23d2ec729af3d7 , 0x02f394219248446b } ,  (strconv_dot_ftoa__Uint128) { 0xbb4fdbf05baf2979 , 0x025c768141d369ef } ,  (strconv_dot_ftoa__Uint128) { 0xc54c931a2c4b758d , 0x03c7240202ebdcb2 } ,  (strconv_dot_ftoa__Uint128) { 0x9dd6dc14f03c5e0b , 0x0305b66802564a28 } ,  (strconv_dot_ftoa__Uint128) { 0x4b1249aa59c9e4d6 , 0x026af8533511d4ed } ,  (strconv_dot_ftoa__Uint128) { 0x44ea0f76f60fd489 , 0x03de5a1ebb4fbb15 } ,  (strconv_dot_ftoa__Uint128) { 0x6a54d92bf80caa07 , 0x0318481895d96277 } ,  (strconv_dot_ftoa__Uint128) { 0x21dd7a89933d54d2 , 0x0279d346de4781f9 } ,  (strconv_dot_ftoa__Uint128) { 0x362f2a75b8622150 , 0x03f61ed7ca0c0328 } ,  (strconv_dot_ftoa__Uint128) { 0xf825bb91604e810d , 0x032b4bdfd4d668ec } ,  (strconv_dot_ftoa__Uint128) { 0xc684960de6a5340b , 0x0289097fdd7853f0 } ,  (strconv_dot_ftoa__Uint128) { 0xd203ab3e521dc33c , 0x02073accb12d0ff3 } ,  (strconv_dot_ftoa__Uint128) { 0xe99f7863b696052c , 0x033ec47ab514e652 } ,  (strconv_dot_ftoa__Uint128) { 0x87b2c6b62bab3757 , 0x02989d2ef743eb75 } ,  (strconv_dot_ftoa__Uint128) { 0xd2f56bc4efbc2c45 , 0x0213b0f25f69892a } ,  (strconv_dot_ftoa__Uint128) { 0x1e55793b192d13a2 , 0x0352b4b6ff0f41de } ,  (strconv_dot_ftoa__Uint128) { 0x4b77942f475742e8 , 0x02a8909265a5ce4b } ,  (strconv_dot_ftoa__Uint128) { 0xd5f9435905df68ba , 0x022073a8515171d5 } ,  (strconv_dot_ftoa__Uint128) { 0x565b9ef4d6324129 , 0x03671f73b54f1c89 } ,  (strconv_dot_ftoa__Uint128) { 0xdeafb25d78283421 , 0x02b8e5f62aa5b06d } ,  (strconv_dot_ftoa__Uint128) { 0x188c8eb12cecf681 , 0x022d84c4eeeaf38b } ,  (strconv_dot_ftoa__Uint128) { 0x8dadb11b7b14bd9b , 0x037c07a17e44b8de } ,  (strconv_dot_ftoa__Uint128) { 0x7157c0e2c8dd647c , 0x02c99fb46503c718 } ,  (strconv_dot_ftoa__Uint128) { 0x8ddfcd823a4ab6ca , 0x023ae629ea696c13 } ,  (strconv_dot_ftoa__Uint128) { 0x1632e269f6ddf142 , 0x0391704310a8acec } ,  (strconv_dot_ftoa__Uint128) { 0x44f581ee5f17f435 , 0x02dac035a6ed5723 } ,  (strconv_dot_ftoa__Uint128) { 0x372ace584c1329c4 , 0x024899c4858aac1c } ,  (strconv_dot_ftoa__Uint128) { 0xbeaae3c079b842d3 , 0x03a75c6da27779c6 } ,  (strconv_dot_ftoa__Uint128) { 0x6555830061603576 , 0x02ec49f14ec5fb05 } ,  (strconv_dot_ftoa__Uint128) { 0xb7779c004de6912b , 0x0256a18dd89e626a } ,  (strconv_dot_ftoa__Uint128) { 0xf258f99a163db512 , 0x03bdcf495a9703dd } ,  (strconv_dot_ftoa__Uint128) { 0x5b7a614811caf741 , 0x02fe3f6de212697e } ,  (strconv_dot_ftoa__Uint128) { 0xaf951aa00e3bf901 , 0x0264ff8b1b41edfe } ,  (strconv_dot_ftoa__Uint128) { 0x7f54f7667d2cc19b , 0x03d4cc11c5364997 } ,  (strconv_dot_ftoa__Uint128) { 0x32aa5f8530f09ae3 , 0x0310a3416a91d479 } ,  (strconv_dot_ftoa__Uint128) { 0xf55519375a5a1582 , 0x0273b5cdeedb1060 } ,  (strconv_dot_ftoa__Uint128) { 0xbbbb5b8bc3c3559d , 0x03ec56164af81a34 } ,  (strconv_dot_ftoa__Uint128) { 0x2fc916096969114a , 0x03237811d593482a } ,  (strconv_dot_ftoa__Uint128) { 0x596dab3ababa743c , 0x0282c674aadc39bb } ,  (strconv_dot_ftoa__Uint128) { 0x478aef622efb9030 , 0x0202385d557cfafc } ,  (strconv_dot_ftoa__Uint128) { 0xd8de4bd04b2c19e6 , 0x0336c0955594c4c6 } ,  (strconv_dot_ftoa__Uint128) { 0xad7ea30d08f014b8 , 0x029233aaaadd6a38 } ,  (strconv_dot_ftoa__Uint128) { 0x24654f3da0c01093 , 0x020e8fbbbbe454fa } ,  (strconv_dot_ftoa__Uint128) { 0x3a3bb1fc346680eb , 0x034a7f92c63a2190 } ,  (strconv_dot_ftoa__Uint128) { 0x94fc8e635d1ecd89 , 0x02a1ffa89e94e7a6 } ,  (strconv_dot_ftoa__Uint128) { 0xaa63a51c4a7f0ad4 , 0x021b32ed4baa52eb } ,  (strconv_dot_ftoa__Uint128) { 0xdd6c3b607731aaed , 0x035eb7e212aa1e45 } ,  (strconv_dot_ftoa__Uint128) { 0x1789c919f8f488bd , 0x02b22cb4dbbb4b6b } ,  (strconv_dot_ftoa__Uint128) { 0xac6e3a7b2d906d64 , 0x022823c3e2fc3c55 } ,  (strconv_dot_ftoa__Uint128) { 0x13e390c515b3e23a , 0x03736c6c9e606089 } ,  (strconv_dot_ftoa__Uint128) { 0xdcb60d6a77c31b62 , 0x02c2bd23b1e6b3a0 } ,  (strconv_dot_ftoa__Uint128) { 0x7d5e7121f968e2b5 , 0x0235641c8e52294d } ,  (strconv_dot_ftoa__Uint128) { 0xc8971b698f0e3787 , 0x0388a02db0837548 } ,  (strconv_dot_ftoa__Uint128) { 0xa078e2bad8d82c6c , 0x02d3b357c0692aa0 } ,  (strconv_dot_ftoa__Uint128) { 0xe6c71bc8ad79bd24 , 0x0242f5dfcd20eee6 } ,  (strconv_dot_ftoa__Uint128) { 0x0ad82c7448c2c839 , 0x039e5632e1ce4b0b } ,  (strconv_dot_ftoa__Uint128) { 0x3be023903a356cfa , 0x02e511c24e3ea26f } ,  (strconv_dot_ftoa__Uint128) { 0x2fe682d9c82abd95 , 0x0250db01d8321b8c } ,  (strconv_dot_ftoa__Uint128) { 0x4ca4048fa6aac8ee , 0x03b4919c8d1cf8e0 } ,  (strconv_dot_ftoa__Uint128) { 0x3d5003a61eef0725 , 0x02f6dae3a4172d80 } ,  (strconv_dot_ftoa__Uint128) { 0x9773361e7f259f51 , 0x025f1582e9ac2466 } ,  (strconv_dot_ftoa__Uint128) { 0x8beb89ca6508fee8 , 0x03cb559e42ad070a } ,  (strconv_dot_ftoa__Uint128) { 0x6fefa16eb73a6586 , 0x0309114b688a6c08 } ,  (strconv_dot_ftoa__Uint128) { 0xf3261abef8fb846b , 0x026da76f86d52339 } ,  (strconv_dot_ftoa__Uint128) { 0x51d691318e5f3a45 , 0x03e2a57f3e21d1f6 } ,  (strconv_dot_ftoa__Uint128) { 0x0e4540f471e5c837 , 0x031bb798fe8174c5 } ,  (strconv_dot_ftoa__Uint128) { 0xd8376729f4b7d360 , 0x027c92e0cb9ac3d0 } ,  (strconv_dot_ftoa__Uint128) { 0xf38bd84321261eff , 0x03fa849adf5e061a } ,  (strconv_dot_ftoa__Uint128) { 0x293cad0280eb4bff , 0x032ed07be5e4d1af } ,  (strconv_dot_ftoa__Uint128) { 0xedca240200bc3ccc , 0x028bd9fcb7ea4158 } ,  (strconv_dot_ftoa__Uint128) { 0xbe3b50019a3030a4 , 0x02097b309321cde0 } ,  (strconv_dot_ftoa__Uint128) { 0xc9f88002904d1a9f , 0x03425eb41e9c7c9a } ,  (strconv_dot_ftoa__Uint128) { 0x3b2d3335403daee6 , 0x029b7ef67ee396e2 } ,  (strconv_dot_ftoa__Uint128) { 0x95bdc291003158b8 , 0x0215ff2b98b6124e } ,  (strconv_dot_ftoa__Uint128) { 0x892f9db4cd1bc126 , 0x035665128df01d4a } ,  (strconv_dot_ftoa__Uint128) { 0x07594af70a7c9a85 , 0x02ab840ed7f34aa2 } ,  (strconv_dot_ftoa__Uint128) { 0x6c476f2c0863aed1 , 0x0222d00bdff5d54e } ,  (strconv_dot_ftoa__Uint128) { 0x13a57eacda3917b4 , 0x036ae67966562217 } ,  (strconv_dot_ftoa__Uint128) { 0x0fb7988a482dac90 , 0x02bbeb9451de81ac } ,  (strconv_dot_ftoa__Uint128) { 0xd95fad3b6cf156da , 0x022fefa9db1867bc } ,  (strconv_dot_ftoa__Uint128) { 0xf565e1f8ae4ef15c , 0x037fe5dc91c0a5fa } ,  (strconv_dot_ftoa__Uint128) { 0x911e4e608b725ab0 , 0x02ccb7e3a7cd5195 } ,  (strconv_dot_ftoa__Uint128) { 0xda7ea51a0928488d , 0x023d5fe9530aa7aa } ,  (strconv_dot_ftoa__Uint128) { 0xf7310829a8407415 , 0x039566421e7772aa } ,  (strconv_dot_ftoa__Uint128) { 0x2c2739baed005cde , 0x02ddeb68185f8eef } ,  (strconv_dot_ftoa__Uint128) { 0xbcec2e2f24004a4b , 0x024b22b9ad193f25 } ,  (strconv_dot_ftoa__Uint128) { 0x94ad16b1d333aa11 , 0x03ab6ac2ae8ecb6f } ,  (strconv_dot_ftoa__Uint128) { 0xaa241227dc2954db , 0x02ef889bbed8a2bf } ,  (strconv_dot_ftoa__Uint128) { 0x54e9a81fe35443e2 , 0x02593a163246e899 } ,  (strconv_dot_ftoa__Uint128) { 0x2175d9cc9eed396a , 0x03c1f689ea0b0dc2 } ,  (strconv_dot_ftoa__Uint128) { 0xe7917b0a18bdc788 , 0x03019207ee6f3e34 } ,  (strconv_dot_ftoa__Uint128) { 0xb9412f3b46fe393a , 0x0267a8065858fe90 } ,  (strconv_dot_ftoa__Uint128) { 0xf535185ed7fd285c , 0x03d90cd6f3c1974d } ,  (strconv_dot_ftoa__Uint128) { 0xc42a79e57997537d , 0x03140a458fce12a4 } ,  (strconv_dot_ftoa__Uint128) { 0x03552e512e12a931 , 0x02766e9e0ca4dbb7 } ,  (strconv_dot_ftoa__Uint128) { 0x9eeeb081e3510eb4 , 0x03f0b0fce107c5f1 } ,  (strconv_dot_ftoa__Uint128) { 0x4bf226ce4f740bc3 , 0x0326f3fd80d304c1 } ,  (strconv_dot_ftoa__Uint128) { 0xa3281f0b72c33c9c , 0x02858ffe00a8d09a } ,  (strconv_dot_ftoa__Uint128) { 0x1c2018d5f568fd4a , 0x020473319a20a6e2 } ,  (strconv_dot_ftoa__Uint128) { 0xf9ccf48988a7fba9 , 0x033a51e8f69aa49c } ,  (strconv_dot_ftoa__Uint128) { 0xfb0a5d3ad3b99621 , 0x02950e53f87bb6e3 } ,  (strconv_dot_ftoa__Uint128) { 0x2f3b7dc8a96144e7 , 0x0210d8432d2fc583 } ,  (strconv_dot_ftoa__Uint128) { 0xe52bfc7442353b0c , 0x034e26d1e1e608d1 } ,  (strconv_dot_ftoa__Uint128) { 0xb756639034f76270 , 0x02a4ebdb1b1e6d74 } ,  (strconv_dot_ftoa__Uint128) { 0x2c451c735d92b526 , 0x021d897c15b1f12a } ,  (strconv_dot_ftoa__Uint128) { 0x13a1c71efc1deea3 , 0x0362759355e981dd } ,  (strconv_dot_ftoa__Uint128) { 0x761b05b2634b2550 , 0x02b52adc44bace4a } ,  (strconv_dot_ftoa__Uint128) { 0x91af37c1e908eaa6 , 0x022a88b036fbd83b } ,  (strconv_dot_ftoa__Uint128) { 0x82b1f2cfdb417770 , 0x03774119f192f392 } ,  (strconv_dot_ftoa__Uint128) { 0xcef4c23fe29ac5f3 , 0x02c5cdae5adbf60e } ,  (strconv_dot_ftoa__Uint128) { 0x3f2a34ffe87bd190 , 0x0237d7beaf165e72 } ,  (strconv_dot_ftoa__Uint128) { 0x984387ffda5fb5b2 , 0x038c8c644b56fd83 } ,  (strconv_dot_ftoa__Uint128) { 0xe0360666484c915b , 0x02d6d6b6a2abfe02 } ,  (strconv_dot_ftoa__Uint128) { 0x802b3851d3707449 , 0x024578921bbccb35 } ,  (strconv_dot_ftoa__Uint128) { 0x99dec082ebe72075 , 0x03a25a835f947855 } ,  (strconv_dot_ftoa__Uint128) { 0xae4bcd358985b391 , 0x02e8486919439377 } ,  (strconv_dot_ftoa__Uint128) { 0xbea30a913ad15c74 , 0x02536d20e102dc5f } ,  (strconv_dot_ftoa__Uint128) { 0xfdd1aa81f7b560b9 , 0x03b8ae9b019e2d65 } ,  (strconv_dot_ftoa__Uint128) { 0x97daeece5fc44d61 , 0x02fa2548ce182451 } ,  (strconv_dot_ftoa__Uint128) { 0xdfe258a51969d781 , 0x0261b76d71ace9da } ,  (strconv_dot_ftoa__Uint128) { 0x996a276e8f0fbf34 , 0x03cf8be24f7b0fc4 } ,  (strconv_dot_ftoa__Uint128) { 0xe121b9253f3fcc2a , 0x030c6fe83f95a636 } ,  (strconv_dot_ftoa__Uint128) { 0xb41afa8432997022 , 0x02705986994484f8 } ,  (strconv_dot_ftoa__Uint128) { 0xecf7f739ea8f19cf , 0x03e6f5a4286da18d } ,  (strconv_dot_ftoa__Uint128) { 0x23f99294bba5ae40 , 0x031f2ae9b9f14e0b } ,  (strconv_dot_ftoa__Uint128) { 0x4ffadbaa2fb7be99 , 0x027f5587c7f43e6f } ,  (strconv_dot_ftoa__Uint128) { 0x7ff7c5dd1925fdc2 , 0x03feef3fa6539718 } ,  (strconv_dot_ftoa__Uint128) { 0xccc637e4141e649b , 0x033258ffb842df46 } ,  (strconv_dot_ftoa__Uint128) { 0xd704f983434b83af , 0x028ead9960357f6b } ,  (strconv_dot_ftoa__Uint128) { 0x126a6135cf6f9c8c , 0x020bbe144cf79923 } ,  (strconv_dot_ftoa__Uint128) { 0x83dd685618b29414 , 0x0345fced47f28e9e } ,  (strconv_dot_ftoa__Uint128) { 0x9cb12044e08edcdd , 0x029e63f1065ba54b } ,  (strconv_dot_ftoa__Uint128) { 0x16f419d0b3a57d7d , 0x02184ff405161dd6 } ,  (strconv_dot_ftoa__Uint128) { 0x8b20294dec3bfbfb , 0x035a19866e89c956 } ,  (strconv_dot_ftoa__Uint128) { 0x3c19baa4bcfcc996 , 0x02ae7ad1f207d445 } ,  (strconv_dot_ftoa__Uint128) { 0xc9ae2eea30ca3adf , 0x02252f0e5b39769d } ,  (strconv_dot_ftoa__Uint128) { 0x0f7d17dd1add2afd , 0x036eb1b091f58a96 } ,  (strconv_dot_ftoa__Uint128) { 0x3f97464a7be42264 , 0x02bef48d41913bab } ,  (strconv_dot_ftoa__Uint128) { 0xcc790508631ce850 , 0x02325d3dce0dc955 } ,  (strconv_dot_ftoa__Uint128) { 0xe0c1a1a704fb0d4d , 0x0383c862e3494222 } ,  (strconv_dot_ftoa__Uint128) { 0x4d67b4859d95a43e , 0x02cfd3824f6dce82 } ,  (strconv_dot_ftoa__Uint128) { 0x711fc39e17aae9cb , 0x023fdc683f8b0b9b } ,  (strconv_dot_ftoa__Uint128) { 0xe832d2968c44a945 , 0x039960a6cc11ac2b } ,  (strconv_dot_ftoa__Uint128) { 0xecf575453d03ba9e , 0x02e11a1f09a7bcef } ,  (strconv_dot_ftoa__Uint128) { 0x572ac4376402fbb1 , 0x024dae7f3aec9726 } ,  (strconv_dot_ftoa__Uint128) { 0x58446d256cd192b5 , 0x03af7d985e47583d } ,  (strconv_dot_ftoa__Uint128) { 0x79d0575123dadbc4 , 0x02f2cae04b6c4697 } ,  (strconv_dot_ftoa__Uint128) { 0x94a6ac40e97be303 , 0x025bd5803c569edf } ,  (strconv_dot_ftoa__Uint128) { 0x8771139b0f2c9e6c , 0x03c62266c6f0fe32 } ,  (strconv_dot_ftoa__Uint128) { 0x9f8da948d8f07ebd , 0x0304e85238c0cb5b } ,  (strconv_dot_ftoa__Uint128) { 0xe60aedd3e0c06564 , 0x026a5374fa33d5e2 } ,  (strconv_dot_ftoa__Uint128) { 0xa344afb9679a3bd2 , 0x03dd5254c3862304 } ,  (strconv_dot_ftoa__Uint128) { 0xe903bfc78614fca8 , 0x031775109c6b4f36 } ,  (strconv_dot_ftoa__Uint128) { 0xba6966393810ca20 , 0x02792a73b055d8f8 } ,  (strconv_dot_ftoa__Uint128) { 0x2a423d2859b4769a , 0x03f510b91a22f4c1 } ,  (strconv_dot_ftoa__Uint128) { 0xee9b642047c39215 , 0x032a73c7481bf700 } ,  (strconv_dot_ftoa__Uint128) { 0xbee2b680396941aa , 0x02885c9f6ce32c00 } ,  (strconv_dot_ftoa__Uint128) { 0xff1bc53361210155 , 0x0206b07f8a4f5666 } ,  (strconv_dot_ftoa__Uint128) { 0x31c6085235019bbb , 0x033de73276e5570b } ,  (strconv_dot_ftoa__Uint128) { 0x27d1a041c4014963 , 0x0297ec285f1ddf3c } ,  (strconv_dot_ftoa__Uint128) { 0xeca7b367d0010782 , 0x021323537f4b18fc } ,  (strconv_dot_ftoa__Uint128) { 0xadd91f0c8001a59d , 0x0351d21f3211c194 } ,  (strconv_dot_ftoa__Uint128) { 0xf17a7f3d3334847e , 0x02a7db4c280e3476 } ,  (strconv_dot_ftoa__Uint128) { 0x279532975c2a0398 , 0x021fe2a3533e905f } ,  (strconv_dot_ftoa__Uint128) { 0xd8eeb75893766c26 , 0x0366376bb8641a31 } ,  (strconv_dot_ftoa__Uint128) { 0x7a5892ad42c52352 , 0x02b82c562d1ce1c1 } ,  (strconv_dot_ftoa__Uint128) { 0xfb7a0ef102374f75 , 0x022cf044f0e3e7cd } ,  (strconv_dot_ftoa__Uint128) { 0xc59017e8038bb254 , 0x037b1a07e7d30c7c } ,  (strconv_dot_ftoa__Uint128) { 0x37a67986693c8eaa , 0x02c8e19feca8d6ca } ,  (strconv_dot_ftoa__Uint128) { 0xf951fad1edca0bbb , 0x023a4e198a20abd4 } ,  (strconv_dot_ftoa__Uint128) { 0x28832ae97c76792b , 0x03907cf5a9cddfbb } ,  (strconv_dot_ftoa__Uint128) { 0x2068ef21305ec756 , 0x02d9fd9154a4b2fc } ,  (strconv_dot_ftoa__Uint128) { 0x19ed8c1a8d189f78 , 0x0247fe0ddd508f30 } ,  (strconv_dot_ftoa__Uint128) { 0x5caf4690e1c0ff26 , 0x03a66349621a7eb3 } ,  (strconv_dot_ftoa__Uint128) { 0x4a25d20d81673285 , 0x02eb82a11b48655c } ,  (strconv_dot_ftoa__Uint128) { 0x3b5174d79ab8f537 , 0x0256021a7c39eab0 } ,  (strconv_dot_ftoa__Uint128) { 0x921bee25c45b21f1 , 0x03bcd02a605caab3 } ,  (strconv_dot_ftoa__Uint128) { 0xdb498b5169e2818e , 0x02fd735519e3bbc2 } ,  (strconv_dot_ftoa__Uint128) { 0x15d46f7454b53472 , 0x02645c4414b62fcf } ,  (strconv_dot_ftoa__Uint128) { 0xefba4bed545520b6 , 0x03d3c6d35456b2e4 } ,  (strconv_dot_ftoa__Uint128) { 0xf2fb6ff110441a2b , 0x030fd242a9def583 } ,  (strconv_dot_ftoa__Uint128) { 0x8f2f8cc0d9d014ef , 0x02730e9bbb18c469 } ,  (strconv_dot_ftoa__Uint128) { 0xb1e5ae015c80217f , 0x03eb4a92c4f46d75 } ,  (strconv_dot_ftoa__Uint128) { 0xc1848b344a001acc , 0x0322a20f03f6bdf7 } ,  (strconv_dot_ftoa__Uint128) { 0xce03a2903b3348a3 , 0x02821b3f365efe5f } ,  (strconv_dot_ftoa__Uint128) { 0xd802e873628f6d4f , 0x0201af65c518cb7f } ,  (strconv_dot_ftoa__Uint128) { 0x599e40b89db2487f , 0x0335e56fa1c14599 } ,  (strconv_dot_ftoa__Uint128) { 0xe14b66fa17c1d399 , 0x029184594e3437ad } ,  (strconv_dot_ftoa__Uint128) { 0x81091f2e7967dc7a , 0x020e037aa4f692f1 } ,  (strconv_dot_ftoa__Uint128) { 0x9b41cb7d8f0c93f6 , 0x03499f2aa18a84b5 } ,  (strconv_dot_ftoa__Uint128) { 0xaf67d5fe0c0a0ff8 , 0x02a14c221ad536f7 } ,  (strconv_dot_ftoa__Uint128) { 0xf2b977fe70080cc7 , 0x021aa34e7bddc592 } ,  (strconv_dot_ftoa__Uint128) { 0x1df58cca4cd9ae0b , 0x035dd2172c9608eb } ,  (strconv_dot_ftoa__Uint128) { 0xe4c470a1d7148b3c , 0x02b174df56de6d88 } ,  (strconv_dot_ftoa__Uint128) { 0x83d05a1b1276d5ca , 0x022790b2abe5246d } ,  (strconv_dot_ftoa__Uint128) { 0x9fb3c35e83f1560f , 0x0372811ddfd50715 } ,  (strconv_dot_ftoa__Uint128) { 0xb2f635e5365aab3f , 0x02c200e4b310d277 } ,  (strconv_dot_ftoa__Uint128) { 0xf591c4b75eaeef66 , 0x0234cd83c273db92 } ,  (strconv_dot_ftoa__Uint128) { 0xef4fa125644b18a3 , 0x0387af39371fc5b7 } ,  (strconv_dot_ftoa__Uint128) { 0x8c3fb41de9d5ad4f , 0x02d2f2942c196af9 } ,  (strconv_dot_ftoa__Uint128) { 0x3cffc34b2177bdd9 , 0x02425ba9bce12261 } ,  (strconv_dot_ftoa__Uint128) { 0x94cc6bab68bf9628 , 0x039d5f75fb01d09b } ,  (strconv_dot_ftoa__Uint128) { 0x10a38955ed6611b9 , 0x02e44c5e6267da16 } ,  (strconv_dot_ftoa__Uint128) { 0xda1c6dde5784dafb , 0x02503d184eb97b44 } ,  (strconv_dot_ftoa__Uint128) { 0xf693e2fd58d49191 , 0x03b394f3b128c53a } ,  (strconv_dot_ftoa__Uint128) { 0xc5431bfde0aa0e0e , 0x02f610c2f4209dc8 } ,  (strconv_dot_ftoa__Uint128) { 0x6a9c1664b3bb3e72 , 0x025e73cf29b3b16d } ,  (strconv_dot_ftoa__Uint128) { 0x10f9bd6dec5eca4f , 0x03ca52e50f85e8af } ,  (strconv_dot_ftoa__Uint128) { 0xda616457f04bd50c , 0x03084250d937ed58 } ,  (strconv_dot_ftoa__Uint128) { 0xe1e783798d09773d , 0x026d01da475ff113 } ,  (strconv_dot_ftoa__Uint128) { 0x030c058f480f252e , 0x03e19c9072331b53 } ,  (strconv_dot_ftoa__Uint128) { 0x68d66ad906728425 , 0x031ae3a6c1c27c42 } ,  (strconv_dot_ftoa__Uint128) { 0x8711ef14052869b7 , 0x027be952349b969b } ,  (strconv_dot_ftoa__Uint128) { 0x0b4fe4ecd50d75f2 , 0x03f97550542c242c } ,  (strconv_dot_ftoa__Uint128) { 0xa2a650bd773df7f5 , 0x032df7737689b689 } ,  (strconv_dot_ftoa__Uint128) { 0xb551da312c31932a , 0x028b2c5c5ed49207 } ,  (strconv_dot_ftoa__Uint128) { 0x5ddb14f4235adc22 , 0x0208f049e576db39 } ,  (strconv_dot_ftoa__Uint128) { 0x2fc4ee536bc49369 , 0x034180763bf15ec2 } ,  (strconv_dot_ftoa__Uint128) { 0xbfd0bea92303a921 , 0x029acd2b63277f01 } ,  (strconv_dot_ftoa__Uint128) { 0x9973cbba8269541a , 0x021570ef8285ff34 } ,  (strconv_dot_ftoa__Uint128) { 0x5bec792a6a42202a , 0x0355817f373ccb87 } ,  (strconv_dot_ftoa__Uint128) { 0xe3239421ee9b4cef , 0x02aacdff5f63d605 } ,  (strconv_dot_ftoa__Uint128) { 0xb5b6101b25490a59 , 0x02223e65e5e97804 } ,  (strconv_dot_ftoa__Uint128) { 0x22bce691d541aa27 , 0x0369fd6fd64259a1 } ,  (strconv_dot_ftoa__Uint128) { 0xb563eba7ddce21b9 , 0x02bb31264501e14d } ,  (strconv_dot_ftoa__Uint128) { 0xf78322ecb171b494 , 0x022f5a850401810a } ,  (strconv_dot_ftoa__Uint128) { 0x259e9e47824f8753 , 0x037ef73b399c01ab } ,  (strconv_dot_ftoa__Uint128) { 0x1e187e9f9b72d2a9 , 0x02cbf8fc2e1667bc } ,  (strconv_dot_ftoa__Uint128) { 0x4b46cbb2e2c24221 , 0x023cc73024deb963 } ,  (strconv_dot_ftoa__Uint128) { 0x120adf849e039d01 , 0x039471e6a1645bd2 } ,  (strconv_dot_ftoa__Uint128) { 0xdb3be603b19c7d9a , 0x02dd27ebb4504974 } ,  (strconv_dot_ftoa__Uint128) { 0x7c2feb3627b0647c , 0x024a865629d9d45d } ,  (strconv_dot_ftoa__Uint128) { 0x2d197856a5e7072c , 0x03aa7089dc8fba2f } ,  (strconv_dot_ftoa__Uint128) { 0x8a7ac6abb7ec05bd , 0x02eec06e4a0c94f2 } ,  (strconv_dot_ftoa__Uint128) { 0xd52f05562cbcd164 , 0x025899f1d4d6dd8e } ,  (strconv_dot_ftoa__Uint128) { 0x21e4d556adfae8a0 , 0x03c0f64fbaf1627e } ,  (strconv_dot_ftoa__Uint128) { 0xe7ea444557fbed4d , 0x0300c50c958de864 } ,  (strconv_dot_ftoa__Uint128) { 0xecbb69d1132ff10a , 0x0267040a113e5383 } ,  (strconv_dot_ftoa__Uint128) { 0xadf8a94e851981aa , 0x03d8067681fd526c } ,  (strconv_dot_ftoa__Uint128) { 0x8b2d543ed0e13488 , 0x0313385ece6441f0 } ,  (strconv_dot_ftoa__Uint128) { 0xd5bddcff0d80f6d3 , 0x0275c6b23eb69b26 } ,  (strconv_dot_ftoa__Uint128) { 0x892fc7fe7c018aeb , 0x03efa45064575ea4 } ,  (strconv_dot_ftoa__Uint128) { 0x3a8c9ffec99ad589 , 0x03261d0d1d12b21d } ,  (strconv_dot_ftoa__Uint128) { 0xc8707fff07af113b , 0x0284e40a7da88e7d } ,  (strconv_dot_ftoa__Uint128) { 0x39f39998d2f2742f , 0x0203e9a1fe2071fe } ,  (strconv_dot_ftoa__Uint128) { 0x8fec28f484b7204b , 0x033975cffd00b663 } ,  (strconv_dot_ftoa__Uint128) { 0xd989ba5d36f8e6a2 , 0x02945e3ffd9a2b82 } ,  (strconv_dot_ftoa__Uint128) { 0x47a161e42bfa521c , 0x02104b66647b5602 } ,  (strconv_dot_ftoa__Uint128) { 0x0c35696d132a1cf9 , 0x034d4570a0c5566a } ,  (strconv_dot_ftoa__Uint128) { 0x09c454574288172d , 0x02a4378d4d6aab88 } ,  (strconv_dot_ftoa__Uint128) { 0xa169dd129ba0128b , 0x021cf93dd7888939 } ,  (strconv_dot_ftoa__Uint128) { 0x0242fb50f9001dab , 0x03618ec958da7529 } ,  (strconv_dot_ftoa__Uint128) { 0x9b68c90d940017bc , 0x02b4723aad7b90ed } ,  (strconv_dot_ftoa__Uint128) { 0x4920a0d7a999ac96 , 0x0229f4fbbdfc73f1 } ,  (strconv_dot_ftoa__Uint128) { 0x750101590f5c4757 , 0x037654c5fcc71fe8 } ,  (strconv_dot_ftoa__Uint128) { 0x2a6734473f7d05df , 0x02c5109e63d27fed } ,  (strconv_dot_ftoa__Uint128) { 0xeeb8f69f65fd9e4c , 0x0237407eb641fff0 } ,  (strconv_dot_ftoa__Uint128) { 0xe45b24323cc8fd46 , 0x038b9a6456cfffe7 } ,  (strconv_dot_ftoa__Uint128) { 0xb6af502830a0ca9f , 0x02d6151d123fffec } ,  (strconv_dot_ftoa__Uint128) { 0xf88c402026e7087f , 0x0244ddb0db666656 } ,  (strconv_dot_ftoa__Uint128) { 0x2746cd003e3e73fe , 0x03a162b4923d708b } ,  (strconv_dot_ftoa__Uint128) { 0x1f6bd73364fec332 , 0x02e7822a0e978d3c } ,  (strconv_dot_ftoa__Uint128) { 0xe5efdf5c50cbcf5b , 0x0252ce880bac70fc } ,  (strconv_dot_ftoa__Uint128) { 0x3cb2fefa1adfb22b , 0x03b7b0d9ac471b2e } ,  (strconv_dot_ftoa__Uint128) { 0x308f3261af195b56 , 0x02f95a47bd05af58 } ,  (strconv_dot_ftoa__Uint128) { 0x5a0c284e25ade2ab , 0x0261150630d15913 } ,  (strconv_dot_ftoa__Uint128) { 0x29ad0d49d5e30445 , 0x03ce8809e7b55b52 } ,  (strconv_dot_ftoa__Uint128) { 0x548a7107de4f369d , 0x030ba007ec9115db } ,  (strconv_dot_ftoa__Uint128) { 0xdd3b8d9fe50c2bb1 , 0x026fb3398a0dab15 } ,  (strconv_dot_ftoa__Uint128) { 0x952c15cca1ad12b5 , 0x03e5eb8f434911bc } ,  (strconv_dot_ftoa__Uint128) { 0x775677d6e7bda891 , 0x031e560c35d40e30 } ,  (strconv_dot_ftoa__Uint128) { 0xc5dec645863153a7 , 0x027eab3cf7dcd826 }  });
hashmap__init_capicity =  1  <<  hashmap__init_log_capicity;
hashmap__init_cap =  hashmap__init_capicity - 2;
hashmap__hash_mask =  ((u32)( 0x00FFFFFF ) );
hashmap__probe_inc =  ((u32)( 0x01000000 ) );
hashmap__max_probe =  ((u32)( 0xFF000000 ) );
builtin__init();

}
 
string _STR(const char *fmt, ...) {
	va_list argptr;
	va_start(argptr, fmt);
	size_t len = vsnprintf(0, 0, fmt, argptr) + 1;
	va_end(argptr);
	byte* buf = malloc(len);
	va_start(argptr, fmt);
	vsprintf((char *)buf, fmt, argptr);
	va_end(argptr);
#ifdef DEBUG_ALLOC
	puts("_STR:");
	puts(buf);
#endif
	return tos2(buf);
}

string _STR_TMP(const char *fmt, ...) {
	va_list argptr;
	va_start(argptr, fmt);
	//size_t len = vsnprintf(0, 0, fmt, argptr) + 1;
	va_end(argptr);
	va_start(argptr, fmt);
	vsprintf((char *)g_str_buf, fmt, argptr);
	va_end(argptr);
#ifdef DEBUG_ALLOC
	//puts("_STR_TMP:");
	//puts(g_str_buf);
#endif
	return tos2(g_str_buf);
}


 int main(int argc, char** argv) { 
   init();
 
   main__main();
 #if VPREALLOC
 free(g_m2_buf);
 puts("freed mem buf");
 #endif
 
   return 0;
 }

