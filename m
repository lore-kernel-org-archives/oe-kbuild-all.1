Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB828504F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765383816; cv=none; b=MXLMTC8ssvK/fRWPKlLO6tuiQ3sGPi60zrT0dlPMH48pHWijADaFsBaN0lNuahk0H6j7Xa7mQerIQk6TsU0Bq3vhCt34+PD4RsPuIrfE7HckSKIHww896Pi11jb/NgeibXOCOoANB+GDuQC3DtVcL42wQegkaK1qQL00wyJbSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765383816; c=relaxed/simple;
	bh=uhGtZXBliu1WpD1iU/AZvq720qKTGWHb2nVT2pqXcJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHytbMYY4ke6aec7BgUX2vgWVRQLPH/tAYunsNrqYk8mxAVavqhboXwydLVEx0Nlv8Y72H26uZr32sHWa6veL+i1kUdT1gcNMAbaYVmA4/5D6WAa4dYhP+GrFIOjbyHBZ9pF8cwi/jtIAWtfUIIoe3wmoRGDfdQIDKxhxlt6TBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhAwYnm0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhAwYnm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765383814; x=1796919814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uhGtZXBliu1WpD1iU/AZvq720qKTGWHb2nVT2pqXcJQ=;
  b=JhAwYnm0i5nuQv9r6if9HB6FgdMJR8Om4nL3GC6X891h5cYpwi/GtQMo
   uS7btAuWIJunT/qUaqpD5MpRWLaKmmxv/UxicLljQaPUTaZCOdDjHis8i
   d75AX1OOySE4QVb9gxWNiTLQ3t1JNgsXkaOj9Op0c1Q26Pj5JcxUqggjS
   NflMtV2hH6cP5VvB5t342asFW+tGmDW2usZFk0uoLkTT8EPwaT2K+oZ8Z
   ft3NXwTI3xTeq2UPk9QKwvkmVCbwDC5i26P1WEedB6V9ST4ZvlPzT1nfR
   EYEjX/CwYZKBinRvXJaYIQ1voqHoVz1I3a+IQ82yuz3eVH6giz8R21gfF
   Q==;
X-CSE-ConnectionGUID: YPiHMTq5TL2oYYKppFX3sA==
X-CSE-MsgGUID: 3PWR67cATOi9s/DwdfHoHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92834674"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="92834674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 08:23:33 -0800
X-CSE-ConnectionGUID: /sIA93MWSUqw0z9MWnt9IA==
X-CSE-MsgGUID: 631f7/DKQJekhDdAitPUSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="200989365"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Dec 2025 08:23:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTMyN-000000003Ov-0Bo2;
	Wed, 10 Dec 2025 16:23:27 +0000
Date: Thu, 11 Dec 2025 00:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:19: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202512110005.f16tR709-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 8debc601f33e3b6848ccaa54209cebe0b684f844 [3508/3508] urma: implement ubcore sysfs interface and device management
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110005.f16tR709-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110005.f16tR709-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110005.f16tR709-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:19: sparse:    struct net_device [noderef] __rcu *
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:810:19: sparse:    struct net_device *
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:1106:5: sparse: sparse: symbol 'ubcore_create_port_attr_files' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:1197:5: sparse: sparse: symbol 'ubcore_create_dev_attr_files' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:1217:6: sparse: sparse: symbol 'ubcore_remove_port_attr_files' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_cdev_file.c:1223:6: sparse: sparse: symbol 'ubcore_remove_dev_attr_files' was not declared. Should it be static?

vim +810 drivers/ub/urma/ubcore/ubcore_cdev_file.c

   800	
   801	static ssize_t net_dev_show_cb(struct ubcore_device *dev, char *buf)
   802	{
   803		struct net_device *net_dev;
   804		int ret = 0;
   805	
   806		if (!dev->netdev)
   807			return 0;
   808	
   809		rcu_read_lock();
 > 810		net_dev = rcu_dereference(dev->netdev);
   811		if (net_dev)
   812			ret = snprintf(buf, IFNAMSIZ, "%s\n", net_dev->name);
   813		rcu_read_unlock();
   814	
   815		return ret;
   816	}
   817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
