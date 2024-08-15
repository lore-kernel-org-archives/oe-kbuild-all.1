Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC3280B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 19:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723750285; cv=none; b=uD5DgG6QWbPdd8zIubWeA56StCCtbE1gv+hUXuMJ3Oi7JRBCuC5ZYu6Tv9AAjvB6kx8HlS+luGtc58Weltaw4xS30XwMk2NKZplt7A0P2Og4l/hf10jsWta+nwGKjxojawagS6gzmtm5BAzE9Q66h8xyRlCLAqiN21slRkKP5L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723750285; c=relaxed/simple;
	bh=s2dmWoXAd4R8NdGgkMXZgqEGnyTuwiebz23KS/sB2u0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2NPl+QQcC5owJqRdrR2c7p7XR/R4L+cQlUe/p+btGbeE558mU0fTViT2gCa+bwLtH4e9TR2PV8K6IMI6eIXZ77epM4E+QFebYFY9mvOMDpJsmaBekv7IJAmoWtzizXeMNtoIc/uuq33ohSLqb73mmy78zZHAlewhhVmq2NFgds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6u11+a0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6u11+a0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723750283; x=1755286283;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s2dmWoXAd4R8NdGgkMXZgqEGnyTuwiebz23KS/sB2u0=;
  b=f6u11+a09M5MrG4ma7K+G2OLmdtszHtxN5MbTz/StMS/Pu5gjrrhJRZI
   2KVDJVRtRVv16awpvmyw6ICysAhqHeBTD6d2az7iWu9kxhYLYJS9W/QGa
   HDNWh7kr2wDxriQToqeAcNULeO58BsSHIUCAC+kiNXpVl+agHZal3XqwA
   2bMa0970BbqBICA414SLELzff/H6PE6B65kmHmOB1EPiQfCOc30/NAy7P
   BlyoL4HngUeHIzOsQ8HKMy8CZpQORQlN+aX83jwFx6LnZ8LmdvXvzJnw7
   WSmcR3HF/cibGUIRQZMHT/KtFXi5LXppAtqmVeTGYIqb6aovyoR25VNRJ
   g==;
X-CSE-ConnectionGUID: o+Of7o5MRFCaG7Q//fAHyw==
X-CSE-MsgGUID: BqoL4zKCSOmhN22/gRj0gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32701227"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="32701227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 12:31:22 -0700
X-CSE-ConnectionGUID: SYrY3dvdQuek/7Lk2nwE/Q==
X-CSE-MsgGUID: F7Gr6bGvQZC2mCY6repVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59473509"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2024 12:31:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1segBq-0005Ws-0s;
	Thu, 15 Aug 2024 19:31:18 +0000
Date: Fri, 16 Aug 2024 03:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 72/77]
 drivers/misc/xilinx_tmr_inject.c:69:43: error: expected ')' before '(' token
Message-ID: <202408160354.tNccwtd6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   7f96efa821e5d0d5e7f8bc5321c7b9c4e198f703
commit: 269f874aa748a88815ee625626a3cc1065b658aa [72/77] fault-inject: improve build for CONFIG_FAULT_INJECTION=n
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240816/202408160354.tNccwtd6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160354.tNccwtd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160354.tNccwtd6-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/misc/xilinx_tmr_inject.c:61:12: warning: 'xtmr_inject_set' defined but not used [-Wunused-function]
      61 | static int xtmr_inject_set(void *data, u64 val)
         |            ^~~~~~~~~~~~~~~


vim +69 drivers/misc/xilinx_tmr_inject.c

895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   60  
895ae5bee159d1 Appana Durga Kedareswara rao 2022-11-25   61  static int xtmr_inject_set(void *data, u64 val)
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
