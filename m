Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC5B220F49
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 20:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747425686; cv=none; b=IP+MulNnhae31hHaprJ07iJ4cTyOOdJyc2rVHFGZceqzbioRQpF+pidDIPUZ6JKGtoI8kuzid7JhdyEJjIM7i+O7Gq9/+FwAFpx0aV1UU3BTlydbaVKXtYUi/udoGhP0K2qggEUsaghJcIGE3czrq50IOZJLDl9MWnrArDonqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747425686; c=relaxed/simple;
	bh=O2H3M98yVrXKRdESsfi/aktKIVWQeZu91bMdlnABx2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buYeB8ImQg7mb7z98TNFxTcp7YMwuPIsN4vW1R1qtJiMg6nBFI578HJl98skCZJxpMHkrdauWUSzoK9JmBWcbK762WZEWcoll5Ew1Sa3Jcbm+DxNScP9CcxhWzEZAuNeWiH7e4EjLhxh7eumZ8xdEE3yLs21dohz5bdOoZGMg2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqjgQL+H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqjgQL+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747425685; x=1778961685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O2H3M98yVrXKRdESsfi/aktKIVWQeZu91bMdlnABx2I=;
  b=eqjgQL+H+t8DP1vvLSHPEwVsZRwW9QrjlZYbKxgS3gFJuxVVy9graIYO
   bYw9Vqcts0NTCruQzUDs7VZgoVRcyeOz/t+O2RLLiAOzR/agFvpKcEYPE
   0qmPGkau4C7a96HzY3sBvdmIACbTfqDld0RGlZz9tYMLg9Hn6KSo2hqv0
   Ifu5RHyaTrX3BsXbXiD3MoP62XNq0odA/dngAQoZxnUhG6axsU+ZlbdHR
   hT5Jhjeq06esco+ab5bnSNWpfO5i9M+vvdA+7+K2tEKhJ3Sa3Fdn+1gde
   D4g7RIfyW1WaFyH7dzCPpzH9TzWNbLGPF5xPt32iNfjRVdvE69/XmN+/W
   Q==;
X-CSE-ConnectionGUID: +Ubm3/1jRqKTb0+I2Kmwzw==
X-CSE-MsgGUID: umM3ET9jRF6ecSkv5u6hkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49476178"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49476178"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 13:01:23 -0700
X-CSE-ConnectionGUID: 7g/fEq3jT02779MFqKnn4w==
X-CSE-MsgGUID: A1DdIDsWSre68yh8mQzFiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="169714299"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2025 13:01:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG1F8-000JfT-2x;
	Fri, 16 May 2025 20:01:18 +0000
Date: Sat, 17 May 2025 04:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 4243/11779]
 drivers/infiniband/hw/hns/./hns_roce_trace.h:46:1: sparse: sparse: cast to
 restricted __le32
Message-ID: <202505170327.TNOpreil-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 6c98c86708063af509b82f35bfac9577b61b4a94 [4243/11779] RDMA/hns: Add trace for WQE dumping
config: loongarch-randconfig-r123-20250516 (https://download.01.org/0day-ci/archive/20250517/202505170327.TNOpreil-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250517/202505170327.TNOpreil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170327.TNOpreil-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, drivers/infiniband/hw/hns/hns_roce_trace.h):
>> drivers/infiniband/hw/hns/./hns_roce_trace.h:46:1: sparse: sparse: cast to restricted __le32
>> drivers/infiniband/hw/hns/./hns_roce_trace.h:46:1: sparse: sparse: restricted __le32 degrades to integer
>> drivers/infiniband/hw/hns/./hns_roce_trace.h:46:1: sparse: sparse: restricted __le32 degrades to integer

vim +46 drivers/infiniband/hw/hns/./hns_roce_trace.h

    34	
    35	DEFINE_EVENT(flush_head_template, hns_sq_flush_cqe,
    36		     TP_PROTO(unsigned long qpn, u32 pi,
    37			      enum hns_roce_trace_type type),
    38		     TP_ARGS(qpn, pi, type));
    39	DEFINE_EVENT(flush_head_template, hns_rq_flush_cqe,
    40		     TP_PROTO(unsigned long qpn, u32 pi,
    41			      enum hns_roce_trace_type type),
    42		     TP_ARGS(qpn, pi, type));
    43	
    44	#define MAX_SGE_PER_WQE 64
    45	#define MAX_WQE_SIZE (MAX_SGE_PER_WQE * HNS_ROCE_SGE_SIZE)
  > 46	DECLARE_EVENT_CLASS(wqe_template,
    47			    TP_PROTO(unsigned long qpn, u32 idx, void *wqe, u32 len,
    48				     u64 id, enum hns_roce_trace_type type),
    49			    TP_ARGS(qpn, idx, wqe, len, id, type),
    50	
    51			    TP_STRUCT__entry(__field(unsigned long, qpn)
    52					     __field(u32, idx)
    53					     __array(__le32, wqe,
    54						     MAX_WQE_SIZE / sizeof(__le32))
    55					     __field(u32, len)
    56					     __field(u64, id)
    57					     __field(enum hns_roce_trace_type, type)
    58					     ),
    59	
    60			    TP_fast_assign(__entry->qpn = qpn;
    61					   __entry->idx = idx;
    62					   __entry->id = id;
    63					   memcpy(__entry->wqe, wqe, len);
    64					   __entry->len = len / sizeof(__le32);
    65					   __entry->type = type;
    66					   ),
    67	
    68			    TP_printk("%s 0x%lx wqe(0x%x/0x%llx): %s",
    69				      trace_type_to_str(__entry->type),
    70				      __entry->qpn, __entry->idx, __entry->id,
    71				      __print_array(__entry->wqe, __entry->len,
    72						    sizeof(__le32)))
    73	);
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
