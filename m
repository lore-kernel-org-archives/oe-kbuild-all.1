Content-Type: multipart/mixed; boundary="===============6205221810041750356=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: ioctl.c:undefined reference to `__get_user_bad'
Date: Sun, 16 May 2021 23:49:07 -0700
Message-ID: <a022694d-426a-0415-83de-4cc5cd9d1d38@infradead.org>
In-Reply-To: <202105110829.MHq04tJz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6205221810041750356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/10/21 5:53 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   142b507f911c5a502dbb8f603216cb0ea8a79a48
> commit: 7ba3d1cdb7988ccfbc6e4995dee04510c85fefbc smb3.1.1: allow dumping =
keys for multiuser mounts
> date:   7 days ago
> config: arm-randconfig-s031-20210510 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D7ba3d1cdb7988ccfbc6e4995dee04510c85fefbc
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7ba3d1cdb7988ccfbc6e4995dee04510c85fefbc
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    arm-linux-gnueabi-ld: fs/cifs/ioctl.o: in function `cifs_dump_full_key=
':
>>> ioctl.c:(.text+0x44): undefined reference to `__get_user_bad'
> =

> ---

# CONFIG_MMU is not set

and arch/arm/include/asm/uaccess.h does not implement get_user(size 8 bytes)
for the non-MMU case:

#define __get_user_err(x, ptr, err)					\
do {									\
	unsigned long __gu_addr =3D (unsigned long)(ptr);			\
	unsigned long __gu_val;						\
	unsigned int __ua_flags;					\
	__chk_user_ptr(ptr);						\
	might_fault();							\
	__ua_flags =3D uaccess_save_and_enable();				\
	switch (sizeof(*(ptr))) {					\
	case 1:	__get_user_asm_byte(__gu_val, __gu_addr, err);	break;	\
	case 2:	__get_user_asm_half(__gu_val, __gu_addr, err);	break;	\
	case 4:	__get_user_asm_word(__gu_val, __gu_addr, err);	break;	\
	default: (__gu_val) =3D __get_user_bad();				\
	}								\
	uaccess_restore(__ua_flags);					\
	(x) =3D (__typeof__(*(ptr)))__gu_val;				\
} while (0)


-- =

~Randy

--===============6205221810041750356==--

