Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC88F58
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 05:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731042835; cv=none; b=bBoF/9dfsqCad/Zi/3rZh/O6z2GW0g5A7GDhpi9N8oawj2sYH4j9XcKk2ox/W9aoSyC2z44E4qpWd43KG97oXZ8KcpqSxVI6ErR7RYXwZ+j5caUPK4LgihQBwsgADiX2sms+q7VSzUO7ughGuw769XgnYROXqqjgmXfss/ZHaag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731042835; c=relaxed/simple;
	bh=tc7im/Hzm8FCIdYkaVOz9AfMmC+TaduCkLU0jlxkJ6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+9NU0G6NGk2FXvWcoqB51iCrQJXe9vbHeOd/20xvTTn2twkjc7U4grdpko/9GfOcbSD+azdcACLMG6iuyR9+sxmpdwh+I2r9WSDuqDbnOUX0yeDE8mDSP2TYKOsgFrq9Vn4S3C3+tB46OSbBBDvjpVLPKJ48+JHNGyyQUYFbJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cf+snphE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cf+snphE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731042833; x=1762578833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tc7im/Hzm8FCIdYkaVOz9AfMmC+TaduCkLU0jlxkJ6o=;
  b=Cf+snphE3i5Ryj2SrGTc6v+83FzTpYZvG2TENFb2dv9r9yyqdvxFcLof
   YIK8NsUo5IUmwmfEi5t2nTm99Jcg7SAlRAtA8pcRkAYnyueAYuLXxejJs
   +GkUSofkYLYKeovHeDGWgUqQTYtxjhqjLHLPPKtw37vseN+/Rl4s5Xu16
   4zVN2N1ioJuFt6hDwSEUREHBwPNRipo4zW6jpmI6vO9kbHjBYuvGM1dce
   YHX5zv3oLNqmiP2lBSVB4HGYDZTjbFW5+pDf11/UZ2gtsUIRQHiMx3Q0s
   7lZgiaYj225/2UpFNiDUaaNIp2WYvlk/XvJO+ywPOQUAA33l6m07upyK9
   g==;
X-CSE-ConnectionGUID: uuJrXqfEReiX8p7MFmVj5Q==
X-CSE-MsgGUID: AvGrHArDRs6W38s10Mg+hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34842581"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="34842581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 21:13:52 -0800
X-CSE-ConnectionGUID: 6VscJYtcRqeIRB66H2toPw==
X-CSE-MsgGUID: 98ZTNDeZSs2Iza5oe8rIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90033773"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 21:13:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9HJc-000r3f-0i;
	Fri, 08 Nov 2024 05:13:48 +0000
Date: Fri, 8 Nov 2024 13:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:togreg 7/7] include/linux/iio/iio.h:788:16: sparse:
 sparse: incorrect type in return expression (different modifiers)
Message-ID: <202411081329.1XVxvCVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
head:   6415477ba63dea58b5cbf9ddcae75f18f33c71a4
commit: 6415477ba63dea58b5cbf9ddcae75f18f33c71a4 [7/7] iio: Move __private marking before struct element priv in struct iio_dev
config: x86_64-randconfig-122-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081329.1XVxvCVQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081329.1XVxvCVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081329.1XVxvCVQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iio/proximity/srf04.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/srf08.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/rfd77402.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/mb1232.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/sx9360.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/sx9310.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/vl53l0x-i2c.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/irsd200.c: note: in included file (through include/linux/iio/buffer.h):
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/isl29501.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/aw96103.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/sx9500.c: note: in included file:
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/sx_common.c: note: in included file (through include/linux/iio/buffer.h):
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
--
   drivers/iio/proximity/hx9023s.c: note: in included file (through include/linux/iio/buffer.h):
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const
>> include/linux/iio/iio.h:788:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected void * @@     got void [noderef] *const @@
   include/linux/iio/iio.h:788:16: sparse:     expected void *
   include/linux/iio/iio.h:788:16: sparse:     got void [noderef] *const

vim +788 include/linux/iio/iio.h

6f7c8ee585e9db drivers/staging/iio/iio.h Jonathan Cameron   2011-04-15  784  
6d4ebd565d15f3 include/linux/iio/iio.h   Alexandru Ardelean 2020-06-30  785  /* The information at the returned address is guaranteed to be cacheline aligned */
f8c6f4e9a40d47 drivers/staging/iio/iio.h Jonathan Cameron   2011-10-06  786  static inline void *iio_priv(const struct iio_dev *indio_dev)
6f7c8ee585e9db drivers/staging/iio/iio.h Jonathan Cameron   2011-04-15  787  {
9a5a2483bc60c1 include/linux/iio/iio.h   Andy Shevchenko    2024-11-01 @788  	return ACCESS_PRIVATE(indio_dev, priv);
6f7c8ee585e9db drivers/staging/iio/iio.h Jonathan Cameron   2011-04-15  789  }
6f7c8ee585e9db drivers/staging/iio/iio.h Jonathan Cameron   2011-04-15  790  

:::::: The code at line 788 was first introduced by commit
:::::: 9a5a2483bc60c12d73ac6ca5ac5ab95361a895f4 iio: Mark iio_dev::priv member with __private

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
