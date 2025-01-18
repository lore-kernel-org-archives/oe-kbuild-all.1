Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9EB13D52E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737184058; cv=none; b=DUD/9xzyHAeFOJdGaH70S1rjeRlvjzNTnEO49RJkCjs8jbDh7RPs3SzcoNcxDPWgCbO5XSaVeVzHH+pMxC0Wqr5XZae+xX2hgoMK4Isgb1vetI3EwFhO7b8rYnO3Fj4UerhY2Y0XbR7G/g2jf4RqFCRKR4z3EeI8s7b2JLRmTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737184058; c=relaxed/simple;
	bh=nOq2FeL7R/5QsX7l7xwMPS6agqaQtIX3IDCEiEMBams=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pL9JCEPTWd4rwL0DRF6D7ncjhoIqkvQToyhT/hxUWM/C9oY/Ax8Bl/mVlTaN09EiUSjZ8avjK/+zbHo7Up841zat6HdXrzaGbNo9LpeG0EYyX9ViSxlkgX9atns1nnmvtxZCVU0YbWhb4K6J6P3aY/vz6jISBIYjyMSsBw32FWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5PvzBjW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5PvzBjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737184057; x=1768720057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nOq2FeL7R/5QsX7l7xwMPS6agqaQtIX3IDCEiEMBams=;
  b=I5PvzBjWur8jSweKK9Q1Xbn/1K+1tCxkgdDyN6nMIt6Wf5AqkrsKzjww
   o7p2pSCmnCVMSYafuAXDli0Jf3RUw8f/Lhncb+pjtlKD2hVsZqGBZpnvO
   5vucONA4klGSXcTpFOlUOjvq1ICaf7L3JaNMErZaNHHNe8J8Jbr3JKgaG
   m/iP73FWzLes634L2KdbpZJSqnI6eSmMJzZBvrvWQwgNhGBuPe1C9Zz8x
   9FaVEVW0IyiEvTFcye8Mw1oI/vHSLFIgeFyViDURW5+mYgzVcSNwDfCDW
   UyKB+2dXEZhqZNCYJD5xzSxCpvvHIyfF0cGHWGChfhdvI2oSyeKw3jodO
   w==;
X-CSE-ConnectionGUID: OubSPvZ8Ts+G6zi6zn3dDQ==
X-CSE-MsgGUID: sMfspzreR3qNjfUs1U3mdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48618468"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="48618468"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 23:07:36 -0800
X-CSE-ConnectionGUID: ItLGCS2kQSedYpoFULTDyw==
X-CSE-MsgGUID: J+VQIMdKRUSaWYqL+etg9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="106606552"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2025 23:07:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ2vc-000UBL-26;
	Sat, 18 Jan 2025 07:07:32 +0000
Date: Sat, 18 Jan 2025 15:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 25/25] drivers/media/i2c/ar0234.c:507:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202501181527.VStDgPWf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   e5247e8df469b81bea0d59bde9faf0e99e3bb259
commit: e45b26aff9ad81fcab4d449cc192f6735d2f71ec [25/25] driver: media: i2c: remove useless header file
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501181527.VStDgPWf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181527.VStDgPWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181527.VStDgPWf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ar0234.c:4:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/ar0234.c:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/media/i2c/ar0234.c:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/media/i2c/ar0234.c:12:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/media/i2c/ar0234.c:507:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     507 |                 u64 reg;
         |                 ^
   16 warnings generated.


vim +507 drivers/media/i2c/ar0234.c

f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  454  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  455  static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  456  {
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  457  	struct ar0234 *ar0234 =
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  458  		container_of(ctrl->handler, struct ar0234, ctrl_handler);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  459  	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  460  	s64 exposure_max, exposure_def;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  461  	struct v4l2_subdev_state *state;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  462  	const struct v4l2_mbus_framefmt *format;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  463  	int ret;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  464  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  465  	state = v4l2_subdev_get_locked_active_state(&ar0234->sd);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  466  	format = v4l2_subdev_state_get_format(state, 0);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  467  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  468  	/* Propagate change of current control to all related controls */
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  469  	if (ctrl->id == V4L2_CID_VBLANK) {
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  470  		/* Update max exposure while meeting expected vblanking */
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  471  		exposure_max = format->height + ctrl->val -
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  472  			       AR0234_EXPOSURE_MAX_MARGIN;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  473  		exposure_def = format->height - AR0234_EXPOSURE_MAX_MARGIN;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  474  		__v4l2_ctrl_modify_range(ar0234->exposure,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  475  					 ar0234->exposure->minimum,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  476  					 exposure_max, ar0234->exposure->step,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  477  					 exposure_def);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  478  	}
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  479  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  480  	/* V4L2 controls values will be applied only when power is already up */
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  481  	if (!pm_runtime_get_if_in_use(&client->dev))
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  482  		return 0;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  483  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  484  	switch (ctrl->id) {
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  485  	case V4L2_CID_ANALOGUE_GAIN:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  486  		ret = cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  487  				ctrl->val, NULL);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  488  		break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  489  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  490  	case V4L2_CID_DIGITAL_GAIN:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  491  		ret = cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  492  				ctrl->val, NULL);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  493  		break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  494  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  495  	case V4L2_CID_EXPOSURE:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  496  		ret = cci_write(ar0234->regmap, AR0234_REG_EXPOSURE,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  497  				ctrl->val, NULL);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  498  		break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  499  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  500  	case V4L2_CID_VBLANK:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  501  		ret = cci_write(ar0234->regmap, AR0234_REG_VTS,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  502  				ar0234->cur_mode->height + ctrl->val, NULL);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  503  		break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  504  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  505  	case V4L2_CID_HFLIP:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  506  	case V4L2_CID_VFLIP:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06 @507  		u64 reg;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  508  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  509  		ret = cci_read(ar0234->regmap, AR0234_REG_ORIENTATION,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  510  			       &reg, NULL);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  511  		if (ret)
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  512  			break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  513  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  514  		reg &= ~(AR0234_ORIENTATION_HFLIP |
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  515  			 AR0234_ORIENTATION_VFLIP);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  516  		if (ar0234->hflip->val)
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  517  			reg |= AR0234_ORIENTATION_HFLIP;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  518  		if (ar0234->vflip->val)
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  519  			reg |= AR0234_ORIENTATION_VFLIP;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  520  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  521  		ret = cci_write(ar0234->regmap, AR0234_REG_ORIENTATION,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  522  				reg, NULL);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  523  		break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  524  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  525  	case V4L2_CID_TEST_PATTERN:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  526  		ret = cci_write(ar0234->regmap, AR0234_REG_TEST_PATTERN,
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  527  				ar0234_test_pattern_val[ctrl->val], NULL);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  528  		break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  529  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  530  	default:
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  531  		ret = -EINVAL;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  532  		break;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  533  	}
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  534  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  535  	pm_runtime_put(&client->dev);
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  536  
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  537  	return ret;
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  538  }
f1d1d3f60e98a5 Dongcheng Yan 2024-06-06  539  

:::::: The code at line 507 was first introduced by commit
:::::: f1d1d3f60e98a58638add566fc500d7ffd9265e8 media: i2c: Add ar0234 camera sensor driver

:::::: TO: Dongcheng Yan <dongcheng.yan@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
