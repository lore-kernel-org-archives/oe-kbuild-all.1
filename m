Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116D41891A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725960129; cv=none; b=sc3OKcEKnAq1WdqoulaE1R3WYJYLFhABheMQcYPeklG7OFKSBoJulrDDX8vRdpl3qz65koZqpnW34YEAVJGQnMSTOr0xrpzT+9TxZdjXdO4Wtlez9cM4eATYe7P5Ry6cPZ5W7PYkNNqj0gX4eqZMwNCESmmJiQ01cqG+0v9XRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725960129; c=relaxed/simple;
	bh=8OuhZYhgh5XhzjIu9fipi6ts4GTgTizHQMjbiDTLB9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qV6P/9IAw9dOJP0lrJSHqeuY2kpIO4vnTnG3rB0Nv0XKAeDxPM+5IE8+GQ5BnTyoU6aGTAY1uA9b4/4QqDly67K2KmhQJw7oep+JGoOCBMa43miS6+311XsT6NytWKsHPjsjyLMcrB7ox0E5SfYlKOyvMQyG6IBE656Paeq4qIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cED/xIAh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cED/xIAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725960127; x=1757496127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8OuhZYhgh5XhzjIu9fipi6ts4GTgTizHQMjbiDTLB9Y=;
  b=cED/xIAhxcZJ1U9KEnivyehAlPTrWJhJy4/Z1EZqPc3SiH8dpyLMV37k
   8wt74IYvKa1itg4bUSGrREe25P+VQn3K8jxhAZUH3diLReddKu4Kx941q
   WG/1cfontohjXCi26ru6769Os2k1DyOQBUM9+ZJU4SFJmp+fXEsqyaOfI
   LE0n/2S/7jyGoHC4LVQBqg0wfyPjcYgi1pZgSM9dMdzA5e6DaNycUcGwE
   GsOYNYG4lFX4sQUSqjeL2s5HbjZK6sjdG798s+wI8VrTHuL5gi2uqFjYs
   wXccWaBDVmxw8EDAIhwYm/9cqyMIk3tx7OliB8pwV3qb+T4ZRyXO9Of7j
   g==;
X-CSE-ConnectionGUID: owhon8EKScWljcZ8ihll8g==
X-CSE-MsgGUID: H/p3IBCsQBifECKIy4rRiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="13455275"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="13455275"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:22:05 -0700
X-CSE-ConnectionGUID: oLGL7Xc/Tv2qKXqxN7fCgg==
X-CSE-MsgGUID: lVFs/IsBQYqAfYcF5FjLtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67494873"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2024 02:22:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snx4U-0000LK-1h;
	Tue, 10 Sep 2024 09:22:02 +0000
Date: Tue, 10 Sep 2024 17:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2] net/ipv4/tcp_input.c:4515
 tcp_rcv_spurious_retrans() warn: inconsistent indenting
Message-ID: <202409101751.1FoF3985-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f31bdfa6dc193afe48f1dc79503ed3f149961aa7
commit: c4db168998fa4b38e7857f435be9e7e8ba937bc1 [1/2] ANDROID: GKI: net: add vendor hooks net qos for gki purpose
config: i386-randconfig-141-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101751.1FoF3985-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101751.1FoF3985-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_input.c:4515 tcp_rcv_spurious_retrans() warn: inconsistent indenting

vim +4515 net/ipv4/tcp_input.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  4505  
7788174e8726c3 Yuchung Cheng  2018-08-29  4506  static void tcp_rcv_spurious_retrans(struct sock *sk, const struct sk_buff *skb)
7788174e8726c3 Yuchung Cheng  2018-08-29  4507  {
7788174e8726c3 Yuchung Cheng  2018-08-29  4508  	/* When the ACK path fails or drops most ACKs, the sender would
7788174e8726c3 Yuchung Cheng  2018-08-29  4509  	 * timeout and spuriously retransmit the same segment repeatedly.
7788174e8726c3 Yuchung Cheng  2018-08-29  4510  	 * The receiver remembers and reflects via DSACKs. Leverage the
7788174e8726c3 Yuchung Cheng  2018-08-29  4511  	 * DSACK state and change the txhash to re-route speculatively.
7788174e8726c3 Yuchung Cheng  2018-08-29  4512  	 */
c4db168998fa4b Jyu Jiang      2024-07-10  4513  	 trace_android_rvh_tcp_rcv_spurious_retrans(sk);
c4db168998fa4b Jyu Jiang      2024-07-10  4514  
9c30ae8398b081 Yuchung Cheng  2021-01-19 @4515  	if (TCP_SKB_CB(skb)->seq == tcp_sk(sk)->duplicate_sack[0].start_seq &&
9c30ae8398b081 Yuchung Cheng  2021-01-19  4516  	    sk_rethink_txhash(sk))
32efcc06d2a15f Abdul Kabbani  2020-01-24  4517  		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAREHASH);
32efcc06d2a15f Abdul Kabbani  2020-01-24  4518  }
7788174e8726c3 Yuchung Cheng  2018-08-29  4519  

:::::: The code at line 4515 was first introduced by commit
:::::: 9c30ae8398b0813e237bde387d67a7f74ab2db2d tcp: fix TCP socket rehash stats mis-accounting

:::::: TO: Yuchung Cheng <ycheng@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
