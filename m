Content-Type: multipart/mixed; boundary="===============7796690473765821551=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: net/ceph/decode.c:164:38: warning: taking address of packed member 'in_addr' of class or structure 'ceph_entity_addr' may result in an unaligned pointer value
Date: Sat, 16 Jan 2021 20:07:15 +0800
Message-ID: <202101162009.6J022otg-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7796690473765821551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d94330a437a573cfdf848f6743b1ed169242c8a
commit: cd1a677cad994021b19665ed476aea63f5d54f31 libceph, ceph: implement m=
sgr2.1 protocol (crc and secure modes)
date:   5 weeks ago
config: mips-randconfig-r011-20210116 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project d7bc3b=
7ce23b664d6620cdc32370a8614523ca2f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcd1a677cad994021b19665ed476aea63f5d54f31
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cd1a677cad994021b19665ed476aea63f5d54f31
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/ceph/decode.c:4:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:39:
   In file included from include/linux/skbuff.h:28:
   In file included from include/net/checksum.h:22:
   arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: i=
nput with type 'unsigned long' matching output with type '__wsum' (aka 'uns=
igned int')
           : "0" ((__force unsigned long)daddr),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/ceph/decode.c:6:
   include/linux/ceph/decode.h:236:33: warning: taking address of packed me=
mber 'in_addr' of class or structure 'ceph_entity_addr' may result in an un=
aligned pointer value [-Waddress-of-packed-member]
           __be16 ss_family =3D *(__be16 *)&a->in_addr.ss_family;
                                          ^~~~~~~~~~~~~~~~~~~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:13:52: note: expanded from macro '__ge=
t_unaligned_le'
   #define __get_unaligned_le(ptr) ((__force typeof(*(ptr)))({             =
        \
                                                      ^~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:14:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 1, *(ptr),          =
            \
                                          ^~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:14:47: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 1, *(ptr),          =
            \
                                                        ^~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:15:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 2, get_unaligned_le1=
6((ptr)),   \
                                          ^~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:16:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 4, get_unaligned_le3=
2((ptr)),   \
                                          ^~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:16:65: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 4, get_unaligned_le3=
2((ptr)),   \
                                                                          ^=
~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:17:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 8, get_unaligned_le6=
4((ptr)),   \
                                          ^~~
>> net/ceph/decode.c:164:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:17:65: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 8, get_unaligned_le6=
4((ptr)),   \
                                                                          ^=
~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:13:52: note: expanded from macro '__ge=
t_unaligned_le'
   #define __get_unaligned_le(ptr) ((__force typeof(*(ptr)))({             =
        \
                                                      ^~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:14:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 1, *(ptr),          =
            \
                                          ^~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:14:47: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 1, *(ptr),          =
            \
                                                        ^~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:15:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 2, get_unaligned_le1=
6((ptr)),   \
                                          ^~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:16:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 4, get_unaligned_le3=
2((ptr)),   \
                                          ^~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:16:65: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 4, get_unaligned_le3=
2((ptr)),   \
                                                                          ^=
~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:17:33: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 8, get_unaligned_le6=
4((ptr)),   \
                                          ^~~
   net/ceph/decode.c:172:38: warning: taking address of packed member 'in_a=
ddr' of class or structure 'ceph_entity_addr' may result in an unaligned po=
inter value [-Waddress-of-packed-member]
           sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/unaligned.h:22:24: note: expanded from macro 'get_un=
aligned'
   # define get_unaligned  __get_unaligned_le
                           ^
   include/linux/unaligned/generic.h:17:65: note: expanded from macro '__ge=
t_unaligned_le'
           __builtin_choose_expr(sizeof(*(ptr)) =3D=3D 8, get_unaligned_le6=
4((ptr)),   \
                                                                          ^=
~~
   17 warnings and 1 error generated.
--
   In file included from net/ceph/messenger_v2.c:20:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/net/checksum.h:22:
   arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: i=
nput with type 'unsigned long' matching output with type '__wsum' (aka 'uns=
igned int')
           : "0" ((__force unsigned long)daddr),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/ceph/messenger_v2.c:20:
   In file included from include/net/sock.h:61:
   include/linux/poll.h:142:27: warning: division by zero is undefined [-Wd=
ivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                           ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL#=
#X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   include/linux/poll.h:142:39: warning: division by zero is undefined [-Wd=
ivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                                       ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL#=
#X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   In file included from net/ceph/messenger_v2.c:24:
   include/linux/ceph/decode.h:236:33: warning: taking address of packed me=
mber 'in_addr' of class or structure 'ceph_entity_addr' may result in an un=
aligned pointer value [-Waddress-of-packed-member]
           __be16 ss_family =3D *(__be16 *)&a->in_addr.ss_family;
                                          ^~~~~~~~~~~~~~~~~~~~
>> net/ceph/messenger_v2.c:557:16: warning: taking address of packed member=
 'front_crc' of class or structure 'ceph_connection_v2_info::(anonymous str=
uct)::(anonymous union)::(anonymous)' may result in an unaligned pointer va=
lue [-Waddress-of-packed-member]
           cpu_to_le32s(&con->v2.out_epil.front_crc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:112:22: note: expanded from macro 'cpu=
_to_le32s'
   #define cpu_to_le32s __cpu_to_le32s
                        ^
   include/uapi/linux/byteorder/little_endian.h:94:39: note: expanded from =
macro '__cpu_to_le32s'
   #define __cpu_to_le32s(x) do { (void)(x); } while (0)
                                         ^
>> net/ceph/messenger_v2.c:558:16: warning: taking address of packed member=
 'middle_crc' of class or structure 'ceph_connection_v2_info::(anonymous st=
ruct)::(anonymous union)::(anonymous)' may result in an unaligned pointer v=
alue [-Waddress-of-packed-member]
           cpu_to_le32s(&con->v2.out_epil.middle_crc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:112:22: note: expanded from macro 'cpu=
_to_le32s'
   #define cpu_to_le32s __cpu_to_le32s
                        ^
   include/uapi/linux/byteorder/little_endian.h:94:39: note: expanded from =
macro '__cpu_to_le32s'
   #define __cpu_to_le32s(x) do { (void)(x); } while (0)
                                         ^
>> net/ceph/messenger_v2.c:559:16: warning: taking address of packed member=
 'data_crc' of class or structure 'ceph_connection_v2_info::(anonymous stru=
ct)::(anonymous union)::(anonymous)' may result in an unaligned pointer val=
ue [-Waddress-of-packed-member]
           cpu_to_le32s(&con->v2.out_epil.data_crc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:112:22: note: expanded from macro 'cpu=
_to_le32s'
   #define cpu_to_le32s __cpu_to_le32s
                        ^
   include/uapi/linux/byteorder/little_endian.h:94:39: note: expanded from =
macro '__cpu_to_le32s'
   #define __cpu_to_le32s(x) do { (void)(x); } while (0)
                                         ^
   6 warnings and 1 error generated.


vim +164 net/ceph/decode.c

     5	=

   > 6	#include <linux/ceph/decode.h>
     7	=

     8	static int
     9	ceph_decode_entity_addr_versioned(void **p, void *end,
    10					  struct ceph_entity_addr *addr)
    11	{
    12		int ret;
    13		u8 struct_v;
    14		u32 struct_len, addr_len;
    15		void *struct_end;
    16	=

    17		ret =3D ceph_start_decoding(p, end, 1, "entity_addr_t", &struct_v,
    18					  &struct_len);
    19		if (ret)
    20			goto bad;
    21	=

    22		ret =3D -EINVAL;
    23		struct_end =3D *p + struct_len;
    24	=

    25		ceph_decode_copy_safe(p, end, &addr->type, sizeof(addr->type), bad);
    26	=

    27		ceph_decode_copy_safe(p, end, &addr->nonce, sizeof(addr->nonce), ba=
d);
    28	=

    29		ceph_decode_32_safe(p, end, addr_len, bad);
    30		if (addr_len > sizeof(addr->in_addr))
    31			goto bad;
    32	=

    33		memset(&addr->in_addr, 0, sizeof(addr->in_addr));
    34		if (addr_len) {
    35			ceph_decode_copy_safe(p, end, &addr->in_addr, addr_len, bad);
    36	=

    37			addr->in_addr.ss_family =3D
    38				le16_to_cpu((__force __le16)addr->in_addr.ss_family);
    39		}
    40	=

    41		/* Advance past anything the client doesn't yet understand */
    42		*p =3D struct_end;
    43		ret =3D 0;
    44	bad:
    45		return ret;
    46	}
    47	=

    48	static int
    49	ceph_decode_entity_addr_legacy(void **p, void *end,
    50				       struct ceph_entity_addr *addr)
    51	{
    52		int ret =3D -EINVAL;
    53	=

    54		/* Skip rest of type field */
    55		ceph_decode_skip_n(p, end, 3, bad);
    56	=

    57		/*
    58		 * Clients that don't support ADDR2 always send TYPE_NONE, change it
    59		 * to TYPE_LEGACY for forward compatibility.
    60		 */
    61		addr->type =3D CEPH_ENTITY_ADDR_TYPE_LEGACY;
    62		ceph_decode_copy_safe(p, end, &addr->nonce, sizeof(addr->nonce), ba=
d);
    63		memset(&addr->in_addr, 0, sizeof(addr->in_addr));
    64		ceph_decode_copy_safe(p, end, &addr->in_addr,
    65				      sizeof(addr->in_addr), bad);
    66		addr->in_addr.ss_family =3D
    67				be16_to_cpu((__force __be16)addr->in_addr.ss_family);
    68		ret =3D 0;
    69	bad:
    70		return ret;
    71	}
    72	=

    73	int
    74	ceph_decode_entity_addr(void **p, void *end, struct ceph_entity_addr=
 *addr)
    75	{
    76		u8 marker;
    77	=

    78		ceph_decode_8_safe(p, end, marker, bad);
    79		if (marker =3D=3D 1)
    80			return ceph_decode_entity_addr_versioned(p, end, addr);
    81		else if (marker =3D=3D 0)
    82			return ceph_decode_entity_addr_legacy(p, end, addr);
    83	bad:
    84		return -EINVAL;
    85	}
    86	EXPORT_SYMBOL(ceph_decode_entity_addr);
    87	=

    88	/*
    89	 * Return addr of desired type (MSGR2 or LEGACY) or error.
    90	 * Make sure there is only one match.
    91	 *
    92	 * Assume encoding with MSG_ADDR2.
    93	 */
    94	int ceph_decode_entity_addrvec(void **p, void *end, bool msgr2,
    95				       struct ceph_entity_addr *addr)
    96	{
    97		__le32 my_type =3D msgr2 ? CEPH_ENTITY_ADDR_TYPE_MSGR2 :
    98					 CEPH_ENTITY_ADDR_TYPE_LEGACY;
    99		struct ceph_entity_addr tmp_addr;
   100		int addr_cnt;
   101		bool found;
   102		u8 marker;
   103		int ret;
   104		int i;
   105	=

   106		ceph_decode_8_safe(p, end, marker, e_inval);
   107		if (marker !=3D 2) {
   108			pr_err("bad addrvec marker %d\n", marker);
   109			return -EINVAL;
   110		}
   111	=

   112		ceph_decode_32_safe(p, end, addr_cnt, e_inval);
   113	=

   114		found =3D false;
   115		for (i =3D 0; i < addr_cnt; i++) {
   116			ret =3D ceph_decode_entity_addr(p, end, &tmp_addr);
   117			if (ret)
   118				return ret;
   119	=

   120			if (tmp_addr.type =3D=3D my_type) {
   121				if (found) {
   122					pr_err("another match of type %d in addrvec\n",
   123					       le32_to_cpu(my_type));
   124					return -EINVAL;
   125				}
   126	=

   127				memcpy(addr, &tmp_addr, sizeof(*addr));
   128				found =3D true;
   129			}
   130		}
   131		if (!found && addr_cnt !=3D 0) {
   132			pr_err("no match of type %d in addrvec\n",
   133			       le32_to_cpu(my_type));
   134			return -ENOENT;
   135		}
   136	=

   137		return 0;
   138	=

   139	e_inval:
   140		return -EINVAL;
   141	}
   142	EXPORT_SYMBOL(ceph_decode_entity_addrvec);
   143	=

   144	static int get_sockaddr_encoding_len(sa_family_t family)
   145	{
   146		union {
   147			struct sockaddr sa;
   148			struct sockaddr_in sin;
   149			struct sockaddr_in6 sin6;
   150		} u;
   151	=

   152		switch (family) {
   153		case AF_INET:
   154			return sizeof(u.sin);
   155		case AF_INET6:
   156			return sizeof(u.sin6);
   157		default:
   158			return sizeof(u);
   159		}
   160	}
   161	=

   162	int ceph_entity_addr_encoding_len(const struct ceph_entity_addr *add=
r)
   163	{
 > 164		sa_family_t family =3D get_unaligned(&addr->in_addr.ss_family);
   165		int addr_len =3D get_sockaddr_encoding_len(family);
   166	=

   167		return 1 + CEPH_ENCODING_START_BLK_LEN + 4 + 4 + 4 + addr_len;
   168	}
   169	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7796690473765821551==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7796690473765821551==--

