Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD52BA34
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736192493; cv=none; b=aUHC9eG3DRwPvZh1Kf4LTyHmy09aUkfgs/Wl8vtaTso0dFCpNRTHyX2Hre1k5tzs6CjraBvaGBVK6t5E1+YQ5TgeUMxXe+86gUT3P0mzCpN/EnUi4NtyifCXa3XZYo2n8QxrwPcvG/Cq/XsDQFMfjgce7GlTUE70z7lkKQVxM6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736192493; c=relaxed/simple;
	bh=X286333LxKk0w09vvDeEGtDASWpVB5x1lKerZN6u7LI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T8RYwPz7JjG9gBsUcmR+gRDdqX+kwM8eJ4R4IUMdW1hWhHo1g6ept0g1SvOavo84icnD2lAW8P+D+SpL8tsLxNAMPkJ5ooHZDVMN7mEEB5nAI4D42o4FKKsEmivTOiyyMzYzeq7boby1rdWW1AKLd1X9x+Y95oayDGBCrWeEMZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljtB4eeW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljtB4eeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736192491; x=1767728491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X286333LxKk0w09vvDeEGtDASWpVB5x1lKerZN6u7LI=;
  b=ljtB4eeWEeEB+XbPdKLT5azI5weDVUvomDp3Lts7CsZ49LPfW0b7sxvJ
   758Jxs/v8YEKrYFl07j5OOOzzBJyBgynxrP2NkVRPn3eN8CuXk46AmiSo
   GGvT4oITQDK+hhBIcXSeLVl/TliSAq7YiwhVj5DNkJzI7qkhJfB7MvTKW
   55LAqGTFH409NXGnj0tgzY1z235OIK/EA96qSMwhbsbyhfZswoi2jzT53
   jZq5ozTFiOdpUu8q2deeR6zIXIwp3I01KPwbHVU9XhpVFKcjfPPtcGCLC
   KQMC6mcjxtU7oqNc1+OKXuoL42Q9j2dVphikTZuCUa2SSbP0NzIZJzpZP
   A==;
X-CSE-ConnectionGUID: 3VCvR55+Rn6Y7uYSSxQTYw==
X-CSE-MsgGUID: 5tC2Jiw9S92bZWCFbIGL9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61728683"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="61728683"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 11:41:31 -0800
X-CSE-ConnectionGUID: gC9ScLYaQf2+KrD8VIu60A==
X-CSE-MsgGUID: 1YXz63w7Qimeds13+fYlBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="102422516"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 11:41:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUsyd-000Drf-35;
	Mon, 06 Jan 2025 19:41:27 +0000
Date: Tue, 7 Jan 2025 03:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 177/177]
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c:1812:6:
 warning: variable 'w' set but not used
Message-ID: <202501070340.dHcNkIUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   37484545df505e5a625635cadf4bbdf4f3eef3e1
commit: e7a40fac7465368ae241641024f6b1bf5c9ed44d [177/177] FROMLIST: media: mediatek: vcodec: support av1 svp decoder for mt8188
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250107/202501070340.dHcNkIUl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070340.dHcNkIUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070340.dHcNkIUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c:9:
   In file included from include/media/videobuf2-dma-contig.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c:1812:6: warning: variable 'w' set but not used [-Wunused-but-set-variable]
    1812 |         int w, h, plane;
         |             ^
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c:1812:9: warning: variable 'h' set but not used [-Wunused-but-set-variable]
    1812 |         int w, h, plane;
         |                ^
   7 warnings generated.


vim +/w +1812 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c

  1803	
  1804	static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *instance,
  1805						    struct vdec_av1_slice_pfc *pfc,
  1806						    struct vdec_av1_slice_vsi *vsi,
  1807						    struct vdec_fb *fb,
  1808						    struct vdec_lat_buf *lat_buf)
  1809	{
  1810		struct vb2_buffer *vb;
  1811		struct vb2_queue *vq;
> 1812		int w, h, plane;
  1813		int i;
  1814	
  1815		plane = instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
  1816		w = vsi->frame.uh.upscaled_width;
  1817		h = vsi->frame.uh.frame_height;
  1818	
  1819		/* frame buffer */
  1820		vsi->fb.y.dma_addr = fb->base_y.dma_addr;
  1821	
  1822		vsi->fb.y.size = instance->ctx->picinfo.fb_sz[0];
  1823		vsi->fb.c.size = instance->ctx->picinfo.fb_sz[1];
  1824	
  1825		if (!instance->ctx->is_secure_playback) {
  1826			if (plane == 1)
  1827				vsi->fb.c.dma_addr = fb->base_y.dma_addr + vsi->fb.y.size;
  1828			else
  1829				vsi->fb.c.dma_addr = fb->base_c.dma_addr;
  1830		}
  1831	
  1832		/* reference buffers */
  1833		vq = v4l2_m2m_get_vq(instance->ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
  1834		if (!vq)
  1835			return -EINVAL;
  1836	
  1837		/* get current output buffer */
  1838		vb = &v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx)->vb2_buf;
  1839		if (!vb)
  1840			return -EINVAL;
  1841	
  1842		/* get buffer address from vb2buf */
  1843		for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
  1844			struct vdec_av1_slice_fb *vref = &vsi->ref[i];
  1845	
  1846			vb = vb2_find_buffer(vq, pfc->ref_idx[i]);
  1847			if (!vb) {
  1848				memset(vref, 0, sizeof(*vref));
  1849				continue;
  1850			}
  1851	
  1852			vref->y.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
  1853			vref->y.size = vsi->fb.y.size;
  1854			if (plane == 1)
  1855				vref->c.dma_addr = vref->y.dma_addr + vsi->fb.y.size;
  1856			else
  1857				vref->c.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
  1858		}
  1859		vsi->tile.dma_addr = lat_buf->tile_addr.dma_addr;
  1860		vsi->tile.size = lat_buf->tile_addr.size;
  1861	
  1862		return 0;
  1863	}
  1864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
