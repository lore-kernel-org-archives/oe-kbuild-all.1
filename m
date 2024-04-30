Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B81A38EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 21:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714512900; cv=none; b=XX8qB9B67xk4USSqCrvzQGRuHuppcX1QBxC78hGQyFZXZzefSDMnmGc+27TIzB/VFEtfgNQIm+bl0G24GaIP4ooILSVC5Ymnu5DVrCmJiIIgkkQ4JpKiHwjjYJ08npiuMSAFmrrIdi3Pd82eY5k65SOVP6dudyml1K4CIRhvkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714512900; c=relaxed/simple;
	bh=QCbmr+lea7JohD5arKYuAsoMfSOZKUF4GYy4v8bxg+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oB3k1JR3Zqyk5iB/Z4ketpKnr8Fsf6+qvjCxQ7nXHX3abYHssNxbtwR+xE7i7Fz3r6W1EkIXkFTHWlOW+ErweNCunBdT5t/OPUKrveVNE64WOcJSMW7Qnu55NoyyNpfOobYJvIHOQGTJZavpQJj7kRnBELgSKI7PziVA3BuHLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMKYQRde; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMKYQRde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714512899; x=1746048899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QCbmr+lea7JohD5arKYuAsoMfSOZKUF4GYy4v8bxg+o=;
  b=KMKYQRdeL/Zdxa5jQ5nTgED0Xad8htVgCsTWoDzr6jLDp05ZlCshufy2
   kdoDsd68sGfd+BGKtqa/4aywhDBkXFSPhlIeU7Pv8NTQH29iZUoWxAFgn
   5+C1/aXFveSGKNB/TozaRIXQtjwaLjHGID30/Toh7OfwoxvB7dmg2U47J
   o+2n+g/2KEkBTkofeH3xRX19dUQAfktaTyeodVhLAaTes9buqblfE9ym2
   eapwwlALKfDXsBKaDF039/M2HmiyBa5e+PSHv+GFsCK5Zcb2iwZ4Z8/MK
   dS7f7uHjsm87+bbH9y12343zJdhCSnNLifFYJGLhPUbJ7GZQbmjQO9qjY
   w==;
X-CSE-ConnectionGUID: ootO8i71Svyg0swVXxxeFg==
X-CSE-MsgGUID: m9uTxAqkTkOm6uHEIHxLPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="21661720"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="21661720"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 14:34:58 -0700
X-CSE-ConnectionGUID: dP/hpbQ6SyuB/XB5hQcc1g==
X-CSE-MsgGUID: TSuEnKLJT962Uzj9hsXgvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="64081351"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2024 14:34:57 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1v7m-0008ch-1U;
	Tue, 30 Apr 2024 21:34:54 +0000
Date: Wed, 1 May 2024 05:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 7426/11730]
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c:244:17: warning: suggest braces
 around empty body in an 'else' statement
Message-ID: <202405010551.53snU35k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   776652a165f5bbf30c68a5f6213d75b02e8df11c
commit: 5a913c7fc95dc38aafbde9277ca8255219902275 [7426/11730] LF-10993-5 phy: freescale: imx8mq-usb: add tca function driver for imx95
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405010551.53snU35k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010551.53snU35k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010551.53snU35k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/freescale/phy-fsl-imx8mq-usb.c: In function 'tca_blk_orientation_set':
>> drivers/phy/freescale/phy-fsl-imx8mq-usb.c:244:17: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
     244 |                 ;
         |                 ^


vim +/else +244 drivers/phy/freescale/phy-fsl-imx8mq-usb.c

   224	
   225	static void tca_blk_orientation_set(struct tca_blk *tca,
   226					enum typec_orientation orientation)
   227	{
   228		u32 val;
   229	
   230		mutex_lock(&tca->mutex);
   231	
   232		/* Disable TCA module */
   233		val = readl(tca->base + TCA_SYSMODE_CFG);
   234		val |= TCA_SYSMODE_TCPC_DISABLE;
   235		writel(val, tca->base + TCA_SYSMODE_CFG);
   236	
   237		tca->orientation = orientation;
   238	
   239		if (orientation == TYPEC_ORIENTATION_REVERSE)
   240			val |= TCA_SYSMODE_TCPC_FLIP;
   241		else if (orientation == TYPEC_ORIENTATION_NORMAL)
   242			val &= ~TCA_SYSMODE_TCPC_FLIP;
   243		else	/* TYPEC_ORIENTATION_NONE */
 > 244			;
   245	
   246		/* Enable TCA module */
   247		writel(val, tca->base + TCA_SYSMODE_CFG);
   248		val &= ~TCA_SYSMODE_TCPC_DISABLE;
   249		writel(val, tca->base + TCA_SYSMODE_CFG);
   250	
   251		mutex_unlock(&tca->mutex);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
