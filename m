Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F66A329
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfNiTO3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701798976; x=1733334976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VVHu49U+NPcEJKbHaOEfhx1yRoqYC+nyoOOnhOlzyhU=;
  b=WfNiTO3xemCPtlP/3v3xx5fNqFBc3CSJfZSR3frOncgdU/dwPukbiMzP
   S2zywO3j1g8tJQswDmWiwfgFCknymYmJinm89mgXpsbUoUWwNi8X3uLQx
   BMCsQTXvZEvVSy48LWgzDcxBv3SPNma2SOmiPAGD/oEpCEi2neywkjCdM
   2On/x3Vj0E0+vwyKD1NGCbjTjQ9RMC0cZCMWE/Q5I2F6gCxTbgMLNGra6
   8rcHxsGt5AK3XMpq/U9Bn7OvR+mJPHu/hnY1bjn6pWIvM5N3tPij6VChT
   MyPVIhNEV2alajLZMVUjEPCCXFQ4V9XPvPN55B5oVFCnMii4AtSwjgc9C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391099078"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="391099078"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102532881"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1102532881"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 09:56:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZeR-0009Uq-0W;
	Tue, 05 Dec 2023 17:56:07 +0000
Date: Wed, 6 Dec 2023 01:55:41 +0800
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
Subject: Re: [PATCH 14/15] x86/resctrl: Add interface unassign a ABMC counter
Message-ID: <202312060120.q62q2ha7-lkp@intel.com>
References: <20231201005720.235639-15-babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201005720.235639-15-babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231130]
[cannot apply to tip/x86/core linus/master v6.7-rc3 v6.7-rc2 v6.7-rc1 v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-resctrl-Remove-hard-coded-memory-bandwidth-limit/20231201-090621
base:   next-20231130
patch link:    https://lore.kernel.org/r/20231201005720.235639-15-babu.moger%40amd.com
patch subject: [PATCH 14/15] x86/resctrl: Add interface unassign a ABMC counter
config: i386-randconfig-013-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060120.q62q2ha7-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060120.q62q2ha7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060120.q62q2ha7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:195:6: warning: no previous prototype for 'abmc_counters_free' [-Wmissing-prototypes]
     195 | void abmc_counters_free(int counterid)
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2675:5: warning: no previous prototype for 'resctrl_arch_set_abmc_enabled' [-Wmissing-prototypes]
    2675 | int resctrl_arch_set_abmc_enabled(enum resctrl_res_level l, bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/abmc_counters_free +195 arch/x86/kernel/cpu/resctrl/rdtgroup.c

   194	
 > 195	void abmc_counters_free(int counterid)
   196	{
   197		abmc_free_map |= 1 << counterid;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
