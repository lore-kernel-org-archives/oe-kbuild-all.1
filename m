Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3EA38DE7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695219026; x=1726755026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kj9yYPGieMVuU1ZuijbCmk8Rp7eudBlmF0uFamPDwOo=;
  b=XHGWk/oCU5lo89UA6cu5Cs+X88vSd9XUNLqm4QWe2F1g5ISQBcoNTluw
   9NdUqfvfNbbg9/Su0NQAVqnSiiWxf9Z694cHyfo/+liNwXaeaf9UFE3cq
   Y3ALNZTR11V8uHOOjA4e+YYYBHfqX9i26ClNf/wYeehcZQ/7p+NDl9VD9
   erabDx4joOqwguVqQe2MFSEMuVikAWSG1FnOe7mHhYutqLCPOclwc+bNs
   GxvumkeX6DyBHd9Ecs/AQ8xYPRVQgAY7sbQe/6C5IbIi1rKTYERIsxQQL
   hx1SuhkCm/wqlCn9F2XYjLFkV1wqA4e/VLwtNIWJ3+s5itJCYiUL1ngCr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360489087"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="360489087"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816919465"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816919465"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2023 07:10:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qixuG-0008o6-0z;
	Wed, 20 Sep 2023 14:10:20 +0000
Date: Wed, 20 Sep 2023 22:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Willem de Bruijn <willemb@google.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org, eric.dumazet@gmail.com,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next 3/4] net_sched: sch_fq: add fast path for mostly
 idle qdisc
Message-ID: <202309202157.1I3oSZoS-lkp@intel.com>
References: <20230920125418.3675569-4-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920125418.3675569-4-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net_sched-sch_fq-struct-sched_data-reorg/20230920-205744
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230920125418.3675569-4-edumazet%40google.com
patch subject: [PATCH net-next 3/4] net_sched: sch_fq: add fast path for mostly idle qdisc
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309202157.1I3oSZoS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202157.1I3oSZoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202157.1I3oSZoS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/sch_fq.c: In function 'fq_enqueue':
>> net/sched/sch_fq.c:550:1: warning: label 'queue' defined but not used [-Wunused-label]
     550 | queue:
         | ^~~~~


vim +/queue +550 net/sched/sch_fq.c

   505	
   506	
   507	static int fq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
   508			      struct sk_buff **to_free)
   509	{
   510		struct fq_sched_data *q = qdisc_priv(sch);
   511		struct fq_flow *f;
   512	
   513		if (unlikely(sch->q.qlen >= sch->limit))
   514			return qdisc_drop(skb, sch, to_free);
   515	
   516		q->ktime_cache = ktime_get_ns();
   517		if (!skb->tstamp) {
   518			fq_skb_cb(skb)->time_to_send = q->ktime_cache;
   519		} else {
   520			/* Check if packet timestamp is too far in the future. */
   521			if (fq_packet_beyond_horizon(skb, q)) {
   522				if (q->horizon_drop) {
   523						q->stat_horizon_drops++;
   524						return qdisc_drop(skb, sch, to_free);
   525				}
   526				q->stat_horizon_caps++;
   527				skb->tstamp = q->ktime_cache + q->horizon;
   528			}
   529			fq_skb_cb(skb)->time_to_send = skb->tstamp;
   530		}
   531	
   532		f = fq_classify(sch, skb);
   533		if (unlikely(f->qlen >= q->flow_plimit && f != &q->internal)) {
   534			q->stat_flows_plimit++;
   535			return qdisc_drop(skb, sch, to_free);
   536		}
   537	
   538		if (fq_flow_is_detached(f)) {
   539			fq_flow_add_tail(&q->new_flows, f);
   540			if (time_after(jiffies, f->age + q->flow_refill_delay))
   541				f->credit = max_t(u32, f->credit, q->quantum);
   542		}
   543	
   544		if (unlikely(f == &q->internal)) {
   545			q->stat_internal_packets++;
   546		} else {
   547			if (f->qlen == 0)
   548				q->inactive_flows--;
   549		}
 > 550	queue:
   551		f->qlen++;
   552		/* Note: this overwrites f->age */
   553		flow_queue_add(f, skb);
   554	
   555		qdisc_qstats_backlog_inc(sch, skb);
   556		sch->q.qlen++;
   557	
   558		return NET_XMIT_SUCCESS;
   559	}
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
