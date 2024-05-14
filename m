Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D6BA45
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 04:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715661264; cv=none; b=IenzF2/lnNwIYWOL3rxNGzrNGTTZKiNzKhT68yEYnDpU1kLavoXGgVxTPkw4MZT/fq9biajpnYkPv3/kkztFot4+t70pRTtiT3upuirGaqeSolAXPYAfjDPNF7n0X4SdyWpTC8R6p0H7ZcsUpWvWtE5IMeea4woO1oD0uRELtB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715661264; c=relaxed/simple;
	bh=dDFfKD1Xm+DvF6ri1Jm5CCxu7adUH3utWg1wb7atNKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+DjpG+j4EIifIaJtNZ9CM+K6QcIQB3VPD4kYFcNrXBgWrG/ok7fNX2gmT14JXiNWURFycw0F/z3MFNFqXDybC/wg6YihYokGdqmzfndJENB4kHNGLfgAbfoytshlkRMExtEFR+niEfmxLeiX+iBa9ltMlBueHIfLEhhaoYbvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKNtzIIT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKNtzIIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715661262; x=1747197262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dDFfKD1Xm+DvF6ri1Jm5CCxu7adUH3utWg1wb7atNKE=;
  b=bKNtzIIToTXC/3I2e9gaNtV1ixAvJ17wWZMjsVtlBg0DEPvhHRRCqUth
   PUVcTWKrDW/eZT+MVfCXUa8itFh6hHa+9yVbEUQcNoMynI7lj/edb0RJL
   QHvG7MX+bOairskgPhpRuhc4JhJG2aORIHHv2v5TrbaRxS5BxNyk+ituQ
   +agGQ7lf/a5poOriKsZb2g5GLPiPPmjPk9kijFzc/jUES4GfCQDVX2Zpd
   UUTJcn9k2fCQ9oX+GLLpXMXpjNwYfdYaTrZPfVHt1KJyK+tUShXT0/fup
   IhqXDRwoKK4UmM1rJzwKadSlLsM3lWGLunZqDIkow9D279wG000T3YW63
   w==;
X-CSE-ConnectionGUID: bjxzgzRCSS2eMrT9OsQqjQ==
X-CSE-MsgGUID: Wl6P+ap1T+yeMF30KsS+BA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11797378"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11797378"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 21:34:18 -0700
X-CSE-ConnectionGUID: 7+2Gde5tSImBK6p8LzusDA==
X-CSE-MsgGUID: 7VHABV+ESLqopT3eHiuHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="31113364"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2024 21:34:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6jri-000B4b-1U;
	Tue, 14 May 2024 04:34:14 +0000
Date: Tue, 14 May 2024 12:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: michael.nemanov@ti.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 17/17] Add Kconfig, Makefile and integrate into
 wireless/ti folder
Message-ID: <202405141253.rZTcUmiw-lkp@intel.com>
References: <20240512183247.2190242-18-michael.nemanov@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512183247.2190242-18-michael.nemanov@ti.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 83127ecada257e27f4740dbca9644dd0e838bc36]

url:    https://github.com/intel-lab-lkp/linux/commits/michael-nemanov-ti-com/Add-cc33xx-h-cc33xx_i-h/20240513-023728
base:   83127ecada257e27f4740dbca9644dd0e838bc36
patch link:    https://lore.kernel.org/r/20240512183247.2190242-18-michael.nemanov%40ti.com
patch subject: [RFC PATCH 17/17] Add Kconfig, Makefile and integrate into wireless/ti folder
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240514/202405141253.rZTcUmiw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141253.rZTcUmiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141253.rZTcUmiw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/net/wireless/ti/cc33xx/main.c:6:
   drivers/net/wireless/ti/cc33xx/main.c: In function 'parse_control_message':
>> drivers/net/wireless/ti/cc33xx/main.c:857:33: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
     857 |                         WARN(1, "Error processing device message @ offset %x",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     858 |                              (size_t)(buffer - start_of_payload));
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              |
         |                              long unsigned int
   include/asm-generic/bug.h:99:62: note: in definition of macro '__WARN_printf'
      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   drivers/net/wireless/ti/cc33xx/main.c:857:25: note: in expansion of macro 'WARN'
     857 |                         WARN(1, "Error processing device message @ offset %x",
         |                         ^~~~
   drivers/net/wireless/ti/cc33xx/main.c:857:76: note: format string is defined here
     857 |                         WARN(1, "Error processing device message @ offset %x",
         |                                                                           ~^
         |                                                                            |
         |                                                                            unsigned int
         |                                                                           %lx
   drivers/net/wireless/ti/cc33xx/main.c: At top level:
>> drivers/net/wireless/ti/cc33xx/main.c:199:36: warning: 'cc33xx_clk_table' defined but not used [-Wunused-const-variable=]
     199 | static const struct cc33xx_clk_cfg cc33xx_clk_table[NUM_CLOCK_CONFIGS] = {
         |                                    ^~~~~~~~~~~~~~~~
>> drivers/net/wireless/ti/cc33xx/main.c:187:36: warning: 'cc33xx_clk_table_coex' defined but not used [-Wunused-const-variable=]
     187 | static const struct cc33xx_clk_cfg cc33xx_clk_table_coex[NUM_CLOCK_CONFIGS] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/ti/cc33xx/main.c:13:
>> drivers/net/wireless/ti/cc33xx/acx.h:825:18: warning: 'cc33xx_idx_to_rate_100kbps' defined but not used [-Wunused-const-variable=]
     825 | static const u16 cc33xx_idx_to_rate_100kbps[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/net/mac80211.h:16,
                    from drivers/net/wireless/ti/cc33xx/cc33xx_i.h:8,
                    from drivers/net/wireless/ti/cc33xx/cc33xx.h:8,
                    from drivers/net/wireless/ti/cc33xx/cmd.h:8,
                    from drivers/net/wireless/ti/cc33xx/acx.h:8,
                    from drivers/net/wireless/ti/cc33xx/cmd.c:5:
   drivers/net/wireless/ti/cc33xx/cmd.c: In function '__cc33xx_cmd_send':
>> drivers/net/wireless/ti/cc33xx/debug.h:8:21: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       8 | #define DRIVER_NAME "cc33xx"
         |                     ^~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:25: note: in expansion of macro 'dynamic_pr_debug'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                         ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:9:23: note: in expansion of macro 'DRIVER_NAME'
       9 | #define DRIVER_PREFIX DRIVER_NAME ": "
         |                       ^~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:42: note: in expansion of macro 'DRIVER_PREFIX'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                                          ^~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/cmd.c:112:17: note: in expansion of macro 'cc33xx_debug'
     112 |                 cc33xx_debug(DEBUG_CMD,
         |                 ^~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/cmd.c: In function 'cc33xx_cmd_send_failsafe':
>> drivers/net/wireless/ti/cc33xx/debug.h:8:21: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       8 | #define DRIVER_NAME "cc33xx"
         |                     ^~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:25: note: in expansion of macro 'dynamic_pr_debug'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                         ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:9:23: note: in expansion of macro 'DRIVER_NAME'
       9 | #define DRIVER_PREFIX DRIVER_NAME ": "
         |                       ^~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:42: note: in expansion of macro 'DRIVER_PREFIX'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                                          ^~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/cmd.c:146:9: note: in expansion of macro 'cc33xx_debug'
     146 |         cc33xx_debug(DEBUG_TESTMODE, "CMD# %d, len=%d", id, len);
         |         ^~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/acx.h: At top level:
>> drivers/net/wireless/ti/cc33xx/acx.h:825:18: warning: 'cc33xx_idx_to_rate_100kbps' defined but not used [-Wunused-const-variable=]
     825 | static const u16 cc33xx_idx_to_rate_100kbps[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ti/cc33xx/event.c:5:
>> drivers/net/wireless/ti/cc33xx/acx.h:825:18: warning: 'cc33xx_idx_to_rate_100kbps' defined but not used [-Wunused-const-variable=]
     825 | static const u16 cc33xx_idx_to_rate_100kbps[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/ti/cc33xx/tx.c: In function 'cc33xx_tx_fill_hdr':
>> drivers/net/wireless/ti/cc33xx/tx.c:326:13: warning: variable 'hosttime' set but not used [-Wunused-but-set-variable]
     326 |         s64 hosttime;
         |             ^~~~~~~~
   In file included from drivers/net/wireless/ti/cc33xx/tx.c:5:
   drivers/net/wireless/ti/cc33xx/acx.h: At top level:
>> drivers/net/wireless/ti/cc33xx/acx.h:825:18: warning: 'cc33xx_idx_to_rate_100kbps' defined but not used [-Wunused-const-variable=]
     825 | static const u16 cc33xx_idx_to_rate_100kbps[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/wireless/ti/cc33xx/cmd.c:896: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * send test command to firmware
   drivers/net/wireless/ti/cc33xx/cmd.c:924: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * read acx from firmware
   drivers/net/wireless/ti/cc33xx/cmd.c:952: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * read debug acx from firmware
   drivers/net/wireless/ti/cc33xx/cmd.c:980: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * write acx value to firmware
   drivers/net/wireless/ti/cc33xx/cmd.c:1029: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * write acx value to firmware
--
   drivers/net/wireless/ti/cc33xx/rx.c: In function 'cc33xx_rx_get_packet_data':
>> drivers/net/wireless/ti/cc33xx/rx.c:165:12: warning: variable 'is_data' set but not used [-Wunused-but-set-variable]
     165 |         u8 is_data = 0;
         |            ^~~~~~~
   drivers/net/wireless/ti/cc33xx/rx.c: In function 'cc33xx_rx_filter_enable':
>> drivers/net/wireless/ti/cc33xx/rx.c:391:1: warning: control reaches end of non-void function [-Wreturn-type]
     391 | }
         | ^
   drivers/net/wireless/ti/cc33xx/rx.c: In function 'cc33xx_rx_filter_clear_all':
   drivers/net/wireless/ti/cc33xx/rx.c:393:52: warning: control reaches end of non-void function [-Wreturn-type]
     393 | int cc33xx_rx_filter_clear_all(struct cc33xx *cc) {}
         |                                                    ^
   In file included from drivers/net/wireless/ti/cc33xx/rx.c:5:
   drivers/net/wireless/ti/cc33xx/acx.h: At top level:
>> drivers/net/wireless/ti/cc33xx/acx.h:825:18: warning: 'cc33xx_idx_to_rate_100kbps' defined but not used [-Wunused-const-variable=]
     825 | static const u16 cc33xx_idx_to_rate_100kbps[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/ti/cc33xx/init.c: In function 'cc33xx_init_vif_specific':
>> drivers/net/wireless/ti/cc33xx/init.c:109:29: warning: variable 'conf_tid' set but not used [-Wunused-but-set-variable]
     109 |         struct conf_tx_tid *conf_tid;
         |                             ^~~~~~~~
   drivers/net/wireless/ti/cc33xx/init.c: In function 'cc33xx_hw_init':
>> drivers/net/wireless/ti/cc33xx/init.c:196:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     196 |         int ret = 0;
         |             ^~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:8,
                    from drivers/net/wireless/ti/cc33xx/init.c:5:
   drivers/net/wireless/ti/cc33xx/init.c: In function 'cc33xx_download_ini_params_and_wait':
>> drivers/net/wireless/ti/cc33xx/debug.h:8:21: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long unsigned int' [-Wformat=]
       8 | #define DRIVER_NAME "cc33xx"
         |                     ^~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:25: note: in expansion of macro 'dynamic_pr_debug'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                         ^~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:9:23: note: in expansion of macro 'DRIVER_NAME'
       9 | #define DRIVER_PREFIX DRIVER_NAME ": "
         |                       ^~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debug.h:60:42: note: in expansion of macro 'DRIVER_PREFIX'
      60 |                         dynamic_pr_debug(DRIVER_PREFIX fmt "\n", ##arg); \
         |                                          ^~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/init.c:214:9: note: in expansion of macro 'cc33xx_debug'
     214 |         cc33xx_debug(DEBUG_ACX,
         |         ^~~~~~~~~~~~
   In file included from drivers/net/wireless/ti/cc33xx/init.c:6:
   drivers/net/wireless/ti/cc33xx/acx.h: At top level:
>> drivers/net/wireless/ti/cc33xx/acx.h:825:18: warning: 'cc33xx_idx_to_rate_100kbps' defined but not used [-Wunused-const-variable=]
     825 | static const u16 cc33xx_idx_to_rate_100kbps[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ti/cc33xx/debugfs.c:5:
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'tx_tx_retry_per_rate_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:52:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
      52 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(tx, tx_retry_per_rate,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'pwr_cont_miss_bcns_spread_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:103:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     103 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(pwr, cont_miss_bcns_spread,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'rx_rate_rx_frames_per_rates_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:124:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     124 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(rx_rate, rx_frames_per_rates, 50);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'aggr_size_tx_agg_rate_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:126:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     126 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(aggr_size, tx_agg_rate,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'aggr_size_tx_agg_len_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:128:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     128 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(aggr_size, tx_agg_len,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'aggr_size_rx_size_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:130:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     130 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(aggr_size, rx_size,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'pipeline_pipeline_fifo_full_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:146:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     146 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(pipeline, pipeline_fifo_full,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'diversity_num_of_packets_per_ant_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:149:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     149 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(diversity, num_of_packets_per_ant,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'calib_fail_count_read':
>> drivers/net/wireless/ti/cc33xx/debugfs.h:71:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      71 |         int res, i;                                                     \
         |             ^~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:15:9: note: in expansion of macro 'DEBUGFS_FWSTATS_FILE_ARRAY'
      15 |         DEBUGFS_FWSTATS_FILE_ARRAY(a, b, c, cc33xx_acx_statistics)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c:160:1: note: in expansion of macro 'CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY'
     160 | CC33XX_DEBUGFS_FWSTATS_FILE_ARRAY(calib, fail_count,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'cc33xx_debugfs_add_files_helper':
   drivers/net/wireless/ti/cc33xx/debugfs.h:37:37: error: 'cc' undeclared (first use in this function)
      37 |                                     cc, &name## _ops)
         |                                     ^~
   drivers/net/wireless/ti/cc33xx/debugfs.c:399:9: note: in expansion of macro 'DEBUGFS_ADD'
     399 |         DEBUGFS_ADD(radar_debug_mode, moddir);
         |         ^~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.h:37:37: note: each undeclared identifier is reported only once for each function it appears in
      37 |                                     cc, &name## _ops)
         |                                     ^~
   drivers/net/wireless/ti/cc33xx/debugfs.c:399:9: note: in expansion of macro 'DEBUGFS_ADD'
     399 |         DEBUGFS_ADD(radar_debug_mode, moddir);
         |         ^~~~~~~~~~~
   drivers/net/wireless/ti/cc33xx/debugfs.c: In function 'ble_enable_write':
>> drivers/net/wireless/ti/cc33xx/debugfs.c:1182:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1182 |         int ret;
         |             ^~~
   In file included from drivers/net/wireless/ti/cc33xx/debugfs.c:6:
   drivers/net/wireless/ti/cc33xx/acx.h: At top level:
>> drivers/net/wireless/ti/cc33xx/acx.h:825:18: warning: 'cc33xx_idx_to_rate_100kbps' defined but not used [-Wunused-const-variable=]
     825 | static const u16 cc33xx_idx_to_rate_100kbps[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +857 drivers/net/wireless/ti/cc33xx/main.c

53500b0b54c6a11 Michael Nemanov 2024-05-12  802  
53500b0b54c6a11 Michael Nemanov 2024-05-12  803  static int parse_control_message(struct cc33xx *cc,
53500b0b54c6a11 Michael Nemanov 2024-05-12  804  				 const u8 *buffer, size_t buffer_length)
53500b0b54c6a11 Michael Nemanov 2024-05-12  805  {
53500b0b54c6a11 Michael Nemanov 2024-05-12  806  	u8 *const end_of_payload = (u8 *const)buffer + buffer_length;
53500b0b54c6a11 Michael Nemanov 2024-05-12  807  	u8 *const start_of_payload = (u8 *const)buffer;
53500b0b54c6a11 Michael Nemanov 2024-05-12  808  	struct control_info_descriptor *control_info_descriptor;
53500b0b54c6a11 Michael Nemanov 2024-05-12  809  	const u8 *event_data, *cmd_result_data;
53500b0b54c6a11 Michael Nemanov 2024-05-12  810  	int ctrl_info_type, ctrl_info_length;
53500b0b54c6a11 Michael Nemanov 2024-05-12  811  
53500b0b54c6a11 Michael Nemanov 2024-05-12  812  	while (buffer < end_of_payload) {
53500b0b54c6a11 Michael Nemanov 2024-05-12  813  		control_info_descriptor =
53500b0b54c6a11 Michael Nemanov 2024-05-12  814  				(struct control_info_descriptor *)buffer;
53500b0b54c6a11 Michael Nemanov 2024-05-12  815  
53500b0b54c6a11 Michael Nemanov 2024-05-12  816  		ctrl_info_type = get_type(control_info_descriptor);
53500b0b54c6a11 Michael Nemanov 2024-05-12  817  		ctrl_info_length = get_length(control_info_descriptor);
53500b0b54c6a11 Michael Nemanov 2024-05-12  818  
53500b0b54c6a11 Michael Nemanov 2024-05-12  819  		cc33xx_debug(DEBUG_CMD, "Processing message type %d, len %d",
53500b0b54c6a11 Michael Nemanov 2024-05-12  820  			     ctrl_info_type, ctrl_info_length);
53500b0b54c6a11 Michael Nemanov 2024-05-12  821  
53500b0b54c6a11 Michael Nemanov 2024-05-12  822  		switch (ctrl_info_type) {
53500b0b54c6a11 Michael Nemanov 2024-05-12  823  		case CTRL_MSG_EVENT:
53500b0b54c6a11 Michael Nemanov 2024-05-12  824  			event_data = buffer + sizeof(*control_info_descriptor);
53500b0b54c6a11 Michael Nemanov 2024-05-12  825  
53500b0b54c6a11 Michael Nemanov 2024-05-12  826  			deffer_event(cc, event_data, ctrl_info_length);
53500b0b54c6a11 Michael Nemanov 2024-05-12  827  			break;
53500b0b54c6a11 Michael Nemanov 2024-05-12  828  
53500b0b54c6a11 Michael Nemanov 2024-05-12  829  		case CTRL_MSG_COMMND_COMPLETE:
53500b0b54c6a11 Michael Nemanov 2024-05-12  830  			cmd_result_data = buffer;
53500b0b54c6a11 Michael Nemanov 2024-05-12  831  			cmd_result_data += sizeof(*control_info_descriptor);
53500b0b54c6a11 Michael Nemanov 2024-05-12  832  
53500b0b54c6a11 Michael Nemanov 2024-05-12  833  			if (ctrl_info_length > sizeof(cc->command_result)) {
53500b0b54c6a11 Michael Nemanov 2024-05-12  834  				print_hex_dump(KERN_DEBUG, "message dump:",
53500b0b54c6a11 Michael Nemanov 2024-05-12  835  					       DUMP_PREFIX_OFFSET, 16, 1,
53500b0b54c6a11 Michael Nemanov 2024-05-12  836  					       cmd_result_data,
53500b0b54c6a11 Michael Nemanov 2024-05-12  837  					       ctrl_info_length, false);
53500b0b54c6a11 Michael Nemanov 2024-05-12  838  
53500b0b54c6a11 Michael Nemanov 2024-05-12  839  				WARN(1, "Error device response exceeds result buffer size");
53500b0b54c6a11 Michael Nemanov 2024-05-12  840  
53500b0b54c6a11 Michael Nemanov 2024-05-12  841  				goto message_parse_error;
53500b0b54c6a11 Michael Nemanov 2024-05-12  842  			}
53500b0b54c6a11 Michael Nemanov 2024-05-12  843  
53500b0b54c6a11 Michael Nemanov 2024-05-12  844  			memcpy(cc->command_result,
53500b0b54c6a11 Michael Nemanov 2024-05-12  845  			       cmd_result_data, ctrl_info_length);
53500b0b54c6a11 Michael Nemanov 2024-05-12  846  
53500b0b54c6a11 Michael Nemanov 2024-05-12  847  			cc->result_length = ctrl_info_length;
53500b0b54c6a11 Michael Nemanov 2024-05-12  848  
53500b0b54c6a11 Michael Nemanov 2024-05-12  849  			complete(&cc->command_complete);
53500b0b54c6a11 Michael Nemanov 2024-05-12  850  			break;
53500b0b54c6a11 Michael Nemanov 2024-05-12  851  
53500b0b54c6a11 Michael Nemanov 2024-05-12  852  		default:
53500b0b54c6a11 Michael Nemanov 2024-05-12  853  			print_hex_dump(KERN_DEBUG, "message dump:",
53500b0b54c6a11 Michael Nemanov 2024-05-12  854  				       DUMP_PREFIX_OFFSET, 16, 1,
53500b0b54c6a11 Michael Nemanov 2024-05-12  855  				start_of_payload, buffer_length, false);
53500b0b54c6a11 Michael Nemanov 2024-05-12  856  
53500b0b54c6a11 Michael Nemanov 2024-05-12 @857  			WARN(1, "Error processing device message @ offset %x",
53500b0b54c6a11 Michael Nemanov 2024-05-12  858  			     (size_t)(buffer - start_of_payload));
53500b0b54c6a11 Michael Nemanov 2024-05-12  859  
53500b0b54c6a11 Michael Nemanov 2024-05-12  860  			goto message_parse_error;
53500b0b54c6a11 Michael Nemanov 2024-05-12  861  		}
53500b0b54c6a11 Michael Nemanov 2024-05-12  862  
53500b0b54c6a11 Michael Nemanov 2024-05-12  863  		buffer += sizeof(*control_info_descriptor);
53500b0b54c6a11 Michael Nemanov 2024-05-12  864  		buffer += ctrl_info_length;
53500b0b54c6a11 Michael Nemanov 2024-05-12  865  	}
53500b0b54c6a11 Michael Nemanov 2024-05-12  866  
53500b0b54c6a11 Michael Nemanov 2024-05-12  867  	return 0;
53500b0b54c6a11 Michael Nemanov 2024-05-12  868  
53500b0b54c6a11 Michael Nemanov 2024-05-12  869  message_parse_error:
53500b0b54c6a11 Michael Nemanov 2024-05-12  870  	return -EIO;
53500b0b54c6a11 Michael Nemanov 2024-05-12  871  }
53500b0b54c6a11 Michael Nemanov 2024-05-12  872  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
