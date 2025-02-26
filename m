Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EAC225784
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583694; cv=none; b=YkEsJejtcYPqs68Mt1Rkk/B5QtVEtXAL+P/eutsfLDFQIHkyRq6sDtR7y7aShLcHgWtLHjmtDU8aWsuT6EitHS8gL5z//2xbH2X1UsfPZF5z4tOEB7Y9k/hoS8EGPcRCNJEh4IqAPZoVVWPB9ctTHsIWyWrI0Z9FEyDrH8jbWJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583694; c=relaxed/simple;
	bh=ZDrhP61Cm/Qzt+NRSwzDHWeLHzZO6P9FzczP0y6A69M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Utz2Q9c5Sx11xl0g1ALzLFPoPzD6qXxq6MVW7tEgF101JkWi6muZM9hHUIk8bMa/F0f7tc8g7NZa/suNaqML9I/RAll820yt8dDdi6mLxiaiI12ezoDBwegayAU0g+GaXRXSqrMWkmwHpxgA+H730nWd+Z2ON5WjqMn6R2ff6yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQEAw3Vr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQEAw3Vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740583693; x=1772119693;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZDrhP61Cm/Qzt+NRSwzDHWeLHzZO6P9FzczP0y6A69M=;
  b=TQEAw3Vro57Io2/i3aekjVTur1g4AwpUX5kzzEbLpPEInXk2adapSW0f
   yYNU0DYUuw/86zU0soEtawj9ZLFOHbW7ZtMFyv27p55nHujw+4518rtDj
   UK/z17Gse6jhyDXVxjtA/9VogiFm1sX2xlo9tykU7JHeKQZeBLG55MPc8
   d7i5t3nDb6CTnRKa2huc/LXfEZNGZSqGRzfeiY7WrpIFN7p/w5nMDzYFm
   rV3cckRxBJCQqAgPp9M84w8N05rA7fSexDK1vTEHn+lObe2Wqj56Wl9A5
   wb4vIvgNQagx6sjXMDkNR0lGeM+PVskDY2pHikVBmmciz0rdDn2loKk2I
   Q==;
X-CSE-ConnectionGUID: 2SVJl6MoSEOG9r0msnOwDQ==
X-CSE-MsgGUID: AzN3OT/DSye8WHlWZUrnLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52851081"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52851081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 07:28:12 -0800
X-CSE-ConnectionGUID: +nhsA8l5RC2ZSX+QmGaKvQ==
X-CSE-MsgGUID: M9YaqueNTtStrfnQBmbtpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121669974"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2025 07:28:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnJKS-000BsV-25
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 15:28:08 +0000
Date: Wed, 26 Feb 2025 23:27:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] drivers/gpio/gpio-max77650.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202502262307.Y4QBZiLO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 72b5135bc396ba092268a0970bc3205292bffa67 [1/1] gpio: max77650: Add GPIO support
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250226/202502262307.Y4QBZiLO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502262307.Y4QBZiLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502262307.Y4QBZiLO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-max77650.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
