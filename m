Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE05B2564
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686429156; x=1717965156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVheK7eKq0ug5loF9GgqaFTj1QQSlpPiN4xEXgdQ/rw=;
  b=JHDFq38olbIM6g7Ul7JQ7Eq2EI8RCxBkQhOD1oUj6w7ITZriqSVWelqj
   A95/+NQmDdAvzXyb/h2Iv1R8CGeuEKwPm1M+6Bad8Tancjsf0+FG4QNXC
   3Ze3JI60lXju/dYKqb/J+SybxYPyHRkrD2w9UQ37NORcxGHB7EKcVUADI
   eLscmv2nH197l/7bQcijl6k84WS7rr2AnwajDpJmKJK0pbH9XGU8MR7Sp
   bqoQgS5c0xeA44mdXsRoxgGdiDtkl5U4Aap6Jvr29toLjD7TNVFuIEXeC
   TU+5/0M3fKFiWkxMuWkMC7SdVFAu9iR5DsoeiTspo9bWTaYJ04rD0KBPi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="360285234"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="360285234"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 13:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="780693884"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="780693884"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2023 13:32:32 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q85GB-000APj-1l;
	Sat, 10 Jun 2023 20:32:31 +0000
Date: Sun, 11 Jun 2023 04:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>, David Huang <d-huang@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 2/6]
 drivers/media/platform/img/e5010/e5010-jpeg-enc.c:1443:13: warning: variable
 'bytesperline_64div' set but not used
Message-ID: <202306110416.Ot1Gzxko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   625b783e0c76b86448fb8a8b9f8c09fb2220e096
commit: 995721196ec4b27ce1e6a5a713144a3d6f2b84aa [2/6] media: platform: img: Add E5010 JPEG Encoder driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230611/202306110416.Ot1Gzxko-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 995721196ec4b27ce1e6a5a713144a3d6f2b84aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/img/e5010/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110416.Ot1Gzxko-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/img/e5010/e5010-jpeg-enc.c: In function 'e5010_device_run':
>> drivers/media/platform/img/e5010/e5010-jpeg-enc.c:1443:13: warning: variable 'bytesperline_64div' set but not used [-Wunused-but-set-variable]
    1443 |         u32 bytesperline_64div;
         |             ^~~~~~~~~~~~~~~~~~


vim +/bytesperline_64div +1443 drivers/media/platform/img/e5010/e5010-jpeg-enc.c

  1435	
  1436	static void e5010_device_run(void *priv)
  1437	{
  1438		struct e5010_context *ctx = priv;
  1439		struct e5010_dev *dev = ctx->dev;
  1440		struct vb2_v4l2_buffer *s_vb, *d_vb;
  1441		u32 reg = 0;
  1442		int ret = 0;
> 1443		u32 bytesperline_64div;
  1444		unsigned long flags;
  1445		int num_planes = ctx->out_queue.fmt->num_planes;
  1446	
  1447		spin_lock_irqsave(&dev->hw_lock, flags);
  1448		s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
  1449		WARN_ON(!s_vb);
  1450		d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
  1451		WARN_ON(!d_vb);
  1452	
  1453		s_vb->sequence = ctx->out_queue.sequence++;
  1454		d_vb->sequence = ctx->cap_queue.sequence++;
  1455		d_vb->flags = s_vb->flags;
  1456		d_vb->vb2_buf.timestamp = s_vb->vb2_buf.timestamp;
  1457	
  1458		if (s_vb->flags & V4L2_BUF_FLAG_TIMECODE)
  1459			d_vb->timecode = s_vb->timecode;
  1460	
  1461		if (ctx != dev->last_context_run || ctx->quality_updated)
  1462			ret = update_qp_tables(ctx);
  1463		if (ret) {
  1464			ctx->quality_updated = true;
  1465			dev_warn(dev->dev, "Failed to update QP tables\n");
  1466		} else {
  1467			dev->last_context_run = ctx;
  1468			ctx->quality_updated = false;
  1469		}
  1470	
  1471		/* Set I/O Buffer addresses */
  1472		reg = (u32)vb2_dma_contig_plane_dma_addr(&s_vb->vb2_buf, 0);
  1473		ret = e5010_hw_set_input_luma_addr(dev->jasper_base, reg);
  1474		if (ret || !reg)
  1475			dev_err(dev->dev, "Failed to set input luma address\n");
  1476	
  1477		if (num_planes == 1)
  1478			reg += (ctx->out_queue.bytesperline[0]) * (ctx->out_queue.height);
  1479		else
  1480			reg = (u32)vb2_dma_contig_plane_dma_addr(&s_vb->vb2_buf, 1);
  1481	
  1482		ret = e5010_hw_set_input_chroma_addr(dev->jasper_base, reg);
  1483		if (ret || !reg)
  1484			dev_err(dev->dev, "Failed to set input chroma address\n");
  1485	
  1486		reg = (u32)vb2_dma_contig_plane_dma_addr(&d_vb->vb2_buf, 0);
  1487		reg += HEADER_SIZE;
  1488		ret = e5010_hw_set_output_size(dev->jasper_base, reg);
  1489		if (ret || !reg)
  1490			dev_err(dev->dev, "Failed to set output size\n");
  1491	
  1492		/* Set input settings */
  1493		ret = e5010_hw_set_horizontal_size(dev->jasper_base, ctx->out_queue.width - 1);
  1494		if (ret)
  1495			dev_err(dev->dev, "Failed to set input width\n");
  1496	
  1497		ret = e5010_hw_set_vertical_size(dev->jasper_base, ctx->out_queue.height - 1);
  1498		if (ret)
  1499			dev_err(dev->dev, "Failed to set input width\n");
  1500	
  1501		bytesperline_64div = ctx->out_queue.bytesperline[0] / 64;
  1502		ret = e5010_hw_set_luma_stride(dev->jasper_base, ctx->out_queue.bytesperline[0]);
  1503		if (ret)
  1504			dev_err(dev->dev, "Failed to set luma stride\n");
  1505	
  1506		ret = e5010_hw_set_chroma_stride(dev->jasper_base, ctx->out_queue.bytesperline[0]);
  1507		if (ret)
  1508			dev_err(dev->dev, "Failed to set chroma stride\n");
  1509	
  1510		ret = e5010_set_input_subsampling(dev->jasper_base, ctx->out_queue.fmt->subsampling);
  1511		if (ret)
  1512			dev_err(dev->dev, "Failed to set input subsampling\n");
  1513	
  1514		ret = e5010_hw_set_chroma_order(dev->jasper_base, ctx->out_queue.fmt->chroma_order);
  1515		if (ret)
  1516			dev_err(dev->dev, "Failed to set chroma order\n");
  1517	
  1518		e5010_hw_set_output_max_size(dev->jasper_base, d_vb->planes[0].length);
  1519		e5010_hw_encode_start(dev->jasper_base, 1);
  1520		spin_unlock_irqrestore(&dev->hw_lock, flags);
  1521	}
  1522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
