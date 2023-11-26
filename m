Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8FA320F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 07:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUc6tqG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700984064; x=1732520064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qcwZKcvcTIEt1uUkv2p8fYANmQoguuWbKwyzsvmLEA=;
  b=FUc6tqG8MywBGxO2zAvsPZfHVZOYpzsOctivROpN5uq4BnIURt+Tk2Iq
   Z4t2v6KvmeDeJ+/Ea+1ZiiqhT/U/GjaFepuBoKF7G9aVCHiwrCXdbPJ2F
   GDI7AU36AiIIJ5gaWdVE3YLe1NZU41+TocXoFdIbAPORXrbg2+Wg10syP
   FCmTnmce0NGVYQgjrD7+HRmH89Wo/NyFxLhPIYNXyXSqY6H3/E56U2eF2
   OSVJhf0VN3wdXbWu1ZCNXyLKOhWqNdpT+9pVjx+3U2oN4J4wZapVPWs6r
   hssvdPYKfUnh+a9Z1axOLRhqN2ZGkIZlRLDANBgyliNa1DQRt/Pd9vTjn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="11248161"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="11248161"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 23:34:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="796946943"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="796946943"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Nov 2023 23:34:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r79el-0004wo-1c;
	Sun, 26 Nov 2023 07:34:19 +0000
Date: Sun, 26 Nov 2023 15:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/hwtracing/intel_th/core.c:795: warning: No description found
 for parameter 'drvdata'
Message-ID: <202311261534.mYloP1GL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f5cc96c367f2e780eb492cc9cab84e3b2ca88da
commit: 3321371b5d648479058fa6f9441168abbc1467c9 intel_th: pci: Use drvdata for quirks
date:   6 years ago
config: i386-buildonly-randconfig-004-20231120 (https://download.01.org/0day-ci/archive/20231126/202311261534.mYloP1GL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311261534.mYloP1GL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261534.mYloP1GL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/intel_th/core.c:795: warning: No description found for parameter 'drvdata'


vim +/drvdata +795 drivers/hwtracing/intel_th/core.c

39f4034693b7c7 Alexander Shishkin 2015-09-22  784  
39f4034693b7c7 Alexander Shishkin 2015-09-22  785  /**
39f4034693b7c7 Alexander Shishkin 2015-09-22  786   * intel_th_alloc() - allocate a new Intel TH device and its subdevices
39f4034693b7c7 Alexander Shishkin 2015-09-22  787   * @dev:	parent device
39f4034693b7c7 Alexander Shishkin 2015-09-22  788   * @devres:	parent's resources
39f4034693b7c7 Alexander Shishkin 2015-09-22  789   * @ndevres:	number of resources
39f4034693b7c7 Alexander Shishkin 2015-09-22  790   * @irq:	irq number
39f4034693b7c7 Alexander Shishkin 2015-09-22  791   */
39f4034693b7c7 Alexander Shishkin 2015-09-22  792  struct intel_th *
3321371b5d6484 Alexander Shishkin 2017-08-18  793  intel_th_alloc(struct device *dev, struct intel_th_drvdata *drvdata,
3321371b5d6484 Alexander Shishkin 2017-08-18  794  	       struct resource *devres, unsigned int ndevres, int irq)
39f4034693b7c7 Alexander Shishkin 2015-09-22 @795  {
39f4034693b7c7 Alexander Shishkin 2015-09-22  796  	struct intel_th *th;
39f4034693b7c7 Alexander Shishkin 2015-09-22  797  	int err;
39f4034693b7c7 Alexander Shishkin 2015-09-22  798  
39f4034693b7c7 Alexander Shishkin 2015-09-22  799  	th = kzalloc(sizeof(*th), GFP_KERNEL);
39f4034693b7c7 Alexander Shishkin 2015-09-22  800  	if (!th)
39f4034693b7c7 Alexander Shishkin 2015-09-22  801  		return ERR_PTR(-ENOMEM);
39f4034693b7c7 Alexander Shishkin 2015-09-22  802  
39f4034693b7c7 Alexander Shishkin 2015-09-22  803  	th->id = ida_simple_get(&intel_th_ida, 0, 0, GFP_KERNEL);
39f4034693b7c7 Alexander Shishkin 2015-09-22  804  	if (th->id < 0) {
39f4034693b7c7 Alexander Shishkin 2015-09-22  805  		err = th->id;
39f4034693b7c7 Alexander Shishkin 2015-09-22  806  		goto err_alloc;
39f4034693b7c7 Alexander Shishkin 2015-09-22  807  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  808  
39f4034693b7c7 Alexander Shishkin 2015-09-22  809  	th->major = __register_chrdev(0, 0, TH_POSSIBLE_OUTPUTS,
39f4034693b7c7 Alexander Shishkin 2015-09-22  810  				      "intel_th/output", &intel_th_output_fops);
39f4034693b7c7 Alexander Shishkin 2015-09-22  811  	if (th->major < 0) {
39f4034693b7c7 Alexander Shishkin 2015-09-22  812  		err = th->major;
39f4034693b7c7 Alexander Shishkin 2015-09-22  813  		goto err_ida;
39f4034693b7c7 Alexander Shishkin 2015-09-22  814  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  815  	th->dev = dev;
3321371b5d6484 Alexander Shishkin 2017-08-18  816  	th->drvdata = drvdata;
39f4034693b7c7 Alexander Shishkin 2015-09-22  817  
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  818  	th->resource = devres;
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  819  	th->num_resources = ndevres;
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  820  	th->irq = irq;
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  821  
d7b1787161b78a Alexander Shishkin 2016-02-15  822  	dev_set_drvdata(dev, th);
d7b1787161b78a Alexander Shishkin 2016-02-15  823  
142dfeb2020960 Alexander Shishkin 2016-06-22  824  	pm_runtime_no_callbacks(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  825  	pm_runtime_put(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  826  	pm_runtime_allow(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  827  
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  828  	err = intel_th_populate(th);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  829  	if (err) {
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  830  		/* free the subdevices and undo everything */
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  831  		intel_th_free(th);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  832  		return ERR_PTR(err);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  833  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  834  
39f4034693b7c7 Alexander Shishkin 2015-09-22  835  	return th;
39f4034693b7c7 Alexander Shishkin 2015-09-22  836  
39f4034693b7c7 Alexander Shishkin 2015-09-22  837  err_ida:
39f4034693b7c7 Alexander Shishkin 2015-09-22  838  	ida_simple_remove(&intel_th_ida, th->id);
39f4034693b7c7 Alexander Shishkin 2015-09-22  839  
39f4034693b7c7 Alexander Shishkin 2015-09-22  840  err_alloc:
39f4034693b7c7 Alexander Shishkin 2015-09-22  841  	kfree(th);
39f4034693b7c7 Alexander Shishkin 2015-09-22  842  
39f4034693b7c7 Alexander Shishkin 2015-09-22  843  	return ERR_PTR(err);
39f4034693b7c7 Alexander Shishkin 2015-09-22  844  }
39f4034693b7c7 Alexander Shishkin 2015-09-22  845  EXPORT_SYMBOL_GPL(intel_th_alloc);
39f4034693b7c7 Alexander Shishkin 2015-09-22  846  

:::::: The code at line 795 was first introduced by commit
:::::: 39f4034693b7c7bd1fe4cb58c93259d600f55561 intel_th: Add driver infrastructure for Intel(R) Trace Hub devices

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
