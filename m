Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43512D94B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 22:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097096; cv=none; b=NeT2JSILHhn/lyxlZ5Pw2jcRghbByXuWkwKlPdFHiR980SLDxrCkOxwKIzT8/aAYiv1AA2n5nBYiDElFITsUGTd58rqukM+H5gL/mz3JL+2JgGEYyiUafQliNE86O9CEUPb88ogBaW7rDGTMWYCf3YpapXxjQwJ9JwakD3mhCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097096; c=relaxed/simple;
	bh=/5dkCNwy9dNsCUn8z6xBGJtmN1aw2J0QO6Ipj2esJCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RucD8oMQUvR313Hl2nSwY8VEhCLGMAgAgtHjjAckE0I2rNzVXh5Dmfi6GDiupSKm9eAASEFF6c+HFK/nYnVQfrUMv8COeFJ/Gd1TVm0uCejWgh9RM4zLgQVFd6Kw3lpk5LiLmqgHSIXdzVFhk9BmmRmdd2ax0SBiIVAqApBmAXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alHPMvWs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alHPMvWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766097095; x=1797633095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5dkCNwy9dNsCUn8z6xBGJtmN1aw2J0QO6Ipj2esJCM=;
  b=alHPMvWsBYJUCVTgVwiHtD4zJluq14H2DS2EPtRFYfsi+o5iN5cf1y/A
   dTpS4Q3pFHXxaBWCjW899nqSNhCC3Jw4Uv+24PxBnFVgZDtQCd4XDA/D8
   JOlPxU4sF5z01ibQm9If5jb+fTSdq5Ck/VJN44nI5tv/iFeVp58jVidTp
   0af+iigKZndQ4GmaYTsi7O0kxnDb3v0ZyzSMXGR2T+1JzU/it6Kfl/5B+
   l9Pj+5wIA4iGhLrhwGSy5uJ0Xz6BAM3eszRsQZx2WAQ3b7s/4wVvIoA3r
   /BTlVTtR5lYrIEDRTur7HP/pZoyfGo+Hkk6SAHR33ywUEhlTtDnPdKJGn
   A==;
X-CSE-ConnectionGUID: BcNTuoieS/W7KxaYeE2eEA==
X-CSE-MsgGUID: fv65hteFSa2FyGeEkQOvxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67811865"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67811865"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 14:31:34 -0800
X-CSE-ConnectionGUID: RL41qQaESeGm7VFEdYv53g==
X-CSE-MsgGUID: 5783pPgpSO25W+H+H29+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="199174931"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Dec 2025 14:31:33 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWMWw-000000002j4-37sX;
	Thu, 18 Dec 2025 22:31:30 +0000
Date: Fri, 19 Dec 2025 06:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 drivers/tty/serial/msm_geni_serial_earlycon.c:360:8: warning:
 initializer-string for array of 'char' truncates NUL terminator but
 destination lacks 'nonstring' attribute (16 chars into 15 available)
Message-ID: <202512190651.fDVf9u5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mukesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: e1be87019fc97f736f2729a2a4198d250d28633b [4/4] ANDROID: serial: msm_geni_serial_earlycon: Add Earlycon support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512190651.fDVf9u5V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190651.fDVf9u5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190651.fDVf9u5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/msm_geni_serial_earlycon.c: In function 'msm_geni_serial_earlycon_setup':
   drivers/tty/serial/msm_geni_serial_earlycon.c:307:13: warning: variable 'rx_stale' set but not used [-Wunused-but-set-variable]
     307 |         u32 rx_stale = 0;
         |             ^~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:305:13: warning: variable 'rx_parity_cfg' set but not used [-Wunused-but-set-variable]
     305 |         u32 rx_parity_cfg = 0;
         |             ^~~~~~~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:304:13: warning: variable 'rx_trans_cfg' set but not used [-Wunused-but-set-variable]
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
