Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25728BEC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736578330; cv=none; b=tZMf/yZNDuWSgv7V6L5ABZ3u+IvKXX6c+wfNonNMoyFdwTZ4G85U8yR6zOKuUEosNfn3qs0DKIqkyx2jdem+Lure3HZFJHpSHT8IyFo9MzImIPlVAsE4gOmDkz5Dsj53ggziG5OqwAL01molsqN69W9eu16CoPy57B9FPD5axjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736578330; c=relaxed/simple;
	bh=aIndos8rZCYDvlmmrfuie91GYPOJn8yEEWt2yCOcJao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EaRFhRAmrWCPpu3itccrTP0FyJaMM1HXVt7/f8Gu8IZp5RnhsDErKnMGOWofFdLFxvIbBtxdZuAhnyQnBBmRmnOTXsV7TN+LiPbfND6n6CV+MwX9kmrzku0DRPOBLNpw/INqscAI8dR/iAMVMtUbDSVO2ZBZ90Dv4EoxwAn2f/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXaZ9tpZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXaZ9tpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736578329; x=1768114329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aIndos8rZCYDvlmmrfuie91GYPOJn8yEEWt2yCOcJao=;
  b=WXaZ9tpZTmzCozQ+awECzBgZfl3xVIRaLb/MMYpCcL8xw6r5/TXUIb/x
   W7kothk6h4V+PxK62x+6bCpN8TYBVxwbi9wFQRamzY557Z9bOilltBpoA
   OB064mY+OjaJMRS/pCnkCsk4iOqMnVFKLSNzdQAX3pUBU7cpmdXCPhoPc
   BMleJQ/eTLh/c9Sg9Rg/Y3BTdbocI2LTL6k4mFTBATesDbgdeS+VExxHk
   7FKufBrX20XuhhhPIpRu4AH1XIHpOVGi3abiRNv16Wf7QaOX84Mpv75cp
   llX7Mufa1YjfrWvDJV2ljZmqHgGZCL6RLMHBnssmtATO69PZrf5ZNKhbn
   A==;
X-CSE-ConnectionGUID: mOlaqS3vQ3i9ihdcGwTxEQ==
X-CSE-MsgGUID: ldkUzOZDT0WTehK7n5WbGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36160460"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36160460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 22:52:08 -0800
X-CSE-ConnectionGUID: pERdGzErRmeNtGCP7lOkOw==
X-CSE-MsgGUID: OlD7CzYASTGNNLLTH7MGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134836052"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 22:52:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWVLp-000KJW-0P;
	Sat, 11 Jan 2025 06:52:05 +0000
Date: Sat, 11 Jan 2025 14:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_part2_v3_250105 6/8]
 net/core/sock.c:3061:20: error: implicit declaration of function
 'page_frag_refill_prepare'; did you mean 'sk_page_frag_refill_prepare'?
Message-ID: <202501111449.Fbouc2PM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_part2_v3_250105
head:   c94404d3ba31c8322393ffbabf85a5c98e965b4f
commit: a31c4d10239e1fde1560478359630ca9bdeb4a95 [6/8] net: replace page_frag with page_frag_cache
config: i386-randconfig-004-20250110 (https://download.01.org/0day-ci/archive/20250111/202501111449.Fbouc2PM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111449.Fbouc2PM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111449.Fbouc2PM-lkp@intel.com/

Note: the linyunsheng/page_frag_cache_part2_v3_250105 HEAD c94404d3ba31c8322393ffbabf85a5c98e965b4f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/uapi/asm/swab.h:6,
                    from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/linux/unaligned.h:10,
                    from net/core/sock.c:88:
   net/core/sock.c: In function 'sk_page_frag_refill_prepare':
>> net/core/sock.c:3061:20: error: implicit declaration of function 'page_frag_refill_prepare'; did you mean 'sk_page_frag_refill_prepare'? [-Werror=implicit-function-declaration]
    3061 |         if (likely(page_frag_refill_prepare(nc, 32U, pfrag, sk->sk_allocation)))
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   net/core/sock.c: In function 'sk_page_frag_alloc_refill_prepare':
>> net/core/sock.c:3076:14: error: implicit declaration of function 'page_frag_alloc_refill_prepare'; did you mean 'sk_page_frag_alloc_refill_prepare'? [-Werror=implicit-function-declaration]
    3076 |         va = page_frag_alloc_refill_prepare(nc, 32U, pfrag, sk->sk_allocation);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              sk_page_frag_alloc_refill_prepare
   net/core/sock.c:3076:12: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3076 |         va = page_frag_alloc_refill_prepare(nc, 32U, pfrag, sk->sk_allocation);
         |            ^
   cc1: some warnings being treated as errors
--
   net/core/skbuff.c: In function 'spd_fill_linear_page':
>> net/core/skbuff.c:3093:17: error: implicit declaration of function 'page_frag_refill_commit_noref' [-Werror=implicit-function-declaration]
    3093 |                 page_frag_refill_commit_noref(nc, pfrag, *len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/skbuff.c:3097:9: error: implicit declaration of function 'page_frag_refill_commit' [-Werror=implicit-function-declaration]
    3097 |         page_frag_refill_commit(nc, pfrag, *len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   net/core/skmsg.c: In function 'sk_msg_alloc':
>> net/core/skmsg.c:62:25: error: implicit declaration of function 'page_frag_refill_commit_noref' [-Werror=implicit-function-declaration]
      62 |                         page_frag_refill_commit_noref(nc, pfrag, use);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/skmsg.c:72:25: error: implicit declaration of function 'page_frag_refill_commit' [-Werror=implicit-function-declaration]
      72 |                         page_frag_refill_commit(nc, pfrag, use);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   net/ipv4/ip_output.c: In function '__ip_append_data':
>> net/ipv4/ip_output.c:1254:33: error: implicit declaration of function 'page_frag_refill_commit' [-Werror=implicit-function-declaration]
    1254 |                                 page_frag_refill_commit(nc, pfrag, copy);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/ip_output.c:1258:33: error: implicit declaration of function 'page_frag_refill_commit_noref' [-Werror=implicit-function-declaration]
    1258 |                                 page_frag_refill_commit_noref(nc, pfrag, copy);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   net/ipv4/tcp.c: In function 'tcp_sendmsg_locked':
>> net/ipv4/tcp.c:1234:33: error: implicit declaration of function 'page_frag_refill_commit_noref' [-Werror=implicit-function-declaration]
    1234 |                                 page_frag_refill_commit_noref(nc, pfrag, copy);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/tcp.c:1238:33: error: implicit declaration of function 'page_frag_refill_commit' [-Werror=implicit-function-declaration]
    1238 |                                 page_frag_refill_commit(nc, pfrag, copy);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   net/ipv4/tcp_output.c: In function 'tcp_send_syn_data':
>> net/ipv4/tcp_output.c:3998:22: error: implicit declaration of function 'page_frag_alloc_refill_prepare'; did you mean 'sk_page_frag_alloc_refill_prepare'? [-Werror=implicit-function-declaration]
    3998 |                 va = page_frag_alloc_refill_prepare(nc,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      sk_page_frag_alloc_refill_prepare
   net/ipv4/tcp_output.c:3998:20: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3998 |                 va = page_frag_alloc_refill_prepare(nc,
         |                    ^
>> net/ipv4/tcp_output.c:4022:17: error: implicit declaration of function 'page_frag_refill_commit' [-Werror=implicit-function-declaration]
    4022 |                 page_frag_refill_commit(nc, pfrag, space);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   net/ipv6/ip6_output.c: In function '__ip6_append_data':
>> net/ipv6/ip6_output.c:1790:33: error: implicit declaration of function 'page_frag_refill_commit' [-Werror=implicit-function-declaration]
    1790 |                                 page_frag_refill_commit(nc, pfrag, copy);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv6/ip6_output.c:1794:33: error: implicit declaration of function 'page_frag_refill_commit_noref' [-Werror=implicit-function-declaration]
    1794 |                                 page_frag_refill_commit_noref(nc, pfrag, copy);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +3061 net/core/sock.c

  3057	
  3058	bool sk_page_frag_refill_prepare(struct sock *sk, struct page_frag_cache *nc,
  3059					 struct page_frag *pfrag)
  3060	{
> 3061		if (likely(page_frag_refill_prepare(nc, 32U, pfrag, sk->sk_allocation)))
  3062			return true;
  3063	
  3064		sk_enter_memory_pressure(sk);
  3065		sk_stream_moderate_sndbuf(sk);
  3066		return false;
  3067	}
  3068	EXPORT_SYMBOL(sk_page_frag_refill_prepare);
  3069	
  3070	void *sk_page_frag_alloc_refill_prepare(struct sock *sk,
  3071						struct page_frag_cache *nc,
  3072						struct page_frag *pfrag)
  3073	{
  3074		void *va;
  3075	
> 3076		va = page_frag_alloc_refill_prepare(nc, 32U, pfrag, sk->sk_allocation);
  3077		if (likely(va))
  3078			return va;
  3079	
  3080		sk_enter_memory_pressure(sk);
  3081		sk_stream_moderate_sndbuf(sk);
  3082		return NULL;
  3083	}
  3084	EXPORT_SYMBOL(sk_page_frag_alloc_refill_prepare);
  3085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
