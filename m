Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607886;
	b=oaI5bfd6ljuqbmRojpA95y8QVQUHhxovpC9qv024LOC8rRqPegol04PMdxpHsRtoI+5t
	 IN77zMjb6+DrRh4xWRYxn/CYDzCwR53JNVobpa8PxJcit4lajmYZ0cv162gBnUZb0Lww3
	 EpVa0t414h7i8M69lmhy3dGkzZI0/mo2FeqBhLdmchf+Ar/FySddr/SJTrLg7DHx/oaSM
	 4JE+2DOBqzQNvxY6La3lm4u5QUCY3jEixgUOPt6Oww4DXOGM3riJnKgI8LtL2qlVpImJ2
	 YftsIctfG2jEZEncY9QrIwT917YkXgC25KAnMYj+MX9axIyR43t3Kwbd1SFVlg6qXsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607886;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=F7J/LRsXEPVBiIchCp9d7Mlxh7cOjZ2YwdW6MZL916A=;
	b=s50g2cxiouaXmhWhTPQFIjWoltqtig1c+i0+0yyTZ4iH+ysS/toA8+NfOmVYixWni1WO
	 8MAc/CPGJWw1hNbF3gMWTO3O8iEMWBkfmvP2Ar2jBkFbcKINbBsbfZ+QHXwp+JLrG0nHy
	 yRxnExfmqSefBHh2rjLQJXJmAibbOk5I4ZcLnoprvz2p8b7Md1bnIrEPqfSu25HFl68yS
	 PlYzxQymsqqaislakX8VEexyQ0GzbDWX3MpVWQDfuSKKi8ksyhLywOtaWW0mDZzE07Bo4
	 mpIBVtFOH66bDyXHeBW2pJYLureHnpBg+rjdpjmyauVLAmxxDXgCXTe8+0kOfL3Qa9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=epPUrlLm;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E010606A336
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 22:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E010606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=epPUrlLm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794607885; x=1826143885;
  h=date:from:to:cc:subject:message-id;
  bh=/6iFrSF8EBUrCmHXf+nbcVIhNWBLO8kWni2x08D2ZAo=;
  b=epPUrlLmz+/3lvNj4hbe7gPAb0jlOBV+nzpcpmxseNyqFAtLYlEa+saI
   pUbeNuba9XaC3R/l8G6yW2gIf2V6whXpj0GEW7Ip+qc7pFKNQxVubXxqb
   DfGfa0r7GVFzmXehGShs9JfB2i3sFcHVIvgKomJznl9Q+DY31BcnJSLVb
   c9YhP/YhdD+3UBHVEg4sUDA+3kSTQyku0AvQ9C3p4uv46AsgtcCBUQjex
   E9FNl/cDp5I4sAPj1M/tHFQL3fPCfY6SiQbfSZlxr7oSbX+AJ/xO+C/7V
   x+EdLo9PihWOm031h2L++UTCZJ+iouSwqKQDPqEAWUhaXw7utmSB+yFHP
   A==;
X-CSE-ConnectionGUID: jdNJCtn8QTq+D/odVasc2A==
X-CSE-MsgGUID: 36ZHB/tjQlO/PrTZ59DJPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3330573"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3330573"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:11:24 -0800
X-CSE-ConnectionGUID: mjggV2gYTBWtNdoI2DY68g==
X-CSE-MsgGUID: /0tRfpn4SoKn64TEB6srTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9039173"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Nov 2026 14:11:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRzUP-000000014Bn-14cQ;
	Fri, 13 Nov 2026 22:11:21 +0000
Date: Sat, 14 Nov 2026 06:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-lts 6/6]
 drivers/tty/serial/msm_geni_serial_earlycon.c:360:8: warning:
 initializer-string for array of 'char' truncates NUL terminator but
 destination lacks 'nonstring' attribute (16 chars into 15 available)
Message-ID: <202611140647.R4VlJqdg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mukesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-lts
head:   c73351b2e985e893999227194b401cb06613cd81
commit: e1be87019fc97f736f2729a2a4198d250d28633b [6/6] ANDROID: serial: msm_geni_serial_earlycon: Add Earlycon support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261114/202611140647.R4VlJqdg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140647.R4VlJqdg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140647.R4VlJqdg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/msm_geni_serial_earlycon.c: In function 'msm_geni_serial_earlycon_setup':
   drivers/tty/serial/msm_geni_serial_earlycon.c:307:13: warning: variable 'rx_stale' set but not used [-Wunused-but-set-variable=]
     307 |         u32 rx_stale = 0;
         |             ^~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:305:13: warning: variable 'rx_parity_cfg' set but not used [-Wunused-but-set-variable=]
     305 |         u32 rx_parity_cfg = 0;
         |             ^~~~~~~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:304:13: warning: variable 'rx_trans_cfg' set but not used [-Wunused-but-set-variable=]
     304 |         u32 rx_trans_cfg = 0;
         |             ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:6,
                    from include/linux/kernel.h:8,
                    from include/linux/delay.h:22,
                    from drivers/tty/serial/msm_geni_serial_earlycon.c:6:
   drivers/tty/serial/msm_geni_serial_earlycon.c: At top level:
>> drivers/tty/serial/msm_geni_serial_earlycon.c:360:8: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (16 chars into 15 available) [-Wunterminated-string-initialization]
     360 |                         msm_geni_serial_earlycon_setup);
         | ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      
   include/linux/stringify.h:9:34: note: in definition of macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                  ^
   include/linux/serial_core.h:372:29: note: in expansion of macro '__stringify'
     372 |                 = { .name = __stringify(_name),                         \
         |                             ^~~~~~~~~~~
   include/linux/serial_core.h:380:9: note: in expansion of macro '_OF_EARLYCON_DECLARE'
     380 |         _OF_EARLYCON_DECLARE(_name, compat, fn,                         \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:359:1: note: in expansion of macro 'OF_EARLYCON_DECLARE'
     359 | OF_EARLYCON_DECLARE(msm_geni_serial, "qcom,msm-geni-console",
         | ^~~~~~~~~~~~~~~~~~~


vim +360 drivers/tty/serial/msm_geni_serial_earlycon.c

   296	
   297	static int __init
   298	msm_geni_serial_earlycon_setup(struct earlycon_device *dev,
   299					const char *opt)
   300	{
   301		int ret = 0;
   302		u32 tx_trans_cfg = 0;
   303		u32 tx_parity_cfg = 0;
 > 304		u32 rx_trans_cfg = 0;
   305		u32 rx_parity_cfg = 0;
   306		u32 stop_bit = 0;
   307		u32 rx_stale = 0;
   308		u32 bits_per_char = 0;
   309		unsigned long cfg0, cfg1;
   310		struct uart_port *uport = &dev->port;
   311	
   312		if (!uport->membase) {
   313			ret = -ENOMEM;
   314			goto exit;
   315		}
   316	
   317		if (get_se_proto_earlycon(uport->membase) != UART_PROTOCOL) {
   318			ret = -ENXIO;
   319			goto exit;
   320		}
   321	
   322		/*
   323		 * Ignore Flow control.
   324		 * Disable Tx Parity.
   325		 * Don't check Parity during Rx.
   326		 * Disable Rx Parity.
   327		 * n = 8.
   328		 * Stop bit = 0.
   329		 * Stale timeout in bit-time (3 chars worth).
   330		 */
   331		tx_trans_cfg |= UART_CTS_MASK;
   332		tx_parity_cfg = 0;
   333		rx_trans_cfg = 0;
   334		rx_parity_cfg = 0;
   335		bits_per_char = 0x8;
   336		stop_bit = 0;
   337		rx_stale = 0x18;
   338	
   339		msm_geni_serial_poll_abort_tx(uport);
   340	
   341		se_get_packing_config_earlycon(8, 1, false, &cfg0, &cfg1);
   342	
   343		se_io_init_earlycon(uport->membase);
   344	
   345		geni_se_select_fifo_mode_earlycon(uport->membase);
   346		writel_relaxed(cfg0, uport->membase + SE_GENI_TX_PACKING_CFG0);
   347		writel_relaxed(cfg1, uport->membase + SE_GENI_TX_PACKING_CFG1);
   348		writel_relaxed(tx_trans_cfg, uport->membase + SE_UART_TX_TRANS_CFG);
   349		writel_relaxed(tx_parity_cfg, uport->membase + SE_UART_TX_PARITY_CFG);
   350		writel_relaxed(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
   351		writel_relaxed(stop_bit, uport->membase + SE_UART_TX_STOP_BIT_LEN);
   352	
   353		dev->con->write = msm_geni_serial_early_console_write;
   354		dev->con->setup = NULL;
   355	exit:
   356		return ret;
   357	}
   358	
   359	OF_EARLYCON_DECLARE(msm_geni_serial, "qcom,msm-geni-console",
 > 360				msm_geni_serial_earlycon_setup);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
