Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B433079FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 05:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710135400; cv=none; b=SDXNtM9IdRmSac8QZLbkfu6UIPdUNwcTzj2e0+Xg5DfBGa+iJATR2kz4d+Dku0cSSxxsXLlje53q8TImJaJNyZUufKvL2VdYZ5GKmIiRm7HxfMjaFCuoQ61PKlU+Wv4hdGkSIqk5PH+92zCib3V5n7iO+z43/yFTwJvPEGzOx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710135400; c=relaxed/simple;
	bh=tlz+1P1SFrxPae5frXB+Zga/IJvt/5DEZvEqg/lmYYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+m5Wf58OUsmckixqLa408WUjV0uROq138AqGl2M+ZXenVNxtkqi9NKC5NuOPfC40EWZfY46XXN55DNUU6agyBDaB/MbDVESXO70JhyOwDUlHoKtEV6D/tMJ9MvWISzFkNoy8leMzmCZ0Zw1JlLaJpzuaonob43ggHDQvo3yoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvn7sZp/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvn7sZp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710135399; x=1741671399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tlz+1P1SFrxPae5frXB+Zga/IJvt/5DEZvEqg/lmYYc=;
  b=cvn7sZp/bLPV6UWgEEJO6P1vTYQJDsLY3tHOWOH85YFph2MQ7/Jmm8k6
   9ePr4wYlFA9JGDJxe3T0R9NwXl+Kmz94F3bl3FetIpby0OII0F/tWouUp
   4BnCE5/DD/FQKC7ceDqfI9SwWjTg++6pP22KDQcAGSxed3rSFdmG3yPT3
   yGPWFEEOiLj2LDrnsU1BjXjJ6byg7zEKVPLSOdFpAa8FXf0PDF3YyDN4s
   cQ2z/9J11ZTd455Rn2/NO0bS+PJszb3+D6GT4GQxgc5JvqGoyDftipw54
   87YWz08yn2Po19XvUuxBjs3ZlwXPOPkwbjU/C4fvDmexYYfxtSVnWPV5k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22304060"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="22304060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 22:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="34187823"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2024 22:36:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjYKs-0008vn-1V;
	Mon, 11 Mar 2024 05:36:30 +0000
Date: Mon, 11 Mar 2024 13:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26634/27506]
 kernel/sched/fair.c:6972:28: warning: 'get_exp_reclaim_task' defined but not
 used
Message-ID: <202403111320.I7m1Jmpo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: ccae92c345b515d8124a565b3cb5cc7b5df9c691 [26634/27506] rue/mm: memory expedite reclaim mechanism for memory QoS
config: arm64-randconfig-001-20240305 (https://download.01.org/0day-ci/archive/20240311/202403111320.I7m1Jmpo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111320.I7m1Jmpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111320.I7m1Jmpo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:5254:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5254 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10764:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   10764 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10766:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   10766 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10771:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   10771 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10773:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   10773 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:6972:28: warning: 'get_exp_reclaim_task' defined but not used [-Wunused-function]
    6972 | static struct task_struct *get_exp_reclaim_task(struct rq *rq,
         |                            ^~~~~~~~~~~~~~~~~~~~


vim +/get_exp_reclaim_task +6972 kernel/sched/fair.c

  6963	
  6964	#ifdef CONFIG_MEMCG
  6965	extern int sysctl_vm_memory_qos;
  6966	/*
  6967	 * Try to get the expedited reclaim task
  6968	 *
  6969	 * If there is any eligible task, return the task_struct that want to
  6970	 * be expedited reclaim. Otherwise return NULL.
  6971	 */
> 6972	static struct task_struct *get_exp_reclaim_task(struct rq *rq,
  6973							struct task_struct *prev)
  6974	{
  6975		struct cfs_rq *exp_cfs_rq;
  6976		struct task_struct *p, *exp_task;
  6977	
  6978		p = NULL;
  6979		/* Iterate the tasks that want to be expedited relcaimed */
  6980		list_for_each_entry(exp_task, &rq->exp_reclaim_list,
  6981				    se.exp_reclaim_node) {
  6982			exp_cfs_rq = task_cfs_rq(exp_task);
  6983			/* Skip the throtted cfs_rq */
  6984			if (!throttled_hierarchy(exp_cfs_rq)) {
  6985				p = exp_task;
  6986				break;
  6987			}
  6988		}
  6989	
  6990		if (p) {
  6991			struct sched_entity *se;
  6992	
  6993			list_del_init(&p->se.exp_reclaim_node);
  6994			put_prev_task(rq, prev);
  6995	
  6996			/* Iterate tg's hierarchy */
  6997			se = &p->se;
  6998			while (se) {
  6999				set_next_entity(cfs_rq_of(se), se);
  7000				se = parent_entity(se);
  7001			}
  7002		}
  7003	
  7004		return p;
  7005	}
  7006	#endif
  7007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
