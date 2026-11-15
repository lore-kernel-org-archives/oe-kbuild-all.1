Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751552;
	b=ONNvNQR497seO5FVG63aD8SuPK2LQ2DQ3T+GJHrGY8BFfXpCZJuTB//guJODTER4T3RP
	 6t/FOEZ4CLHQZZjVAJX1tzJWHhCj7KI2p8fRmObjD7cNFezVdhEf3ei+40f/WvvRQriyd
	 HvtOUngxj+tx+NRPy4LZ5CWgiSaqviGfbtyd9Tb8QpFGoHKjMOhGszUFFc2fZiLPVEHLw
	 8P1aJ74WqzgV1JTqmq+s31A5xvWAfDajIsURTWrQqI1889bt8hTykVsKy0nul5b8BXJzK
	 dQG7E4/gbYd61+zyeuWKLmnEOh2XUwzd8glj+zyeh242dqH8fB3bCR9hmljWDfQLXmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751552;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=64HFNOkcfs3fA5g4vhaZU/CpEODlIeiSKyKWPsUs0Cs=;
	b=N9BVRA8LdelkBwkBI8rhtr/zTTWOSzvTAKCnFHhBkkDNvJbyk1kR7908oiCYFkeybsBc
	 E8k8+oOitzSiwKZJ9Eq0YiNdWjpZ1aV4GU5/N9XiTtzkwWIiE+hOEVshzNmjh27gLG6Ag
	 LTIHsfsuJIsYH+89cx3/+aZxVP/lPhoUYDXAMPIyZ4BXovUHWUzZJJxccU39MT+9mxwGV
	 uZ1k/pa5sfluZBuSfxN6luJxQ5gpQvsmP3IQ3dShW6PTFM6aN1GSY5ZdOjD/gE2ChRHAY
	 VSzO6TZyvt0l9CKCmov5wBVPql5i0z3aqWx/iy/F13JpolpG+GYOVERJ+uc0H+utABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dc0EA0CZ;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5303606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 14:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5303606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dc0EA0CZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794751551; x=1826287551;
  h=date:from:to:cc:subject:message-id;
  bh=K8VnEGhFhATSfS2Bb5K3lG0dh04lGUM2qIqopRD4uwA=;
  b=Dc0EA0CZhDV18bOfi+4ru7tQB+19cXnzHTLRk9VL5ZjlFWR4i9PXDqo4
   Ho6nTX9U39uRvhIIu3l4BH/NZKJeSmvv2e8zu7cUO855WSxpoYL4yizQd
   ULPRUFdKT7DH3lYXov2hx4AhIWahZxGVNwnx3VSZDJP9zSL4dRm6u83Z/
   fiDu8RH692d/hR6th4xz7ARvle0sV1GMq+6ixs/fDu7BQwrCYdGHxPVkR
   O2i6A+PU7BgQgiVhnhE6w0okBuEB9VviddqsYrB7yjSFrpPDJM/lc2g5O
   GRt53S+9CHQZyTMHzbF4NVrPx+2lf3YeQg/hEQMDMwzZhYtnzQfUtlmAP
   w==;
X-CSE-ConnectionGUID: +5BU4YRoRnufCoYV5HxsaQ==
X-CSE-MsgGUID: J4psIyoaTcm7VSFHcigGaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3373246"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3373246"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 06:05:50 -0800
X-CSE-ConnectionGUID: pPnFnw6oRrChwcvSVQfrpw==
X-CSE-MsgGUID: NTp4kJhfR5KXBzWXDnDexw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9175018"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 06:05:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSarb-000000002Do-0GH7;
	Sun, 15 Nov 2026 14:05:47 +0000
Date: Sun, 15 Nov 2026 15:04:52 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] kismet: WARNING: unmet
 direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202611151401.ZwlNKRel-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   dc68b182b9f87e42548fb6ce886be612535b2116
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [3/3] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20261115/202611151401.ZwlNKRel-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151401.ZwlNKRel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151401.ZwlNKRel-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
