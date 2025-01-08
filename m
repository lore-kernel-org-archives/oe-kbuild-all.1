Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A5186284
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 03:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736306074; cv=none; b=p1BHeVgc4T+y0DopRthl0cRDNcuAzY4qcgB7Oxm19fIdUMVQRA2B/FehgIhhkCDLAaXQWslVnBTthDZQNLdkaVJptrZd80rFq3XiGZsSH061AqZoJaA4q0xOHz1HHVxKLBRFUYSsuyWsNkrTne9TOsZeM/c7xTaP+B8bM+DZQVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736306074; c=relaxed/simple;
	bh=4kdamdvXEvKKD+/OcGP94qtMYa3lmo8Hvo3NyhWdFmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LdBRNTYr+57O6sVGhi7U/WRfyy/imsY0tlI0sqFwTGb3naT0hYI3Clopluw3RhI1gbOywXQPsGiwUQ7tyZ0Sfl9cKfqfEBiBWqp6a1ns1JXZfSYHTO9VsBcnVlEUzYMOqVkIL4kVPYTuAR35QdyLGxsARWwzEs8ZsPepwqv/+js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jb0oCs0i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jb0oCs0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736306071; x=1767842071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kdamdvXEvKKD+/OcGP94qtMYa3lmo8Hvo3NyhWdFmk=;
  b=Jb0oCs0iwdn8gHYJBu697kETODsSCqjE0c4uaEUl9PgqAeNCQfdNfo36
   gbgtVT9xZVJJBxH9Ne6cZY6r7Q1Ufafu40ilKS2OCvLxGHbFYl5O+K90s
   2TiaHYjZJXu2icge/gHKFbIKc6Djz00ZmOLgEisulyMheeFVv/D6OcTUi
   dmj02XKhXVzzLmIbZYA4q550iG/opd6aKWcxo6YVwDcDJ2p4KwutrGZhm
   4Bb9x6CZZtzW4F0Kvq6kw2HGG7drW2HCH290FK8rgMLnuySZRUgSKm1Qn
   QXLuWMPd5K+l1CmGv79CF+iwY0nlZL75FyIJl5rx1ID/oB2XhBR/Ba8UB
   Q==;
X-CSE-ConnectionGUID: zvYOpeF0Sf21m0J3DX+5Eg==
X-CSE-MsgGUID: VCxpQiqUToCgh/q4UMspqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47181978"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47181978"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 19:14:30 -0800
X-CSE-ConnectionGUID: i0q39AH7ScKpbJNCdknqow==
X-CSE-MsgGUID: 0uI7JX5bQIKyKbxmlK96Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103803035"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 19:14:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVMWY-000FYJ-0F;
	Wed, 08 Jan 2025 03:14:26 +0000
Date: Wed, 8 Jan 2025 11:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver O'Halloran <oohall@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_event.c:125: warning: expecting prototype
 for eeh_send_failure_event(). Prototype was for __eeh_send_failure_event()
 instead
Message-ID: <202501081121.TPz5Sn81-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 954bd99435b8ba99e86665d6a2ec1baa1d128325 powerpc/eeh: Add eeh_force_recover to debugfs
date:   6 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250108/202501081121.TPz5Sn81-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081121.TPz5Sn81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081121.TPz5Sn81-lkp@intel.com/

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
