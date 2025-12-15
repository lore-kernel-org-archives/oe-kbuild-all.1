Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D721CF7D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786895; cv=none; b=fbIkK2HPU4SEDNIqNA7s5yCFOcYQkQj1126aC+IRVocoxsx7qR9CbG2yhAXcf1MgVxYKPgKsdLFwxDr3Ef/FJxhHLAOQEiduw70CLpzl2EQNFCZawY6WoZy3p/FI/VWtqt/TJIg0up062m/JJ9fBd/lF6OnwcxpOzTjjc/AIjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786895; c=relaxed/simple;
	bh=Eoch3/NTlXt93hMon1ESDwZfZhTaX5SDtSydrd743qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0nRQdiWKA+MOCMdy+DM2JmrzQF7i3jf8UQroP9AxD5jtfO8KLx8s9J7ufkhwfPbowjMr4vIlUnrhERQRj45hNVK4DWbXyl24YVIYyfZ4WcU8QhDiWgRGhHxoI0XFLEygQ5o34TWFdrhEzuDQF6HivSucFRy5IDPYaxdTl4hchY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F35KK16z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F35KK16z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765786894; x=1797322894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eoch3/NTlXt93hMon1ESDwZfZhTaX5SDtSydrd743qs=;
  b=F35KK16zRdAInQJ6e/azXntpd1V0h5cPrVjGIon49YkT18P88G+VSO4E
   BK7gg68a346wZ/5SaCDZdQYAUAIPnNOoBnbErejIrDxRUNkrS9Hl6Gf5q
   jop7zqQiNXHBJo/6F6KwZED7MvV+vUiACMGtQJ/7ft/tG0wZmjBzjWxfw
   5fSClrBZXzaTp8ARv6lAxI9rO5dMmx64aNQ0Afln/FORT9fDicpvJSjMk
   hgWOcQ7cliRoEaqaxUDUBR4VTQJZxxlkpxkCeXpAU4Cv8bYgRS4owqXdW
   Y0SNfDtIBKeGdb/XXexgbZVxyXPAW+N9ZFSoMqck/fObg181E1DEdKPPa
   Q==;
X-CSE-ConnectionGUID: ib2hBFH1Rz+rb7XqLF+qAw==
X-CSE-MsgGUID: i1VIa7T0Q06HTD3595h+mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85093160"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85093160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 00:21:33 -0800
X-CSE-ConnectionGUID: 3/z7WsNlRCGU1s8mZ1IzXQ==
X-CSE-MsgGUID: gYeNUEznQsiTq3rf774OvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228311215"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 00:21:32 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV3pB-0000000004T-1LOL;
	Mon, 15 Dec 2025 08:21:09 +0000
Date: Mon, 15 Dec 2025 16:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:1685:24: warning: variable 'nq' set
 but not used
Message-ID: <202512151653.mAEBFOna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81b22958142c03b02c766c79cd1554ebfa142be4
commit: 978eee07aea817a830a9146bd90f0506ac2f8482 [3542/3542] RDMA/bnxt_re: Fix budget handling of notification queue
config: x86_64-buildonly-randconfig-005-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151653.mAEBFOna-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151653.mAEBFOna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151653.mAEBFOna-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/ib_verbs.c:1685:24: warning: variable 'nq' set but not used [-Wunused-but-set-variable]
    1685 |         struct bnxt_qplib_nq *nq = NULL;
         |                               ^
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:1732:24: warning: variable 'nq' set but not used [-Wunused-but-set-variable]
    1732 |         struct bnxt_qplib_nq *nq = NULL;
         |                               ^
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:2933:24: warning: variable 'nq' set but not used [-Wunused-but-set-variable]
    2933 |         struct bnxt_qplib_nq *nq;
         |                               ^
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [y]:
   - SXE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/nq +1685 drivers/infiniband/hw/bnxt_re/ib_verbs.c

1ac5a404797523 Selvin Xavier      2017-02-10  1677  
37cb11acf1f72a Devesh Sharma      2018-01-11  1678  /* Shared Receive Queues */
119181d1d4327d Leon Romanovsky    2020-09-07  1679  int bnxt_re_destroy_srq(struct ib_srq *ib_srq, struct ib_udata *udata)
37cb11acf1f72a Devesh Sharma      2018-01-11  1680  {
37cb11acf1f72a Devesh Sharma      2018-01-11  1681  	struct bnxt_re_srq *srq = container_of(ib_srq, struct bnxt_re_srq,
37cb11acf1f72a Devesh Sharma      2018-01-11  1682  					       ib_srq);
37cb11acf1f72a Devesh Sharma      2018-01-11  1683  	struct bnxt_re_dev *rdev = srq->rdev;
37cb11acf1f72a Devesh Sharma      2018-01-11  1684  	struct bnxt_qplib_srq *qplib_srq = &srq->qplib_srq;
37cb11acf1f72a Devesh Sharma      2018-01-11 @1685  	struct bnxt_qplib_nq *nq = NULL;
37cb11acf1f72a Devesh Sharma      2018-01-11  1686  
37cb11acf1f72a Devesh Sharma      2018-01-11  1687  	if (qplib_srq->cq)
37cb11acf1f72a Devesh Sharma      2018-01-11  1688  		nq = qplib_srq->cq->nq;
68e326dea1dba9 Leon Romanovsky    2019-04-03  1689  	bnxt_qplib_destroy_srq(&rdev->qplib_res, qplib_srq);
37cb11acf1f72a Devesh Sharma      2018-01-11  1690  	ib_umem_release(srq->umem);
063975feedb143 Chandramohan Akula 2023-07-26  1691  	atomic_dec(&rdev->stats.res.srq_count);
119181d1d4327d Leon Romanovsky    2020-09-07  1692  	return 0;
37cb11acf1f72a Devesh Sharma      2018-01-11  1693  }
37cb11acf1f72a Devesh Sharma      2018-01-11  1694  

:::::: The code at line 1685 was first introduced by commit
:::::: 37cb11acf1f72a007a85894a6dd2ec93932bde46 RDMA/bnxt_re: Add SRQ support for Broadcom adapters

:::::: TO: Devesh Sharma <devesh.sharma@broadcom.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
