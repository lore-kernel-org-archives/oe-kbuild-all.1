Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46664A59
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 01:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714268766; cv=none; b=abfynvwEgV78qr3Dghx7Rsq0ftRUWwR76VpzM1ohT0p9lZHweFH9iAVriG+DwAbigSMpw6O/rdIFoH+/XMZoCqdKldi3Z0qqGB8mz1lQG5qodxw1vF7unbJ0Jse6O5sSUV/t2Qpxgqm3VUihkpwLZDCdZpeZJ6HQpnbDSed9jME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714268766; c=relaxed/simple;
	bh=uWKcfr0oFMMEdzOepRUws5WisVttwCJTwcIHpatZVTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mGUFwGIugFM2ARmx5d4OphSm+kgZiiSE/rAYlK341Jgfolf/Fsxs6AOIqEi6AiFzoTZhvoBvNNzzhsMw5R/7kpWi/lTkt8oDphSxnHIB96og2WGg8wt1hUvoLVp/sIz2pFKTGqbnORTjmQo4vgJm2kV3sG/hne23FaHz4BnamiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbChZfNp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbChZfNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714268763; x=1745804763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWKcfr0oFMMEdzOepRUws5WisVttwCJTwcIHpatZVTY=;
  b=SbChZfNpq/y4Om46WiiSO9DIRhnLkCTcfBamNJ28vPxa12Pc4rw07ox2
   YVHEzEfdQTnnHsPomIY9ENTkO8AUp8vZTKKSPWZvc8sFdIab27moKPm+G
   rdMsBTCe7ltjkPObSj5aPQQBPYs7AiVbbqEtTm62MR5BC/5FPm7BmpOdA
   sOA6O/zmYDjSc02OYgeOZOtojIsXCsVWgOv3/7VFuODaJqdsrffMoGmaL
   n5qeeBti7SVyKwAmaVUNeM6vKcafSnOAYb2ur2Hk+5ac9qlTGZgD4+LCL
   AX1cDZz62TSmMfW6cmsDSAIVEWy65ckBfj4u7fOSsts0GeKUY/btWBxL6
   Q==;
X-CSE-ConnectionGUID: EuZ/kyLeTRqB4wnp7tlk2A==
X-CSE-MsgGUID: Uun2MEVjQtuApcYap+ZFIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21374804"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="21374804"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 18:46:02 -0700
X-CSE-ConnectionGUID: epnPooDNRvOWjiWwJvCzyQ==
X-CSE-MsgGUID: /gVSpGo3TK268zw8zIF0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26277208"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 18:46:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0tc6-0005i7-2v;
	Sun, 28 Apr 2024 01:45:58 +0000
Date: Sun, 28 Apr 2024 09:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3505/11728]
 drivers/pinctrl/devicetree.c:201:6: warning: variable 'index' set but not
 used
Message-ID: <202404280905.RCuGmtS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 26bccb9f27ca09e8c00172691a23151779342d8a [3505/11728] MLK-11749: pinctrl: support pinctrl setting assertion via gpios
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240428/202404280905.RCuGmtS8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280905.RCuGmtS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280905.RCuGmtS8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/devicetree.c:201:6: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     201 |         int index = 0;
         |             ^
   1 warning generated.


vim +/index +201 drivers/pinctrl/devicetree.c

   196	
   197	static int dt_gpio_assert_pinctrl(struct pinctrl *p)
   198	{
   199		struct device_node *np = p->dev->of_node;
   200		struct gpio_desc *gpio;
 > 201		int index = 0;
   202		int ret;
   203	
   204		if (!of_find_property(np, "pinctrl-assert-gpios", NULL))
   205			return 0; /* Missing the property, so nothing to be done */
   206	
   207		for (;; index++) {
   208			gpio = devm_gpiod_get_optional(p->dev, "pinctrl-assert",
   209						       GPIOD_OUT_HIGH);
   210			ret = PTR_ERR(gpio);
   211			if (ret < 0) {
   212				if (PTR_ERR(gpio) == -EPROBE_DEFER)
   213					return -EPROBE_DEFER;
   214	 			break; /* End of the phandle list */
   215	 		}
   216		}
   217	
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
