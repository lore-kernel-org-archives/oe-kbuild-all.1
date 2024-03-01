Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9668364F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709252902; cv=none; b=WCUvV5Uqyta6jwaGtSDeyV5ygZx/cvYEeRFyb7oN1YwENcN61swfRaHkoGJ48L2enRo9BsztnuJiBo9uyqMlr/nn3EpIFK7v9QiC0XGyojthJ5Dz1wRMqc+ZjXpwkxGvYgTc1hr8EsQNCQja9DQp3Cv3TzlaZH1nqMBvjA0Q2wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709252902; c=relaxed/simple;
	bh=7mwqnUe1ZnueroSxQdhWdQl769gMgRGXcOZQXGsr+sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DDCnhMSOUh+JtWFGuW6C/8SnVQXMFoLQJs1KTDuT17lso8ETGX5+NSbO0hztdJBL5i+XNhOU24/OHcRzk5jBw/QDhC5pUcnqkiuzdTpsrwAbSuyHGZsc4DCi796ogTgUxcMjnKQqxzNZw53YjoGeAsM/U5HE0CDlnKTF1RcWpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHle9PcT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHle9PcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709252890; x=1740788890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7mwqnUe1ZnueroSxQdhWdQl769gMgRGXcOZQXGsr+sc=;
  b=YHle9PcT30qaVwu8mKHFEDzsMa/Rl/9fnNr1gdf4jbDVdj38DBJ6hCNY
   dWem1t9sOhI6gi2Ro8yUyZCFFyrs12QZyEN5emxt9HAqVVHZ9UeX18exY
   KQu4VLrOPTX01fywyAgC8mpBCdjHbj/+3AyN4/uGpjfmMpEuPhz1XoBwd
   hmSO9P5+u5mfri57qGkgQLE50/0hfvcrIXT2JumPXu5kz9H/CDhM2lS2V
   z0G5s8rU3jY1GToYxfELCEZuf7SHZp0QK+v1zkFoKDwbwKgYlnWgi8RXg
   usPAuKLSRD6TZBeepQz8NXInwshdgiWXUUNMPRLz/eLgHlxcADOhJJ/AT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3943855"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3943855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 16:28:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7930136"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Feb 2024 16:28:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfqkv-000DNz-01;
	Fri, 01 Mar 2024 00:28:05 +0000
Date: Fri, 1 Mar 2024 08:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@nvidia.com>
Subject: [netdev-net-next:main 28/30] net/ipv4/tcp.c:4687:2: error: call to
 '__compiletime_assert_950' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_rx)
 - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_wri...
Message-ID: <202403010800.OBTBffOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   489645d3f1332f65a9337cb31c0ee12a1259a484
commit: 99123622050f10ca9148a0fffba2de0afd6cdfff [28/30] tcp: remove some holes in struct tcp_sock
config: hexagon-randconfig-r071-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010800.OBTBffOg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010800.OBTBffOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010800.OBTBffOg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:9:
   In file included from include/linux/security.h:35:
   include/linux/bpf.h:742:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     742 |         ARG_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | ARG_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:743:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     743 |         ARG_PTR_TO_MEM_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:744:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     744 |         ARG_PTR_TO_CTX_OR_NULL          = PTR_MAYBE_NULL | ARG_PTR_TO_CTX,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:745:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     745 |         ARG_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:746:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     746 |         ARG_PTR_TO_STACK_OR_NULL        = PTR_MAYBE_NULL | ARG_PTR_TO_STACK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:747:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     747 |         ARG_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | ARG_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:751:38: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     751 |         ARG_PTR_TO_UNINIT_MEM           = MEM_UNINIT | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:753:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_arg_type') [-Wenum-enum-conversion]
     753 |         ARG_PTR_TO_FIXED_SIZE_MEM       = MEM_FIXED_SIZE | ARG_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:776:48: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     776 |         RET_PTR_TO_MAP_VALUE_OR_NULL    = PTR_MAYBE_NULL | RET_PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:777:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     777 |         RET_PTR_TO_SOCKET_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:778:47: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     778 |         RET_PTR_TO_TCP_SOCK_OR_NULL     = PTR_MAYBE_NULL | RET_PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:779:50: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     779 |         RET_PTR_TO_SOCK_COMMON_OR_NULL  = PTR_MAYBE_NULL | RET_PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:781:49: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     781 |         RET_PTR_TO_DYNPTR_MEM_OR_NULL   = PTR_MAYBE_NULL | RET_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:782:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     782 |         RET_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:783:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     783 |         RET_PTR_TO_BTF_ID_TRUSTED       = PTR_TRUSTED    | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~    ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:894:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     894 |         PTR_TO_MAP_VALUE_OR_NULL        = PTR_MAYBE_NULL | PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:895:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     895 |         PTR_TO_SOCKET_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/bpf.h:896:46: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     896 |         PTR_TO_SOCK_COMMON_OR_NULL      = PTR_MAYBE_NULL | PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:897:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     897 |         PTR_TO_TCP_SOCK_OR_NULL         = PTR_MAYBE_NULL | PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   include/linux/bpf.h:898:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     898 |         PTR_TO_BTF_ID_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>> net/ipv4/tcp.c:4687:2: error: call to '__compiletime_assert_950' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_rx) - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_write_rx) > 99
    4687 |         CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_rx, 99);
         |         ^
   include/linux/cache.h:108:2: note: expanded from macro 'CACHELINE_ASSERT_GROUP_SIZE'
     108 |         BUILD_BUG_ON(offsetof(TYPE, __cacheline_group_end__##GROUP) - \
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:430:2: note: expanded from macro '_compiletime_assert'
     430 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:423:4: note: expanded from macro '__compiletime_assert'
     423 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:55:1: note: expanded from here
      55 | __compiletime_assert_950
         | ^
   27 warnings and 1 error generated.


vim +4687 net/ipv4/tcp.c

4acb41903b2f99 Glauber Costa 2012-01-30  4597  
d5fed5addb2b6b Coco Li       2023-12-04  4598  static void __init tcp_struct_check(void)
d5fed5addb2b6b Coco Li       2023-12-04  4599  {
d5fed5addb2b6b Coco Li       2023-12-04  4600  	/* TX read-mostly hotpath cache lines */
d5fed5addb2b6b Coco Li       2023-12-04  4601  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_tx, max_window);
d5fed5addb2b6b Coco Li       2023-12-04  4602  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_tx, rcv_ssthresh);
d5fed5addb2b6b Coco Li       2023-12-04  4603  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_tx, reordering);
d5fed5addb2b6b Coco Li       2023-12-04  4604  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_tx, notsent_lowat);
d5fed5addb2b6b Coco Li       2023-12-04  4605  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_tx, gso_segs);
d5fed5addb2b6b Coco Li       2023-12-04  4606  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_tx, lost_skb_hint);
d5fed5addb2b6b Coco Li       2023-12-04  4607  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_tx, retransmit_skb_hint);
d5fed5addb2b6b Coco Li       2023-12-04  4608  	CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_read_tx, 40);
d5fed5addb2b6b Coco Li       2023-12-04  4609  
d5fed5addb2b6b Coco Li       2023-12-04  4610  	/* TXRX read-mostly hotpath cache lines */
d5fed5addb2b6b Coco Li       2023-12-04  4611  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, tsoffset);
d5fed5addb2b6b Coco Li       2023-12-04  4612  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, snd_wnd);
d5fed5addb2b6b Coco Li       2023-12-04  4613  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, mss_cache);
d5fed5addb2b6b Coco Li       2023-12-04  4614  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, snd_cwnd);
d5fed5addb2b6b Coco Li       2023-12-04  4615  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, prr_out);
d5fed5addb2b6b Coco Li       2023-12-04  4616  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, lost_out);
d5fed5addb2b6b Coco Li       2023-12-04  4617  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, sacked_out);
119ff04864a244 Eric Dumazet  2024-02-08  4618  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_txrx, scaling_ratio);
119ff04864a244 Eric Dumazet  2024-02-08  4619  	CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_read_txrx, 32);
d5fed5addb2b6b Coco Li       2023-12-04  4620  
d5fed5addb2b6b Coco Li       2023-12-04  4621  	/* RX read-mostly hotpath cache lines */
d5fed5addb2b6b Coco Li       2023-12-04  4622  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, copied_seq);
d5fed5addb2b6b Coco Li       2023-12-04  4623  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, rcv_tstamp);
d5fed5addb2b6b Coco Li       2023-12-04  4624  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, snd_wl1);
d5fed5addb2b6b Coco Li       2023-12-04  4625  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, tlp_high_seq);
d5fed5addb2b6b Coco Li       2023-12-04  4626  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, rttvar_us);
d5fed5addb2b6b Coco Li       2023-12-04  4627  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, retrans_out);
d5fed5addb2b6b Coco Li       2023-12-04  4628  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, advmss);
d5fed5addb2b6b Coco Li       2023-12-04  4629  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, urg_data);
d5fed5addb2b6b Coco Li       2023-12-04  4630  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, lost);
d5fed5addb2b6b Coco Li       2023-12-04  4631  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, rtt_min);
d5fed5addb2b6b Coco Li       2023-12-04  4632  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, out_of_order_queue);
d5fed5addb2b6b Coco Li       2023-12-04  4633  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_read_rx, snd_ssthresh);
d5fed5addb2b6b Coco Li       2023-12-04  4634  	CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_read_rx, 69);
d5fed5addb2b6b Coco Li       2023-12-04  4635  
d5fed5addb2b6b Coco Li       2023-12-04  4636  	/* TX read-write hotpath cache lines */
d5fed5addb2b6b Coco Li       2023-12-04  4637  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, segs_out);
d5fed5addb2b6b Coco Li       2023-12-04  4638  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, data_segs_out);
d5fed5addb2b6b Coco Li       2023-12-04  4639  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, bytes_sent);
d5fed5addb2b6b Coco Li       2023-12-04  4640  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, snd_sml);
d5fed5addb2b6b Coco Li       2023-12-04  4641  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, chrono_start);
d5fed5addb2b6b Coco Li       2023-12-04  4642  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, chrono_stat);
d5fed5addb2b6b Coco Li       2023-12-04  4643  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, write_seq);
d5fed5addb2b6b Coco Li       2023-12-04  4644  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, pushed_seq);
d5fed5addb2b6b Coco Li       2023-12-04  4645  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, lsndtime);
d5fed5addb2b6b Coco Li       2023-12-04  4646  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, mdev_us);
d5fed5addb2b6b Coco Li       2023-12-04  4647  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, tcp_wstamp_ns);
d5fed5addb2b6b Coco Li       2023-12-04  4648  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, tcp_clock_cache);
d5fed5addb2b6b Coco Li       2023-12-04  4649  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, tcp_mstamp);
d5fed5addb2b6b Coco Li       2023-12-04  4650  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, rtt_seq);
d5fed5addb2b6b Coco Li       2023-12-04  4651  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, tsorted_sent_queue);
d5fed5addb2b6b Coco Li       2023-12-04  4652  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, highest_sack);
d5fed5addb2b6b Coco Li       2023-12-04  4653  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_tx, ecn_flags);
d5fed5addb2b6b Coco Li       2023-12-04  4654  	CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_tx, 113);
d5fed5addb2b6b Coco Li       2023-12-04  4655  
d5fed5addb2b6b Coco Li       2023-12-04  4656  	/* TXRX read-write hotpath cache lines */
d5fed5addb2b6b Coco Li       2023-12-04  4657  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, pred_flags);
d5fed5addb2b6b Coco Li       2023-12-04  4658  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, rcv_nxt);
d5fed5addb2b6b Coco Li       2023-12-04  4659  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, snd_nxt);
d5fed5addb2b6b Coco Li       2023-12-04  4660  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, snd_una);
d5fed5addb2b6b Coco Li       2023-12-04  4661  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, window_clamp);
d5fed5addb2b6b Coco Li       2023-12-04  4662  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, srtt_us);
d5fed5addb2b6b Coco Li       2023-12-04  4663  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, packets_out);
d5fed5addb2b6b Coco Li       2023-12-04  4664  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, snd_up);
d5fed5addb2b6b Coco Li       2023-12-04  4665  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, delivered);
d5fed5addb2b6b Coco Li       2023-12-04  4666  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, delivered_ce);
d5fed5addb2b6b Coco Li       2023-12-04  4667  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, app_limited);
d5fed5addb2b6b Coco Li       2023-12-04  4668  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, rcv_wnd);
d5fed5addb2b6b Coco Li       2023-12-04  4669  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_txrx, rx_opt);
d5fed5addb2b6b Coco Li       2023-12-04  4670  	CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_txrx, 76);
d5fed5addb2b6b Coco Li       2023-12-04  4671  
d5fed5addb2b6b Coco Li       2023-12-04  4672  	/* RX read-write hotpath cache lines */
d5fed5addb2b6b Coco Li       2023-12-04  4673  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, bytes_received);
d5fed5addb2b6b Coco Li       2023-12-04  4674  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, segs_in);
d5fed5addb2b6b Coco Li       2023-12-04  4675  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, data_segs_in);
d5fed5addb2b6b Coco Li       2023-12-04  4676  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, rcv_wup);
d5fed5addb2b6b Coco Li       2023-12-04  4677  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, max_packets_out);
d5fed5addb2b6b Coco Li       2023-12-04  4678  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, cwnd_usage_seq);
d5fed5addb2b6b Coco Li       2023-12-04  4679  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, rate_delivered);
d5fed5addb2b6b Coco Li       2023-12-04  4680  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, rate_interval_us);
d5fed5addb2b6b Coco Li       2023-12-04  4681  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, rcv_rtt_last_tsecr);
d5fed5addb2b6b Coco Li       2023-12-04  4682  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, first_tx_mstamp);
d5fed5addb2b6b Coco Li       2023-12-04  4683  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, delivered_mstamp);
d5fed5addb2b6b Coco Li       2023-12-04  4684  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, bytes_acked);
d5fed5addb2b6b Coco Li       2023-12-04  4685  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, rcv_rtt_est);
d5fed5addb2b6b Coco Li       2023-12-04  4686  	CACHELINE_ASSERT_GROUP_MEMBER(struct tcp_sock, tcp_sock_write_rx, rcvq_space);
d5fed5addb2b6b Coco Li       2023-12-04 @4687  	CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_rx, 99);
d5fed5addb2b6b Coco Li       2023-12-04  4688  }
d5fed5addb2b6b Coco Li       2023-12-04  4689  

:::::: The code at line 4687 was first introduced by commit
:::::: d5fed5addb2b6bc13035de4338b7ea2052a2e006 tcp: reorganize tcp_sock fast path variables

:::::: TO: Coco Li <lixiaoyan@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
