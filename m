Content-Type: multipart/mixed; boundary="===============3673230736540715017=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [efi:next 14/14] drivers/firmware/efi/libstub/efi-stub-helper.c:35:43: sparse: sparse: incorrect type in argument 1 (different type sizes)
Date: Wed, 06 May 2020 01:29:43 +0800
Message-ID: <202005060139.iJDyIT5u%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3673230736540715017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
head:   0b8d9fc9953fde4ea3eb3191d986ca2d01eb783c
commit: 0b8d9fc9953fde4ea3eb3191d986ca2d01eb783c [14/14] efi/libstub: Make =
efi_printk() input argument const char*
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 0b8d9fc9953fde4ea3eb3191d986ca2d01eb783c
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/firmware/efi/libstub/efi-stub-helper.c:35:43: sparse: sparse: in=
correct type in argument 1 (different type sizes) @@    expected unsigned s=
hort [usertype] * @@    got ype] * @@
>> drivers/firmware/efi/libstub/efi-stub-helper.c:35:43: sparse:    expecte=
d unsigned short [usertype] *
   drivers/firmware/efi/libstub/efi-stub-helper.c:35:43: sparse:    got cha=
r *
   drivers/firmware/efi/libstub/efi-stub-helper.c:385:44: sparse: sparse: i=
ncorrect type in argument 2 (different type sizes) @@    expected unsigned =
short const [usertype] *optstr @@    got ype] *optstr @@
   drivers/firmware/efi/libstub/efi-stub-helper.c:385:44: sparse:    expect=
ed unsigned short const [usertype] *optstr
   drivers/firmware/efi/libstub/efi-stub-helper.c:385:44: sparse:    got ch=
ar *

vim +35 drivers/firmware/efi/libstub/efi-stub-helper.c

    28	=

    29	void efi_printk(const char *str)
    30	{
    31		while (*str) {
    32			efi_char16_t ch[] =3D { *str++, L'\0' };
    33	=

    34			if (ch[0] =3D=3D L'\n')
  > 35				efi_char16_printk(L"\r\n");
    36			else
    37				efi_char16_printk(ch);
    38		}
    39	}
    40	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3673230736540715017==--

