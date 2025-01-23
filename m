Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE4C20E03E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630185; cv=none; b=CtnpMEPJXK+e352WrXUSuNB7pT2CgUPepg2mcEWURJf9a4ANTebNMjtA7Po6trBdwypRYSiG6+ayvXH3i2gMkwmvanZTxT9yyaFNrD3aJKVwm19DREfxoaNJ1s2sEkKJoxgEMY5lb+GqszNBEIxFKkNDuTZaAF53mRJfr1RcXxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630185; c=relaxed/simple;
	bh=iWzTBFBbx275aII4nTCELg/Xb0E8e8lcfGuZGCbZ8Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WHAOTQAWQQSRtiiH+/bCwQkiXktP6f2zcBJd7+c1IdBTzxWFmkhJe02qYLSTqcXg4/qOZLO6FZOcCxt+sGs3SmbWQap1dNK+KqOys/hqNhD2zcuu0Ka0HMwD9mJ0gcV6d19kEP02aPFMpTqlaDec9VlmBlJgCitxUK+yNlGTKGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUC1eBou; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUC1eBou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737630183; x=1769166183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iWzTBFBbx275aII4nTCELg/Xb0E8e8lcfGuZGCbZ8Z8=;
  b=IUC1eBou2xzjJK59ePlAqshujSynuT2yRXDt5mGPxmDj7v+F2dwNKw0c
   i4MMowtHbVBEm44eCQGtOlFFPw8eemnsjfmdxQMPnKxmhAWFDc1WMyg9/
   SN3WUg4/MEWunZRAS8J+XJ2ljTRH8TvIzlSIsB864RiQsWIunfw4GZNby
   lflTlIdgK6D5E670xaQzsBPyKzdxk3ceeSEtO+V4fCyjPwXodoSCQz2dw
   eAvrtTjtNtgWwU9QMzuaOOstcMvRyShlk3SlyEBQ6xmZkuFQbuKijqaNF
   5yFbZTx+MugwWLTBWcvjh/tQK9OI5dofhzZdg9OH3Tc9JjINw8Qk2BQIG
   w==;
X-CSE-ConnectionGUID: 55/vZcbBQVSr6xasIDOoOQ==
X-CSE-MsgGUID: sexZS/J9SryphkI8/Zhhqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49113592"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="49113592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:03:03 -0800
X-CSE-ConnectionGUID: LpT0mM5GQGSLdZ5mAKOBig==
X-CSE-MsgGUID: QaMaCf1oQ76tQh+PDE9YpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107239557"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 03:03:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tauzD-000b6F-2f;
	Thu, 23 Jan 2025 11:02:59 +0000
Date: Thu, 23 Jan 2025 19:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13/13]
 drivers/soc/mediatek/apusys/midware/2.0/ext/mdw_ext.h: linux/types.h is
 included more than once.
Message-ID: <202501231835.HfLOQzn9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b33e322e1a35554932b5cfc4cd9f32bfa7d534a9
commit: b33e322e1a35554932b5cfc4cd9f32bfa7d534a9 [13/13] CHROMIUM: soc: mediatek: Add APU mvpu, mdw, apummu driver
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231835.HfLOQzn9-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/apusys/midware/2.0/ext/mdw_ext.h: linux/types.h is included more than once.
--
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_mem.c: linux/dma-mapping.h is included more than once.
--
>> drivers/soc/mediatek/apusys/midware/2.0/mdw.h: linux/dma-fence.h is included more than once.
>> drivers/soc/mediatek/apusys/midware/2.0/mdw.h: linux/hashtable.h is included more than once.

vim +10 drivers/soc/mediatek/apusys/midware/2.0/ext/mdw_ext.h

     8	
     9	#include <linux/file.h>
  > 10	#include <linux/types.h>
    11	#include <linux/module.h>
    12	#include <linux/miscdevice.h>
    13	#include <linux/slab.h>
    14	#include <linux/of_device.h>
  > 15	#include <linux/types.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
