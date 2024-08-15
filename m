Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2826B679E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 18:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723745947; cv=none; b=ut75Sh8/R9h19NC9OVTVAiSKv6QPbsg1W1yQvqCL+V6Zl09wzDjITuQ/EAlidCTbXnFB5/ZqAoV3JYZJUQ81fTSuHvdqA+6OR6ZHCGU2MwUAhw95CEfzD7mzakIoiJs7+zkTliipRTjFlR4NdpQI+6ETtZwKCA6oX3/j20D1AuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723745947; c=relaxed/simple;
	bh=9fEZXnYltoZ4VmIqPGV6rprk+HckacpgMGVj0vBGcq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3+h3D/gxyOYOfBlerw8Bv5UOdjGZxWFNmiwvhEFYB+85D8dCwLb+t4ZXqtHNf6Z4/ngetLJYwpixsqBO+OAZ/9bFX4QM+f68wX4tA7pnaWrCQJGLWSyla77HjTrTaCB8IakGvK2pBZvIhi0ToGiuX10OBpX4RxX5gIUlBQj8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blWLzSOO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blWLzSOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723745945; x=1755281945;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9fEZXnYltoZ4VmIqPGV6rprk+HckacpgMGVj0vBGcq8=;
  b=blWLzSOOhFMVIKONonaiCwsxOliIVsWkbaGpdUt4FL4Cdec6QN0zhD7a
   c7MJqYCN554ZIEiP2lboJd/gZJUi9z+cJkwZrrPzNwh0t4/xhp7LW1Rqu
   pVnr+b2c6ggaL8QH9GoWGm5I/6IJvvUvNqO8eM+s5RRh2+pt7l9SbRlT5
   liGrdK9c4jlPpLvffO6BgEa4jn5JlABnARCdxhcbypbBNWuJFj+k/B0ta
   1spCS2JEyq/EoOa7zQCJJd0DlUW6MxGQYls2FI28JwavvdybQ3axw0nPr
   peEheSiRSiOToGs8a3meFEMGHU5VINoKoGEZNjQNvgVRH5OVPoMX0P4NM
   w==;
X-CSE-ConnectionGUID: EV1/se1CQ269qQWh3MVPAQ==
X-CSE-MsgGUID: FojCp7rbQ8amDUay24Oong==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33432474"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="33432474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 11:19:04 -0700
X-CSE-ConnectionGUID: Kn60brVFTwmbZSTOZk6yQQ==
X-CSE-MsgGUID: iBTGK79PTeG2GCdZ6Gb4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="64278244"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2024 11:19:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sef3s-0004me-1r;
	Thu, 15 Aug 2024 18:19:00 +0000
Date: Fri, 16 Aug 2024 02:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4567/4951]
 drivers/misc/xilinx_tmr_inject.c:69:43: error: expected ')' before '(' token
Message-ID: <202408160254.7w492KEu-lkp@intel.com>
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
head:   edd1ec2e3a9f5de7fb267a3af73e4f00e7e052b7
commit: 2771559a553119011ed3231ea68a2919565a1de7 [4567/4951] fault-inject: improve build for CONFIG_FAULT_INJECTION=n
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240816/202408160254.7w492KEu-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160254.7w492KEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160254.7w492KEu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/misc/xilinx_tmr_inject.c:69:43: error: expected ')' before '(' token
      69 | DEFINE_DEBUGFS_ATTRIBUTE(xtmr_inject_fops, NULL, xtmr_inject_set, "%llu\n");
         |                                           ^
         |                                           )
   drivers/misc/xilinx_tmr_inject.c: In function 'xtmr_init_debugfs':
>> drivers/misc/xilinx_tmr_inject.c:75:22: error: implicit declaration of function 'debugfs_create_dir'; did you mean 'kernfs_create_dir'? [-Wimplicit-function-declaration]
      75 |         dbgfs_root = debugfs_create_dir("xtmr_inject", NULL);
         |                      ^~~~~~~~~~~~~~~~~~
         |                      kernfs_create_dir
>> drivers/misc/xilinx_tmr_inject.c:75:20: error: assignment to 'struct dentry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      75 |         dbgfs_root = debugfs_create_dir("xtmr_inject", NULL);
         |                    ^
>> drivers/misc/xilinx_tmr_inject.c:78:9: error: implicit declaration of function 'debugfs_create_file'; did you mean 'bus_create_file'? [-Wimplicit-function-declaration]
      78 |         debugfs_create_file("inject_fault", 0200, dir, NULL,
         |         ^~~~~~~~~~~~~~~~~~~
         |         bus_create_file
>> drivers/misc/xilinx_tmr_inject.c:79:30: error: 'xtmr_inject_fops' undeclared (first use in this function); did you mean 'xtmr_inject_set'?
      79 |                             &xtmr_inject_fops);
         |                              ^~~~~~~~~~~~~~~~
         |                              xtmr_inject_set
   drivers/misc/xilinx_tmr_inject.c:79:30: note: each undeclared identifier is reported only once for each function it appears in
   drivers/misc/xilinx_tmr_inject.c: In function 'xtmr_inject_remove':
>> drivers/misc/xilinx_tmr_inject.c:148:9: error: implicit declaration of function 'debugfs_remove_recursive' [-Wimplicit-function-declaration]
     148 |         debugfs_remove_recursive(dbgfs_root);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/xilinx_tmr_inject.c: At top level:
>> drivers/misc/xilinx_tmr_inject.c:61:12: warning: 'xtmr_inject_set' defined but not used [-Wunused-function]
      61 | static int xtmr_inject_set(void *data, u64 val)
         |            ^~~~~~~~~~~~~~~


vim +69 drivers/misc/xilinx_tmr_inject.c

895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   60  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  @61  static int xtmr_inject_set(void *data, u64 val)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   62  {
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   63  	if (val != 1)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   64  		return -EINVAL;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   65  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   66  	xmb_inject_err();
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   67  	return 0;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   68  }
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  @69  DEFINE_DEBUGFS_ATTRIBUTE(xtmr_inject_fops, NULL, xtmr_inject_set, "%llu\n");
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   70  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   71  static void xtmr_init_debugfs(struct xtmr_inject_dev *xtmr_inject)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   72  {
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   73  	struct dentry *dir;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   74  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  @75  	dbgfs_root = debugfs_create_dir("xtmr_inject", NULL);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   76  	dir = fault_create_debugfs_attr("inject_fault", dbgfs_root,
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   77  					&inject_fault);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  @78  	debugfs_create_file("inject_fault", 0200, dir, NULL,
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  @79  			    &xtmr_inject_fops);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   80  }
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   81  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   82  static void xtmr_inject_init(struct xtmr_inject_dev *xtmr_inject)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   83  {
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   84  	u32 cr_val;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   85  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   86  	if (inject_request)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   87  		setup_fault_attr(&inject_fault, inject_request);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   88  	/* Allow fault injection */
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   89  	cr_val = xtmr_inject->magic |
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   90  		 (1 << XTMR_INJECT_CR_IE_SHIFT) |
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   91  		 (1 << XTMR_INJECT_CR_CPUID_SHIFT);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   92  	xtmr_inject_write(xtmr_inject, XTMR_INJECT_CR_OFFSET,
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   93  			  cr_val);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   94  	/* Initialize the address inject and instruction inject registers */
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   95  	xtmr_inject_write(xtmr_inject, XTMR_INJECT_AIR_OFFSET,
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   96  			  XMB_INJECT_ERR_OFFSET);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   97  	xtmr_inject_write(xtmr_inject, XTMR_INJECT_IIR_OFFSET,
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   98  			  XMB_INJECT_ERR_OFFSET & XTMR_INJECT_IIR_ADDR_MASK);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   99  }
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  100  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  101  /**
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  102   * xtmr_inject_probe - Driver probe function
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  103   * @pdev: Pointer to the platform_device structure
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  104   *
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  105   * This is the driver probe routine. It does all the memory
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  106   * allocation for the device.
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  107   *
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  108   * Return: 0 on success and failure value on error
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  109   */
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  110  static int xtmr_inject_probe(struct platform_device *pdev)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  111  {
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  112  	struct xtmr_inject_dev *xtmr_inject;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  113  	int err;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  114  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  115  	xtmr_inject = devm_kzalloc(&pdev->dev, sizeof(*xtmr_inject),
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  116  				   GFP_KERNEL);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  117  	if (!xtmr_inject)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  118  		return -ENOMEM;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  119  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  120  	xtmr_inject->regs = devm_platform_ioremap_resource(pdev, 0);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  121  	if (IS_ERR(xtmr_inject->regs))
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  122  		return PTR_ERR(xtmr_inject->regs);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  123  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  124  	err = of_property_read_u32(pdev->dev.of_node, "xlnx,magic",
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  125  				   &xtmr_inject->magic);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  126  	if (err < 0) {
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  127  		dev_err(&pdev->dev, "unable to read xlnx,magic property");
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  128  		return err;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  129  	}
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  130  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  131  	if (xtmr_inject->magic > XTMR_INJECT_MAGIC_MAX_VAL) {
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  132  		dev_err(&pdev->dev, "invalid xlnx,magic property value");
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  133  		return -EINVAL;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  134  	}
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  135  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  136  	/* Initialize TMR Inject */
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  137  	xtmr_inject_init(xtmr_inject);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  138  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  139  	xtmr_init_debugfs(xtmr_inject);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  140  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  141  	platform_set_drvdata(pdev, xtmr_inject);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  142  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  143  	return 0;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  144  }
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  145  
37efe116bea197 Uwe Kleine-König             2024-02-21  146  static void xtmr_inject_remove(struct platform_device *pdev)
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  147  {
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25 @148  	debugfs_remove_recursive(dbgfs_root);
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  149  	dbgfs_root = NULL;
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  150  }
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25  151  

:::::: The code at line 69 was first introduced by commit
:::::: 895ae5bee159d148bac21a82899292c408c1aab1 drivers: misc: Add Support for TMR Inject IP

:::::: TO: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
