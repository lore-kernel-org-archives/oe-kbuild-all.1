Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614070803
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733064414; cv=none; b=S9Tc9BfUstr+qr2kwLtuqZa7tDl3Lt9DlPL3c5AUWR1dYok9xL9B+3xwXmjVblEiPbZB8nim/UBCBPF8Ut4AziAw5B7uPNi46m+eXJJpj28EdOSjk6lf+WfQV+KGWkAlph/pCPlh/Uu4Ce6yhoCUBoCqScQlnOgzNNtJTj0oR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733064414; c=relaxed/simple;
	bh=j2p60F5HhyPz2Fa/n4XEOqrfZs0gTYeVu3IHRlpOmCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MPIqeCvi2Ztm+ZIqfOQ25kVQ0zPavN0Bvtx8j8rGvxncZG18By9Mx7m5O3+Iu+RbCYQ1oIGCawVnFVN6aizv+EZ17lPv2avgKNp3jYnGmXpT/5xkVVEn3mvKucC5DrNCs/6u0iFyAEQ7NBieAQ7BfA46wHCKejwkKKkO8AUwZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmoLgxtN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmoLgxtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733064412; x=1764600412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2p60F5HhyPz2Fa/n4XEOqrfZs0gTYeVu3IHRlpOmCs=;
  b=XmoLgxtNmvsu0ahp2q0WujPBci+1nWCfufhpTWAAfZWj2A3lTC+auwwp
   cq7cU5KvHJQ5WbhUJGPMiuIsFFOIjLFxfxhbZpOEUn8slgbvhxFJ0fNK7
   5tMDhpAQz2plXk0zvvE5RLmnf/SjJiQ0LwNn0ttXGEd0qfhRLdpcBP+25
   3iIe+76jykLTxr21HjUF/w0fsh8rQiHyPDWkYjFbp+P+L2jCzia/uS4zU
   VCvY8UOdBFjS6GIlWV/Iscgs07/tyUtK7wuSwWNVaX35zp49C1UXS9vay
   RnvSH6dEsdZKXCZTD+dozX+Qmoc8YX2Ae+vHD068PWbOvdfz+PIKRT/zH
   g==;
X-CSE-ConnectionGUID: MtlVIUIHTgqX6SSJDlj0gg==
X-CSE-MsgGUID: +g/Ael8sTHCDg/BRsn642w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33365198"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33365198"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 06:46:52 -0800
X-CSE-ConnectionGUID: Hn8+fZVjRGuKE5Ylb6xMLw==
X-CSE-MsgGUID: QPfC46RTSc6lQZduKQPbsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="98000217"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2024 06:46:50 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHlDk-0001bJ-0n;
	Sun, 01 Dec 2024 14:46:48 +0000
Date: Sun, 1 Dec 2024 22:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-attr 69/71]
 drivers/ata/pata_parport/pata_parport.c:694:8: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202412012206.NTFRfQVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-attr
head:   894533cd9290280e8b523fcaa2232662ceccd57b
commit: a0965582e0a49944224cef0b8ea6dd3f961630fd [69/71] _Generic
config: i386-randconfig-063-20241201 (https://download.01.org/0day-ci/archive/20241201/202412012206.NTFRfQVE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012206.NTFRfQVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012206.NTFRfQVE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ata/pata_parport/pata_parport.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
>> drivers/ata/pata_parport/pata_parport.c:694:8: sparse: sparse: Initializer entry defined twice
   drivers/ata/pata_parport/pata_parport.c:694:8: sparse:   also defined here
   drivers/ata/pata_parport/pata_parport.c:725:8: sparse: sparse: Initializer entry defined twice
   drivers/ata/pata_parport/pata_parport.c:725:8: sparse:   also defined here

vim +694 drivers/ata/pata_parport/pata_parport.c

246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  633  
75cff725d95666 drivers/ata/pata_parport/pata_parport.c Greg Kroah-Hartman 2023-03-13  634  static ssize_t new_device_store(const struct bus_type *bus, const char *buf, size_t count)
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  635  {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  636  	char port[12] = "auto";
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  637  	char protocol[8] = "auto";
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  638  	int mode = -1, unit = -1, delay = -1;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  639  	struct pi_protocol *pr, *pr_wanted;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  640  	struct device_driver *drv;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  641  	struct parport *parport;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  642  	int port_num, port_wanted, pr_num;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  643  	bool ok = false;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  644  
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  645  	if (sscanf(buf, "%11s %7s %d %d %d",
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  646  			port, protocol, &mode, &unit, &delay) < 1)
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  647  		return -EINVAL;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  648  
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  649  	if (sscanf(port, "parport%u", &port_wanted) < 1) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  650  		if (strcmp(port, "auto")) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  651  			pr_err("invalid port name %s\n", port);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  652  			return -EINVAL;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  653  		}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  654  		port_wanted = -1;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  655  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  656  
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  657  	drv = driver_find(protocol, &pata_parport_bus_type);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  658  	if (!drv) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  659  		if (strcmp(protocol, "auto")) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  660  			pr_err("protocol %s not found\n", protocol);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  661  			return -EINVAL;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  662  		}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  663  		pr_wanted = NULL;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  664  	} else {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  665  		pr_wanted = container_of(drv, struct pi_protocol, driver);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  666  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  667  
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  668  	mutex_lock(&pi_mutex);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  669  	/* walk all parports */
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  670  	idr_for_each_entry(&parport_list, parport, port_num) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  671  		if (port_num == port_wanted || port_wanted == -1) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  672  			parport = parport_find_number(port_num);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  673  			if (!parport) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  674  				pr_err("no such port %s\n", port);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  675  				mutex_unlock(&pi_mutex);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  676  				return -ENODEV;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  677  			}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  678  			/* walk all protocols */
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  679  			idr_for_each_entry(&protocols, pr, pr_num) {
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  680  				if (pr == pr_wanted || !pr_wanted)
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  681  					if (pi_init_one(parport, pr, mode, unit,
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  682  							delay))
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  683  						ok = true;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  684  			}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  685  			parport_put_port(parport);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  686  		}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  687  	}
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  688  	mutex_unlock(&pi_mutex);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  689  	if (!ok)
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  690  		return -ENODEV;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  691  
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  692  	return count;
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  693  }
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23 @694  static BUS_ATTR_WO(new_device);
246a1c4c6b7ffb drivers/ata/pata_parport.c              Ondrej Zary        2023-01-23  695  

:::::: The code at line 694 was first introduced by commit
:::::: 246a1c4c6b7ffba88a2553d2b88f7b6280f253a2 ata: pata_parport: add driver (PARIDE replacement)

:::::: TO: Ondrej Zary <linux@zary.sk>
:::::: CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
