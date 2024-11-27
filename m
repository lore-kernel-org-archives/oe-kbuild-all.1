Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA114198E6E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705980; cv=none; b=Z0pu8G603muuLeDAnT9kDfj5wM60fGT4us2RuiNan9t8HCBrT1d915IXra/1blnO46KvhSTRCLrzh89zZY9dSVhkuytGortfBha4xGQ+uMZI9P2nRFjPt2Zczb045cyHhDh0CJzvp7UkVjSrJLfW9+ydNvMPivH0WeWFoVdWvfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705980; c=relaxed/simple;
	bh=6QpScF08fNjGDiGnlRwmmir88QHIM4JW6e28Fz+drS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSSEQZEjSQ9W8iy3BdXnCLO2Zd7YxqdsTvyAkxqswgeWBl0Us2t5Y5yPnyzrfne/yp00fJ7aWYdGfRxr4w3dzuU1PPAR9fF0ocali2jmczIZVvg4n0AjehH0WTxz6FpHbS4oJ8dNE0RqKQWe2bfymqYFJ2lUo5uw3ZzPQ8P124k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXeYRplb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXeYRplb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732705979; x=1764241979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QpScF08fNjGDiGnlRwmmir88QHIM4JW6e28Fz+drS0=;
  b=UXeYRplbVIHoBIyQsyv6etwtR+NLkwCW9Du/sU0BwPqYRW/kNRkCp9Tr
   2OxPNtl569gqFzmBsWSdycYrFMKOyhYR8aBodg2fE63iZWISDNCyWn7/I
   SELKrdFMmRBv4zYVyxQdMfs//U32xhENiMu5DyY2365xuz55uQE7lpvoV
   717pVjm4BZ/zAflv5wX8a4FsTgUwOC1WiwfIdr0DI8oVAdBZk7nmgOkr1
   77KMX5o3QcREBJcIOBSKbHo7i4EnIXKtXPIF9hB+jr3Rluf91N+7UP3Im
   1ehgffHM7S/9Iy5YJqLzbmDtps+cFC0tc3L0JVZ73xFkIo2qPMgN/5fZm
   g==;
X-CSE-ConnectionGUID: 51giOVTjQ0Wl3rjopcW2AA==
X-CSE-MsgGUID: FfUUsukjQp2pPV5PVDL2Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50432576"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="50432576"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 03:12:58 -0800
X-CSE-ConnectionGUID: M2BA3jZ6RySiRIqGZ4FDPg==
X-CSE-MsgGUID: x10+AE7kRH64bFwKa7nrzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91723100"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2024 03:12:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGFyY-0007vr-2g;
	Wed, 27 Nov 2024 11:12:54 +0000
Date: Wed, 27 Nov 2024 19:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1308/1308]
 net/netfilter/.tmp_nft_tunnel.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411271916.9wR6MiKh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pablo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4f763890ac28e4d36527b22a830c5e95cae55470
commit: af308b94a2a4a5a27bec9028354c4df444a7c8ba [1308/1308] netfilter: nf_tables: add tunnel support
config: x86_64-buildonly-randconfig-002-20241126 (https://download.01.org/0day-ci/archive/20241127/202411271916.9wR6MiKh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271916.9wR6MiKh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271916.9wR6MiKh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/.tmp_nft_tunnel.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
