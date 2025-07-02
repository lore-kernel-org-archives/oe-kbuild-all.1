Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D557D1C6B4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 01:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418759; cv=none; b=eMKAwpinDlhSpqDs6arjDd3SAopeViOyes7VQrGJABfHRlSOfUa+PSu1z8jDf6His0dzQ24714ffdPITpgIZrzJ+IHp0JD2YjI+HU96JX2g+sS22NkU13W7VGUZ1EDBIPiI+NB0PieXLeIgzRKfzXebYC0hKfzjTJalJenn8LnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418759; c=relaxed/simple;
	bh=WsEDeKkmIGSNbr9+TIaywDtrTlkWGwFqDOORh3dnXZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gb2bXa5rTNjeQS0poAcaskbBriYvFKQzU3sDo2ypc8V80fxhIP68Oo/zGNKIQXkDSShcRaCh5xQgcTZ8oSy60ZReu+RXXHDywnBgda8b92lTAlEddBb5CAR6iQkV5KjlljYpGg1NFZPttI/HM2R1Ls++6Iadq8KJFMxmqRfdMK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zbbob07S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zbbob07S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751418758; x=1782954758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WsEDeKkmIGSNbr9+TIaywDtrTlkWGwFqDOORh3dnXZs=;
  b=Zbbob07S6X8G78RY711J+6xhfvV8KBX5ZHQWVro6dEAZeyHFELPDqSJx
   in0PS/PD7b+EoDa4uRAAqBA99e67XSAMaDFP3eQnVP1BD7Ufhfvaus+yK
   Ha4LZRpgHeBOWdnwkeOT5yk2A6da5WDa/VREFgbUsKr0MQt3MSLehSW3K
   WX8rFusPTUet6ICptGg6nP8G+VprQaSVKBEy1IPHPdeMB0CMj/64KyQ/Y
   V5uLQ+LVQUubrnvZ9S1Gztygs4WTpA5aY+sM6H5AsgKH4Jbkv77WvDecu
   MlFuqJk21i0WK58cuhc6wxzY1C8BXQQCRowiD2+2Wgg9pEFdFbVpchVOM
   w==;
X-CSE-ConnectionGUID: sm6htm+jSzqB6Ej3C6RoWA==
X-CSE-MsgGUID: JDhfgoqSTDGdlaChPdt/Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71267722"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="71267722"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 18:12:37 -0700
X-CSE-ConnectionGUID: 0iQ644vNQcarM/W7G8zC9g==
X-CSE-MsgGUID: BfOhiyfcSVu3Q2tnsD4xpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="154083833"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2025 18:12:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWm1Z-000aqs-3B;
	Wed, 02 Jul 2025 01:12:33 +0000
Date: Wed, 2 Jul 2025 09:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 2/3] drivers/accel/ethos/ethos_gem.c:20:2-7:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202507020945.OXbCUvzW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   0f6ef680eb6ab20891ecd2b5adfc015a22441611
commit: 18fbf33e2b12d61167868142a4b47c598e9442f2 [2/3] accel: Add initial Arm Ethos driver
config: arm64-randconfig-r053-20250702 (https://download.01.org/0day-ci/archive/20250702/202507020945.OXbCUvzW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 9b13dfdfbc6d3ca3ec0e3e6d9f5e9271eee13258)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020945.OXbCUvzW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/ethos/ethos_gem.c:20:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +20 drivers/accel/ethos/ethos_gem.c

    14	
    15	static void ethos_gem_free_object(struct drm_gem_object *obj)
    16	{
    17		struct ethos_gem_object *bo = to_ethos_bo(obj);
    18	
    19		if (bo->info)
  > 20			kfree(bo->info);
    21	
    22		drm_gem_free_mmap_offset(&bo->base.base);
    23		drm_gem_dma_free(&bo->base);
    24	}
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
