Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C6F2367D5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754575240; cv=none; b=j/wB78QiPj8Q7rxtg4NDoznR9Nd8Isa1nSX1KCX35TdvJo2WRduKAYl8ji50aqyGF2Skt1QHRt/8cxslWR9c8IvtPueRmvbivzoLoQTbGhqCQGjBxqiPMPtcIvCvDGIHR/kc1i71NGL8fAUbbNwABdOeMg49ntXzwmvImJxQHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754575240; c=relaxed/simple;
	bh=//7JnQ4tzJatL4fvtNP9ODNnR2iVUu8L7DLnTUQiQco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9NJZZA32x+6CcOyEExhTNvHe3KcbiETiVB+j1Wh1jnKKxzhAs3fTfh9VAnIGzAX3TEjMnQ5TO495slm4oRze5n5wV5eXCwtq/6GIsl19VvNnvsLgoj86gZQ/ZjeXN3bK/NzqHNRcA295mE0OjwmbapBXfHb9nmZvm4G4vjigJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdIyqLQT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdIyqLQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754575239; x=1786111239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=//7JnQ4tzJatL4fvtNP9ODNnR2iVUu8L7DLnTUQiQco=;
  b=WdIyqLQT4Wkgqs3CLTyna3nhRe0BopNcNlthlNgg87NXoO3T1+KXSEGk
   Zbb+Dknn0iTH26GjjOsS2y5JeDf1Zo7o3KQD9MzMHZRS0VOf0VjVVhc92
   Zz1Ki0tG5Xm9GDrRGdpQ0QKm1NVqHyGB1eN7jHGGWVgRFemp+G/Gfd/zz
   /sO/rU1g6jjaBNEUWYGHaPmBu1g1fh8hTDvpFhWEplhV726ucJelRc0aj
   Y0x+peubxmzXe4e2LWOyy3Of/W4xbWvIsd9ii5whHXIMV+mBb8pojUGfK
   mif7I/oIEoWIEsIukOVzysUb8e9g4Wgv7pl66jtCYVZ/wE+aZGw2gwxHI
   A==;
X-CSE-ConnectionGUID: KBLb+kbPTu2LXpogbUwnVQ==
X-CSE-MsgGUID: OdMCvEqBTLKqpblT29knAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68363878"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68363878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:00:39 -0700
X-CSE-ConnectionGUID: qgxSiOsmS3eA95rt6XoIiQ==
X-CSE-MsgGUID: l/Wro+TNSAyyFxmvPcWuRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202234936"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2025 07:00:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk1AZ-0002rW-19;
	Thu, 07 Aug 2025 14:00:35 +0000
Date: Thu, 7 Aug 2025 22:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:vsrv 4/7] drivers/net/ethernet/vlsi/vlsi-mac.c:202:9: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202508072138.6KPhLRF4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux vsrv
head:   58e54ef4640355003af8e733da39cafa53ad38a9
commit: 17e17550692a1c7e7c8b2c8ddc155ccf02676e65 [4/7] net: vlsi: Add VLSI ethernet driver
config: sparc-randconfig-r121-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072138.6KPhLRF4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508072138.6KPhLRF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072138.6KPhLRF4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/vlsi/vlsi-mac.c:202:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/vlsi/vlsi-mac.c:202:9: sparse:     expected void const *
   drivers/net/ethernet/vlsi/vlsi-mac.c:202:9: sparse:     got void [noderef] __iomem *
>> drivers/net/ethernet/vlsi/vlsi-mac.c:214:38: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/vlsi/vlsi-mac.c:554:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int volatile [usertype] *rxbase @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/vlsi/vlsi-mac.c:554:50: sparse:     expected unsigned int volatile [usertype] *rxbase
   drivers/net/ethernet/vlsi/vlsi-mac.c:554:50: sparse:     got void [noderef] __iomem *
>> drivers/net/ethernet/vlsi/vlsi-mac.c:805:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int volatile [usertype] *txmem @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/vlsi/vlsi-mac.c:805:49: sparse:     expected unsigned int volatile [usertype] *txmem
   drivers/net/ethernet/vlsi/vlsi-mac.c:805:49: sparse:     got void [noderef] __iomem *

vim +202 drivers/net/ethernet/vlsi/vlsi-mac.c

   192	
   193		struct device *dev = kobj_to_dev(kobj);
   194		struct vsrves01_private *db = dev_get_drvdata(dev);
   195	
   196		if (offset > 512)
   197			return -1;
   198	
   199		if (offset + size > 512)
   200			size = 512-offset;
   201	
 > 202		memcpy(buf, db->membase + offset, size);
   203	
   204		return size;
   205	}
   206	
   207	static ssize_t vsrves01_sysfs_set_regmem(struct file *file, struct kobject *kobj,
   208						 const struct bin_attribute *attr,
   209						 char *buf, loff_t offset,
   210						 size_t size)
   211	{
   212		struct device *dev = kobj_to_dev(kobj);
   213		struct vsrves01_private *db = dev_get_drvdata(dev);
 > 214		volatile uint32_t *ethmem = (void *)db->membase;
   215		int ret = 0;
   216	
   217		if (offset > 512)
   218			return -1;
   219	
   220		if (offset + size > 512)
   221			size = 512-offset;
   222	
   223		while (size > 0) {
   224			uint32_t value;
   225			uint32_t addr = (unsigned)offset >> 2;
   226			uint32_t oldvalue = ethmem[addr];
   227	
   228			memcpy(&value, buf, 4);
   229	
   230			//dprintk("RegMEM Write %d bytes, at 0x%x (0x%x) %x => %x\n", size, (unsigned)offset, addr, oldvalue, value);
   231			if (addr == 0 && ((oldvalue&~0x81) == (value&~0x81))) {
   232				ethmem[0] = value;
   233				ret += 4;
   234			} else if (addr >= 103 && addr < 120) {
   235				ethmem[addr] = value;
   236				ret += 4;
   237			} else {
   238				return ret;
   239			}
   240	
   241			buf += 4;
   242			offset +=4;
   243			size -=4;
   244		}
   245	
   246		return ret;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
