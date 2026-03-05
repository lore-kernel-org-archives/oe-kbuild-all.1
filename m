Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F3C1DE4EF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772689513; cv=none; b=U4AaksVu71Bw+oNctcfxkaiczo0TD0OMX/K2fNyYbotOcVjOw3gfHxGnmXsJ2WA2X+QVB3/f3CaxNUbXfGXSSKZUzOA5KrnLBLmvWLE/x/hjo6Ws5OJThPy5F450QbOM30e9+BlfklfC1ZVhDd2I06Wxv1z/rB75qsz3RyOqeCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772689513; c=relaxed/simple;
	bh=qP7Q6SenDUd2uqoYX7vyW4EsU0pCAPYo859WuHMey88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ax907X10Tu2ny6hL+IIBAzPyBf3Hvo80NBV+dDBtWt6UYDyadceh9EDOStRNTof3EYK4fxpHQCJvzMOuWLuctkxmOkYqIqJdUSGxlTIVvDpSsM8q2vD4XVY9p64+wRh9SyT3KxDbxaGDiOxReBlXPNRSJE3sIgG1onOiZyW3JSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5vjEedJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5vjEedJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772689512; x=1804225512;
  h=date:from:to:cc:subject:message-id;
  bh=qP7Q6SenDUd2uqoYX7vyW4EsU0pCAPYo859WuHMey88=;
  b=E5vjEedJLFSRD2Y8CTpbIJsnuBafGeKXA0ramEX3XtQp5gnN3B6SAYJ8
   /KRHQxahGxFjn71J3WkoJ+OXzwFIUXrwj/qi2p9syllAMJ/P8NZZWvuhQ
   Xq4AQWzcbcUlePv3o0JQbAHtkBchdXQz33DshFVuw8HcdqmqXzbaDduW1
   Wr/Dgus6PK81Gga5OyRNoHLwLHqXYv1cdEy+9+ty2okblVhWCtFZ7YkxK
   NOOm6472/lOWDAPDKn1J2vPeM2FVxoikIKyaOvCravergHiZ4OdiTvHIc
   WQTXqTd2JeawXYx/SlFcxklnqevdyeRGa3ILwgdJ9uWoqXutJSc+8P6Gq
   A==;
X-CSE-ConnectionGUID: cfj/X2x9RyCcnpSsbo7rxQ==
X-CSE-MsgGUID: h15Qw7V/RpKbwSriayXEGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91157393"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91157393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 21:45:11 -0800
X-CSE-ConnectionGUID: 9ZI0FAMJSP6MTDXvfhJTmA==
X-CSE-MsgGUID: th4oZ+fwS42g1VFgHDCh5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="223067104"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2026 21:45:10 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy1V1-0000000009L-0tQs;
	Thu, 05 Mar 2026 05:44:06 +0000
Date: Thu, 05 Mar 2026 13:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.12.y 955/955]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:2173: warning: expecting
 prototype for idpf_tx_splitq_has_room(). Prototype was for
 idpf_txq_has_room() instead
Message-ID: <202603051332.BzjpLq6I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: a7a7bff258e1f5aee2bb95ebbc12bbd6533dd1e7 [955/955] idpf: stop Tx if there are insufficient buffer resources
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051332.BzjpLq6I-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051332.BzjpLq6I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051332.BzjpLq6I-lkp@intel.com/

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
