Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100982C7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728766835; cv=none; b=aQVHYRHWjV8Kpxt1a4+7249cNpfZbg0Z84y4v+LOPM0aLeXncuWFL9K2kAfVPIN75Dlxy7CGoCkcX/rGhY4ypZRO0HZpb76MLdNnvTjJwn5l6YqbaanwhCu9Y001HaADS744twRkY+4BmZibU0h3hI8uGXUjfhkI0IdiabtxzoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728766835; c=relaxed/simple;
	bh=x1s5BsZm3z7K+cNlKNByDk0AtmTKgIjQ5XyI+IqL9Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjAZToKjYdqltNBPKM20wVpi4Rl7NE1QchNN+5qmc7bsm6QgdAKx79qHtmvG2IPc/Z3g/zl5sNhxLHO+8CYgnsM0fAWEAyKeXLWXBLdGh2vutBxklWSNBSYqxMdY6LpEZqsj5w83gsWBB39qRDvSTDisaO3TPbuan2Wtox2xymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMn+dU2A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMn+dU2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728766833; x=1760302833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1s5BsZm3z7K+cNlKNByDk0AtmTKgIjQ5XyI+IqL9Jk=;
  b=UMn+dU2AP+yzYc1jb6OOBEGBztVZTappTFdCsWI3j/7HRFDi+oS+DWBe
   tUjQXmMPIdliys9su83fhql/s4RftZ0JqgeyTDNFCESieF3i8B6G462ck
   bYSmThWN2uxCvegfuqv50floQYZBFVXZGodDfd/2RfymgPkY3GpMW4xiV
   DI/3KRo2/V2oqjHxYGb0sdZV0Buq5DGYKZ8K4NZyeg/773vka2OAFZ0OG
   SCUtE8r3OkafrR7do3Y50zu3nc6SMIN/wZp7JmFXiU3BhAp2UO49EZNJA
   c0oe3oA1RBAsclpGO36xbFHLNOPt4rXrgp4A+HD5GtfnwNKTlZ0T8Y6B6
   A==;
X-CSE-ConnectionGUID: 5NJj1ydzQOCA+FOth6xPPA==
X-CSE-MsgGUID: 30LghxSgSEiZZWvc9eLy5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45620005"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45620005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 11:52:15 -0700
X-CSE-ConnectionGUID: f0eZpTtwSn6v80d0AM+IIA==
X-CSE-MsgGUID: VeE+BrP2SWy3KuW/Uc+H2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="78019888"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Oct 2024 11:52:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szhDn-000Dcb-0K;
	Sat, 12 Oct 2024 18:52:11 +0000
Date: Sun, 13 Oct 2024 02:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-next 88/94]
 drivers/staging/gpib/pc2/pc2_gpib.c:465:25: error: implicit declaration of
 function 'free_dma'; did you mean 'free_nmi'?
Message-ID: <202410130254.Kgk4ij6b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   728b72f4d40e1cdb5e27a187c5d89a05f8000747
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b [88/94] staging: gpib: Add KBUILD files for GPIB drivers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241013/202410130254.Kgk4ij6b-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130254.Kgk4ij6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130254.Kgk4ij6b-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/staging/gpib/agilent_82350b/agilent_82350b.h:9,
                    from drivers/staging/gpib/agilent_82350b/agilent_82350b.c:7:
>> drivers/staging/gpib/include/tms9914.h:135:18: warning: 'tms9914_num_registers' defined but not used [-Wunused-const-variable=]
     135 | static const int tms9914_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/gpibP.h:12,
                    from drivers/staging/gpib/agilent_82350b/agilent_82350b.h:7:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
   drivers/staging/gpib/cb7210/cb7210.c: In function 'cb7210_line_status':
>> drivers/staging/gpib/cb7210/cb7210.c:382:30: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
     382 |         struct nec7210_priv *nec_priv;
         |                              ^~~~~~~~
   drivers/staging/gpib/cb7210/cb7210.c: In function 'cb_gpib_config':
>> drivers/staging/gpib/cb7210/cb7210.c:1265:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1265 |         struct local_info *dev;
         |                            ^~~
>> drivers/staging/gpib/cb7210/cb7210.c:1264:31: warning: variable 'handle' set but not used [-Wunused-but-set-variable]
    1264 |         struct pcmcia_device *handle;
         |                               ^~~~~~
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/cb7210/cb7210.h:7,
                    from drivers/staging/gpib/cb7210/cb7210.c:8:
   drivers/staging/gpib/include/nec7210_registers.h: At top level:
>> drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/nec7210.h:16:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/cec/cec.h:7,
                    from drivers/staging/gpib/cec/cec_gpib.c:7:
>> drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/nec7210.h:16:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
   drivers/staging/gpib/eastwood/fluke_gpib.c: In function 'fluke_line_status':
>> drivers/staging/gpib/eastwood/fluke_gpib.c:196:30: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
     196 |         struct nec7210_priv *nec_priv;
         |                              ^~~~~~~~
   In file included from drivers/staging/gpib/eastwood/fluke_gpib.c:10:
   drivers/staging/gpib/eastwood/fluke_gpib.h: At top level:
>> drivers/staging/gpib/eastwood/fluke_gpib.h:140:18: warning: 'fluke_num_regs' defined but not used [-Wunused-const-variable=]
     140 | static const int fluke_num_regs = 8;
         |                  ^~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/eastwood/fluke_gpib.h:13:
>> drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/nec7210.h:16:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
   drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_line_status':
>> drivers/staging/gpib/ines/ines_gpib.c:28:30: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
      28 |         struct nec7210_priv *nec_priv;
         |                              ^~~~~~~~
   drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_gpib_config':
>> drivers/staging/gpib/ines/ines_gpib.c:1121:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1121 |         struct local_info *dev;
         |                            ^~~
   drivers/staging/gpib/ines/ines_gpib.c: At top level:
>> drivers/staging/gpib/ines/ines_gpib.c:90:18: warning: 'in_fifo_size' defined but not used [-Wunused-const-variable=]
      90 | static const int in_fifo_size = 0xff;
         |                  ^~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/ines/ines.h:11,
                    from drivers/staging/gpib/ines/ines_gpib.c:8:
>> drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/nec7210.h:16:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/gpibP.h:12,
                    from drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:31:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:270: warning: Function parameter or struct member 'leng' not described in 'send_command'
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:620: warning: expecting prototype for disable_eos(). Prototype was for usb_gpib_disable_eos() instead
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:638: warning: expecting prototype for enable_eos(). Prototype was for usb_gpib_enable_eos() instead
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:656: warning: expecting prototype for go_to_standby(). Prototype was for usb_gpib_go_to_standby() instead
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:678: warning: Function parameter or struct member 'assert' not described in 'usb_gpib_interface_clear'
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:678: warning: expecting prototype for interface_clear(). Prototype was for usb_gpib_interface_clear() instead
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c:700: warning: expecting prototype for line_status(). Prototype was for WQT() instead
--
   drivers/staging/gpib/nec7210/nec7210.c: In function 'nec7210_interrupt_have_status':
>> drivers/staging/gpib/nec7210/nec7210.c:940:30: warning: variable 'command' set but not used [-Wunused-but-set-variable]
     940 |                 unsigned int command;
         |                              ^~~~~~~
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/nec7210/board.h:16,
                    from drivers/staging/gpib/nec7210/nec7210.c:7:
   drivers/staging/gpib/include/nec7210_registers.h: At top level:
>> drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/gpibP.h:12,
                    from drivers/staging/gpib/nec7210/board.h:10:
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
   drivers/staging/gpib/ni_usb/ni_usb_gpib.c: In function 'parse_board_ibrd_readback':
>> drivers/staging/gpib/ni_usb/ni_usb_gpib.c:441:22: warning: variable 'adr1_bits' set but not used [-Wunused-but-set-variable]
     441 |         unsigned int adr1_bits;
         |                      ^~~~~~~~~
   In file included from drivers/staging/gpib/ni_usb/ni_usb_gpib.c:14:
   drivers/staging/gpib/include/tnt4882_registers.h: At top level:
>> drivers/staging/gpib/include/tnt4882_registers.h:43:18: warning: 'tnt_pagein_offset' defined but not used [-Wunused-const-variable=]
      43 | static const int tnt_pagein_offset = 0x11;
         |                  ^~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/ni_usb/ni_usb_gpib.c:13:
>> drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/gpibP.h:12,
                    from drivers/staging/gpib/ni_usb/ni_usb_gpib.h:14,
                    from drivers/staging/gpib/ni_usb/ni_usb_gpib.c:11:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
   drivers/staging/gpib/pc2/pc2_gpib.c: In function 'pc2_detach':
>> drivers/staging/gpib/pc2/pc2_gpib.c:465:25: error: implicit declaration of function 'free_dma'; did you mean 'free_nmi'? [-Wimplicit-function-declaration]
     465 |                         free_dma(nec_priv->dma_channel);
         |                         ^~~~~~~~
         |                         free_nmi
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/pc2/pc2_gpib.c:16:
   drivers/staging/gpib/include/nec7210_registers.h: At top level:
>> drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/nec7210.h:16:
>> drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
--
>> drivers/staging/gpib/tms9914/tms9914.c:819:18: warning: 'iomem_size' defined but not used [-Wunused-const-variable=]
     819 | static const int iomem_size = 0x2000;
         |                  ^~~~~~~~~~
   In file included from drivers/staging/gpib/tms9914/tms9914.c:22:
>> drivers/staging/gpib/include/tms9914.h:135:18: warning: 'tms9914_num_registers' defined but not used [-Wunused-const-variable=]
     135 | static const int tms9914_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/gpibP.h:12,
                    from drivers/staging/gpib/tms9914/tms9914.c:21:
>> drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +465 drivers/staging/gpib/pc2/pc2_gpib.c

0dc1ad1c0051c2 Dave Penkler 2024-09-18  456  
0dc1ad1c0051c2 Dave Penkler 2024-09-18  457  void pc2_detach(gpib_board_t *board)
0dc1ad1c0051c2 Dave Penkler 2024-09-18  458  {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  459  	struct pc2_priv *pc2_priv = board->private_data;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  460  	struct nec7210_priv *nec_priv;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  461  
0dc1ad1c0051c2 Dave Penkler 2024-09-18  462  	if (pc2_priv) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  463  		nec_priv = &pc2_priv->nec7210_priv;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  464  		if (nec_priv->dma_channel)
0dc1ad1c0051c2 Dave Penkler 2024-09-18 @465  			free_dma(nec_priv->dma_channel);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  466  		gpib_free_pseudo_irq(board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  467  		if (pc2_priv->irq)
0dc1ad1c0051c2 Dave Penkler 2024-09-18  468  			free_irq(pc2_priv->irq, board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  469  		if (nec_priv->iobase) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  470  			nec7210_board_reset(nec_priv, board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  471  			release_region((unsigned long)(nec_priv->iobase), pc2_iosize);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  472  		}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  473  		if (nec_priv->dma_buffer) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  474  			dma_free_coherent(board->dev, nec_priv->dma_buffer_length,
0dc1ad1c0051c2 Dave Penkler 2024-09-18  475  					  nec_priv->dma_buffer, nec_priv->dma_buffer_addr);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  476  			nec_priv->dma_buffer = NULL;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  477  		}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  478  	}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  479  	free_private(board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  480  }
0dc1ad1c0051c2 Dave Penkler 2024-09-18  481  

:::::: The code at line 465 was first introduced by commit
:::::: 0dc1ad1c0051c29eaca6202e08d0d5787d296649 staging: gpib: Add pc2 GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
