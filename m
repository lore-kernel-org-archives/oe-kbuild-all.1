Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23836387349
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685897; cv=none; b=HTTeMB6bKB6nNI0AeVXD4YMV5LKgJRbGxRAGRCfl3bEeD+1H/woZBlBajFK3587ClvlW1c4vewv/IOQP2PGRuw82awDBHlIt5HRZRS0ClV8iQ2HKwLsGa8ibwXCj8scsYQfizd1ldQe+q5p3D7P31z7YnuAvRPvI/vfDZF523Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685897; c=relaxed/simple;
	bh=vftR1/o4cmK625cN3zhb2Ja114CrtM2i4C9g1yhV1gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c39ONZHcQ6qgRdnedJTPKLYuvIPqsGaIRRM4jfWJvzm0z2n1xU9KXCfPwtTBSlCmWVyp+Rx1xj/77K1p0IdlJqo0YMxqUlnzbEuP1BAi8g/WB+zhPFGtsk4gmj7Whvtx1kWutKlCL3rkkTrTD3+cWZD821LezoHML/pb/cG7N3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyRlC8+J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyRlC8+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769685895; x=1801221895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vftR1/o4cmK625cN3zhb2Ja114CrtM2i4C9g1yhV1gg=;
  b=TyRlC8+JJrgEG8LXtE2IZmKmdkggCJJm15Rtlw7kILAcaeVjytmlGPHo
   ldzk1R2iS2OmgIHeGdhbjAmXkHutbhHa8U7JLLzjkHhPffCr5r3KV8E52
   QbZLJe4tXJFCjbyisQdkKMd8BUf40vfYWypDrvlEVfWKlKnvGq6RHVzdG
   HL15INxwLB1VTjUFrOLXkuqXPB/X3X9gACIHf4g/729a0AwEjVrx7x0ik
   AhbDOrNUNQyntUC/wLhm7XGlTyMxyqPdAsuzeSJLc7Z3z7g3PzfYHf3rE
   tCEBJL1vhiGxevozJDMC2Hll1IdWhgwaP8BGeuioGjr3bQOSQdt0wqCoL
   w==;
X-CSE-ConnectionGUID: WXlHai+aROWax8hYjwHxUA==
X-CSE-MsgGUID: RSq2eEV4TWeRqFE9Dqnf3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70816287"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70816287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:24:53 -0800
X-CSE-ConnectionGUID: 53pFctYUQ8GuwrH8YGY37w==
X-CSE-MsgGUID: HD9j0Xk4RMeCMWEyPglemA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208456944"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2026 03:24:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlQ8l-00000000bPU-3DwV;
	Thu, 29 Jan 2026 11:24:47 +0000
Date: Thu, 29 Jan 2026 19:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Qiliang Yuan <realwujing@gmail.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] sched/fair: Cache NUMA node statistics to avoid O(N)
 scanning
Message-ID: <202601291924.phVnpnOi-lkp@intel.com>
References: <20260129031948.2384178-1-realwujing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129031948.2384178-1-realwujing@gmail.com>

Hi Qiliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/master peterz-queue/sched/core linus/master v6.19-rc7 next-20260128]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-fair-Cache-NUMA-node-statistics-to-avoid-O-N-scanning/20260129-112302
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260129031948.2384178-1-realwujing%40gmail.com
patch subject: [PATCH v4] sched/fair: Cache NUMA node statistics to avoid O(N) scanning
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260129/202601291924.phVnpnOi-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291924.phVnpnOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291924.phVnpnOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:86:
   kernel/sched/topology.c: In function 'init_rootdomain':
>> kernel/sched/topology.c:574:1: warning: label 'free_cpupri' defined but not used [-Wunused-label]
     574 | free_cpupri:
         | ^~~~~~~~~~~


vim +/free_cpupri +574 kernel/sched/topology.c

   571	
   572		return 0;
   573	
 > 574	free_cpupri:
   575		cpupri_cleanup(&rd->cpupri);
   576	free_cpudl:
   577		cpudl_cleanup(&rd->cpudl);
   578	free_rto_mask:
   579		free_cpumask_var(rd->rto_mask);
   580	free_dlo_mask:
   581		free_cpumask_var(rd->dlo_mask);
   582	free_online:
   583		free_cpumask_var(rd->online);
   584	free_span:
   585		free_cpumask_var(rd->span);
   586	out:
   587		return -ENOMEM;
   588	}
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
