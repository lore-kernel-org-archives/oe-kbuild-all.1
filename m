Content-Type: multipart/mixed; boundary="===============2509111371754751068=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [vfs:untested.uaccess 40/51] arch/sparc/include/asm/checksum_32.h:73:5: error: 'err_ptr' undeclared; did you mean 'si_ptr'?
Date: Wed, 19 Feb 2020 16:26:33 +0800
Message-ID: <202002191629.CZ0Ta5ZZ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2509111371754751068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git untest=
ed.uaccess
head:   5cc28922fce057003f404a956c978adbfb9fba93
commit: 2ddca056919eada9622f445a8d1da635d9118639 [40/51] sparc: switch to p=
roviding csum_and_copy_from_user()
config: sparc-defconfig (attached as .config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 2ddca056919eada9622f445a8d1da635d9118639
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsparc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/checksum.h:8:0,
                    from include/net/checksum.h:22,
                    from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/uapi/linux/ethtool.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/netdevice.h:37,
                    from net/socket.c:62:
   arch/sparc/include/asm/checksum_32.h: In function 'csum_and_copy_from_us=
er':
>> arch/sparc/include/asm/checksum_32.h:73:5: error: 'err_ptr' undeclared (=
first use in this function); did you mean 'si_ptr'?
       *err_ptr =3D -EFAULT;
        ^~~~~~~
        si_ptr
   arch/sparc/include/asm/checksum_32.h:73:5: note: each undeclared identif=
ier is reported only once for each function it appears in
--
   In file included from arch/sparc/include/asm/checksum.h:8:0,
                    from include/net/checksum.h:22,
                    from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/uapi/linux/ethtool.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/netdevice.h:37,
                    from include/linux/rtnetlink.h:7,
                    from net/core/flow_offload.c:5:
   arch/sparc/include/asm/checksum_32.h: In function 'csum_and_copy_from_us=
er':
>> arch/sparc/include/asm/checksum_32.h:73:5: error: 'err_ptr' undeclared (=
first use in this function); did you mean 'rht_ptr'?
       *err_ptr =3D -EFAULT;
        ^~~~~~~
        rht_ptr
   arch/sparc/include/asm/checksum_32.h:73:5: note: each undeclared identif=
ier is reported only once for each function it appears in

vim +73 arch/sparc/include/asm/checksum_32.h

    61	=

    62	static inline __wsum
    63	csum_and_copy_from_user(const void __user *src, void *dst, int len,
    64				    __wsum sum, int *err)
    65	  {
    66		register unsigned long ret asm("o0") =3D (unsigned long)src;
    67		register char *d asm("o1") =3D dst;
    68		register int l asm("g1") =3D len;
    69		register __wsum s asm("g7") =3D sum;
    70	=

    71		if (unlikely(!access_ok(src, len))) {
    72			if (len)
  > 73				*err_ptr =3D -EFAULT;
    74			return sum;
    75		}
    76	=

    77		__asm__ __volatile__ (
    78		".section __ex_table,#alloc\n\t"
    79		".align 4\n\t"
    80		".word 1f,2\n\t"
    81		".previous\n"
    82		"1:\n\t"
    83		"call __csum_partial_copy_sparc_generic\n\t"
    84		" st %8, [%%sp + 64]\n"
    85		: "=3D&r" (ret), "=3D&r" (d), "=3D&r" (l), "=3D&r" (s)
    86		: "0" (ret), "1" (d), "2" (l), "3" (s), "r" (err)
    87		: "o2", "o3", "o4", "o5", "o7", "g2", "g3", "g4", "g5",
    88		  "cc", "memory");
    89		return (__force __wsum)ret;
    90	}
    91	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2509111371754751068==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Cvly6h/wte4EMs0AAA==
--===============2509111371754751068==--

