Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7132526D4EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 23:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124955; cv=none; b=iFG3nS7Id+uelOvrM8XBLlSw+Q23l/OQH65lSe3/UV5IOrTBcNpfCxUpu6gVuMv2+8Jyj2JH5Wf09lQV47+93qspmmQl/RewV9HkkFJE/LfXkhNhoPPBw4SaWtxXu8WmAivdANSGticQe7HG34TEToexQ0A4C0KUkeVDxPpziZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124955; c=relaxed/simple;
	bh=XH6t5EIdYfbp4rCcy8iVqKDJUjzs9vb4l/406SKm7ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPZGlCSOj/8LFFvR4scGKs+bCv5Hqy88A3d4BxGp/10kQy97e5PaOIaMIrhpyguYoeyM29dLVRUJj+Slh3DDafyho1NRHrt7epui2R6ABEWvawX4ntZ0KV/CFsVRFf/BRRk8/SLe5B5zYalQZiOkGDce1QyGF5QvNu//u6U/eJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aadIb8OR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aadIb8OR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769124943; x=1800660943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XH6t5EIdYfbp4rCcy8iVqKDJUjzs9vb4l/406SKm7ZI=;
  b=aadIb8ORxwfxfBWQH2jAobiryKkVj1PsgFq8RevweakIs/sl58LbuM/i
   UU+BXTxdLqv8br7YKhRM+z8qBGilUbTHlOEXjK+dZTHChSS9xkSPGSCyP
   jr2NOaH9ABM4s3syXql1Ue2HqaokNMaVVhPh//Rxw2T5cp4fKfeiV27JK
   ypjY5NJDIM980uVO0OrV5XV1Mrdc2FDKm3Cf7XWZtkQc/qhgZIxLRyIAw
   V06R2x+5FSkwSHaM+fxo2cufU79kloNx80QHzElSaZ1eqjfBamEYR9Wir
   2BMQ4PCyQ5F4JGuDPMVQO82ZXnhgl6DxHNT5PO2uiz8lapjv3movOIsqt
   g==;
X-CSE-ConnectionGUID: nz9zppSqQzqifrHVAmJikw==
X-CSE-MsgGUID: EZMnD4K2QTejPtyikq8tHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87953961"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="87953961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 15:35:27 -0800
X-CSE-ConnectionGUID: h95NxsAZSAWdgOSFgsnQkg==
X-CSE-MsgGUID: mrqMJNVOTyOQWP+hdEnFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="237521060"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2026 15:35:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj4Cw-00000000TLO-1rBU;
	Thu, 22 Jan 2026 23:35:22 +0000
Date: Fri, 23 Jan 2026 07:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
Subject: Re: [PATCH] sched/fair: Optimize EAS energy calculation complexity
 from O(N) to O(1) inside inner loop
Message-ID: <202601230700.0p7YsNA0-lkp@intel.com>
References: <20260122154227.130767-1-realwujing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122154227.130767-1-realwujing@gmail.com>

Hi Qiliang,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master peterz-queue/sched/core linus/master v6.19-rc6 next-20260122]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-fair-Optimize-EAS-energy-calculation-complexity-from-O-N-to-O-1-inside-inner-loop/20260123-000924
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260122154227.130767-1-realwujing%40gmail.com
patch subject: [PATCH] sched/fair: Optimize EAS energy calculation complexity from O(N) to O(1) inside inner loop
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260123/202601230700.0p7YsNA0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230700.0p7YsNA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230700.0p7YsNA0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'find_energy_efficient_cpu':
   include/linux/cpumask_types.h:18:37: warning: dereferencing 'void *' pointer
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:380:31: note: in expansion of macro 'cpumask_bits'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~
>> include/linux/cpumask_types.h:18:37: error: request for member 'bits' in something not a structure or union
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:380:31: note: in expansion of macro 'cpumask_bits'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:380:9: note: in expansion of macro 'for_each_set_bit'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~


vim +/bits +18 include/linux/cpumask_types.h

eb4faa36d674ee Yury Norov 2024-05-27  10  
eb4faa36d674ee Yury Norov 2024-05-27  11  /**
eb4faa36d674ee Yury Norov 2024-05-27  12   * cpumask_bits - get the bits in a cpumask
eb4faa36d674ee Yury Norov 2024-05-27  13   * @maskp: the struct cpumask *
eb4faa36d674ee Yury Norov 2024-05-27  14   *
eb4faa36d674ee Yury Norov 2024-05-27  15   * You should only assume nr_cpu_ids bits of this mask are valid.  This is
eb4faa36d674ee Yury Norov 2024-05-27  16   * a macro so it's const-correct.
eb4faa36d674ee Yury Norov 2024-05-27  17   */
eb4faa36d674ee Yury Norov 2024-05-27 @18  #define cpumask_bits(maskp) ((maskp)->bits)
eb4faa36d674ee Yury Norov 2024-05-27  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
