Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B902F43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 04:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734065007; cv=none; b=PdSHFQk3kj56TFL+Rwx+qC+BiHI3nya+RiJsG8Nt4V942WmsysGGSwQSwvUIC5evg0uCYVYgldnyuW+rtGNF1NcFZvVD286Ezx8re4QG1TWnS1jzD/Qf36liFMWh/xGDdQ1iD6+vKmLqZqmt1ZAvrlCihVNGNnGTY5FTlWUoK/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734065007; c=relaxed/simple;
	bh=jWEtcpLbKIl4iWbU7gOlr0q6Cx4zOqQ8pQQAIewgiSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iC/2IEDqz2cafltCmCvxpkSmNLA8mTdUJu4OOQi7VVx9sT1jROvqNyP4lALctnCDBAO429SPO8ST/xoHgHfcjdAaI9ZvGC8Z00UR/lQLClmusirVKx5rNJYg031SghTYbmvmHgc+zXGdQoAcBN3qnsd5cxvPKsgbqVashfKh/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O13vlvrE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O13vlvrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734065005; x=1765601005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWEtcpLbKIl4iWbU7gOlr0q6Cx4zOqQ8pQQAIewgiSQ=;
  b=O13vlvrEoXVv8xZDJnjF5N8/O20wNZ2Nq/RczGLJnvpWnT9UlGNsnc2O
   nIhcd5W50pHFnaGaNfxUGuBp5F1Nm+pQDeEESjvghoFeHOWg1aDJ+ed5F
   wV06VEG/hzBFEIraiXGeNZI6KsV2aM/j9uslDA/+YQCN+pJYh9bP6Yxrk
   D4O3hkPPKue63ype1JRHWqwO/MBI7AfcTNfbzsJ4GawE5dhTgV4XOx9bX
   fkJe/4YbwYeoWqHazWKduoH6FrGOW+AxwaIOpekmK7js36VSPoiNfBvyo
   YeIrq6miJCPFFdiVkE8tmluk8BH9m4ObjWg9P2Y0pQCmT0qBBqSuv/sIv
   g==;
X-CSE-ConnectionGUID: fOUgvTYWRn+kTTRcK3yliA==
X-CSE-MsgGUID: oHAPRMEZRDuFea6YqIRqiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37355010"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="37355010"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 20:43:24 -0800
X-CSE-ConnectionGUID: OMaSP2uqQaKszZMXG5JiSg==
X-CSE-MsgGUID: mBmj458TSH+xv82yo6HXfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="101287281"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2024 20:43:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLxWL-000BiH-2B;
	Fri, 13 Dec 2024 04:43:21 +0000
Date: Fri, 13 Dec 2024 12:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 19/30] lib/spdm/req-sysfs.c:174:27: error:
 initialization of 'umode_t (*)(struct kobject *, const struct bin_attribute
 *, int)' {aka 'short unsigned int (*)(struct kobject *, const struct
 bin_attribute *, int)'} from incompatible pointer type 'umode_t
 (*)(struct...
Message-ID: <202412131208.WlVXD05h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   8ecd52ed0821c4955732e004a6cdb812d78d2b20
commit: 0c3179846b619d25d5754231ffdaf4e531b77f8b [19/30] PCI/CMA: Expose certificates in sysfs
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241213/202412131208.WlVXD05h-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131208.WlVXD05h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131208.WlVXD05h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/spdm/req-sysfs.c:174:27: error: initialization of 'umode_t (*)(struct kobject *, const struct bin_attribute *, int)' {aka 'short unsigned int (*)(struct kobject *, const struct bin_attribute *, int)'} from incompatible pointer type 'umode_t (*)(struct kobject *, struct bin_attribute *, int)' {aka 'short unsigned int (*)(struct kobject *, struct bin_attribute *, int)'} [-Wincompatible-pointer-types]
     174 |         .is_bin_visible = spdm_certificates_are_visible,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm/req-sysfs.c:174:27: note: (near initialization for 'spdm_certificates_group.is_bin_visible')


vim +174 lib/spdm/req-sysfs.c

   170	
   171	const struct attribute_group spdm_certificates_group = {
   172		.name = "certificates",
   173		.bin_attrs = spdm_certificates_bin_attrs,
 > 174		.is_bin_visible = spdm_certificates_are_visible,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
