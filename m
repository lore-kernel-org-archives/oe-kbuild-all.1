Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727733C182
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 07:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791127; cv=none; b=aDGDmrceU5W4r9ZVK/8zVrpHHZGKf42o97FWRKVIygbVljifMAuL5mluYY+XRq0aFT00PjwNeb/XJfZ/avmglEQeS1ip3d/lxhkoM5WDhH5qJXp9WLMPa1EP+D5FXaiw2WiAYWwyhv9r0NSM0kFeuDAgqphOpN75DMduInfjNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791127; c=relaxed/simple;
	bh=BlpF5lWN0xU57e6++OqIkBSlDR/g6CgQ6eNxFNeruFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qcVzuMuYMsF5ZsbewpKAYyvxF5tfZS0AqiBW3f6m1KxhonzlJmMqZPE3NW5GVWUwE5H/nQq/lWwsWxfI4wx7o0rkGCvs/MHvVr1DbhzuJE9soaV07Uc6XfyjOzSHGSTUoZkn89xDFvEgr9xiAt7PoA3LAe/2msjqbT6NQC3Rocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8+7rltk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8+7rltk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784791122; x=1816327122;
  h=date:from:to:cc:subject:message-id;
  bh=BlpF5lWN0xU57e6++OqIkBSlDR/g6CgQ6eNxFNeruFA=;
  b=m8+7rltkzqwt40+SHL90Exesd56WFJD8p3UJrLmnP118gkl/gMDSf+RK
   c8AtJih+lgQlfpxsP+135Uox5c5XVhOdv9TbqohkvkNlHiHkwojtuLLvd
   rzlcor7cpWZZJ22ynv/UYr+1KcdS4f7I/I+/lN7ugxVQR0pg8dqLQYjBs
   Or7Yp3EaIfFSrev+kh/tsJMj9mZOtL7uOyilxfOuZX8aAwjXTUFVtAwuZ
   CWgcO0kKV1bn1mRWEOPX/+oBPnEOCeo3Q+mIcycwE8HEFOrhskwpd/mKI
   +anJ51DhhXSHnueMtrSaT+wI7sRcxsjdCGRcSQHl5b9e6y23cvO6FEl47
   w==;
X-CSE-ConnectionGUID: QwpeV6TrQXecFmKiQ0X4Hg==
X-CSE-MsgGUID: jgTy+urSR+edOqMCMqriqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102985814"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="102985814"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:18:38 -0700
X-CSE-ConnectionGUID: UTHL+TsaTeux+Q3PhI5H4g==
X-CSE-MsgGUID: 7pOmyqrFSKyHBJ+SFdECjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="255678907"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jul 2026 00:18:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmnhD-00000000ZQu-0Drg;
	Thu, 23 Jul 2026 07:18:25 +0000
Date: Thu, 23 Jul 2026 15:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Niklas Cassel <cassel@kernel.org>
Subject: drivers/ata/pata_ep93xx.c:494:33: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202607231521.gvhnJpOG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Rosen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 590da526959499e58671f65655825d8a1973ff27 ata: pata_ep93xx: add COMPILE_TEST support
date:   7 weeks ago
config: microblaze-randconfig-r121-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231521.gvhnJpOG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231521.gvhnJpOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 590da5269594 ("ata: pata_ep93xx: add COMPILE_TEST support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231521.gvhnJpOG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ata/pata_ep93xx.c:494:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/ata/pata_ep93xx.c:494:33: sparse:     expected unsigned short [usertype]
   drivers/ata/pata_ep93xx.c:494:33: sparse:     got restricted __le16 [usertype]
>> drivers/ata/pata_ep93xx.c:498:58: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_ep93xx.c:508:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char @@     got restricted __le16 [usertype] @@
   drivers/ata/pata_ep93xx.c:508:30: sparse:     expected unsigned char
   drivers/ata/pata_ep93xx.c:508:30: sparse:     got restricted __le16 [usertype]
   drivers/ata/pata_ep93xx.c:514:58: sparse: sparse: cast to restricted __le16

vim +494 drivers/ata/pata_ep93xx.c

2fff27512600f9 Rafal Prylowski           2012-04-12  480  
2fff27512600f9 Rafal Prylowski           2012-04-12  481  /* Note: original code is ata_sff_data_xfer */
989e0aac1a801e Bartlomiej Zolnierkiewicz 2016-12-30  482  static unsigned int ep93xx_pata_data_xfer(struct ata_queued_cmd *qc,
2fff27512600f9 Rafal Prylowski           2012-04-12  483  					  unsigned char *buf,
2fff27512600f9 Rafal Prylowski           2012-04-12  484  					  unsigned int buflen, int rw)
2fff27512600f9 Rafal Prylowski           2012-04-12  485  {
989e0aac1a801e Bartlomiej Zolnierkiewicz 2016-12-30  486  	struct ata_port *ap = qc->dev->link->ap;
2fff27512600f9 Rafal Prylowski           2012-04-12  487  	struct ep93xx_pata_data *drv_data = ap->host->private_data;
2fff27512600f9 Rafal Prylowski           2012-04-12  488  	u16 *data = (u16 *)buf;
2fff27512600f9 Rafal Prylowski           2012-04-12  489  	unsigned int words = buflen >> 1;
2fff27512600f9 Rafal Prylowski           2012-04-12  490  
2fff27512600f9 Rafal Prylowski           2012-04-12  491  	/* Transfer multiple of 2 bytes */
2fff27512600f9 Rafal Prylowski           2012-04-12  492  	while (words--)
2fff27512600f9 Rafal Prylowski           2012-04-12  493  		if (rw == READ)
2fff27512600f9 Rafal Prylowski           2012-04-12 @494  			*data++ = cpu_to_le16(
2fff27512600f9 Rafal Prylowski           2012-04-12  495  				ep93xx_pata_read_data(
2fff27512600f9 Rafal Prylowski           2012-04-12  496  					drv_data, IDECTRL_ADDR_DATA));
2fff27512600f9 Rafal Prylowski           2012-04-12  497  		else
2fff27512600f9 Rafal Prylowski           2012-04-12 @498  			ep93xx_pata_write_data(drv_data, le16_to_cpu(*data++),
2fff27512600f9 Rafal Prylowski           2012-04-12  499  				IDECTRL_ADDR_DATA);
2fff27512600f9 Rafal Prylowski           2012-04-12  500  
2fff27512600f9 Rafal Prylowski           2012-04-12  501  	/* Transfer trailing 1 byte, if any. */
2fff27512600f9 Rafal Prylowski           2012-04-12  502  	if (unlikely(buflen & 0x01)) {
2fff27512600f9 Rafal Prylowski           2012-04-12  503  		unsigned char pad[2] = { };
2fff27512600f9 Rafal Prylowski           2012-04-12  504  
2fff27512600f9 Rafal Prylowski           2012-04-12  505  		buf += buflen - 1;
2fff27512600f9 Rafal Prylowski           2012-04-12  506  
2fff27512600f9 Rafal Prylowski           2012-04-12  507  		if (rw == READ) {
2fff27512600f9 Rafal Prylowski           2012-04-12 @508  			*pad = cpu_to_le16(
2fff27512600f9 Rafal Prylowski           2012-04-12  509  				ep93xx_pata_read_data(
2fff27512600f9 Rafal Prylowski           2012-04-12  510  					drv_data, IDECTRL_ADDR_DATA));
2fff27512600f9 Rafal Prylowski           2012-04-12  511  			*buf = pad[0];
2fff27512600f9 Rafal Prylowski           2012-04-12  512  		} else {
2fff27512600f9 Rafal Prylowski           2012-04-12  513  			pad[0] = *buf;
2fff27512600f9 Rafal Prylowski           2012-04-12  514  			ep93xx_pata_write_data(drv_data, le16_to_cpu(*pad),
2fff27512600f9 Rafal Prylowski           2012-04-12  515  					  IDECTRL_ADDR_DATA);
2fff27512600f9 Rafal Prylowski           2012-04-12  516  		}
2fff27512600f9 Rafal Prylowski           2012-04-12  517  		words++;
2fff27512600f9 Rafal Prylowski           2012-04-12  518  	}
2fff27512600f9 Rafal Prylowski           2012-04-12  519  
2fff27512600f9 Rafal Prylowski           2012-04-12  520  	return words << 1;
2fff27512600f9 Rafal Prylowski           2012-04-12  521  }
2fff27512600f9 Rafal Prylowski           2012-04-12  522  

:::::: The code at line 494 was first introduced by commit
:::::: 2fff27512600f9ad91335577e485a8552edb0abf PATA host controller driver for ep93xx

:::::: TO: Rafal Prylowski <prylowski@metasoft.pl>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
