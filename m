Content-Type: multipart/mixed; boundary="===============8885488388911718974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [kdave-btrfs-devel:dev/raid-policy 83/85] fs/btrfs/volumes.c:5739:6: warning: variable 'now' is used uninitialized whenever 'if' condition is false
Date: Fri, 29 Jan 2021 02:08:27 +0800
Message-ID: <202101290222.XoWECQWB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8885488388911718974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/kdave/btrfs-devel.git dev/raid-policy
head:   92ab5dba1e9e01e617039e8450d1491b0806c31c
commit: 4535566286913fb8ad62c3efef00e6d2593b25e4 [83/85] btrfs: Add roundro=
bin read policy
config: s390-randconfig-r005-20210128 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 48bdd6=
76a1d1338c10541460bf5beb69ac17e451)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/kdave/btrfs-devel/commit/4535566286913fb8ad62c=
3efef00e6d2593b25e4
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-dev=
el.git
        git fetch --no-tags kdave-btrfs-devel dev/raid-policy
        git checkout 4535566286913fb8ad62c3efef00e6d2593b25e4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from fs/btrfs/volumes.c:10:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from fs/btrfs/volumes.c:10:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from fs/btrfs/volumes.c:10:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from fs/btrfs/volumes.c:10:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from fs/btrfs/volumes.c:10:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> fs/btrfs/volumes.c:5739:6: warning: variable 'now' is used uninitialized=
 whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (last_sched_time !=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5772:44: note: uninitialized use occurs here
           this_cpu_write(*fs_info->last_sched_time, now);
                                                     ^~~
   include/linux/percpu-defs.h:508:73: note: expanded from macro 'this_cpu_=
write'
   #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_=
, pcp, val)
                                                                           =
       ^~~
   include/linux/percpu-defs.h:380:29: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                                             ^~~~~~~~~~~
   include/asm-generic/percpu.h:342:64: note: expanded from macro 'this_cpu=
_write_8'
   #define this_cpu_write_8(pcp, val)      this_cpu_generic_to_op(pcp, val,=
 =3D)
                                                                       ^~~
   include/asm-generic/percpu.h:148:29: note: expanded from macro 'this_cpu=
_generic_to_op'
           raw_cpu_generic_to_op(pcp, val, op);                            \
                                      ^~~
   include/asm-generic/percpu.h:72:26: note: expanded from macro 'raw_cpu_g=
eneric_to_op'
           *raw_cpu_ptr(&(pcp)) op val;                                    \
                                   ^~~
   fs/btrfs/volumes.c:5739:2: note: remove the 'if' if its condition is alw=
ays true
           if (last_sched_time !=3D 0) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5736:9: note: initialize the variable 'now' to silenc=
e this warning
           u64 now;
                  ^
                   =3D 0
   In file included from fs/btrfs/volumes.c:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:10:
   In file included from include/linux/list.h:9:
   In file included from include/linux/kernel.h:11:
   In file included from include/linux/bitops.h:32:
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:90:4: error: invalid operand in inline as=
m: 'ni	$0,${1:b}'
                           "ni     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
                           "oi     %0,%b1\n"
                           ^
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   arch/s390/include/asm/bitops.h:69:4: error: invalid operand in inline as=
m: 'oi	$0,${1:b}'
   fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
   21 warnings and 20 errors generated.


vim +5739 fs/btrfs/volumes.c

  5712	=

  5713	/*
  5714	 * find_live_mirror_roundrobin() searches for a raid1 mirror which c=
an process
  5715	 * more requests.
  5716	 *
  5717	 * @fs_info:     the filesystem
  5718	 * @map:         extent mapping which contains stripes
  5719	 * @first:       number of the first mirror
  5720	 * @num_stripes: number of stripes in the array
  5721	 *
  5722	 * It calls __find_live_mirror_roundrobin() function to try to find =
a suitable
  5723	 * mirror, firstly non-rotational, then rotational.
  5724	 *
  5725	 * If no suitable mirror found, it selects the next (last used + 1) =
mirror.
  5726	 */
  5727	static int find_live_mirror_roundrobin(struct btrfs_fs_info *fs_info,
  5728					       struct map_lookup *map, int first,
  5729					       int num_stripes)
  5730	{
  5731		int preferred_mirror;
  5732		int rotational_first;
  5733		u64 last_sched_time;
  5734		u64 duration;
  5735		int limit;
  5736		u64 now;
  5737	=

  5738		last_sched_time =3D this_cpu_read(*fs_info->last_sched_time);
> 5739		if (last_sched_time !=3D 0) {
  5740			now =3D ktime_get_ns();
  5741			duration =3D now - last_sched_time;
  5742	=

  5743			if (duration < (NSEC_PER_MSEC *
  5744					fs_info->fs_devices->read_policy_roundrobin_duration)) {
  5745				preferred_mirror =3D this_cpu_read(*fs_info->last_mirror);
  5746				goto out;
  5747			}
  5748		}
  5749	=

  5750		limit =3D first + num_stripes;
  5751	=

  5752		/* Try to find non-rotational mirror */
  5753		__find_live_mirror_roundrobin_nonrot(fs_info, map, first, limit,
  5754						     &preferred_mirror,
  5755						     &rotational_first);
  5756		if (preferred_mirror >=3D 0)
  5757			goto out;
  5758	=

  5759		/* Try to find rotational mirror if any available */
  5760		if (rotational_first >=3D 0) {
  5761			preferred_mirror =3D __find_live_mirror_roundrobin_rot(
  5762				fs_info, map, first, num_stripes);
  5763			if (preferred_mirror >=3D 0)
  5764				goto out;
  5765		}
  5766	=

  5767		/* If no suitable mirror found, return the next mirror */
  5768		preferred_mirror =3D (
  5769			this_cpu_read(*fs_info->last_mirror) + 1) % num_stripes;
  5770	=

  5771	out:
  5772		this_cpu_write(*fs_info->last_sched_time, now);
  5773		this_cpu_write(*fs_info->last_mirror, preferred_mirror);
  5774		return preferred_mirror;
  5775	}
  5776	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8885488388911718974==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8885488388911718974==--

