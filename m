Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A3A6FBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887339; x=1712423339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WpngHzbhm/abPf1Ux23wltUuAB7mLcTpBvgRRMttWoc=;
  b=SJbMD6AVVNYwa7J/E+d/RtIluJL4jFamf/JV0q96vnaRy35+mrM4Y0bO
   +9Y+qWAXPLqZ4mVALBC1npqf754PIciN4YitpAgRYXfxhinBtwAr5ngu9
   RdCF/phXXL8t1slC57uMDgpTP+XHXeoLL318ZHaHRu6k06mxoUN04kSx+
   +Ep2708UK5cLY4V7l37SBE+eWcqUzbQxh1qXGIXbIwY1nsEtkqlyJy6g4
   wI6WnEZ3EUXGbTKeqzpS6yLjbVZstaMYLg93P4WJiB/wzeNQaPMNaKNgE
   t0yjWyBW+aBW9fp//6Dm5kK7cJtvSp0MpKfOMpfT2LAO8IyefxSoxff2R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344805036"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="344805036"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637764933"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637764933"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 10:08:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpa3-000SiV-2W;
	Fri, 07 Apr 2023 17:08:55 +0000
Date: Sat, 8 Apr 2023 01:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 18965/22735]
 drivers/soc/ti/ti-pat.c:406:5: warning: no previous prototype for
 'ti_pat_export'
Message-ID: <202304080154.ulD7hCYi-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   e6bb059e69c106b73bfe2a10e729dbe5a5820916
commit: 53f199a2001e5a0b9e0bff89a653341529fd26be [18965/22735] soc: ti: Add Support for the TI Page-based Address Translator (PAT)
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080154.ulD7hCYi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 53f199a2001e5a0b9e0bff89a653341529fd26be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/i2c/ drivers/soc/ti/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080154.ulD7hCYi-lkp@intel.com/

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
