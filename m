Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B537999D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 02:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782699121; cv=none; b=OWc2zvcqDzC2XGYcUPenvNXzAbD+l5L2a+4GTafndaNM+WgNsinSNfshJmcWALbM2WJ2C8Job94N11FQ2+7P4gRVFkfszzUFMZxYfSRkewP09bph94cjxv4c3sg5B954qTiS6xH/MBkwX5/tYwEFeu0LaW/aP6EuEnjVOOCm9Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782699121; c=relaxed/simple;
	bh=8LEVgM4v0P06IkA+zNAd7sm6U+ztXU+wGvWOT+wm1hM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kdWcei31CitiGsrI8B7EDRTpWrDYJHwX4hOaqugOjd57zHtEtJHJGrqZaE/IRpJIER+EaR+CkqL2oa6RMVFsWRUFs4NLMOqnYUNc61NTdLGzZqe3mkTsCunrO9dkSJmh0pGYt/e2KE3Un62jbnCcRvE2mDX57pzg3Aq0zCGaoxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbPnezDk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbPnezDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782699120; x=1814235120;
  h=date:from:to:cc:subject:message-id;
  bh=8LEVgM4v0P06IkA+zNAd7sm6U+ztXU+wGvWOT+wm1hM=;
  b=MbPnezDkFJxD728ydZ7Xe5MyRiPvqBtQE24vVIOEI18UdkzNcd7Vao29
   +Ap748ogT2v7YQBDvsWwBu9X2wYKlOQrj/F4ge6iYI1RpxO07CZ6Y27YF
   G8s2KEqQ7BUFnXkKMi5chlae5wTonxDxFLh1A5P0wP62SKhy+/JALDz3v
   k5Ld+M1mA10yOS3+5mmNhA6t6sawBFVu62jyyHbKBmSjeYCBbBz3wYPON
   cbjDKrGHdPiKrtvNkdPhH8f+eahqaR21tB5DR1RDUNv881HnUrJ7jBuX0
   maGUrCuiXrUoAT7W0BHbH4lsNBImAiOw8TIAQxqov/NeeyfHOaEUpzcxf
   w==;
X-CSE-ConnectionGUID: NGdpIkytSu6+2Y5/L5Mxvg==
X-CSE-MsgGUID: rTjHVdoPQXmHEz62IAq10g==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="100924204"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="100924204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 19:11:57 -0700
X-CSE-ConnectionGUID: PXhwBmxITIWaCr9wDecL9Q==
X-CSE-MsgGUID: AlHseJ8WSX2tAjfQPTLWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="256231865"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jun 2026 19:11:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we1TU-000000006ld-3vpC;
	Mon, 29 Jun 2026 02:11:52 +0000
Date: Mon, 29 Jun 2026 10:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 17/17] Warning:
 drivers/media/i2c/cvs/v4l2.c:203 function parameter 'ci' not described in
 'cvs_csi_set_fmt'
Message-ID: <202606291022.4ZXe8Dz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   66c090febbc3c412ced4e71cb69f47b05eea0331
commit: 66c090febbc3c412ced4e71cb69f47b05eea0331 [17/17] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260629/202606291022.4ZXe8Dz4-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291022.4ZXe8Dz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291022.4ZXe8Dz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/cvs/v4l2.c:203 function parameter 'ci' not described in 'cvs_csi_set_fmt'
>> Warning: drivers/media/i2c/cvs/v4l2.c:203 function parameter 'ci' not described in 'cvs_csi_set_fmt'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
