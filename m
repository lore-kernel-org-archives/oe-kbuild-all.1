Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967324;
	b=AQTvlIb+nQvFitt2GjVlJ7xyEOPLmyzqO2L+sovxDNAjjafmKC993jZuJFn3rNPUS8VW
	 RlAsXAnnlSLyePUacZUJzfrMN99ixuFYk4TaWLqynh21wvIE9pVmi2dS0q6t2s72haOtT
	 1J/zszBgZdCOystXxWKIgUfCXFEMpKDaHtGKjh5PpFLQgl3jxHX3MooJNLZEscn0/dooe
	 BzBx4Ar4ckYOJxlMsrMgNvKi4k6L7qk6Ne9l/vqwANZZjw5d5ZYedkbzwFexTS+UoLIDu
	 CZtp2JClAZNjKfoGgjZLljUE1fWZUmYcWZcPYslv2HxihXptp2sXvWWW6kn1qPyWWwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967324;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=650LLmCoQpYDhauwyRJKRsRcmMQg4rEcehETnT0SXPc=;
	b=fU/sKf3GTwhEQOEgGyz+80X+ZHbuGaXFQwBx2MVmg9CwYtOS7ZDUFcieytYmxXeBfDsp
	 3gKm0+OZvclYYErYS2mFRuGHy27Li9IhaHLhdI5A0sbYQxUmr19HMU7BgOZflR141ttLf
	 XkmqlD4uwvYkpLqBeEaDh0A8V667sh2K3eAAg1xpqDdmyepJpT2IxCVdjMmSGLxt0GsS4
	 gOTMRMT2H14TbloFK4g/TxYwtUFSCB/409NK5++gW0lMuB8aekOqa2HPwM7uufaxlAGE2
	 m5TMqCJIDo/mx0BtJbV46jUDrrUh6+UG3lpZnHpzzVRn0hGynqZ7mGqkf4ekBJLjmxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F8cOX4l+;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80561606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 02:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80561606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F8cOX4l+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794967324; x=1826503324;
  h=date:from:to:cc:subject:message-id;
  bh=TblTHxwiphXsYvG/3bGvpD/ep5gHiO/ijWgshdcZpro=;
  b=F8cOX4l+juu1bGWNW9fPiU4FL81g/DGg07rtc07a3Ohyk3iTVPxl2b14
   A3voVB0HqyM1ThxvZMKR+0CldwkxVhP7PcQeexbVXZ65o3+hShUN3oJIH
   kp4XguBNWUmafvb9fbM3V4HBpC+1dX5+iCkeamqsG7DSzF1d3LydG3RVK
   Z5ti9ED8X7/iO5Zml9CTpuWzFkS7PHHgfll3gokWVumX2UMm6HdwxSeod
   oulAikBD+uyUvQ0PhURlROr53N/g95xBdb+Nf3Zy3Qkw7rkzl3rkF31H/
   ua17HDIV/E7fXFFvZcG+tnS34YXK8ly+S6tA9UsdrU7ASk4k0898We2O/
   g==;
X-CSE-ConnectionGUID: CJC+GKK8TXaEsYeQWPhJhg==
X-CSE-MsgGUID: o6nzUFRFSkqG8AiCTQ2gzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3773249"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3773249"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 18:02:03 -0800
X-CSE-ConnectionGUID: 05twuVU2QHCXei4yNB3IZA==
X-CSE-MsgGUID: lDAjrVduTOuLP7g4UDFfLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9762274"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2026 18:02:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTUzk-000000003IA-2d5z;
	Wed, 18 Nov 2026 02:01:56 +0000
Date: Wed, 18 Nov 2026 03:01:25 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152] htmldocs:
 Warning: fs/pnode.c references a file that doesn't exist:
 Documentation/filesystems/propagate_umount.txt
Message-ID: <20261118025115.DBMN80Gh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 97c9ca40b67eafbe61a253e28cd51dddb7c6bec4 [152/152] fs: don't silently unmount busy mounts
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261118/20261118025115.DBMN80Gh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118025115.DBMN80Gh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c references a file that doesn't exist: Documentation/gpu/nova/core/vbios.rst
>> Warning: fs/pnode.c references a file that doesn't exist: Documentation/filesystems/propagate_umount.txt
   Using alabaster theme
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_PRC' not described in enum 'dpll_clock_quality_level'
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_A' not described in enum 'dpll_clock_quality_level'
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_SSU_B' not described in enum 'dpll_clock_quality_level'
   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EEC1' not described in enum 'dpll_clock_quality_level'
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c references a file that doesn't exist: Documentation/gpu/nova/core/vbios.rst
>> Warning: fs/pnode.c references a file that doesn't exist: Documentation/filesystems/propagate_umount.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
