Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77BF156C7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 19:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683230101; x=1714766101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHMwykKJJ0AUDriL0ZkioB83pxZqHo6Z5Lhp6wGA1Xc=;
  b=LImTkz+oIX9mO6Wkkvo2s9OesuuJHi/QZX1E8tpogpTcieK08fij8Ul2
   PaCDSrTtt3ymsKTU/htpl7mxDRQZ7PtScbULSIcFi8YRzdxnodlke9sj0
   jIPVehGC6A/HZPAE7YInFvCPicyY4HJME/YZFQDKMQmwj+1UXvwKzDfEW
   sNBnZVgUXnRXjfyWMETt0Vc6gGzgtEpQxgGDo2Fqc4/uNSwMYgV7f0OCm
   KEEa708yM3btwvstv6JEZsc8ZKXi6dOC1E8qamvEyRpqYd0qESzASSnIP
   U0rtttk+YnJ8a2nlvDKgN3u70Ayti2xNwKRBLc31sP8UI3vo+LulFr/C5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="329403775"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="329403775"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 12:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="647490872"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="647490872"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 May 2023 12:54:51 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puf2Q-00007A-2j;
	Thu, 04 May 2023 19:54:50 +0000
Date: Fri, 5 May 2023 03:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx2 2/5] net/core/dev.c:3951:36: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202305050359.puwtj8Mw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   b69ee9c2b86789b9b26c3f833a3327d17a35f37c
commit: abe11a7d6ecffb6402a53bf8b0bd0fc113b916e9 [2/5] bpf: Add generic attach/detach/query API for multi-progs
config: arc-randconfig-s043-20230430 (https://download.01.org/0day-ci/archive/20230505/202305050359.puwtj8Mw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/cilium/linux/commit/abe11a7d6ecffb6402a53bf8b0bd0fc113b916e9
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout abe11a7d6ecffb6402a53bf8b0bd0fc113b916e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash net/core/ net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050359.puwtj8Mw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3314:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3314:23: sparse:     got unsigned int
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3314:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3314:23: sparse:     got unsigned int
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __wsum @@
   net/core/dev.c:3314:23: sparse:     expected unsigned int [usertype] val
   net/core/dev.c:3314:23: sparse:     got restricted __wsum
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3314:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3314:23: sparse:     got unsigned int
   net/core/dev.c:3314:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3314:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3314:23: sparse:     got unsigned int
   net/core/dev.c:3314:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3314:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3314:23: sparse:     got unsigned int
   net/core/dev.c:3314:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c:3314:23: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int @@
   net/core/dev.c:3314:23: sparse:     expected restricted __wsum [usertype] csum
   net/core/dev.c:3314:23: sparse:     got unsigned int
   net/core/dev.c:3314:23: sparse: sparse: cast from restricted __wsum
>> net/core/dev.c:3951:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> net/core/dev.c:3951:36: sparse:    struct mini_Qdisc [noderef] __rcu *
>> net/core/dev.c:3951:36: sparse:    struct mini_Qdisc *
   net/core/dev.c:411:33: sparse: sparse: context imbalance in 'unlist_netdevice' - different lock contexts for basic block
   net/core/dev.c: note: in included file (through include/net/checksum.h, include/linux/skbuff.h, include/linux/if_ether.h):
   arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:27:36: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:29:11: sparse: sparse: bad assignment (-=) to restricted __wsum
   arch/arc/include/asm/checksum.h:30:16: sparse: sparse: restricted __wsum degrades to integer
   arch/arc/include/asm/checksum.h:30:18: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __sum16 @@     got unsigned int @@
   arch/arc/include/asm/checksum.h:30:18: sparse:     expected restricted __sum16
   arch/arc/include/asm/checksum.h:30:18: sparse:     got unsigned int
   net/core/dev.c:3817:17: sparse: sparse: context imbalance in '__dev_queue_xmit' - different lock contexts for basic block
   net/core/dev.c:5190:17: sparse: sparse: context imbalance in 'net_tx_action' - different lock contexts for basic block
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
https://github.com/intel/lkp-tests
