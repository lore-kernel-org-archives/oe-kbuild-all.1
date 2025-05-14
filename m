Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30622259C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 22:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260864; cv=none; b=d+ZIrCbvxvJPkdqvvE+3HBY7lfJfu4sB6Q1PCUZzhy0svLBOf9nJvaytRzwW6cSNGszSw7RuVIr2TmA+RQlzIpK22gPODuBf+WBcEWXJ33PYlrnwCa8pIFGaZs4LXRjPxtgJzvC1SV0sPpekClerllsw6phlcPYHJ2D/breAVzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260864; c=relaxed/simple;
	bh=qDVqqtS20svQImJEy6wqPxazcAVzruI3NvhObZlSqUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojiiH9NpBODZbfn8GSUQ3a630OpUa6T+lGDGbMNMILDgte8LMYYdBtxwKfDF8MWRBpwzBe0k/3ORrih/sagML3vcjRL09l8CfwHQZhTonH7M7pYUKajqXYzoaApngS225C7HUF4cDZZsI3xK6/X+1pKWAkBS29gdW9P34HU4TYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H83yMAuy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H83yMAuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747260863; x=1778796863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDVqqtS20svQImJEy6wqPxazcAVzruI3NvhObZlSqUM=;
  b=H83yMAuyeya5+0d1S8K6xkRaaRjdDGgkBjheL8fyP610utnQhwvesBHG
   YUkv/QIVtjBLMJPvyAArraXpzFJ59a3h4WKva+s3dMY2BYLdOnOIrihk0
   ILKVe8YC/agO51I4asNKwf28dc3b18WZaZ9AtUgod7xlHqce5keK063+R
   ASR8o09DfgkNGqQ1icGXcYL56rbGUHnBGsI8A9X5F9mr6wuGy6hm0zM8q
   pzLf+gTPjGSFy/Vkss/sua1qq7d94IaGmtCKIwGl+y6SKbKLJc4oHWI7g
   2RfUu4cs45PgdHZfXY22CP4yhgCqDGbJli2Dc8TjCOZXWNnvOD5gVIdUn
   w==;
X-CSE-ConnectionGUID: I51pOxDdSSywvMrNMGqD0Q==
X-CSE-MsgGUID: +nleza2URxiDrUW94dWl2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48292786"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="48292786"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 15:14:23 -0700
X-CSE-ConnectionGUID: Qhd095rdSBmlMfXXeL/D3g==
X-CSE-MsgGUID: prwsvxYMROabCj3gLhxtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138090088"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2025 15:14:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFKMl-000Hdh-1I;
	Wed, 14 May 2025 22:14:19 +0000
Date: Thu, 15 May 2025 06:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 296/296]
 drivers/dma/ti/edma.o: warning: objtool: dma_ccerr_handler+0x4f3: stack
 state mismatch: cfa1=4+152 cfa2=-1+0
Message-ID: <202505150622.AgfxkPuY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   5ef98a8748d2aa46fd52211df6b226ff5baacb80
commit: acd4b6b3c4098b7eae68484359098c8bd4f74039 [296/296] ANDROID: x86/paravirt: Add pv_mmio_ops
config: x86_64-buildonly-randconfig-003-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150622.AgfxkPuY-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150622.AgfxkPuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150622.AgfxkPuY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/ti/edma.o: warning: objtool: dma_ccerr_handler+0x4f3: stack state mismatch: cfa1=4+152 cfa2=-1+0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
