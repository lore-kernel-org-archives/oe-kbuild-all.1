Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEEE254AE1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752594130; cv=none; b=mZ9f3vfcKd/3Nxxg3WVoCmtGfkmHgQrGOwbXsqWjqLd4ceTupooFG2OFKQsyVwDtSncYn70Yl7I6QNHBOO7DEIlXw7TG9h1IZg3nwGTFEX4tZOk0KOepLHEyX/ZONicLW6JjJS7WT15kat0ZSdVXGlg0pPaadyZsKyrlF4Y2rxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752594130; c=relaxed/simple;
	bh=vXD2oU+Bag6IpA+1bzml+C/M61yxSqwSabVat6tGGso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPbtl/5PnKKVq+HPnmBp+rc5d43kKB3bzAWTzxmcBYm/ehH/vRZW9Gq1EWnIgLleSrQmXFVRvwQDLL04O1UF2V1MgPUgSOuq48IeySFkOrgCOqJu0nr2dd9pSGsYkyqDfUmPj20wtc9HLLXXG9/VXxquOZi90wdn5zrmj5W8jXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfskIB2A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfskIB2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752594129; x=1784130129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXD2oU+Bag6IpA+1bzml+C/M61yxSqwSabVat6tGGso=;
  b=kfskIB2AkbOL6+9OylXIhr+SHAmqHtUfcEEfo+59aL/hVXBta+Q1DEFh
   ZAFF7VRlkG0mygLp5xTqlajXPdXb9PN4hQZWCybDTdTYya5V9y7K/g2uw
   84H6ZUYi7IaxCv0rQMu+e4IcAoE4+plZqVZp6GUx7emX1OYfzXZApkbNK
   d6PKM10oG5/8dMUyGVP9pxqp1R0YSggB25dj8u2U+TPAJwKoOMIn2EE4+
   iLscE0QVoHAafJ1k+F0D6V2DU7yW/fUXuDe1meNgAZkMQVeNae4Kftawo
   GfE3C3SFpUTZW/SmpMYp1hMgieU+QekuG8rBwRZlYHwFVUrxpNSBVANcB
   w==;
X-CSE-ConnectionGUID: lG7DwqBWTt+VEZwezspeQQ==
X-CSE-MsgGUID: S8SFqmm/RHCO13YbCCW+Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54944593"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54944593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 08:42:08 -0700
X-CSE-ConnectionGUID: uRlfmYPURKi7qfVu4czRJQ==
X-CSE-MsgGUID: eHjgsCdDQuOnkzXjjfIqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161814486"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2025 08:42:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubhn9-000BGL-2b;
	Tue, 15 Jul 2025 15:42:03 +0000
Date: Tue, 15 Jul 2025 23:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] fs/ext4/mballoc.o: warning:
 objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction
Message-ID: <202507152317.9HDizx33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Theodore,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   eabd480503b5c662a59778c9fa8c1a8f611d724e
commit: 41298197ead9e85ee2ec1d52122f03fd1863cff2 [1343/1343] ext4: convert BUG_ON's to WARN_ON's in mballoc.c
config: x86_64-randconfig-101-20241223 (https://download.01.org/0day-ci/archive/20250715/202507152317.9HDizx33-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152317.9HDizx33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152317.9HDizx33-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/mballoc.c:4734: warning: Function parameter or member 'bh' not described in 'ext4_free_blocks'
>> fs/ext4/mballoc.o: warning: objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
