Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B50D4D8A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717052897; cv=none; b=J4r/ONsCoWiY08ll1BOQrrdkYTyZNerF4c/OwhzQXmeo3Gtlhy6rfK5ekzc6M+cyA5bqAeGHmM6uF9W1VW/igXniSC0a0kgyO3RDBsWbwSTfRd36NPgtMLrHc16J96okjdY0KQIg6ComolTkSIh5ypUCg0zcTEDPGcGM08nqtuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717052897; c=relaxed/simple;
	bh=dbw3Sf4RIhXQUvgtYDcgJzWkpSHf9vHmy37z+0BC64Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxCl5aW/U7khNrBSWq33d5RccaxT1Csfx3d8NSwo5UUrY+14QQmixU3dwpGgJb0ujv1yz7KrE6Ww8dzBVeOqBCcxjuZqDkiAF4fXCz2cn9DQGpREmn4WuBYkMHbfXav5BzshTBp7zbtep3HXWIXASi3+xoEnKv2lT+B4XBTZs2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9vVCHlk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9vVCHlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717052895; x=1748588895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dbw3Sf4RIhXQUvgtYDcgJzWkpSHf9vHmy37z+0BC64Y=;
  b=Y9vVCHlkzvXQyPj50y32V+wmbjs4A2PDNal8e/3IHcWybDmQsNjsGH2Y
   jfi1/i2T55yapJ61jJweCGyoPS3aHMTUcDJWt1JSR4O+y0/JlxlLQqpxC
   Xm50ymf8fcNHzSq3oB6qRtUnPSvexsLiZzG+c4K/iEPxp8fj6VHHUQWpM
   iJv5cqaNvkId7xp5SQMQCbqbN2FbJT+LVCp5gYc34DBJxCq4Y/3gqHAp9
   w6uneKPl448lkUzN0ouWdps1aYFKP88/XIg1A1fbsIIdAtTZTuv1ZFT1F
   YwcKnfla+3kYGchkIwwbaJJMFA1T5MLpVyoRFb8RhiT+Auoq2RaMUhzyd
   w==;
X-CSE-ConnectionGUID: CtDU/YvjRnKN28MoxcwCYw==
X-CSE-MsgGUID: TYaTP70UTwu/Km6AlVrrzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24173188"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24173188"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 00:08:14 -0700
X-CSE-ConnectionGUID: EyY/toJiRP2F5do0HdB9MQ==
X-CSE-MsgGUID: x+ODhs/QRVaUURYgpN8mDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35769453"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 May 2024 00:08:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCZtS-000Evp-1y;
	Thu, 30 May 2024 07:08:10 +0000
Date: Thu, 30 May 2024 15:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] x86/irq: Extend NMI handler registration interface
 to include source
Message-ID: <202405301437.O5puBRHP-lkp@intel.com>
References: <20240529203325.3039243-3-jacob.jun.pan@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529203325.3039243-3-jacob.jun.pan@linux.intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on perf-tools/perf-tools linus/master v6.10-rc1 next-20240529]
[cannot apply to tip/perf/core tip/x86/core acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Pan/x86-irq-Add-enumeration-of-NMI-source-reporting-CPU-feature/20240530-043112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240529203325.3039243-3-jacob.jun.pan%40linux.intel.com
patch subject: [PATCH 2/6] x86/irq: Extend NMI handler registration interface to include source
config: x86_64-randconfig-122-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301437.O5puBRHP-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301437.O5puBRHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301437.O5puBRHP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/nmi.c:189:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kernel/nmi.c:189:17: sparse:    struct nmiaction [noderef] __rcu *
   arch/x86/kernel/nmi.c:189:17: sparse:    struct nmiaction *
   arch/x86/kernel/nmi.c:228:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kernel/nmi.c:228:33: sparse:    struct nmiaction [noderef] __rcu *
   arch/x86/kernel/nmi.c:228:33: sparse:    struct nmiaction *
   arch/x86/kernel/nmi.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +189 arch/x86/kernel/nmi.c

   177	
   178	int __register_nmi_handler(unsigned int type, struct nmiaction *action)
   179	{
   180		struct nmi_desc *desc = nmi_to_desc(type);
   181		unsigned long flags;
   182	
   183		if (WARN_ON_ONCE(!action->handler || !list_empty(&action->list)))
   184			return -EINVAL;
   185	
   186		raw_spin_lock_irqsave(&desc->lock, flags);
   187	
   188		if (use_nmi_source(type, action))
 > 189			rcu_assign_pointer(nmiaction_src_table[action->source_vec], action);
   190		/*
   191		 * Indicate if there are multiple registrations on the
   192		 * internal NMI handler call chains (SERR and IO_CHECK).
   193		 */
   194		WARN_ON_ONCE(type == NMI_SERR && !list_empty(&desc->head));
   195		WARN_ON_ONCE(type == NMI_IO_CHECK && !list_empty(&desc->head));
   196	
   197		/*
   198		 * some handlers need to be executed first otherwise a fake
   199		 * event confuses some handlers (kdump uses this flag)
   200		 */
   201		if (action->flags & NMI_FLAG_FIRST)
   202			list_add_rcu(&action->list, &desc->head);
   203		else
   204			list_add_tail_rcu(&action->list, &desc->head);
   205	
   206		raw_spin_unlock_irqrestore(&desc->lock, flags);
   207		return 0;
   208	}
   209	EXPORT_SYMBOL(__register_nmi_handler);
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
