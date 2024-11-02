Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8DB175D47
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730558205; cv=none; b=g9LIbt0OB6lUnUeDjHQg1rJOUbE+AfMex8eezDnxx+QCZvfq8Z8T4hgrqfgdvmO2oJe7QT8lAqAmvO0hAMMXZ/g116f8Ky4IK9ocC+DVOMCoxRSoGPHeBYm5nmeoTCjy0IBdu180tqwT7NksS81xvNdbnHjw0Xvd4BRS0AN9q54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730558205; c=relaxed/simple;
	bh=RcJ4tASJhcou446taNCQzNa7In5RtUPM0Dckgu1LL7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEN/7+90dPuzGEj4Rbt+0rN2woh3YPJEl5oz3E2NVktdI8PrIEukNl0SJ28fvEa5RtyeTnT1W4Vd9L0M/Zcb38Ye3q4mF1TFT6AmL51b1vAPRtLzir5TP/zwquqPxqG5gL8G35s+xJVy+6Ot2Xxyxi7GI+CplSO200s7Mz2MdDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCXp6SUT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCXp6SUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730558203; x=1762094203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RcJ4tASJhcou446taNCQzNa7In5RtUPM0Dckgu1LL7k=;
  b=lCXp6SUTydNye9OZRm4gCsSgOFe0ZIumAJA3Sno8w3Wk3wjpLafswDAH
   HJPWS0oe5V81VhDTGq3lTU+jA5iiNuVDeGL23ibuplfvL5jmRcfowdhJE
   7/f0ew45DcX3HdYCtMTqqrl8xXipiOj+NQC5GA1EPkrGDATsquog33wpt
   ihc6CWP7GPxkucfDeArzXOyB3JCEmYXraW6NFBg4wnSyRCaaJTJx7Yy3e
   tHyLfwGJvt/Cf0WagSMaYXaMwcIoNB62ekkP5T/Pyb9rb8psyez+aU1Y1
   6+Frveeimsdflo/ZMbXfpoIs+GqFGI2bcR0ofkiKiS6pFnL1YEEKl3Y1w
   g==;
X-CSE-ConnectionGUID: EsKQLvDuTMOBG4roT24iIw==
X-CSE-MsgGUID: Z4JWzt+gSgKZYXWkGv48zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="34097177"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="34097177"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 07:36:41 -0700
X-CSE-ConnectionGUID: 2XHnKQ1mSyamrEuF5ov2fA==
X-CSE-MsgGUID: GW0FA3rOSk6ZrPc891HUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83572535"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2024 07:36:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7FF0-000j4F-0c;
	Sat, 02 Nov 2024 14:36:38 +0000
Date: Sat, 2 Nov 2024 22:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Herton R. Krzesinski" <herton@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] lazy tlb: fix hotplug exit race with
 MMU_LAZY_TLB_SHOOTDOWN
Message-ID: <202411022220.0u2CXCAM-lkp@intel.com>
References: <20241101214904.3178140-1-herton@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101214904.3178140-1-herton@redhat.com>

Hi Herton,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/smp/core tip/sched/core linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herton-R-Krzesinski/lazy-tlb-fix-hotplug-exit-race-with-MMU_LAZY_TLB_SHOOTDOWN/20241102-055107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241101214904.3178140-1-herton%40redhat.com
patch subject: [PATCH] lazy tlb: fix hotplug exit race with MMU_LAZY_TLB_SHOOTDOWN
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241102/202411022220.0u2CXCAM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411022220.0u2CXCAM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411022220.0u2CXCAM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:7982:13: warning: 'sched_force_init_mm' defined but not used [-Wunused-function]
    7982 | static void sched_force_init_mm(void)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/sched_force_init_mm +7982 kernel/sched/core.c

  7981	
> 7982	static void sched_force_init_mm(void)
  7983	{
  7984	}
  7985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
