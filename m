Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71424525
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 04:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692853001; x=1724389001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUxKegu0FT9imRg6XS0nL7R0bSKvL+364OQCU/SaY4U=;
  b=OGlWCHV1Hl/qBUc5qFB10qK7dXo4pSW1VwTu/pV3m+yEV0zpEaF4uDHN
   9Zvf+b3la+WR6vbjtkZqYcPmP/a6zry841voq2hqUJqUk0Qo7qbpMS2Qw
   4RqR04D2cC7dOkFf+DCLGebUjTpvWM/5jOZleCUFUcATqlozkedzo8mkC
   HOjV9WLJHU6oyNV96/PgpY/3UZugiNwGUA/0Q5h/RGMGdGNttM00V456D
   e4Y5MoZgx39QMA/AP0zZbfpKuNV/1P154Sj8ivK/TumkxpHlcm8T2sAov
   lDlx413ZZKOGA8nl5+It0t9xrZc0IYOxgDBYalfm0ODv+pvd6O0kR3lM0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353889188"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="353889188"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 21:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826992530"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826992530"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 21:56:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ2OY-0001ls-11;
	Thu, 24 Aug 2023 04:56:35 +0000
Date: Thu, 24 Aug 2023 12:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 256/382]
 drivers/misc/dma-buf-phys.c:55:undefined reference to
 `dma_buf_unmap_attachment'
Message-ID: <202308241210.5l1uYkKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: a6d074da1a95aa77f6d6315d7c454623ff578a7e [256/382] HACK: misc: Add dma-buf to physical address exporter
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230824/202308241210.5l1uYkKJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241210.5l1uYkKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241210.5l1uYkKJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_release':
>> drivers/misc/dma-buf-phys.c:55:(.text+0x48): undefined reference to `dma_buf_unmap_attachment'
   drivers/misc/dma-buf-phys.c:55:(.text+0x48): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_unmap_attachment'
>> nios2-linux-ld: drivers/misc/dma-buf-phys.c:59:(.text+0x5c): undefined reference to `dma_buf_put'
   drivers/misc/dma-buf-phys.c:59:(.text+0x5c): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_put'
>> nios2-linux-ld: drivers/misc/dma-buf-phys.c:57:(.text+0x88): undefined reference to `dma_buf_detach'
   drivers/misc/dma-buf-phys.c:57:(.text+0x88): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_detach'
   nios2-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_convert':
>> drivers/misc/dma-buf-phys.c:75:(.text+0x19c): undefined reference to `dma_buf_get'
   drivers/misc/dma-buf-phys.c:75:(.text+0x19c): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_get'
>> nios2-linux-ld: drivers/misc/dma-buf-phys.c:80:(.text+0x1b0): undefined reference to `dma_buf_attach'
   drivers/misc/dma-buf-phys.c:80:(.text+0x1b0): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_attach'
>> nios2-linux-ld: drivers/misc/dma-buf-phys.c:86:(.text+0x1c4): undefined reference to `dma_buf_map_attachment'
   drivers/misc/dma-buf-phys.c:86:(.text+0x1c4): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_map_attachment'
>> nios2-linux-ld: drivers/misc/dma-buf-phys.c:110:(.text+0x254): undefined reference to `dma_buf_unmap_attachment'
   drivers/misc/dma-buf-phys.c:110:(.text+0x254): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_unmap_attachment'
   nios2-linux-ld: drivers/misc/dma-buf-phys.c:112:(.text+0x26c): undefined reference to `dma_buf_detach'
   drivers/misc/dma-buf-phys.c:112:(.text+0x26c): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_detach'
   nios2-linux-ld: drivers/misc/dma-buf-phys.c:114:(.text+0x27c): undefined reference to `dma_buf_put'
   drivers/misc/dma-buf-phys.c:114:(.text+0x27c): relocation truncated to fit: R_NIOS2_CALL26 against `dma_buf_put'


vim +55 drivers/misc/dma-buf-phys.c

    49	
    50	static int dma_buf_phys_release(struct inode *inode, struct file *file)
    51	{
    52		struct dma_buf_phys_file *priv = file->private_data;
    53	
    54		if (priv->attachment && priv->sgt)
  > 55			dma_buf_unmap_attachment(priv->attachment, priv->sgt, DMA_BIDIRECTIONAL);
    56		if (priv->dma_buf && priv->attachment)
  > 57			dma_buf_detach(priv->dma_buf, priv->attachment);
    58		if (priv->dma_buf)
  > 59			dma_buf_put(priv->dma_buf);
    60	
    61		kfree(priv);
    62	
    63		return 0;
    64	}
    65	
    66	static int dma_buf_phys_convert(struct dma_buf_phys_file *priv, int fd, u64 *phys)
    67	{
    68		struct device *dev = priv->dev;
    69		struct dma_buf *dma_buf;
    70		struct dma_buf_attachment *attachment;
    71		struct sg_table *sgt;
    72		dma_addr_t dma_addr;
    73		int ret;
    74	
  > 75		dma_buf = dma_buf_get(fd);
    76		if (IS_ERR(dma_buf))
    77			return PTR_ERR(dma_buf);
    78	
    79		/* Attach as the parent device as it will have the correct DMA ops set */
  > 80		attachment = dma_buf_attach(dma_buf, dev->parent);
    81		if (IS_ERR(attachment)) {
    82			ret = PTR_ERR(attachment);
    83			goto fail_put;
    84		}
    85	
  > 86		sgt = dma_buf_map_attachment(attachment, DMA_BIDIRECTIONAL);
    87		if (IS_ERR(sgt)) {
    88			ret = PTR_ERR(sgt);
    89			goto fail_detach;
    90		}
    91	
    92		/* Without PAT only physically contiguous buffers can be supported */
    93		if (sgt->orig_nents != 1) {
    94			dev_err(dev, "DMA-BUF not contiguous\n");
    95			ret = -EINVAL;
    96			goto fail_unmap;
    97		}
    98	
    99		dma_addr = sg_dma_address(sgt->sgl);
   100	
   101		*phys = dma_addr;
   102	
   103		priv->dma_buf = dma_buf;
   104		priv->attachment = attachment;
   105		priv->sgt = sgt;
   106	
   107		return 0;
   108	
   109	fail_unmap:
 > 110		dma_buf_unmap_attachment(attachment, sgt, DMA_BIDIRECTIONAL);
   111	fail_detach:
   112		dma_buf_detach(dma_buf, attachment);
   113	fail_put:
   114		dma_buf_put(dma_buf);
   115	
   116		return ret;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
