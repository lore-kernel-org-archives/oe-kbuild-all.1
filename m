Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4101FE451
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 05:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756790855; cv=none; b=q9Lx8geQC9F2il2C3Aq9mLf6SmAAIveNgGRqW0Dc2cHDRBBdgRFaac+9faQH0ETnWFfka1uVhNDDXw96v4DdR0yakTHs1ty2Y51RXDV4h/tuEoERuv1H6QrFUZR8xvqVcJaDKS4gLq3Texz8YypXAEN9CFveMEbh/8sXwTyYFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756790855; c=relaxed/simple;
	bh=7vaAOkQ0YyOHNvZuR7TbQe9Xc7Ozcxfb8K/XU0xAClQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riAHHqeH8AjHPqx2XfxMDnQCY/SLBM29OXz8RpH13LtzpEccp3zDgNRxUjN1p34xuJspE7ix/iVL401Spnx5NWOUYATJi6rxFkFPXUJUGqANf3SDU7Gaa0RfhOdG6zGTPpkn8OOZhc8TjF41/82w9/LehJawRzFGv9fpp7uHOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAXnriVU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAXnriVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756790853; x=1788326853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7vaAOkQ0YyOHNvZuR7TbQe9Xc7Ozcxfb8K/XU0xAClQ=;
  b=NAXnriVUJuppD0rdcHaDtsJSYHXc5CKE3McH30KflmwXrDBfS9n2M6XY
   WWUeOmbMdUYGI80rBPuHh9orUin5LagbcBLVl4Oujbf10RQCNFI5bU7Lk
   hvzmu1OUYhr3kYCIJV76sg4hb3lE8xMKffpR9MLxwwjXCQ/cZ3Rrf+nV9
   eB2LzR1B+UM5nBncxv0RPHx9ZdT2IyMMeB6fCDLa+4tYLVuJ4+ALudQe5
   hOS19Hp7CK/66mhmb5is19oC1c3u0KV36iP8Emu903usKYy7x85YUV05m
   sND5s/lD6fwCvJnODvHeit5BvjJJ8KOAEg6slAcvYX7W90DU3sDbKAqtC
   g==;
X-CSE-ConnectionGUID: dlGo9CtOTUWoHTBdLuyEcA==
X-CSE-MsgGUID: 4hz6rv9QTa6aG5tAHAH9sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69656453"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="69656453"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 22:27:32 -0700
X-CSE-ConnectionGUID: 3yTy5wP0TZ29ahwUokIVUQ==
X-CSE-MsgGUID: Baqbw417Rfu0ZoyKXgLbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171536697"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Sep 2025 22:27:26 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utJXw-0001T5-36;
	Tue, 02 Sep 2025 05:27:14 +0000
Date: Tue, 2 Sep 2025 13:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>,
	"Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 01/12] arm64: topology: Use scope-based cleanup helper
Message-ID: <202509021320.CRevA14c-lkp@intel.com>
References: <20250901085748.36795-2-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901085748.36795-2-zhangzihuan@kylinos.cn>

Hi Zihuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge rafael-pm/thermal arm64/for-next/core linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/arm64-topology-Use-scope-based-cleanup-helper/20250901-170106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250901085748.36795-2-zhangzihuan%40kylinos.cn
patch subject: [PATCH v3 01/12] arm64: topology: Use scope-based cleanup helper
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250902/202509021320.CRevA14c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021320.CRevA14c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021320.CRevA14c-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/topology.c: In function 'arch_freq_get_on_cpu':
>> arch/arm64/kernel/topology.c:311:49: error: 'info' undeclared (first use in this function)
     311 |                                 cpufreq_cpu_get(info->opp_cpu);
         |                                                 ^~~~
   arch/arm64/kernel/topology.c:311:49: note: each undeclared identifier is reported only once for each function it appears in


vim +/info +311 arch/arm64/kernel/topology.c

   284	
   285	int arch_freq_get_on_cpu(int cpu)
   286	{
   287		struct amu_cntr_sample *amu_sample;
   288		unsigned int start_cpu = cpu;
   289		unsigned long last_update;
   290		unsigned int freq = 0;
   291		u64 scale;
   292	
   293		if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
   294			return -EOPNOTSUPP;
   295	
   296		while (1) {
   297	
   298			amu_sample = per_cpu_ptr(&cpu_amu_samples, cpu);
   299	
   300			last_update = amu_sample->last_scale_update;
   301	
   302			/*
   303			 * For those CPUs that are in full dynticks mode, or those that have
   304			 * not seen tick for a while, try an alternative source for the counters
   305			 * (and thus freq scale), if available, for given policy: this boils
   306			 * down to identifying an active cpu within the same freq domain, if any.
   307			 */
   308			if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
   309			    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
   310				struct cpufreq_policy *policy __free(put_cpufreq_policy) =
 > 311					cpufreq_cpu_get(info->opp_cpu);
   312				int ref_cpu;
   313	
   314				if (!policy)
   315					return -EINVAL;
   316	
   317				if (!cpumask_intersects(policy->related_cpus,
   318							housekeeping_cpumask(HK_TYPE_TICK)))
   319					return -EOPNOTSUPP;
   320	
   321				for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
   322					if (ref_cpu == start_cpu) {
   323						/* Prevent verifying same CPU twice */
   324						ref_cpu = nr_cpu_ids;
   325						break;
   326					}
   327					if (!idle_cpu(ref_cpu))
   328						break;
   329				}
   330	
   331				if (ref_cpu >= nr_cpu_ids)
   332					/* No alternative to pull info from */
   333					return -EAGAIN;
   334	
   335				cpu = ref_cpu;
   336			} else {
   337				break;
   338			}
   339		}
   340		/*
   341		 * Reversed computation to the one used to determine
   342		 * the arch_freq_scale value
   343		 * (see amu_scale_freq_tick for details)
   344		 */
   345		scale = arch_scale_freq_capacity(cpu);
   346		freq = scale * arch_scale_freq_ref(cpu);
   347		freq >>= SCHED_CAPACITY_SHIFT;
   348		return freq;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
