Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E46800
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 05:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676006067; x=1707542067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iwKG2ZAoIwnE3ggqeFrr24VhHMSiDcIhsODIch6FSJs=;
  b=UxNRNhzB9s/I+stA9WcowMd1x882mGTiiCzTd++D3ExSDY6qYfCQEwgP
   PLqCOby9K9mjcL9OGrL9SH6i5BPHT7n5WMJAy9EsOacSveimJ5XOGhXFR
   rpJ5i4qQiCFNH5ysRMHGMaN1djaZG31KN/y5/+ufngLI9JcHEZ+mmTp4f
   vVFjAVhHVtkb3n1gAfDrHhpadX6La7MxWAOlQtp2cZ61ZCVStRT6+SHJM
   zIfI9s+EU6m3aPYN3pWTo/04ZZthvnVrGDn9GmDsKCnFNNhJrHMsJmLWG
   KpJ1YdPjfZiECnlRx9mCChKeNz4IyNNRcj7oBLRKRQ+AqfJU9SsBbEync
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392740263"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="392740263"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:14:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="810684579"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="810684579"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2023 21:14:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQLjr-0005ZO-31;
	Fri, 10 Feb 2023 05:14:23 +0000
Date: Fri, 10 Feb 2023 13:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-5.10.y 18972/21442] drivers/soc/ti/ti-pat.c:406:5:
 warning: no previous prototype for 'ti_pat_export'
Message-ID: <202302101215.MmLrxfze-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: 53f199a2001e5a0b9e0bff89a653341529fd26be [18972/21442] soc: ti: Add Support for the TI Page-based Address Translator (PAT)
config: mips-randconfig-r016-20230210 (https://download.01.org/0day-ci/archive/20230210/202302101215.MmLrxfze-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 53f199a2001e5a0b9e0bff89a653341529fd26be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/i2c/ drivers/soc/ti/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101215.MmLrxfze-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/ti/ti-pat.c:406:5: warning: no previous prototype for 'ti_pat_export' [-Wmissing-prototypes]
     406 | int ti_pat_export(struct ti_pat_data *pat,
         |     ^~~~~~~~~~~~~


vim +/ti_pat_export +406 drivers/soc/ti/ti-pat.c

   405	
 > 406	int ti_pat_export(struct ti_pat_data *pat,
   407			  struct dma_buf *i_dma_buf,
   408			  struct dma_buf **e_dma_buf)
   409	{
   410		struct ti_pat_buffer *buffer;
   411		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
   412		int ret;
   413	
   414		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
   415		if (!buffer)
   416			return -ENOMEM;
   417	
   418		buffer->pat = pat;
   419		buffer->i_dma_buf = i_dma_buf;
   420		buffer->size = buffer->i_dma_buf->size;
   421		mutex_init(&buffer->lock);
   422		INIT_LIST_HEAD(&buffer->attachments);
   423		buffer->map_count = 0;
   424	
   425		/* Reserve PAT space */
   426		buffer->offset = gen_pool_alloc(buffer->pat->pool, buffer->size);
   427		if (!buffer->offset) {
   428			ret = -ENOMEM;
   429			goto free_buffer;
   430		}
   431	
   432		exp_info.ops = &dma_buf_ops;
   433		exp_info.size = buffer->size;
   434		exp_info.flags = O_RDWR;
   435		exp_info.priv = buffer;
   436	
   437		*e_dma_buf = dma_buf_export(&exp_info);
   438		if (IS_ERR(*e_dma_buf)) {
   439			ret = PTR_ERR(*e_dma_buf);
   440			goto free_pool;
   441		}
   442	
   443		return 0;
   444	
   445	free_pool:
   446		gen_pool_free(buffer->pat->pool, buffer->offset, buffer->size);
   447	free_buffer:
   448		kfree(buffer);
   449		return ret;
   450	}
   451	EXPORT_SYMBOL_GPL(ti_pat_export);
   452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
