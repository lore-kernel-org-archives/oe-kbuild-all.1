Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2558BE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 03:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6kxr5l9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709440; x=1732245440;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+pH4FjsZh+5O39EGt7OHKgShCkjLnULd0cHtYoNE36k=;
  b=D6kxr5l9mleWYmtO9Oz8gm4BIrvRD9VU3QD+mIgiyzUcd+ZAoks1duGr
   0zG0SRmFNjjxIIwuDkjeXGjCqFZuryM6AL6ypgIHTjNGjwxiIBrJIIDKy
   f/an6esb9sWFSAghOyBVE2R0se/XhnHieZYthTqvZQejvladDEIgjGdAs
   RedGPXUPtXsGfh630PrC6b+xG6VslGmFDGbRU+rxI3oNCXfsJZg+wKn+p
   S2Ott42kvv8G9BXxpo5vY3bc8xUiE9tcpY05MkuL/i+U37jneNJrltgrV
   vRyoRtLNal/U02la3jF9UT28eUhRTEeldx5/PFei3EILEcA+oTI0y9eD6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372348535"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="372348535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8521857"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2023 19:17:15 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r60DI-0001B1-1B;
	Thu, 23 Nov 2023 03:17:12 +0000
Date: Thu, 23 Nov 2023 11:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 11/105] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_CS42L83 when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202311230916.GDul2gx8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: c58ceb13a4c2cc59f093a06dfd9ce4804826264c [11/105] ASoC: apple: Add =
macaudio machine driver
config: alpha-kismet-CONFIG_SND_SOC_CS42L83-CONFIG_SND_SOC_APPLE_MACAUDIO-0=
-0 (https://download.01.org/0day-ci/archive/20231123/202311230916.GDul2gx8-=
lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230916.G=
Dul2gx8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230916.GDul2gx8-lkp@i=
ntel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_CS42L83 =
when selected by SND_SOC_APPLE_MACAUDIO
   /usr/bin/grep: /db/releases/20231122101355/kernel-tests/etc/kcflags: No =
such file or directory
   {"timestamp":"2023-11-23 09:05:43 +0800", "level":"WARN", "event":"kbuil=
d.sh:3942:in `add_etc_kcflags': grep exit 2 (ShellError)", "detail":"cmd: '=
/usr/bin/grep' '-v' '-e' '^#' '-e' '^$' '/db/releases/20231122101355/kernel=
-tests/etc/kcflags' \nstderr: /usr/bin/grep: /db/releases/20231122101355/ke=
rnel-tests/etc/kcflags: No such file or directory\n\n", "hostname":"communi=
ty-kbuild-consumer-148", "host_hostname":"lkp-worker55", "call_stack":"/zda=
y/kernel-tests/lib/kbuild.sh:3942:in `add_etc_kcflags': /usr/bin/grep: /db/=
releases/20231122101355/kernel-tests/etc/kcflags: No such file or directory=
 (ShellError 2)\n  from /zday/kernel-tests/lib/kbuild.sh:3971: setup_kcflag=
s\n  from /zday/kernel-tests/lib/kbuild.sh:4016: invoke_make\n  from /zday/=
kernel-tests/lib/kbuild.sh:4122: make\n  from /zday/kernel-tests/lib/kbuild=
=2Esh:5623: make_config_allyes\n  from /zday/kernel-tests/common.sh:209: re=
direct_error_to_screen\n  from /zday/kernel-tests/common.sh:217: redirect_c=
ommand_errors\n  from /zday/kernel-tests/lib/kbuild.sh:5630: make_config\n =
 from /zday/kernel-tests/lib/builder/kismet.sh:156: generate_make_olddefcon=
fig_warnings\n  from /zday/kernel-tests/lib/builder/kismet.sh:297: builder_=
compile\n  from /zday/kernel-tests/bisect-test-build-error.sh:94: main\n"}
  =20
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] &=
& I2C [=3Dn]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] =
&& SND_SOC [=3Dy] && (ARCH_APPLE || COMPILE_TEST [=3Dy])
  =20
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
     Depends on [n]: DMADEVICES [=3Dn] && (ARCH_APPLE || COMPILE_TEST [=3Dy=
])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] =
&& SND_SOC [=3Dy] && (ARCH_APPLE || COMPILE_TEST [=3Dy])
  =20
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
     Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] &=
& I2C [=3Dn]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] =
&& SND_SOC [=3Dy] && (ARCH_APPLE || COMPILE_TEST [=3Dy])
  =20
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
     Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] &=
& I2C [=3Dn]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] =
&& SND_SOC [=3Dy] && (ARCH_APPLE || COMPILE_TEST [=3Dy])
  =20
   WARNING: unmet direct dependencies detected for COMMON_CLK_APPLE_NCO
     Depends on [n]: COMMON_CLK [=3Dn] && (ARCH_APPLE || COMPILE_TEST [=3Dy=
])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] =
&& SND_SOC [=3Dy] && (ARCH_APPLE || COMPILE_TEST [=3Dy])

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
