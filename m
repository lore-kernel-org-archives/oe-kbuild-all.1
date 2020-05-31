Content-Type: multipart/mixed; boundary="===============2808187188670314094=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: fs/exfat/nls.c:531:22: warning: Variable 'p_uniname->name_len' is reassigned a value before the old one has been used. [redundantAssignment]
Date: Sun, 31 May 2020 13:24:05 +0800
Message-ID: <202005311303.tM8DT7hg%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2808187188670314094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ffeb595d84811dde16a28b33d8a7cf26d51d51b3
commit: b9d1e2e6265f5dc25e9f5dbfbde3e53d8a4958ac exfat: add Kconfig and Mak=
efile
date:   3 months ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/exfat/nls.c:531:22: warning: Variable 'p_uniname->name_len' is reassi=
gned a value before the old one has been used. [redundantAssignment]
    p_uniname->name_len =3D unilen;
                        ^
   fs/exfat/nls.c:519:22: note: Variable 'p_uniname->name_len' is reassigne=
d a value before the old one has been used.
    p_uniname->name_len =3D unilen & 0xFF;
                        ^
   fs/exfat/nls.c:531:22: note: Variable 'p_uniname->name_len' is reassigne=
d a value before the old one has been used.
    p_uniname->name_len =3D unilen;
                        ^

vim +531 fs/exfat/nls.c

370e812b3ec190 Namjae Jeon 2020-03-02  492  =

370e812b3ec190 Namjae Jeon 2020-03-02  493  static int exfat_utf8_to_utf16(=
struct super_block *sb,
370e812b3ec190 Namjae Jeon 2020-03-02  494  		const unsigned char *p_cstrin=
g, const int len,
370e812b3ec190 Namjae Jeon 2020-03-02  495  		struct exfat_uni_name *p_unin=
ame, int *p_lossy)
370e812b3ec190 Namjae Jeon 2020-03-02  496  {
370e812b3ec190 Namjae Jeon 2020-03-02  497  	int i, unilen, lossy =3D NLS_N=
AME_NO_LOSSY;
370e812b3ec190 Namjae Jeon 2020-03-02  498  	unsigned short upname[MAX_NAME=
_LENGTH + 1];
370e812b3ec190 Namjae Jeon 2020-03-02  499  	unsigned short *uniname =3D p_=
uniname->name;
370e812b3ec190 Namjae Jeon 2020-03-02  500  =

370e812b3ec190 Namjae Jeon 2020-03-02  501  	WARN_ON(!len);
370e812b3ec190 Namjae Jeon 2020-03-02  502  =

370e812b3ec190 Namjae Jeon 2020-03-02  503  	unilen =3D utf8s_to_utf16s(p_c=
string, len, UTF16_HOST_ENDIAN,
370e812b3ec190 Namjae Jeon 2020-03-02  504  			(wchar_t *)uniname, MAX_NAME=
_LENGTH + 2);
370e812b3ec190 Namjae Jeon 2020-03-02  505  	if (unilen < 0) {
370e812b3ec190 Namjae Jeon 2020-03-02  506  		exfat_msg(sb, KERN_ERR,
370e812b3ec190 Namjae Jeon 2020-03-02  507  			"failed to %s (err : %d) nls=
 len : %d",
370e812b3ec190 Namjae Jeon 2020-03-02  508  			__func__, unilen, len);
370e812b3ec190 Namjae Jeon 2020-03-02  509  		return unilen;
370e812b3ec190 Namjae Jeon 2020-03-02  510  	}
370e812b3ec190 Namjae Jeon 2020-03-02  511  =

370e812b3ec190 Namjae Jeon 2020-03-02  512  	if (unilen > MAX_NAME_LENGTH) {
370e812b3ec190 Namjae Jeon 2020-03-02  513  		exfat_msg(sb, KERN_ERR,
370e812b3ec190 Namjae Jeon 2020-03-02  514  			"failed to %s (estr:ENAMETOO=
LONG) nls len : %d, unilen : %d > %d",
370e812b3ec190 Namjae Jeon 2020-03-02  515  			__func__, len, unilen, MAX_N=
AME_LENGTH);
370e812b3ec190 Namjae Jeon 2020-03-02  516  		return -ENAMETOOLONG;
370e812b3ec190 Namjae Jeon 2020-03-02  517  	}
370e812b3ec190 Namjae Jeon 2020-03-02  518  =

370e812b3ec190 Namjae Jeon 2020-03-02  519  	p_uniname->name_len =3D unilen=
 & 0xFF;
370e812b3ec190 Namjae Jeon 2020-03-02  520  =

370e812b3ec190 Namjae Jeon 2020-03-02  521  	for (i =3D 0; i < unilen; i++)=
 {
370e812b3ec190 Namjae Jeon 2020-03-02  522  		if (*uniname < 0x0020 ||
370e812b3ec190 Namjae Jeon 2020-03-02  523  		    exfat_wstrchr(bad_uni_cha=
rs, *uniname))
370e812b3ec190 Namjae Jeon 2020-03-02  524  			lossy |=3D NLS_NAME_LOSSY;
370e812b3ec190 Namjae Jeon 2020-03-02  525  =

370e812b3ec190 Namjae Jeon 2020-03-02  526  		upname[i] =3D exfat_toupper(s=
b, *uniname);
370e812b3ec190 Namjae Jeon 2020-03-02  527  		uniname++;
370e812b3ec190 Namjae Jeon 2020-03-02  528  	}
370e812b3ec190 Namjae Jeon 2020-03-02  529  =

370e812b3ec190 Namjae Jeon 2020-03-02  530  	*uniname =3D '\0';
370e812b3ec190 Namjae Jeon 2020-03-02 @531  	p_uniname->name_len =3D unilen;
370e812b3ec190 Namjae Jeon 2020-03-02  532  	p_uniname->name_hash =3D exfat=
_calc_chksum_2byte(upname, unilen << 1, 0,
370e812b3ec190 Namjae Jeon 2020-03-02  533  			CS_DEFAULT);
370e812b3ec190 Namjae Jeon 2020-03-02  534  =

370e812b3ec190 Namjae Jeon 2020-03-02  535  	if (p_lossy)
370e812b3ec190 Namjae Jeon 2020-03-02  536  		*p_lossy =3D lossy;
370e812b3ec190 Namjae Jeon 2020-03-02  537  	return unilen;
370e812b3ec190 Namjae Jeon 2020-03-02  538  }
370e812b3ec190 Namjae Jeon 2020-03-02  539  =


:::::: The code@line 531 was first introduced by commit
:::::: 370e812b3ec190fa492c9fd5a80c38b086d105c0 exfat: add nls operations

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2808187188670314094==--

