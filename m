Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D0C17EE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694298658; x=1725834658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8q2zbZgMrV+OYr0oeU8KMG4l/HZmi19lynOw1U2yUWY=;
  b=Ibhc6PPiKSHxlSLSfwCr3qSbaKk5/wj4seoRoSDpD8fRb9P2V2INlEzJ
   12D+3dj+l11lxG/4xw2pNfKZilBOogw4UqHRFJnQ7lfD8yRutC/vkfy8T
   6+GZgNyMQXLSvYTsVbYFhX9C49f8escvLIZsCfyUMH9715IUqyD6p1pwp
   wCVZnC6GRFQmWlKEDcxcaBkCMw3MVIMmBvHX4JKhsyWErsbkOzQ4px/H4
   WwUSWEwMURYaPCibTIu8FvNh5043VVFMQXXvZhEzdURyKEUhxbpGm3Tf4
   FCZSdM9p4Ip5feZF1rcFzJ37S9/NVJVbO3ugIFSBGUIwh+XQNL+CX7v97
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380573125"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="380573125"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 15:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989640801"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="989640801"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2023 15:30:51 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf6TZ-00040O-32;
	Sat, 09 Sep 2023 22:30:49 +0000
Date: Sun, 10 Sep 2023 06:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC ipsec-next 3/3] xfrm: policy: replace session decode with
 flow dissector
Message-ID: <202309100600.3zBVGQIA-lkp@intel.com>
References: <20230908120628.26164-4-fw@strlen.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908120628.26164-4-fw@strlen.de>

Hi Florian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec/master]
[also build test WARNING on net/main net-next/main linus/master next-20230908]
[cannot apply to klassert-ipsec-next/master horms-ipvs/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/xfrm-move-mark-and-oif-flowi-decode-into-common-code/20230908-201709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git master
patch link:    https://lore.kernel.org/r/20230908120628.26164-4-fw%40strlen.de
patch subject: [RFC ipsec-next 3/3] xfrm: policy: replace session decode with flow dissector
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100600.3zBVGQIA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100600.3zBVGQIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100600.3zBVGQIA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/xfrm/xfrm_policy.c:1325:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head *odst @@     got struct hlist_head [noderef] __rcu *table @@
   net/xfrm/xfrm_policy.c:1325:22: sparse:     expected struct hlist_head *odst
   net/xfrm/xfrm_policy.c:1325:22: sparse:     got struct hlist_head [noderef] __rcu *table
>> net/xfrm/xfrm_policy.c:3440:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] flowlabel @@     got unsigned int const [usertype] flow_label @@
   net/xfrm/xfrm_policy.c:3440:24: sparse:     expected restricted __be32 [usertype] flowlabel
   net/xfrm/xfrm_policy.c:3440:24: sparse:     got unsigned int const [usertype] flow_label
   net/xfrm/xfrm_policy.c:3956:43: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/xfrm/xfrm_policy.c:3956:43: sparse:    struct xfrm_policy_afinfo const [noderef] __rcu *
   net/xfrm/xfrm_policy.c:3956:43: sparse:    struct xfrm_policy_afinfo const *
   net/xfrm/xfrm_policy.c:4046:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *table @@     got struct hlist_head * @@
   net/xfrm/xfrm_policy.c:4046:29: sparse:     expected struct hlist_head [noderef] __rcu *table
   net/xfrm/xfrm_policy.c:4046:29: sparse:     got struct hlist_head *
   net/xfrm/xfrm_policy.c:4073:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *table @@
   net/xfrm/xfrm_policy.c:4073:36: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_policy.c:4073:36: sparse:     got struct hlist_head [noderef] __rcu *table
   net/xfrm/xfrm_policy.c:4101:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu *table @@
   net/xfrm/xfrm_policy.c:4101:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_policy.c:4101:17: sparse:     got struct hlist_head [noderef] __rcu *table
   net/xfrm/xfrm_policy.c:4102:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *table @@
   net/xfrm/xfrm_policy.c:4102:36: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_policy.c:4102:36: sparse:     got struct hlist_head [noderef] __rcu *table
   net/xfrm/xfrm_policy.c:262:9: sparse: sparse: context imbalance in 'xfrm_policy_get_afinfo' - different lock contexts for basic block
   net/xfrm/xfrm_policy.c:283:9: sparse: sparse: context imbalance in '__xfrm_dst_lookup' - unexpected unlock
   net/xfrm/xfrm_policy.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +3440 net/xfrm/xfrm_policy.c

  3418	
  3419	#if IS_ENABLED(CONFIG_IPV6)
  3420	static void
  3421	decode_session6(const struct xfrm_flow_keys *flkeys, struct flowi *fl, bool reverse)
  3422	{
  3423		struct flowi6 *fl6 = &fl->u.ip6;
  3424	
  3425		memset(fl6, 0, sizeof(struct flowi6));
  3426	
  3427		if (reverse) {
  3428			fl6->saddr = flkeys->addrs.ipv6.dst;
  3429			fl6->daddr = flkeys->addrs.ipv6.src;
  3430			fl6->fl6_sport = flkeys->ports.dst;
  3431			fl6->fl6_dport = flkeys->ports.src;
  3432		} else {
  3433			fl6->saddr = flkeys->addrs.ipv6.src;
  3434			fl6->daddr = flkeys->addrs.ipv6.dst;
  3435			fl6->fl6_sport = flkeys->ports.src;
  3436			fl6->fl6_dport = flkeys->ports.dst;
  3437		}
  3438	
  3439		fl6->flowi6_proto = flkeys->basic.ip_proto;
> 3440		fl6->flowlabel = flkeys->tags.flow_label;
  3441	
  3442		fl6->fl6_icmp_type = flkeys->icmp.type;
  3443		fl6->fl6_icmp_type = flkeys->icmp.code;
  3444		fl6->fl6_gre_key = flkeys->gre.keyid;
  3445		fl6->fl6_mh_type = flkeys->ipv6mh.mh_type;
  3446	}
  3447	#endif
  3448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
