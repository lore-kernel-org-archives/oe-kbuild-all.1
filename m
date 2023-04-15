Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CC033C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681579874; x=1713115874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FhBkfQ9IlgRQqDdiyswz4w1d8fGTQb1eov91cu7NFtM=;
  b=jQatttsNuHw0LJvur1nst5sMxAgZ/Ysr8Vt9/80zF2l06U00U1MfaJid
   HttBlwDCl+Ksf7NejcA9LeuNvBqlV7s3HpTuqKdvAXE5Vf0evSKTk7zro
   mpxQwwfJgR7TV50fugoJxUudCVgqApdvlGIV006f1cW6Y2csEOvUOWPo3
   axsl5VhPElndRd9jS3j7vsqqswPJUZAe3XXd3OwzJW8wXlbi4KMn+6Xht
   exUWbFZddjucxJ7tY2dHkmQg47UqAzcBdDKwbzg4Kq2gMqR3P+WvE74IP
   VOAEpMwFHnMsXyyAAOuOWNVyiZLmaO54gXwyXIitBG/i8qwUErv+pXpwW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="325011626"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="325011626"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 10:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="690180246"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="690180246"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Apr 2023 10:30:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnjjd-000bEj-10;
	Sat, 15 Apr 2023 17:30:49 +0000
Date: Sun, 16 Apr 2023 01:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/5] media: nxp: Add i.MX8 ISI driver
Message-ID: <202304160140.3OUrz2Ti-lkp@intel.com>
References: <20230415155630.7492-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415155630.7492-3-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7e364e56293bb98cae1b55fd835f5991c4e96e7d]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/dt-bindings-media-Add-i-MX8-ISI-DT-bindings/20230415-235823
base:   7e364e56293bb98cae1b55fd835f5991c4e96e7d
patch link:    https://lore.kernel.org/r/20230415155630.7492-3-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v5 2/5] media: nxp: Add i.MX8 ISI driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304160140.3OUrz2Ti-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ea03ad7f3cb123ad6af86010bd0fc7db683e45b8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Laurent-Pinchart/dt-bindings-media-Add-i-MX8-ISI-DT-bindings/20230415-235823
        git checkout ea03ad7f3cb123ad6af86010bd0fc7db683e45b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/nxp/imx8-isi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160140.3OUrz2Ti-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: In function 'mxc_isi_channel_set_inbuf':
>> drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:33:5: warning: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Wundef]
      33 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: In function 'mxc_isi_channel_set_outbuf':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:51:5: warning: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Wundef]
      51 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:66:5: warning: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Wundef]
      66 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_ARCH_DMA_ADDR_T_64BIT +33 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c

    25	
    26	/* -----------------------------------------------------------------------------
    27	 * Buffers & M2M operation
    28	 */
    29	
    30	void mxc_isi_channel_set_inbuf(struct mxc_isi_pipe *pipe, dma_addr_t dma_addr)
    31	{
    32		mxc_isi_write(pipe, CHNL_IN_BUF_ADDR, dma_addr);
  > 33	#if CONFIG_ARCH_DMA_ADDR_T_64BIT
    34		if (pipe->isi->pdata->has_36bit_dma)
    35			mxc_isi_write(pipe, CHNL_IN_BUF_XTND_ADDR, dma_addr >> 32);
    36	#endif
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
