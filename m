Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CAA36F8E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574086; cv=none; b=dOxnzE36Nu743LMovohv6r8Bw+7A3EgIHbF4kSo5gLvHoYEJ6dh3P5cUBrwOdBrVLccXZtM+24nXEClIo3TOewYBkOIT5oFIP7oDhc/xbBCCjiwCNLCAjDlVKSa+CpmD0GPfAn2sOSttRJyZwolNnVs0K1ycT8G8n1KC4O2rLWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574086; c=relaxed/simple;
	bh=HoFiaad0P1sn0olMCn0QLGQ5oVDc+SzPE556/CW706o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FuKfhmvnTZBIn3Wddj3BDol2sVgKB1+UYdSTBWcCDFb1/1fxAqSWl4ciB4hDZSkqQxnrBV5DwtK5dKv3FbfYiCYSVVl6+npT/JEfPLJlP/5Xi2Yi/5aQuvlPLGx4bxMCvLkKB90UmBylrbLS7iB5QiVeW9SeSy37jFcRox0dTs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cslMUG+z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cslMUG+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778574085; x=1810110085;
  h=date:from:to:cc:subject:message-id;
  bh=HoFiaad0P1sn0olMCn0QLGQ5oVDc+SzPE556/CW706o=;
  b=cslMUG+zo84Q1830DlACZpgV6Ocb+zQN9dyQrq8awClGYqxLFlJgrePx
   CGP/fzA2LWUbfj7cS9nwlP4TdV8gAsR35TJNfuyKRHHTfprHFYMJueJ1T
   4U+mPUCjJdvhtzZYlSV80STUmDVX/bkXTTF7BG8KXl6vOw/2CwWwp/Clh
   rQxVllF9cocRGDudToCrwtTnSllHL0ayuW7+1iEbU0SsSmXpjVn20LMWN
   A3SX0xLRvLihC7nBc1K5krSlrDxx4cKBWtB3mVD4lDLuCBJFC9vcwY+kk
   CX7JABxGpyWbtzm+x1Y0X4WFY/Pa/WNsQt34WHOJVpsScZ8akWKc7mJ8s
   Q==;
X-CSE-ConnectionGUID: VfLh0r79RJmzkmfHxj+vDA==
X-CSE-MsgGUID: 4heuewkQRBqAHL5nJ+K2kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79508142"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79508142"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:21:24 -0700
X-CSE-ConnectionGUID: RRCWO/QZQbK8jdcQNFx3bA==
X-CSE-MsgGUID: cLeWU6CORKKJDGSm2QJ39w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="236849035"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2026 01:21:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMiMj-000000008EL-1DCE;
	Tue, 12 May 2026 08:21:21 +0000
Date: Tue, 12 May 2026 10:20:48 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 28/28] htmldocs: bash:
 drivers/infiniband/hw/sxe2rdma/check_aux_support.sh: No such file or
 directory
Message-ID: <202605121027.NKNeYaXs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   239030146b40c31f21eee583f7f678be653a646e
commit: dce7db61f61d8ac759d22bd218a3cb5cc247c562 [28/28] anolis: net: update linkdata ethernet driver features.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260512/202605121027.NKNeYaXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121027.NKNeYaXs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> bash: drivers/infiniband/hw/sxe2rdma/check_aux_support.sh: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
