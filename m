Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02A1F7087
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 18:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735325062; cv=none; b=sVqL7rp5TIoNDAvRNA3E6H/CioLka0rgN5brCkcKE/8zj71eYV0Slwa1ttsHVzXgBNQKU8e+yxF6QHCdbvlONDiRWBZwdFJgSY0CxijSTkeOlJwWMxzpYjz1T0yxXIhm1lXBWAgO6LWchYL9sTus0nYf9CUrbjCxCkonxpGj53g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735325062; c=relaxed/simple;
	bh=xcmuUMyMyOHMAaGimKxk+oJ0ID9P+JNFNoGl7IRbDo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fax1aeYf+XqCg3rJV/xdRPgysBEOR/Zs451nQRzdSi8T1p7ZW5+oodGxXicOhfmuK9Mul8SqkZ5aF6IvlNJetCHwF1KVEpV/FZ7aymIk4IJ33H7XENnTtDitI6a3hnJ1nRedb4Su3HvRltgqEDF0i0FLdUgsj+161HDnF6Prrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdAYzEH6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdAYzEH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735325061; x=1766861061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcmuUMyMyOHMAaGimKxk+oJ0ID9P+JNFNoGl7IRbDo8=;
  b=PdAYzEH6xI9InmEGycMMolBg9K566y1ESP9wdrbZqV7HMHF2FrKuEXLB
   yFMM5dMr3vfDuZjy9NABdXTHOHUTgjRHe+F3Fuvvceiniq+p0qherk1LS
   PMps4YdhQKGuyPs6vyajZPKziUxuOP+eTmhn1SvuOJSpq14F6WGHepg3A
   anE+x3riexCuRrRkoFT7M83YJlT7oq8U3LKbyk0gvM9UwaIasFYwBxnJU
   +gP7lBa8MbWT5sc6iMdKF0XPMl2+XfLqmitF2uZBoPFzqPqlG/BosxbXE
   35lPsj1kINqtldPljA3eRRKiD7/b0C6HbKli5C3m9v8rAiWT67dGoQyXb
   g==;
X-CSE-ConnectionGUID: PqxUrZDtSzO9uCXb1LWTQQ==
X-CSE-MsgGUID: iV7Ru6TKRsCXdAIP4eepuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35841159"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35841159"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 10:44:20 -0800
X-CSE-ConnectionGUID: qqbS4kyETSqut8+1Qa56Sg==
X-CSE-MsgGUID: 9YiDhUBLSFaMRCWhpg0Fbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100055777"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Dec 2024 10:44:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRFJo-0003Sc-2t;
	Fri, 27 Dec 2024 18:44:16 +0000
Date: Sat, 28 Dec 2024 02:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662] drivers/iommu/amd/iommu.c:69:30:
 sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be
 static?
Message-ID: <202412280224.mAGqCCAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e53a23ef21aa9859c864e7c4bb6ecde5269f54b6
commit: ebb4f9309c67ec7e9a872dbd5e7cacaaf78f4bf2 [1662/1662] iommu/amd: Access/Dirty bit support in IOPTEs
config: x86_64-randconfig-123-20241226 (https://download.01.org/0day-ci/archive/20241228/202412280224.mAGqCCAG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280224.mAGqCCAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280224.mAGqCCAG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/amd/iommu.c:69:30: sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be static?

vim +/amd_dirty_ops +69 drivers/iommu/amd/iommu.c

    67	
    68	const struct iommu_ops amd_iommu_ops;
  > 69	const struct iommu_dirty_ops amd_dirty_ops;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
