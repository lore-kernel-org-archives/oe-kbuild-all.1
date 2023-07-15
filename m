Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610951371F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689424564; x=1720960564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XVVVVEEfP0YYrRZda6O0qnKASLm/nlnKGocYbwJnf9E=;
  b=mhAF67ZJHd7t+2LmoHagOr8/xFjM8kcqMtXEHbXzN8kvTLuRHAeHeu9T
   n1KVJxWHA6u/sUqeMyolypFvWVqNrcJY2hwMkcT/9zBvJfpTu/YTmFiQ6
   q491VLluZqQmHmJ/IyhHCvlhMCcyHUaSco+yKxonwR7c7LOum2j+x6Bhi
   a5Fpmrd+I6tV1aJxg43uCDZa/zKzAVlaQGLarKQrJ9/yGuwAbtzcYDV02
   3qcZmJ8+Z4YPSRJiZqM/YRoFmmXTgeJHqgMkvftx0qNyyE1Hqd4NzaHgJ
   70QQQwDOZKCo+vfLfBu1KrSMwIJvuHdBFWoPbO+DUej30+0Bbg1ijOZhS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="350524861"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="350524861"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 05:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="1053365085"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="1053365085"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2023 05:35:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKeVB-00089d-34;
	Sat, 15 Jul 2023 12:35:57 +0000
Date: Sat, 15 Jul 2023 20:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>
Subject: [hansg:media-atomisp 21/21]
 drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:24:20:
 warning: no previous prototype for 'ia_css_isys_2400_init'
Message-ID: <202307152046.rvhFGrbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git media-atomisp
head:   af3149fe2cb5138a3e5bc0744a677b23f8146187
commit: af3149fe2cb5138a3e5bc0744a677b23f8146187 [21/21] media: atomisp: isys_init: Initiate atomisp in a generic manner
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230715/202307152046.rvhFGrbz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307152046.rvhFGrbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307152046.rvhFGrbz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:24:20: warning: no previous prototype for 'ia_css_isys_2400_init' [-Wmissing-prototypes]
      24 | input_system_err_t ia_css_isys_2400_init(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:87:20: warning: no previous prototype for 'ia_css_isys_2401_init' [-Wmissing-prototypes]
      87 | input_system_err_t ia_css_isys_2401_init(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/ia_css_isys_2400_init +24 drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c

    23	
  > 24	input_system_err_t ia_css_isys_2400_init(void)
    25	{
    26		backend_channel_cfg_t backend_ch0;
    27		backend_channel_cfg_t backend_ch1;
    28		target_cfg2400_t targetB;
    29		target_cfg2400_t targetC;
    30		u32 acq_mem_region_size = 24;
    31		u32 acq_nof_mem_regions = 2;
    32		input_system_err_t error = INPUT_SYSTEM_ERR_NO_ERROR;
    33	
    34		memset(&backend_ch0, 0, sizeof(backend_channel_cfg_t));
    35		memset(&backend_ch1, 0, sizeof(backend_channel_cfg_t));
    36		memset(&targetB, 0, sizeof(targetB));
    37		memset(&targetC, 0, sizeof(targetC));
    38	
    39		error = input_system_configuration_reset();
    40		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
    41			return error;
    42	
    43		error = input_system_csi_xmem_channel_cfg(
    44			    0,			/*ch_id                 */
    45			    INPUT_SYSTEM_PORT_A,	/*port                  */
    46			    backend_ch0,		/*backend_ch            */
    47			    32,			/*mem_region_size       */
    48			    6,			/*nof_mem_regions       */
    49			    acq_mem_region_size,	/*acq_mem_region_size   */
    50			    acq_nof_mem_regions,	/*acq_nof_mem_regions   */
    51			    targetB,		/*target                */
    52			    3);			/*nof_xmem_buffers      */
    53		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
    54			return error;
    55	
    56		error = input_system_csi_xmem_channel_cfg(
    57			    1,			/*ch_id                 */
    58			    INPUT_SYSTEM_PORT_B,	/*port                  */
    59			    backend_ch0,		/*backend_ch            */
    60			    16,			/*mem_region_size       */
    61			    3,			/*nof_mem_regions       */
    62			    acq_mem_region_size,	/*acq_mem_region_size   */
    63			    acq_nof_mem_regions,	/*acq_nof_mem_regions   */
    64			    targetB,		/*target                */
    65			    3);			/*nof_xmem_buffers      */
    66		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
    67			return error;
    68	
    69		error = input_system_csi_xmem_channel_cfg(
    70			    2,			/*ch_id                 */
    71			    INPUT_SYSTEM_PORT_C,	/*port                  */
    72			    backend_ch1,		/*backend_ch            */
    73			    32,			/*mem_region_size       */
    74			    3,			/*nof_mem_regions       */
    75			    acq_mem_region_size,	/*acq_mem_region_size   */
    76			    acq_nof_mem_regions,	/*acq_nof_mem_regions   */
    77			    targetC,		/*target                */
    78			    2);			/*nof_xmem_buffers      */
    79		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
    80			return error;
    81	
    82		error = input_system_configuration_commit();
    83	
    84		return error;
    85	}
    86	
  > 87	input_system_err_t ia_css_isys_2401_init(void)
    88	{
    89		ia_css_isys_csi_rx_lut_rmgr_init();
    90		ia_css_isys_ibuf_rmgr_init();
    91		ia_css_isys_dma_channel_rmgr_init();
    92		ia_css_isys_stream2mmio_sid_rmgr_init();
    93	
    94		isys2401_dma_set_max_burst_size(ISYS2401_DMA0_ID,
    95						1 /* Non Burst DMA transactions */);
    96	
    97		/* Enable 2401 input system IRQ status for driver to retrieve */
    98		isys_irqc_status_enable(ISYS_IRQ0_ID);
    99		isys_irqc_status_enable(ISYS_IRQ1_ID);
   100		isys_irqc_status_enable(ISYS_IRQ2_ID);
   101	
   102		return INPUT_SYSTEM_ERR_NO_ERROR;
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
