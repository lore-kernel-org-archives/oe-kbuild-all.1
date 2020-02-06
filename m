Content-Type: multipart/mixed; boundary="===============9187112334855242667=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [avpatel:v5.5_unleashed 4/12] arch/riscv/kernel/setup.c:78:2: error: implicit declaration of function 'sbi_init'; did you mean 'smp_init'?
Date: Thu, 06 Feb 2020 13:19:09 +0800
Message-ID: <202002061304.zJHbUpgM%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9187112334855242667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/avpatel/linux.git v5.5_unleashed
head:   c99a75ff4dc11546e4e22dac09f6b4dd77dedf10
commit: b5cfe2813f1a3e75f49d050cd9af70572436c6ae [4/12] RISC-V: Add basic s=
upport for SBI v0.2
config: riscv-allnoconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout b5cfe2813f1a3e75f49d050cd9af70572436c6ae
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/riscv/kernel/setup.c: In function 'setup_arch':
>> arch/riscv/kernel/setup.c:78:2: error: implicit declaration of function =
'sbi_init'; did you mean 'smp_init'? [-Werror=3Dimplicit-function-declarati=
on]
     sbi_init();
     ^~~~~~~~
     smp_init
   cc1: some warnings being treated as errors

vim +78 arch/riscv/kernel/setup.c

    77	=

  > 78		sbi_init();
    79	#ifdef CONFIG_SMP
    80		setup_smp();
    81	#endif
    82	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============9187112334855242667==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
MaHS/wLSUBa1OEkAAA==
--===============9187112334855242667==--

