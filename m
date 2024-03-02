Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A21171D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709366346; cv=none; b=uuE6W5qa/oF9cIzMrTMvnXx/j8lIozJMJw4mKodUQMLDudT75FoaFQrwfWRvHeL7PdSOGCPdE0UiQFv/kARW0e+RAFyf8/A3XJVEYReFE7DLL6mS6nkS4a7OvvARUcsT07t2mXvf5wrrEYzAO8e6+jMQrmwFLTZmnd+HSTK8sRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709366346; c=relaxed/simple;
	bh=co7hA/b11tL4xW2+FQps/LBmhihj1CwVukKEY+MV2pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4zKU1dLpBjt+jhOKJwwC2arJIZf9f/wo0SiWFeqSCpQdPBKKTBilbyggXfriGDb1QsYJmgKrgJduHMnaD/pjYV96EjjuQrTe1JlYhZEqd9X6qs415cFzeftYQIsH8Gs5my5cNcz9G++3GRR3nOoPnUyDE2EKRoHjgEcdbzajcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1AIyVs8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1AIyVs8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709366344; x=1740902344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=co7hA/b11tL4xW2+FQps/LBmhihj1CwVukKEY+MV2pY=;
  b=P1AIyVs89KucYrfuOkJbl7kjARvneyrRDdK8ls5JPkHud2iNAwl9tXME
   LqGh5pwl6Q/YnHN0ouZG2a+yFVXTfWAJ53dypzYzkVpA0XiHf/5R7NLNA
   wDMX6TP17OhXxLq18ybqef4Z3Nl16quXLi4MLI/ca9pDK/N21EQxspy9i
   eufGxslEDuZzxieZuP++xHRfDcikUIHdrX5hEE+7++59lnYRJ+r3ay5Z2
   qj8M0WOL1eS1TfpBwSZMP2YQLuhLV6EozQaPk31h/ZzD8xVWa8BQEoVBv
   4ekVmHzJDyfYLszrtGVDrWfy3SRpjNr4FAf2tIo4bPncXeGMCHlgzogd+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="15353864"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="15353864"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 23:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="45956681"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Mar 2024 23:59:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgKGo-000ERJ-39;
	Sat, 02 Mar 2024 07:58:59 +0000
Date: Sat, 2 Mar 2024 15:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [sre-power-supply:for-next 58/60]
 drivers/power/supply/power_supply.h:25:37: warning:
 'power_supply_attr_group' defined but not used
Message-ID: <202403021518.SUQzk3oA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
head:   71c2cc5cbf686c2397f43cbcb51a31589bdcee7b
commit: ea4367c40c79a5f16cb0de8a94a6b72697d37f06 [58/60] power: supply: core: move power_supply_attr_group into #ifdef block
config: um-randconfig-001-20240301 (https://download.01.org/0day-ci/archive/20240302/202403021518.SUQzk3oA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021518.SUQzk3oA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021518.SUQzk3oA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/power/supply/power_supply_leds.c:18:
>> drivers/power/supply/power_supply.h:25:37: warning: 'power_supply_attr_group' defined but not used [-Wunused-const-variable=]
      25 | static const struct attribute_group power_supply_attr_group;
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/power_supply_attr_group +25 drivers/power/supply/power_supply.h

    23	
    24	static inline void power_supply_init_attrs(void) {}
  > 25	static const struct attribute_group power_supply_attr_group;
    26	#define power_supply_uevent NULL
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
