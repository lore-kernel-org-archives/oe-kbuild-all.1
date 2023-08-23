Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3120F19
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 04:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692764278; x=1724300278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gde8+Me9mAhkHv6ln8PbeGxW9veh4ia2XPcgBnZZSPw=;
  b=HtYf7CW+Cc3viZS7VTYVR8xQ9nvtTPLjlEQbSFxK7cmM2OM2pARg8BwG
   bBhBOVirKUPeNu561pGbHmUZb3tvWMSzqySo+4Jl9Tc2b+9fe/aLpb7Mp
   uJWUbAX+buDyq8N77u86JY9qORycNlgU72JfIPIPQCLoDQtmxjgVsP7bt
   +1B5IYNFROL8Vsp74DejKWSgVEqnYCi+Kg5acJj+679ruwBiyb07U6FGC
   zs7uLYY1mc18T491KuD8LOIekghnSY/adXbOoYBAbKSE5Eai5SW1mOCKc
   r9o4FzOggBv/kCtOVQM22J773eW2cN3vqT/HSq2UxQ/985WoVHgvFvODa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372950118"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="372950118"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 21:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771569513"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="771569513"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Aug 2023 21:06:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYf8U-0000pY-2O;
	Wed, 23 Aug 2023 04:06:26 +0000
Date: Wed, 23 Aug 2023 12:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dennis@kernel.org, tj@kernel.org,
	cl@linux.com, akpm@linux-foundation.org, shakeelb@google.com,
	linux-mm@kvack.org, Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH v2 2/2] fork: group allocation of per-cpu counters for mm
 struct
Message-ID: <202308231154.SM8fedb1-lkp@intel.com>
References: <20230822184152.2194558-3-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822184152.2194558-3-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on dennis-percpu/for-next]
[also build test ERROR on linus/master v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/pcpcntr-add-group-allocation-free/20230823-024312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git for-next
patch link:    https://lore.kernel.org/r/20230822184152.2194558-3-mjguzik%40gmail.com
patch subject: [PATCH v2 2/2] fork: group allocation of per-cpu counters for mm struct
config: arm-randconfig-r005-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231154.SM8fedb1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231154.SM8fedb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231154.SM8fedb1-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/fork.c: In function '__mmdrop':
>> kernel/fork.c:926:9: error: implicit declaration of function 'percpu_counter_destroy_many'; did you mean 'percpu_counter_destroy'? [-Werror=implicit-function-declaration]
     926 |         percpu_counter_destroy_many(mm->rss_stat, NR_MM_COUNTERS);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         percpu_counter_destroy
   kernel/fork.c: In function 'mm_init':
>> kernel/fork.c:1299:13: error: implicit declaration of function 'percpu_counter_init_many'; did you mean 'percpu_counter_init'? [-Werror=implicit-function-declaration]
    1299 |         if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT, NR_MM_COUNTERS))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
         |             percpu_counter_init
   cc1: some warnings being treated as errors


vim +926 kernel/fork.c

   904	
   905	/*
   906	 * Called when the last reference to the mm
   907	 * is dropped: either by a lazy thread or by
   908	 * mmput. Free the page directory and the mm.
   909	 */
   910	void __mmdrop(struct mm_struct *mm)
   911	{
   912		BUG_ON(mm == &init_mm);
   913		WARN_ON_ONCE(mm == current->mm);
   914	
   915		/* Ensure no CPUs are using this as their lazy tlb mm */
   916		cleanup_lazy_tlbs(mm);
   917	
   918		WARN_ON_ONCE(mm == current->active_mm);
   919		mm_free_pgd(mm);
   920		destroy_context(mm);
   921		mmu_notifier_subscriptions_destroy(mm);
   922		check_mm(mm);
   923		put_user_ns(mm->user_ns);
   924		mm_pasid_drop(mm);
   925		mm_destroy_cid(mm);
 > 926		percpu_counter_destroy_many(mm->rss_stat, NR_MM_COUNTERS);
   927	
   928		free_mm(mm);
   929	}
   930	EXPORT_SYMBOL_GPL(__mmdrop);
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
