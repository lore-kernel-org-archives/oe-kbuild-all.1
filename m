Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31FD12CD96
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316307; cv=none; b=gxl+Fu0VivBhWGfL+4ycxy+79VC+XeIMitdrn89+eFIhrcynb+ra/KXyeompERF2vqzZ9oVveQfUUN3YlA/dT4E8RE8KSXSnC7/HJZlCXJi2NzBLZbMrrDYn5aUZEE3wlj/Nesx6+u4zOqPqTcutg6Gr2O9v9vCxRU5YEKBcSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316307; c=relaxed/simple;
	bh=FKP2BF8TywKylrFKdcpGQAXRm7g1wPSiVbOKd6xkEwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nxeiOPnnFg0SC8m55Zg3stkiTN7RyJdB1SWSRvcWx7WJEhefZSNsegcZYSH6EiztLimugrCUfBthLy32w4xr+bv7W6LNOrX3cSgOo46u9/NkiTAf4tvuwRnsoRDWax/ryqtHYZkBtWttcqbIhCL4VUTyVbPZsPDj4+hvOm4aEm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnAbnEUn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnAbnEUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757316305; x=1788852305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKP2BF8TywKylrFKdcpGQAXRm7g1wPSiVbOKd6xkEwI=;
  b=RnAbnEUn40uDnZW5rzCndEM27lTpK1N0VkCrLbnjUWSi32mv1DiS+4E8
   y2QtxniD3iQRKTu9Juf2yfquVNkRtNYl1F2saMe1UauaDuR6GgQdOJASa
   rSMt4QlZFkLe2UCHYEl0v+gnC9RGs3HE3vIa/p3uRyVAipPHfaRI+lhsB
   KOU/qP4seealM8ImFnogc485fep2zUqK3pKLhyHZlec/QazbpjM6LMVLK
   mxE/K/yNEMozfOZpK0L6gMffgLUGv49YldCfPOAkh2CvbOHpFuyCpkvLU
   dexbNazcraXNTKS+JExAmzGXsyDEeltSdGOt3y8HT2v1zMPBQJTYucuon
   Q==;
X-CSE-ConnectionGUID: MS+d21n4T3GM5ceUTEtAEQ==
X-CSE-MsgGUID: m8ipxBz9S1uRszoaXAi8ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="77021274"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="77021274"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 00:25:04 -0700
X-CSE-ConnectionGUID: LCG89e/4RryJ+Z69r3fJfA==
X-CSE-MsgGUID: WvJlgzCNT/e0Ox/JLUm3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="173082414"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2025 00:25:03 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvWFJ-0003cv-0R;
	Mon, 08 Sep 2025 07:25:01 +0000
Date: Mon, 8 Sep 2025 15:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2866/2866]
 drivers/i2c/busses/i2c-zhaoxin-smbus.c:78:23: error: implicit declaration of
 function 'inb'
Message-ID: <202509081522.jhCd5FtY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   53c5dc90847a172693399fff690813a8c90f5044
commit: 08d91e70564c8af05a673fef3dbae0b2278529fd [2866/2866] i2c: smbus: Add support for Zhaoxin SMBUS controller
config: x86_64-buildonly-randconfig-003-20250909 (https://download.01.org/0day-ci/archive/20250908/202509081522.jhCd5FtY-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081522.jhCd5FtY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081522.jhCd5FtY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-zhaoxin-smbus.c: In function 'zxsmb_irq_handle':
>> drivers/i2c/busses/i2c-zhaoxin-smbus.c:78:23: error: implicit declaration of function 'inb' [-Werror=implicit-function-declaration]
      78 |         smb->status = inb(smb->base + ZXSMB_STS);
         |                       ^~~
>> drivers/i2c/busses/i2c-zhaoxin-smbus.c:83:9: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
      83 |         outb(smb->status, smb->base + ZXSMB_STS);
         |         ^~~~
   drivers/i2c/busses/i2c-zhaoxin-smbus.c: At top level:
   drivers/i2c/busses/i2c-zhaoxin-smbus.c:367:36: warning: 'zxsmb_acpi_match' defined but not used [-Wunused-const-variable=]
     367 | static const struct acpi_device_id zxsmb_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/inb +78 drivers/i2c/busses/i2c-zhaoxin-smbus.c

    73	
    74	static irqreturn_t zxsmb_irq_handle(int irq, void *dev_id)
    75	{
    76		struct zxsmb *smb = (struct zxsmb *)dev_id;
    77	
  > 78		smb->status = inb(smb->base + ZXSMB_STS);
    79		if ((smb->status & ZXSMB_STS_MASK) == 0)
    80			return IRQ_NONE;
    81	
    82		/* clear status */
  > 83		outb(smb->status, smb->base + ZXSMB_STS);
    84		complete(&smb->complete);
    85	
    86		return IRQ_HANDLED;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
