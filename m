Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F557440B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 01:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbBXHLOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704513; x=1732240513;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iZv+qgffPrVcDSBnFBcvLUGGG2HoCTJED3CVFkMJjpU=;
  b=PbBXHLOicsq4R+Uoxn0ts1t+ud2ra1HoV09pHTPTP1SUnpgmAp51JC5W
   R7arLFG2CKDGSey0SvWzoWAxxR0R6m5+J7IaoCdJrgfZBDg/IHWgFnBUP
   8cdCYn/t6vcHJdlMOITm0mdTuZFKfs8Vj5RYlXeZWkD9A42ZZUed2sLGh
   QE3JOFu91sOueRxqTBhpSPJLF1iBjIQxfTt88L8piPK5ZHWmyWfsgiIHK
   YRIx8OtfwvxYNO5LXBzMa1ntMKprEdIpGckDhHuoa7gstE9/UpuGCcuRR
   64zYzAX2JXYPes1TNuMa2RluyPBPPUNpdThj3dXTDde7j9WZLrWRgMTkn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13737167"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13737167"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801909593"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801909593"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Nov 2023 17:55:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvq-000166-1L;
	Thu, 23 Nov 2023 01:55:06 +0000
Date: Thu, 23 Nov 2023 09:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/020-dart 11/21] kismet: WARNING: unmet direct
 dependencies detected for OF_IOMMU when selected by APPLE_DART
Message-ID: <202311230556.4MO6Y1Cx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   29d9d098a7ff41f82efd8eb40f24f29e5dd6b2fe
commit: 4432b34d4b8141d9686c0eacf1f92e9f20fcbc3e [11/21] iommu: apple-dart:=
 Install IOMMU_RESV_TRANSLATED mappings
config: alpha-kismet-CONFIG_OF_IOMMU-CONFIG_APPLE_DART-0-0 (https://downloa=
d.01.org/0day-ci/archive/20231123/202311230556.4MO6Y1Cx-lkp@intel.com/confi=
g)
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230556.4=
MO6Y1Cx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230556.4MO6Y1Cx-lkp@i=
ntel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_IOMMU when se=
lected by APPLE_DART
   /usr/bin/grep: /db/releases/20231122101355/kernel-tests/etc/kcflags: No =
such file or directory
   {"timestamp":"2023-11-23 04:05:28 +0800", "level":"WARN", "event":"kbuil=
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
   WARNING: unmet direct dependencies detected for OF_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=3Dy] && OF [=3Dn] && IOMMU_API [=3Dy]
     Selected by [y]:
     - APPLE_DART [=3Dy] && IOMMU_SUPPORT [=3Dy] && (ARCH_APPLE || COMPILE_=
TEST [=3Dy]) && !GENERIC_ATOMIC64 [=3Dn]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
