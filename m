Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED913FD83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735205036; cv=none; b=RTGvt1eS1XtHDWlaLYM40lxT37bA2QlLGwisXeubsfmnHbxisQVQNV7QFPJI9d6ilK6UD1PYBrkGX+6jnpLZqjIm88hsZfnNCtdeZe9QAzSgugZpBtirjEs6ylQZQiGR99iNpjgEmPKAn0DIGeWKLM532kOsuEARbRAa/9RM9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735205036; c=relaxed/simple;
	bh=IiQx1C6Dt1vw74vWQYGoNnbI1t1zj6DJBhJ1HoPywkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rP3wLUSeAos6WRR5q5n6FMTzmQgOcpkzgMROXLA/hvYcwozoHnd6RfTtHqEcitpUr/mVBOWEf0NyT8bVRYrUyb+iuWH174EiDyL83Rh0E2dNpflzOF13rcXeOmdtvQoEbL4o6tQM4PPppV+hLPksxoCayqX4r9aoqfLwh74FkUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K79jlkYc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K79jlkYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735205035; x=1766741035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IiQx1C6Dt1vw74vWQYGoNnbI1t1zj6DJBhJ1HoPywkg=;
  b=K79jlkYcOK7/Nlf1Vjpp+BLengV6sySHeKTxC5p6+nQvmMDPLoDks7EM
   qGNBN7sqnrvzCseHMnQJ3G7UYGKo8oPmzcoBZpL6ejvErfKUypJE1rYa/
   ESSkCDRSqi/sHlJrAKzdrH3bSBbeI0Zum+7nEgBFcs1Y3+fbQI8l0Mepy
   MjXm03H5kfd+RDDMyjXb0JRrgcQgaOkY1a6aEp9Y23/BTCu8Io2o4xjAm
   G3OCc6HwIE3lQhmOF48RRL1ykzk5ISiovvnqYN96ENOOhU4R6lAcQw3cU
   z96rIZLjfg6/wnO0pOqtvGdkYg0QFycuaq5Iu8av9WUzqxMJjEkVmDGQ2
   w==;
X-CSE-ConnectionGUID: OQxG7oHZQcyMihrmMIT/gQ==
X-CSE-MsgGUID: HwKhBLVOQASJ7idc5UZtrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35742505"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="35742505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 01:23:54 -0800
X-CSE-ConnectionGUID: HwJ0Yv2ySsueNuEwjW+3YA==
X-CSE-MsgGUID: EOQ/wlSuRzu861pK2RltTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="100247194"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Dec 2024 01:23:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQk5u-0002SQ-3D;
	Thu, 26 Dec 2024 09:23:50 +0000
Date: Thu, 26 Dec 2024 17:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.o: warning: objtool:
 .text.nbl_dev_start_user_dev: unexpected end of section
Message-ID: <202412261702.O5HnEzsC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bennie,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   589aaab51b2a3b112b232f89fd29a5302222d946
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [1662/1662] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-123-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261702.O5HnEzsC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261702.O5HnEzsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261702.O5HnEzsC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.o: warning: objtool: .text.nbl_dev_start_user_dev: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
