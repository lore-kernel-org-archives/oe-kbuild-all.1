Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444218D629
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 21:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729286408; cv=none; b=m8VdL9yKI5MXnpq6tHQTCZsyqCF7YssEhz1c67qfRvQVOZZkLGy3/X7hpnZdgCzzR3NrWyuhyYv3uyMW4iKcoZnmHmqfTr1tMdheBKJ8J2PjN3tNLB4EH9qAObPRrIcosaOm/RJT2l5eBNGRUvLKBR+PhDlpXgQ7vsOWSapggVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729286408; c=relaxed/simple;
	bh=7snBCddhPRK2ypl7il/XCFGOL/nNlVhdq1RMwcL0veo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVDWNx0CaxZff8fTm2bqk3Z/5pYYGk1hCCDrCjqfcUjeizxY+gnQfGLj08Rx7MGk/LcbKpD7T5vWkTSXAktcXoQ23W1RxF8SIKcak40Hif53nlX/zE6gpp3Lq83d2aMp3EU4howVekI77esJ2TJu/mhBC8ZU2wCqSaBNPdBBpfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCbw18LC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCbw18LC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729286407; x=1760822407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7snBCddhPRK2ypl7il/XCFGOL/nNlVhdq1RMwcL0veo=;
  b=kCbw18LCrdrchS7SReMAE1esI3EXGM/QcP3zui1e7JCOJK26R3xHJP4j
   npTHD90sOWLvnNHjVRro1FrCVh8QpEmo7OHXebyJ+Dv5rhEnDRoCPPoXu
   r6UC/cNvHLU2VCq97sSKPo2/uiSL1Vaz8LYnYsof/KOlguLT80/9CYuDS
   o7RNYC6vCP+8WN8LAiDmEVPq3xkjxuX+5ouJ4PVHV1RKA6gJH/uRJ4HBn
   3/hVbg2R/UfgaoPfHD7snF2mREA3ZohnLyefJk1YDmOaU+GWirpmtcRyf
   yMZJrMLHwhQirji4eUyU6ilYkbkFkF9hwgmd2Ty+jgpsn+Z4fy5efyIxR
   A==;
X-CSE-ConnectionGUID: B3MXzcdpSkmaEXFFswCEnQ==
X-CSE-MsgGUID: EgIbIVWxS3ar85KonwniYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51379514"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51379514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 14:20:06 -0700
X-CSE-ConnectionGUID: ajWkF53XT+69L1qY0v4ITQ==
X-CSE-MsgGUID: 6M8FD7cXSKep/74L7IKCqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109805810"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 14:20:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1uOA-000OK1-1L;
	Fri, 18 Oct 2024 21:20:02 +0000
Date: Sat, 19 Oct 2024 05:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC/RFT 2/3] Input: Add Novatek NT36xxx touchscreen driver
Message-ID: <202410190547.0uaUj1XH-lkp@intel.com>
References: <20241015-nt36xxx-v1-2-3919d0bffee6@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-nt36xxx-v1-2-3919d0bffee6@gmail.com>

Hi George,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Chan-via-B4-Relay/dt-bindings-touchscreen-Add-binding-for-Novatek-NT36xxx-series-driver/20241015-205452
base:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
patch link:    https://lore.kernel.org/r/20241015-nt36xxx-v1-2-3919d0bffee6%40gmail.com
patch subject: [PATCH RFC/RFT 2/3] Input: Add Novatek NT36xxx touchscreen driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410190547.0uaUj1XH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190547.0uaUj1XH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190547.0uaUj1XH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:599,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:390,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/input.h:8,
                    from drivers/input/touchscreen/nt36xxx_spi.c:11:
   drivers/input/touchscreen/nt36xxx_spi.c: In function 'nt36xxx_spi_write':
>> drivers/input/touchscreen/nt36xxx_spi.c:55:22: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      55 |         dev_dbg(dev, "%s len=0x%lx", __func__, len);
         |                      ^~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/input/touchscreen/nt36xxx_spi.c:55:9: note: in expansion of macro 'dev_dbg'
      55 |         dev_dbg(dev, "%s len=0x%lx", __func__, len);
         |         ^~~~~~~
   drivers/input/touchscreen/nt36xxx_spi.c:55:34: note: format string is defined here
      55 |         dev_dbg(dev, "%s len=0x%lx", __func__, len);
         |                                ~~^
         |                                  |
         |                                  long unsigned int
         |                                %x
--
>> drivers/input/touchscreen/nt36xxx_core.c:357:21: warning: no previous prototype for '_debug_irq' [-Wmissing-prototypes]
     357 | void __maybe_unused _debug_irq(struct nt36xxx_ts *ts, int line) {
         |                     ^~~~~~~~~~
   drivers/input/touchscreen/nt36xxx_core.c: In function '_debug_irq':
>> drivers/input/touchscreen/nt36xxx_core.c:359:16: error: implicit declaration of function 'irq_data_to_desc'; did you mean 'irq_to_desc'? [-Werror=implicit-function-declaration]
     359 |         desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
         |                ^~~~~~~~~~~~~~~~
         |                irq_to_desc
>> drivers/input/touchscreen/nt36xxx_core.c:359:34: error: implicit declaration of function 'irq_get_irq_data'; did you mean 'irq_set_irq_wake'? [-Werror=implicit-function-declaration]
     359 |         desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
         |                                  ^~~~~~~~~~~~~~~~
         |                                  irq_set_irq_wake
>> drivers/input/touchscreen/nt36xxx_core.c:359:14: warning: assignment to 'struct irq_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     359 |         desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
         |              ^
   In file included from include/linux/device.h:15,
                    from drivers/input/touchscreen/nt36xxx_core.c:14:
>> drivers/input/touchscreen/nt36xxx_core.c:360:61: error: invalid use of undefined type 'struct irq_desc'
     360 |         dev_info(ts->dev, "%d irq_desc depth=%d", line, desc->depth );
         |                                                             ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/input/touchscreen/nt36xxx_core.c:360:9: note: in expansion of macro 'dev_info'
     360 |         dev_info(ts->dev, "%d irq_desc depth=%d", line, desc->depth );
         |         ^~~~~~~~
   drivers/input/touchscreen/nt36xxx_core.c: In function 'nt36xxx_report':
>> drivers/input/touchscreen/nt36xxx_core.c:480:17: warning: variable 'press_id' set but not used [-Wunused-but-set-variable]
     480 |         uint8_t press_id[TOUCH_MAX_FINGER_NUM] = {0};
         |                 ^~~~~~~~
   drivers/input/touchscreen/nt36xxx_core.c: In function 'nt36xxx_probe':
>> drivers/input/touchscreen/nt36xxx_core.c:1274:25: error: 'IRQ_TYPE_EDGE_RISING' undeclared (first use in this function)
    1274 |                         IRQ_TYPE_EDGE_RISING | IRQF_ONESHOT, dev_name(dev), ts);
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/nt36xxx_core.c:1274:25: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +359 drivers/input/touchscreen/nt36xxx_core.c

   356	
 > 357	void __maybe_unused _debug_irq(struct nt36xxx_ts *ts, int line) {
   358	        struct irq_desc *desc;
 > 359	        desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
 > 360	        dev_info(ts->dev, "%d irq_desc depth=%d", line, desc->depth );
   361	}
   362	
   363	#define debug_irq(a) _debug_irq(a, __LINE__)
   364	
   365	static int nt36xxx_eng_reset_idle(struct nt36xxx_ts *ts)
   366	{
   367		int ret;
   368	
   369		if(!ts) {
   370			dev_err(ts->dev, "%s %s empty", __func__, "nt36xxx_ts");
   371			return -EINVAL;
   372		}
   373	
   374		if(!ts->mmap) {
   375			dev_err(ts->dev, "%s %s empty", __func__, "ts->mmap");
   376			return -EINVAL;
   377		}
   378	
   379		if(ts->mmap[MMAP_ENG_RST_ADDR] == 0) {
   380			dev_err(ts->dev, "%s %s empty", __func__, "MMAP_ENG_RST_ADDR");
   381			return -EINVAL;
   382		}
   383	
   384		/* HACK to output something without read */
   385		ret = regmap_write(ts->regmap, ts->mmap[MMAP_ENG_RST_ADDR],
   386						   0x5a);
   387		if (ret) {
   388			dev_err(ts->dev, "%s regmap write error\n", __func__);
   389			return ret;
   390		}
   391	
   392		/* Wait until the MCU resets the fw state */
   393		usleep_range(15000, 16000);
   394	
   395		/* seemed not long enough */
   396		msleep(30);
   397		return ret;
   398	}
   399	
   400	/*
   401	 * nt36xxx_bootloader_reset - Reset MCU to bootloader
   402	 * @ts: Main driver structure
   403	 *
   404	 * Return: Always zero for success, negative number for error
   405	 */
   406	static int nt36xxx_bootloader_reset(struct nt36xxx_ts *ts)
   407	{
   408		int ret = 0;
   409	
   410		//in spi version, need to set page to SWRST_N8_ADDR
   411		if (ts->mmap[MMAP_SWRST_N8_ADDR]) {
   412			ret = regmap_write(ts->regmap, ts->mmap[MMAP_SWRST_N8_ADDR],
   413				   NT36XXX_CMD_BOOTLOADER_RESET);
   414		        if (ret)
   415				return ret;
   416		} else {
   417			pr_info("plz make sure MMAP_SWRST_N8_ADDR is set!\n");
   418			return -EINVAL;
   419		}
   420	
   421		/* MCU has to reboot from bootloader: this is the typical boot time */
   422		msleep(35);
   423	
   424		if (ts->mmap[MMAP_SPI_RD_FAST_ADDR]) {
   425	                ret = regmap_write(ts->regmap, ts->mmap[MMAP_SPI_RD_FAST_ADDR], 0);
   426	                if (ret)
   427	                        return ret;
   428		}
   429	
   430		return ret;
   431	}
   432	
   433	/**
   434	 * nt36xxx_check_reset_state - Check the boot state during reset
   435	 * @ts: Main driver structure
   436	 * @fw_state: Enumeration containing firmware states
   437	 *
   438	 * Return: Always zero for success, negative number for error
   439	 */
   440	static int nt36xxx_check_reset_state(struct nt36xxx_ts *ts,
   441					     enum nt36xxx_fw_state fw_state)
   442	{
   443		u8 buf[8] = { 0 };
   444		int ret = 0, retry = NT36XXX_MAX_FW_RST_RETRY;
   445	
   446		do {
   447			ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR]
   448					 | NT36XXX_EVT_RESET_COMPLETE, buf, 6);
   449			if (likely(ret == 0) &&
   450			    (buf[1] >= fw_state) &&
   451			    (buf[1] <= NT36XXX_STATE_MAX)) {
   452				ret = 0;
   453				break;
   454			}
   455			usleep_range(10000, 11000);
   456		} while (--retry);
   457	
   458		if (!retry) {
   459			dev_err(ts->dev, "Firmware reset failed.\n");
   460			ret = -EBUSY;
   461		}
   462	
   463		return ret;
   464	}
   465	
   466	/**
   467	 * nt36xxx_report - Report touch events
   468	 * @ts: Main driver structure
   469	 *
   470	 * Return: Always zero for success, negative number for error
   471	 */
   472	static void nt36xxx_report(struct nt36xxx_ts *ts)
   473	{
   474		struct nt36xxx_abs_object *obj = &ts->abs_obj;
   475		struct input_dev *input = ts->input;
   476		u8 input_id = 0;
   477		u8 point[POINT_DATA_LEN + 1] = { 0 };
   478		unsigned int ppos = 0;
   479		int i, ret, finger_cnt = 0;
 > 480		uint8_t press_id[TOUCH_MAX_FINGER_NUM] = {0};
   481	
   482		ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR],
   483					point, sizeof(point));
   484		if (ret < 0) {
   485			dev_err(ts->dev,
   486				"Cannot read touch point data: %d\n", ret);
   487			goto xfer_error;
   488		}
   489	
   490		/* wdt recovery and esd check */
   491		for (i = 0; i < 7; i++) {
   492			if ((point[i] != 0xFD) && (point[i] != 0xFE) && (point[i] != 0x77)) {
   493				break;
   494			}
   495	
   496			mutex_lock(&ts->lock);
   497			ts->status |= NT36XXX_STATUS_DOWNLOAD_RECOVER;
   498			mutex_unlock(&ts->lock);
   499			goto xfer_error;
   500		}
   501	
   502		for (i = 0; i < TOUCH_MAX_FINGER_NUM; i++) {
   503			ppos = 6 * i + 1;
   504			input_id = point[ppos + 0] >> 3;
   505	
   506			if ((input_id == 0) || (input_id > TOUCH_MAX_FINGER_NUM)) {
   507				continue;
   508			}
   509	
   510			if (((point[ppos] & 0x07) == 0x01) ||
   511			    ((point[ppos] & 0x07) == 0x02)) {
   512				obj->x = (point[ppos + 1] << 4) +
   513					 (point[ppos + 3] >> 4);
   514				obj->y = (point[ppos + 2] << 4) +
   515					 (point[ppos + 3] & 0xf);
   516	
   517				if ((obj->x > ts->prop.max_x) ||
   518				    (obj->y > ts->prop.max_y))
   519					continue;
   520	
   521				obj->tm = point[ppos + 4];
   522				if (obj->tm == 0)
   523					obj->tm = 1;
   524	
   525				obj->z = point[ppos + 5];
   526				if (i < 2) {
   527					obj->z += point[i + 63] << 8;
   528					if (obj->z > TOUCH_MAX_PRESSURE)
   529						obj->z = TOUCH_MAX_PRESSURE;
   530				}
   531	
   532				if (obj->z == 0)
   533					obj->z = 1;
   534	
   535				press_id[input_id - 1] = 1;
   536	
   537				input_mt_slot(input, input_id - 1);
   538				input_mt_report_slot_state(input,
   539							   MT_TOOL_FINGER, true);
   540				touchscreen_report_pos(input, &ts->prop,
   541							obj->x,
   542							obj->y, true);
   543	
   544				input_report_abs(input, ABS_MT_TOUCH_MAJOR, obj->tm);
   545				input_report_abs(input, ABS_MT_PRESSURE, obj->z);
   546	
   547				finger_cnt++;
   548			}
   549		}
   550	
   551		input_mt_sync_frame(input);
   552	
   553		input_sync(input);
   554	
   555	xfer_error:
   556		return;
   557	}
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
