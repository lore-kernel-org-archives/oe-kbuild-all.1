Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E154403
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706042978; cv=none; b=fo27cs8j10ki5MoHs+hBGia5dTI5sb4Nhbue36OadavieOHkuPH3/1eacN9AXi87YOKp/WHjGT2w25skNXJlN1er5HQk5dYqnWSOdV3+guzMhcqBV1a4/axICsd6L69JeeoxvmSlpnBNi5X9TFt3V9vIFTrFqBChbdvtuZaRKwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706042978; c=relaxed/simple;
	bh=keKgec9Ngvy2VH9Xts4CzTLuR3bxIqIbx7OjZJlyb7s=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0AyO7J16ydlU4S8KkEiisai3CjzJDql2dcgrTew3AlSdQ8tEz3LNhsjejOxRBEgiklxyaIsddJT+JkrpOyqI4i4XZQJYRXAYzOYCc/858qSdaY/DtEcHScFeoNYOiL+fi1EejeeG/Mc13iqodV4akj6RYXBPEujvmiybP+PwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GK2F6wQB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GK2F6wQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706042977; x=1737578977;
  h=date:from:cc:subject:message-id:mime-version;
  bh=keKgec9Ngvy2VH9Xts4CzTLuR3bxIqIbx7OjZJlyb7s=;
  b=GK2F6wQBg53mPDyjQg3ga9EMCg+ZWMm5oRFhPyyModVxz/30t5GA64MP
   HTsuNGMYsXMmVcCAfw0DKlDHeOLqS+xu42Oeq2NIIxarPGbNpFnkimP+P
   zDufW6P4BxC0tkLV5TF3DSjLWT1i6oiXVA/S43gFM4HC4et8xNh6gfnr6
   +QZeWYrJ+5O9C0azqvlSaIto02xeTNLZ8BcVKfKVKLMpHJFehg0HmHUTD
   l3VNj5C6p4tBKcVWE52TKQ7yj4guetlv9Lrd+RzytRZDchrV4SvQFXJrQ
   T8UDHJwg219GL5oaqSqmJwcTJ5UYvkM8lu0g9o5Z6poA9D/Ch1EqPkZse
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8762023"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8762023"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 12:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735698438"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="735698438"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2024 12:49:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSNi7-0007eb-30;
	Tue, 23 Jan 2024 20:49:31 +0000
Date: Wed, 24 Jan 2024 04:48:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 47/107]
 drivers/media/i2c/ds90ub953.c:1390:3-8: No need to set .owner here. The core
 will do it.
Message-ID: <202401240417.elQ7TKaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   95b5a09669edc6d3a5216ab8155a621ac28dd6ca
commit: d1a221d48b45bc73a80c3e86a028dfe60f8a34b2 [47/107] media: i2c: add DS90UB953 driver
config: i386-randconfig-052-20240123 (https://download.01.org/0day-ci/archive/20240124/202401240417.elQ7TKaZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240417.elQ7TKaZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ds90ub953.c:1390:3-8: No need to set .owner here. The core will do it.

vim +1390 drivers/media/i2c/ds90ub953.c

  1383	
  1384	static struct i2c_driver ds90ub953_driver = {
  1385		.probe_new	= ub953_probe,
  1386		.remove		= ub953_remove,
  1387		.id_table	= ub953_id,
  1388		.driver = {
  1389			.name	= "ds90ub953",
> 1390			.owner = THIS_MODULE,
  1391			.of_match_table = ub953_dt_ids,
  1392		},
  1393	};
  1394	module_i2c_driver(ds90ub953_driver);
  1395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
