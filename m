Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E4A298CA3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817039; cv=none; b=kKQxhBy8GAYdZ+5lUNY/MnDAkmcFqT/SPCKOeN3krTyeRiIYaTCm4aLonGZFzdVl7k70r0DJVYaVNuzCc2Ignu2chnF9uE11bOALrN7FB2Fzo3gSS8ZSOyNIR87wFrUvI/AInglmhXVHhytgE0bTLCMvSpV01ts3xbs5ZtOnMMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817039; c=relaxed/simple;
	bh=0IXLRdVoZwaASQSSGSklpHyvVG+xoY+tYLOYJCdMzv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRBmhQPcXWYpKgAoZQBNDF8QDXbgI+mGcSWRmh1CvwiaYUFDn0QtiGTWjPvNNljQSIH2K7HtqkPPct1e9ZGo7U4H9euXfNb44nk8MKJF3M7SDaenfI/gH1Q6pbUGwIVE5Q1FGZ5vS4bPuPM4mRmQizO5AkAKO3/9S9W2UsJ+HKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rc87+rh+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rc87+rh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756817037; x=1788353037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IXLRdVoZwaASQSSGSklpHyvVG+xoY+tYLOYJCdMzv8=;
  b=Rc87+rh+mAH8/02LnbNokcMLznk9oFSctgAt0UPvHWmdqMKzlH7YmNdG
   DXgBLD/NIheQykTsY9KtvKAeX4czGKe1N42Ed7U0kTGcQjqR3Ijk91eCZ
   h3LodsF7g24wP9IO6cQrjzOtgK+KSOyN9cOcoUBYiCAhPnEqJkQO1ULEP
   y68zch7EDieCxIkF/CGBMHB6JQ5XNqsaekbKlbHOQ7TmcbaIDgeIfde+U
   JjNvN0dlpRDKaU5Hk28eB7VzkCKiiXc7i4ipTXtwjPmTuI/woPwr9IH7v
   rkKXDoNsvtbOa3ZQHNvRLI2hN+EKH27jaWDbeMwcTbIEyzdj7o+Qx7Pu3
   w==;
X-CSE-ConnectionGUID: 0Il3gZAkSE2oRA/wXvYfgg==
X-CSE-MsgGUID: Ze+0HD+aS1+CNNjaN6WPvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69699316"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="69699316"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:43:56 -0700
X-CSE-ConnectionGUID: K9IzRZTfRFuOIhmKtiShWQ==
X-CSE-MsgGUID: TL2R56R4QleSzVx1iRKycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170826382"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2025 05:43:55 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utQMa-0003J1-2z;
	Tue, 02 Sep 2025 12:43:52 +0000
Date: Tue, 2 Sep 2025 14:43:46 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/net/xen-netfront.c:680:17: warning: no previous prototype for
 function 'bounce_skb'
Message-ID: <202509021429.OZnuwTDD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   119e72f374248c57f950f0658c1e1099b40e2ffa
commit: 4923217af5742a796821272ee03f8d6de15c0cca [1/1] xen/netfront: force data bouncing when backend is untrusted
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250902/202509021429.OZnuwTDD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021429.OZnuwTDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021429.OZnuwTDD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/xen-netfront.c:680:17: warning: no previous prototype for function 'bounce_skb' [-Wmissing-prototypes]
     680 | struct sk_buff *bounce_skb(const struct sk_buff *skb)
         |                 ^
   drivers/net/xen-netfront.c:680:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     680 | struct sk_buff *bounce_skb(const struct sk_buff *skb)
         | ^
         | static 
   drivers/net/xen-netfront.c:2618:16: warning: variable 'target' set but not used [-Wunused-but-set-variable]
    2618 |         unsigned long target;
         |                       ^
   2 warnings generated.


vim +/bounce_skb +680 drivers/net/xen-netfront.c

   679	
 > 680	struct sk_buff *bounce_skb(const struct sk_buff *skb)
   681	{
   682		unsigned int headerlen = skb_headroom(skb);
   683		/* Align size to allocate full pages and avoid contiguous data leaks */
   684		unsigned int size = ALIGN(skb_end_offset(skb) + skb->data_len,
   685					  XEN_PAGE_SIZE);
   686		struct sk_buff *n = alloc_skb(size, GFP_ATOMIC | __GFP_ZERO);
   687	
   688		if (!n)
   689			return NULL;
   690	
   691		if (!IS_ALIGNED((uintptr_t)n->head, XEN_PAGE_SIZE)) {
   692			WARN_ONCE(1, "misaligned skb allocated\n");
   693			kfree_skb(n);
   694			return NULL;
   695		}
   696	
   697		/* Set the data pointer */
   698		skb_reserve(n, headerlen);
   699		/* Set the tail pointer and length */
   700		skb_put(n, skb->len);
   701	
   702		BUG_ON(skb_copy_bits(skb, -headerlen, n->head, headerlen + skb->len));
   703	
   704		skb_copy_header(n, skb);
   705		return n;
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
