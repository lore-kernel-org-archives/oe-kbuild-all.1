Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD172F8E84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343151; cv=none; b=duNAtNaXZxJmUW7cbEsVyymuS8UpKEnTjEpS+WuOXEUQ8X+TVxRBsTD0yKBzjBle4z8UX3qPwV5PhMmVt7l0K9quv8c2SYXjSoL3PkQuXoatA8ExHMGErAm0GXcEIzPeSBhb3MYH8qbPMXvqBVDKPSDK/jWJUwY0zaZcHcV7/lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343151; c=relaxed/simple;
	bh=wTuTV1kVEJ+qGwHor6mfQNVc+H1vD4SVG9RC5k6o2T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cxtAr7ofGAFpIzp1psi6rcorA+BrD5hVnwIZ2WEp+HAGS0hRJ8JXw9l26caBYpZsSB9De6jzds423iYFjkbvB6c4lyONMLeSu8hrsZnVESqmYUBWMWzGHW/45pSBNNcZR5dEJNVCFEl6d3UVVQC4cGZiyvYwbvitfOmEnx06yyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CN4xuC/H; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CN4xuC/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781343149; x=1812879149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTuTV1kVEJ+qGwHor6mfQNVc+H1vD4SVG9RC5k6o2T8=;
  b=CN4xuC/HA3vSBSna4T5s1jyk1PC4UCbY4UEJMj8nHX2kpaiszDGcaV8f
   PVXVdutYlDzbWcDVLXNoqT74RKMuYwHtNwFbThNMqyVJnbVD+qp90wnIE
   PgbcfsphygQb6BwwQwcvkneBtZz0eyymBkfkACR2s4Y+xzyqNmQ0uVqNj
   bW2mgYItZed/se9cUsY6031rv36Cmxme7Vniw83/W4EXspRkvmg3/UCJ3
   1fEf0Dw4CUKuYay3wcsZHJwWSdoynZs0MaERB9U2BJujlN/Fy98cBWETU
   At4WKKPQgpidhx3PEdsmuRqtzgtzZYof2zlObRgFsogIbyIwQ4mBBZQeQ
   A==;
X-CSE-ConnectionGUID: dGEg26ncTtuX+miAW9NG2A==
X-CSE-MsgGUID: Xsy4r+BQQiuL5IzsTndpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92839279"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="92839279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 02:32:28 -0700
X-CSE-ConnectionGUID: gwhHd01XSS+zPlCXHS+j+g==
X-CSE-MsgGUID: m9O3C/jQSiKprAiOr7aKjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="246129841"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2026 02:32:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYKj0-00000000Ppu-2zzo;
	Sat, 13 Jun 2026 09:32:22 +0000
Date: Sat, 13 Jun 2026 17:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>,
 "Nuno =?utf-8?Q?S=C3=A1"?= <nuno.sa@analog.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 19282/27391]
 drivers/iio/jesd204/axi_jesd204b_v51.c:250:31: warning: cast from pointer to
 integer of different size
Message-ID: <202606131758.MZDs0r2L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Nuno,

First bad commit (maybe != root cause):

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 67d89797e6b7e313f93f3683f7dd0479895ee9b0 [19282/27391] Merge tag 'xilinx-v2021.1' of https://github.com/Xilinx/linux-xlnx.git
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260613/202606131758.MZDs0r2L-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131758.MZDs0r2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131758.MZDs0r2L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/jesd204/axi_jesd204b_v51.c: In function 'jesd204b_probe':
>> drivers/iio/jesd204/axi_jesd204b_v51.c:250:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     250 |                 st->vers_id = (unsigned) of_id->data;
         |                               ^
--
   drivers/iio/jesd204/axi_jesd204b_gt.c: In function 'jesd204b_gt_probe':
>> drivers/iio/jesd204/axi_jesd204b_gt.c:1019:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1019 |                 st->vers_id = (unsigned) of_id->data;
         |                               ^
--
   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/iio/jesd204/altera_adxcvr.c:14:
   drivers/iio/jesd204/altera_adxcvr.c: In function 'adxcvr_probe':
>> drivers/iio/jesd204/altera_adxcvr.c:563:37: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
     563 |                 dev_err(&pdev->dev, "Only up to %d lanes supported.\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/iio/jesd204/altera_adxcvr.c:563:17: note: in expansion of macro 'dev_err'
     563 |                 dev_err(&pdev->dev, "Only up to %d lanes supported.\n",
         |                 ^~~~~~~
   drivers/iio/jesd204/altera_adxcvr.c:563:50: note: format string is defined here
     563 |                 dev_err(&pdev->dev, "Only up to %d lanes supported.\n",
         |                                                 ~^
         |                                                  |
         |                                                  int
         |                                                 %ld

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_DSA
   Depends on [n]: NET [=y] && HAVE_NET_DSA [=n] && (BRIDGE [=y] || BRIDGE [=y]=n)
   Selected by [y]:
   - KERNEL_ALL_ADI_DRIVERS [=y]
   WARNING: unmet direct dependencies detected for USB_OTG
   Depends on [n]: USB_SUPPORT [=y] && USB [=y] && PM
   Selected by [y]:
   - USB_ALL_ADI_DRIVERS [=y]
   WARNING: unmet direct dependencies detected for ADXL345_I2C
   Depends on [n]: IIO [=y] && INPUT_ADXL34X [=y]=n && I2C [=y]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=y] && I2C [=y]
   WARNING: unmet direct dependencies detected for ADXL345_SPI
   Depends on [n]: IIO [=y] && INPUT_ADXL34X [=y]=n && SPI [=y]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=y] && SPI [=y]


vim +250 drivers/iio/jesd204/axi_jesd204b_v51.c

cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  213  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  214  static int jesd204b_probe(struct platform_device *pdev)
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  215  {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  216  	struct jesd204b_state *st;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  217  	struct resource *mem; /* IO mem resources */
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  218  	struct clk *clk;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  219  	struct clk_init_data init;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  220  	const char *parent_name;
2c78740bf3a40d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-12-05  221  	const char *clk_name;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  222  	struct clk *clk_out;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  223  	unsigned frmcnt, bytecnt, subclass, val;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  224  	int ret;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  225  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  226  	const struct of_device_id *of_id =
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  227  			of_match_device(jesd204b_of_match, &pdev->dev);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  228  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  229  	clk = devm_clk_get(&pdev->dev, NULL);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  230  	if (IS_ERR(clk)) {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  231  		return -EPROBE_DEFER;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  232  	}
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  233  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  234  	st = devm_kzalloc(&pdev->dev, sizeof(*st), GFP_KERNEL);
9276cb4316031a drivers/iio/adc/cf_axi_jesd204b_v51.c  Lars-Peter Clausen 2017-06-08  235  	if (!st)
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  236  		return -ENOMEM;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  237  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  238  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  239  	st->regs = devm_ioremap_resource(&pdev->dev, mem);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  240  	if (IS_ERR(st->regs))
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  241  		return PTR_ERR(st->regs);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  242  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  243  	st->dev = &pdev->dev;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  244  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  245  	platform_set_drvdata(pdev, st);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  246  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  247  	st->clk = clk;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  248  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  249  	if (of_id && of_id->data)
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21 @250  		st->vers_id = (unsigned) of_id->data;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  251  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  252  	ret = of_property_read_u32(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  253  				   "xlnx,frames-per-multiframe", &frmcnt);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  254  	if (ret) {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  255  		dev_err(&pdev->dev, "Failed to read required dt property\n");
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  256  		return ret;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  257  	}
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  258  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  259  	ret = of_property_read_u32(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  260  				   "xlnx,bytes-per-frame", &bytecnt);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  261  	if (ret) {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  262  		dev_err(&pdev->dev, "Failed to read required dt property\n");
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  263  		return ret;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  264  	}
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  265  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  266  	ret = of_property_read_u32(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  267  				   "xlnx,subclass", &subclass);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  268  	if (ret) {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  269  		dev_err(&pdev->dev, "Failed to read required dt property\n");
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  270  		return ret;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  271  	}
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  272  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  273  	of_property_read_u32(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  274  			"xlnx,node-is-transmit", &st->transmit);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  275  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  276  	ret = of_property_read_u32(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  277  			"xlnx,lanes", &st->lanes);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  278  	if (ret)
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  279  		st->lanes = jesd204b_read(st, XLNX_JESD204_REG_LANES) + 1;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  280  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  281  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  282  	jesd204b_write(st, XLNX_JESD204_REG_RESET,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  283  		       XLNX_JESD204_RESET);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  284  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  285  	jesd204b_write(st, XLNX_JESD204_REG_ILA_CTRL,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  286  		       (of_property_read_bool(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  287  			"xlnx,lanesync-enable") ? XLNX_JESD204_ILA_EN : 0));
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  288  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  289  	jesd204b_write(st, XLNX_JESD204_REG_SCR_CTRL,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  290  		       (of_property_read_bool(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  291  			"xlnx,scramble-enable") ? XLNX_JESD204_SCR_EN : 0));
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  292  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  293  	jesd204b_write(st, XLNX_JESD204_REG_SYSREF_CTRL,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  294  		       (of_property_read_bool(pdev->dev.of_node,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  295  			"xlnx,sysref-always-enable") ? XLNX_JESD204_ALWAYS_SYSREF_EN : 0));
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  296  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  297  	jesd204b_write(st, XLNX_JESD204_REG_ILA_MFC,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  298  		       XLNX_JESD204_ILA_MFC(frmcnt));
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  299  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  300  	jesd204b_write(st, XLNX_JESD204_REG_OCTETS_PER_FRAME,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  301  		       XLNX_JESD204_OCTETS_PER_FRAME(bytecnt));
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  302  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  303  	jesd204b_write(st, XLNX_JESD204_REG_FRAMES_PER_MFRAME,
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  304  		       XLNX_JESD204_FRAMES_PER_MFRAME(frmcnt));
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  305  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  306  	jesd204b_write(st, XLNX_JESD204_REG_SUBCLASS, subclass);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  307  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  308  	device_create_file(&pdev->dev, &dev_attr_reg_access);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  309  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  310  	switch (st->lanes) {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  311  	case 8:
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  312  		device_create_file(&pdev->dev, &dev_attr_lane4_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  313  		device_create_file(&pdev->dev, &dev_attr_lane5_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  314  		device_create_file(&pdev->dev, &dev_attr_lane6_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  315  		device_create_file(&pdev->dev, &dev_attr_lane7_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  316  		if (!st->transmit) {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  317  			device_create_file(&pdev->dev, &dev_attr_lane4_syncstat);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  318  			device_create_file(&pdev->dev, &dev_attr_lane5_syncstat);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  319  			device_create_file(&pdev->dev, &dev_attr_lane6_syncstat);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  320  			device_create_file(&pdev->dev, &dev_attr_lane7_syncstat);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  321  		}
6e819d49c1b8b1 drivers/iio/jesd204/axi_jesd204b_v51.c Alexandru Ardelean 2019-10-29  322  		/* fall-through */
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  323  	case 4:
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  324  		device_create_file(&pdev->dev, &dev_attr_lane2_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  325  		device_create_file(&pdev->dev, &dev_attr_lane3_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  326  		if (!st->transmit) {
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  327  			device_create_file(&pdev->dev, &dev_attr_lane2_syncstat);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  328  			device_create_file(&pdev->dev, &dev_attr_lane3_syncstat);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  329  		}
6e819d49c1b8b1 drivers/iio/jesd204/axi_jesd204b_v51.c Alexandru Ardelean 2019-10-29  330  		/* fall-through */
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  331  	case 2:
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  332  		device_create_file(&pdev->dev, &dev_attr_lane1_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  333  		if (!st->transmit)
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  334  			device_create_file(&pdev->dev, &dev_attr_lane1_syncstat);
6e819d49c1b8b1 drivers/iio/jesd204/axi_jesd204b_v51.c Alexandru Ardelean 2019-10-29  335  		/* fall-through */
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  336  	case 1:
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  337  		device_create_file(&pdev->dev, &dev_attr_lane0_info);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  338  		if (!st->transmit)
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  339  			device_create_file(&pdev->dev, &dev_attr_lane0_syncstat);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  340  		break;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  341  	default:
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  342  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  343  		break;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  344  	}
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  345  
2c78740bf3a40d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-12-05  346  	ret = of_property_read_string(pdev->dev.of_node, "clock-output-names",
2c78740bf3a40d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-12-05  347  		&clk_name);
2c78740bf3a40d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-12-05  348  	if (ret < 0)
2c78740bf3a40d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-12-05  349  		return ret;
2c78740bf3a40d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-12-05  350  
2c78740bf3a40d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-12-05  351  	init.name = clk_name;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  352  	init.ops = &clkout_ops;
669d32d6205dbd drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2016-05-20  353  	init.flags = CLK_SET_RATE_PARENT;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  354  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  355  	parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  356  	init.parent_names = &parent_name;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  357  	init.num_parents = 1;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  358  
6aaeacbf9e9575 drivers/iio/adc/cf_axi_jesd204b_v51.c  Lars-Peter Clausen 2017-06-07  359  	st->dummy_clk.init = &init;
6aaeacbf9e9575 drivers/iio/adc/cf_axi_jesd204b_v51.c  Lars-Peter Clausen 2017-06-07  360  
6aaeacbf9e9575 drivers/iio/adc/cf_axi_jesd204b_v51.c  Lars-Peter Clausen 2017-06-07  361  	clk_out = clk_register(&pdev->dev, &st->dummy_clk);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  362  	if (IS_ERR(clk_out))
6aaeacbf9e9575 drivers/iio/adc/cf_axi_jesd204b_v51.c  Lars-Peter Clausen 2017-06-07  363  		return PTR_ERR(clk_out);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  364  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  365  	of_clk_add_provider(pdev->dev.of_node, of_clk_src_simple_get, clk_out);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  366  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  367  	val = jesd204b_read(st, XLNX_JESD204_REG_VERSION);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  368  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  369  	dev_info(&pdev->dev, "AXI-JESD204B %d.%d Rev %d, at 0x%08llX mapped to 0x%p,",
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  370  		 XLNX_JESD204_VERSION_MAJOR(val),
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  371  		 XLNX_JESD204_VERSION_MINOR(val),
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  372  		 XLNX_JESD204_VERSION_REV(val),
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  373  		 (unsigned long long)mem->start, st->regs);
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  374  
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  375  	return 0;
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  376  }
cce1d807c5d24d drivers/iio/adc/cf_axi_jesd204b_v51.c  Michael Hennerich  2014-05-21  377  

:::::: The code at line 250 was first introduced by commit
:::::: cce1d807c5d24de99c3a6ca212081d852da136f8 cf_axi_jesd204b_v51: Add Platform Device Driver Xilinx LogiCORE IP JESD204 v5.1

:::::: TO: Michael Hennerich <michael.hennerich@analog.com>
:::::: CC: Michael Hennerich <michael.hennerich@analog.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
