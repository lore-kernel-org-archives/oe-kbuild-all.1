Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509582153D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700828; cv=none; b=QiqKALwhU2BwwcUxtyZio9aNFnWrqOPTqZQUk7AOcVlaGsaNISD+HveCBwT/g1pkKpKf8nNNt/jSaGD3Hp8eJaanIqJqQSJVG0tRHw5s1+jEMShVtX+5pQz84VP7/S9+zcH9STacmg5z8mry9AWj96gwMfixftGtVjtvgRyAXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700828; c=relaxed/simple;
	bh=sTLY/EFgjSlXzOB3/PgBVYASDC1UK0IYTpY7NeESEc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oSRp3gRVJja48+M7V/nqc9RF+BKIj4df8NLJkzj6NCHOeHrX0emW6J/0JwOivqLwjBqLXGT4vho/xL52S0uDls7+c8lvXFuhyihxak0FsAKlgjqjfYnpuBzPpLGgdshN/vy7e/qZF+z7knLaXgaaF/jVoFulGPXSLXaPb5b8Nvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0X/AuWU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0X/AuWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734700825; x=1766236825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sTLY/EFgjSlXzOB3/PgBVYASDC1UK0IYTpY7NeESEc8=;
  b=N0X/AuWUvkFmZm5kN4K2W3+LPboeDF2HgkE+OJJj5O1H7JWJrYqOAbdX
   ODJf9s8bTSTFWP/N4YoHorHF7SY0dGdsJRf8SO8RAmnrNMKIh60Q4b9GY
   YdOJm0OFftlGdLkSXFz9KlsMePyiylSgKpWUXEfnJypyXSgNvrVcZXOrH
   Qg0UaJqgEAU9gVvozCOBGFhuWGX+a/fg9lBUQQvTAPvyFQOcCK+Hl3El5
   h5+toVkn1Dkre3V66tueGpia7mmPQ5V0vbBcd3eMLIRb5MkVOUilAo/a9
   1pMvurT3P5F0QSuDIaC3xaA18fmSiBPbSLptM7Eo9yb5vfT6AhKCVumxW
   w==;
X-CSE-ConnectionGUID: WZfc+nsbQZiX1eMTXvReCg==
X-CSE-MsgGUID: AybXZu/yQ9WYGQwfXrzr2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38088050"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="38088050"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:20:24 -0800
X-CSE-ConnectionGUID: rV3kquMFQWqSmpkf05oMug==
X-CSE-MsgGUID: yQh05hL9TFagR+Xjyz0+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129472004"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2024 05:20:23 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOcvV-0001Ah-24;
	Fri, 20 Dec 2024 13:20:21 +0000
Date: Fri, 20 Dec 2024 21:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/hwtracing/intel_th/core.c:812: warning: Function parameter
 or struct member 'ndevres' not described in 'intel_th_alloc'
Message-ID: <202412202106.UgBLR3Lz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: db73a059de00eed721f13051c0d6ff3e7de90fe8 intel_th: Rework resource passing between glue layers and core
date:   6 years ago
config: arm-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241220/202412202106.UgBLR3Lz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202106.UgBLR3Lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202106.UgBLR3Lz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/core.c:812: warning: Function parameter or struct member 'drvdata' not described in 'intel_th_alloc'
>> drivers/hwtracing/intel_th/core.c:812: warning: Function parameter or struct member 'ndevres' not described in 'intel_th_alloc'


vim +812 drivers/hwtracing/intel_th/core.c

39f4034693b7c7 Alexander Shishkin 2015-09-22  802  
39f4034693b7c7 Alexander Shishkin 2015-09-22  803  /**
39f4034693b7c7 Alexander Shishkin 2015-09-22  804   * intel_th_alloc() - allocate a new Intel TH device and its subdevices
39f4034693b7c7 Alexander Shishkin 2015-09-22  805   * @dev:	parent device
db73a059de00ee Alexander Shishkin 2019-05-03  806   * @devres:	resources indexed by th_mmio_idx
39f4034693b7c7 Alexander Shishkin 2015-09-22  807   * @irq:	irq number
39f4034693b7c7 Alexander Shishkin 2015-09-22  808   */
39f4034693b7c7 Alexander Shishkin 2015-09-22  809  struct intel_th *
3321371b5d6484 Alexander Shishkin 2017-08-18  810  intel_th_alloc(struct device *dev, struct intel_th_drvdata *drvdata,
3321371b5d6484 Alexander Shishkin 2017-08-18  811  	       struct resource *devres, unsigned int ndevres, int irq)
39f4034693b7c7 Alexander Shishkin 2015-09-22 @812  {
39f4034693b7c7 Alexander Shishkin 2015-09-22  813  	struct intel_th *th;
661b0df8489a35 Alexander Shishkin 2017-08-23  814  	int err, r;
661b0df8489a35 Alexander Shishkin 2017-08-23  815  
db73a059de00ee Alexander Shishkin 2019-05-03  816  	if (ndevres < TH_MMIO_END)
db73a059de00ee Alexander Shishkin 2019-05-03  817  		return ERR_PTR(-EINVAL);
39f4034693b7c7 Alexander Shishkin 2015-09-22  818  
39f4034693b7c7 Alexander Shishkin 2015-09-22  819  	th = kzalloc(sizeof(*th), GFP_KERNEL);
39f4034693b7c7 Alexander Shishkin 2015-09-22  820  	if (!th)
39f4034693b7c7 Alexander Shishkin 2015-09-22  821  		return ERR_PTR(-ENOMEM);
39f4034693b7c7 Alexander Shishkin 2015-09-22  822  
39f4034693b7c7 Alexander Shishkin 2015-09-22  823  	th->id = ida_simple_get(&intel_th_ida, 0, 0, GFP_KERNEL);
39f4034693b7c7 Alexander Shishkin 2015-09-22  824  	if (th->id < 0) {
39f4034693b7c7 Alexander Shishkin 2015-09-22  825  		err = th->id;
39f4034693b7c7 Alexander Shishkin 2015-09-22  826  		goto err_alloc;
39f4034693b7c7 Alexander Shishkin 2015-09-22  827  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  828  
39f4034693b7c7 Alexander Shishkin 2015-09-22  829  	th->major = __register_chrdev(0, 0, TH_POSSIBLE_OUTPUTS,
39f4034693b7c7 Alexander Shishkin 2015-09-22  830  				      "intel_th/output", &intel_th_output_fops);
39f4034693b7c7 Alexander Shishkin 2015-09-22  831  	if (th->major < 0) {
39f4034693b7c7 Alexander Shishkin 2015-09-22  832  		err = th->major;
39f4034693b7c7 Alexander Shishkin 2015-09-22  833  		goto err_ida;
39f4034693b7c7 Alexander Shishkin 2015-09-22  834  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  835  	th->dev = dev;
3321371b5d6484 Alexander Shishkin 2017-08-18  836  	th->drvdata = drvdata;
39f4034693b7c7 Alexander Shishkin 2015-09-22  837  
db73a059de00ee Alexander Shishkin 2019-05-03  838  	for (r = 0; r < ndevres; r++)
db73a059de00ee Alexander Shishkin 2019-05-03  839  		th->resource[r] = devres[r];
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  840  	th->num_resources = ndevres;
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  841  	th->irq = irq;
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  842  
d7b1787161b78a Alexander Shishkin 2016-02-15  843  	dev_set_drvdata(dev, th);
d7b1787161b78a Alexander Shishkin 2016-02-15  844  
142dfeb2020960 Alexander Shishkin 2016-06-22  845  	pm_runtime_no_callbacks(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  846  	pm_runtime_put(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  847  	pm_runtime_allow(dev);
142dfeb2020960 Alexander Shishkin 2016-06-22  848  
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  849  	err = intel_th_populate(th);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  850  	if (err) {
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  851  		/* free the subdevices and undo everything */
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  852  		intel_th_free(th);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  853  		return ERR_PTR(err);
a753bfcfdb1f31 Alexander Shishkin 2017-08-10  854  	}
39f4034693b7c7 Alexander Shishkin 2015-09-22  855  
39f4034693b7c7 Alexander Shishkin 2015-09-22  856  	return th;
39f4034693b7c7 Alexander Shishkin 2015-09-22  857  
39f4034693b7c7 Alexander Shishkin 2015-09-22  858  err_ida:
39f4034693b7c7 Alexander Shishkin 2015-09-22  859  	ida_simple_remove(&intel_th_ida, th->id);
39f4034693b7c7 Alexander Shishkin 2015-09-22  860  
39f4034693b7c7 Alexander Shishkin 2015-09-22  861  err_alloc:
39f4034693b7c7 Alexander Shishkin 2015-09-22  862  	kfree(th);
39f4034693b7c7 Alexander Shishkin 2015-09-22  863  
39f4034693b7c7 Alexander Shishkin 2015-09-22  864  	return ERR_PTR(err);
39f4034693b7c7 Alexander Shishkin 2015-09-22  865  }
39f4034693b7c7 Alexander Shishkin 2015-09-22  866  EXPORT_SYMBOL_GPL(intel_th_alloc);
39f4034693b7c7 Alexander Shishkin 2015-09-22  867  

:::::: The code at line 812 was first introduced by commit
:::::: 39f4034693b7c7bd1fe4cb58c93259d600f55561 intel_th: Add driver infrastructure for Intel(R) Trace Hub devices

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
