Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA451A7056
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 21:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583263; cv=none; b=shxB4pxNnGpkR4HACKs5Q0DQKge9MuDbm0TijBVbtKkMt5TwUjFQLkwFqd9Zm7uRTAv/xsC0VisyX3ovyTB/zc6MpyMFByViv5wK0MSc4wWDHFLSTGa3wDh5pdtz4SHcm4QejJhfoJMH891+4v9t0F2xtoa5kYz+ni0iNs7MMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583263; c=relaxed/simple;
	bh=CqMyR0iSJ3tKS4nlRJWmvH5F+FRoOXCPrO+9lSsjodY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXMjNn3r9QBnN0sX5dZkTNmbkw/K2baDXI451bBQ/MscPK1RapCCrS21WCW6csTRHlPi+o6WQauS9eD5G6eC45oSLsf28K+dHSfPIYHpDw7zpRCDQzNhg/e1k9frVQXx9crVGpq2F3ialgQgTDJRMPUS1P7nIi2rX0/R783SV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koV/wcgU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koV/wcgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723583262; x=1755119262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CqMyR0iSJ3tKS4nlRJWmvH5F+FRoOXCPrO+9lSsjodY=;
  b=koV/wcgUKvkHIxkbWqaG3AcyeAKiieiG7VnEfa4pQpaSuiR38XCFgL3i
   iWqI8xHR2mNBNFMJa8RKtGKhh1CpcyBjj+qFocVYWxv58kZcKnEc9RSYy
   Mz7yjmj1iAeHbyM6gq2ao4qjp0oUZcY1Cl9cJGN91ZBjY2doFKY8AWEA7
   yMhL3np8/XuNLPlVGUqZkbdi/Gp5HsHtAkMzll6FnxXJ0ETf7stFffulG
   oRtmtqKbytwdPpJYhnoY6p/zv/RygDa86Tj0X4gCxievXgZXG9DZyYN1C
   OcHXDzwER9Lpy4CmmKommu+025XkCBpDg2KyYjSUT58or84h06KblUNVC
   w==;
X-CSE-ConnectionGUID: 9okQGieETn6zn4b+/tIeaA==
X-CSE-MsgGUID: 3QvwHJGkRVeYmaEWYayr3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21641002"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="21641002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 14:07:40 -0700
X-CSE-ConnectionGUID: Rz31x/T3T6m6LCovGKCYcg==
X-CSE-MsgGUID: P5cq/k8oRQyu1cks7Z1HVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="58747989"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2024 14:07:39 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdyjw-0000jG-3C;
	Tue, 13 Aug 2024 21:07:36 +0000
Date: Wed, 14 Aug 2024 05:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17746/23490] drivers/dax/bus.o:
 warning: objtool: __dax_driver_register()+0xb7: unreachable instruction
Message-ID: <202408140445.JxTfcbDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ffc1b506e4066379411520003b9c59e509b05252
commit: 9bb67bd58e6a7e3ef00793b4966be7bb0a346830 [17746/23490] Intel: device-dax: Add support for a dax override driver
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240814/202408140445.JxTfcbDB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140445.JxTfcbDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140445.JxTfcbDB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/bus.o: warning: objtool: __dax_driver_register()+0xb7: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
