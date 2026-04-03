Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19813C3441
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236901; cv=none; b=oBaxlitB6oWBIMWrC9y/61HAwvrBOhTSzeijnyK/V7PuBZdg6/xeCMHG9MW/JYzG9Wz+NsoUaqtLuE3mL7pNnuhWWwYr52/0c5nZtiWv3S8f/76aTxPBvxxyR4xepPDBAC9GCdVt7asEJ6uODeoT8F9sg3MgRvRbbqvCT31z5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236901; c=relaxed/simple;
	bh=9cBRxBzsNBR7Bp4M1hPTyctxrRle1uvT7txelBCu+Jo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FE0/dBOODQPGDHBLjJBTJVKhIf6cMZIo7WUxRQqWannOVQXKDMJzHsaAE4A5NDHDmvBwnlx5LWcNlr7wH7n/QGGlPKplBa1V24JAnPD9nQMUEYf5A6M6OFHfx1/BAzM1489Fu3Qc+LM5HD02gQWCBt4lVtDL6McjzDtV9CDvrQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGY6YeqE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGY6YeqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775236900; x=1806772900;
  h=date:from:to:cc:subject:message-id;
  bh=9cBRxBzsNBR7Bp4M1hPTyctxrRle1uvT7txelBCu+Jo=;
  b=YGY6YeqEyFd0SZ1nCX8ATyqAtD8ky8Uu1e1EPNSt+5yAERH7HBkJIDFc
   ksjq4lAmz5ZzQpAhPb00BYSpUrdrGqVgaAeIL0JWeg7ndcrDJvzvEBolD
   8+45t0/HpS4njYhPaCKNu3UM3n0MDrEwZUva3ZajhOF1WCQqv0DEGKoAM
   ceozbibQfJNM3Cio/k48Mi0C9ti5MEbeVXPR8/WDeIXTVIimSTyjuRJed
   Q5Lgl4FN06YspfRFvGFkah5JcB3wdzN73TbGBY5HQuYQa9OQW5mazi/QO
   bk8utco20jOrfiWJTg6cbGUX4G6TDlaMrDugLl9nad9J+sy+pJDTESjXm
   g==;
X-CSE-ConnectionGUID: 6d1QapkMSzmw0D475+ZEGQ==
X-CSE-MsgGUID: SOaK5Ir7RgeU4Pzh70vzYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="86602265"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="86602265"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 10:21:40 -0700
X-CSE-ConnectionGUID: euUgV0TVTcKz9ma5tXvb+Q==
X-CSE-MsgGUID: WzP5Q4EpSc2mtNquGSEBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="231344395"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Apr 2026 10:21:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8iDA-000000009Lh-0DAc;
	Fri, 03 Apr 2026 17:21:36 +0000
Date: Fri, 03 Apr 2026 19:20:56 +0200
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/base/firmware_loader/sysfs_upload.c:229:24: warning:
 unused variable 'fw_dev'
Message-ID: <202604031932.q6EI7tpk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/firmware_loader-Stop-pinning-modules-on-registration/20260403-143216
head:   9b07805c9d3f6515aec772a189030855e0e03fcb
commit: 9f5c31eab9430c568dc11b70563caea951b34aff firmware_loader: Stop pinning parent device per workqueue invocation
date:   11 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260403/202604031932.q6EI7tpk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031932.q6EI7tpk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031932.q6EI7tpk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/firmware_loader/sysfs_upload.c: In function 'fw_upload_start':
>> drivers/base/firmware_loader/sysfs_upload.c:229:24: warning: unused variable 'fw_dev' [-Wunused-variable]
     229 |         struct device *fw_dev = &fw_sysfs->dev;
         |                        ^~~~~~


vim +/fw_dev +229 drivers/base/firmware_loader/sysfs_upload.c

97730bbb242cde Russ Weight 2022-04-21  221  
97730bbb242cde Russ Weight 2022-04-21  222  /*
97730bbb242cde Russ Weight 2022-04-21  223   * Start a worker thread to upload data to the parent driver.
97730bbb242cde Russ Weight 2022-04-21  224   * Must be called with fw_lock held.
97730bbb242cde Russ Weight 2022-04-21  225   */
97730bbb242cde Russ Weight 2022-04-21  226  int fw_upload_start(struct fw_sysfs *fw_sysfs)
97730bbb242cde Russ Weight 2022-04-21  227  {
97730bbb242cde Russ Weight 2022-04-21  228  	struct fw_priv *fw_priv = fw_sysfs->fw_priv;
97730bbb242cde Russ Weight 2022-04-21 @229  	struct device *fw_dev = &fw_sysfs->dev;
97730bbb242cde Russ Weight 2022-04-21  230  	struct fw_upload_priv *fwlp;
97730bbb242cde Russ Weight 2022-04-21  231  
97730bbb242cde Russ Weight 2022-04-21  232  	if (!fw_sysfs->fw_upload_priv)
97730bbb242cde Russ Weight 2022-04-21  233  		return 0;
97730bbb242cde Russ Weight 2022-04-21  234  
97730bbb242cde Russ Weight 2022-04-21  235  	if (!fw_priv->size) {
97730bbb242cde Russ Weight 2022-04-21  236  		fw_free_paged_buf(fw_priv);
97730bbb242cde Russ Weight 2022-04-21  237  		fw_state_init(fw_sysfs->fw_priv);
97730bbb242cde Russ Weight 2022-04-21  238  		return 0;
97730bbb242cde Russ Weight 2022-04-21  239  	}
97730bbb242cde Russ Weight 2022-04-21  240  
97730bbb242cde Russ Weight 2022-04-21  241  	fwlp = fw_sysfs->fw_upload_priv;
97730bbb242cde Russ Weight 2022-04-21  242  	mutex_lock(&fwlp->lock);
97730bbb242cde Russ Weight 2022-04-21  243  
97730bbb242cde Russ Weight 2022-04-21  244  	/* Do not interfere with an on-going fw_upload */
97730bbb242cde Russ Weight 2022-04-21  245  	if (fwlp->progress != FW_UPLOAD_PROG_IDLE) {
97730bbb242cde Russ Weight 2022-04-21  246  		mutex_unlock(&fwlp->lock);
97730bbb242cde Russ Weight 2022-04-21  247  		return -EBUSY;
97730bbb242cde Russ Weight 2022-04-21  248  	}
97730bbb242cde Russ Weight 2022-04-21  249  
97730bbb242cde Russ Weight 2022-04-21  250  	fwlp->progress = FW_UPLOAD_PROG_RECEIVING;
97730bbb242cde Russ Weight 2022-04-21  251  	fwlp->err_code = 0;
97730bbb242cde Russ Weight 2022-04-21  252  	fwlp->remaining_size = fw_priv->size;
97730bbb242cde Russ Weight 2022-04-21  253  	fwlp->data = fw_priv->data;
97730bbb242cde Russ Weight 2022-04-21  254  
97730bbb242cde Russ Weight 2022-04-21  255  	pr_debug("%s: fw-%s fw_priv=%p data=%p size=%u\n",
97730bbb242cde Russ Weight 2022-04-21  256  		 __func__, fw_priv->fw_name,
97730bbb242cde Russ Weight 2022-04-21  257  		 fw_priv, fw_priv->data,
97730bbb242cde Russ Weight 2022-04-21  258  		 (unsigned int)fw_priv->size);
97730bbb242cde Russ Weight 2022-04-21  259  
97730bbb242cde Russ Weight 2022-04-21  260  	queue_work(system_long_wq, &fwlp->work);
97730bbb242cde Russ Weight 2022-04-21  261  	mutex_unlock(&fwlp->lock);
97730bbb242cde Russ Weight 2022-04-21  262  
97730bbb242cde Russ Weight 2022-04-21  263  	return 0;
97730bbb242cde Russ Weight 2022-04-21  264  }
97730bbb242cde Russ Weight 2022-04-21  265  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
