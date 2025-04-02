Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8815DBC1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 21:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629255; cv=none; b=jtem7bwmSP2q4fp2FMm+7YR4YzCJBB010nNN2ZsEwAK19PKRLG71527HPA3Nl+u6g37ptYmHOZ5l1CFUTj/CK1huOV/El/sEa3TNS0nBVCTDkqfKsFGfKwKXnrOuh49EJTIkpqRFcSld0XmDNvrldXsA0M13ENuoTmjCApofuKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629255; c=relaxed/simple;
	bh=INSRJDGb7g1KUiyo0QJdwxTIP+YEl7b9/eU/MGKPDT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryG0PKiQI+SRd960M58/m3sNUgreZrNEEcl899Gm16AxkkG6GZAIzPGiBgY8/oumbwUA26N4ilMUmf4I0Hg485PW4Z3fXLy7chDPj7CX9UGmytgUawYG1ZKe3wJ+wU4xQlD+sANsgpyVCg9KjWD+w2tn773vnVxCsBVNpf/BBtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFMsLz2w; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFMsLz2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743629254; x=1775165254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=INSRJDGb7g1KUiyo0QJdwxTIP+YEl7b9/eU/MGKPDT4=;
  b=EFMsLz2wOdX0nd/V7r7WyTV2Wh2DufC/chW6mbfjpPmdYmqMr3Dnx06a
   7M+XJxufOEtA2bOq47IKrsnzGvsX8Rr4aKgtpN7Wy8CwchqubcVuVEzgR
   JMyOkZRR55PG5SQtXf9Zptn7qhdnOR7K9Am1qMuEiNfC8Xdg40d0BaIxV
   GvypbcW3VtZdtRLcH2whzLwLPYdT5FyAecKLnIFmKB/EA0d9ilDtUeyF/
   nqItnAeuk6stxd7ba2WQvXn3dJPIt8cFRWlCOJ8cQwot2odI1ZOe9YpiW
   y6NI/+h1rdvgthNBd6lk9JlD0vJQZnFYNtNT1P7uzB4voaQkZIrIdKxAm
   Q==;
X-CSE-ConnectionGUID: z8D8gxR7T2icUPj4JWa88w==
X-CSE-MsgGUID: oIoXUFJJRnS9x4fczs9Jyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="67484369"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="67484369"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:27:33 -0700
X-CSE-ConnectionGUID: U9puD8zkTwyL80zctEpGTg==
X-CSE-MsgGUID: +k06HM9jTauB9pCLi8rg6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="164053228"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2025 14:27:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u05cQ-000B1y-0l;
	Wed, 02 Apr 2025 21:27:30 +0000
Date: Thu, 3 Apr 2025 05:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Machado <luis.machado@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] sched: Improving scheduler debugging/tracing interfaces
Message-ID: <202504030406.pJu0c0cp-lkp@intel.com>
References: <20250402122607.2982523-1-luis.machado@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402122607.2982523-1-luis.machado@arm.com>

Hi Luis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 328802738e1cd091d04076317f3c2174125c5916]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Machado/sched-Improving-scheduler-debugging-tracing-interfaces/20250402-203041
base:   328802738e1cd091d04076317f3c2174125c5916
patch link:    https://lore.kernel.org/r/20250402122607.2982523-1-luis.machado%40arm.com
patch subject: [RFC] sched: Improving scheduler debugging/tracing interfaces
config: csky-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250403/202504030406.pJu0c0cp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030406.pJu0c0cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030406.pJu0c0cp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c: In function 'cfs_rq_util_est':
   kernel/sched/core.c:104:31: error: 'struct cfs_rq' has no member named 'avg'
     104 |         return cfs_rq ? cfs_rq->avg.util_est: 0;
         |                               ^~
   kernel/sched/core.c: In function 'se_util_est':
   kernel/sched/core.c:110:23: error: 'struct sched_entity' has no member named 'avg'
     110 |         return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
         |                       ^~
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/csky/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from include/asm-generic/cmpxchg.h:15,
                    from arch/csky/include/asm/cmpxchg.h:162,
                    from include/asm-generic/atomic.h:12,
                    from arch/csky/include/asm/atomic.h:199,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function 'rq_cpu_current_capacity':
   kernel/sched/core.c:118:60: error: 'struct rq' has no member named 'cpu'
     118 |         unsigned long capacity_orig = per_cpu(cpu_scale, rq->cpu);
         |                                                            ^~
   include/linux/percpu-defs.h:262:16: note: in definition of macro 'per_cpu_ptr'
     262 |         (void)(cpu);                                                    \
         |                ^~~
   kernel/sched/core.c:118:39: note: in expansion of macro 'per_cpu'
     118 |         unsigned long capacity_orig = per_cpu(cpu_scale, rq->cpu);
         |                                       ^~~~~~~
   kernel/sched/core.c:119:63: error: 'struct rq' has no member named 'cpu'
     119 |         unsigned long scale_freq = per_cpu(arch_freq_scale, rq->cpu);
         |                                                               ^~
   include/linux/percpu-defs.h:262:16: note: in definition of macro 'per_cpu_ptr'
     262 |         (void)(cpu);                                                    \
         |                ^~~
   kernel/sched/core.c:119:36: note: in expansion of macro 'per_cpu'
     119 |         unsigned long scale_freq = per_cpu(arch_freq_scale, rq->cpu);
         |                                    ^~~~~~~
   kernel/sched/core.c: In function 'se_util_est':
>> kernel/sched/core.c:111:1: warning: control reaches end of non-void function [-Wreturn-type]
     111 | }
         | ^
   kernel/sched/core.c: In function 'cfs_rq_util_est':
   kernel/sched/core.c:105:1: warning: control reaches end of non-void function [-Wreturn-type]
     105 | }
         | ^


vim +111 kernel/sched/core.c

   109	
   110		return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
 > 111	}
   112	
   113	static unsigned long rq_cpu_current_capacity(struct rq *rq)
   114	{
   115		if (rq == NULL)
   116			return 0;
   117	
   118		unsigned long capacity_orig = per_cpu(cpu_scale, rq->cpu);
 > 119		unsigned long scale_freq = per_cpu(arch_freq_scale, rq->cpu);
   120		return cap_scale(capacity_orig, scale_freq);
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
