Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF41B647
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 03:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721360407; cv=none; b=QzrQq/X/TOOAue01P7OdlJpfj0qARv8QrKlMpHNjOoPMnHL6lkXsreWaqItUoAVG/BI24dwcE2QOBT7XWZzNw6txQcHx6P5nYoxqZ2v747+aAM4EvmiOLz83SYcr46cWmdf5oePfUTumALvdLMNoNqrMri8NgoOGDHi3WABbPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721360407; c=relaxed/simple;
	bh=xah0q6VeUASRBMbY0pKeAphX/VnGx2lFx8kpBbHaJ7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HprLkOUYumigSMEevTad8CZLS78X2Jrt7HIZEbK0OepA58U8b0H5AaQp5PBi5kIZQl7HzULix1DsYEK+HecEKF5CZMy+NvBuakjs4HWNAXjbIgw/XlWxNbStbqvidWxQyRUSoBoBRTHhabuidCiJU71sGhydBjR1/Q99qGEnhmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUShwq7L; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUShwq7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721360406; x=1752896406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xah0q6VeUASRBMbY0pKeAphX/VnGx2lFx8kpBbHaJ7g=;
  b=VUShwq7LFF6sSDs8UfP+0AbeTfuSv1Jm7kPElpdbT5BkdpCAKwlrbrul
   pHcQaFvogeOHOV33jeAVfswnrc8wgPBghyaVxF7vf94GJtxRaPFmP9SD7
   s9mAH2nC4rOzMOcGe8t9vaA7Nraw95gHyWBoCTrxl0gk4da5nhTUoU1MO
   ilSlmxejlh829ASae6nYa/zenFLJVPjEqzTl0LLzWdafOM+gw6VboNk4s
   6Vfdg7hE1+bJ/3Jf/ZHyaXjESB0dwh/W9sNy6RDgXq2THLTmNlXIHPKE0
   9mMePel/fJv++fgeS6izf7BHCECD3na2SAgBTRarwHc1GboffOjOGJXW6
   A==;
X-CSE-ConnectionGUID: h6RLtHtLToeWbl42Fvp/Ow==
X-CSE-MsgGUID: hOnZc9JZRDSvaTPxFfnKvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18667640"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="18667640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 20:40:05 -0700
X-CSE-ConnectionGUID: l4mosJ9pQ+KOlV6/oII5fw==
X-CSE-MsgGUID: hlvTBEeqQkKpoam6MHno7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="51686102"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jul 2024 20:40:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUeTR-000how-2A;
	Fri, 19 Jul 2024 03:40:01 +0000
Date: Fri, 19 Jul 2024 11:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2] net/ipv4/tcp_input.c:4515
 tcp_rcv_spurious_retrans() warn: inconsistent indenting
Message-ID: <202407191144.kpUsToxj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   485f58484dd83e1f0ab5a620a88a0120bf605cdd
commit: c4db168998fa4b38e7857f435be9e7e8ba937bc1 [1/2] ANDROID: GKI: net: add vendor hooks net qos for gki purpose
config: i386-randconfig-141-20240719 (https://download.01.org/0day-ci/archive/20240719/202407191144.kpUsToxj-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407191144.kpUsToxj-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_input.c:4515 tcp_rcv_spurious_retrans() warn: inconsistent indenting

vim +4515 net/ipv4/tcp_input.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  4505  
7788174e8726c30 Yuchung Cheng  2018-08-29  4506  static void tcp_rcv_spurious_retrans(struct sock *sk, const struct sk_buff *skb)
7788174e8726c30 Yuchung Cheng  2018-08-29  4507  {
7788174e8726c30 Yuchung Cheng  2018-08-29  4508  	/* When the ACK path fails or drops most ACKs, the sender would
7788174e8726c30 Yuchung Cheng  2018-08-29  4509  	 * timeout and spuriously retransmit the same segment repeatedly.
7788174e8726c30 Yuchung Cheng  2018-08-29  4510  	 * The receiver remembers and reflects via DSACKs. Leverage the
7788174e8726c30 Yuchung Cheng  2018-08-29  4511  	 * DSACK state and change the txhash to re-route speculatively.
7788174e8726c30 Yuchung Cheng  2018-08-29  4512  	 */
c4db168998fa4b3 Jyu Jiang      2024-07-10  4513  	 trace_android_rvh_tcp_rcv_spurious_retrans(sk);
c4db168998fa4b3 Jyu Jiang      2024-07-10  4514  
9c30ae8398b0813 Yuchung Cheng  2021-01-19 @4515  	if (TCP_SKB_CB(skb)->seq == tcp_sk(sk)->duplicate_sack[0].start_seq &&
9c30ae8398b0813 Yuchung Cheng  2021-01-19  4516  	    sk_rethink_txhash(sk))
32efcc06d2a15fa Abdul Kabbani  2020-01-24  4517  		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAREHASH);
32efcc06d2a15fa Abdul Kabbani  2020-01-24  4518  }
7788174e8726c30 Yuchung Cheng  2018-08-29  4519  

:::::: The code at line 4515 was first introduced by commit
:::::: 9c30ae8398b0813e237bde387d67a7f74ab2db2d tcp: fix TCP socket rehash stats mis-accounting

:::::: TO: Yuchung Cheng <ycheng@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
