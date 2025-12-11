Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE022868A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765482648; cv=none; b=ZfkwcIsIJPBe0+a4rodPDTaI4dUmuys5zIv4K5370r0QO6Mgf/2NJzKb1sWPOyZ33dA5k5WqitQcAzlULbqiNeFuNHa8SAfnlX3BnlWw5kh2d0qnm+QWrSHl/ADMLKCXHyWn6j50nT2bFgBVHpng3nR6ag47486iVegkOgweQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765482648; c=relaxed/simple;
	bh=PS54sjFuMPRRCM/7IftPIRVUfOn4CNJ0YRIaBNh3Kqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdLOsSKvoV2DNCmjUHT+7JJXGO50howGasFr0VMuBiq93Hx/ueF3HMZ5f3x2890LqOwCkkiXFHvvE11lXTgIO1pjlQMVREGr+mg+/q/+Bm2suiWG/hMim7wISyd5uTn5XVLNE7rqyweLtuST5RQ+jHB367ZPOtX5xkJpXuupH58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hT8Cg2NZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hT8Cg2NZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765482646; x=1797018646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PS54sjFuMPRRCM/7IftPIRVUfOn4CNJ0YRIaBNh3Kqg=;
  b=hT8Cg2NZ4OwvoecAfmPuo4waGOYb+1uqehYhqA3FXEraQNLiG4C7cKkn
   5MW8X0zQS6FM/lqD+ofht3kxM1e0NXGx+StDcOa7gAkS+1CfUv221bVWj
   GttVuyUMaukQ2YARdmmdPIp0ays515Z001C2A+W3CtvlC7dFQF52Z7UT3
   KeMG14Vtvt5RAMNAts0NuqiteuHB4ep/bx6OQcYqT2Xi3GtCVm9ttXWTW
   jODFueh64mfHwDSO4Bn8HFubtzeaojfNL6p6wLAwvx+qLEHIySTcN7i4t
   DAdVD3OrCJlbSFd0tBzSltSyzxiiMxh7sj4mTvJiLNY/EwYDCgwBgV5JU
   A==;
X-CSE-ConnectionGUID: Q+lKOtIkRKeYTh503Thvcw==
X-CSE-MsgGUID: Ycw/C1NGSMGEVSzS12s2oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67516510"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67516510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 11:50:45 -0800
X-CSE-ConnectionGUID: datdPMjVSWiqLQlFsR3YOA==
X-CSE-MsgGUID: LOgxeDioQeKSEnWQ4UOh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201360397"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 11:50:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTmgT-0000000051x-1zvP;
	Thu, 11 Dec 2025 19:50:41 +0000
Date: Fri, 12 Dec 2025 03:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Wei <luwei32@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3536/3536] net/ipv4/tcp_comp.c:740:6: warning: no
 previous prototype for function 'comp_stream_read'
Message-ID: <202512120305.ngE1OnFo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: c31dcf6c5ab41f07da38d3f270987807735ec93e [3536/3536] tcp_comp: implement tcp compression
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512120305.ngE1OnFo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120305.ngE1OnFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120305.ngE1OnFo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_comp.c:8:
   In file included from include/linux/skmsg.h:7:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
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
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
