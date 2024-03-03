Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772545A0F0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709475473; cv=none; b=VE8q1UQkPiUIqC1sHRBdI3GOWYz/q6cz1speps3Zqq1j1FFKa/sQiaWNoBWCmx45IEs4er85g0/94LFz1CJxWkujJeJZ0wTNQgqKlgTDm0VFhdTtqlPSHqQjWT0J/3hS9/QnF65Lw43VqOKLsvhpkGoqKqZ1C3Spll9XsbFdhHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709475473; c=relaxed/simple;
	bh=kAcwQcWLoQI/JTk5HLMMnP/Uy5MWepxeGbO/YChabP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E09CeGH6mhJKbDpEhNnmKe7QNAEii4FMsVwy83GjtKk0FGewoJpy+Ghs18vK+9McKzVIFeA7EjtWDKPNa2WEpALZgZ6lJYci8KXZirysgellTO9fPouNhtq+RNUObzDg2xEZh3pK2OYsGebMiEv93O/iBtFyTACnHjOriOiNZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWcq3bW5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWcq3bW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709475471; x=1741011471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kAcwQcWLoQI/JTk5HLMMnP/Uy5MWepxeGbO/YChabP0=;
  b=dWcq3bW58q6/w1uQEffSvsbGoLvAXUwcY+ddv9ybEt+IOXNbEttQ9mhJ
   jGfCdhkZnLKgdZ0oML0F1W4d3UkiiYjwgCE7FX0nonGF0lDK15NGp5/0m
   3t2O3/0ve1gCZ+EBmJ8XchNJSnH06Iuu1vyuQOIVLAIbHuTjRzw/abm9+
   3cCCkik6xSwqwJcAQ+vtSb5tyBuTr0TGw9F5nlkd3SclA761nvIqRGW3L
   bU7B0giC3Boe3E/H2eJEXlt8Qd9cSz2EVQoeLck3fe2NAjtWyFIBCwasQ
   V/ssMbSwcF6E5Iuj+/rIFzDzHQ4TomG99Y44SktzjTkg4kdcaFYC1VDCg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="6920159"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="6920159"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 06:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13286642"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2024 06:17:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgmex-0001p6-22;
	Sun, 03 Mar 2024 14:17:47 +0000
Date: Sun, 3 Mar 2024 22:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_cleanup 11/11] drivers/nvmem/core.c:481:15:
 error: implicit declaration of function 'devm_device_add_groups'; did you
 mean 'devm_device_add_group'?
Message-ID: <202403032205.vsrv47wd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   d52687b617d2f0d9709ddfe812df75aa25fe202f
commit: d52687b617d2f0d9709ddfe812df75aa25fe202f [11/11] driver core: remove devm_device_add_groups()
config: arm64-randconfig-004-20240303 (https://download.01.org/0day-ci/archive/20240303/202403032205.vsrv47wd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032205.vsrv47wd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032205.vsrv47wd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_populate_sysfs_cells':
>> drivers/nvmem/core.c:481:15: error: implicit declaration of function 'devm_device_add_groups'; did you mean 'devm_device_add_group'? [-Werror=implicit-function-declaration]
     481 |         ret = devm_device_add_groups(&nvmem->dev, nvmem_cells_groups);
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               devm_device_add_group
   cc1: some warnings being treated as errors


vim +481 drivers/nvmem/core.c

84400305271937 Srinivas Kandagatla 2020-03-25  429  
0331c611949fff Miquel Raynal       2023-12-15  430  static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
0331c611949fff Miquel Raynal       2023-12-15  431  {
0331c611949fff Miquel Raynal       2023-12-15  432  	struct bin_attribute **cells_attrs, *attrs;
0331c611949fff Miquel Raynal       2023-12-15  433  	struct nvmem_cell_entry *entry;
0331c611949fff Miquel Raynal       2023-12-15  434  	unsigned int ncells = 0, i = 0;
0331c611949fff Miquel Raynal       2023-12-15  435  	int ret = 0;
0331c611949fff Miquel Raynal       2023-12-15  436  
0331c611949fff Miquel Raynal       2023-12-15  437  	mutex_lock(&nvmem_mutex);
0331c611949fff Miquel Raynal       2023-12-15  438  
0331c611949fff Miquel Raynal       2023-12-15  439  	if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated) {
0331c611949fff Miquel Raynal       2023-12-15  440  		nvmem_cells_group.bin_attrs = NULL;
0331c611949fff Miquel Raynal       2023-12-15  441  		goto unlock_mutex;
0331c611949fff Miquel Raynal       2023-12-15  442  	}
0331c611949fff Miquel Raynal       2023-12-15  443  
0331c611949fff Miquel Raynal       2023-12-15  444  	/* Allocate an array of attributes with a sentinel */
0331c611949fff Miquel Raynal       2023-12-15  445  	ncells = list_count_nodes(&nvmem->cells);
0331c611949fff Miquel Raynal       2023-12-15  446  	cells_attrs = devm_kcalloc(&nvmem->dev, ncells + 1,
0331c611949fff Miquel Raynal       2023-12-15  447  				   sizeof(struct bin_attribute *), GFP_KERNEL);
0331c611949fff Miquel Raynal       2023-12-15  448  	if (!cells_attrs) {
0331c611949fff Miquel Raynal       2023-12-15  449  		ret = -ENOMEM;
0331c611949fff Miquel Raynal       2023-12-15  450  		goto unlock_mutex;
0331c611949fff Miquel Raynal       2023-12-15  451  	}
0331c611949fff Miquel Raynal       2023-12-15  452  
0331c611949fff Miquel Raynal       2023-12-15  453  	attrs = devm_kcalloc(&nvmem->dev, ncells, sizeof(struct bin_attribute), GFP_KERNEL);
0331c611949fff Miquel Raynal       2023-12-15  454  	if (!attrs) {
0331c611949fff Miquel Raynal       2023-12-15  455  		ret = -ENOMEM;
0331c611949fff Miquel Raynal       2023-12-15  456  		goto unlock_mutex;
0331c611949fff Miquel Raynal       2023-12-15  457  	}
0331c611949fff Miquel Raynal       2023-12-15  458  
0331c611949fff Miquel Raynal       2023-12-15  459  	/* Initialize each attribute to take the name and size of the cell */
0331c611949fff Miquel Raynal       2023-12-15  460  	list_for_each_entry(entry, &nvmem->cells, node) {
0331c611949fff Miquel Raynal       2023-12-15  461  		sysfs_bin_attr_init(&attrs[i]);
0331c611949fff Miquel Raynal       2023-12-15  462  		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
e20f378d993b10 Arnd Bergmann       2024-02-09  463  						    "%s@%x,%x", entry->name,
e20f378d993b10 Arnd Bergmann       2024-02-09  464  						    entry->offset,
e20f378d993b10 Arnd Bergmann       2024-02-09  465  						    entry->bit_offset);
0331c611949fff Miquel Raynal       2023-12-15  466  		attrs[i].attr.mode = 0444;
0331c611949fff Miquel Raynal       2023-12-15  467  		attrs[i].size = entry->bytes;
0331c611949fff Miquel Raynal       2023-12-15  468  		attrs[i].read = &nvmem_cell_attr_read;
0331c611949fff Miquel Raynal       2023-12-15  469  		attrs[i].private = entry;
0331c611949fff Miquel Raynal       2023-12-15  470  		if (!attrs[i].attr.name) {
0331c611949fff Miquel Raynal       2023-12-15  471  			ret = -ENOMEM;
0331c611949fff Miquel Raynal       2023-12-15  472  			goto unlock_mutex;
0331c611949fff Miquel Raynal       2023-12-15  473  		}
0331c611949fff Miquel Raynal       2023-12-15  474  
0331c611949fff Miquel Raynal       2023-12-15  475  		cells_attrs[i] = &attrs[i];
0331c611949fff Miquel Raynal       2023-12-15  476  		i++;
0331c611949fff Miquel Raynal       2023-12-15  477  	}
0331c611949fff Miquel Raynal       2023-12-15  478  
0331c611949fff Miquel Raynal       2023-12-15  479  	nvmem_cells_group.bin_attrs = cells_attrs;
0331c611949fff Miquel Raynal       2023-12-15  480  
0331c611949fff Miquel Raynal       2023-12-15 @481  	ret = devm_device_add_groups(&nvmem->dev, nvmem_cells_groups);
0331c611949fff Miquel Raynal       2023-12-15  482  	if (ret)
0331c611949fff Miquel Raynal       2023-12-15  483  		goto unlock_mutex;
0331c611949fff Miquel Raynal       2023-12-15  484  
0331c611949fff Miquel Raynal       2023-12-15  485  	nvmem->sysfs_cells_populated = true;
0331c611949fff Miquel Raynal       2023-12-15  486  
0331c611949fff Miquel Raynal       2023-12-15  487  unlock_mutex:
0331c611949fff Miquel Raynal       2023-12-15  488  	mutex_unlock(&nvmem_mutex);
0331c611949fff Miquel Raynal       2023-12-15  489  
0331c611949fff Miquel Raynal       2023-12-15  490  	return ret;
0331c611949fff Miquel Raynal       2023-12-15  491  }
0331c611949fff Miquel Raynal       2023-12-15  492  

:::::: The code at line 481 was first introduced by commit
:::::: 0331c611949fffdf486652450901a4dc52bc5cca nvmem: core: Expose cells through sysfs

:::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
