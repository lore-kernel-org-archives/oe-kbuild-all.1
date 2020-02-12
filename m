Content-Type: multipart/mixed; boundary="===============6770953027361847336=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.5/futex-multiple-wait 2/6] kernel/futex.c:4435:17: error: implicit declaration of function 'compat_ptr'; did you mean 'complete'?
Date: Thu, 13 Feb 2020 02:09:30 +0800
Message-ID: <202002130225.zN5lOMP5%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6770953027361847336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.5/futex-multiple-wait
head:   7ae5d731ffcf0f3a77156ba6a1018ce4422e525f
commit: 6628f097391e313160a2fe540ad02f6edddec348 [2/6] futex: Implement mec=
hanism to wait on any of several futexes
config: um-i386_defconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
reproduce:
        git checkout 6628f097391e313160a2fe540ad02f6edddec348
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Di386

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11:0,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from kernel/futex.c:34:
   kernel/futex.c: In function '__do_sys_futex':
   kernel/futex.c:4216:16: error: implicit declaration of function 'in_x32_=
syscall'; did you mean 'sys_ni_syscall'? [-Werror=3Dimplicit-function-decla=
ration]
      if (unlikely(in_x32_syscall()))
                   ^
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   kernel/futex.c: In function 'compat_futex_read_wait_block':
>> kernel/futex.c:4435:17: error: implicit declaration of function 'compat_=
ptr'; did you mean 'complete'? [-Werror=3Dimplicit-function-declaration]
      qs[i].uaddr =3D compat_ptr(fwb.uaddr);
                    ^~~~~~~~~~
                    complete
>> kernel/futex.c:4435:15: warning: assignment makes pointer from integer w=
ithout a cast [-Wint-conversion]
      qs[i].uaddr =3D compat_ptr(fwb.uaddr);
                  ^
   cc1: some warnings being treated as errors

vim +4435 kernel/futex.c

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

--===============6770953027361847336==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
hARIGXn49arulkebMm/+D7sPJ/4ghQAA
--===============6770953027361847336==--

