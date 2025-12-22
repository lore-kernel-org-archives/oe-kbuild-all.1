Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8675A332EA1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 22:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441959; cv=none; b=BGQn+hEnZ1apIFxn4tD1t+TvgjmuLhu8Z+XhqBeV/ScZ/O8AujwI/zUahPVF4qssb46EWB7IRKXuy7m4IE08kV3AlfHGpiTuZsoyHeeYNDaUi80XEz0DbveFD+lvYoQ0Aqv4XJxj4eEokGnjf8V+pRpje3sSvxf3of+MBPC4fRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441959; c=relaxed/simple;
	bh=LMIwR1QzE1dN5DWfiB55QZR22+q9BIL9KZyq0yjR++U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdcsfZoGzcJDamSG7oxts6VWrqC42QWkkmeqPnp1XRMlWHRUachgzrO7aQZsln9k01Cj1VDcLilwF7GAPlcVL6/vUSQOlXRCfmI8/jdRw75LbYJbr32H09H6LCbb5dQBtMwVMrTMzX8Y2t9/Rl7VcF6QA3n+1+e9GzfYTLSp7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar96zbca; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar96zbca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766441956; x=1797977956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LMIwR1QzE1dN5DWfiB55QZR22+q9BIL9KZyq0yjR++U=;
  b=ar96zbcaWCPt5Oros21HybeLqDUBbftYBMZG1910W8bTIlz7r8e3VUMh
   Pn2771GYGGlKWfMHO7xec1c7pHRh2n+m/pDauPn6ZH5Wd4yGZKL45pwP9
   W6FZzrMAqvUZNGDZgp1cfS/8Nx80iwijqtFoKXNZVNBvbHwg5qiQQ9IIb
   fjT6y8l81/OXDWRKVTtCo2NsqMIWq0leUYc9VnO6sWqx2sNmbB5iGkLwE
   adfRM/A0VCBs9vUPwDREslC1B8lowdPtaXkchWkgtuWS44fLdqKC2RrX4
   r3W5kJFgXweBBQs0CYcQ5nkQ9ycxf3OUk3c2AbTMn2HYsvrERx+Hs/97c
   A==;
X-CSE-ConnectionGUID: gAZuWuzdTI22lCDNEenrQQ==
X-CSE-MsgGUID: 7esC/xTNQtSPTbrzHg+Lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68281974"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68281974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 14:19:15 -0800
X-CSE-ConnectionGUID: 9K/FKi/DQ4af+RDWCxBIvw==
X-CSE-MsgGUID: USWKQR9WSl2xKH2NMJoLvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="203752058"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2025 14:19:12 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXoFC-000000001An-0wwA;
	Mon, 22 Dec 2025 22:19:10 +0000
Date: Tue, 23 Dec 2025 06:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
Message-ID: <202512230547.YPNxhzQP-lkp@intel.com>
References: <20251222092208.770136-1-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222092208.770136-1-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/core linus/master v6.19-rc2 next-20251219]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/x86-apic-Inline-__x2apic_send_IPI_dest/20251222-172515
base:   tip/master
patch link:    https://lore.kernel.org/r/20251222092208.770136-1-edumazet%40google.com
patch subject: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251223/202512230547.YPNxhzQP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230547.YPNxhzQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230547.YPNxhzQP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/apic/hw_nmi.c:24:
   arch/x86/kernel/apic/local.h: In function '__x2apic_send_IPI_dest':
>> arch/x86/kernel/apic/local.h:48:9: error: implicit declaration of function 'native_x2apic_icr_write'; did you mean 'native_apic_msr_read'? [-Wimplicit-function-declaration]
      48 |         native_x2apic_icr_write(cfg, apicid);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         native_apic_msr_read


vim +48 arch/x86/kernel/apic/local.h

    43	
    44	static inline void __x2apic_send_IPI_dest(unsigned int apicid, int vector,
    45						  unsigned int dest)
    46	{
    47		unsigned long cfg = __prepare_ICR(0, vector, dest);
  > 48		native_x2apic_icr_write(cfg, apicid);
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
