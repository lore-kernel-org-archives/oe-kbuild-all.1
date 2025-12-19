Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551C318151
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144536; cv=none; b=MkrmrrK3TMUHt4ERuItAPJJmVhNPgZzSL4QQVaNpE/k2oJnUOyiOTpq7GCwZ7hH2gylI5ZFMtgEMwB7s6F7f7g3SHAqCRrmyhDVUzn74v8EURWwnJdLmHOIUtKhKWU5nyWRIAhZ41byYSRWWSZ6ybTEtHHuDy98KU/TO0oCNGOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144536; c=relaxed/simple;
	bh=HmV+KiYHwc6feJ8cnS+/iaS5YJO//xHjJWB8dVKfT84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfSolWOnnJp7dU/lthRxfJAYfCFmGh1vLriZDZJdXZjXMxf8uDhYImBc1zDbapHTvtZRGC3Tl9pWkDP2Vyy9f81p5MOy8cSqD+czrEOdQbgdQox1fILSSnwlkmPzNtmENVHz2QiyFmOJZgc1rLsRKLinwDiNnYseV1UAE3cxOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EC9R4srZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EC9R4srZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766144535; x=1797680535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmV+KiYHwc6feJ8cnS+/iaS5YJO//xHjJWB8dVKfT84=;
  b=EC9R4srZbR9t+T2uznTzGoiwxugxPV7B1QwOsQzodEpqO5qtwR7Z+hF2
   JRyT5SQ4fJ+d+tGGgdchEgNvndbWLdHWxuYYFHiEqtRCPS+Ux1tBT/WtU
   6fxaSx1SqGF922oG0fmmPHmcl4+1kgElIbCCpNaduyup47QTLg4+l57KE
   /PP/LxNVjiSq98AKnSj9Bg2+kSmuQaD/lnClKPkETqvFlCzIRy49TsQdi
   xNQRzre9+SBl6jI1Gzp/LfBkpftwdg5BVWNAEEE7THCwvnrwmHTcrdXfJ
   YI69xkg6vZWyykoTBIBk78XACl6OsIc2TowRGURmctlK+Kc97X0bUPGzp
   w==;
X-CSE-ConnectionGUID: Qav5CiveRgCNfhwHTl4Gfw==
X-CSE-MsgGUID: ghVoFYtLQgSGNIcgn4hSUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67983490"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="67983490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:42:14 -0800
X-CSE-ConnectionGUID: 5otiesE/QZuj3a7uUnVbXw==
X-CSE-MsgGUID: I6ePv68uSdS98oSKqexVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="203360215"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Dec 2025 03:42:14 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWYs7-000000003SX-3DGE;
	Fri, 19 Dec 2025 11:42:11 +0000
Date: Fri, 19 Dec 2025 19:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 drivers/dma-buf/dma-buf.c:41:1: sparse: sparse: symbol
 'dmabuf_accounting_key' was not declared. Should it be static?
Message-ID: <202512191948.MbjtKubm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: baa7a3655a17c8a3f9d60cbd0110bc482312f1ba [43/43] ANDROID: add command line parameter for dmabuf accounting
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191948.MbjtKubm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191948.MbjtKubm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191948.MbjtKubm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf.c:41:1: sparse: sparse: symbol 'dmabuf_accounting_key' was not declared. Should it be static?

vim +/dmabuf_accounting_key +41 drivers/dma-buf/dma-buf.c

    40	
  > 41	DEFINE_STATIC_KEY_TRUE(dmabuf_accounting_key);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
