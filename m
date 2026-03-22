Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB730B53C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774181422; cv=none; b=pEhbASRTo5WkHDMhU6kmRQx7hLKfS3ATYnysZTr9c/oYjnlnioi5dfhGtY7tpAwUmiLkdeXX37vLq95qIvTmllY0uRg3aPsr8k0sIMzh03uOm+UO09E+R7Q65U7uXVTRx7y7Bw3psveOilUAWshxxdQcGTk9KZzrft5cHN250xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774181422; c=relaxed/simple;
	bh=L4qhiO0r9pS8HEn1IQ/owr/DLKWlcdC7VSUu4SyA7ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSbhGbqzDu6R1j+J2Wvl66Ql5eqjv3nrFIeq/0F+qY+AXBN6z0pThsAoaEBjmes9Y7sRaJWiqNIjQys24Vw9fv1V+eFqO3xn3hJP6XbSeV3wE/xKZ6EioscC6KKoU2Q10JewpaVTS/WyWVvqajnTJ7EEUzMd0DwY6t419CyfutY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsMY370+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsMY370+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774181420; x=1805717420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4qhiO0r9pS8HEn1IQ/owr/DLKWlcdC7VSUu4SyA7ks=;
  b=KsMY370++e6hZA1AOlueu1D0eBXfk2CHKeJ6D6XsxRbHBfgEN7+jggUS
   SiX2FmmE1ljaRPYFfdYeaszfe2WpauVDaIcWlG6NsIBsgob98fQukarWA
   +EOelN8DyX5EfB2/snTuC7XA85ENFSPPCbv/YFb1gPvKwTSXqN5v/1XEe
   j+BxzyLEBi7MxJISJYeGScrBOHLRsmSVtAFBPblaY6/5pOb8ChA0J1XDc
   xGKd+ybqGqov3RMZP6J0v5IfEy+hDTZXQrxc3mUc5BJ4gevdl/x3qRPXm
   buS/0G6fIldFzjtlUJORq2gz3yXetcb7oIANgUsHxUYojL1CZBf5KtD61
   w==;
X-CSE-ConnectionGUID: Tb7GusStSXieheH7pbdHyQ==
X-CSE-MsgGUID: NDdHNrzjSZy2A/S5BgBhMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="78801343"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="78801343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 05:10:19 -0700
X-CSE-ConnectionGUID: xm1g0LyqSYK+XgdFZy8cNQ==
X-CSE-MsgGUID: nuZjTtLJQROWqK2PKv2ycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="227856979"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2026 05:10:19 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4HdI-0000000026R-1Irg;
	Sun, 22 Mar 2026 12:10:16 +0000
Date: Sun, 22 Mar 2026 20:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Jinghuang <chenjinghuang2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 8/9] sched/fair: Steal work from an overloaded CPU
 when CPU goes idle
Message-ID: <202603222032.E2CS3R19-lkp@intel.com>
References: <20260320055920.2518389-9-chenjinghuang2@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320055920.2518389-9-chenjinghuang2@huawei.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc4]
[cannot apply to tip/sched/core peterz-queue/sched/core next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Jinghuang/sched-Provide-sparsemask-a-reduced-contention-bitmap/20260321-084706
base:   linus/master
patch link:    https://lore.kernel.org/r/20260320055920.2518389-9-chenjinghuang2%40huawei.com
patch subject: [RFC PATCH v5 8/9] sched/fair: Steal work from an overloaded CPU when CPU goes idle
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260322/202603222032.E2CS3R19-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222032.E2CS3R19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222032.E2CS3R19-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:13310:12: error: redefinition of 'try_steal'
   13310 | static int try_steal(struct rq *dst_rq, struct rq_flags *dst_rf)
         |            ^~~~~~~~~
   kernel/sched/fair.c:5195:19: note: previous definition of 'try_steal' with type 'int(struct rq *, struct rq_flags *)'
    5195 | static inline int try_steal(struct rq *this_rq, struct rq_flags *rf)
         |                   ^~~~~~~~~
>> kernel/sched/fair.c:13310:12: warning: 'try_steal' defined but not used [-Wunused-function]
   13310 | static int try_steal(struct rq *dst_rq, struct rq_flags *dst_rf)
         |            ^~~~~~~~~


vim +/try_steal +13310 kernel/sched/fair.c

 13303	
 13304	/*
 13305	 * Try to steal a runnable CFS task from a CPU in the same LLC as @dst_rq,
 13306	 * and migrate it to @dst_rq.  rq_lock is held on entry and return, but
 13307	 * may be dropped in between.  Return 1 on success, 0 on failure, and -1
 13308	 * if a task in a different scheduling class has become runnable on @dst_rq.
 13309	 */
 13310	static int try_steal(struct rq *dst_rq, struct rq_flags *dst_rf)
 13311	{
 13312		int src_cpu;
 13313		int dst_cpu = dst_rq->cpu;
 13314		bool locked = true;
 13315		int stolen = 0;
 13316		struct sparsemask *overload_cpus;
 13317	
 13318		if (!sched_feat(STEAL))
 13319			return 0;
 13320	
 13321		if (!cpu_active(dst_cpu))
 13322			return 0;
 13323	
 13324		if (dst_rq->avg_idle < SCHED_STEAL_COST)
 13325			return 0;
 13326	
 13327		/* Get bitmap of overloaded CPUs in the same LLC as @dst_rq */
 13328	
 13329		rcu_read_lock();
 13330		overload_cpus = rcu_dereference(dst_rq->cfs_overload_cpus);
 13331		if (!overload_cpus) {
 13332			rcu_read_unlock();
 13333			return 0;
 13334		}
 13335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
