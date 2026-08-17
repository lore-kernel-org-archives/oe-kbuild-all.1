Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6578944C65C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985708; cv=none; b=iWrCY+tVXyrXGAGqiR1g1VemS2izatKlcMyjQWaVH/BIQtVRHQInTzYsGPEYK/4O9yaQBAf5HjfnV/OnYpnAHxzo8COjggoIHn6l4gUcIie6WFfr/HHy4qRmNMPlkqkTHnzDy+DypNvWGmhzalPJEKxTkVKJssXVj0sIKSSqqJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985708; c=relaxed/simple;
	bh=aoP3+++jhCgswqdF89+0vbsToZiwbK0wtHF7BZ08o08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N39mq7cOIMvXT0W2aiZBPQt/snGdSG6jGeE/wdckrbfjpXcL2eKG897dDjIUnqwjsod2ENbEtyZNSx7oFxCaFoiE4FGDmsqK9uYfoSl77IbfSMNf+yhJV27flrNxfZsSJ7uRTtiD4pR1m/YQFTUzc/7vFpiChhR9CE3Hpgi4yTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdRB7M2D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdRB7M2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786985702; x=1818521702;
  h=date:from:to:cc:subject:message-id;
  bh=aoP3+++jhCgswqdF89+0vbsToZiwbK0wtHF7BZ08o08=;
  b=XdRB7M2DRqaFCaXnWlpWpoC6Yr8kmh3YcjPKBYpLE3A/4erj5SywgzX/
   TMv1d5bXZZbuCBavyKrVLqTMP+34wuYDDUHPiW3d0gwbxyo6xFq1UuYKD
   pWMbwFEqYNJ0OVZEzQIpM6LxV8KU9WXgGJ4+7vw0/ilz40sDAXvdHTBoA
   pnoAb1/VYqz+tfWsgOfR9dp+oKOnNAA0V8Us9sHh9Mr9WHZ/qDnqMLfLh
   illQahyQrukKEHNSedmuaKQ4qVwRX7zv/33ein7rN9VBuKCA3Z0eUv74t
   KoPwjSgRR1ldIeOHSEwIOj5/SFhKby/5QhR4zrvR3/vzf7aLjgU6uwGFr
   A==;
X-CSE-ConnectionGUID: fP7pMx8UQzOVW8At7a8u6Q==
X-CSE-MsgGUID: WWtP5v0uS8O3OPZ56YVpyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="74996390"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="74996390"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 09:54:57 -0700
X-CSE-ConnectionGUID: UBC/rzGWQ46bghatmdTPog==
X-CSE-MsgGUID: 18S67hlBRfC0E82lNjSARA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="269247676"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Aug 2026 09:54:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww0bt-00000000dfa-1bsE;
	Mon, 17 Aug 2026 16:54:53 +0000
Date: Tue, 18 Aug 2026 00:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 167/217] Warning:
 drivers/regulator/max8998.c:59 cannot understand function prototype: 'struct
 max8998_regulator_data'
Message-ID: <202608180027.jXWV7RZS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 2a3be8c163ae1aac1daaa8a851aac755698ac63d [167/217] mfd: max8998: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260818/202608180027.jXWV7RZS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180027.jXWV7RZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180027.jXWV7RZS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/max8998.c:59 cannot understand function prototype: 'struct max8998_regulator_data'
--
   drivers/power/supply/max8998_charger.c: In function 'max8998_battery_probe':
>> drivers/power/supply/max8998_charger.c:95:28: warning: variable 'i2c' set but not used [-Wunused-but-set-variable=]
      95 |         struct i2c_client *i2c;
         |                            ^~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
