Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789813AD3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855336; cv=none; b=UMGZe2r8HSW4oMsUkqGpjBTZ3DWn8WkZW3w0fg58TIEvX0A+VlItOYF5l1+fqNtE+TFibFmmeW/RWd37BCunKrIR+dz4JPCeq2pVnjf6TaoLAdKiVLEaugJlG1RN7GlAWDys7Z5Eky1vXFxRj8+iCg5coPBcoQRY+E1A9QqXTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855336; c=relaxed/simple;
	bh=yh2iTarpWYd+hEGdioPZMLP7L5r4AIJNP7jImp9V3Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IB1VQhSTJhBlGALH2i6T0CYOBdV6mpzCXY1VDWrLrrpHw75R+iRxhApE2Z2LgKLzxVmWwNxz+6+dAKjPMVYwu+SIC8Q2jz8um17muZefQbkfKn2OyPcucabr7C3z0GQfo+gXjALfIqbMVmCxPy3Qi6WWPWH9TX/R2O4IGmYYRI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nk/J7t5H; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nk/J7t5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752855334; x=1784391334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yh2iTarpWYd+hEGdioPZMLP7L5r4AIJNP7jImp9V3Dw=;
  b=nk/J7t5HVdi7GwSNuHEMVWXNed2aGy1U0MUTdKc1RZ8x1arhOg5ROiTz
   MLnKIY5rxTqjuvd6D0hE9zMa192PHbpwTTyvs+uaxG4+wXgsRJWtOau6K
   mxObdXNQ2p/vxS/DYTYDPGLkb1VKSNo6+f9Aj3RvAjf8i+pJG5nQvG1+V
   Ly1Sif1IMP6kWYaSaxaJiz8MONVGfGX4NyEY5svJ9VlRQtg2wrEfa2fx2
   txP+LezwvxZvKNH5F/R/FAq1vtdOd0EO+FRNBYDbZeKWjCcvGeLSSGjf+
   XlpLqIyUSOOO0K1M929uqVEKZnPkMEZUrm8xhkEQ5cmLuy0GX6Mtm8bOL
   A==;
X-CSE-ConnectionGUID: fm0QGZ71QmWGjwRiqVTo7Q==
X-CSE-MsgGUID: 6AlBvILZQOexboYCMEJRlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55007021"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="55007021"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 09:15:30 -0700
X-CSE-ConnectionGUID: syCbtrJIRAKPTBMBK4ffJg==
X-CSE-MsgGUID: O7A8McR5TGiIikqRMPU6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="158574534"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jul 2025 09:15:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucnk7-000Epf-0w;
	Fri, 18 Jul 2025 16:15:27 +0000
Date: Sat, 19 Jul 2025 00:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-07-18 157/157]
 drivers/media/cec/usb/pulse8/pulse8-cec.c:698:3: error: implicit declaration
 of function 'str_on_off'; did you mean 'tracing_off'?
Message-ID: <202507190033.o5BAHIgq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-07-18
head:   ea52943b017c3b53f3f8c9ff679ccfb8eaae222a
commit: ea52943b017c3b53f3f8c9ff679ccfb8eaae222a [157/157] all
config: nios2-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190033.o5BAHIgq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190033.o5BAHIgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190033.o5BAHIgq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/serio.h:15,
                    from drivers/media/cec/usb/pulse8/pulse8-cec.c:37:
   drivers/media/cec/usb/pulse8/pulse8-cec.c: In function 'pulse8_setup':
>> drivers/media/cec/usb/pulse8/pulse8-cec.c:698:3: error: implicit declaration of function 'str_on_off'; did you mean 'tracing_off'? [-Werror=implicit-function-declaration]
      str_on_off(data[0]));
      ^~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
       _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
                                      ^~~~~~~~~~~
   drivers/media/cec/usb/pulse8/pulse8-cec.c:697:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(pulse8->dev, "Autonomous mode: %s",
     ^~~~~~~
>> drivers/media/cec/usb/pulse8/pulse8-cec.c:697:23: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
     dev_dbg(pulse8->dev, "Autonomous mode: %s",
                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:139:28: note: in definition of macro 'dev_no_printk'
       _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
                               ^~~
   include/linux/dev_printk.h:171:33: note: in expansion of macro 'dev_fmt'
     dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                    ^~~~~~~
   drivers/media/cec/usb/pulse8/pulse8-cec.c:697:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(pulse8->dev, "Autonomous mode: %s",
     ^~~~~~~
   drivers/media/cec/usb/pulse8/pulse8-cec.c:704:25: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
       dev_dbg(pulse8->dev, "Auto Power On: %s",
                            ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:139:28: note: in definition of macro 'dev_no_printk'
       _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
                               ^~~
   include/linux/dev_printk.h:171:33: note: in expansion of macro 'dev_fmt'
     dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                    ^~~~~~~
   drivers/media/cec/usb/pulse8/pulse8-cec.c:704:4: note: in expansion of macro 'dev_dbg'
       dev_dbg(pulse8->dev, "Auto Power On: %s",
       ^~~~~~~
   cc1: some warnings being treated as errors


vim +698 drivers/media/cec/usb/pulse8/pulse8-cec.c

   662	
   663	static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
   664				struct cec_log_addrs *log_addrs, u16 *pa)
   665	{
   666		u8 *data = pulse8->data + 1;
   667		u8 cmd[2];
   668		int err;
   669		time64_t date;
   670	
   671		pulse8->vers = 0;
   672	
   673		cmd[0] = MSGCODE_FIRMWARE_VERSION;
   674		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 2);
   675		if (err)
   676			return err;
   677		pulse8->vers = (data[0] << 8) | data[1];
   678		dev_info(pulse8->dev, "Firmware version %04x\n", pulse8->vers);
   679		if (pulse8->vers < 2) {
   680			*pa = CEC_PHYS_ADDR_INVALID;
   681			return 0;
   682		}
   683	
   684		cmd[0] = MSGCODE_GET_BUILDDATE;
   685		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 4);
   686		if (err)
   687			return err;
   688		date = ((unsigned)data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
   689		dev_info(pulse8->dev, "Firmware build date %ptT\n", &date);
   690	
   691		dev_dbg(pulse8->dev, "Persistent config:\n");
   692		cmd[0] = MSGCODE_GET_AUTO_ENABLED;
   693		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
   694		if (err)
   695			return err;
   696		pulse8->autonomous = data[0];
 > 697		dev_dbg(pulse8->dev, "Autonomous mode: %s",
 > 698			str_on_off(data[0]));
   699	
   700		if (pulse8->vers >= 10) {
   701			cmd[0] = MSGCODE_GET_AUTO_POWER_ON;
   702			err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
   703			if (!err)
   704				dev_dbg(pulse8->dev, "Auto Power On: %s",
   705					str_on_off(data[0]));
   706		}
   707	
   708		cmd[0] = MSGCODE_GET_DEVICE_TYPE;
   709		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
   710		if (err)
   711			return err;
   712		log_addrs->primary_device_type[0] = data[0];
   713		dev_dbg(pulse8->dev, "Primary device type: %d\n", data[0]);
   714		switch (log_addrs->primary_device_type[0]) {
   715		case CEC_OP_PRIM_DEVTYPE_TV:
   716			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_TV;
   717			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
   718			break;
   719		case CEC_OP_PRIM_DEVTYPE_RECORD:
   720			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_RECORD;
   721			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_RECORD;
   722			break;
   723		case CEC_OP_PRIM_DEVTYPE_TUNER:
   724			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_TUNER;
   725			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_TUNER;
   726			break;
   727		case CEC_OP_PRIM_DEVTYPE_PLAYBACK:
   728			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
   729			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_PLAYBACK;
   730			break;
   731		case CEC_OP_PRIM_DEVTYPE_AUDIOSYSTEM:
   732			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
   733			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM;
   734			break;
   735		case CEC_OP_PRIM_DEVTYPE_SWITCH:
   736			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_UNREGISTERED;
   737			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
   738			break;
   739		case CEC_OP_PRIM_DEVTYPE_PROCESSOR:
   740			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_SPECIFIC;
   741			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
   742			break;
   743		default:
   744			log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_UNREGISTERED;
   745			log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
   746			dev_info(pulse8->dev, "Unknown Primary Device Type: %d\n",
   747				 log_addrs->primary_device_type[0]);
   748			break;
   749		}
   750	
   751		cmd[0] = MSGCODE_GET_LOGICAL_ADDRESS_MASK;
   752		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 2);
   753		if (err)
   754			return err;
   755		log_addrs->log_addr_mask = (data[0] << 8) | data[1];
   756		dev_dbg(pulse8->dev, "Logical address ACK mask: %x\n",
   757			log_addrs->log_addr_mask);
   758		if (log_addrs->log_addr_mask)
   759			log_addrs->num_log_addrs = 1;
   760	
   761		cmd[0] = MSGCODE_GET_PHYSICAL_ADDRESS;
   762		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
   763		if (err)
   764			return err;
   765		*pa = (data[0] << 8) | data[1];
   766		dev_dbg(pulse8->dev, "Physical address: %x.%x.%x.%x\n",
   767			cec_phys_addr_exp(*pa));
   768	
   769		log_addrs->cec_version = CEC_OP_CEC_VERSION_1_4;
   770		if (pulse8->vers < 10) {
   771			cmd[0] = MSGCODE_GET_HDMI_VERSION;
   772			err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
   773			if (err)
   774				return err;
   775			log_addrs->cec_version = data[0];
   776			dev_dbg(pulse8->dev, "CEC version: %d\n", log_addrs->cec_version);
   777		}
   778	
   779		cmd[0] = MSGCODE_GET_OSD_NAME;
   780		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 0);
   781		if (err)
   782			return err;
   783		strscpy(log_addrs->osd_name, data, sizeof(log_addrs->osd_name));
   784		dev_dbg(pulse8->dev, "OSD name: %s\n", log_addrs->osd_name);
   785	
   786		return 0;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
