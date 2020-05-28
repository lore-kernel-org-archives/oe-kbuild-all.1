Content-Type: multipart/mixed; boundary="===============1414252961632789905=="
MIME-Version: 1.0
From: Mike Kravetz <mike.kravetz@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] ovl: provide real_file() and overlayfs get_unmapped_area()
Date: Thu, 28 May 2020 14:01:26 -0700
Message-ID: <365d83b8-3af7-2113-3a20-2aed51d9de91@oracle.com>
In-Reply-To: <202005281652.QNakLkW3%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1414252961632789905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/28/20 1:37 AM, kbuild test robot wrote:
> Hi Mike,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on miklos-vfs/overlayfs-next]
> [also build test ERROR on linus/master v5.7-rc7]
> [cannot apply to linux/master next-20200526]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Mike-Kravetz/ovl-provide=
-real_file-and-overlayfs-get_unmapped_area/20200528-080533
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git =
overlayfs-next
> config: h8300-randconfig-r036-20200528 (attached as .config)
> compiler: h8300-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dh8300 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> fs/overlayfs/file.c: In function 'ovl_get_unmapped_area':
>>> fs/overlayfs/file.c:768:14: error: 'struct mm_struct' has no member nam=
ed 'get_unmapped_area'
> 768 |   current->mm->get_unmapped_area)(realfile,
> |              ^~
>>> fs/overlayfs/file.c:770:1: warning: control reaches end of non-void fun=
ction [-Wreturn-type]
> 770 | }
> | ^
> =

> vim +768 fs/overlayfs/file.c
> =

>    760	=

>    761	static unsigned long ovl_get_unmapped_area(struct file *file,
>    762					unsigned long uaddr, unsigned long len,
>    763					unsigned long pgoff, unsigned long flags)
>    764	{
>    765		struct file *realfile =3D real_file(file);
>    766	=

>    767		return (realfile->f_op->get_unmapped_area ?:
>  > 768			current->mm->get_unmapped_area)(realfile,
>    769							uaddr, len, pgoff, flags);
>  > 770	}
>    771	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =


Well yuck!  get_unmapped_area is not part of mm_struct if !CONFIG_MMU.

Miklos, would adding '#ifdef CONFIG_MMU' around the overlayfs code be too
ugly for you?  Another option is to use real_file() in the mmap code as
done in [1].

Sorry for all the questions.  However, I want to make sure you are happy
with any overlayfs changes.

[1] https://lore.kernel.org/linux-mm/04a00e3b-539c-236f-e43b-0024ef94b7cb(a=
)oracle.com/
-- =

Mike Kravetz
--===============1414252961632789905==--

