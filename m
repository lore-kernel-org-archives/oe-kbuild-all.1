Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10461288A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142639; cv=none; b=XRPt9Ljg7c6Vz5VXIIeDn4nwGVe8VZssUUqN/28JNPHSy2b2v15oiiyAru2aUp+qSJDpMU/OY41ZRuq7/V1pGnjqjFQYqTpCZIo8BcEwY3IZlmCP091dbjE0jUfw0HDBkX33N1V8uQSF+EUCgYfZoBSEuWQfrAH1LhOFhHS0bs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142639; c=relaxed/simple;
	bh=+ALlqVl3QHHyyLRUxHdQlICdmyHNCU9H01WilUwRg18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFLP+X0HnKxC2auOaZtNHQ3d0WZy1F3xgnVzR14qWY9XtavIxK7seRcklWR+v0UR4dkjchjqIQSHwoZTWRsvakE3XV4sqztGsoRlHu4bu/ZhTenGqyssCEjN4tQCRZnL+4XFxowMddVNoWacS5pSSbc31GBeHztFPJptBLvFlh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAVr8brR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAVr8brR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750142637; x=1781678637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ALlqVl3QHHyyLRUxHdQlICdmyHNCU9H01WilUwRg18=;
  b=BAVr8brR8bFfx66qGITCr+oFkZGtXQqZwUqYLZSAklBTxoxoJvnZy/Yx
   t5ZRbioy2910M50ty5lLGVk7kWo/RwKLw+Ay0RqbTfFBT7QP/AhalYld8
   QgAne3x5eynbBjpGa8ZwKkclf6lOxpKPKeuoKaNYRhgkzXbNK2V1RrPra
   X1VZauDvy3c0FXZTx5tCJllMd/W8uGBhjM+7ttI2Ns1XkkoT1riH2BLco
   Q3rTUgRhpfH9C64CSMCCiXWXQLc0umxkpmgxts1J+fSABbk7NiIwprq1n
   bkMEULuwLHY6cter+lR+MjoeNf4mEnVSlslVAfkGoUQVTeqQ3ilG8fiQm
   Q==;
X-CSE-ConnectionGUID: E2o2pVi7TjulHJRrGU9e5A==
X-CSE-MsgGUID: S/YB8bnLSwmbnr+vGLTPSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63654851"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63654851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 23:43:56 -0700
X-CSE-ConnectionGUID: cLE/lKViSAiXtf1X3Lyh/A==
X-CSE-MsgGUID: V4whrjzhSL+2ogWKLVnjAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148590104"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2025 23:43:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRQ2y-000Fgq-3A;
	Tue, 17 Jun 2025 06:43:52 +0000
Date: Tue, 17 Jun 2025 14:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/4] Warning:
 drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in
 'dma_heap'
Message-ID: <202506171444.0xIMDAY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   5cef25e50cb6087f332f209eb089812c841511bc
commit: a5f9b0171db0c1e78d2c8da744f82ee20b2064fb [4/4] Merge 3e443d167327 ("Merge tag 'docs-6.16' of git://git.lwn.net/linux") into android-mainline
config: x86_64-buildonly-randconfig-006-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171444.0xIMDAY2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171444.0xIMDAY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171444.0xIMDAY2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'list' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_cdev' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'refcount' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_dev' not described in 'dma_heap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
