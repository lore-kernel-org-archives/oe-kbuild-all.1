Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9817F328B7F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 02:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772765928; cv=none; b=Sn76GPqS006cW/V/i8ndxFzZ6KTOv7Ee3LTpnOg2cXss2rEhNkB5eJa41EeaQxOcIpltiwUhmYelQF86EhyLYwWgSKdKfO2pdtRJhNvejYyOxq/pF4Ns7Slcvgml+ei7Nl2OgSLFut9MmcaJFxmmm3g5sGXBNORFAWwFrC+7qCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772765928; c=relaxed/simple;
	bh=hfT5BDbjvSKzbI4Lic6zgaeXJyHySpbgQeEqztAE+i8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Keuv566HeYzpiaIWQQ6RDDnNcr28FyyZSRLEPjPuqrVkMO/HKHNXEeTWOcW22PrcBLZhKXqXzM4RIWEkymIB802ArVJ10pECK96RtrGqwxGcfEisnSRRJd21NJH3vDza9Mh552SUGTm4C3du3lrknyawpdcoTKx7FCRn3WzQ4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGNSj+JH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGNSj+JH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772765927; x=1804301927;
  h=date:from:to:cc:subject:message-id;
  bh=hfT5BDbjvSKzbI4Lic6zgaeXJyHySpbgQeEqztAE+i8=;
  b=bGNSj+JHeMFKMgnRO4rmodw3TdaYBHqAi1uogcWN4BaxYJJ4FxYXUNLc
   ayvmQpK1jR8PA4MCcONj2dqJTva6K1g8oPV3eIeLZjNwyjs9i3OYVlE04
   P/d9Qy+szrNI1WL7WvdnmhoL+3qPcPHg2JScBDUaCDOlQMSrdPzbwgTmd
   XHsjg1QngURQrEG1KbEddo+x1xzcflkwpeOeutgvJT1kJjBrBIASg/K5/
   wByHNNytNAQkh0jW2BL2lJLi90W0+RO6DQ0eL8ixUyhG0YkB/GsWHVlyE
   y7wWaRHiQ4HQB7vKHWCbXdsZ3M5FeutJS//xJIuHAT7A/WlOlj1po/fRT
   w==;
X-CSE-ConnectionGUID: EuNxmi9UQjyi461jTZrpDw==
X-CSE-MsgGUID: Df8t8NSlSS29DNMPbyXanA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73745356"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73745356"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:58:46 -0800
X-CSE-ConnectionGUID: mYnGc1xfTY+enyohWswsQQ==
X-CSE-MsgGUID: 7d1pkSp+QLWmu+sWHdiVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="216668737"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 18:58:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyLOj-000000000En-3TWD;
	Fri, 06 Mar 2026 02:58:41 +0000
Date: Fri, 06 Mar 2026 10:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_6 4/24]
 kernel/bpf/trampoline.c:767:12: warning: 'bpf_trampoline_update' defined but
 not used
Message-ID: <202603061049.APFgL04A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_6
head:   af446b2f2e0f478bc501b1791673d2aa5994101b
commit: ae934a5d41127a973581eb684721b967d5cf8a0c [4/24] bpf: Add struct bpf_trampoline_ops object
config: sparc64-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061049.APFgL04A-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061049.APFgL04A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061049.APFgL04A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:767:12: warning: 'bpf_trampoline_update' defined but not used [-Wunused-function]
     767 | static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/bpf_trampoline_update +767 kernel/bpf/trampoline.c

   766	
 > 767	static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
   768	{
   769		return bpf_trampoline_update_ops(tr, lock_direct_mutex, &trampoline_ops, NULL);
   770	}
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
