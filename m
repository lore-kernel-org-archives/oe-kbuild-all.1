Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BEF45979
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 04:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737434258; cv=none; b=Mv/igZSw78GfcW/JZiBd5SYgmRvADdHqZ8I+KyPBfMy6rewEFowoKAYae77RH+U9Kfj0ULRp5viFDIwar6fYg+QASfv2QWMCNUxos8KM0AVk1GIQzTP1QSyjAUDby5+Qv+DILESGiqX7r+EgfgGyzhqmtYTNeT2OJ4SnQ6U5Xrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737434258; c=relaxed/simple;
	bh=fix0AYjnXf5CfiVFKHU8YrWgAgjQTjtknMMm/aMGHEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV//iw6jfYAzhqSgmOPx9a68JS9TP/huvO/14kHWtHAdVa6xEcoEt41Ta4PWRGVIy9VE1YrV2KHb7iTlFVRwhEyG5axCLXte4+eL5TMtGwMeb5V0rc91JtrTFNAWmZC173jIVFMzgBsmpeLrhJZY0k7Nj2yGRhrlP+uUUBT/K2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5/Vikfd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5/Vikfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737434256; x=1768970256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fix0AYjnXf5CfiVFKHU8YrWgAgjQTjtknMMm/aMGHEE=;
  b=Q5/VikfdWrsV1CDuUkAfzWxthBdw8FLMpRQmx5zfp3dxQFVTX6ABMfml
   7REuwtZNUj1Va8MhSn5FmBjoNj6q34jGJwHu29bhv6imh3Yy30AQ4XubY
   SsV22nm+I5c3/9g78wVFOdQOTvqJ9pKTQtyrjJSZzl2Ua8FGzZ3nE6Diu
   Oofh+J68nZM8IZqVhzeNwp6qfKHu8mGxkgq0d7qn1HAzyHC1oIHEh8JiY
   WoGl0wiPkJ1+LJOUVQ6X4/TwN3/WAgfMSBGpCW3A3+rpweVydwLFUjsrx
   rrbwDYE1u2iVZ12tdQBpip5Pv4GXq92PKlq3wEEsQu5MLCVFDgCXT8m9U
   A==;
X-CSE-ConnectionGUID: uy1ghdcZRsKHdW1D0qh31w==
X-CSE-MsgGUID: 5Na1w6cnRc+gSmSQHeYNVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37993503"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="37993503"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 20:37:35 -0800
X-CSE-ConnectionGUID: vMe4gw8OQbOA1br957KtqA==
X-CSE-MsgGUID: Usj7NeSsRDScqbB2QS923g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106522359"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2025 20:37:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta616-000XcB-0w;
	Tue, 21 Jan 2025 04:37:32 +0000
Date: Tue, 21 Jan 2025 12:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v6 02/13] net-timestamp: prepare for
 timestamping callbacks use
Message-ID: <202501211200.SvGCkZ9t-lkp@intel.com>
References: <20250121012901.87763-3-kerneljasonxing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121012901.87763-3-kerneljasonxing@gmail.com>

Hi Jason,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-timestamp-add-support-for-bpf_setsockopt/20250121-093443
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250121012901.87763-3-kerneljasonxing%40gmail.com
patch subject: [RFC PATCH net-next v6 02/13] net-timestamp: prepare for timestamping callbacks use
config: riscv-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211200.SvGCkZ9t-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211200.SvGCkZ9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211200.SvGCkZ9t-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/sock.c:951:6: error: redefinition of 'bpf_skops_tx_timestamping'
     951 | void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff *skb, int op)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/net/inet_sock.h:23,
                    from include/net/ip.h:29,
                    from include/linux/errqueue.h:6,
                    from net/core/sock.c:91:
   include/net/sock.h:2929:20: note: previous definition of 'bpf_skops_tx_timestamping' with type 'void(struct sock *, struct sk_buff *, int)'
    2929 | static inline void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff *skb, int op)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/sock.c: In function 'bpf_skops_tx_timestamping':
>> net/core/sock.c:961:9: error: implicit declaration of function '__cgroup_bpf_run_filter_sock_ops'; did you mean '__cgroup_bpf_run_lsm_socket'? [-Wimplicit-function-declaration]
     961 |         __cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP_SOCK_OPS);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         __cgroup_bpf_run_lsm_socket
>> net/core/sock.c:961:57: error: 'CGROUP_SOCK_OPS' undeclared (first use in this function); did you mean 'BPF_CGROUP_SOCK_OPS'?
     961 |         __cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP_SOCK_OPS);
         |                                                         ^~~~~~~~~~~~~~~
         |                                                         BPF_CGROUP_SOCK_OPS
   net/core/sock.c:961:57: note: each undeclared identifier is reported only once for each function it appears in


vim +961 net/core/sock.c

   950	
   951	void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff *skb, int op)
   952	{
   953		struct bpf_sock_ops_kern sock_ops;
   954	
   955		memset(&sock_ops, 0, offsetof(struct bpf_sock_ops_kern, temp));
   956		sock_ops.op = op;
   957		sock_ops.is_fullsock = 1;
   958		sock_ops.sk = sk;
   959		bpf_skops_init_skb(&sock_ops, skb, 0);
   960		/* Timestamping bpf extension supports only TCP and UDP full socket */
 > 961		__cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP_SOCK_OPS);
   962	}
   963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
