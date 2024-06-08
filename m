Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00F817799F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717864991; cv=none; b=P2dDLLNhrvg7isH6OA0XYF/kmVwl3eQ4nl5eGnKRicpH4F2UU+rxt4gSATbbJM+KZ5QNF7OtXd40PsUg3HdoDzFzmowIMl629/bHr4YZ9igW5oYKWRRKfaIpS6TL/DQnQls10IsghONFoNtrIP0uBbt20hgpBldiFzloXL4noho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717864991; c=relaxed/simple;
	bh=CB5d80dg1GueM+9x0WgSXCygUS6QADjIxwhganFmeGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vg1ncAODEzozSNXH36y1bTrszeLPCMsmkddycOHF4XY0jSb0H+KkWNRqKugUXmmRMfgDgJ0zscS/GWGEV8yYBrjo6cqFlfEeixrip31vGT5IBlRisRmLalGwsUSXRYfJqBdBGC4ERa0hqhhsDGLbLNbjomJAfiuMYUci0UndHUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpLachLV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpLachLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717864989; x=1749400989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CB5d80dg1GueM+9x0WgSXCygUS6QADjIxwhganFmeGY=;
  b=MpLachLV722w+8FyYF0G+vLvXqivzOlP0IiMShKSEHMz35hSf15YLQfe
   ihxtfDZDVIF7PYbTN+3fSfJoepLiLj0X1iPue0+ukaQaOHwJiPceY0W6l
   db29+AY6n9eTHE4CMTd/mcj0k4B8+3H9Ruu+Y7HSDIcHcwvqUWuQ2y7fd
   kC9xsMTk404USLFFQuNNp6Vg0vJsdIiSwEMg6D1YREEEYRzrIWYEP8RCt
   spinGcCcm9IBAp7MPnCCPJKE+ZGYH7u57zS8PNUVqHVjFC3vWcfb6frfL
   eqdQoxTE8tus/FObc7ERaniB9g3LDYsoCyQ6fh6pIY0VdJ4w1ECPXg9L3
   Q==;
X-CSE-ConnectionGUID: svMCTSCVTYSskL67IHgn2w==
X-CSE-MsgGUID: HDD4XVIqREicPjV7InZ4lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14712139"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="14712139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 09:43:09 -0700
X-CSE-ConnectionGUID: DkBU8xKPR1+OLPH6l1c6pg==
X-CSE-MsgGUID: WSLLnK2qQf+Wb8i840KNjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="43558920"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jun 2024 09:43:07 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFz9l-0000Eg-0w;
	Sat, 08 Jun 2024 16:43:05 +0000
Date: Sun, 9 Jun 2024 00:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5421/22827]
 drivers/remoteproc/qcom_adsp_pil.c:246:26: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202406090015.Dx2VIQ1d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paulo,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a98543755cf2f636ae3169f3774d226d328d2cf
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [5421/22827] selinux: use kernel linux/socket.h for genheaders and mdp
config: arm64-randconfig-r123-20240607 (https://download.01.org/0day-ci/archive/20240609/202406090015.Dx2VIQ1d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240609/202406090015.Dx2VIQ1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090015.Dx2VIQ1d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_adsp_pil.c:246:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_adsp_pil.c:246:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_adsp_pil.c:246:26: sparse:     got void [noderef] <asn:2> *
--
>> drivers/remoteproc/qcom_q6v5_pil.c:1096:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mba_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_pil.c:1096:27: sparse:     expected void *mba_region
   drivers/remoteproc/qcom_q6v5_pil.c:1096:27: sparse:     got void [noderef] <asn:2> *
>> drivers/remoteproc/qcom_q6v5_pil.c:1114:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mpss_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_pil.c:1114:28: sparse:     expected void *mpss_region
   drivers/remoteproc/qcom_q6v5_pil.c:1114:28: sparse:     got void [noderef] <asn:2> *
   drivers/remoteproc/qcom_q6v5_pil.c: In function 'q6v5_mpss_load':
   drivers/remoteproc/qcom_q6v5_pil.c:741:70: warning: '%02d' directive output may be truncated writing between 2 and 11 bytes into a region of size 3 [-Wformat-truncation=]
     741 |                         snprintf(seg_name, sizeof(seg_name), "modem.b%02d", i);
         |                                                                      ^~~~
   drivers/remoteproc/qcom_q6v5_pil.c:741:62: note: directive argument in the range [-2147483641, 65534]
     741 |                         snprintf(seg_name, sizeof(seg_name), "modem.b%02d", i);
         |                                                              ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_pil.c:741:25: note: 'snprintf' output between 10 and 19 bytes into a destination of size 10
     741 |                         snprintf(seg_name, sizeof(seg_name), "modem.b%02d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/remoteproc/qcom_wcnss.c:456:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_wcnss.c:456:27: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_wcnss.c:456:27: sparse:     got void [noderef] <asn:2> *
--
>> net/netfilter/nft_counter.c:158:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct nft_counter_percpu_priv [noderef] <asn:3> *priv @@     got struct nft_counter_percpu_priv *priv @@
   net/netfilter/nft_counter.c:158:35: sparse:     expected struct nft_counter_percpu_priv [noderef] <asn:3> *priv
   net/netfilter/nft_counter.c:158:35: sparse:     got struct nft_counter_percpu_priv *priv
   net/netfilter/nft_counter.c:113:20: sparse: sparse: dereference of noderef expression

vim +246 drivers/remoteproc/qcom_adsp_pil.c

b9e718e950c3df Bjorn Andersson 2016-08-22  227  
b9e718e950c3df Bjorn Andersson 2016-08-22  228  static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
b9e718e950c3df Bjorn Andersson 2016-08-22  229  {
b9e718e950c3df Bjorn Andersson 2016-08-22  230  	struct device_node *node;
b9e718e950c3df Bjorn Andersson 2016-08-22  231  	struct resource r;
b9e718e950c3df Bjorn Andersson 2016-08-22  232  	int ret;
b9e718e950c3df Bjorn Andersson 2016-08-22  233  
b9e718e950c3df Bjorn Andersson 2016-08-22  234  	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
b9e718e950c3df Bjorn Andersson 2016-08-22  235  	if (!node) {
b9e718e950c3df Bjorn Andersson 2016-08-22  236  		dev_err(adsp->dev, "no memory-region specified\n");
b9e718e950c3df Bjorn Andersson 2016-08-22  237  		return -EINVAL;
b9e718e950c3df Bjorn Andersson 2016-08-22  238  	}
b9e718e950c3df Bjorn Andersson 2016-08-22  239  
b9e718e950c3df Bjorn Andersson 2016-08-22  240  	ret = of_address_to_resource(node, 0, &r);
b9e718e950c3df Bjorn Andersson 2016-08-22  241  	if (ret)
b9e718e950c3df Bjorn Andersson 2016-08-22  242  		return ret;
b9e718e950c3df Bjorn Andersson 2016-08-22  243  
b9e718e950c3df Bjorn Andersson 2016-08-22  244  	adsp->mem_phys = adsp->mem_reloc = r.start;
b9e718e950c3df Bjorn Andersson 2016-08-22  245  	adsp->mem_size = resource_size(&r);
b9e718e950c3df Bjorn Andersson 2016-08-22 @246  	adsp->mem_region = devm_ioremap_wc(adsp->dev, adsp->mem_phys, adsp->mem_size);
b9e718e950c3df Bjorn Andersson 2016-08-22  247  	if (!adsp->mem_region) {
b9e718e950c3df Bjorn Andersson 2016-08-22  248  		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
b9e718e950c3df Bjorn Andersson 2016-08-22  249  			&r.start, adsp->mem_size);
b9e718e950c3df Bjorn Andersson 2016-08-22  250  		return -EBUSY;
b9e718e950c3df Bjorn Andersson 2016-08-22  251  	}
b9e718e950c3df Bjorn Andersson 2016-08-22  252  
b9e718e950c3df Bjorn Andersson 2016-08-22  253  	return 0;
b9e718e950c3df Bjorn Andersson 2016-08-22  254  }
b9e718e950c3df Bjorn Andersson 2016-08-22  255  

:::::: The code at line 246 was first introduced by commit
:::::: b9e718e950c3dfa458bbf9180a8d8691e55413ae remoteproc: Introduce Qualcomm ADSP PIL

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
