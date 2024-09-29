Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FBBA94D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727572693; cv=none; b=b8iH0Ohk5XBK6GOk5eOsKuoJh0XxeMVSil1liyQGhEck9o4ra7sFcT8LLfNAWVYOu8j429fqSEw08mhTkPgTOyCk4rk191EivmyN6LeJevdUPmDb+JWmZcDXNOxwCJ0yhKmALQG/2urXBzW53qx/z+2sv9NVCzhVi5eTPul09nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727572693; c=relaxed/simple;
	bh=r6QNEPSzVDWaTywiRoSYrDSAZm6X1xf+hujndsimWnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0aDgvjSQbqIuo4FcPzWdl2i0Hm6I2L4MuY3k0T7sIO2BBRKehI+9tFZfmit9zr1WZbTqGVvB3yVR5Fg77VqYtiZOs2hoIKik6r+zJ9rFB+OdWprMo0/0TiGBslI9v6adDBbePb7JCAvSGCSmTB33Y477V9B6d2Icup80xm4NTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmCOwLsY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmCOwLsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727572691; x=1759108691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6QNEPSzVDWaTywiRoSYrDSAZm6X1xf+hujndsimWnk=;
  b=fmCOwLsYDrM6RDyayBMM+G5Nj4cQV36R+LZ7Fl9iic9+ZrYdgltvo65p
   AORpsXHa56lALH3QuSgD/zai2aTXfgqxo3F2/HXOD2di2yegX6JLzYUjt
   QvlEcK9wqrfUoE2yANdsBlN+vjculkFP4iGot9u+BnsAVMB1RVr5ubWLJ
   cZu8878FhSmyaii8WuaqO+a+Gy7brkrFiulU5r7BbclZNb1vI5LxFwq5B
   jqaLLZHAEVWAD3CPZMJr3fR7Yim9DZw7rbejKe4sje8rpY1WiX6Fwb8Yh
   f7TOyia/srbkKFJjLn/U0itMJPE0mtncQYWLT26NPyGlrV7StZGSdbH1/
   g==;
X-CSE-ConnectionGUID: zO73e4xVRemKzIbiXpaB6A==
X-CSE-MsgGUID: uGLNoZw0SxKwx6SYskWdog==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30479209"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30479209"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:18:09 -0700
X-CSE-ConnectionGUID: pyW9VfKwRqCoRuTxL/gYVQ==
X-CSE-MsgGUID: Pzn4cVwcRMWytlHVtSmT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72588801"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2024 18:18:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suiZZ-000Nnp-1q;
	Sun, 29 Sep 2024 01:18:05 +0000
Date: Sun, 29 Sep 2024 09:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5882/16788]
 drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype
 for 'int_imx_secvio_sc_check_state'
Message-ID: <202409290912.8yJmtStZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: b0ccc637e081a8f120dc9e98b92a90aa21ce1592 [5882/16788] Merge branch 'firmware/next' into next
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290912.8yJmtStZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290912.8yJmtStZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290912.8yJmtStZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: In function 'int_imx_secvio_sc_disable_irq':
>> drivers/soc/imx/secvio/imx-secvio-sc.c:377:36: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     377 |         struct imx_secvio_sc_data *data;
         |                                    ^~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: At top level:
>> drivers/soc/imx/secvio/imx-secvio-sc.c:459:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     459 | const static struct file_operations imx_secvio_sc_fops = {
         | ^~~~~
--
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous prototype for 'fuse_reader' [-Wmissing-prototypes]
      35 | int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous prototype for 'snvs_reader' [-Wmissing-prototypes]
      56 | int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous prototype for 'snvs_dgo_reader' [-Wmissing-prototypes]
      95 | int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~~~~~


vim +/int_imx_secvio_sc_check_state +140 drivers/soc/imx/secvio/imx-secvio-sc.c

0bc1767ab3eecd Franck LENORMAND 2019-12-05  139  
0bc1767ab3eecd Franck LENORMAND 2019-12-05 @140  int int_imx_secvio_sc_check_state(struct device *dev)
0bc1767ab3eecd Franck LENORMAND 2019-12-05  141  {
0bc1767ab3eecd Franck LENORMAND 2019-12-05  142  	struct secvio_sc_notifier_info info = {0};
0bc1767ab3eecd Franck LENORMAND 2019-12-05  143  	int ret = 0;
0bc1767ab3eecd Franck LENORMAND 2019-12-05  144  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  145  	ret = int_imx_secvio_sc_get_state(dev, &info);
0bc1767ab3eecd Franck LENORMAND 2019-12-05  146  	if (ret) {
0bc1767ab3eecd Franck LENORMAND 2019-12-05  147  		dev_err(dev, "Failed to get secvio state\n");
0bc1767ab3eecd Franck LENORMAND 2019-12-05  148  		goto exit;
0bc1767ab3eecd Franck LENORMAND 2019-12-05  149  	}
0bc1767ab3eecd Franck LENORMAND 2019-12-05  150  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  151  	/* Call chain of CB registered to this module if status detected */
0bc1767ab3eecd Franck LENORMAND 2019-12-05  152  	if (info.hpsvs || info.lps || info.lptds)
0bc1767ab3eecd Franck LENORMAND 2019-12-05  153  		if (imx_secvio_sc_notifier_call_chain(&info))
0bc1767ab3eecd Franck LENORMAND 2019-12-05  154  			dev_warn(dev,
0bc1767ab3eecd Franck LENORMAND 2019-12-05  155  				 "Issues when calling the notifier chain\n");
0bc1767ab3eecd Franck LENORMAND 2019-12-05  156  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  157  exit:
0bc1767ab3eecd Franck LENORMAND 2019-12-05  158  	return ret;
0bc1767ab3eecd Franck LENORMAND 2019-12-05  159  }
0bc1767ab3eecd Franck LENORMAND 2019-12-05  160  

:::::: The code at line 140 was first introduced by commit
:::::: 0bc1767ab3eecd07b0d530e86997b01a358d6d64 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
