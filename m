Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718D2116EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737544130; cv=none; b=T1cV15zYLhCrkbmEoYwFroxrMg5vW5TJ50NOQnAW2a5vINbJrelPeZalsvVRxyAENIwn9WFbhym1dURiGLDMwtIEAgdaZURGcAiwl3oQXEoQNSUZ6WD4gBcUsdOI4hkJ+LeRjh8MMXPX3IHZWV+DoTpBg3+KtlntXaiDdQLurkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737544130; c=relaxed/simple;
	bh=kcJRtBaVAqk+clKqeI4XJKbWYti9wvhZyXYL5DZmqxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KfMlaJzZpEksoXaYR4GFmcUWyzV3Y7zaS1kZ2yreRGOzYdK06r8dppDohndO3cDTvZV+9mCIQjitZ1LWcCvV6IGkJaPFtUURemmgi8NdnmSV6IpGPPdYdjEmcGabnjhn0tE9hv8KZJG28T3wHjtCiEsqHHPDtYyUC7tVi2W+OLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWdAeKXx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWdAeKXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737544127; x=1769080127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcJRtBaVAqk+clKqeI4XJKbWYti9wvhZyXYL5DZmqxI=;
  b=IWdAeKXxXgoOOWnlNzNgnZyVyG0YL8nWHx88z35G3k2n0xz3T/QKRpxz
   0RyKbrsD6wsF1qLGYX7R7GgMOpElG7BC3utD+Vd1oqTtnnGi30R+n8yZC
   jC/1i744UwMm+4Jg91uJgziNM7VQnTv3ppZMsWcP3zKPrkdC6sVW4NJqw
   Y5BLfjIvKc20GHuJmLs17omR6MUh5QOwUjg4brVcrYqn7Vvf1x3vseWf6
   /1Ul38dzSwMn7iA3Vram9DaoJiRc4a9Hr0C/7jrPuvUZ170rzqfOrT4V8
   pWlrFYRjVty3huiTJTaySyWnzFBJ53x7CG83mDQePq9iydWVht6zwwUOX
   w==;
X-CSE-ConnectionGUID: +kTYXA2aQI6TFOKGE9FNMA==
X-CSE-MsgGUID: 7M5FiPqJQYCjgcsYKGwtBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37692529"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37692529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 03:08:43 -0800
X-CSE-ConnectionGUID: lRiH1mUeRuCKn4BKfrfyxQ==
X-CSE-MsgGUID: UfDNbLqASyGv6iyF3gwrhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="137955226"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2025 03:08:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taYb8-000Zm9-1x;
	Wed, 22 Jan 2025 11:08:38 +0000
Date: Wed, 22 Jan 2025 19:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver O'Halloran <oohall@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_event.c:125: warning: expecting prototype
 for eeh_send_failure_event(). Prototype was for __eeh_send_failure_event()
 instead
Message-ID: <202501221955.df1CrqF2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oliver,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c4b9570cfb63501638db720f3bee9f6dfd044b82
commit: 954bd99435b8ba99e86665d6a2ec1baa1d128325 powerpc/eeh: Add eeh_force_recover to debugfs
date:   6 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250122/202501221955.df1CrqF2-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221955.df1CrqF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221955.df1CrqF2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/eeh_event.c:52: warning: Function parameter or struct member 'dummy' not described in 'eeh_event_handler'
>> arch/powerpc/kernel/eeh_event.c:125: warning: expecting prototype for eeh_send_failure_event(). Prototype was for __eeh_send_failure_event() instead


vim +125 arch/powerpc/kernel/eeh_event.c

172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  115  
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  116  /**
29f8bf1b7f79f6 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-02-27  117   * eeh_send_failure_event - Generate a PCI error event
c533b46cc7da58 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-09-07  118   * @pe: EEH PE
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  119   *
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  120   * This routine can be called within an interrupt context;
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  121   * the actual event will be delivered in a normal context
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  122   * (from a workqueue).
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  123   */
954bd99435b8ba arch/powerpc/kernel/eeh_event.c            Oliver O'Halloran 2019-02-15  124  int __eeh_send_failure_event(struct eeh_pe *pe)
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03 @125  {
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  126  	unsigned long flags;
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  127  	struct eeh_event *event;
c533b46cc7da58 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-09-07  128  
7e4bbaf0bf13c3 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-09-07  129  	event = kzalloc(sizeof(*event), GFP_ATOMIC);
c533b46cc7da58 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-09-07  130  	if (!event) {
c533b46cc7da58 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-09-07  131  		pr_err("EEH: out of memory, event not handled\n");
c533b46cc7da58 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-09-07  132  		return -ENOMEM;
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  133  	}
c533b46cc7da58 arch/powerpc/platforms/pseries/eeh_event.c Gavin Shan        2012-09-07  134  	event->pe = pe;
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  135  
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  136  	/* We may or may not be called in an interrupt context */
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  137  	spin_lock_irqsave(&eeh_eventlist_lock, flags);
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  138  	list_add(&event->list, &eeh_eventlist);
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  139  	spin_unlock_irqrestore(&eeh_eventlist_lock, flags);
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  140  
c86085580d5f60 arch/powerpc/kernel/eeh_event.c            Gavin Shan        2013-06-20  141  	/* For EEH deamon to knick in */
2fea82db113e44 arch/powerpc/kernel/eeh_event.c            Arnd Bergmann     2018-12-10  142  	complete(&eeh_eventlist_event);
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  143  
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  144  	return 0;
172ca9261800ba arch/powerpc/platforms/pseries/eeh_event.c Linas Vepstas     2005-11-03  145  }
99866595340fa2 arch/powerpc/kernel/eeh_event.c            Gavin Shan        2013-06-20  146  

:::::: The code at line 125 was first introduced by commit
:::::: 172ca9261800bacbbc7d320d9924d9b482dff8de [PATCH] ppc64: PCI error event dispatcher

:::::: TO: Linas Vepstas <linas@linas.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
