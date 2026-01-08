Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4B2F85B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767889321; cv=none; b=tsBIk+EVl/n5/vc+rOiOSimoLsVsI7zj8DF5euhrf4OREyBHh5/X+auUzKyIWJ8K9UN2gOIOMWxSpYoEdnXFhR2NVsJfhf+Yk4NqBuFzpGA8vlsSTvc6U84AwovOxDsETJV6tjTNSv2IFmpZEabMyW9ELBNKSoSjKurES2IiuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767889321; c=relaxed/simple;
	bh=7zJfnZod8qcDIuLaWds19l2iG0MGVi5xjH7ia8tXQMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kC3k9Q40+P6AQo/jwyskeWiBYGYFYR7rcD287GNjhl+rcmcDYGtDJJ9/o9hVTVqCopyzhqLoPcj7JQMuufwDjyxf6Orkh8ETMqm72jAHr4puevl3sqsZfhV+PMAfUakQBQW+gGZO8qEnPFU0NeZVrPmNWo7NvXqeKE5dYP3rZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgkAczFY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgkAczFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767889319; x=1799425319;
  h=date:from:to:cc:subject:message-id;
  bh=7zJfnZod8qcDIuLaWds19l2iG0MGVi5xjH7ia8tXQMk=;
  b=kgkAczFY6ZhQVC+8y3Lxks3O77tvc1qpIISMrNfKvBX/9BBwIQzDKn2C
   xzJRXMRnMV1RPBg7zs39SPo2EVTAQMx9jYtWlOw2qzxgZ+6vK1bBEOBJk
   lg+RX92wrHZp38Us+NMR04yr/VW8HN4K/dTJjCan/yy7gmR100dOT4QTx
   zZcUtP4T0/qWXALNHVh/XBgPbKLqMAjQ9jGV20WvQ88yS50ocBfe8dOK6
   BU4TwhOL+LLfHd5t0WlJhIhqH6qfUet1r3EXabc6WYj3vsHzFWu7HniS1
   qNt2EN1nbt/YKk+669pRtgF8yIwMioFrr+JJcUbTlcUhwoXdhlDmpSiGD
   Q==;
X-CSE-ConnectionGUID: Se98vP8ySiOf7SUY/bIT/w==
X-CSE-MsgGUID: fb6VuU+eR5e8ivJT1xsJUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86859439"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="86859439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 08:21:58 -0800
X-CSE-ConnectionGUID: rhn9Bo62QMObkrAOUn/OOA==
X-CSE-MsgGUID: HHF5z0AnTsqy/t3yYSwn0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203674711"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 08:21:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdsln-000000004wW-2cQv;
	Thu, 08 Jan 2026 16:21:55 +0000
Date: Fri, 09 Jan 2026 00:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v6 7/9] ERROR:
 modpost: "cxl_register_private_region" [drivers/cxl/core/cxl_core.ko]
 undefined!
Message-ID: <202601090020.Ck9SB8I2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v6
head:   75ba13ddb1f86035a0a20a211670b7a2dceb852c
commit: d88349108091308b791e4af323b4cb02400f0703 [7/9] drivers/cxl/core/region: add private_region
config: x86_64-randconfig-072-20260108 (https://download.01.org/0day-ci/archive/20260109/202601090020.Ck9SB8I2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090020.Ck9SB8I2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090020.Ck9SB8I2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "dev_attr_private_type" [drivers/cxl/core/cxl_core.ko] undefined!
ERROR: modpost: "cxl_unregister_private_region" [drivers/cxl/core/cxl_core.ko] undefined!
>> ERROR: modpost: "cxl_register_private_region" [drivers/cxl/core/cxl_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
