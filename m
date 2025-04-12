Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817771C6FF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744460773; cv=none; b=JOcTXuzfLnJZcHNKOhHhyBDcAs9CQeRDcthNXwk/2BbbVCFJik3NscuhVFPmPfM69LOyxeuK3pTp0tD7s1JterbfpgF6x3cu99eXvjLHORGxaqQjYHuOsPW2YgIWS4nvm0L+39gADGgUa1OfxQBJMY2PtO9svH/8Dpc3WiOehLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744460773; c=relaxed/simple;
	bh=T/9NW4+FK4jdcj/2dLRyjdOqr/APolv6nsgdTC7mc2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctbn/FxUISi+S/UG17gY8cEf3eOQ50u+xkbWF92/uO7nRYo5eiW16TqINXYLxo4MFsEnsRknBBRk16xi1mZdUkdPvMwU57YhnxS6KmzcItX5mOIzg6MVadIrMX6hvI0EryBmd/gBm6fMpsR6HvF4jBazw9eS0zMzkIV9eFAeK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1SPt2MC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1SPt2MC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744460771; x=1775996771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/9NW4+FK4jdcj/2dLRyjdOqr/APolv6nsgdTC7mc2o=;
  b=V1SPt2MC6Ee+vg7eobBPmobel9YpBMw8EP/NoowPnrDuUfK7DGWX7ZdL
   3UxK3DcVbvMl9uzEnHmtyY58+brxYxK194koJQnQTbSC09NQGrxxmO3ec
   EoSKDva4MLoGv8gAnUrJzzUUf6R218bLgrm2d6NBwidgp9T8qR4UiGzg3
   GQz6A5bLWP2CGJ84Xi1MufbZWMc4kIyT4OBvaFz49Kw0RK5VxTtsKWITz
   AZNTAqE0KCAdM4hg8l8ouddD6jHJzHnY8m4xQ6NRwTYS7RcQ0rrrsdiv+
   MqCPogYFMiU628t5k2mcl13W2ZePDxUBPqL8+FM6fGOl0MJBdt1r/vp7e
   A==;
X-CSE-ConnectionGUID: OtZUtWbpSSGRBHmUbtcz9w==
X-CSE-MsgGUID: GA4+Yk/JQFCEc/7t3sasEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56177382"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="56177382"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 05:26:10 -0700
X-CSE-ConnectionGUID: sB90IQEFQreepicdAJCf+w==
X-CSE-MsgGUID: 6H7ztY/SRkyPDT7V2kEnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134270760"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Apr 2025 05:26:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Zvz-000Bmi-28;
	Sat, 12 Apr 2025 12:26:07 +0000
Date: Sat, 12 Apr 2025 20:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.15-rc1 40/102] make[7]: *** No rule to make
 target 'drivers/platform/arm64/ec/huawei-gaokun-ec.o', needed by
 'drivers/platform/arm64/ec/built-in.a'.
Message-ID: <202504122019.7DJ78gOz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.15-rc1
head:   1b55f6914063388a543ead294a0253c223d39bec
commit: a6b023449e05c530a3a0a390bac9b6ffabff57eb [40/102] platform: arm64: Move ec devices to an ec subdirectory
config: csky-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504122019.7DJ78gOz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122019.7DJ78gOz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122019.7DJ78gOz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/platform/arm64/ec/huawei-gaokun-ec.o', needed by 'drivers/platform/arm64/ec/built-in.a'.
   make[7]: Target 'drivers/platform/arm64/ec/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
