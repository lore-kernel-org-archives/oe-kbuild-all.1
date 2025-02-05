Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27791FC7ED
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778489; cv=none; b=oMlKzcxtmdEtqm4dkhd62KkAgWPePkp+WjHnPLIpJMpqN1Fymk0uzmeeZJPqrNEI4zqTUbsEVefs9K5+knY07EPFOfA7gWzjg9Wchbq90/SvUF14b7NNzPiCmyULTLqKH7g6NhJtYadw4suHPXU+z7CWop5v2b3bpQFPknke1pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778489; c=relaxed/simple;
	bh=m4khLFkdlfFoqDRWnPlPdJRQTornkUstP0HZ/cPaSdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xzqd7NWOR0LSoHonO06AdcfGOcq+YmeSI7yVLBtCIVgZ6ecZJC5dXKus5pEt55osceQPJSwh7Hjn86a/VJqsyTfcoEx5JTjj0pVa44KyqI748WOB6rNiDNhQaA08Us4GTGHvrydl5HNDynqznSd2aw2p1uS6fRt4t9acyuPOcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWF2md1k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWF2md1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738778489; x=1770314489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4khLFkdlfFoqDRWnPlPdJRQTornkUstP0HZ/cPaSdQ=;
  b=AWF2md1kCh/YrllQZIRTO+rdpWcjSloZWah58KfelfN+SlzWjQWlSneT
   40PR0qaC0qo1SPH4z06XJjqWBUKQljwRj4J2t4mqk473cPdzrT3Yv5oIS
   +ebo/zIY/nttEsrEBQjt+LsKA3/OUMT2qXCJrnvh0AW67KIsg3CX1MzEl
   YRbK4gYdtSkkEoxekETqMNF8bSNCXCjYfmo8h5ra9/sie18t3C8pT0OMa
   rNVR9qfF5ygTylgdQKNHTnedDTGf04qZPKEs9HJ5yn21epcPTyPsx1eOr
   qpHQ+WwXq2lFs/HHSzNLEbUfvkMvSSp9h4Bj7yXsn4HpFMkPXViiD7QQI
   Q==;
X-CSE-ConnectionGUID: qu25gR+PQQeXpZ+6TNJkxQ==
X-CSE-MsgGUID: eBmOeuIKSD6/opbWxIS1zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50750704"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="50750704"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 10:01:28 -0800
X-CSE-ConnectionGUID: kTavQqiGTtOl/G6l1ROGNQ==
X-CSE-MsgGUID: uSq4idqMTCSZB5KvGVh4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110819790"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2025 10:01:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfji9-000vsp-1C;
	Wed, 05 Feb 2025 18:01:17 +0000
Date: Thu, 6 Feb 2025 02:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/thermal/mediatek/thermal_interface.c:59:5: warning: no previous
 prototype for function 'set_reboot_temperature'
Message-ID: <202502060117.HRxU2Biv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: f92d27911c80f765803e64a146e7fd2ffad1c707 [192/192] CHROMIUM: thermal/mediatek: add thermal interface driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250206/202502060117.HRxU2Biv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060117.HRxU2Biv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060117.HRxU2Biv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/mediatek/thermal_interface.c:59:5: warning: no previous prototype for function 'set_reboot_temperature' [-Wmissing-prototypes]
      59 | int set_reboot_temperature(int temp)
         |     ^
   drivers/thermal/mediatek/thermal_interface.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      59 | int set_reboot_temperature(int temp)
         | ^
         | static 
   1 warning generated.


vim +/set_reboot_temperature +59 drivers/thermal/mediatek/thermal_interface.c

    58	
  > 59	int set_reboot_temperature(int temp)
    60	{
    61		if (!tm_data.sw_ready)
    62			return -ENODEV;
    63	
    64		therm_intf_write_csram(temp, REBOOT_TEMPERATURE_ADDR_OFFSET);
    65	
    66		return 0;
    67	}
    68	EXPORT_SYMBOL(set_reboot_temperature);
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
