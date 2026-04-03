Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC237F8B0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206083; cv=none; b=Y0fA3dvPnFmnOUdWgRgHgSlgavW79CjIURMimUrJgFMhYqCmBCXHblUEPLNHfoEeJ+0elKNyqJIS6V5Kq3Y8d9so9qM2L61LTewO+/xF44d6tpG076WQEqk6AhDRuwQCaurxOEscvZOFrko0LFIWydoO0NYbnHBbz5W4MmnwgTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206083; c=relaxed/simple;
	bh=q+DSrMz6SDViIoZGZZbdQt9kUJDLJmZbBj/h1j6jIS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MqjPWwAaGZzDDLOsUAv+3lydegH1pb6zILmmWWnmbTxdrqRUKch/eVRIuVgGDS7tnu35U0vqzK+X+r9Q1TeJgX11GzWCXeFcoDF2+xfpx1fLb4gresDwBHVj2rEKFiWpEQ+RTWE8wObW3ExUsf56PegZiT70/MAhwUtn0oExOuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ir4ofpdY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ir4ofpdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206081; x=1806742081;
  h=date:from:to:cc:subject:message-id;
  bh=q+DSrMz6SDViIoZGZZbdQt9kUJDLJmZbBj/h1j6jIS0=;
  b=Ir4ofpdYAYLRckGpkm1sIK80PSrBRMz5WTCplBVHRQE2YAD9fz8YDsAB
   u0oEyb9qxM4aGozMTBtftKC6yZsS3qs1YvdLHFwqBbtTvtSHkQaIohuLC
   kZwjZ0sj7oMA8BCYwGKzJ4wReBb96XK6Vqc4I8qIKzRQFlqya/tj/HiX7
   Cxx1y94WNWFhxMVSTKXELEJhDVMf2xhOUhhqH3bp9pBW2cjCX7wahZ2Dn
   nvJ9OmOxrDH7cDhBNsYpta7/5ChDnA/odbhKqSjyG/yS21tyok+aiiH8u
   BVWWRVvNwFwj7+OyGOQD1jcc8Ygc0F97fC2qHaK3VmJ98nJNy8/7Cuk4U
   g==;
X-CSE-ConnectionGUID: C81zqqjLS1K4/AiX/sdtuw==
X-CSE-MsgGUID: v27q/u+WRrmTX2NNUYdH1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76239380"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76239380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:48:01 -0700
X-CSE-ConnectionGUID: e4cadJ38Q6OPLP8NojCk8w==
X-CSE-MsgGUID: 7TtOo8WSSvWQ1eCdH6/IvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="222355508"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2026 01:47:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aC5-0000000017R-0Zoy;
	Fri, 03 Apr 2026 08:47:57 +0000
Date: Fri, 03 Apr 2026 16:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 8/8] net/ipv4/tcp_input.c:4567
 tcp_rcv_spurious_retrans() warn: inconsistent indenting
Message-ID: <202604031405.9E54YtQX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5e515a3e6a73395e13127a3a8172e77da3d9b30
commit: f6c21bc9a693a4b585757ce3a53e6a7d9402dfb2 [8/8] ANDROID: GKI: net: add vendor hooks net qos for gki purpose
config: i386-randconfig-141-20260402 (https://download.01.org/0day-ci/archive/20260403/202604031405.9E54YtQX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031405.9E54YtQX-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_input.c:4567 tcp_rcv_spurious_retrans() warn: inconsistent indenting

vim +4567 net/ipv4/tcp_input.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  4557  
7788174e8726c30 Yuchung Cheng  2018-08-29  4558  static void tcp_rcv_spurious_retrans(struct sock *sk, const struct sk_buff *skb)
7788174e8726c30 Yuchung Cheng  2018-08-29  4559  {
7788174e8726c30 Yuchung Cheng  2018-08-29  4560  	/* When the ACK path fails or drops most ACKs, the sender would
7788174e8726c30 Yuchung Cheng  2018-08-29  4561  	 * timeout and spuriously retransmit the same segment repeatedly.
7788174e8726c30 Yuchung Cheng  2018-08-29  4562  	 * The receiver remembers and reflects via DSACKs. Leverage the
7788174e8726c30 Yuchung Cheng  2018-08-29  4563  	 * DSACK state and change the txhash to re-route speculatively.
7788174e8726c30 Yuchung Cheng  2018-08-29  4564  	 */
f6c21bc9a693a4b Jyu Jiang      2024-07-10  4565  	 trace_android_rvh_tcp_rcv_spurious_retrans(sk);
f6c21bc9a693a4b Jyu Jiang      2024-07-10  4566  
9c30ae8398b0813 Yuchung Cheng  2021-01-19 @4567  	if (TCP_SKB_CB(skb)->seq == tcp_sk(sk)->duplicate_sack[0].start_seq &&
9c30ae8398b0813 Yuchung Cheng  2021-01-19  4568  	    sk_rethink_txhash(sk))
32efcc06d2a15fa Abdul Kabbani  2020-01-24  4569  		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAREHASH);
32efcc06d2a15fa Abdul Kabbani  2020-01-24  4570  }
7788174e8726c30 Yuchung Cheng  2018-08-29  4571  

:::::: The code at line 4567 was first introduced by commit
:::::: 9c30ae8398b0813e237bde387d67a7f74ab2db2d tcp: fix TCP socket rehash stats mis-accounting

:::::: TO: Yuchung Cheng <ycheng@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
