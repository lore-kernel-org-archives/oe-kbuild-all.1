Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754678F4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734649026; cv=none; b=hoGRim+pv/5pca5GjAW9a/6SmTmJGazwm1e4FhprzZ9fo2FRAyOETW3E2btZUz9IkY8vWsDKxbfq+z4BhZ3sxOh943gkaZLSeQVkOtWuDrgIVm7RHp35ZyaWks9UvIstMiA+Zvpd37YanKxnXCGswrG+q5Ter04iW4xBKPOlorU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734649026; c=relaxed/simple;
	bh=oxpVSe3akh0OXkphYNV3nv0/fYPw4yqY90ohrwgdN2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DKMzfcrLV9jnXzGs1vcX3DNiytUtPvy9E6wf2EIm7c9UQqbRzdVOphT5TWCvr7zFXckP/2EpXAmXyfdFK8JaIQOJOEon91dD527E7ywD7GkJqvd7OdD9h5F/lcw0/ff6cmNtGmhkhPpuGOb/ULKEI3WvcBJPWt50XJscgzqkIrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMe9TX1M; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMe9TX1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734649024; x=1766185024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oxpVSe3akh0OXkphYNV3nv0/fYPw4yqY90ohrwgdN2k=;
  b=kMe9TX1MSRgiN0mvuKpe/jUAbbfksmbWGol77sEbCGl+a5x+wdCn5HYg
   SogVvs8852x8WTPY8sKZC2nIz2yzVaEkyKvxlC/PZvy75Ctkbl33xVE/5
   /WU1/w7HJGHuxT2grJRcJ1gPVYnGvJ1zYNHs4qMukKPrv6cxsPsCNPkt5
   xFIDdrWkDyhQDYAE9Xra9HsRWpm/LctUzz0HBxCYOOxcHC3+xB5Lbtnwy
   h26+Tg8Q1W8e9a2B7/+JwJ2uaRTjH80Iq3ozKetkEWLYG2Ds2mREIy/F2
   Y3OuGW9ePoDmOZ9qVmVAHLd4nuU+JWjYbj2Lr/rtpiOpsw2om4EtkBpzN
   A==;
X-CSE-ConnectionGUID: cHGVC+GFQju/G4ejXIugTw==
X-CSE-MsgGUID: DkC5eCtSQAaAy0g+vndbnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45873699"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="45873699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:57:03 -0800
X-CSE-ConnectionGUID: CQZnw88vT7i5AcdK+EiO6Q==
X-CSE-MsgGUID: +4fYFBdFTWilZ7/KSJIiPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98140204"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2024 14:57:02 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOPS0-0000b4-1v;
	Thu, 19 Dec 2024 22:57:00 +0000
Date: Fri, 20 Dec 2024 06:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: [openeuler:openEuler-1.0-LTS 1336/1336] mm/.tmp_sparse.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202412200657.MNv3HQPe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8fbcff0074ff9f93ea927547e99e1dde27ddc7c5
commit: 2a3cb8baef71e4dad4a6ec17f5f0db9e05f46a01 [1336/1336] mm/sparse: delete old sparse_init and enable new one
config: x86_64-buildonly-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241220/202412200657.MNv3HQPe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200657.MNv3HQPe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200657.MNv3HQPe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/sparse.c: In function 'sparse_init_nid':
   mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     199 |              ((section_nr >= 0) &&                              \
         |                           ^~
   mm/sparse.c:461:9: note: in expansion of macro 'for_each_present_section_nr'
     461 |         for_each_present_section_nr(pnum_begin, pnum) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     199 |              ((section_nr >= 0) &&                              \
         |                           ^~
   mm/sparse.c:480:9: note: in expansion of macro 'for_each_present_section_nr'
     480 |         for_each_present_section_nr(pnum_begin, pnum) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse.c: In function 'sparse_init':
   mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     199 |              ((section_nr >= 0) &&                              \
         |                           ^~
   mm/sparse.c:503:9: note: in expansion of macro 'for_each_present_section_nr'
     503 |         for_each_present_section_nr(pnum_begin + 1, pnum_end) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/.tmp_sparse.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
