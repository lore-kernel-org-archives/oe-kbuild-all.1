Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22A19A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754487280; cv=none; b=aUNFa2dzabCQFGKanSkLr+vGNTUyeapAP4FP8SKHv0ZjE+aQ1qFVjrguurZ9kQRLJbigIOsDQPk/vAx6lc9Abl17hYvRSu7RKsW5u55zUPO29NMacEVIqd8rv7vQFGz3LFp5otUGZF+aiHeyhYLaMMeVM+acelj4wEBnaNx2uOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754487280; c=relaxed/simple;
	bh=Czf6StZ+CnsDIidYj5H7+suy+OKFhbB1Zp30jVBkyV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNF7cPnMZ8PE9Lq5WrgV4x5lYbAKc+wID1kJRXN1IftzeY06vbpiIBq81h/bfFNqZi/CKZUvpI7/0XOebeTuxIB5GOqXKLFJcD951ihMlsP4rLj0GYa3iDRuAm3Fym6MygmdAtgyiY6U4DsZud0nTVr0lqpBIvEFA3g3kIaw7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyvO7eIu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyvO7eIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754487279; x=1786023279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Czf6StZ+CnsDIidYj5H7+suy+OKFhbB1Zp30jVBkyV0=;
  b=DyvO7eIuotXF43MiWdCgm2F7388ciZJ/RtjI4dcdKlQe5gP6IAKhcOO/
   HHAluEktLw3WcKM1b5UWm00RqIjRXWUG32EW+yIN97IYwuy1uHAsLOCC0
   9eh0aT40ncVDlaI1t0VvNX2EFoXHzpUjJSq4spLe6KAtWCyuqOs9o3xrW
   PEMi2E65DA7GYZDhqcZj9Ye+IAVIdTYxTXXjTpOEM1ZklrS6NMOpHfbky
   5KAXw5G7POlNT3xaf3nK6VilcVbZmwYRg5vbWqRASZWIngN+nUyHj4RLp
   +xaacshiuUI0bTULol5iJ0lzPrQ/OBQLwwEwE+eoG1Zln+28ONbRh82kl
   Q==;
X-CSE-ConnectionGUID: QiWx7TeSTmyloW4jnKmu/g==
X-CSE-MsgGUID: sJ3+ZJq9Rq6VcMdhPVGHsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74263220"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74263220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 06:34:01 -0700
X-CSE-ConnectionGUID: ugpz2gcSSi+QnMukkR15uw==
X-CSE-MsgGUID: ZXUVOtFERCi73+mBLMMVaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164789065"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 06:33:59 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujeHF-0002Ct-2Q;
	Wed, 06 Aug 2025 13:33:57 +0000
Date: Wed, 6 Aug 2025 15:33:46 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Wei <luwei32@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2658/2658] net/ipv4/tcp_comp.c:740:6: warning: no
 previous prototype for function 'comp_stream_read'
Message-ID: <202508061529.suELGrA5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8551213150db5f8eebd27273dae93f6fe258d63a
commit: c31dcf6c5ab41f07da38d3f270987807735ec93e [2658/2658] tcp_comp: implement tcp compression
config: loongarch-randconfig-2005-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061529.suELGrA5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061529.suELGrA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061529.suELGrA5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_comp.c:8:
   In file included from include/linux/skmsg.h:7:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/ipv4/tcp_comp.c:8:
   In file included from include/linux/skmsg.h:13:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:26:
   include/net/ip.h:463:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     463 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:135:26: note: expanded from macro 'time_before'
     135 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:125:3: note: expanded from macro 'time_after'
     125 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> net/ipv4/tcp_comp.c:740:6: warning: no previous prototype for function 'comp_stream_read' [-Wmissing-prototypes]
     740 | bool comp_stream_read(struct sock *sk)
         |      ^
   net/ipv4/tcp_comp.c:740:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     740 | bool comp_stream_read(struct sock *sk)
         | ^
         | static 
>> net/ipv4/tcp_comp.c:779:6: warning: no previous prototype for function 'comp_setup_strp' [-Wmissing-prototypes]
     779 | void comp_setup_strp(struct sock *sk, struct tcp_comp_context *ctx)
         |      ^
   net/ipv4/tcp_comp.c:779:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     779 | void comp_setup_strp(struct sock *sk, struct tcp_comp_context *ctx)
         | ^
         | static 
   7 warnings generated.


vim +/comp_stream_read +740 net/ipv4/tcp_comp.c

   739	
 > 740	bool comp_stream_read(struct sock *sk)
   741	{
   742		struct tcp_comp_context *ctx = comp_get_ctx(sk);
   743	
   744		if (!ctx)
   745			return false;
   746	
   747		if (ctx->rx.pkt || ctx->rx.dpkt)
   748			return true;
   749	
   750		return false;
   751	}
   752	
   753	static void comp_data_ready(struct sock *sk)
   754	{
   755		struct tcp_comp_context *ctx = comp_get_ctx(sk);
   756	
   757		strp_data_ready(&ctx->rx.strp);
   758	}
   759	
   760	static void comp_queue(struct strparser *strp, struct sk_buff *skb)
   761	{
   762		struct tcp_comp_context *ctx = comp_get_ctx(strp->sk);
   763	
   764		ctx->rx.pkt = skb;
   765		strp_pause(strp);
   766		ctx->rx.saved_data_ready(strp->sk);
   767	}
   768	
   769	static int comp_read_size(struct strparser *strp, struct sk_buff *skb)
   770	{
   771		struct strp_msg *rxm = strp_msg(skb);
   772	
   773		if (rxm->offset > skb->len)
   774			return 0;
   775	
   776		return skb->len - rxm->offset;
   777	}
   778	
 > 779	void comp_setup_strp(struct sock *sk, struct tcp_comp_context *ctx)
   780	{
   781		struct strp_callbacks cb;
   782	
   783		memset(&cb, 0, sizeof(cb));
   784		cb.rcv_msg = comp_queue;
   785		cb.parse_msg = comp_read_size;
   786		strp_init(&ctx->rx.strp, sk, &cb);
   787	
   788		write_lock_bh(&sk->sk_callback_lock);
   789		ctx->rx.saved_data_ready = sk->sk_data_ready;
   790		sk->sk_data_ready = comp_data_ready;
   791		write_unlock_bh(&sk->sk_callback_lock);
   792	
   793		strp_check_rcv(&ctx->rx.strp);
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
