Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2C23742
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MedyR7Je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697221034; x=1728757034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4auKJzKvyw4ycUhHNAgnjGU2AIC/eadBOzgyc1j8fI=;
  b=MedyR7Jeo3Uf3I2KKpTNjj8yXkpRsXZap2TKlsKg53/grxPM9gB49Bcc
   AkXkhHMyXt0t7NCp5nDy7tEA6R1ozVzR1jF8AZuJWJMEuA3NdB9xw/4EW
   +YmXT3b8FTPgGCShxodp7bP17vDdrKRMvkUYjtm75JGOaZjGBb0IexkRd
   a2On/4VyR9VJfn+vWFjsfxn7HC1nvO5wf2UoU8cJaYegV6S45PFVQJ/oi
   1BUVvz6SJn4yDQWy13w3Lszd8UensuWKM3/YYCH8RbA91oDQff4dHcyyr
   GFv0MG85oAsnQ3DWYgHPNgWCDJNx0X43q5m8guDk+wOkinScgoEDCZ/Hx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370302504"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370302504"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 11:17:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704738004"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="704738004"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 11:17:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrMia-0005FJ-0X;
	Fri, 13 Oct 2023 18:17:00 +0000
Date: Sat, 14 Oct 2023 02:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Babu <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [intel-lts:4.19/android_t 3244/30000]
 drivers/mfd/arizona-i2c.c:131:18: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202310140220.HnbmcoWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 90f1d221943f2adfc6a62813733d6dc0347ab20c [3244/30000] ASoC: mfd: Intel changes for WM8281 integration on K4.0
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231014/202310140220.HnbmcoWj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140220.HnbmcoWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140220.HnbmcoWj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/arizona-i2c.c:131:18: sparse: sparse: Using plain integer as NULL pointer
   drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not used [-Wunused-const-variable=]
     115 | static const struct arizona_micd_range micd_ctp_ranges[] = {
         |                                        ^~~~~~~~~~~~~~~

vim +131 drivers/mfd/arizona-i2c.c

   129	
   130	static struct arizona_pdata __maybe_unused florida_pdata  = {
 > 131		.reset = 0, /*No Reset GPIO from AP, use SW reset*/
   132		.irq_flags = IRQF_TRIGGER_LOW | IRQF_ONESHOT,
   133		.clk32k_src = ARIZONA_32KZ_MCLK2, /*Onboard OSC provides 32K on MCLK2*/
   134		/*
   135		 * IN1 uses both MICBIAS1 and MICBIAS2 based on jack polarity,
   136		 * the below values in dmic_ref only has meaning for DMIC's and not
   137		 * AMIC's
   138		 */
   139	#ifdef CONFIG_SND_SOC_INTEL_CNL_FPGA
   140		.dmic_ref = {ARIZONA_DMIC_MICBIAS1, ARIZONA_DMIC_MICBIAS3, 0, 0},
   141		.inmode = {ARIZONA_INMODE_DIFF, ARIZONA_INMODE_DMIC, 0, 0},
   142	#else
   143		.dmic_ref = {ARIZONA_DMIC_MICBIAS1, 0, ARIZONA_DMIC_MICVDD, 0},
   144		.inmode = {ARIZONA_INMODE_SE, 0, ARIZONA_INMODE_DMIC, 0},
   145	#endif
   146		.gpio_base = 0, /* Base allocated by gpio core */
   147		.micd_pol_gpio = 2, /* GPIO3 (offset 2 from gpio_base) of the codec */
   148		.micd_configs = micd_modes,
   149		.num_micd_configs = ARRAY_SIZE(micd_modes),
   150		.micd_force_micbias = true,
   151	};
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
