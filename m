Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D66F4174B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyXSuGMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701794960; x=1733330960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VGmq7ltuiVSmplVgRVSBqM+cSBVBc8NnDt8//aCSaS4=;
  b=jyXSuGMBQPzm17tJeCljbhbwnQK9FNGVkXdQ/D4vpgOSuUHK8vyl7WKR
   hrM+3gWgNYG6cRSl0oiL1wNNKRA4cEePrYrw6eXXTA8mvAGjdUXtxlKoo
   0WRXv9nCWOzU7ZKeQaZFP89G8SAXEcVfXLzPYdpszZNf+6VzTO+bwCAES
   apfdp1PW1YHpIzN+K7vQjocZMFhf01Y8xaniw+5oDGTZFJ1ZPCK+DFGuE
   OdOQvoHPV67NmeMcj9ggpNxoahZh2Ji+M1HTZRMFEm0wMxvim94VMTJKb
   dpCDebM46mEIp9zVlWXcfQ8XAFCE0DSJ4WJzOWF/Y08iR4bawfTWHPJHy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378947437"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="378947437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747301114"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="747301114"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 08:49:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYbU-0009O2-0S;
	Tue, 05 Dec 2023 16:49:00 +0000
Date: Wed, 6 Dec 2023 00:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, fenghua.yu@intel.com,
	reinette.chatre@intel.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com,
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org,
	seanjc@google.com, kim.phillips@amd.com, babu.moger@amd.com,
	jmattson@google.com, ilpo.jarvinen@linux.intel.com,
	jithu.joseph@intel.com, kan.liang@linux.intel.com, nikunj@amd.com,
	daniel.sneddon@linux.intel.com, pbonzini@redhat.com,
	rick.p.edgecombe@intel.com, rppt@kernel.org,
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, eranian@google.com,
	peternewman@google.com
Subject: Re: [PATCH 07/15] x86/resctrl: Add support to enable/disable ABMC
 feature
Message-ID: <202312060033.DCTZ5iG9-lkp@intel.com>
References: <20231201005720.235639-8-babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201005720.235639-8-babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231130]
[cannot apply to tip/x86/core linus/master v6.7-rc3 v6.7-rc2 v6.7-rc1 v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-resctrl-Remove-hard-coded-memory-bandwidth-limit/20231201-090621
base:   next-20231130
patch link:    https://lore.kernel.org/r/20231201005720.235639-8-babu.moger%40amd.com
patch subject: [PATCH 07/15] x86/resctrl: Add support to enable/disable ABMC feature
config: i386-randconfig-013-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060033.DCTZ5iG9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060033.DCTZ5iG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060033.DCTZ5iG9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:2419:5: warning: no previous prototype for 'resctrl_arch_set_abmc_enabled' [-Wmissing-prototypes]
    2419 | int resctrl_arch_set_abmc_enabled(enum resctrl_res_level l, bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/resctrl_arch_set_abmc_enabled +2419 arch/x86/kernel/cpu/resctrl/rdtgroup.c

  2418	
> 2419	int resctrl_arch_set_abmc_enabled(enum resctrl_res_level l, bool enable)
  2420	{
  2421		struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
  2422	
  2423		if (!hw_res->r_resctrl.abmc_capable)
  2424			return -EINVAL;
  2425	
  2426		if (enable)
  2427			return resctrl_abmc_enable(l);
  2428	
  2429		resctrl_abmc_disable(l);
  2430	
  2431		return 0;
  2432	}
  2433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
