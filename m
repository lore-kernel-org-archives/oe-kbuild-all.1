Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987323;
	b=kvLDCQhgazuIuIMNZiTx10DNtzieDKgHkMIKYfuAiTPkXNoHxyzYR2azcNQM9hPBJBcX
	 9r8h3LHJIwVtScLDS0yPksA27Jp/OkZSMWtPxBUF9W04D3RannM7qYKWGvRz8rkZr48cc
	 MR8ZOH2d+3CpekE+nhmOPKqS1sfch8TmI70IriYg1gPLlNHX8F/y68z670lHjjQMEIal1
	 ufEM+kqYUJN2BKv3bFJ0W92eY6cBZyPL0cDb1xmvDhIyWmVTPOTbN0GqJhPcNZGm+rx3x
	 GlsOdQ7Oa2tHJ9Fw8jbdG2YryOFOB1Pw782ikxsbScFh1UdrHFz4R4ROEBDmLk/bdRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987323;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=J4n3fHgxqwZ+SsjaW3RCZFK+e6ZNT71TXd5q+lZnzxg=;
	b=w+XZRhybB6H+Z/KU1vVqi+Z9qo9OclLwjaw7HJHuDscsgAIJhsUalVctIVwIeAzP30uy
	 n+WTvQj+1rFVa8sWmGOq12PAEaD3KSaeFwXGkJtPefVAR+77Ow+is9tn/UuFgLb730oAV
	 Bl42oI7oulZqYbhPT33JymHuVSr4KaNgHdLJ7NWQxJSsrw9VbCNBUsIBx4tPLcfKLu/b6
	 j3GrNKPIs9OCDwV6iG4LVq/8/DNDzVo7YGIx53Nmc4mLyJVBpdDCTBwvcZjHAIHykl5RZ
	 dKwbKcxIktbAbdKNmNuSePQrNtyDUAtYiMure7kN9gJfm+WT7Jqvb7JVAaVy3NQUrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hG50XnQH;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F35606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 17:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F35606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hG50XnQH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793987323; x=1825523323;
  h=date:from:to:cc:subject:message-id;
  bh=wLt1OQuQjjJVrEziYTDXU2l5yhAnlybHRSzoQI7Qv8c=;
  b=hG50XnQHdk+jW1OYaw+/+Mewme9V+zEnj1/6UVzIGtSneckCfr0lft+F
   dQVxR3xhy96p3600cbAhiF3sM1C4gpJXr0Bx4HN5OaUOJkKDr0wNZDNaN
   yeOOhOnb+9WWrz/MSA29m4cEvnNkxl8PSwMgBEZxp4pUQ3AhgzZU351iK
   qpO4Qsi8gMn4D02L/WpjAWhhA7gmAqMwicxFbYkvRTLSrtaEEA4lGoFY3
   PNSXTnO57u/LsaGSOWW7Zy83vMze4bW2wIZfDtJJ+DA0azc86PwnQ48Uh
   hZAd1cFHvb5fM9T0xry9edJbxMmJ7xrqQLM/h6PCltXqD3b0UdS3qTP1K
   A==;
X-CSE-ConnectionGUID: 46tHf3tYTsS/FyzVd0inTQ==
X-CSE-MsgGUID: Qn9Xkkr8Tuu3/zYI8x+ZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2826189"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2826189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 09:48:42 -0800
X-CSE-ConnectionGUID: p6rvjY3bR8215OzLHX9i7w==
X-CSE-MsgGUID: Uqa7JADTTqqIU/kjS2IhXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7457150"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2026 09:48:40 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPO3J-00000000AKJ-01SX;
	Fri, 06 Nov 2026 17:48:37 +0000
Date: Fri, 06 Nov 2026 18:47:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 390/390]
 net/ipv4/tcp_input.c:4567 tcp_rcv_spurious_retrans() warn: inconsistent
 indenting
Message-ID: <202611061810.lHo5nIlP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: f6c21bc9a693a4b585757ce3a53e6a7d9402dfb2 [390/390] ANDROID: GKI: net: add vendor hooks net qos for gki purpose
config: i386-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611061810.lHo5nIlP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061810.lHo5nIlP-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_input.c:4567 tcp_rcv_spurious_retrans() warn: inconsistent indenting

vim +4567 net/ipv4/tcp_input.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  4557  
7788174e8726c3 Yuchung Cheng  2018-08-29  4558  static void tcp_rcv_spurious_retrans(struct sock *sk, const struct sk_buff *skb)
7788174e8726c3 Yuchung Cheng  2018-08-29  4559  {
7788174e8726c3 Yuchung Cheng  2018-08-29  4560  	/* When the ACK path fails or drops most ACKs, the sender would
7788174e8726c3 Yuchung Cheng  2018-08-29  4561  	 * timeout and spuriously retransmit the same segment repeatedly.
7788174e8726c3 Yuchung Cheng  2018-08-29  4562  	 * The receiver remembers and reflects via DSACKs. Leverage the
7788174e8726c3 Yuchung Cheng  2018-08-29  4563  	 * DSACK state and change the txhash to re-route speculatively.
7788174e8726c3 Yuchung Cheng  2018-08-29  4564  	 */
f6c21bc9a693a4 Jyu Jiang      2024-07-10  4565  	 trace_android_rvh_tcp_rcv_spurious_retrans(sk);
f6c21bc9a693a4 Jyu Jiang      2024-07-10  4566  
9c30ae8398b081 Yuchung Cheng  2021-01-19 @4567  	if (TCP_SKB_CB(skb)->seq == tcp_sk(sk)->duplicate_sack[0].start_seq &&
9c30ae8398b081 Yuchung Cheng  2021-01-19  4568  	    sk_rethink_txhash(sk))
32efcc06d2a15f Abdul Kabbani  2020-01-24  4569  		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAREHASH);
32efcc06d2a15f Abdul Kabbani  2020-01-24  4570  }
7788174e8726c3 Yuchung Cheng  2018-08-29  4571  

:::::: The code at line 4567 was first introduced by commit
:::::: 9c30ae8398b0813e237bde387d67a7f74ab2db2d tcp: fix TCP socket rehash stats mis-accounting

:::::: TO: Yuchung Cheng <ycheng@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
