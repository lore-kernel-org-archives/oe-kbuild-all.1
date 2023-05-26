Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C405A2CA6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685122482; x=1716658482;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I6sOykhYZM1N5RED4krB0gFPPhYcJUi91buPwDsbtJo=;
  b=SR20B/LHsWfmM8yt7hKK6VML2IuFSpzImayOqWVzmzSwDQcpAblskX50
   sbxPA8tXA9d+Vr9YQX7mDTuRl5XkRprnZO6Z2HZnt1bLjkjTI07Ioi6LC
   kY9/Ik8e4DK2UJu3TQ5pP2L2BBKFR3KYGunCsJU/vHhnpUyDIzsSzpBZs
   nz4gqz2HSpbUsMct/MvcE8j0uELv6J0q2dbdlH+2k+raL34Tobr6sqpvj
   UKT/YN8ZV5ClynauvLacxvOXK6EtADCY4Q60/OncQhbYd1Lw9jiTJx/pP
   jY2Ci7J2G9xjL2YlLZCzJ5yTNPr0xKSBTdDoabGE4BBCaVr8QugofNeEQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382507659"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="382507659"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 10:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="655715529"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="655715529"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2023 10:34:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2bKp-000JVa-2J;
	Fri, 26 May 2023 17:34:39 +0000
Date: Sat, 27 May 2023 01:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4859/9879] mips-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202305270100.3oa0C2dv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4859/9879] Merge branch '=
mxc/next' into next
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230527=
/202305270100.3oa0C2dv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/77225c634e06fdb5ae=
7fcd3d52cb5dd7d2996acb
        git remote add freescale-fslc https://github.com/Freescale/linux-fs=
lc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 ~/bin/make=
=2Ecross W=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 ~/bin/make=
=2Ecross W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270100.3oa0C2dv-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> mips-linux-gcc: error: unrecognized argument in option '-march=3Darmv7-a'
   mips-linux-gcc: note: valid arguments to '-march=3D' are: 10000 1004kc 1=
004kf 1004kf1_1 1004kf2_1 10k 12000 12k 14000 14k 16000 16k 2000 20kc 24kc =
24kec 24kef 24kef1_1 24kef2_1 24kefx 24kex 24kf 24kf1_1 24kf2_1 24kfx 24kx =
2k 3000 34kc 34kf 34kf1_1 34kf2_1 34kfx 34kn 34kx 3900 3k 4000 4100 4111 41=
20 4130 4300 4400 4600 4650 4700 4k 4kc 4kec 4kem 4kep 4km 4kp 4ksc 4ksd 50=
00 5400 5500 5900 5k 5kc 5kf 6000 6k 7000 74kc 74kf 74kf1_1 74kf2_1 74kf3_2=
 74kfx 74kx 7k 8000 8k 9000 9k from-abi gs264e gs464 gs464e i6400 i6500 int=
eraptiv loongson2e loongson2f loongson3a m14k m14kc m14ke m14kec m4k m5100 =
m5101 mips1 mips2 mips3 mips32 mips32r2 mips32r3 mips32r5 mips32r6 mips4 mi=
ps64 mips64r2 mips64r3 mips64r5 mips64r6 native octeon octeon+ octeon2 octe=
on3 orion p5600 p6600 r10000 r1004kc r1004kf r1004kf1_1 r1004kf2_1 r10k r12=
000 r12k r14000 r14k r16000 r16k r2000 r20kc r24kc r24kec r24kef r24kef1_1 =
r24kef2_1 r24kefx r24kex r24kf r24kf1_1 r24kf2_1 r24kfx r24kx r2k r3000 r34=
kc r34kf r34kf1_1 r34kf2_1 r34kfx r34kn r34kx r3900 r3k r4000 r4100 r4111 r=
4120 r4130 r4300 r4400 r4600 r4650 r4700 r4k r4kc r4kec r4kem r4kep r4km r4=
kp r4ksc r4ksd r5000 r5400 r5500 r5900 r5k r5kc r5kf r6000 r6k r7000 r74kc =
r74kf r74kf1_1 r74kf2_1 r74kf3_2 r74kfx r74kx r7k r8000 r8k r9000 r9k rm700=
0 rm7k rm9000 rm9k sb1 sb1a sr71000 sr71k vr4100 vr4111 vr4120 vr4130 vr430=
0 vr5000 vr5400 vr5500 vr5k xlp xlr
>> mips-linux-gcc: error: unrecognized argument in option '-mtune=3Dcortex-=
a9'
   mips-linux-gcc: note: valid arguments to '-mtune=3D' are: 10000 1004kc 1=
004kf 1004kf1_1 1004kf2_1 10k 12000 12k 14000 14k 16000 16k 2000 20kc 24kc =
24kec 24kef 24kef1_1 24kef2_1 24kefx 24kex 24kf 24kf1_1 24kf2_1 24kfx 24kx =
2k 3000 34kc 34kf 34kf1_1 34kf2_1 34kfx 34kn 34kx 3900 3k 4000 4100 4111 41=
20 4130 4300 4400 4600 4650 4700 4k 4kc 4kec 4kem 4kep 4km 4kp 4ksc 4ksd 50=
00 5400 5500 5900 5k 5kc 5kf 6000 6k 7000 74kc 74kf 74kf1_1 74kf2_1 74kf3_2=
 74kfx 74kx 7k 8000 8k 9000 9k from-abi gs264e gs464 gs464e i6400 i6500 int=
eraptiv loongson2e loongson2f loongson3a m14k m14kc m14ke m14kec m4k m5100 =
m5101 mips1 mips2 mips3 mips32 mips32r2 mips32r3 mips32r5 mips32r6 mips4 mi=
ps64 mips64r2 mips64r3 mips64r5 mips64r6 native octeon octeon+ octeon2 octe=
on3 orion p5600 p6600 r10000 r1004kc r1004kf r1004kf1_1 r1004kf2_1 r10k r12=
000 r12k r14000 r14k r16000 r16k r2000 r20kc r24kc r24kec r24kef r24kef1_1 =
r24kef2_1 r24kefx r24kex r24kf r24kf1_1 r24kf2_1 r24kfx r24kx r2k r3000 r34=
kc r34kf r34kf1_1 r34kf2_1 r34kfx r34kn r34kx r3900 r3k r4000 r4100 r4111 r=
4120 r4130 r4300 r4400 r4600 r4650 r4700 r4k r4kc r4kec r4kem r4kep r4km r4=
kp r4ksc r4ksd r5000 r5400 r5500 r5900 r5k r5kc r5kf r6000 r6k r7000 r74kc =
r74kf r74kf1_1 r74kf2_1 r74kf3_2 r74kfx r74kx r7k r8000 r8k r9000 r9k rm700=
0 rm7k rm9000 rm9k sb1 sb1a sr71000 sr71k vr4100 vr4111 vr4120 vr4130 vr430=
0 vr5000 vr5400 vr5500 vr5k xlp xlr
>> mips-linux-gcc: error: unrecognized command-line option '-mfpu=3Dneon'
>> mips-linux-gcc: error: unrecognized command-line option '-mfloat-abi=3Ds=
oftfp'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
