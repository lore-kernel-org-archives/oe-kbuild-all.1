Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871471D2A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685107474; x=1716643474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcB3x5PHPrDINGNW3frGOwJDWFqu0LBLYPQb/sE06mo=;
  b=H2VAmgRjSY1qTw5JtQBqevah3aABu/Mq3MXOUVrqgn16Jh17AR483dZf
   ygXkmXhihF4Ig1j+HLwClr5d+KDd7N0uK21HPwmzve0YDLJdOz+dgTxL4
   tqsKotW/vc7otCUkHp11umL7lZ+IE7wYboIjojGDvMgH5pP1rWP4MLwZm
   KkjBS4DtfHAW7/vHNNxFn1Q0kVNtgRLs4HMyZvkCnx2RgZgxeXD843KPZ
   Z3R9JDb8TyCkU6LDf0irxFU6MO+WeCHB/wBijtxiurvfde2y0GMNduEAx
   1zE8BlnksDEbCF8sWdeYQRknQPocnkOeEZ+5lQEtUcqt73jZ0HbYjjJJ7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440553251"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="440553251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 06:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795089245"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="795089245"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 May 2023 06:24:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2XQl-000JMU-2i;
	Fri, 26 May 2023 13:24:31 +0000
Date: Fri, 26 May 2023 21:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/new-api-tcx3 19/24] net/core/dev.c:3951:36: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202305262140.RFSrTJ0D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx3
head:   4b72f355d107cb149df94b8a1aa598c0f98b53fe
commit: 308781151cd58206e9c061dffb70f2d5edb05e8b [19/24] bpf: Add generic attach/detach/query API for multi-progs
config: i386-randconfig-s001-20230525 (https://download.01.org/0day-ci/archive/20230526/202305262140.RFSrTJ0D-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/cilium/linux/commit/308781151cd58206e9c061dffb70f2d5edb05e8b
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx3
        git checkout 308781151cd58206e9c061dffb70f2d5edb05e8b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash net/core/ net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305262140.RFSrTJ0D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3314:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3314:23: sparse:     got unsigned int
   net/core/dev.c:3314:23: sparse: sparse: cast from restricted __wsum
>> net/core/dev.c:3951:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> net/core/dev.c:3951:36: sparse:    struct mini_Qdisc [noderef] __rcu *
>> net/core/dev.c:3951:36: sparse:    struct mini_Qdisc *
   net/core/dev.c:202:9: sparse: sparse: context imbalance in 'unlist_netdevice' - different lock contexts for basic block
   net/core/dev.c:3817:17: sparse: sparse: context imbalance in '__dev_queue_xmit' - different lock contexts for basic block
   net/core/dev.c:5188:17: sparse: sparse: context imbalance in 'net_tx_action' - different lock contexts for basic block
--
>> net/sched/sch_ingress.c:91:57: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct mini_Qdisc [noderef] __rcu **p_miniq @@     got struct mini_Qdisc ** @@
   net/sched/sch_ingress.c:91:57: sparse:     expected struct mini_Qdisc [noderef] __rcu **p_miniq
   net/sched/sch_ingress.c:91:57: sparse:     got struct mini_Qdisc **
   net/sched/sch_ingress.c:243:65: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct mini_Qdisc [noderef] __rcu **p_miniq @@     got struct mini_Qdisc ** @@
   net/sched/sch_ingress.c:243:65: sparse:     expected struct mini_Qdisc [noderef] __rcu **p_miniq
   net/sched/sch_ingress.c:243:65: sparse:     got struct mini_Qdisc **
   net/sched/sch_ingress.c:261:64: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct mini_Qdisc [noderef] __rcu **p_miniq @@     got struct mini_Qdisc ** @@
   net/sched/sch_ingress.c:261:64: sparse:     expected struct mini_Qdisc [noderef] __rcu **p_miniq
   net/sched/sch_ingress.c:261:64: sparse:     got struct mini_Qdisc **

vim +3951 net/core/dev.c

  3945	
  3946	#ifdef CONFIG_NET_XGRESS
  3947	static int tc_run(struct tcx_entry *entry, struct sk_buff *skb)
  3948	{
  3949		int ret = TC_ACT_UNSPEC;
  3950	#ifdef CONFIG_NET_CLS_ACT
> 3951		struct mini_Qdisc *miniq = rcu_dereference_bh(entry->miniq);
  3952		struct tcf_result res;
  3953	
  3954		if (!miniq)
  3955			return ret;
  3956	
  3957		tc_skb_cb(skb)->mru = 0;
  3958		tc_skb_cb(skb)->post_ct = false;
  3959	
  3960		mini_qdisc_bstats_cpu_update(miniq, skb);
  3961		ret = tcf_classify(skb, miniq->block, miniq->filter_list, &res, false);
  3962		/* Only tcf related quirks below. */
  3963		switch (ret) {
  3964		case TC_ACT_SHOT:
  3965			mini_qdisc_qstats_cpu_drop(miniq);
  3966			break;
  3967		case TC_ACT_OK:
  3968		case TC_ACT_RECLASSIFY:
  3969			skb->tc_index = TC_H_MIN(res.classid);
  3970			break;
  3971		}
  3972	#endif /* CONFIG_NET_CLS_ACT */
  3973		return ret;
  3974	}
  3975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
