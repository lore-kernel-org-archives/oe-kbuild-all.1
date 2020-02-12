Content-Type: multipart/mixed; boundary="===============8156969415346163778=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.5/futex-multiple-wait 2/6] kernel/futex.c:4435:17: error: implicit declaration of function 'compat_ptr'
Date: Thu, 13 Feb 2020 02:15:52 +0800
Message-ID: <202002130249.NQTY4F6N%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8156969415346163778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.5/futex-multiple-wait
head:   7ae5d731ffcf0f3a77156ba6a1018ce4422e525f
commit: 6628f097391e313160a2fe540ad02f6edddec348 [2/6] futex: Implement mec=
hanism to wait on any of several futexes
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6628f097391e313160a2fe540ad02f6edddec348
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Darc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from arch/arc/include/asm/cache.h:28,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/compat.h:10,
                    from kernel/futex.c:34:
   kernel/futex.c: In function '__do_sys_futex':
   kernel/futex.c:4216:16: error: implicit declaration of function 'in_x32_=
syscall'; did you mean 'in_syscall'? [-Werror=3Dimplicit-function-declarati=
on]
    4216 |   if (unlikely(in_x32_syscall()))
         |                ^~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/futex.c: In function 'compat_futex_read_wait_block':
>> kernel/futex.c:4435:17: error: implicit declaration of function 'compat_=
ptr' [-Werror=3Dimplicit-function-declaration]
    4435 |   qs[i].uaddr =3D compat_ptr(fwb.uaddr);
         |                 ^~~~~~~~~~
>> kernel/futex.c:4435:15: warning: assignment to 'u32 *' {aka 'unsigned in=
t *'} from 'int' makes pointer from integer without a cast [-Wint-conversio=
n]
    4435 |   qs[i].uaddr =3D compat_ptr(fwb.uaddr);
         |               ^
   cc1: some warnings being treated as errors

vim +/compat_ptr +4435 kernel/futex.c

  4403	=

  4404	/**
  4405	 * compat_futex_read_wait_block - Read an array of futex_wait_block =
from
  4406	 * userspace
  4407	 * @uaddr:	Userspace address of the block
  4408	 * @count:	Number of blocks to be read
  4409	 *
  4410	 * This function does the same as futex_read_wait_block(), except th=
at it
  4411	 * converts the pointer to the futex from the compat version to the =
regular one.
  4412	 */
  4413	inline struct futex_q *compat_futex_read_wait_block(u32 __user *uadd=
r,
  4414							    u32 count)
  4415	{
  4416		int i;
  4417		struct futex_q *qs;
  4418		struct compat_futex_wait_block fwb;
  4419		struct compat_futex_wait_block __user *entry =3D
  4420			(struct compat_futex_wait_block __user *) uaddr;
  4421	=

  4422		if (!count || count > FUTEX_MULTIPLE_MAX_COUNT)
  4423			return ERR_PTR(-EINVAL);
  4424	=

  4425		qs =3D kcalloc(count, sizeof(*qs), GFP_KERNEL);
  4426		if (!qs)
  4427			return ERR_PTR(-ENOMEM);
  4428	=

  4429		for (i =3D 0; i < count; i++) {
  4430			if (copy_from_user(&fwb, &entry[i], sizeof(fwb))) {
  4431				kfree(qs);
  4432				return ERR_PTR(-EFAULT);
  4433			}
  4434	=

> 4435			qs[i].uaddr =3D compat_ptr(fwb.uaddr);
  4436			qs[i].uval =3D fwb.val;
  4437			qs[i].bitset =3D fwb.bitset;
  4438		}
  4439	=

  4440		return qs;
  4441	}
  4442	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8156969415346163778==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8156969415346163778==--

