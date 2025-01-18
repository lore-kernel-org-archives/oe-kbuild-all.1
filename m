Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2789319D886
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737215971; cv=none; b=Y5QvjzOzaZq+ugBzZUzQ268wCJJFgA09Q/eJ5iC1oxM3kM6Cx0CSxfg4BR9k8MCm8TPi/QjAQoCWeP+VGdoGGxbaCmg8Ee5UiiJAu8kVBq0WCBtgLLeOHp3YxD4bO11Vft1kycbI3hOKBiQZtUcHZszv1xz/+IAhzOrl1OiPMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737215971; c=relaxed/simple;
	bh=TsVDxqWMP3I43cHbkhHxVywHGWEArwWAVKit2aYVbUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jnscf5g52zVF1l578iyEKRf81XXvh2Y0ybZ4rLZDvDWaTjoqCGU0iyjvg9PUvbRDv9zZe2fSENTf2RgHbr03mSllGpGMezcBtPaj/oA2/JO0pNEvXYsY1hE0wkS7jD0L73GGnFM8gwSd2S+4q4H+kDGiT+OwjjROdAVRTuF+jVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lshZcNI7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lshZcNI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737215970; x=1768751970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsVDxqWMP3I43cHbkhHxVywHGWEArwWAVKit2aYVbUA=;
  b=lshZcNI7hZiZBSz/v3M86ZmGuwlbCY+1D2zAYpbddnlrIelR/pryWHmg
   3ud988U3iF9q4Hn5jIBwZAneg4aDFpA/xS9a0b65hfyUvHWUwUjKx50OY
   sergDSmb9k7atnTDKI2uSdcQoqk40Mv8aBQaBkcIn1An8/h1j3SWy/qpV
   ib5VicF8JWCQV5RY3kw6VW5im5QVGtkkubxHJRaSCOxziNnRf0JzzFoT2
   G3IbMcXcxRGTCmhC3Qde7coa5+ZK1upmJ1cr8FcuXCu87bVcsIlXfrhmR
   A0jpfIEsZTZJSpJiq5zUnLJ9a6HFffF/QDhGIvipY8+DYeHu5eAqhf32Y
   Q==;
X-CSE-ConnectionGUID: q3NTTtS+QHOP77mRjXOTig==
X-CSE-MsgGUID: MdMiyU/7Ti2bYsS6+3cc+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37794743"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37794743"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 07:59:30 -0800
X-CSE-ConnectionGUID: x1wF/HAVQOmMEBHpuwoSDQ==
X-CSE-MsgGUID: Z+ftTE6ZTwO3fYI3sDlD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110130343"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2025 07:59:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZBEM-000UaC-2N;
	Sat, 18 Jan 2025 15:59:26 +0000
Date: Sat, 18 Jan 2025 23:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/staging/gpib/eastwood/fluke_gpib.c:1145:3-8: No need to set
 .owner here. The core will do it.
Message-ID: <202501182304.q5PrJvhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   3 months ago
config: m68k-randconfig-r053-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182304.q5PrJvhd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182304.q5PrJvhd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/staging/gpib/eastwood/fluke_gpib.c:1145:3-8: No need to set .owner here. The core will do it.

vim +1145 drivers/staging/gpib/eastwood/fluke_gpib.c

55936779f49612 Dave Penkler 2024-09-18  1141  
55936779f49612 Dave Penkler 2024-09-18  1142  static struct platform_driver fluke_gpib_platform_driver = {
55936779f49612 Dave Penkler 2024-09-18  1143  	.driver = {
55936779f49612 Dave Penkler 2024-09-18  1144  		.name = "fluke_gpib",
55936779f49612 Dave Penkler 2024-09-18 @1145  		.owner = THIS_MODULE,
55936779f49612 Dave Penkler 2024-09-18  1146  		.of_match_table = fluke_gpib_of_match,
55936779f49612 Dave Penkler 2024-09-18  1147  	},
55936779f49612 Dave Penkler 2024-09-18  1148  	.probe = &fluke_gpib_probe
55936779f49612 Dave Penkler 2024-09-18  1149  };
55936779f49612 Dave Penkler 2024-09-18  1150  

:::::: The code at line 1145 was first introduced by commit
:::::: 55936779f4961299efa99a6843c8ff3b019d3858 staging: gpib: Add Fluke cda based cards GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
