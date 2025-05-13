Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79B219E7F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747102195; cv=none; b=a+5OokPD0tC1vzfQt95ekxqBOpOaN88ew5YqodrUS4v1jsy5OedSrTNstrTfaXLqDJrRLzg62uOZmyNFbKwyS9+glNw0fCo8v2yHTRPFJ/j/XXemRgIH5oYY8v3xs34gb06lozNMg/FDBdLPayAZUeFJFTOO4wrebMLv/D503oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747102195; c=relaxed/simple;
	bh=+lVc8N/JwDKR24RkXugAjVTzdJLL/O4z+PPwqklSK3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfI3WDhhvb35Dci+4J41vqYlfst+4w9SbRk28h0COVqTbHkhIzQPQtV4l4fGDnl288yR/Tlg29NvzVa6tEJY2A/5YadOlP+ws+c1nnmgRlyNgasuL/3NiJ/j43oa0/aLx9M3TxRl403j3o88X7hrtPY+GQdOhqdezAjXw2HXOmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf2biDOj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf2biDOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747102193; x=1778638193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lVc8N/JwDKR24RkXugAjVTzdJLL/O4z+PPwqklSK3U=;
  b=Zf2biDOjcX2CN9sx5mpBmBBKjPd3OKJXgv+VOFzcHy1lB+p6Bs7RFZhL
   VEtrkQtet1YS1LkOhKl1D1PcH9ue/iPI+1fsexvE34eMvN4z+O+ZTsdvs
   4SAPIr3nj2P5x9K0HRMTIP86VmyqVNgR180b97U4CYmlzfN/F8v5Xzju4
   Ea1nqE/NNxxSIoT5m2vswmSkx1JTzJPspL9okevkLjHkrOHg2AgiiweTo
   Y1o5wxfEpNNBdW2Yatdr9Tx0xQEZro98mTJb+6cKdnG7cGFjMum8rIO4+
   oyOqqTE4FwpXGtyg93ai+942VsBhLTDi+qAq5n0iCmGawsnQ4mn6N3qBN
   g==;
X-CSE-ConnectionGUID: bWv7A9h/RLKYmCtcLmJTDQ==
X-CSE-MsgGUID: LuqWADkRTDi+aVtr+bJAcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59929218"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="59929218"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 19:09:53 -0700
X-CSE-ConnectionGUID: 0Ft2YmxrTTGnr3HGLa3fJg==
X-CSE-MsgGUID: sfYil5dkQoiwusUQATsTYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="168642028"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2025 19:09:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEf5Z-000Faa-2s;
	Tue, 13 May 2025 02:09:49 +0000
Date: Tue, 13 May 2025 10:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220] kernel/sched/fair.c:8325:9: error:
 call to undeclared function 'sched_idle_cpu'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202505131239.WbFmKdYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e1106320058bf1d983657f80490249b4f919ebad
commit: 926b9b0cd97e640ee680347cf449c3dc152dddd2 [2220/2220] sched: Throttle qos cfs_rq when current cpu is running online task
config: x86_64-randconfig-122-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131239.WbFmKdYn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131239.WbFmKdYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131239.WbFmKdYn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:27:
   In file included from include/linux/mm_api.h:1:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/fair.c:8325:9: error: call to undeclared function 'sched_idle_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8325 |                      !sched_idle_cpu(smp_processor_id()) &&
         |                       ^
   kernel/sched/fair.c:8325:9: note: did you mean 'sched_idle_rq'?
   kernel/sched/fair.c:6517:12: note: 'sched_idle_rq' declared here
    6517 | static int sched_idle_rq(struct rq *rq)
         |            ^
>> kernel/sched/fair.c:8328:23: error: no member named 'online' in 'struct rq'
    8328 |                 if (!rq_of(cfs_rq)->online)
         |                      ~~~~~~~~~~~~~  ^
>> kernel/sched/fair.c:8531:7: error: no member named 'idle_stamp' in 'struct rq'; did you mean 'idle_state'?
    8531 |                 rq->idle_stamp = 0;
         |                     ^~~~~~~~~~
         |                     idle_state
   kernel/sched/sched.h:1143:24: note: 'idle_state' declared here
    1143 |         struct cpuidle_state    *idle_state;
         |                                  ^
   1 warning and 3 errors generated.


vim +/sched_idle_cpu +8325 kernel/sched/fair.c

  8321	
  8322	static bool check_qos_cfs_rq(struct cfs_rq *cfs_rq)
  8323	{
  8324		if (unlikely(cfs_rq && cfs_rq->tg->qos_level < 0 &&
> 8325			     !sched_idle_cpu(smp_processor_id()) &&
  8326			     cfs_rq->h_nr_running == cfs_rq->idle_h_nr_running)) {
  8327	
> 8328			if (!rq_of(cfs_rq)->online)
  8329				return false;
  8330	
  8331			throttle_qos_cfs_rq(cfs_rq);
  8332			return true;
  8333		}
  8334	
  8335		return false;
  8336	}
  8337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
