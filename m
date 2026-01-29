Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71D37FF5C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680374; cv=none; b=cVRUBp3HPogW4njyl5MibTjmk6OQZfm71re3W2bSwozuPNA9AWRsNHwgAw4Hslfxt08MM8bGEYQ/1BHlXyNLjK3c3ai+kw+XLHpjsMWrSbFlYLerRBhYHOYKYq0985e9gwdAVG3CHvk7cGi6pYoRd7g0JYWCHi1I0f+deqAAZOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680374; c=relaxed/simple;
	bh=zFTy40P++A/fj80s2qLzscLKWBZGOQDRR0TgMNIVEJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g75fXznfph1ClCsZMReSwgtcus29ubPNqm157SsNRXCxKw7DJ72HALtxmvrvSEOeYis8BMwFp4Bhvm4Kf/MKrktOGsJhrcZaCQcFyr4VkQ38a4AWS/AasK6Pn7la5zxsgFgF4sTPTgVQxxxqChujgj9h0341RocYFH0WmfmdW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbr9mv0A; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbr9mv0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769680373; x=1801216373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zFTy40P++A/fj80s2qLzscLKWBZGOQDRR0TgMNIVEJM=;
  b=dbr9mv0AQKWW+HptClTAXlcdDMy+z0jOTCNA3dA2/lpMfO9WqXkn4EOI
   g7ZRY5/2dqFNbCwSm46yPnfone6AXJbzrydRTh4Wv+2CsjEbBBvJztqTk
   mCoNjtKoKxEQxEb+QCj7tbNeOZjnlMb8aDqQpqlHp7Kl241HcAA5FrhRy
   axjJKWeCH/HDTa4osvc7NDJ0zrpdQKUdIhut3GZUrtaEDz+wDssAemQAC
   Vc/SITLNs/mWCCVRyvI2WF7hQPOmQxVjFJGooG8eGgoMidH0fbQP2fOxw
   +c3mHPaHRFHLpoSvzsk/jIJNPjJQrWD291g1iNZgiXfWsTnuGTRdhUzyz
   w==;
X-CSE-ConnectionGUID: IXUs0vT4SMW4HjpDp+H1Jg==
X-CSE-MsgGUID: ZUX4L699QI2uKdXWh+Kobw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70109456"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70109456"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 01:52:51 -0800
X-CSE-ConnectionGUID: 2KX1gktWSq+Q9StTj6QC0w==
X-CSE-MsgGUID: mZN+qnMeSVqqXyC606aUOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="207775246"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 01:52:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlOhg-00000000bL6-3guq;
	Thu, 29 Jan 2026 09:52:44 +0000
Date: Thu, 29 Jan 2026 17:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jie Zhan <zhanjie9@hisilicon.com>,
	zhenglifeng1@huawei.com, Ionela Voinescu <ionela.voinescu@arm.com>,
	Christian Loehle <christian.loehle@arm.com>, sumitg@nvidia.com,
	Pierre Gondois <pierre.gondois@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Huang Rui <ray.huang@amd.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/6] cpufreq: Set policy->min and max as real QoS
 constraints
Message-ID: <202601291700.LY8K4K9v-lkp@intel.com>
References: <20260126101826.94030-6-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126101826.94030-6-pierre.gondois@arm.com>

Hi Pierre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.19-rc7 next-20260128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Gondois/cpufreq-Remove-per-CPU-QoS-constraint/20260126-182440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260126101826.94030-6-pierre.gondois%40arm.com
patch subject: [PATCH 5/6] cpufreq: Set policy->min and max as real QoS constraints
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260129/202601291700.LY8K4K9v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291700.LY8K4K9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291700.LY8K4K9v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/virtual-cpufreq.c: In function 'virt_cpufreq_get_freq_info':
>> drivers/cpufreq/virtual-cpufreq.c:167:32: warning: statement with no effect [-Wunused-value]
     167 |                 policy->cpuinfo.min_freq;
         |                 ~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/cpufreq/virtual-cpufreq.c:168:32: warning: statement with no effect [-Wunused-value]
     168 |                 policy->cpuinfo.max_freq;
         |                 ~~~~~~~~~~~~~~~^~~~~~~~~


vim +167 drivers/cpufreq/virtual-cpufreq.c

   155	
   156	static int virt_cpufreq_get_freq_info(struct cpufreq_policy *policy)
   157	{
   158		struct cpufreq_frequency_table *table;
   159		u32 num_perftbl_entries, idx;
   160	
   161		num_perftbl_entries = per_cpu(perftbl_num_entries, policy->cpu);
   162	
   163		if (num_perftbl_entries == 1) {
   164			policy->cpuinfo.min_freq = 1;
   165			policy->cpuinfo.max_freq = virt_cpufreq_get_perftbl_entry(policy->cpu, 0);
   166	
 > 167			policy->cpuinfo.min_freq;
   168			policy->cpuinfo.max_freq;
   169	
   170			policy->cur = policy->cpuinfo.max_freq;
   171			return 0;
   172		}
   173	
   174		table = kcalloc(num_perftbl_entries + 1, sizeof(*table), GFP_KERNEL);
   175		if (!table)
   176			return -ENOMEM;
   177	
   178		for (idx = 0; idx < num_perftbl_entries; idx++)
   179			table[idx].frequency = virt_cpufreq_get_perftbl_entry(policy->cpu, idx);
   180	
   181		table[idx].frequency = CPUFREQ_TABLE_END;
   182		policy->freq_table = table;
   183	
   184		return 0;
   185	}
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
