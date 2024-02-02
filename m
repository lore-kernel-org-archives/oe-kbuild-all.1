Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C901755A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706880166; cv=none; b=sZEPwF0/XMWSZmLEQb/ATnn1oyK7kLFqV3s2u1F5kNHRNGkL7nO1RonI3U1ODbyQXiEUz4l4Pg5favcbvTydP/DSotb/KbovQbIrrxAV6dCjsuVGu7yIZfLP6lJU2UaTkjXAr281VKU9bbrCprN2JpH1J7/hn8KDcu/Tx1tntyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706880166; c=relaxed/simple;
	bh=uV7MoHAVSRFszl7FM/d+ZLjUuwaPkfUz19N9+dwFR48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YK4hmLFCqr4w/lOw21Y4uR1Yvk60w16YLH4IZ8MkI5YOw81SsXYKdax3Qw5ze6Jay2mGphmf8TZbZQ3SoZyTkKu52yXGarp0ztPBmDjgi2hHncx/0FZ0sC330opdHODl9BeanwtRy44uzTsP0V5wR5xmiLRkHIedgvxweGnh7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNElfYgk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNElfYgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706880164; x=1738416164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uV7MoHAVSRFszl7FM/d+ZLjUuwaPkfUz19N9+dwFR48=;
  b=MNElfYgkZkzh64DusqjAM7qY1ZihWMxq0yB5ddc4kTOsuOeEviKeBvjQ
   d1ISqY/TQdtOFdsgxxzxL39BHXpf35k4D2mEcr1rV4aDHUPoYkHjUSBuR
   nGfEUMjSf6958hFhqevfEN/vcTFRNPHxLvp+pnnMQ81GDZX/JcOte5NVd
   wB3y7ibI1alihlKXplLP3mHxtM4CwNAgiPhPridl4o8/Wu81sjNw9u4DX
   0l4WmMRGK8Kr6nRtmIoyu/XjKmW8HM52a9RL9Lse6aEWok4FdN6HoGKqp
   bxr+xy+x3xFH2It3G5xlzpEwDAicPjvJdKX9bHSgPOTgT7pl+yJJSok9X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22639352"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="22639352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="383213"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Feb 2024 05:22:42 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVtUW-0003sg-0V;
	Fri, 02 Feb 2024 13:22:09 +0000
Date: Fri, 2 Feb 2024 21:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 27/44]
 drivers/net/wireless/espressif/esp32-ng/main.c:215:6: warning: no previous
 prototype for 'init_bt'
Message-ID: <202402022111.MUCWhA5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: acef1b30a3f3e8f7b281c40b4b9e4ffdd2f45dab [27/44] drivers/net/wireless/espressif/esp32-ng: update
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240202/202402022111.MUCWhA5a-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402022111.MUCWhA5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022111.MUCWhA5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/espressif/esp32-ng/main.c:215:6: warning: no previous prototype for 'init_bt' [-Wmissing-prototypes]
     215 | void init_bt(struct esp_adapter *adapter)
         |      ^~~~~~~
>> drivers/net/wireless/espressif/esp32-ng/main.c:273:5: warning: no previous prototype for 'process_event_esp_bootup' [-Wmissing-prototypes]
     273 | int process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/espressif/esp32-ng/main.c:565:5: warning: no previous prototype for 'esp_stop_network_ifaces' [-Wmissing-prototypes]
     565 | int esp_stop_network_ifaces(struct esp_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/init_bt +215 drivers/net/wireless/espressif/esp32-ng/main.c

   214	
 > 215	void init_bt(struct esp_adapter *adapter)
   216	{
   217	
   218		if ((adapter->capabilities & ESP_BT_SPI_SUPPORT) ||
   219			(adapter->capabilities & ESP_BT_SDIO_SUPPORT)) {
   220			msleep(200);
   221			esp_info("ESP Bluetooth init\n");
   222			esp_init_bt(adapter);
   223		}
   224	}
   225	
   226	static int check_esp_version(struct fw_version *ver)
   227	{
   228		esp_info("ESP Firmware version: %u.%u.%u\n",
   229				ver->major1, ver->major2, ver->minor);
   230		if (!ver->major1) {
   231			esp_err("Incompatible ESP firmware release detected, Please use correct ESP-Hosted branch/compatible release\n");
   232			return -1;
   233		}
   234		return 0;
   235	}
   236	
   237	static void print_reset_reason(uint32_t reason)
   238	{
   239		switch (reason)
   240		{
   241			case 1: esp_info("POWERON_RESET\n"); break;          /**<1, Vbat power on reset*/
   242			case 3: esp_info("SW_RESET\n"); break;               /**<3, Software reset digital core*/
   243			case 4: esp_info("OWDT_RESET\n"); break;             /**<4, Legacy watch dog reset digital core*/
   244			case 5: esp_info("DEEPSLEEP_RESET\n"); break;        /**<5, Deep Sleep reset digital core*/
   245			case 6: esp_info("SDIO_RESET\n"); break;             /**<6, Reset by SLC module, reset digital core*/
   246			case 7: esp_info("TG0WDT_SYS_RESET\n"); break;       /**<7, Timer Group0 Watch dog reset digital core*/
   247			case 8: esp_info("TG1WDT_SYS_RESET\n"); break;       /**<8, Timer Group1 Watch dog reset digital core*/
   248			case 9: esp_info("RTCWDT_SYS_RESET\n"); break;       /**<9, RTC Watch dog Reset digital core*/
   249			case 10: esp_info("INTRUSION_RESET\n"); break;       /**<10, Instrusion tested to reset CPU*/
   250			case 11: esp_info("TGWDT_CPU_RESET\n"); break;       /**<11, Time Group reset CPU*/
   251			case 12: esp_info("SW_CPU_RESET\n"); break;          /**<12, Software reset CPU*/
   252			case 13: esp_info("RTCWDT_CPU_RESET\n"); break;      /**<13, RTC Watch dog Reset CPU*/
   253			case 14: esp_info("EXT_CPU_RESET\n"); break;         /**<14, for APP CPU, reseted by PRO CPU*/
   254			case 15: esp_info("RTCWDT_BROWN_OUT_RESET\n"); break;/**<15, Reset when the vdd voltage is not stable*/
   255			case 16: esp_info("RTCWDT_RTC_RESET\n"); break;      /**<16, RTC Watch dog reset digital core and rtc module*/
   256			default: esp_info("Unknown[%u]\n", reason); break;
   257		}
   258	}
   259	
   260	static int process_fw_data(struct fw_data *fw_p, int tag_len)
   261	{
   262		if (tag_len != sizeof(struct fw_data)) {
   263			esp_err("Length not matching to firmware data size\n");
   264			return -1;
   265		}
   266	
   267		esp_info("ESP chipset's last reset cause:\n");
   268		print_reset_reason(le32_to_cpu(fw_p->last_reset_reason));
   269	
   270		return check_esp_version(&fw_p->version);
   271	}
   272	
 > 273	int process_event_esp_bootup(struct esp_adapter *adapter, u8 *evt_buf, u8 len)
   274	{
   275		int len_left = len, tag_len, ret = 0;
   276		u8 *pos;
   277	
   278		if (!adapter || !evt_buf)
   279			return -1;
   280	
   281		if (len_left >= 64) {
   282			esp_info("ESP init event len looks unexpected: %u (>=64)\n", len_left);
   283			esp_info("You probably facing timing mismatch at transport layer\n");
   284		}
   285	
   286		clear_bit(ESP_INIT_DONE, &adapter->state_flags);
   287		/* Deinit module if already initialized */
   288		esp_deinit_module(adapter);
   289	
   290		pos = evt_buf;
   291	
   292		while (len_left > 0) {
   293			tag_len = *(pos + 1);
   294	
   295			esp_info("Bootup Event tag: %d\n", *pos);
   296	
   297			switch (*pos) {
   298			case ESP_BOOTUP_CAPABILITY:
   299				adapter->capabilities = *(pos + 2);
   300				break;
   301			case ESP_BOOTUP_FIRMWARE_CHIP_ID:
   302				ret = esp_validate_chipset(adapter, *(pos + 2));
   303				break;
   304			case ESP_BOOTUP_FW_DATA:
   305				ret = process_fw_data((struct fw_data *)(pos + 2), tag_len);
   306				break;
   307			case ESP_BOOTUP_SPI_CLK_MHZ:
   308				ret = esp_adjust_spi_clock(adapter, *(pos + 2));
   309				break;
   310			default:
   311				esp_warn("Unsupported tag=%x in bootup event\n", *pos);
   312			}
   313	
   314			if (ret < 0) {
   315				esp_err("failed to process tag=%x in bootup event\n", *pos);
   316				return -1;
   317			}
   318			pos += (tag_len + 2);
   319			len_left -= (tag_len + 2);
   320		}
   321	
   322		if (esp_add_card(adapter)) {
   323			esp_err("network iterface init failed\n");
   324			return -1;
   325		}
   326		init_bt(adapter);
   327	
   328		if (raw_tp_mode !=0) {
   329	#if TEST_RAW_TP
   330			process_test_capabilities(raw_tp_mode);
   331			esp_init_raw_tp(adapter);
   332	#else
   333			esp_err("RAW TP mode selected but not enabled\n");
   334			return -1;
   335	#endif
   336		}
   337		set_bit(ESP_INIT_DONE, &adapter->state_flags);
   338		print_capabilities(adapter->capabilities);
   339	
   340		return 0;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
