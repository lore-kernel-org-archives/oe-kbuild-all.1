Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052291474AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 20:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708719834; cv=none; b=XZHv6BbXkO8LIpePQVrP+aVApdsthLIRM8NghXxPwvGDMAsrMSKMtPXV6p3m19BPrEMQEESaaoVnRCTeyST8LYwMnIBTijQ81NU3aE8gkcU2w6aFOIEBpzuWdUkdG0vFctQhup0iAxBhNq4k3qoPqqOY6d7qGScWOr1D4HjRJlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708719834; c=relaxed/simple;
	bh=kAaTEhhiTNud95f4bAcarsb0pXO6/acqwANSWvoXoTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2Zr6Pdvz54Isz5L23BD7w2v3G6CPBceifQ5N5OW+sB+yOe5lZGxAoDx6YNjSj6UT+nkTcSqTOQz2Ucz2twlgt5U6ppDeFFYbEXYxO1pma5/GaPiQL4r6wScgb+hZac41H3thK/Ra3IPB8uWNXp6/mJB47Uu5JuocS7+lJJrXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkz9sogG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkz9sogG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708719831; x=1740255831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kAaTEhhiTNud95f4bAcarsb0pXO6/acqwANSWvoXoTM=;
  b=hkz9sogGqB+3qU0WwEXGuYdUCNsiLTN7x6yTKEfngV4sG5mohcRkVs34
   +kvGKSVcjFdF4vGjIqWNUAGJYTw7XgKN2TCX1aiN5zAjioxlCH/nx5NHh
   A0NY6Pr4Ehsk7Ic595TnvTahmwL0yRkn1qksPK8wsNSZScrGmad+7IUcF
   pnrfrIUx09sl/Y9tl29VAmNCd/+yCK4Mq9J7FvRkkIflXmPsxlUxuPsuk
   02WC5aj6pOozD2imIZ7a2c8VGLWg1Ze8dKeHQ6W3cL34xPK7AGm1Q1tXH
   FXSNUhSVg6eYxscFbSo4bCCB3GbXb7Q7w44pN6E5R7qG9a2A5K03PGLEo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20502870"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="20502870"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 12:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="10787622"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2024 12:23:48 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdc5B-0007ra-1D;
	Fri, 23 Feb 2024 20:23:45 +0000
Date: Sat, 24 Feb 2024 04:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/ipv4/tcp_input.c:3326: warning: Function parameter or member
 'sk' not described in 'tcp_ack_probe_shrink'
Message-ID: <202402240418.FmtbiCMu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 3cb15a9934fc12a72319eac9cad18be9349fd41d net: tcp: raise zero-window probe without check wnd_end
date:   10 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240418.FmtbiCMu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240418.FmtbiCMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240418.FmtbiCMu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_input.c:3326: warning: Function parameter or member 'sk' not described in 'tcp_ack_probe_shrink'
   net/ipv4/tcp_input.c:4488: warning: Excess function parameter 'dest' description in 'tcp_try_coalesce'


vim +3326 net/ipv4/tcp_input.c

^590eaf1fec7552 Kaixu Xia     2021-03-16  3317  
1b26e26567839ee Menglong Dong 2023-03-17  3318  #ifdef CONFIG_TCP_WND_SHRINK
3cb15a9934fc12a Menglong Dong 2023-05-06  3319  /**
3cb15a9934fc12a Menglong Dong 2023-05-06  3320   * This function is called only when there are packets in the rtx queue,
3cb15a9934fc12a Menglong Dong 2023-05-06  3321   * which means that the packets out is not 0.
3cb15a9934fc12a Menglong Dong 2023-05-06  3322   *
3cb15a9934fc12a Menglong Dong 2023-05-06  3323   * NOTE: we only handle window shrink case in this part.
3cb15a9934fc12a Menglong Dong 2023-05-06  3324   */
1b26e26567839ee Menglong Dong 2023-03-17  3325  static void tcp_ack_probe_shrink(struct sock *sk)
1b26e26567839ee Menglong Dong 2023-03-17 @3326  {
1b26e26567839ee Menglong Dong 2023-03-17  3327  	struct inet_connection_sock *icsk = inet_csk(sk);
1b26e26567839ee Menglong Dong 2023-03-17  3328  	unsigned long when;
1b26e26567839ee Menglong Dong 2023-03-17  3329  
3cb15a9934fc12a Menglong Dong 2023-05-06  3330  	if (tcp_rtx_overflow(sk)) {
3cb15a9934fc12a Menglong Dong 2023-05-06  3331  		when = tcp_probe0_when(sk, TCP_RTO_MAX);
3cb15a9934fc12a Menglong Dong 2023-05-06  3332  
3cb15a9934fc12a Menglong Dong 2023-05-06  3333  		when = tcp_clamp_probe0_to_user_timeout(sk, when);
3cb15a9934fc12a Menglong Dong 2023-05-06  3334  		tcp_reset_xmit_timer(sk, ICSK_TIME_PROBE0,
3cb15a9934fc12a Menglong Dong 2023-05-06  3335  				     when, TCP_RTO_MAX, NULL);
3cb15a9934fc12a Menglong Dong 2023-05-06  3336  	} else {
1b26e26567839ee Menglong Dong 2023-03-17  3337  		/* check if recover from window shrink */
1b26e26567839ee Menglong Dong 2023-03-17  3338  		if (icsk->icsk_pending != ICSK_TIME_PROBE0)
1b26e26567839ee Menglong Dong 2023-03-17  3339  			return;
1b26e26567839ee Menglong Dong 2023-03-17  3340  
1b26e26567839ee Menglong Dong 2023-03-17  3341  		icsk->icsk_backoff = 0;
1b26e26567839ee Menglong Dong 2023-03-17  3342  		icsk->icsk_probes_tstamp = 0;
1b26e26567839ee Menglong Dong 2023-03-17  3343  		inet_csk_clear_xmit_timer(sk, ICSK_TIME_PROBE0);
1b26e26567839ee Menglong Dong 2023-03-17  3344  		if (!tcp_rtx_queue_empty(sk))
1b26e26567839ee Menglong Dong 2023-03-17  3345  			tcp_retransmit_timer(sk);
1b26e26567839ee Menglong Dong 2023-03-17  3346  	}
1b26e26567839ee Menglong Dong 2023-03-17  3347  }
1b26e26567839ee Menglong Dong 2023-03-17  3348  #else
1b26e26567839ee Menglong Dong 2023-03-17  3349  static void tcp_ack_probe_shrink(struct sock *sk) { }
1b26e26567839ee Menglong Dong 2023-03-17  3350  #endif
1b26e26567839ee Menglong Dong 2023-03-17  3351  

:::::: The code at line 3326 was first introduced by commit
:::::: 1b26e26567839ee4ce0de328372a544f17d5a10c net: tcp: handle window shrink properly

:::::: TO: Menglong Dong <imagedong@tencent.com>
:::::: CC: Menglong Dong <imagedong@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
