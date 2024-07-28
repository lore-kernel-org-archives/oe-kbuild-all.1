Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F48C06
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722154055; cv=none; b=sma72cTVUO6/6Nfopql0Z/lNVMU9aEoh1fqbXg0W1295DizRfInB5C8lwnc1pK9QQ7nltZhvehTYHQS7hU6e2ecNvyo/+PeMoVkkmi7Y8tt/9Uf64vy2aNWbl+RXm6VcVC+EqlINHemE/uGWTGGQhMU5f25n4m8EWMbm8dDiBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722154055; c=relaxed/simple;
	bh=/wMqt4yZKcnLKVD4aEuKLJTceFuqCwJ1aA2pw7pg2K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EqGAnqACUez71kf+/A0nBO7GPjXC38E/kj8mzAv7j1/Z9wYQ8x7eGOMGfDtYv6024nUcf3h6lmUIjvtJ4pPxoK6FiHVPYbOSaOiH0O6qgkBrw3wJlTvVvI3kMdeUwAkmX8oeRUgUvzlxZgT0H17d7rUFGbBK7RGDKib0qnlN9UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUbiYDZE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUbiYDZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722154053; x=1753690053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wMqt4yZKcnLKVD4aEuKLJTceFuqCwJ1aA2pw7pg2K0=;
  b=LUbiYDZE6psentm/iMgxm4YqSKYDpleob4/7fPOzgCIA98x+Da+CrirN
   zFMaZLS34tJedKZkfIQZ1lorOaq7YL2YaGUXSxEDtRV5Gt+WLHYvr0pSP
   baToJKFxvjgqg/DrwMHVb/EeqLqOBvWZISdp5N6Ixc3n8V9f4HsNhrrbd
   J/mDjdylddbsX/e+6hPpJDEkEtBevWM6XdW785HGRTOuBvCXaPkIdC3c7
   N4RWmnTTOdKvj7BpcIg246fY92Xc9VNFxognnXbh18xlBqYgtzIcIK8DF
   fVaS/sKYk/FeJnRku/LK0CzlAmw+z/W6xV/gUCWJZ5XLEzRHPDsSby6Vk
   w==;
X-CSE-ConnectionGUID: DIgRnuOMSsGKBZXL5ssBpg==
X-CSE-MsgGUID: /y7TwdZYScCzeHRzEbD4Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="19701904"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="19701904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 01:07:20 -0700
X-CSE-ConnectionGUID: 6ZuyNWyTRoWXhT7JScJsCQ==
X-CSE-MsgGUID: dBAsAQygRjO2s6vuO0lihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="53754739"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jul 2024 01:06:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXyve-000qdy-0b;
	Sun, 28 Jul 2024 08:06:54 +0000
Date: Sun, 28 Jul 2024 16:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rebase 140/384] ERROR: modpost:
 "rz_mtu3_shared_reg_update_bit" [drivers/counter/rz-mtu3-cnt.ko] undefined!
Message-ID: <202407281612.afGTq13T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rebase
head:   e8d1b09817999155836a2f74a7ee89eb0f78152a
commit: 378b44aaa458deefdb04767d403647cc66ee531c [140/384] mfd: rz-mtu3: Link time dependencies
config: arc-randconfig-001-20240728 (https://download.01.org/0day-ci/archive/20240728/202407281612.afGTq13T-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281612.afGTq13T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281612.afGTq13T-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.o: section mismatch in reference: opa362_driver (section: .data) -> opa362_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.o: section mismatch in reference: dvi_connector_driver (section: .data) -> dvic_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.o: section mismatch in reference: hdmi_connector_driver (section: .data) -> hdmic_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.o: section mismatch in reference: tvc_connector_driver (section: .data) -> tvc_remove (section: .exit.text)
WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx.o: section mismatch in reference: adc3xxx_i2c_driver (section: .data) -> adc3xxx_i2c_remove (section: .exit.text)
>> ERROR: modpost: "rz_mtu3_shared_reg_update_bit" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_shared_reg_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_32bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_16bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_8bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_enable" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_disable" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_is_enabled" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_8bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_32bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
