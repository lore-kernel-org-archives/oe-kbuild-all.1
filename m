Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7F15FA7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737187185; cv=none; b=sXqKbc9fGvfD26q9nm292Gzk/vytvQwrPvhM2JqTZoyHRrMwr73f64QavOI8Pc3Gm226dzQBHUPn6ev3lXuOrw39obRtT4sSc6yVOoz/x+6QmdDy0DNtKDzDEDbBGG7qibMPgjELL3AZF+BoonWVhq7yHEHbPP7p2Vy1iEGJ744=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737187185; c=relaxed/simple;
	bh=8/MJAcAZb7yabWbXg9zIi/6EmjXI/v92TQpTqrc3QoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bWBzQw30Pim5FYX03/v+eSQ5IUD1qA9y0W0q5R7YBtA45upTvLsmJqUN6GuBThIEOneXQk7tEP23dGercrVvOKiTDfhaXKosiRkbbWilHGbFKDCROU0HU0tykKcrdlvvLAZSCNxv/wnpvymZdt37dEIq3nmx+bycjmYh+/NrBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWwzwTj2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWwzwTj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737187184; x=1768723184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/MJAcAZb7yabWbXg9zIi/6EmjXI/v92TQpTqrc3QoI=;
  b=NWwzwTj2qEce6B2S6hDn55CaS9M+/QeRHeA9bG9UdzVIy4uKzhFCEj3D
   4DEmJspufIBzL1ALesdhbKdhMUspDQ6f8xcCc4G4oY+mjCYjV7IxAAj9L
   GLP0OtsjHNrLl97uGSDUmvDFB9IJn+J1aNd89G+l79AdwktIlgzUj4sb5
   wN6GE1QiVSYNBliBmT62RuuUn8jR/+QzaCGqydQsTJzpnpUaPLER8gY42
   wYeYCjaz7a5D2kdtQ+U8fAk1n6kb+oZ3mwMQpa4heDaFWyyTuune//BOP
   yniYwd47jej9rwxXNnFiOZKYBRIYcWLI3YlFtpELcNPUCeq/Mx8ys08yZ
   A==;
X-CSE-ConnectionGUID: +ME/9X0WR8OzF84AayMh6g==
X-CSE-MsgGUID: w/eHJe67TxW8GFUQ/tXQew==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49041046"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49041046"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 23:59:40 -0800
X-CSE-ConnectionGUID: iiD/NPZYQAu6KVSk6y0/Xg==
X-CSE-MsgGUID: mg3IZdPYS8WPugIH8AKcHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136914417"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2025 23:59:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ3k0-000UCV-2j;
	Sat, 18 Jan 2025 07:59:36 +0000
Date: Sat, 18 Jan 2025 15:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: linya14x <linx.yang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 25/25] drivers/media/i2c/lt6911uxc.c:260:30:
 warning: variable 'fps' is uninitialized when used here
Message-ID: <202501181551.bsDG7IhK-lkp@intel.com>
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
commit: 72072f25fc41b9733ada1e6fac144bf5abbf3417 [25/25] media: i2c: add lt6911uxc driver and enable in ipu-bridge
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501181551.bsDG7IhK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181551.bsDG7IhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181551.bsDG7IhK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/lt6911uxc.c:4:
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
   In file included from drivers/media/i2c/lt6911uxc.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/media/i2c/lt6911uxc.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/media/i2c/lt6911uxc.c:12:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
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
>> drivers/media/i2c/lt6911uxc.c:260:30: warning: variable 'fps' is uninitialized when used here [-Wuninitialized]
     260 |                 lt6911uxc->cur_mode->fps = fps;
         |                                            ^~~
   drivers/media/i2c/lt6911uxc.c:193:33: note: initialize the variable 'fps' to silence this warning
     193 |         u64 pixel_clk, is_hdmi_2_0, fps, lanes;
         |                                        ^
         |                                         = 0
   drivers/media/i2c/lt6911uxc.c:166:12: warning: unused function 'lt6911uxc_get_audio_sampling_rate' [-Wunused-function]
     166 | static int lt6911uxc_get_audio_sampling_rate(struct lt6911uxc *lt6911uxc)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   17 warnings generated.


vim +/fps +260 drivers/media/i2c/lt6911uxc.c

   187	
   188	static int lt6911uxc_status_update(struct lt6911uxc *lt6911uxc)
   189	{
   190		u64 int_event;
   191		u64 byte_clock;
   192		u64 tmds_clk;
   193		u64 pixel_clk, is_hdmi_2_0, fps, lanes;
   194		u64 htotal, vtotal, half_width, height;
   195	
   196		struct i2c_client *client = v4l2_get_subdevdata(&lt6911uxc->sd);
   197	
   198		cci_write(lt6911uxc->regmap, REG_ENABLE_I2C, 0x1, NULL);
   199		cci_write(lt6911uxc->regmap, REG_DISABLE_WD, 0x0, NULL);
   200		/* Read interrupt event */
   201		cci_read(lt6911uxc->regmap, REG_INT_HDMI, &int_event, NULL);
   202		switch (int_event) {
   203		case INT_HDMI_STABLE:
   204			dev_info(&client->dev, "Video signal stable\n");
   205	
   206			cci_write(lt6911uxc->regmap, REG_AD_HALF_PCLK, 0x1B, NULL);
   207			usleep_range(10000, 10100);
   208	
   209			cci_read(lt6911uxc->regmap, REG_BYTE_CLK, &byte_clock, NULL);
   210			byte_clock = (byte_clock & MASK_FMI_FREQ2) * 1000;
   211	
   212			cci_read(lt6911uxc->regmap, REG_PIX_CLK, &tmds_clk, NULL);
   213			tmds_clk = tmds_clk & MASK_FMI_FREQ2;
   214	
   215			cci_read(lt6911uxc->regmap, REG_BKB0_A2_REG, &is_hdmi_2_0, NULL);
   216			is_hdmi_2_0 = is_hdmi_2_0 & (1<<0) ? !0 : !!0;
   217			pixel_clk = (is_hdmi_2_0 ? 4 * tmds_clk : tmds_clk) * 1000;
   218	
   219			cci_read(lt6911uxc->regmap, REG_H_TOTAL, &htotal, NULL);
   220			cci_read(lt6911uxc->regmap, REG_V_TOTAL, &vtotal, NULL);
   221			cci_read(lt6911uxc->regmap, REG_H_ACTIVE, &half_width, NULL);
   222			cci_read(lt6911uxc->regmap, REG_V_ACTIVE, &height, NULL);
   223			cci_read(lt6911uxc->regmap, REG_MIPI_LANES, &lanes, NULL);
   224	
   225			if (htotal && vtotal)
   226				fps = div_u64(pixel_clk, htotal * 2 * vtotal);
   227	
   228			lt6911uxc->cur_mode->height = height;
   229			lt6911uxc->cur_mode->width = half_width * 2;
   230			lt6911uxc->cur_mode->fps = fps;
   231			lt6911uxc->cur_mode->code = MEDIA_BUS_FMT_UYVY8_1X16;
   232			lt6911uxc->cur_mode->lanes = lanes;
   233			lt6911uxc->cur_mode->link_freq = byte_clock;
   234	
   235	
   236			if (lt6911uxc->cur_mode->lanes == 8) {
   237				/* 4K60fps with 2 MIPI ports*/
   238				if (lt6911uxc->cur_mode->width >= 3840)
   239					lt6911uxc->cur_mode->width /= 2; /* YUV422 */
   240	
   241				lt6911uxc->cur_mode->lanes /= 2;
   242				lt6911uxc->cur_mode->link_freq /= 2;
   243			}
   244			v4l2_subdev_notify_event(&lt6911uxc->sd,
   245				&lt6911uxc_ev_source_change);
   246	
   247			dev_dbg(&client->dev,  "Pixel Clk:%llu, %lld\n",
   248				pixel_clk, lt6911uxc->cur_mode->link_freq);
   249			dev_dbg(&client->dev,
   250				"width:%u, height:%u, fps:%u, lanes: %d\n",
   251				lt6911uxc->cur_mode->width,
   252				lt6911uxc->cur_mode->height,
   253				lt6911uxc->cur_mode->fps,
   254				lt6911uxc->cur_mode->lanes);
   255			break;
   256		case INT_HDMI_DISCONNECT:
   257			cci_write(lt6911uxc->regmap, REG_MIPI_TX_CTRL, 0x0, NULL);
   258			lt6911uxc->cur_mode->height = 0;
   259			lt6911uxc->cur_mode->width = 0;
 > 260			lt6911uxc->cur_mode->fps = fps;
   261	
   262			lt6911uxc->cur_mode->code = MEDIA_BUS_FMT_UYVY8_1X16;
   263	
   264			lt6911uxc->cur_mode->lanes = 4;
   265			lt6911uxc->cur_mode->link_freq = 0;
   266			v4l2_subdev_notify_event(&lt6911uxc->sd,
   267				&lt6911uxc_ev_stream_end);
   268	
   269			dev_info(&client->dev, "Video signal disconnected\n");
   270			break;
   271		default:
   272			dev_dbg(&client->dev, "Unhandled video= 0x%02llX\n", int_event);
   273			cci_write(lt6911uxc->regmap, REG_ENABLE_I2C, 0x0, NULL);
   274			return  -ENOLINK;
   275		}
   276		cci_write(lt6911uxc->regmap, REG_ENABLE_I2C, 0x0, NULL);
   277		return 0;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
