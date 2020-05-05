Content-Type: multipart/mixed; boundary="===============2355463896926868874=="
MIME-Version: 1.0
From: Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
To: kbuild-all@lists.01.org
Subject: Re: [xlnx:xlnx_rebase_v5.4 874/1290] error: include/uapi/linux/xlnx_mpg2tsmux_interface.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
Date: Tue, 05 May 2020 07:39:44 +0000
Message-ID: <
 <CH2PR02MB6871EDDE2F3E723A7AF6CBB5B1A70@CH2PR02MB6871.namprd02.prod.outlook.com>>
In-Reply-To: <202005051522.FyKtGLMM%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2355463896926868874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I initiated the patch. It may take some time to be part of git hub.

>-----Original Message-----
>From: kbuild test robot <lkp@intel.com>
>Sent: Tuesday, May 5, 2020 12:53 PM
>To: Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
>Cc: kbuild-all(a)lists.01.org; linux-arm-kernel(a)lists.infradead.org;
>monstr(a)monstr.eu
>Subject: [xlnx:xlnx_rebase_v5.4 874/1290] error:
>include/uapi/linux/xlnx_mpg2tsmux_interface.h: missing "WITH Linux-syscall-
>note" for SPDX-License-Identifier
>
>Hi Venkateshwar,
>
>FYI, the error/warning still remains.
>
>tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
>head:   e12386f224bfe787db71c18f2c4106e886ac98be
>commit: bf43a837d149dc4c51971b8698aabcbf7961d930 [874/1290] staging:
>xlnx_tsmux: Initial version of xlnx mpeg2tsmux driver
>config: nds32-defconfig (attached as .config)
>compiler: nds32le-linux-gcc (GCC) 9.3.0
>reproduce:
>        wget https://raw.githubusercontent.com/intel/lkp-
>tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        git checkout bf43a837d149dc4c51971b8698aabcbf7961d930
>        # save the attached .config to linux build tree
>        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross
>ARCH=3Dnds32
>
>If you fix the issue, kindly add following tag as appropriate
>Reported-by: kbuild test robot <lkp@intel.com>
>
>All errors (new ones prefixed by >>):
>
>>> error: include/uapi/linux/xlnx_mpg2tsmux_interface.h: missing "WITH
>>> Linux-syscall-note" for SPDX-License-Identifier
>   make[2]: *** [scripts/Makefile.headersinst:66:
>usr/include/linux/xlnx_mpg2tsmux_interface.h] Error 1
>   error: include/uapi/linux/xilinx-v4l2-events.h: missing "WITH Linux-sys=
call-
>note" for SPDX-License-Identifier
>   make[2]: *** [scripts/Makefile.headersinst:66: usr/include/linux/xilinx=
-v4l2-
>events.h] Error 1
>   error: include/uapi/linux/xlnxsync.h: missing "WITH Linux-syscall-note"=
 for
>SPDX-License-Identifier
>   make[2]: *** [scripts/Makefile.headersinst:66: usr/include/linux/xlnxsy=
nc.h]
>Error 1
>   make[2]: Target '__headers' not remade because of errors.
>   make[1]: *** [Makefile:1195: headers] Error 2
>   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>   make[1]: Target 'prepare' not remade because of errors.
>   make: *** [Makefile:179: sub-make] Error 2
>
>---
>0-DAY CI Kernel Test Service, Intel Corporation
>https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Regards,
Venkateshwar
--===============2355463896926868874==--

