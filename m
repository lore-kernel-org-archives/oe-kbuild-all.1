Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD21280CC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594872; cv=none; b=WLcY9KWalTesYZBGp4dEXSxL4BiHFcZEy47RdlfDE4Wr5NTL43ar/OjPnU1SFx5THs2W3h2rsGJrYxd5rN435G1udEeBr0JLvNEsAxn11MYgbWDZpqkyFDfijZs9maenGvZUlIRrDizMRd1WxCLNomQMUCmjALXVHwNV/3Slojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594872; c=relaxed/simple;
	bh=C0SNhXhjzRzvcmH8IiWg1TJgsJ9hdhezjrbh09lkMoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rHReJhFiSgflvhne+Iv6WC7/rTzBzE01LTHlQ/sI1QqbuaXWLJYDVtG428z+5xqF7OMnpKgACwl8JUCzC+9EwHeXQMklvZuqal4kcVHFKe9vkxak4TU2dNAbtPSYOjtcbZMNNQgVYg81hJtA4GgDHm7wuuBJTsCyBvBUILmqu5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+GHLUMh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+GHLUMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781594871; x=1813130871;
  h=date:from:to:cc:subject:message-id;
  bh=C0SNhXhjzRzvcmH8IiWg1TJgsJ9hdhezjrbh09lkMoM=;
  b=R+GHLUMhTTE515XSlgtIZ/fbfPmscrmlT7ahnrIIkw2qogq7Y5+HQyYE
   A593YiIQyzcUB3Oj/rraM+mWYfLa51WB9cXpsCiua5NWuWkNVS+IUyR3/
   SVpMW3EHxyEnXl6gx1+Ef5nsFPHrBNtbQEgVPlUyorM8RgkNJxYBIpKst
   hyK3qT7NogToDYpkvCVjzu1ruRynHn0CzCtkDoc7B2bWxPN+z7PMfS4y5
   aTKcCxZiMzBTi9rc/FtStY7Kz3TDJFtSOXzlUV1xfYdDq21nwSfonRDZp
   w07jmh1VssUuQm1FCLVO8dQQst4EuJiT+zN2Yb0Vylc0JhSzQ41wSav7s
   Q==;
X-CSE-ConnectionGUID: l4uYbXB1QEytzWjb3ju00Q==
X-CSE-MsgGUID: ruDH2JX+TPKxWqCQ9fjhnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99925042"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="99925042"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:27:50 -0700
X-CSE-ConnectionGUID: ZZrVQGHeQrKhV7JAS2qRGw==
X-CSE-MsgGUID: KEjYk4DoRUO+bF5OhxeL1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247757228"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2026 00:27:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZOD3-00000000Sr4-1CBU;
	Tue, 16 Jun 2026 07:27:45 +0000
Date: Tue, 16 Jun 2026 15:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 1/1]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:2173: warning: expecting
 prototype for idpf_tx_splitq_has_room(). Prototype was for
 idpf_txq_has_room() instead
Message-ID: <202606161516.ajedEUJv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Joshua,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   8348ff4d333b3eb995260fb6905eb19c08cb717a
commit: a7a7bff258e1f5aee2bb95ebbc12bbd6533dd1e7 [1/1] idpf: stop Tx if there are insufficient buffer resources
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260616/202606161516.ajedEUJv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161516.ajedEUJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161516.ajedEUJv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:2173: warning: expecting prototype for idpf_tx_splitq_has_room(). Prototype was for idpf_txq_has_room() instead


vim +2173 drivers/net/ethernet/intel/idpf/idpf_txrx.c

6818c4d5b3c2e9d Joshua Hay    2023-08-07  2162  
a7a7bff258e1f5a Joshua Hay    2025-12-15  2163  /**
a7a7bff258e1f5a Joshua Hay    2025-12-15  2164   * idpf_tx_splitq_has_room - check if enough Tx splitq resources are available
a7a7bff258e1f5a Joshua Hay    2025-12-15  2165   * @tx_q: the queue to be checked
a7a7bff258e1f5a Joshua Hay    2025-12-15  2166   * @descs_needed: number of descriptors required for this packet
a7a7bff258e1f5a Joshua Hay    2025-12-15  2167   * @bufs_needed: number of Tx buffers required for this packet
a7a7bff258e1f5a Joshua Hay    2025-12-15  2168   *
a7a7bff258e1f5a Joshua Hay    2025-12-15  2169   * Return: 0 if no room available, 1 otherwise
12e40d01d6d1aa9 Brian Vazquez 2025-05-01  2170   */
a7a7bff258e1f5a Joshua Hay    2025-12-15  2171  static int idpf_txq_has_room(struct idpf_tx_queue *tx_q, u32 descs_needed,
a7a7bff258e1f5a Joshua Hay    2025-12-15  2172  			     u32 bufs_needed)
12e40d01d6d1aa9 Brian Vazquez 2025-05-01 @2173  {
a7a7bff258e1f5a Joshua Hay    2025-12-15  2174  	if (IDPF_DESC_UNUSED(tx_q) < descs_needed ||
12e40d01d6d1aa9 Brian Vazquez 2025-05-01  2175  	    IDPF_TX_COMPLQ_PENDING(tx_q->txq_grp) >
12e40d01d6d1aa9 Brian Vazquez 2025-05-01  2176  		IDPF_TX_COMPLQ_OVERFLOW_THRESH(tx_q->txq_grp->complq) ||
a7a7bff258e1f5a Joshua Hay    2025-12-15  2177  	    IDPF_TX_BUF_RSV_LOW(tx_q) ||
a7a7bff258e1f5a Joshua Hay    2025-12-15  2178  	    idpf_tx_splitq_get_free_bufs(tx_q->refillq) < bufs_needed)
12e40d01d6d1aa9 Brian Vazquez 2025-05-01  2179  		return 0;
12e40d01d6d1aa9 Brian Vazquez 2025-05-01  2180  	return 1;
12e40d01d6d1aa9 Brian Vazquez 2025-05-01  2181  }
12e40d01d6d1aa9 Brian Vazquez 2025-05-01  2182  

:::::: The code at line 2173 was first introduced by commit
:::::: 12e40d01d6d1aa9224200d6b9d9570d6aa68ef74 idpf: fix a race in txq wakeup

:::::: TO: Brian Vazquez <brianvv@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
