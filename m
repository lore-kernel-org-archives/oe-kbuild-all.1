Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4918DDAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 04:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpSBDMId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702699988; x=1734235988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LmI/S8V6mA9hG+wIBl7uJCDqj/JYOAakrqXZAAVPnCY=;
  b=RpSBDMIdybkmALzYefGYfj1SvGCYEiox6Zx+SRcgNxcb4Pc2hL88yU5J
   vT8YsN5sUK1i9opyJeWQLzmBwb21KJ9+2wg9eAQClEb90hMmiZW5wyKih
   A4WQXzCVnm2rJUgOtz3px3ZYg3TuyISiQawkZFnks8QxezH6zhlqsD5tF
   VSz+WoRmgNpKk8exsrqo0R67OCUMcHT4pShXcCo2cGYONKjmiEXFIqCXs
   WLGUFopXahTxO7c9zlEToBUZKJF1Z79snD9BThI3PrRTwRwYADsEho7lW
   ov5v/VDuXk39UtunebcVS4t++q3QUJX1mY0zgVNGdhxsrBgDMJzai1Pub
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="459683136"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="459683136"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 20:13:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="768214712"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="768214712"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Dec 2023 20:13:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEM2s-00019E-1f;
	Sat, 16 Dec 2023 04:12:58 +0000
Date: Sat, 16 Dec 2023 12:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Cong Wang <xiyou.wangcong@gmail.com>, Hao Luo <haoluo@google.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Ronak Doshi <doshir@vmware.com>, Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: Re: [PATCH net-next 15/24] net: Use nested-BH locking for XDP
 redirect.
Message-ID: <202312161103.iKeGoacH-lkp@intel.com>
References: <20231215171020.687342-16-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215171020.687342-16-bigeasy@linutronix.de>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/locking-local_lock-Introduce-guard-definition-for-local_lock/20231216-011911
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231215171020.687342-16-bigeasy%40linutronix.de
patch subject: [PATCH net-next 15/24] net: Use nested-BH locking for XDP redirect.
config: x86_64-randconfig-122-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161103.iKeGoacH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161103.iKeGoacH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161103.iKeGoacH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/sched/cls_api.c:391:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] protocol @@     got unsigned int [usertype] protocol @@
   net/sched/cls_api.c:391:22: sparse:     expected restricted __be16 [usertype] protocol
   net/sched/cls_api.c:391:22: sparse:     got unsigned int [usertype] protocol
   net/sched/cls_api.c:1862:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/sched/cls_api.c:1862:16: sparse:    struct tcf_proto *
   net/sched/cls_api.c:1862:16: sparse:    struct tcf_proto [noderef] __rcu *
   net/sched/cls_api.c:1962:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/sched/cls_api.c:1962:20: sparse:    struct tcf_proto [noderef] __rcu *
   net/sched/cls_api.c:1962:20: sparse:    struct tcf_proto *
   net/sched/cls_api.c:1924:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/sched/cls_api.c:1924:25: sparse:    struct tcf_proto [noderef] __rcu *
   net/sched/cls_api.c:1924:25: sparse:    struct tcf_proto *
   net/sched/cls_api.c:1944:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/sched/cls_api.c:1944:16: sparse:    struct tcf_proto *
   net/sched/cls_api.c:1944:16: sparse:    struct tcf_proto [noderef] __rcu *
   net/sched/cls_api.c:2010:25: sparse: sparse: restricted __be16 degrades to integer
   net/sched/cls_api.c:2697:50: sparse: sparse: restricted __be16 degrades to integer
>> net/sched/cls_api.c:3933:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct local_lock_t [usertype] *l @@     got struct local_lock_t [noderef] __percpu * @@
   net/sched/cls_api.c:3933:38: sparse:     expected struct local_lock_t [usertype] *l
   net/sched/cls_api.c:3933:38: sparse:     got struct local_lock_t [noderef] __percpu *
   net/sched/cls_api.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/local_lock.h:71:1: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_lock_t [usertype] * @@
   include/linux/local_lock.h:71:1: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/local_lock.h:71:1: sparse:     got struct local_lock_t [usertype] *

vim +3933 net/sched/cls_api.c

  3921	
  3922	struct sk_buff *tcf_qevent_handle(struct tcf_qevent *qe, struct Qdisc *sch, struct sk_buff *skb,
  3923					  struct sk_buff **to_free, int *ret)
  3924	{
  3925		struct tcf_result cl_res;
  3926		struct tcf_proto *fl;
  3927	
  3928		if (!qe->info.block_index)
  3929			return skb;
  3930	
  3931		fl = rcu_dereference_bh(qe->filter_chain);
  3932	
> 3933		guard(local_lock_nested_bh)(&bpf_run_lock.redirect_lock);
  3934		switch (tcf_classify(skb, NULL, fl, &cl_res, false)) {
  3935		case TC_ACT_SHOT:
  3936			qdisc_qstats_drop(sch);
  3937			__qdisc_drop(skb, to_free);
  3938			*ret = __NET_XMIT_BYPASS;
  3939			return NULL;
  3940		case TC_ACT_STOLEN:
  3941		case TC_ACT_QUEUED:
  3942		case TC_ACT_TRAP:
  3943			__qdisc_drop(skb, to_free);
  3944			*ret = __NET_XMIT_STOLEN;
  3945			return NULL;
  3946		case TC_ACT_REDIRECT:
  3947			skb_do_redirect(skb);
  3948			*ret = __NET_XMIT_STOLEN;
  3949			return NULL;
  3950		}
  3951	
  3952		return skb;
  3953	}
  3954	EXPORT_SYMBOL(tcf_qevent_handle);
  3955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
