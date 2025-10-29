Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0A2E284B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750790; cv=none; b=thlgs4RmZxFdMUZP0HcSlHvW13sh6jcGO53w7TWVJf4rE+nnxfr6Pqq416GNdxHD+PRFmic8vTHkLfDnBiTcWo8PtgoJPL6fpE3AztjhccOVR77ZEEkC4mpZWuMDv51Mpwc249gwUN3IAI9aHg56dHuOKCHLbLYWteXcurJOxCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750790; c=relaxed/simple;
	bh=LCGtH1EG4WasK2MFwb5oXOFD1CHSKIDkLoSjE3Boxeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYql0+iolBYvnHvqLHADoryvpPknvVh8JwcKDRWtsgdbvF6Psq4srG3JTeGwe5iStjzcHqEpyEyNOzzAQgpmI0bKJjmga+6sO1Iy4H40vsGCwn4M3S8Vf91cK+oU99rVhR6DXzsP1Fx+gEChEQCzmmpuN/kE8/PpMordOpg5ozU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+lSz9tr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+lSz9tr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761750789; x=1793286789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LCGtH1EG4WasK2MFwb5oXOFD1CHSKIDkLoSjE3Boxeg=;
  b=d+lSz9tr6XUZFz3oFGQFE9d5OdjdodRGazStGsIhv/J9jk2p2uhz6jF3
   Jq/RklUk9tJw4cSMnb7wufhkeoKlsvr6mWJwYQMc5hyl8PgvhL+GSaMrQ
   GDZ3UCvpVf9e6c7t14q3VOorn0vyTP/BvPUInP+V0r9y6T2+c4D457XCf
   ilubPh/PaksbmIJWe3wXJBiNVebS0nTuluqWuVCtz4HJ8IN3tyZ88wu4F
   qAq5WeGkVe1VhxVRdn3ubt+kJvU/H/2RfI7vfpLoxBDBHqj0e0/TuUvTq
   sQSKwrrfqScycCEHpzT3wfkg7vjeHirKWPjX9i4XASJgr6xqv5YYsiny1
   Q==;
X-CSE-ConnectionGUID: N1xqht5mTt2FinYKrKHdxg==
X-CSE-MsgGUID: 8acDCb+kR0GidthiJ+PMXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63784046"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63784046"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:13:09 -0700
X-CSE-ConnectionGUID: GiiEh3ycTR20cAYUFgpP7g==
X-CSE-MsgGUID: G48e/eL5TPyCqspVopw3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="189757778"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 08:13:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE7rF-000KiH-0q;
	Wed, 29 Oct 2025 15:13:05 +0000
Date: Wed, 29 Oct 2025 23:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 32/37] dma-buf.c:undefined reference to
 `dma_buf_match_mapping'
Message-ID: <202510292354.aa6peB5B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   58578cc9d13b9d9bd6ddd6e96b0fd98f013f887a
commit: 1b84f78eb028daf067d226068f670547bf95662e [32/37] dma-buf: Add dma_buf_mapping_attach()
config: arm-randconfig-r063-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292354.aa6peB5B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292354.aa6peB5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292354.aa6peB5B-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/dma-buf/dma-buf.o: in function `dma_buf_mapping_attach':
>> dma-buf.c:(.text+0x9f2): undefined reference to `dma_buf_match_mapping'
>> arm-linux-gnueabi-ld: dma-buf.c:(.text+0xa2c): undefined reference to `dma_buf_mapping_sgt_type'
   arm-linux-gnueabi-ld: drivers/dma-buf/dma-buf.o: in function `dma_buf_attach':
>> dma-buf.c:(.text+0xa60): undefined reference to `dma_buf_mapping_sgt_type'
   arm-linux-gnueabi-ld: drivers/dma-buf/dma-buf.o: in function `dma_buf_dynamic_attach':
   dma-buf.c:(.text+0xa98): undefined reference to `dma_buf_mapping_sgt_type'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
