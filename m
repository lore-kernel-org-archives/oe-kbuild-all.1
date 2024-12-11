Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0F9238E29
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920354; cv=none; b=qwJ+LyExkhdawJ5NxnkE4CpWcCp5R9X2kGs1sBzBHjOBeCVKKJ4Ejr19fqnFsnJPdfRaAJ4D4s7heqlMa50dEL8ZZ3kxHMfGfc6ZwUT0/G/9TKAIXRWdYe1b5CLUYLF9dNDEWz72HqQrNGdYA7cysGtE0Qkiok/idfLPGbFySmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920354; c=relaxed/simple;
	bh=HxxFD2GxzBn7wHfw3hxsbKxeqXQRTPhjEzoi+p0cJAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gm44o6zhyJaURehajGxmcSV0nKkqqHycZmD8doa6T64ijYPHnONdcqvKJaCoJY4TCw6cG0SkstifAN6jPr6d2EZeEk4odUe0zwNk7Bfoxg1mnZtMFiGX2FS8E4vKZs44UPlFcaOvIqVYHxRpIN5XZ0jE1qUXgJ1FVJzAiRNeyaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhqKsBw1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhqKsBw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733920352; x=1765456352;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HxxFD2GxzBn7wHfw3hxsbKxeqXQRTPhjEzoi+p0cJAg=;
  b=MhqKsBw1uF8A5h7RMWUBFChqBAQw566pweHXENj91w5TwdFWOXOWHrj7
   DZ/dHsxeEGjgcQnirLd3XNO1QSM89itel6XkeK/kBTXanHc/ZoVp6hXJj
   ga9wdHKnjaVQtc7p9O9ts4VR5Gd4RCtTwdeAtlKZufKA7Sf0CtnO91Xju
   e/p+sQFdrD+4OrXswonI3OiBhjitneI8nVHHVqx28XtHR3tuL3ZWbUuRb
   AZsh+vXvGBO/Y6jlFLqo/1BaU/FvN6oDpV++0tn6yD/l0/8P6AORvdSu3
   9tJL/wsn3OQEV6EwX4V7kLvKtrkE5MqALPpsUaSpYfq9TkJQjLliAR1Qf
   g==;
X-CSE-ConnectionGUID: 8zZbToEmSbmxG2yYrcDoRA==
X-CSE-MsgGUID: 1zIRK+6jToakkx7+ebJ4cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34543316"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="34543316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 04:32:31 -0800
X-CSE-ConnectionGUID: KIXi44RdTNm8qyWyBsBNig==
X-CSE-MsgGUID: i2jwUORgT7mjnV2zRiSKbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96233186"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2024 04:32:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLLtD-0006e3-1U;
	Wed, 11 Dec 2024 12:32:27 +0000
Date: Wed, 11 Dec 2024 20:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Colberg <peter.colberg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Xu Yilun <yilun.xu@linux.intel.com>,
	Matthew Gerlach <matthew.gerlach@linux.intel.com>,
	Basheer Ahmed Muddebihal <basheer.ahmed.muddebihal@linux.intel.com>
Subject: [linux-next:master 2638/3192] drivers/fpga/dfl.c:817:47: sparse:
 sparse: incorrect type in return expression (different address spaces)
Message-ID: <202412112004.h3MCo8xA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: d616a38d377f7204ebb905ef9b475870e02013c4 [2638/3192] fpga: dfl: factor out feature device data from platform device data
config: i386-randconfig-062-20241211 (https://download.01.org/0day-ci/archive/20241211/202412112004.h3MCo8xA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412112004.h3MCo8xA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412112004.h3MCo8xA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fpga/dfl.c:817:47: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct dfl_feature_dev_data * @@     got void [noderef] __iomem *ioaddr @@
   drivers/fpga/dfl.c:817:47: sparse:     expected struct dfl_feature_dev_data *
   drivers/fpga/dfl.c:817:47: sparse:     got void [noderef] __iomem *ioaddr
   drivers/fpga/dfl.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +817 drivers/fpga/dfl.c

543be3d8c999b3 Wu Hao           2018-06-30  742  
a25cd37037c853 Peter Colberg    2024-11-19  743  static struct dfl_feature_dev_data *
dbd805600eb35d Peter Colberg    2024-11-19  744  binfo_create_feature_dev_data(struct build_feature_devs_info *binfo)
543be3d8c999b3 Wu Hao           2018-06-30  745  {
543be3d8c999b3 Wu Hao           2018-06-30  746  	struct platform_device *fdev = binfo->feature_dev;
98ae80101081b0 Peter Colberg    2024-11-19  747  	enum dfl_id_type type = binfo->type;
543be3d8c999b3 Wu Hao           2018-06-30  748  	struct dfl_feature_info *finfo, *p;
a25cd37037c853 Peter Colberg    2024-11-19  749  	struct dfl_feature_dev_data *fdata;
dbd805600eb35d Peter Colberg    2024-11-19  750  	int index = 0, res_idx = 0;
543be3d8c999b3 Wu Hao           2018-06-30  751  
dfe3de8d397bf8 Scott Wood       2019-05-09  752  	if (WARN_ON_ONCE(type >= DFL_ID_MAX))
dbd805600eb35d Peter Colberg    2024-11-19  753  		return ERR_PTR(-EINVAL);
dfe3de8d397bf8 Scott Wood       2019-05-09  754  
d616a38d377f72 Peter Colberg    2024-11-19  755  	fdata = devm_kzalloc(binfo->dev, struct_size(fdata, features, binfo->feature_num), GFP_KERNEL);
a25cd37037c853 Peter Colberg    2024-11-19  756  	if (!fdata)
dbd805600eb35d Peter Colberg    2024-11-19  757  		return ERR_PTR(-ENOMEM);
543be3d8c999b3 Wu Hao           2018-06-30  758  
a25cd37037c853 Peter Colberg    2024-11-19  759  	fdata->dev = fdev;
a25cd37037c853 Peter Colberg    2024-11-19  760  	fdata->type = type;
a25cd37037c853 Peter Colberg    2024-11-19  761  	fdata->num = binfo->feature_num;
a25cd37037c853 Peter Colberg    2024-11-19  762  	fdata->dfl_cdev = binfo->cdev;
a25cd37037c853 Peter Colberg    2024-11-19  763  	fdata->id = FEATURE_DEV_ID_UNUSED;
a25cd37037c853 Peter Colberg    2024-11-19  764  	mutex_init(&fdata->lock);
a25cd37037c853 Peter Colberg    2024-11-19  765  	lockdep_set_class_and_name(&fdata->lock, &dfl_pdata_keys[type],
dfe3de8d397bf8 Scott Wood       2019-05-09  766  				   dfl_pdata_key_strings[type]);
543be3d8c999b3 Wu Hao           2018-06-30  767  
543be3d8c999b3 Wu Hao           2018-06-30  768  	/*
543be3d8c999b3 Wu Hao           2018-06-30  769  	 * the count should be initialized to 0 to make sure
543be3d8c999b3 Wu Hao           2018-06-30  770  	 *__fpga_port_enable() following __fpga_port_disable()
543be3d8c999b3 Wu Hao           2018-06-30  771  	 * works properly for port device.
543be3d8c999b3 Wu Hao           2018-06-30  772  	 * and it should always be 0 for fme device.
543be3d8c999b3 Wu Hao           2018-06-30  773  	 */
a25cd37037c853 Peter Colberg    2024-11-19  774  	WARN_ON(fdata->disable_count);
543be3d8c999b3 Wu Hao           2018-06-30  775  
543be3d8c999b3 Wu Hao           2018-06-30  776  	/* each sub feature has one MMIO resource */
543be3d8c999b3 Wu Hao           2018-06-30  777  	fdev->num_resources = binfo->feature_num;
543be3d8c999b3 Wu Hao           2018-06-30  778  	fdev->resource = kcalloc(binfo->feature_num, sizeof(*fdev->resource),
543be3d8c999b3 Wu Hao           2018-06-30  779  				 GFP_KERNEL);
543be3d8c999b3 Wu Hao           2018-06-30  780  	if (!fdev->resource)
dbd805600eb35d Peter Colberg    2024-11-19  781  		return ERR_PTR(-ENOMEM);
543be3d8c999b3 Wu Hao           2018-06-30  782  
543be3d8c999b3 Wu Hao           2018-06-30  783  	/* fill features and resource information for feature dev */
543be3d8c999b3 Wu Hao           2018-06-30  784  	list_for_each_entry_safe(finfo, p, &binfo->sub_features, node) {
a25cd37037c853 Peter Colberg    2024-11-19  785  		struct dfl_feature *feature = &fdata->features[index++];
8d021039cbb5e3 Xu Yilun         2020-06-16  786  		struct dfl_feature_irq_ctx *ctx;
8d021039cbb5e3 Xu Yilun         2020-06-16  787  		unsigned int i;
543be3d8c999b3 Wu Hao           2018-06-30  788  
543be3d8c999b3 Wu Hao           2018-06-30  789  		/* save resource information for each feature */
322b598be4d9b9 Xu Yilun         2020-06-16  790  		feature->dev = fdev;
543be3d8c999b3 Wu Hao           2018-06-30  791  		feature->id = finfo->fid;
1604986c3e6bd8 Martin Hundebøll 2021-07-16  792  		feature->revision = finfo->revision;
4747ab89b4a652 Matthew Gerlach  2023-01-15  793  		feature->dfh_version = finfo->dfh_version;
89eb35e810a87d Xu Yilun         2020-08-19  794  
4747ab89b4a652 Matthew Gerlach  2023-01-15  795  		if (finfo->param_size) {
4747ab89b4a652 Matthew Gerlach  2023-01-15  796  			feature->params = devm_kmemdup(binfo->dev,
4747ab89b4a652 Matthew Gerlach  2023-01-15  797  						       finfo->params, finfo->param_size,
4747ab89b4a652 Matthew Gerlach  2023-01-15  798  						       GFP_KERNEL);
4747ab89b4a652 Matthew Gerlach  2023-01-15  799  			if (!feature->params)
dbd805600eb35d Peter Colberg    2024-11-19  800  				return ERR_PTR(-ENOMEM);
4747ab89b4a652 Matthew Gerlach  2023-01-15  801  
4747ab89b4a652 Matthew Gerlach  2023-01-15  802  			feature->param_size = finfo->param_size;
4747ab89b4a652 Matthew Gerlach  2023-01-15  803  		}
89eb35e810a87d Xu Yilun         2020-08-19  804  		/*
89eb35e810a87d Xu Yilun         2020-08-19  805  		 * the FIU header feature has some fundamental functions (sriov
89eb35e810a87d Xu Yilun         2020-08-19  806  		 * set, port enable/disable) needed for the dfl bus device and
89eb35e810a87d Xu Yilun         2020-08-19  807  		 * other sub features. So its mmio resource should be mapped by
89eb35e810a87d Xu Yilun         2020-08-19  808  		 * DFL bus device. And we should not assign it to feature
89eb35e810a87d Xu Yilun         2020-08-19  809  		 * devices (dfl-fme/afu) again.
89eb35e810a87d Xu Yilun         2020-08-19  810  		 */
89eb35e810a87d Xu Yilun         2020-08-19  811  		if (is_header_feature(feature)) {
89eb35e810a87d Xu Yilun         2020-08-19  812  			feature->resource_index = -1;
89eb35e810a87d Xu Yilun         2020-08-19  813  			feature->ioaddr =
89eb35e810a87d Xu Yilun         2020-08-19  814  				devm_ioremap_resource(binfo->dev,
89eb35e810a87d Xu Yilun         2020-08-19  815  						      &finfo->mmio_res);
89eb35e810a87d Xu Yilun         2020-08-19  816  			if (IS_ERR(feature->ioaddr))
dbd805600eb35d Peter Colberg    2024-11-19 @817  				return feature->ioaddr;
89eb35e810a87d Xu Yilun         2020-08-19  818  		} else {
89eb35e810a87d Xu Yilun         2020-08-19  819  			feature->resource_index = res_idx;
89eb35e810a87d Xu Yilun         2020-08-19  820  			fdev->resource[res_idx++] = finfo->mmio_res;
89eb35e810a87d Xu Yilun         2020-08-19  821  		}
543be3d8c999b3 Wu Hao           2018-06-30  822  
8d021039cbb5e3 Xu Yilun         2020-06-16  823  		if (finfo->nr_irqs) {
8d021039cbb5e3 Xu Yilun         2020-06-16  824  			ctx = devm_kcalloc(binfo->dev, finfo->nr_irqs,
8d021039cbb5e3 Xu Yilun         2020-06-16  825  					   sizeof(*ctx), GFP_KERNEL);
8d021039cbb5e3 Xu Yilun         2020-06-16  826  			if (!ctx)
dbd805600eb35d Peter Colberg    2024-11-19  827  				return ERR_PTR(-ENOMEM);
8d021039cbb5e3 Xu Yilun         2020-06-16  828  
8d021039cbb5e3 Xu Yilun         2020-06-16  829  			for (i = 0; i < finfo->nr_irqs; i++)
8d021039cbb5e3 Xu Yilun         2020-06-16  830  				ctx[i].irq =
8d021039cbb5e3 Xu Yilun         2020-06-16  831  					binfo->irq_table[finfo->irq_base + i];
8d021039cbb5e3 Xu Yilun         2020-06-16  832  
8d021039cbb5e3 Xu Yilun         2020-06-16  833  			feature->irq_ctx = ctx;
8d021039cbb5e3 Xu Yilun         2020-06-16  834  			feature->nr_irqs = finfo->nr_irqs;
8d021039cbb5e3 Xu Yilun         2020-06-16  835  		}
8d021039cbb5e3 Xu Yilun         2020-06-16  836  
543be3d8c999b3 Wu Hao           2018-06-30  837  		list_del(&finfo->node);
543be3d8c999b3 Wu Hao           2018-06-30  838  		kfree(finfo);
543be3d8c999b3 Wu Hao           2018-06-30  839  	}
543be3d8c999b3 Wu Hao           2018-06-30  840  
a25cd37037c853 Peter Colberg    2024-11-19  841  	return fdata;
543be3d8c999b3 Wu Hao           2018-06-30  842  }
543be3d8c999b3 Wu Hao           2018-06-30  843  

:::::: The code at line 817 was first introduced by commit
:::::: dbd805600eb35d1000bbc3566cfc7c35d9c67e3e fpga: dfl: factor out feature data creation from build_info_commit_dev()

:::::: TO: Peter Colberg <peter.colberg@intel.com>
:::::: CC: Xu Yilun <yilun.xu@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
