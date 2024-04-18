Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A003161935
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713453794; cv=none; b=UcQdqFBPNUOcA8LpZnuoeInThSigY2hJ7iygNOP1PWQ0WEq2+rasce4KuXLf+Ks/MaN5NJr9odFbwfqu3GLQUisX599xMlJyAKVpE5BVc/qnf073hW4IGdT8yu/uxF64r5446uVRmY0xzVmGLodc9Eji6RnQiwQz08VPmZV6oDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713453794; c=relaxed/simple;
	bh=R3KAi9QtKqNG/3/c0mO3Z60YQTVFRryUuiRQHVRKl4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssdKd3mlb+7JMcRDOjWC0KbDSQiafW78gpR3D6dNvBsyNrEnfL4YLRc3Xr/HogLgpRGE2maSB9HWzV2ieUUeH0Z6mbfa9zmZ3QVuHkyuM+DxdDYu4glTZ4F5oFMxMtlDkFW28i7OfpbeXzRP2gbu5Egip84AHkpw9/8+JG0ss0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ew31IDjG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ew31IDjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713453791; x=1744989791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3KAi9QtKqNG/3/c0mO3Z60YQTVFRryUuiRQHVRKl4U=;
  b=Ew31IDjGXwnhmb3WkhUZ6UJnNfoCk35zxQqRY6T7T5PU/eQl4hPBm7Jm
   2TH1Nda7GEECIIpJuY/QEG3Kkf2L5IYXFImv7l3yEkKOU8ctZMkx+xrsf
   fZZkKYBC68m4OKWPbuE4HC2tFuirblxstB4059hfBEnbXK5qKO1GXcqiy
   Rh0AktVcmMFhGZgy3nKTmQvkC+hkBP/T5s+C2WVvqdWkrp1TpAaU9pUc6
   i1Fc8ADiQFIAdjpwA5ku/oJVwRQS2ymIS2BYAAyiM3Hl/I33JMdtnz3/q
   JjurdfKVzv/MzxeGUnXVl7w57HOl9t3/Byx55/jidXkTuZCshZvlKAttU
   w==;
X-CSE-ConnectionGUID: /pLxq/sfTGGt4XgNrrskzQ==
X-CSE-MsgGUID: 5PBIE+7kQvuV/AnYDVEF1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8873214"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8873214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:23:10 -0700
X-CSE-ConnectionGUID: Xl+L/faVTy6Eb+qggehaLg==
X-CSE-MsgGUID: jLQyXipqTkemE2tELz2bTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="54205458"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Apr 2024 08:23:10 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxTbQ-0008J9-0e;
	Thu, 18 Apr 2024 15:23:08 +0000
Date: Thu, 18 Apr 2024 23:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 8/12]
 sound/soc/sdca/sdca_functions.c:14:5: error: redefinition of 'sdca_alloc'
Message-ID: <202404182342.HH2xrWXD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/parse-functions
head:   999b877354e492b6b1c8206962dcf1fd21c09f15
commit: e02a796a482bc2bafe64571d8fdd06fd5c0008dd [8/12] ASoC: sdca: add initial module
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240418/202404182342.HH2xrWXD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404182342.HH2xrWXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404182342.HH2xrWXD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sdca/sdca_functions.c:14:5: error: redefinition of 'sdca_alloc'
      14 | int sdca_alloc(void **context,
         |     ^~~~~~~~~~
   In file included from sound/soc/sdca/sdca_functions.c:12:
   include/sound/sdca.h:23:19: note: previous definition of 'sdca_alloc' with type 'int(void **, struct device *, struct sdw_slave *)'
      23 | static inline int sdca_alloc(void **context,
         |                   ^~~~~~~~~~


vim +/sdca_alloc +14 sound/soc/sdca/sdca_functions.c

    13	
  > 14	int sdca_alloc(void **context,
    15		       struct device *parent,
    16		       struct sdw_slave *slave)
    17	{
    18		struct sdca_data *sdca;
    19	
    20		sdca = devm_kzalloc(parent, sizeof(*sdca), GFP_KERNEL);
    21		if (!sdca)
    22			return -ENOMEM;
    23	
    24		sdca->parent = parent;
    25		sdca->slave = slave;
    26	
    27		*context = sdca;
    28	
    29		return 0;
    30	}
    31	EXPORT_SYMBOL_NS(sdca_alloc, SND_SOC_SDCA);
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
