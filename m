Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A218AE9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djQ36Jjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700429690; x=1731965690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qSjJGt3aBeEORUAlcuEjwSTLpZSdij4sXxvJAZeqHT8=;
  b=djQ36JjpMEDlVZhNv4Yf5cxD98nfKe64IdknUbErfU2qQqR8IW9bfWhw
   f8oXDJDeHXS13Tz/PEBl5uvD6M4fTecDkJBLX7GMvEksWfRNv62+gpbFK
   qfPpE6M0lga7GqbHzWPYypluA8WQ2WBOoID6qQtiS70fmtFwuK/Pogir0
   7D2tKS5fNoBP9HnkG20jRDuWE96R4XvofYCVvdjmMLGc0YL5pkNx2bCZY
   mDWo4szzitJRNqCopYUsEi1R/K0LVVMEn3L6fk3ool3STQ/pBV40gwyh1
   Zn6oRDlYq4ndWEL0dxOOlK3EjspQUzb+vRtXGjMpW/tmpNREro1zPscxH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="371702057"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="371702057"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 13:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909920497"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="909920497"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 13:34:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4pRD-0005Zf-26;
	Sun, 19 Nov 2023 21:34:43 +0000
Date: Mon, 20 Nov 2023 05:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/hwtracing/intel_th/core.c:795: warning: Function parameter
 or member 'drvdata' not described in 'intel_th_alloc'
Message-ID: <202311200521.j8ybmtiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: 3321371b5d648479058fa6f9441168abbc1467c9 intel_th: pci: Use drvdata for quirks
date:   6 years ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231120/202311200521.j8ybmtiW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200521.j8ybmtiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200521.j8ybmtiW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/intel_th/core.c:795: warning: Function parameter or member 'drvdata' not described in 'intel_th_alloc'


vim +795 drivers/hwtracing/intel_th/core.c

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
