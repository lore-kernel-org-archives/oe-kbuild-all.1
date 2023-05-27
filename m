Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717037D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 00:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685148590; x=1716684590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+w5AYRtpXXZiA+UOeTFMhAO0/uGV+zMQAil0NgUnvE=;
  b=is/uLD2xkv3Cn7hpr0xVVvfDygYFxFgeq+VMlYK4eH7XU84iTGqM+wuk
   Ewefo3dV1fs1zSVpAYNGpSb3543GpJhdfenAcHIuNIP0Rix+bouSsEer2
   Elsn4F6iSd6NershdfQq1DByjOYYHDu3kJS5X/KdJSbHteIhR0HbCUOXk
   ZtwUw5Vx1KHtQ80zAEAkI40hPPzvrd1CEQw9ezzz41Z7u8djubQ+pelU/
   u4jXiCeFqX/AGAIZIGPNcd/aAFZV2wySRtqcXKCzzk91pe804ItABJMu7
   A8MLD1W1hFheuIuYekXcr7agGaS5MN/nN6L+9sZmijXAL/0qmQQ+JKrRF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354355070"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="354355070"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 17:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775254384"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="775254384"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 17:49:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2i7v-000Jga-1C;
	Sat, 27 May 2023 00:49:47 +0000
Date: Sat, 27 May 2023 08:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [hverkuil-media-tree:for-v6.5c 15/15]
 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:46:
 error: 'struct mtk_vcodec_dev' has no member named 'msg_queue_core_ctx'
Message-ID: <202305270856.cBJFKQqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.5c
head:   d50739a417aba71e47bc48598d920ec692e1c6a8
commit: d50739a417aba71e47bc48598d920ec692e1c6a8 [15/15] media: mediatek: vcodec: support stateless AV1 decoder
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230527/202305270856.cBJFKQqW-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v6.5c
        git checkout d50739a417aba71e47bc48598d920ec692e1c6a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270856.cBJFKQqW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_lat_decode':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:46: error: 'struct mtk_vcodec_dev' has no member named 'msg_queue_core_ctx'
    2075 |                 vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
         |                                              ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:46: error: 'struct mtk_vcodec_dev' has no member named 'msg_queue_core_ctx'
    2114 |                 vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
         |                                              ^~


vim +2075 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c

  2024	
  2025	static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
  2026					     struct vdec_fb *fb, bool *res_chg)
  2027	{
  2028		struct vdec_av1_slice_instance *instance = h_vdec;
  2029		struct vdec_lat_buf *lat_buf;
  2030		struct vdec_av1_slice_pfc *pfc;
  2031		struct vdec_av1_slice_vsi *vsi;
  2032		struct mtk_vcodec_ctx *ctx;
  2033		int ret;
  2034	
  2035		if (!instance || !instance->ctx)
  2036			return -EINVAL;
  2037	
  2038		ctx = instance->ctx;
  2039		/* init msgQ for the first time */
  2040		if (vdec_msg_queue_init(&ctx->msg_queue, ctx,
  2041					vdec_av1_slice_core_decode, sizeof(*pfc))) {
  2042			mtk_vcodec_err(instance, "failed to init AV1 msg queue\n");
  2043			return -ENOMEM;
  2044		}
  2045	
  2046		/* bs NULL means flush decoder */
  2047		if (!bs)
  2048			return vdec_av1_slice_flush(h_vdec, bs, fb, res_chg);
  2049	
  2050		lat_buf = vdec_msg_queue_dqbuf(&ctx->msg_queue.lat_ctx);
  2051		if (!lat_buf) {
  2052			mtk_vcodec_debug(instance, "failed to get AV1 lat buf\n");
  2053			return -EAGAIN;
  2054		}
  2055		pfc = (struct vdec_av1_slice_pfc *)lat_buf->private_data;
  2056		if (!pfc) {
  2057			ret = -EINVAL;
  2058			goto err_free_fb_out;
  2059		}
  2060		vsi = &pfc->vsi;
  2061	
  2062		ret = vdec_av1_slice_setup_lat(instance, bs, lat_buf, pfc);
  2063		if (ret) {
  2064			mtk_vcodec_err(instance, "failed to setup AV1 lat ret %d\n", ret);
  2065			goto err_free_fb_out;
  2066		}
  2067	
  2068		vdec_av1_slice_vsi_to_remote(vsi, instance->vsi);
  2069		ret = vpu_dec_start(&instance->vpu, NULL, 0);
  2070		if (ret) {
  2071			mtk_vcodec_err(instance, "failed to dec AV1 ret %d\n", ret);
  2072			goto err_free_fb_out;
  2073		}
  2074		if (instance->inneracing_mode)
> 2075			vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
  2076	
  2077		if (instance->irq_enabled) {
  2078			ret = mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
  2079							   WAIT_INTR_TIMEOUT_MS,
  2080							   MTK_VDEC_LAT0);
  2081			/* update remote vsi if decode timeout */
  2082			if (ret) {
  2083				mtk_vcodec_err(instance, "AV1 Frame %d decode timeout %d\n", pfc->seq, ret);
  2084				WRITE_ONCE(instance->vsi->state.timeout, 1);
  2085			}
  2086			vpu_dec_end(&instance->vpu);
  2087		}
  2088	
  2089		vdec_av1_slice_vsi_from_remote(vsi, instance->vsi);
  2090		ret = vdec_av1_slice_update_lat(instance, lat_buf, pfc);
  2091	
  2092		/* LAT trans full, re-decode */
  2093		if (ret == -EAGAIN) {
  2094			mtk_vcodec_err(instance, "AV1 Frame %d trans full\n", pfc->seq);
  2095			if (!instance->inneracing_mode)
  2096				vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
  2097			return 0;
  2098		}
  2099	
  2100		/* LAT trans full, no more UBE or decode timeout */
  2101		if (ret == -ENOMEM || vsi->state.timeout) {
  2102			mtk_vcodec_err(instance, "AV1 Frame %d insufficient buffer or timeout\n", pfc->seq);
  2103			if (!instance->inneracing_mode)
  2104				vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
  2105			return -EBUSY;
  2106		}
  2107		vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
  2108		mtk_vcodec_debug(instance, "lat dma 1 0x%pad 0x%pad\n",
  2109				 &pfc->vsi.trans.dma_addr, &pfc->vsi.trans.dma_addr_end);
  2110	
  2111		vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi->trans.dma_addr_end);
  2112	
  2113		if (!instance->inneracing_mode)
  2114			vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
  2115		memcpy(&instance->slots, &vsi->slots, sizeof(instance->slots));
  2116	
  2117		return 0;
  2118	
  2119	err_free_fb_out:
  2120		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
  2121	
  2122		if (pfc)
  2123			mtk_vcodec_err(instance, "slice dec number: %d err: %d", pfc->seq, ret);
  2124	
  2125		return ret;
  2126	}
  2127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
