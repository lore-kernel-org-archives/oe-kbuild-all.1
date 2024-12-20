Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC54198845
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 21:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734731362; cv=none; b=DlG7sYfNOIRd3IJ0VFAthY2ZrjWf2OBhvVBQqHYlU4VzPhMu+PKOKMfWbrDUA2nGcTYEBTvrR4PCzTdYcV7yu67FqQ8LhughaM3KE2PuHhBLUmBB6Ybvkts7AMZ2aSo68GwVdRzJNCxZiig6EvYPmvTmwmaBg/JMYaLZbmAWsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734731362; c=relaxed/simple;
	bh=6wOq/dyWacOqsKcIlcO/FRU0JFMvcVYvACvVkfSkOcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ks10/Lkx97w1+X7NfbM+tdgVrdR0J6HQLJdgK35UrhPA0rMrmCXPldEZCypptDiXRCW6lxL7VRjifJTDO7JWfoRse32ROKnt/ceINinFAkRkDaMbqVNtw0CLimwBxdYqjvrqWQcgIK4Wj3aBG07Uk52ypYeNSTiPjHGG0ebL1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYk5fVfK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYk5fVfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734731362; x=1766267362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wOq/dyWacOqsKcIlcO/FRU0JFMvcVYvACvVkfSkOcA=;
  b=CYk5fVfKaFX5ffce1FZmKIzyV79AhZTEPKc+DEz+6qrW9OdCifKtFYBq
   RWaBYlfxFaihAaZARcFWqG6v1qC57WI9oxeABJlNzo1Zw90BqNF/Vix3i
   AEKokGxlH3Ww2zktMWSwghGCMPeyEUnGTgd63Q6yTOcSIHROAvme9jfgG
   Z5h7JG0PWroRDGBkjsEVixY9x24EQbyUKIPUnUdRHcKPpk3pr4PxIzqm/
   KBSjvSaAeOwsKHcQ9THWl9WuPI8Ob1r/1yzvluAoV9OjY5poUUsZP9dgh
   00Zp3FCtFfdVDC2qkV+yi45LhafJgi7eYNWaH/cjtWb9JKKrWUT3ODZgT
   g==;
X-CSE-ConnectionGUID: cSiIiZtMRvW4qZvTcw+ZFQ==
X-CSE-MsgGUID: bfAZxHdyRa2Z5ik9yaRrlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38973173"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="38973173"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 13:49:21 -0800
X-CSE-ConnectionGUID: dBhg7IF5TzqgoJKhgI0PnQ==
X-CSE-MsgGUID: s1SkHpEMQP+jQ3zFbPwVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98678558"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2024 13:49:19 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOks1-0001gx-1H;
	Fri, 20 Dec 2024 21:49:17 +0000
Date: Sat, 21 Dec 2024 05:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/hwtracing/intel_th/core.c:838: warning: Excess function
 parameter 'irq' description in 'intel_th_alloc'
Message-ID: <202412210541.k0xInRXR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9b8ffafd20ad21357a789cc58ffaa162b3ad074
commit: 62a593022c32380d040303a5e3d6b67fd9c415bc intel_th: Communicate IRQ via resource
date:   6 years ago
config: arm-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241221/202412210541.k0xInRXR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210541.k0xInRXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210541.k0xInRXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/core.c:838: warning: Function parameter or struct member 'drvdata' not described in 'intel_th_alloc'
   drivers/hwtracing/intel_th/core.c:838: warning: Function parameter or struct member 'ndevres' not described in 'intel_th_alloc'
>> drivers/hwtracing/intel_th/core.c:838: warning: Excess function parameter 'irq' description in 'intel_th_alloc'


vim +838 drivers/hwtracing/intel_th/core.c

39f4034693b7c7 Alexander Shishkin 2015-09-22  828  
39f4034693b7c7 Alexander Shishkin 2015-09-22  829  /**
39f4034693b7c7 Alexander Shishkin 2015-09-22  830   * intel_th_alloc() - allocate a new Intel TH device and its subdevices
39f4034693b7c7 Alexander Shishkin 2015-09-22  831   * @dev:	parent device
db73a059de00ee Alexander Shishkin 2019-05-03  832   * @devres:	resources indexed by th_mmio_idx
39f4034693b7c7 Alexander Shishkin 2015-09-22  833   * @irq:	irq number
39f4034693b7c7 Alexander Shishkin 2015-09-22  834   */
39f4034693b7c7 Alexander Shishkin 2015-09-22  835  struct intel_th *
3321371b5d6484 Alexander Shishkin 2017-08-18  836  intel_th_alloc(struct device *dev, struct intel_th_drvdata *drvdata,
62a593022c3238 Alexander Shishkin 2019-05-03  837  	       struct resource *devres, unsigned int ndevres)
39f4034693b7c7 Alexander Shishkin 2015-09-22 @838  {
62a593022c3238 Alexander Shishkin 2019-05-03  839  	int err, r, nr_mmios = 0;
39f4034693b7c7 Alexander Shishkin 2015-09-22  840  	struct intel_th *th;
661b0df8489a35 Alexander Shishkin 2017-08-23  841  
39f4034693b7c7 Alexander Shishkin 2015-09-22  842  	th = kzalloc(sizeof(*th), GFP_KERNEL);
39f4034693b7c7 Alexander Shishkin 2015-09-22  843  	if (!th)
39f4034693b7c7 Alexander Shishkin 2015-09-22  844  		return ERR_PTR(-ENOMEM);
39f4034693b7c7 Alexander Shishkin 2015-09-22  845  
39f4034693b7c7 Alexander Shishkin 2015-09-22  846  	th->id = ida_simple_get(&intel_th_ida, 0, 0, GFP_KERNEL);
39f4034693b7c7 Alexander Shishkin 2015-09-22  847  	if (th->id < 0) {
39f4034693b7c7 Alexander Shishkin 2015-09-22  848  		err = th->id;
39f4034693b7c7 Alexander Shishkin 2015-09-22  849  		goto err_alloc;
39f4034693b7c7 Alexander Shishkin 2015-09-22  850  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  851  
39f4034693b7c7 Alexander Shishkin 2015-09-22  852  	th->major = __register_chrdev(0, 0, TH_POSSIBLE_OUTPUTS,
39f4034693b7c7 Alexander Shishkin 2015-09-22  853  				      "intel_th/output", &intel_th_output_fops);
39f4034693b7c7 Alexander Shishkin 2015-09-22  854  	if (th->major < 0) {
39f4034693b7c7 Alexander Shishkin 2015-09-22  855  		err = th->major;
39f4034693b7c7 Alexander Shishkin 2015-09-22  856  		goto err_ida;
39f4034693b7c7 Alexander Shishkin 2015-09-22  857  	}
62a593022c3238 Alexander Shishkin 2019-05-03  858  	th->irq = -1;
39f4034693b7c7 Alexander Shishkin 2015-09-22  859  	th->dev = dev;
3321371b5d6484 Alexander Shishkin 2017-08-18  860  	th->drvdata = drvdata;
39f4034693b7c7 Alexander Shishkin 2015-09-22  861  
db73a059de00ee Alexander Shishkin 2019-05-03  862  	for (r = 0; r < ndevres; r++)
62a593022c3238 Alexander Shishkin 2019-05-03  863  		switch (devres[r].flags & IORESOURCE_TYPE_BITS) {
62a593022c3238 Alexander Shishkin 2019-05-03  864  		case IORESOURCE_MEM:
62a593022c3238 Alexander Shishkin 2019-05-03  865  			th->resource[nr_mmios++] = devres[r];
62a593022c3238 Alexander Shishkin 2019-05-03  866  			break;
62a593022c3238 Alexander Shishkin 2019-05-03  867  		case IORESOURCE_IRQ:
62a593022c3238 Alexander Shishkin 2019-05-03  868  			if (th->irq == -1)
62a593022c3238 Alexander Shishkin 2019-05-03  869  				th->irq = devres[r].start;
62a593022c3238 Alexander Shishkin 2019-05-03  870  			break;
62a593022c3238 Alexander Shishkin 2019-05-03  871  		default:
62a593022c3238 Alexander Shishkin 2019-05-03  872  			dev_warn(dev, "Unknown resource type %lx\n",
62a593022c3238 Alexander Shishkin 2019-05-03  873  				 devres[r].flags);
62a593022c3238 Alexander Shishkin 2019-05-03  874  			break;
62a593022c3238 Alexander Shishkin 2019-05-03  875  		}
62a593022c3238 Alexander Shishkin 2019-05-03  876  
62a593022c3238 Alexander Shishkin 2019-05-03  877  	th->num_resources = nr_mmios;
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  878  
d7b1787161b78a Alexander Shishkin 2016-02-15  879  	dev_set_drvdata(dev, th);
d7b1787161b78a Alexander Shishkin 2016-02-15  880  
142dfeb2020960 Alexander Shishkin 2016-06-22  881  	pm_runtime_no_callbacks(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  882  	pm_runtime_put(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  883  	pm_runtime_allow(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  884  
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  885  	err = intel_th_populate(th);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  886  	if (err) {
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  887  		/* free the subdevices and undo everything */
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  888  		intel_th_free(th);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  889  		return ERR_PTR(err);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  890  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  891  
39f4034693b7c7 Alexander Shishkin 2015-09-22  892  	return th;
39f4034693b7c7 Alexander Shishkin 2015-09-22  893  
39f4034693b7c7 Alexander Shishkin 2015-09-22  894  err_ida:
39f4034693b7c7 Alexander Shishkin 2015-09-22  895  	ida_simple_remove(&intel_th_ida, th->id);
39f4034693b7c7 Alexander Shishkin 2015-09-22  896  
39f4034693b7c7 Alexander Shishkin 2015-09-22  897  err_alloc:
39f4034693b7c7 Alexander Shishkin 2015-09-22  898  	kfree(th);
39f4034693b7c7 Alexander Shishkin 2015-09-22  899  
39f4034693b7c7 Alexander Shishkin 2015-09-22  900  	return ERR_PTR(err);
39f4034693b7c7 Alexander Shishkin 2015-09-22  901  }
39f4034693b7c7 Alexander Shishkin 2015-09-22  902  EXPORT_SYMBOL_GPL(intel_th_alloc);
39f4034693b7c7 Alexander Shishkin 2015-09-22  903  

:::::: The code at line 838 was first introduced by commit
:::::: 39f4034693b7c7bd1fe4cb58c93259d600f55561 intel_th: Add driver infrastructure for Intel(R) Trace Hub devices

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
