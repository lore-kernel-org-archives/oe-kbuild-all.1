Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC21F956
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980456; cv=none; b=gPrJNytX9gMWB5sjIYDdpLsUnJlWqSchHr0pjz8P/l/KSiDBjXrjgne225doaH0SwTaHoxwruWo0Uy/IdSROdN2VnmMroXil3BzLLD8ciVoo5HmNseeCfbJS86HzRGk+n/0RzgG3F/AxQKNhW8HkUKHQCDjPN4XqAQLRIjHMxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980456; c=relaxed/simple;
	bh=j7tjGVSW8H3+q0t9e0IaeNfipepQz25epPeXce/Z4AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZYMheiSUtGj8QyqehUgyrHZQENNXQGfSW8BqnuMHJqVXal8Rsgj315zFOJi8sKZLXWXor0IqZtXRcKtZc/l5XrTdRYoanA/vWhM6DeXsqKCvONgvzrkKEBBjMPucXNeb+hAr3DFKrkpxH6hW1XnVQJaXHvrYesaFHIQBDtqCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8UMUSoz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8UMUSoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725980454; x=1757516454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j7tjGVSW8H3+q0t9e0IaeNfipepQz25epPeXce/Z4AA=;
  b=b8UMUSozBXa8dFNn6I1g++TMRpCtWYNGVL+nCUzskRt0VoRFqIh8NSBy
   I/v7jbOQAuLsYl8qETRwpYMFJByq3E5NY9P8hW/YjvVR6CPZqhNKVueHk
   egxW1WLKhRyB6i4n0HEESQbTApqC+Bt6hvqI4GmpMgTtfHWta7nRLU8Mz
   stjNL7wDseKTlEfE27XFr2XV/bQRzF49L6BUx3uiPGPCq8BSxi45J8e8A
   YAiNyAsSB6WZTl5MJYotXqU8ezGr1ia9TVmgwYwLk9C9fX/Mxr8DRZLmm
   ZjjveXvmo5Z3Eg7Hvx0DFkPm43/IeLvmhcwPocXjN7IxWYjJtjHTDc3nE
   A==;
X-CSE-ConnectionGUID: wo6qIuxnTPyItb0J0EUODA==
X-CSE-MsgGUID: m3PRuUllTQ6zZMmbe4iPjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24880247"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24880247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 08:00:49 -0700
X-CSE-ConnectionGUID: T8gd7uDyQnSWOWsUCSSmKQ==
X-CSE-MsgGUID: PGauhd31SA+bb4UACjoxSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67824809"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2024 08:00:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so2MF-0002Ea-0t;
	Tue, 10 Sep 2024 15:00:43 +0000
Date: Tue, 10 Sep 2024 23:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jeongjun Park <aha310510@gmail.com>, davem@davemloft.net,
	dsahern@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, kafai@fb.com, weiwan@google.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: Re: [PATCH net] net: prevent NULL pointer dereference in
 rt_fibinfo_free() and rt_fibinfo_free_cpus()
Message-ID: <202409102210.krjQJVRr-lkp@intel.com>
References: <20240909184827.123071-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909184827.123071-1-aha310510@gmail.com>

Hi Jeongjun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeongjun-Park/net-prevent-NULL-pointer-dereference-in-rt_fibinfo_free-and-rt_fibinfo_free_cpus/20240910-025008
base:   net/main
patch link:    https://lore.kernel.org/r/20240909184827.123071-1-aha310510%40gmail.com
patch subject: [PATCH net] net: prevent NULL pointer dereference in rt_fibinfo_free() and rt_fibinfo_free_cpus()
config: arc-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409102210.krjQJVRr-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409102210.krjQJVRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409102210.krjQJVRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/fib_semantics.c: In function 'rt_fibinfo_free':
>> net/ipv4/fib_semantics.c:156:13: warning: the comparison will always evaluate as 'true' for the address of 'dst' will never be NULL [-Waddress]
     156 |         if (!&rt->dst)
         |             ^
   In file included from include/net/ip.h:30,
                    from net/ipv4/fib_semantics.c:37:
   include/net/route.h:56:33: note: 'dst' declared here
      56 |         struct dst_entry        dst;
         |                                 ^~~
   net/ipv4/fib_semantics.c: In function 'rt_fibinfo_free_cpus':
   net/ipv4/fib_semantics.c:209:21: warning: the comparison will always evaluate as 'true' for the address of 'dst' will never be NULL [-Waddress]
     209 |                 if (!&rt->dst)
         |                     ^
   include/net/route.h:56:33: note: 'dst' declared here
      56 |         struct dst_entry        dst;
         |                                 ^~~


vim +156 net/ipv4/fib_semantics.c

   149	
   150	static void rt_fibinfo_free(struct rtable __rcu **rtp)
   151	{
   152		struct rtable *rt = rcu_dereference_protected(*rtp, 1);
   153	
   154		if (!rt)
   155			return;
 > 156		if (!&rt->dst)
   157			return;
   158	
   159		/* Not even needed : RCU_INIT_POINTER(*rtp, NULL);
   160		 * because we waited an RCU grace period before calling
   161		 * free_fib_info_rcu()
   162		 */
   163	
   164		dst_dev_put(&rt->dst);
   165		dst_release_immediate(&rt->dst);
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
