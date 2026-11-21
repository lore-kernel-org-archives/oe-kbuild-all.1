Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795240514;
	b=qK8LDaLynGWKgrwcyNNX4u4wHsSSWU/wE9BHXUBIht4rMfF+8dw2uZSoH0mbMzyP8MtF
	 5sjosaTCWTqoztkmAwJ1yqlRn94YsSEewXPVOIoDq9v9NPQDCUbUcvK9cxwztPdQXS6Xx
	 BOl/ua97TOo69V6LjquJnUE+Sm5/d78El70yW6aTvAzTs3zJ5FuFMv4pDRRSnctH1+Thp
	 gBA3YkBB/Y1kju7ZqbfShrNwR7PeubLTsv1DWD2YvVfQlhlwJrxcIvOW94kqzJ1iEZwVQ
	 8vN76XD9VbtauRk+Bd30yFsFkK6/Z4EwjkkntIzkvqLP+xNtIl19X1tPhxwWAPze7/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795240514;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=y9zAb/HZnF5216Go859pbEWD7IyZwopbn8w6VRUyTnM=;
	b=3Gg5Fj8ZqP+9eL5PMF8OuXkM9t6o1BHWxHl0CHDEEoaLjSgUlYhovMqyYOFP339GLv8u
	 GFR4fOEnagchnMAK1taPjAY9RTwve+FNNJKlRgMurkkipCKqtQ/fzmloeaxRJQ2USLHSH
	 VUNOwnMnO7zGec9qzhg4Ze8E6UA6lNS81FM9SYIqP31xhrLP7g8H+8txGkXqcWy8N0old
	 Drh9p7mn0gWWmAYWRO90i0FqczgjKgyJUyA8lxxjvXnSnBsXUU6sS5rysPphPV3lgf9uc
	 9aDq9mjlMuj/docxFeIZP88QJbxfLFCYQt+D6nTeNplRvKlcQ0ijSIG4KOJG3iKyryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=chsmUIjg;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0F606A699
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 05:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE0F606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=chsmUIjg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795240510; x=1826776510;
  h=date:from:to:cc:subject:message-id;
  bh=0w8H3I5OKy+1y4fJ7op81u+dn1bu4+DIFicjyYpgd0Y=;
  b=chsmUIjg1wOELFDIBaLYQ5aEBv+zt4YXV6Jv5NTXZ1qY3/3icJcZpQJA
   CLRVh++ofEEC8+U9HRxYAIWtvdtYrH1PvA1jGAjMj6H62QaqITR+a0u0Y
   0G4MdneDDXiprhKWkEkHLf2EofyPpqonzk+qkD/fNvPJMagpM3q4uUMFa
   8Tn4S2lHPYSvzwP5SYpcUnmwvTt7fiw6TctLW0zMtuWPXuxfA+HAzEvU6
   p6ywJk9xZMTThSSFSPHRcroIZbh7pDpBaWt/ks9ORVIY6Ej5KBOiLBC06
   MMMtasLOE2MBLmvfP+ZC7ESEFEQChWpSKIJOAk/OD8OnpYB0JDRifAjnx
   w==;
X-CSE-ConnectionGUID: hBUAGLFuTEqltsFCbvmCkQ==
X-CSE-MsgGUID: 0/kcmErFSdSApBHjqrYR6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4149648"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4149648"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 21:55:09 -0800
X-CSE-ConnectionGUID: oNm0kkB+RUevqO7rXgbNDg==
X-CSE-MsgGUID: NX9gIP/iR2WexHtaujIa7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10855700"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2026 21:55:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUe42-00000001JaJ-04qm;
	Sat, 21 Nov 2026 05:55:06 +0000
Date: Sat, 21 Nov 2026 13:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:1725:24: warning: variable 'nq' set
 but not used
Message-ID: <202611211341.gjiNV6xj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 0afe1ec784386bef255e5f5f8810694196d72ac2 [152/152] RDMA/bnxt_re: Fix budget handling of notification queue
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261121/202611211341.gjiNV6xj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3b14d7c370558b46e5f0c6494a05c492e59bf32c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211341.gjiNV6xj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611211341.gjiNV6xj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/ib_verbs.c:1725:24: warning: variable 'nq' set but not used [-Wunused-but-set-variable]
    1725 |         struct bnxt_qplib_nq *nq = NULL;
         |                               ^
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:1776:24: warning: variable 'nq' set but not used [-Wunused-but-set-variable]
    1776 |         struct bnxt_qplib_nq *nq = NULL;
         |                               ^
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:2977:24: warning: variable 'nq' set but not used [-Wunused-but-set-variable]
    2977 |         struct bnxt_qplib_nq *nq;
         |                               ^
   3 warnings generated.


vim +/nq +1725 drivers/infiniband/hw/bnxt_re/ib_verbs.c

1ac5a404797523 Selvin Xavier      2017-02-10  1717  
37cb11acf1f72a Devesh Sharma      2018-01-11  1718  /* Shared Receive Queues */
119181d1d4327d Leon Romanovsky    2020-09-07  1719  int bnxt_re_destroy_srq(struct ib_srq *ib_srq, struct ib_udata *udata)
37cb11acf1f72a Devesh Sharma      2018-01-11  1720  {
37cb11acf1f72a Devesh Sharma      2018-01-11  1721  	struct bnxt_re_srq *srq = container_of(ib_srq, struct bnxt_re_srq,
37cb11acf1f72a Devesh Sharma      2018-01-11  1722  					       ib_srq);
37cb11acf1f72a Devesh Sharma      2018-01-11  1723  	struct bnxt_re_dev *rdev = srq->rdev;
37cb11acf1f72a Devesh Sharma      2018-01-11  1724  	struct bnxt_qplib_srq *qplib_srq = &srq->qplib_srq;
37cb11acf1f72a Devesh Sharma      2018-01-11 @1725  	struct bnxt_qplib_nq *nq = NULL;
37cb11acf1f72a Devesh Sharma      2018-01-11  1726  
37cb11acf1f72a Devesh Sharma      2018-01-11  1727  	if (qplib_srq->cq)
37cb11acf1f72a Devesh Sharma      2018-01-11  1728  		nq = qplib_srq->cq->nq;
181028a0d84cdc Chandramohan Akula 2024-08-29  1729  	if (rdev->chip_ctx->modes.toggle_bits & BNXT_QPLIB_SRQ_TOGGLE_BIT) {
181028a0d84cdc Chandramohan Akula 2024-08-29  1730  		free_page((unsigned long)srq->uctx_srq_page);
181028a0d84cdc Chandramohan Akula 2024-08-29  1731  		hash_del(&srq->hash_entry);
181028a0d84cdc Chandramohan Akula 2024-08-29  1732  	}
68e326dea1dba9 Leon Romanovsky    2019-04-03  1733  	bnxt_qplib_destroy_srq(&rdev->qplib_res, qplib_srq);
37cb11acf1f72a Devesh Sharma      2018-01-11  1734  	ib_umem_release(srq->umem);
063975feedb143 Chandramohan Akula 2023-07-26  1735  	atomic_dec(&rdev->stats.res.srq_count);
119181d1d4327d Leon Romanovsky    2020-09-07  1736  	return 0;
37cb11acf1f72a Devesh Sharma      2018-01-11  1737  }
37cb11acf1f72a Devesh Sharma      2018-01-11  1738  

:::::: The code at line 1725 was first introduced by commit
:::::: 37cb11acf1f72a007a85894a6dd2ec93932bde46 RDMA/bnxt_re: Add SRQ support for Broadcom adapters

:::::: TO: Devesh Sharma <devesh.sharma@broadcom.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
