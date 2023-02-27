Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7FD79E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677519655; x=1709055655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEBvDfrz3glFthFHebExsqWI/1PmnfhZQwlNEf1D5Ww=;
  b=W7s7VU/WxEtSi4KyE2nYsUePuOmILVUOkBWt8cVnCpCaYW8Uys5tFlul
   33V+1uagx9ZWSCX2sBTgk69ldXTH6WBcDKbSP3c6DMvWz9q60p8FC19ld
   mIdF/mvsDaVfedITFIUHCf5ZIMHnsIJcPWkdbnGFycYY1rmQgWnmzkTbg
   iNFI/jIrE4KdQCdNsNeDN7SX1mXR3WsX4bWJ5xec2q/UXpIpz8stNlN3D
   Bosikk98R4xi7MQRU4pI88FbirOP9PAYN/AVmvhgYcLHDqa1l7IRu3BFN
   CPKlxNonZiRxKiuiaPPm6Uy7U5wQnwqDItzrtDNEw//rwjBFTVhPYLXZM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336205080"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="336205080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 09:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="737825107"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="737825107"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2023 09:40:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWhUa-0004db-0V;
	Mon, 27 Feb 2023 17:40:52 +0000
Date: Tue, 28 Feb 2023 01:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 145/583]
 drivers/usb/host/dwc_common_port/dwc_crypto.c:80: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202302280126.PmUJZj3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi popcornmix,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 6683bf57769cfcf2d9187b56b0e81c4ed93767dc [145/583] Add dwc_otg driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280126.PmUJZj3n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/6683bf57769cfcf2d9187b56b0e81c4ed93767dc
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 6683bf57769cfcf2d9187b56b0e81c4ed93767dc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/ drivers/dma/ drivers/gpio/ drivers/irqchip/ drivers/misc/ drivers/mmc/host/ drivers/perf/ drivers/usb/host/dwc_common_port/ drivers/usb/host/dwc_otg/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280126.PmUJZj3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/dwc_common_port/dwc_crypto.c:80: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Encrypts an array of bytes using the AES encryption engine.
   drivers/usb/host/dwc_common_port/dwc_crypto.c:108: warning: Function parameter or member 'key' not described in 'dwc_wusb_cmf'
   drivers/usb/host/dwc_common_port/dwc_crypto.c:108: warning: Function parameter or member 'nonce' not described in 'dwc_wusb_cmf'
   drivers/usb/host/dwc_common_port/dwc_crypto.c:108: warning: Function parameter or member 'label' not described in 'dwc_wusb_cmf'
   drivers/usb/host/dwc_common_port/dwc_crypto.c:108: warning: Function parameter or member 'bytes' not described in 'dwc_wusb_cmf'
   drivers/usb/host/dwc_common_port/dwc_crypto.c:108: warning: Function parameter or member 'len' not described in 'dwc_wusb_cmf'
   drivers/usb/host/dwc_common_port/dwc_crypto.c:108: warning: Function parameter or member 'result' not described in 'dwc_wusb_cmf'
>> drivers/usb/host/dwc_common_port/dwc_crypto.c:108: warning: expecting prototype for The CCM-MAC(). Prototype was for dwc_wusb_cmf() instead
   drivers/usb/host/dwc_common_port/dwc_crypto.c:187: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The PRF function described in section 6.5 of the WUSB spec. This function
   drivers/usb/host/dwc_common_port/dwc_crypto.c:208: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Fills in CCM Nonce per the WUSB spec.
   drivers/usb/host/dwc_common_port/dwc_crypto.c:237: warning: Function parameter or member 'addr' not described in 'dwc_wusb_gen_nonce'
   drivers/usb/host/dwc_common_port/dwc_crypto.c:237: warning: Function parameter or member 'nonce' not described in 'dwc_wusb_gen_nonce'
>> drivers/usb/host/dwc_common_port/dwc_crypto.c:237: warning: expecting prototype for Generates a 16-byte cryptographic(). Prototype was for dwc_wusb_gen_nonce() instead
   drivers/usb/host/dwc_common_port/dwc_crypto.c:257: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Generates the Session Key (PTK) and Key Confirmation Key (KCK) per the
   drivers/usb/host/dwc_common_port/dwc_crypto.c:292: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Generates the Message Integrity Code over the Handshake data per the
--
   drivers/usb/host/dwc_common_port/dwc_common_linux.c: In function 'DWC_VPRINTF':
   drivers/usb/host/dwc_common_port/dwc_common_linux.c:221:9: warning: function 'DWC_VPRINTF' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     221 |         vprintk(format, args);
         |         ^~~~~~~
   drivers/usb/host/dwc_common_port/dwc_common_linux.c: In function 'DWC_VSNPRINTF':
   drivers/usb/host/dwc_common_port/dwc_common_linux.c:226:9: warning: function 'DWC_VSNPRINTF' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     226 |         return vsnprintf(str, size, format, args);
         |         ^~~~~~
   drivers/usb/host/dwc_common_port/dwc_common_linux.c: At top level:
>> drivers/usb/host/dwc_common_port/dwc_common_linux.c:580:17: warning: no previous prototype for 'DWC_SPINLOCK_ALLOC' [-Wmissing-prototypes]
     580 | dwc_spinlock_t *DWC_SPINLOCK_ALLOC(void)
         |                 ^~~~~~~~~~~~~~~~~~
--
   drivers/usb/host/dwc_otg/dwc_otg_driver.c: In function 'dwc_otg_driver_init':
>> drivers/usb/host/dwc_otg/dwc_otg_driver.c:1087:13: warning: variable 'error' set but not used [-Wunused-but-set-variable]
    1087 |         int error;
         |             ^~~~~
--
   drivers/usb/host/dwc_otg/dwc_otg_attr.c: In function 'dwc_otg_attr_create':
>> drivers/usb/host/dwc_otg/dwc_otg_attr.c:1117:13: warning: variable 'error' set but not used [-Wunused-but-set-variable]
    1117 |         int error;
         |             ^~~~~
--
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:797:5: warning: no previous prototype for 'dwc_otg_save_gintmsk_reg' [-Wmissing-prototypes]
     797 | int dwc_otg_save_gintmsk_reg(dwc_otg_core_if_t * core_if)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_cil.c: In function 'dwc_otg_core_dev_init':
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:1652:23: warning: variable 'hwcfg3' set but not used [-Wunused-but-set-variable]
    1652 |         hwcfg3_data_t hwcfg3 = {.d32 = 0 };
         |                       ^~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_cil.c: At top level:
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:2680:6: warning: no previous prototype for 'set_pid_isoc' [-Wmissing-prototypes]
    2680 | void set_pid_isoc(dwc_hc_t * hc)
         |      ^~~~~~~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_cil.c: In function 'dwc_otg_read_setup_packet':
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:3182:30: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    3182 |         device_grxsts_data_t status;
         |                              ^~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_cil.c: In function 'write_isoc_tx_fifo':
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:3653:35: warning: variable 'ep_regs' set but not used [-Wunused-but-set-variable]
    3653 |         dwc_otg_dev_in_ep_regs_t *ep_regs;
         |                                   ^~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_cil.c: In function 'dwc_otg_ep0_continue_transfer':
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:4314:33: warning: variable 'tx_status' set but not used [-Wunused-but-set-variable]
    4314 |                 gnptxsts_data_t tx_status = {.d32 = 0 };
         |                                 ^~~~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_cil.c: At top level:
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:6274:9: warning: no previous prototype for 'dwc_otg_get_param_thr_ctl' [-Wmissing-prototypes]
    6274 | int32_t dwc_otg_get_param_thr_ctl(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:6320:9: warning: no previous prototype for 'dwc_otg_get_param_tx_thr_length' [-Wmissing-prototypes]
    6320 | int32_t dwc_otg_get_param_tx_thr_length(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:6337:9: warning: no previous prototype for 'dwc_otg_get_param_rx_thr_length' [-Wmissing-prototypes]
    6337 | int32_t dwc_otg_get_param_rx_thr_length(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:7109:10: warning: no previous prototype for 'dwc_otg_get_otg_version' [-Wmissing-prototypes]
    7109 | uint16_t dwc_otg_get_otg_version(dwc_otg_core_if_t * core_if)
         |          ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil.c:7120:6: warning: no previous prototype for 'dwc_otg_pcd_start_srp_timer' [-Wmissing-prototypes]
    7120 | void dwc_otg_pcd_start_srp_timer(dwc_otg_core_if_t * core_if)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/usb/host/dwc_otg/dwc_otg_attr.c:480: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function returning the otg_device structure of the given device
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:490: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the register offset of the Register Access.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:501: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set the register offset for the next Register Access         Read/Write
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:525: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the value of the register at the offset in the reg_offset
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:551: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Store the value in the register at the offset in the reg_offset
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:620: warning: Cannot understand  * @todo Add code to initiate the HNP.
    on line 620 - I thought it was a doc line
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:623: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the HNP status bit
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:634: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set the HNP Request bit
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:649: warning: Cannot understand  * @todo Add code to initiate the SRP.
    on line 649 - I thought it was a doc line
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:652: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the SRP status bit
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:667: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set the SRP Request bit
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:683: warning: Cannot understand  * @todo Need to do more for power on/off?
    on line 683 - I thought it was a doc line
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:686: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the Bus Power status
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:697: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set the Bus Power status
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:712: warning: Cannot understand  * @todo Need to do more for suspend?
    on line 712 - I thought it was a doc line
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:715: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the Bus Suspend status
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:726: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set the Bus Suspend status
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:741: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the Mode Change Ready Timer status
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:752: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set the Mode Change Ready Timer status
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:767: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the value of HFIR Frame Interval bitfield
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:778: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set the HFIR Frame Interval value
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:793: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the status of Remote Wakeup.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:812: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initiate a remote wakeup of the host.  The Device control register
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:838: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Show the whether core is hibernated or not.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:859: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initiate a remote wakeup of the device to exit from hibernation.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:894: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dump global registers and either host or device registers (depending on the
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:915: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dump global registers and either host or device registers (depending on the
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:933: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dump the current hcd state.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:948: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dump the average frame remaining at SOF. This can be used to
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:966: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Displays the time required to read the GNPTXFSIZ register many times (the
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:994: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Displays the time required to write the GNPTXFSIZ register many times (the
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:1024: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * Show the lpm_response attribute.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:1042: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * Store the lpm_response attribute.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:1066: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * Show the sleep_status attribute.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:1077: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Store the sleep_status attribure.
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:1105: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Create the device files
   drivers/usb/host/dwc_otg/dwc_otg_attr.c:1161: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Remove the device files
--
>> drivers/usb/host/dwc_otg/dwc_otg_driver.c:257: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function shows the Driver Version.
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:268: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Global Debug Level Mask.
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:273: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function shows the driver Debug Level.
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:281: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function stores the driver Debug Level.
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:293: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called during module intialization
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:562: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is the top level interrupt handler for the Common
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:577: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called when a lm_device is unregistered with the
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:669: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called when an lm_device is bound to a
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:1006: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This structure defines the methods to be called by a bus driver
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:1075: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called when the dwc_otg_driver is installed with the
   drivers/usb/host/dwc_otg/dwc_otg_driver.c:1128: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called when the driver is removed from the kernel
--
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:64:9: warning: no previous prototype for 'dwc_otg_handle_mode_mismatch_intr' [-Wmissing-prototypes]
      64 | int32_t dwc_otg_handle_mode_mismatch_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:84:9: warning: no previous prototype for 'dwc_otg_handle_otg_intr' [-Wmissing-prototypes]
      84 | int32_t dwc_otg_handle_otg_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:323:9: warning: no previous prototype for 'dwc_otg_handle_conn_id_status_change_intr' [-Wmissing-prototypes]
     323 | int32_t dwc_otg_handle_conn_id_status_change_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:370:9: warning: no previous prototype for 'dwc_otg_handle_session_req_intr' [-Wmissing-prototypes]
     370 | int32_t dwc_otg_handle_session_req_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:438:9: warning: no previous prototype for 'dwc_otg_handle_wakeup_detected_intr' [-Wmissing-prototypes]
     438 | int32_t dwc_otg_handle_wakeup_detected_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:910:9: warning: no previous prototype for 'dwc_otg_handle_restore_done_intr' [-Wmissing-prototypes]
     910 | int32_t dwc_otg_handle_restore_done_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:935:9: warning: no previous prototype for 'dwc_otg_handle_disconnect_intr' [-Wmissing-prototypes]
     935 | int32_t dwc_otg_handle_disconnect_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:1020:9: warning: no previous prototype for 'dwc_otg_handle_usb_suspend_intr' [-Wmissing-prototypes]
    1020 | int32_t dwc_otg_handle_usb_suspend_intr(dwc_otg_core_if_t * core_if)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c: In function 'dwc_otg_handle_usb_suspend_intr':
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:1022:21: warning: variable 'dsts' set but not used [-Wunused-but-set-variable]
    1022 |         dsts_data_t dsts;
         |                     ^~~~
--
>> drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:78: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function handles the OTG Interrupts. It reads the OTG
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:313: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function handles the Connector ID Status Change Interrupt.  It
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:362: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that a device is initiating the Session
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:432: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that the DWC_otg controller has detected a
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:514: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that the Wakeup Logic has detected a
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:581: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that the Wakeup Logic has detected a
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:803: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that the Wakeup Logic has detected a
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:838: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that the Wakeup Logic has detected a
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:932: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that a device has been disconnected from
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:1011: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This interrupt indicates that SUSPEND state has been detected on
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:1282: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function hadles LPM transaction received interrupt.
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:1321: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function returns the Core Interrupt register.
   drivers/usb/host/dwc_otg/dwc_otg_cil_intr.c:1397: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Common interrupt handler.
--
   drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c: In function 'ep_queue':
>> drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c:324:25: warning: variable 'is_isoc_ep' set but not used [-Wunused-but-set-variable]
     324 |         int retval = 0, is_isoc_ep = 0;
         |                         ^~~~~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c: At top level:
>> drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c:1021:6: warning: no previous prototype for 'gadget_add_eps' [-Wmissing-prototypes]
    1021 | void gadget_add_eps(struct gadget_wrapper *d)
         |      ^~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c:1203:5: warning: no previous prototype for 'pcd_init' [-Wmissing-prototypes]
    1203 | int pcd_init(dwc_bus_dev_t *_dev)
         |     ^~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_pcd_linux.c:1246:6: warning: no previous prototype for 'pcd_remove' [-Wmissing-prototypes]
    1246 | void pcd_remove(dwc_bus_dev_t *_dev)
         |      ^~~~~~~~~~
--
>> drivers/usb/host/dwc_otg/dwc_otg_pcd.c:240:25: warning: no previous prototype for 'dwc_otg_ep_alloc_desc_chain' [-Wmissing-prototypes]
     240 | dwc_otg_dev_dma_desc_t *dwc_otg_ep_alloc_desc_chain(struct device *dev,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/dwc_otg/dwc_otg_pcd.c:251:6: warning: no previous prototype for 'dwc_otg_ep_free_desc_chain' [-Wmissing-prototypes]
     251 | void dwc_otg_ep_free_desc_chain(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_pcd.c: In function 'start_xfer_tasklet_func':
>> drivers/usb/host/dwc_otg/dwc_otg_pcd.c:1092:31: warning: variable 'diepctl' set but not used [-Wunused-but-set-variable]
    1092 |                 depctl_data_t diepctl;
         |                               ^~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_pcd.c:1079:23: warning: variable 'diepctl' set but not used [-Wunused-but-set-variable]
    1079 |         depctl_data_t diepctl;
         |                       ^~~~~~~
   drivers/usb/host/dwc_otg/dwc_otg_pcd.c: At top level:
>> drivers/usb/host/dwc_otg/dwc_otg_pcd.c:2501:6: warning: no previous prototype for 'dwc_otg_pcd_rem_wkup_from_suspend' [-Wmissing-prototypes]
    2501 | void dwc_otg_pcd_rem_wkup_from_suspend(dwc_otg_pcd_t * pcd, int set)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +80 drivers/usb/host/dwc_common_port/dwc_crypto.c

    78	
    79	/**
  > 80	 * Encrypts an array of bytes using the AES encryption engine.
    81	 * If <code>dst</code> == <code>src</code>, then the bytes will be encrypted
    82	 * in-place.
    83	 *
    84	 * @return  0 on success, negative error code on error.
    85	 */
    86	int dwc_wusb_aes_encrypt(u8 *src, u8 *key, u8 *dst)
    87	{
    88		u8 block_t[16];
    89		DWC_MEMSET(block_t, 0, 16);
    90	
    91		return DWC_AES_CBC(src, 16, key, 16, block_t, dst);
    92	}
    93	
    94	/**
    95	 * The CCM-MAC-FUNCTION described in section 6.5 of the WUSB spec.
    96	 * This function takes a data string and returns the encrypted CBC
    97	 * Counter-mode MIC.
    98	 *
    99	 * @param key     The 128-bit symmetric key.
   100	 * @param nonce   The CCM nonce.
   101	 * @param label   The unique 14-byte ASCII text label.
   102	 * @param bytes   The byte array to be encrypted.
   103	 * @param len     Length of the byte array.
   104	 * @param result  Byte array to receive the 8-byte encrypted MIC.
   105	 */
   106	void dwc_wusb_cmf(u8 *key, u8 *nonce,
   107			  char *label, u8 *bytes, int len, u8 *result)
 > 108	{
   109		u8 block_m[16];
   110		u8 block_x[16];
   111		u8 block_t[8];
   112		int idx, blkNum;
   113		u16 la = (u16)(len + 14);
   114	
   115		/* Set the AES-128 key */
   116		//dwc_aes_setkey(tfm, key, 16);
   117	
   118		/* Fill block B0 from flags = 0x59, N, and l(m) = 0 */
   119		block_m[0] = 0x59;
   120		for (idx = 0; idx < 13; idx++)
   121			block_m[idx + 1] = nonce[idx];
   122		block_m[14] = 0;
   123		block_m[15] = 0;
   124	
   125		/* Produce the CBC IV */
   126		dwc_wusb_aes_encrypt(block_m, key, block_x);
   127		show_block(block_m, "CBC IV in: ", "\n", 0);
   128		show_block(block_x, "CBC IV out:", "\n", 0);
   129	
   130		/* Fill block B1 from l(a) = Blen + 14, and A */
   131		block_x[0] ^= (u8)(la >> 8);
   132		block_x[1] ^= (u8)la;
   133		for (idx = 0; idx < 14; idx++)
   134			block_x[idx + 2] ^= label[idx];
   135		show_block(block_x, "After xor: ", "b1\n", 16);
   136	
   137		dwc_wusb_aes_encrypt(block_x, key, block_x);
   138		show_block(block_x, "After AES: ", "b1\n", 16);
   139	
   140		idx = 0;
   141		blkNum = 0;
   142	
   143		/* Fill remaining blocks with B */
   144		while (len-- > 0) {
   145			block_x[idx] ^= *bytes++;
   146			if (++idx >= 16) {
   147				idx = 0;
   148				show_block(block_x, "After xor: ", "\n", blkNum);
   149				dwc_wusb_aes_encrypt(block_x, key, block_x);
   150				show_block(block_x, "After AES: ", "\n", blkNum);
   151				blkNum++;
   152			}
   153		}
   154	
   155		/* Handle partial last block */
   156		if (idx > 0) {
   157			show_block(block_x, "After xor: ", "\n", blkNum);
   158			dwc_wusb_aes_encrypt(block_x, key, block_x);
   159			show_block(block_x, "After AES: ", "\n", blkNum);
   160		}
   161	
   162		/* Save the MIC tag */
   163		DWC_MEMCPY(block_t, block_x, 8);
   164		show_block(block_t, "MIC tag  : ", NULL, 8);
   165	
   166		/* Fill block A0 from flags = 0x01, N, and counter = 0 */
   167		block_m[0] = 0x01;
   168		block_m[14] = 0;
   169		block_m[15] = 0;
   170	
   171		/* Encrypt the counter */
   172		dwc_wusb_aes_encrypt(block_m, key, block_x);
   173		show_block(block_x, "CTR[MIC] : ", NULL, 8);
   174	
   175		/* XOR with MIC tag */
   176		for (idx = 0; idx < 8; idx++) {
   177			block_t[idx] ^= block_x[idx];
   178		}
   179	
   180		/* Return result to caller */
   181		DWC_MEMCPY(result, block_t, 8);
   182		show_block(result, "CCM-MIC  : ", NULL, 8);
   183	
   184	}
   185	
   186	/**
   187	 * The PRF function described in section 6.5 of the WUSB spec. This function
   188	 * concatenates MIC values returned from dwc_cmf() to create a value of
   189	 * the requested length.
   190	 *
   191	 * @param prf_len  Length of the PRF function in bits (64, 128, or 256).
   192	 * @param key, nonce, label, bytes, len  Same as for dwc_cmf().
   193	 * @param result   Byte array to receive the result.
   194	 */
   195	void dwc_wusb_prf(int prf_len, u8 *key,
   196			  u8 *nonce, char *label, u8 *bytes, int len, u8 *result)
   197	{
   198		int i;
   199	
   200		nonce[0] = 0;
   201		for (i = 0; i < prf_len >> 6; i++, nonce[0]++) {
   202			dwc_wusb_cmf(key, nonce, label, bytes, len, result);
   203			result += 8;
   204		}
   205	}
   206	
   207	/**
   208	 * Fills in CCM Nonce per the WUSB spec.
   209	 *
   210	 * @param[in] haddr Host address.
   211	 * @param[in] daddr Device address.
   212	 * @param[in] tkid Session Key(PTK) identifier.
   213	 * @param[out] nonce Pointer to where the CCM Nonce output is to be written.
   214	 */
   215	void dwc_wusb_fill_ccm_nonce(uint16_t haddr, uint16_t daddr, uint8_t *tkid,
   216				     uint8_t *nonce)
   217	{
   218	
   219		DWC_DEBUG("%s %x %x\n", __func__, daddr, haddr);
   220	
   221		DWC_MEMSET(&nonce[0], 0, 16);
   222	
   223		DWC_MEMCPY(&nonce[6], tkid, 3);
   224		nonce[9] = daddr & 0xFF;
   225		nonce[10] = (daddr >> 8) & 0xFF;
   226		nonce[11] = haddr & 0xFF;
   227		nonce[12] = (haddr >> 8) & 0xFF;
   228	
   229		dump_bytes("CCM nonce", nonce, 16);
   230	}
   231	
   232	/**
   233	 * Generates a 16-byte cryptographic-grade random number for the Host/Device
   234	 * Nonce.
   235	 */
   236	void dwc_wusb_gen_nonce(uint16_t addr, uint8_t *nonce)
 > 237	{
   238		uint8_t inonce[16];
   239		uint32_t temp[4];
   240	
   241		/* Fill in the Nonce */
   242		DWC_MEMSET(&inonce[0], 0, sizeof(inonce));
   243		inonce[9] = addr & 0xFF;
   244		inonce[10] = (addr >> 8) & 0xFF;
   245		inonce[11] = inonce[9];
   246		inonce[12] = inonce[10];
   247	
   248		/* Collect "randomness samples" */
   249		DWC_RANDOM_BYTES((uint8_t *)temp, 16);
   250	
   251		dwc_wusb_prf_128((uint8_t *)temp, nonce,
   252				 "Random Numbers", (uint8_t *)temp, sizeof(temp),
   253				 nonce);
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
