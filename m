Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8634FF7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766585926; cv=none; b=VG5S3FAmc7M89vFlIS4I3J7GHwKRgICqULtJ823/dKDUKdR6uW48rfqeiubJDq9apukJxrUEUfhJibVGUbbg09Ue+FbARJou9+1y7PjTVSJ7YwUzj/l+D/0LOHKR1QjTDl2mFRa9EZ8+D4Cj6A4qoDDHDWjdW5PPZcPcag9CsxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766585926; c=relaxed/simple;
	bh=ZePIbbXDFgVMJdjdQDArwq2N3ULubD0b6Siy6btGh/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ugvwnmM+5ahXxaRwm08vkMGfuM+bPcdmJtnb0MNKxSqzskMc0kd1dUw450L5CfxU/SRmPD1/xmVBR8+3qoYwPd6ZYd1YTG+S9GjAjfjAc04xzdBvOTSvWZLo2t/ubnt59k51UuPRFI6YItz7wIIhyfBlV9Btl97g/dSBX+QwHiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nA76HQE2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nA76HQE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766585923; x=1798121923;
  h=date:from:to:cc:subject:message-id;
  bh=ZePIbbXDFgVMJdjdQDArwq2N3ULubD0b6Siy6btGh/0=;
  b=nA76HQE2yMBsarUgnrKAW5Pj1+rzdsDgk4qN+TYanf49rGG2AXdgqqAR
   B8RDR41/EvcebnrNM9FoAdf7VAlokVv+F2NNmNksu3YXBBY2dSLgcDeDS
   fg1A5hASokfb0n7F4yco/KcXUKlo4ymJY3fFK4jmlTzfq165NpSzm8TjQ
   6Jxpsi4I3TYjcBTLOotWyDyvOlQx8xxdKK3bGnZNfWpHcecAtYcxfLmMH
   TmrHZJpE5wIcKrfuVwUdE+O3C3qgM6mLNWZ+6Auc6i7bPlRhnpBIKcdv5
   ZgWNaCDR/8MyHqyN2EXdixaKHSeMLI48wq4Eki4frFTfIp1jWFUeq0d0G
   w==;
X-CSE-ConnectionGUID: X6TJ+88RSsir0WSy+oYD2A==
X-CSE-MsgGUID: ItZKVe2oRhuVYdPigXCNRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79055740"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="79055740"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 06:18:42 -0800
X-CSE-ConnectionGUID: e+dtCmffRrqFU0QLJsj+Ow==
X-CSE-MsgGUID: d6nznC3IT6CB76CukbN1+Q==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Dec 2025 06:18:40 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYPgQ-0000000038b-2TpT;
	Wed, 24 Dec 2025 14:17:54 +0000
Date: Wed, 24 Dec 2025 22:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 20/20] ld.lld: error: no
 input files
Message-ID: <202512242226.rhQLqZqw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ferry,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   f8cc47d4950acfa65f223aece2eff125f1b84ab6
commit: d8c8d96e4a922ac40a4dc2c16c3a5e554cac1d99 [20/20] anolis: virtio-blk: add ext_feature negotiation method and ring-pair feature bit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251224/202512242226.rhQLqZqw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242226.rhQLqZqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242226.rhQLqZqw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: no input files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
