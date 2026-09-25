Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AFF416851
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 23:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790380309; cv=none; b=hDJJz7czsBQuFKGlB/vSAQPTLkMEbzwWCqXLUenihehkyULiqbUDok3mRu8W5E2d/QvRQFp4tLi7YUISXwdZivXw3PMlSqeJDjiiYUm//V6cjoiOdf628YsRs2J7yB2m9jAI1t7kLCxyNxM4t3fEQAp3dfIvUBG9km590HSUseM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790380309; c=relaxed/simple;
	bh=PseVter3M4NKfsM211ry/D9zNo6iz/zrkJ09hOKgBG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PEr2dTNXeUJUyB0tl7/cSkKHx2tJa6gMHJ4My8S0ciBxFQkjNLZtCx9bASZciIMb897t5QZ6TCrc0/9zfGd/QuTqhsk2bRqAGdoH2JQZOyvNlvAlAikpGCNwCUIFD0Getx8Syjf+j5pxtg0i4CBhL1wlscBYEjIyHWenf5H4svQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NX5X/9m3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NX5X/9m3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790380308; x=1821916308;
  h=date:from:to:cc:subject:message-id;
  bh=PseVter3M4NKfsM211ry/D9zNo6iz/zrkJ09hOKgBG0=;
  b=NX5X/9m3sWVjX/0clOEoIZdSDnJKBWQ7KhC5t8kwl0fiY/9sOtu2TYm/
   izBbEWBuj5nnVg9KvrMsynrZCJSQIDvZ/Pz1CQFGL6BfdYwyLDsCRty03
   naHAsL+l1ADmcF1Nlo6bVIx+wiekf7HKXWhL5E5OV11r+xZNAaZzmilUV
   jUxAiSdx6k9vTGdnCkZ2A2YsmXvOxzdO33uv7oltqt5fyO7yG1hflBdsa
   MUYEmCbCfTh9+wFiTh82ksSSlpf/szhRgk7WOnyU8VCp4K/Lfri/2cc51
   M1Qj8XTh2n1nj++CAYqk+uZo1On2tfJzbYzb+pxb2ETLfdMAKHX7zJahA
   A==;
X-CSE-ConnectionGUID: foajxqetQn+x9KLXCHkriA==
X-CSE-MsgGUID: /uxb0SdbSZejphanvEFGVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="100504514"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="100504514"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:51:47 -0700
X-CSE-ConnectionGUID: L5nuHNSITEWnW29+0pBR9Q==
X-CSE-MsgGUID: tcya7XnSRAyl2ZKXXk0r7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="282534564"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2026 16:51:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAFhf-00000000LLR-1YGF;
	Fri, 25 Sep 2026 23:51:43 +0000
Date: Sat, 26 Sep 2026 07:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-09 0/1]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:2173: warning: expecting
 prototype for idpf_tx_splitq_has_room(). Prototype was for
 idpf_txq_has_room() instead
Message-ID: <202609260706.34uDMenv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Joshua,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-09
head:   8dba035b01c49d304dfaf20bdfaf36bf064d858a
commit: a7a7bff258e1f5aee2bb95ebbc12bbd6533dd1e7 [0/1] idpf: stop Tx if there are insufficient buffer resources
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260926/202609260706.34uDMenv-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260706.34uDMenv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260706.34uDMenv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:2173: warning: expecting prototype for idpf_tx_splitq_has_room(). Prototype was for idpf_txq_has_room() instead


vim +2173 drivers/net/ethernet/intel/idpf/idpf_txrx.c

6818c4d5b3c2e9 Joshua Hay    2023-08-07  2162  
a7a7bff258e1f5 Joshua Hay    2025-12-15  2163  /**
a7a7bff258e1f5 Joshua Hay    2025-12-15  2164   * idpf_tx_splitq_has_room - check if enough Tx splitq resources are available
a7a7bff258e1f5 Joshua Hay    2025-12-15  2165   * @tx_q: the queue to be checked
a7a7bff258e1f5 Joshua Hay    2025-12-15  2166   * @descs_needed: number of descriptors required for this packet
a7a7bff258e1f5 Joshua Hay    2025-12-15  2167   * @bufs_needed: number of Tx buffers required for this packet
a7a7bff258e1f5 Joshua Hay    2025-12-15  2168   *
a7a7bff258e1f5 Joshua Hay    2025-12-15  2169   * Return: 0 if no room available, 1 otherwise
12e40d01d6d1aa Brian Vazquez 2025-05-01  2170   */
a7a7bff258e1f5 Joshua Hay    2025-12-15  2171  static int idpf_txq_has_room(struct idpf_tx_queue *tx_q, u32 descs_needed,
a7a7bff258e1f5 Joshua Hay    2025-12-15  2172  			     u32 bufs_needed)
12e40d01d6d1aa Brian Vazquez 2025-05-01 @2173  {
a7a7bff258e1f5 Joshua Hay    2025-12-15  2174  	if (IDPF_DESC_UNUSED(tx_q) < descs_needed ||
12e40d01d6d1aa Brian Vazquez 2025-05-01  2175  	    IDPF_TX_COMPLQ_PENDING(tx_q->txq_grp) >
12e40d01d6d1aa Brian Vazquez 2025-05-01  2176  		IDPF_TX_COMPLQ_OVERFLOW_THRESH(tx_q->txq_grp->complq) ||
a7a7bff258e1f5 Joshua Hay    2025-12-15  2177  	    IDPF_TX_BUF_RSV_LOW(tx_q) ||
a7a7bff258e1f5 Joshua Hay    2025-12-15  2178  	    idpf_tx_splitq_get_free_bufs(tx_q->refillq) < bufs_needed)
12e40d01d6d1aa Brian Vazquez 2025-05-01  2179  		return 0;
12e40d01d6d1aa Brian Vazquez 2025-05-01  2180  	return 1;
12e40d01d6d1aa Brian Vazquez 2025-05-01  2181  }
12e40d01d6d1aa Brian Vazquez 2025-05-01  2182  

:::::: The code at line 2173 was first introduced by commit
:::::: 12e40d01d6d1aa9224200d6b9d9570d6aa68ef74 idpf: fix a race in txq wakeup

:::::: TO: Brian Vazquez <brianvv@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
