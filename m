Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943721FECDC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737118844; cv=none; b=LawMMsUa3ijQrAalD/gyf4AxdbUNQ7Lr04ZjpitT2Qlo5ItFN50WAft0M4rlM7z3CTHf6m7u03muh20g/Qchf+NHosVmqB1m7EWgaP2uXfNbyGOHEZOJctMl5CI8oEof2DG9ZO7DjqOyR0u5WLUtciF0JqZLIqdLfAmKFmgDNJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737118844; c=relaxed/simple;
	bh=s6eJflcOfhCQw/CozeLwgwucGBWHn3sUxpNs8mqz/Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XeGZhp1Ib7T4o6xelvErKeAjQ3ryc1YyrSQhH+FifiLJI2sBIpw61vNlZwk4m2roVP2qp5eVJrcnQ+GDrbqGhfriqGwNJhXUbDIF8YoHR/62Be5vp3MLNwbpvr1gKCMDhyq/o6f5ybDru3Mqc/cXOmAvLV22Bl+ylbp2LF5WwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSNJiREc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSNJiREc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737118843; x=1768654843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6eJflcOfhCQw/CozeLwgwucGBWHn3sUxpNs8mqz/Aw=;
  b=iSNJiREcik6MzcvbNd5zgb2VA6UgvK0Qy8xLvPhdvsvLC24qDrgp3BHo
   PZbG4PqEfiGABepGyu7oYgG4ExXgBQcP91RnTw/e5S2NQZNia/6BPrXTP
   Kk4hMtbXq85VQTZDBbcY2udyiVr/Xu34BVFc2p2R1W0rlVa/LLohnaH4R
   Qn2UDMzeRaK27AFR5WNJlQP5TuaaO3Q6hsUL79WazPwwlCOH9svMlQmIh
   uCzML0aBWCpBg44tdHLsa+zM7c05cOB1Y3uJvNF/EeOzpb6oXMQ8zb6by
   Wf+OEYoTdiXMzEVvQik/p6/X5l/dvJ7tyX9fRzADmLFcL1CNrVyStu4Xi
   A==;
X-CSE-ConnectionGUID: xILNfPyRSoCDCAxRDMUDPA==
X-CSE-MsgGUID: C1ot06knRG2Jn/Czf1o54w==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37242073"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37242073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:00:42 -0800
X-CSE-ConnectionGUID: h3CXC1CQS26NWMg2SWgu5w==
X-CSE-MsgGUID: zA6k8QMDR1CXSprvsCsrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110804179"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 05:00:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYlxl-000TDV-2D;
	Fri, 17 Jan 2025 13:00:37 +0000
Date: Fri, 17 Jan 2025 21:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 12/23] ERROR: modpost: "dma_direct_alloc"
 [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!
Message-ID: <202501172036.3jWCMb0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   31ee81c18e776a1c8389d1a1ad0c999e6f69d0f6
commit: 242e8fb37ea72e4388ee7d4dc3794e62c77279a1 [12/23] virtio-msg: ffa: Add reserved mem support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250117/202501172036.3jWCMb0g-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172036.3jWCMb0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172036.3jWCMb0g-lkp@intel.com/

Note: the vireshk/virtio/msg-xen HEAD 31ee81c18e776a1c8389d1a1ad0c999e6f69d0f6 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dma_direct_alloc" [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!
>> ERROR: modpost: "dma_direct_free" [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!
>> ERROR: modpost: "swiotlb_map" [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!
>> ERROR: modpost: "__swiotlb_find_pool" [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!
>> ERROR: modpost: "__swiotlb_tbl_unmap_single" [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
