Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D95BA2C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 23:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691190121; x=1722726121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2MzQ2ck5DpFrJfh90LVzgdpOp29rmsWZF1F9PlHAoZ0=;
  b=OsCSR/E/XqQswODG2TBAv4gl6Rp07jTVoDicwFbjcr869exQiUmELIeQ
   IxTB90vr10DOKIUlTwrs3wFpCfgCBuRfI1EK7y8BKVnQj+6WQ+2IzbjxU
   GoAe4tPLDUfL6eFvQsK6NFhLL76bjkoEG2dt6+dH+N16f8onv8QWx/UQQ
   V8ctC/ouzDRJECEKu7AC7Bj8mCdq7DoPFkcVhLyIujy05RePVatb/tlW+
   pgfGJ60BALBv5sIatHGrZbn2LtYXXlu49W5ssX1jcLY5xLRSod3JtKBA+
   1yODoP4HtC7HNILT2yS41XuLlkdG6OtZNWdzwtjKi92S1YKj8xIMeMkBI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401223804"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="401223804"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853977801"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="853977801"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 16:01:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS3nu-0003Af-0P;
	Fri, 04 Aug 2023 23:01:54 +0000
Date: Sat, 5 Aug 2023 07:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Yejian <zhengyejian1@huawei.com>, rostedt@goodmis.org,
	mhiramat@kernel.org, vnagarnaik@google.com, shuah@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tracing: Fix cpu buffers unavailable due to
 'record_disabled' messed
Message-ID: <202308050601.nsx7Z4CY-lkp@intel.com>
References: <20230804124549.2562977-2-zhengyejian1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804124549.2562977-2-zhengyejian1@huawei.com>

Hi Zheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on rostedt-trace/for-next v6.5-rc4 next-20230804]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Yejian/tracing-Fix-cpu-buffers-unavailable-due-to-record_disabled-messed/20230804-204751
base:   linus/master
patch link:    https://lore.kernel.org/r/20230804124549.2562977-2-zhengyejian1%40huawei.com
patch subject: [PATCH 1/2] tracing: Fix cpu buffers unavailable due to 'record_disabled' messed
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230805/202308050601.nsx7Z4CY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050601.nsx7Z4CY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050601.nsx7Z4CY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'tracing_set_cpumask':
>> kernel/trace/trace.c:5280:60: error: 'struct trace_array' has no member named 'max_buffer'; did you mean 'array_buffer'?
    5280 |                         ring_buffer_record_disable_cpu(tr->max_buffer.buffer, cpu);
         |                                                            ^~~~~~~~~~
         |                                                            array_buffer
   kernel/trace/trace.c:5286:59: error: 'struct trace_array' has no member named 'max_buffer'; did you mean 'array_buffer'?
    5286 |                         ring_buffer_record_enable_cpu(tr->max_buffer.buffer, cpu);
         |                                                           ^~~~~~~~~~
         |                                                           array_buffer


vim +5280 kernel/trace/trace.c

  5260	
  5261	int tracing_set_cpumask(struct trace_array *tr,
  5262				cpumask_var_t tracing_cpumask_new)
  5263	{
  5264		int cpu;
  5265	
  5266		if (!tr)
  5267			return -EINVAL;
  5268	
  5269		local_irq_disable();
  5270		arch_spin_lock(&tr->max_lock);
  5271		for_each_tracing_cpu(cpu) {
  5272			/*
  5273			 * Increase/decrease the disabled counter if we are
  5274			 * about to flip a bit in the cpumask:
  5275			 */
  5276			if (cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
  5277					!cpumask_test_cpu(cpu, tracing_cpumask_new)) {
  5278				atomic_inc(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
  5279				ring_buffer_record_disable_cpu(tr->array_buffer.buffer, cpu);
> 5280				ring_buffer_record_disable_cpu(tr->max_buffer.buffer, cpu);
  5281			}
  5282			if (!cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
  5283					cpumask_test_cpu(cpu, tracing_cpumask_new)) {
  5284				atomic_dec(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
  5285				ring_buffer_record_enable_cpu(tr->array_buffer.buffer, cpu);
  5286				ring_buffer_record_enable_cpu(tr->max_buffer.buffer, cpu);
  5287			}
  5288		}
  5289		arch_spin_unlock(&tr->max_lock);
  5290		local_irq_enable();
  5291	
  5292		cpumask_copy(tr->tracing_cpumask, tracing_cpumask_new);
  5293	
  5294		return 0;
  5295	}
  5296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
