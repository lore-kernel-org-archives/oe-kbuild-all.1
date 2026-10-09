Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAB4FD27C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575188; cv=none; b=aVs8rUPLe4XsuaCvurtVzcAMiwebkRw7+BhKHx0TtdIi40HScPC4wTa7Lnqfi6uGUooIMDg0e5t9okCFTiQkqI6mYQvkiu7gcf0LDYuizQc6qMHAJn9ViHdXjAs127RXMxuEC9XStGp7wVQECsWNsJ4qWpZ4OomM/9JJAEi+gE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575188; c=relaxed/simple;
	bh=FdHg0uKnGrx0CZMOYAD6mv3aJffGafHznj+o6hhckvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KXQUIpdRrhWEHZALfEAqMxOxAPE+BgDN9keOFN8WLyrZi2JUURXZePugjyMk3XiJk6TVIDWlpG9fzoxVTMWxBut2oRNlvySqIV7K0TwnbOMFn5H8Ept9eod6UdYX6W3h5LL9y3yvPalZE3exbb0XBbTPwGxYEiiHbEqEGBrtTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1rj3Zdt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1rj3Zdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791575178; x=1823111178;
  h=date:from:to:cc:subject:message-id;
  bh=FdHg0uKnGrx0CZMOYAD6mv3aJffGafHznj+o6hhckvM=;
  b=W1rj3Zdtw1ZkEfsdfhiU224Xeq/y26Ytfnkz5fwDClkAJwViHvqBpuA4
   7E+JRO2SE+5uA8YKkI3antSr0hlve/NWy++en6rsJ/vCriji17vH9hGxg
   YdC7jhcKRdeiUzj84TdTKFcfgbvSzpEeQKrru8d07EqjhQnyRmRtBu/m7
   ZG80LMxtc0vhll5xShSLhnrHpjj+JS0SDBLMRbYr0bFdIiVF7u6USksW3
   VcmPKLJdG4Tdg+/zPI55EgYsBp77WNq3on3F5m7Cuhsu43ez7aV8eJwG8
   wqhUU3xPazvZWpkgFjbk6RYPD0+vSaipXoJeRoYnSWe8acg7s0s1M8QvL
   Q==;
X-CSE-ConnectionGUID: z+3QWkR/S7eCKDurTpS0rA==
X-CSE-MsgGUID: G1tg/ZdVQuOoAYibB56Wlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="374189"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="374189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 12:46:17 -0700
X-CSE-ConnectionGUID: y4FGxIdsSnOJ7TB1DNUaEQ==
X-CSE-MsgGUID: sqmlxIQEQz22Nzv8wzB8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="382148"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Oct 2026 12:46:15 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFGXl-000000007G9-0Dxp;
	Fri, 09 Oct 2026 19:46:13 +0000
Date: Fri, 09 Oct 2026 21:46:10 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] kismet: WARNING: unmet
 direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202610092106.6nResEwq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6b7e53dfabebf2217f7ba34cf4bc9869454c8371
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [13/13] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20261009/202610092106.6nResEwq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261009/202610092106.6nResEwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610092106.6nResEwq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
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
