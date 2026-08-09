Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D643242B8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260425; cv=none; b=tC0bhyQWL+J0NIPg8QF8qJGKdOLeqo1W7YQBZXra1MrKAijBwNvwbp9z7fAmHyKgHUubOVGEgjUFimyHi0Hjr2u3QhQDYmr2orkC9oLIqyeNlvlzC1xFxU2wrTwvGdvccbFqmC1QtWe2uhXo0qAoYWEd3FNqJxBqL2yE8DPNXTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260425; c=relaxed/simple;
	bh=JG6aP0MDq2RO6TGeZiYQTrnNDGN/35RiMoeohypcZpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vu8l9D3tr7ZwZuYa7spq4JE8yhhaa6VPH8shNC8jWI4QF8yHtJ9+S2f+2lgWKKaX5T5pAtM+pZz7jQ17INi2CpeL/Pyb05dLpUtZh39Nu8nxy/DnTFCDsg60hvVpPQiUdS2+hTC1dLU2ncKJpbTKrbPz3A2dUt4QSzZ6Ts6ArAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCY/zsx0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCY/zsx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786260424; x=1817796424;
  h=date:from:to:cc:subject:message-id;
  bh=JG6aP0MDq2RO6TGeZiYQTrnNDGN/35RiMoeohypcZpg=;
  b=oCY/zsx0eYzHYyn9hx0FlkOm0lhcIql5IVR/vkwo3Wu4vhcW4tKTYO/V
   5TArxuqf7K7GvLetReEefpsEN4L0bITCJD3d4R7sbU+EKSbQ2eESSKjMu
   nzu8FPwZXkroH2pTWAWWA7A9l2+KhdzstPdtWeRCOzfd8idOipdzgCCW5
   jo93OlITDScHj/0Veah9Mw/qCEi27AgDE4CcFBSUOySa4Fjc/QJgKOlvb
   uQsrqMe9MH1GYfq9uHYd1nmUeitHMuOp9kdBgXuz1HdjinCV1V2gfz/0v
   Mua5ZS/h2U+haH31IvNAdR4YAVdhvJ9jrvYUNRd96q80r80T/3bsK4ajN
   g==;
X-CSE-ConnectionGUID: pKYscwwXQKSY+QIHqMonIA==
X-CSE-MsgGUID: opR2P7F0SBWVxwlm77Q/sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="87023001"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="87023001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 00:27:03 -0700
X-CSE-ConnectionGUID: 2yFe0DPoS7OoT8fGdox8/g==
X-CSE-MsgGUID: S7OI8EsYT+GJkoar0TEuwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="263386981"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2026 00:27:02 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsxvv-000000005Fe-1RpA;
	Sun, 09 Aug 2026 07:26:59 +0000
Date: Sun, 09 Aug 2026 09:26:54 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 292/292] htmldocs: Warning:
 anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't
 exist: Documentation/amd-pstate
Message-ID: <202608090923.LLHwiiaa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9ec0d8331780b056ddbe4b89e5294aecdeb7b515
commit: aea0cbffc6323957c930eb6c90c41d12df29fe7d [292/292] anolis: changelog: Add changelog for 6.6.102-7
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260809/202608090923.LLHwiiaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608090923.LLHwiiaa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
--
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
>> Warning: anolis/changelog/007-changelog.6.6.102-7 references a file that doesn't exist: Documentation/amd-pstate
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
