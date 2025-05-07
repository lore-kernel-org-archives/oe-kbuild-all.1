Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614FA1E7648
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610484; cv=none; b=TSMZGvQKdn5RNFaPtuMCxiitbDRLwyGCLVbY8AXu2D5cDHHEbueRpIiuhIQfnyUkiLE1TU2ZaORfXvqRKPPdCCJMFDKc/WanbQ9a7uMgxEHMm0riBpg9LVM1wDoi88IThNgdxtwGqPeIvnxMo4PAQ5ZGdGWcH2CmtcB1stXb/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610484; c=relaxed/simple;
	bh=i4XV+jqdOlPIHK4xvoLBR/qkqlsXfJKitgLRfwjVB2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Udsiadsh7XNLyJsfgXZQPhXltblrPOpRg/iEqkWWcqvEZHHs3WnOnNbKuC2Vus+/lHFllQXQnflsVGn6uEFnK778HVIipmd3k0m3V/rqkal9MfnGRNJ0obUQWuXamGauLLV+GApHeY1qh/q+m6W4O20tIp8BWI8uxn3UDemtdiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKr1DK1j; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKr1DK1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746610482; x=1778146482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i4XV+jqdOlPIHK4xvoLBR/qkqlsXfJKitgLRfwjVB2Y=;
  b=iKr1DK1jEjGDB7XZPpUrc7LckbkKw7LOOYm/ObtVmiQ5/LPFwMLIXoaZ
   yp45+BO9kufUBriPsriDj/HA65Ys2NRYKQQ87X+rhY++5NlbT6gIewNPw
   /tXyY0yOlyliLF/mIjQRuatqJJQON2UmLJlwuMmaRdVbGjYf/tNByvnnc
   rZDQZSUPKUhZLMkQvCaGuKgE4/HgafGa8Tq/+TiZ393kGf+RGrPbNW4zE
   02cUqj7uQYFAdErTAPPpVtUKpkHuffsfHkPhM/GNIswFUzfcy30IkV6MI
   fp7lVh3XvBa9VDyyG7qRhmYpZsQYc3UVvZng8S/cP4RpmFW8vCOHP5VM0
   Q==;
X-CSE-ConnectionGUID: 17WYDtSHTKaViDlrPEzCew==
X-CSE-MsgGUID: 8y29N/mrQV+NhMmqaSiSMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47580110"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="47580110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:34:42 -0700
X-CSE-ConnectionGUID: f3dWWg5dQ8Oz939w67oj3g==
X-CSE-MsgGUID: faQgPijAQoyjPmQ19M9yJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136835191"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2025 02:34:40 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbAk-00009G-1K;
	Wed, 07 May 2025 09:34:38 +0000
Date: Wed, 7 May 2025 17:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1288/9308] ERROR: modpost: "shmem_writeout"
 [drivers/gpu/drm/ttm/ttm.ko] undefined!
Message-ID: <202505071745.Ogi3QBwo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: fe75adffac33eeb167b378861d80c805b234495c [1288/9308] ttm: Call shmem_writeout() from ttm_backup_backup_page()
config: i386-buildonly-randconfig-2004-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071745.Ogi3QBwo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071745.Ogi3QBwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071745.Ogi3QBwo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
>> ERROR: modpost: "shmem_writeout" [drivers/gpu/drm/ttm/ttm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
