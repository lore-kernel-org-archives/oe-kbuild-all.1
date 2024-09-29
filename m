Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC224B26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727632605; cv=none; b=Ewktq1cB14Cgr8p/GHFh8dl+86Hg0HwmgW7A9aUQ/XoESgYGjSrJ9RHg1+NfE8TrBxdW50ezMG1fYwA76oXWf8mE8NvDIjI1oMdFtPZkrqeIxnJHaWYohTKbG31AyXgpouMgdrxyZOfAeevbn2BhPMlCi6L0pxQFMNnbzIJXC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727632605; c=relaxed/simple;
	bh=L+hNGKLqJ2Mh3bhI1H3SPgiGto0lrGDn3psAZnNPpqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpUAIsc703N94gI3zZcBTM1am4aL6YEkW6fnTOnhp1vApeJcRURkqf/le1OmHR3fmH2Hdq4UJ/BGqR6SYkwtRtErcYoSV3ezDcgdt9NqELHrLyHbbfgPduRIzveXG8upOLfvaHt9KQZEIwUIPkW/E7n3ibUz+I8/tHCd1B/o4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0PQsZcz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0PQsZcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727632603; x=1759168603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L+hNGKLqJ2Mh3bhI1H3SPgiGto0lrGDn3psAZnNPpqM=;
  b=W0PQsZczmnxePyOWr5QFv9raeeAQj4t2noNbLjXmh/qpf1iKT65T6as8
   z4p+vqdSr5M6XnxDkNcU6nsiQ56UJMBtMv+8Jh4NGb6PZkKTsE6B9bosq
   ZoZ2IjYNI9QZs7eZZJHXsLpUJ/p2G49SWC0Y0PErvvan1DhcgWp0RH+7I
   gtq3BghSMo49STIrOZM8BLcTqq81NJVXiNt+w1tEOoKYXUBJ8BU/6U3aM
   jziOwgc7gzMR5BbZBtU2m2zLuf0C4D8lIrNUq8wRPxY7CUJZ8tnTrKvTd
   SVsgr7F0pdpR2OS8UCgzT53KS+ZuKnqZfY7GzrIJ9Hy7uL2dmqne8FuoS
   A==;
X-CSE-ConnectionGUID: FGImOE+3SEC2bQNCyyzfzQ==
X-CSE-MsgGUID: oLRObTCWRqG1bqBpy1fxVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37855393"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="37855393"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:56:43 -0700
X-CSE-ConnectionGUID: CND4F+3/S4C7zt4EDCJOAw==
X-CSE-MsgGUID: 14QpCCXhSpSjvNqXyixIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73351404"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Sep 2024 10:56:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suy9v-000OXH-1i;
	Sun, 29 Sep 2024 17:56:39 +0000
Date: Mon, 30 Sep 2024 01:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 7426/16788]
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c:244:17: warning: suggest braces
 around empty body in an 'else' statement
Message-ID: <202409300123.Z7PYzjGQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 5a913c7fc95dc38aafbde9277ca8255219902275 [7426/16788] LF-10993-5 phy: freescale: imx8mq-usb: add tca function driver for imx95
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300123.Z7PYzjGQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300123.Z7PYzjGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300123.Z7PYzjGQ-lkp@intel.com/

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
