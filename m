Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DDBEED9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708857809; cv=none; b=ITBtPX7GuEINFzJBXdF9yLba1eljAy1cU5//+IBR8BKHlXAh/yICLrO5VPt47TgQjXhqp1GCQSevBbSecnuMET7IIOjbFVqv3raK/F88qcCVWiY51vEeq0BnDnyyvF/+R6RR+NfB6n1BGm5bOSOEZHxAKhjFjJTJM13wcK8wU/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708857809; c=relaxed/simple;
	bh=1owJuxW0vuygxdo56NpD8/mOSORdt+aM9yKt6nlv8MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBSG/S8gtms8QSsYfDas6wp1NMdDGd+izyfs/ZlnOrJfS321iJL9jCPtR+2z8mivuiE/qY6MJiaoF4oKScEtMPAs1O9OARjypLG4zkzxDyodeo4UMxNaG39sQFp7zXIFvnrFVyeHta5KwEKd+WfApQWPALXgHf+q4Psq+pwKot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXJO/AxN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXJO/AxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708857807; x=1740393807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1owJuxW0vuygxdo56NpD8/mOSORdt+aM9yKt6nlv8MQ=;
  b=MXJO/AxNaHt9EabYRkuEbslgY1sZ3YdgWlz/ijF56fG3UnvzWEDFmTiS
   imgQ1HQTkI/6u/OBCGvfV7q9awhQkmCiLqxu4ielQdmdNGxCT0K+qlCpJ
   8ub7aGYHJf7ubaPhCyZdsDbrm0utd1B833kop+E6DEeTn7pnfZwybp1u4
   63g/B/hQHXIJ9lAn4A3nTMF7RvW334u2yvGwcIWTF6a2O0wcPqmWjex4E
   UVYn6sOjWes6DUhm4DjlAiLzUAGl+cGGUgoL7f5XE3d4ghWn5mrlSMG1K
   qyHt6S6mIpGDK2ecnCl4xB27rg+oYozVt2Hosr889nHX2RBL+lp4b98wQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="14581026"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="14581026"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 02:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6288433"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Feb 2024 02:43:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reBy5-0009TI-1T;
	Sun, 25 Feb 2024 10:42:59 +0000
Date: Sun, 25 Feb 2024 18:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-5.15.y 108/204] drivers/media/i2c/lt8619c.c:233:42:
 warning: the comparison will always evaluate as 'false' for the pointer
 operand in 'pbuf + 127' must not be NULL
Message-ID: <202402251842.i7PrDZvu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   200d2466033be9a082bfb81368de8a994e399a02
commit: 17501341aae8821abf97050abc9620fb7769581f [108/204] ODROID-COMMON: Add LT8619C HDMI/Dual-mode DP receiver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240225/202402251842.i7PrDZvu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251842.i7PrDZvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251842.i7PrDZvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/lt8619c.c: In function 'lt8619c_edid_checksum':
>> drivers/media/i2c/lt8619c.c:233:42: warning: the comparison will always evaluate as 'false' for the pointer operand in 'pbuf + 127' must not be NULL [-Waddress]
     233 |         if (pbuf == NULL || (pbuf + 127) == NULL)
         |                                          ^~
   drivers/media/i2c/lt8619c.c: At top level:
>> drivers/media/i2c/lt8619c.c:308:6: warning: no previous prototype for 'lt8619c_audio_init' [-Wmissing-prototypes]
     308 | void lt8619c_audio_init(uint8_t audio_input)
         |      ^~~~~~~~~~~~~~~~~~


vim +233 drivers/media/i2c/lt8619c.c

   226	
   227	static uint8_t lt8619c_edid_checksum(uint8_t block, uint8_t *buf)
   228	{
   229		uint8_t i = 0;
   230		uint8_t checksum = 0;
   231		uint8_t *pbuf = buf + 128 * block;
   232	
 > 233		if (pbuf == NULL || (pbuf + 127) == NULL)
   234			return 0;
   235	
   236		for (i = 0, checksum = 0; i < 127 ; i++) {
   237			checksum += pbuf[i];
   238			checksum %= 256;
   239		}
   240		checksum = 256 - checksum;
   241	
   242		dev_info(lt8619c->dev, "EDID checksum 0x%x\n", checksum);
   243	
   244		return checksum;
   245	}
   246	
   247	static void lt8619c_set_edid(uint8_t *edid_buf)
   248	{
   249		int ret = 0;
   250	
   251		lt8619c_reg_write(0xff, 0x80);
   252		lt8619c_reg_write(0x8e, 0x07);
   253		lt8619c_reg_write(0x8f, 0x00);
   254	
   255		if (edid_buf == NULL)
   256			ret = lt8619c_reg_write_bytes(0x90, &onchip_edid[0], 256);
   257		else
   258			ret = lt8619c_reg_write_bytes(0x90, edid_buf, 256);
   259	
   260		if (ret)
   261			dev_info(lt8619c->dev, "EDID Set write error\n");
   262	
   263		lt8619c_reg_write(0x8e, 0x02);
   264	}
   265	
   266	static void lt8619c_rx_init(void)
   267	{
   268		lt8619c_reg_write(0xff, 0x80);
   269		/* RGD_CLK_STABLE_OPT[1:0] */
   270		lt8619c_reg_write(0x2c, (lt8619c_reg_read(0x2C)|0x30));
   271	
   272		lt8619c_reg_write(0xff, 0x60);
   273		lt8619c_reg_write(0x04, 0xF2);
   274		lt8619c_reg_write(0x83, 0x3F);
   275		lt8619c_reg_write(0x80, 0x08); /* use xtal_clk as sys_clk */
   276	#ifdef DDR_CLK
   277		lt8619c_reg_write(0xa4, 0x14); /* 0x10:SDR clk,0x14: DDR clk */
   278	#else
   279		lt8619c_reg_write(0xa4, 0x10); /* 0x10:SDR clk,0x14: DDR clk */
   280	#endif
   281		dev_dbg(lt8619c->dev, "LT8619C output mode : %d\n", LT8619C_OUTPUTMODE);
   282	
   283		dev_info(lt8619c->dev, "\nLT8619C set to OUTPUT_RGB888");
   284		lt8619c_reg_write(0xff, 0x60);
   285		lt8619c_reg_write(0x07, 0xff);
   286		lt8619c_reg_write(0xa8, 0x0f);
   287		lt8619c_reg_write(0x60, 0x00);
   288		lt8619c_reg_write(0x96, 0x71);
   289		lt8619c_reg_write(0xa0, 0x50);
   290		// 0x60A3=0x44:Phase adjust enable;0x60A3=0x30:PIN68
   291		// switch to output PCLK(only use for U5);
   292		lt8619c_reg_write(0xa3, 0x74);
   293		//Phase code value: 0x20,0x28,0x21,0x29,0x22,0x2a,0x23,0x2b,0x24,0x2c
   294		lt8619c_reg_write(0xa2, 0x29);
   295		//RGB mapping control
   296		lt8619c_reg_write(0x6d, 0x00);//0x07//00
   297		//RGB high/low bit swap control
   298		lt8619c_reg_write(0x6e, 0x00);
   299		/* LT8619C_OUTPUTMODE == OUTPUT_RGB888 */
   300	
   301		lt8619c_reg_write(0xff, 0x60);
   302		lt8619c_reg_write(0x0e, 0xfd);
   303		lt8619c_reg_write(0x0e, 0xff);
   304		lt8619c_reg_write(0x0d, 0xfc);
   305		lt8619c_reg_write(0x0d, 0xff);
   306	}
   307	
 > 308	void lt8619c_audio_init(uint8_t audio_input)
   309	{
   310		if (audio_input == I2S_2CH) {
   311			dev_dbg(lt8619c->dev, "Audio Init : Audio set to I2S_2CH\n");
   312			lt8619c_reg_write(0xff, 0x60);
   313			lt8619c_reg_write(0x4c, 0x00);
   314		} else if (audio_input == SPDIF) {
   315			dev_dbg(lt8619c->dev, "Audio Init : Audio set to SPDIF\n");
   316			lt8619c_reg_write(0xff, 0x60);
   317			lt8619c_reg_write(0x4c, 0x80);
   318		} else {
   319			dev_dbg(lt8619c->dev, "Audio Init : Error! Check Audio Mode\n");
   320		}
   321	
   322		lt8619c_reg_write(0xff, 0x80);
   323		lt8619c_reg_write(0x5d, 0xc9);
   324		lt8619c_reg_write(0x07, 0x16);
   325		lt8619c_reg_write(0x08, 0x80);
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
