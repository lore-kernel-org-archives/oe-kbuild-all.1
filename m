Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511BD13CFA3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 19:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723058071; cv=none; b=aOTwxqcdwXa95QmsFIfz6ZmMbJdsVaFjREEHe0P4ecqv/N1MghASYC0xT4s9kDSiEgOkaFDy20XSiV/VAgmld/bYy15n5wgJd265WLeZJ6co/DSCcDde3xhIu398hVCJoMFMDlXhE84Xvo54RUc8k09fUtmG8t1Bl/3zBmEZv6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723058071; c=relaxed/simple;
	bh=EF8BtXKRn0eSNc05982FUsqB02G8WQaIY1aHsNHkV9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WXEN/YULgzP/pdmOFI2KHTfdQimKgN6ldzJDHQPUFjUzG4V8gdekU/H3Uy6+u/4GA9X/rM5dREcZLtaIUgrFcNhVDkM3NJiO0D1puvBs3EnyFxXIM/TpGQWghZbP0pKapkDiwM41PQTM3rjD0cPqyU/PGHcICja9BT62g0gAAmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbcPF/Wt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbcPF/Wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723058068; x=1754594068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EF8BtXKRn0eSNc05982FUsqB02G8WQaIY1aHsNHkV9E=;
  b=AbcPF/WtEPV0rUAE7acP6oxF1Gza+yeOJMIdDeYXoF14BpwxXPqTfGKe
   TwwU5EOYfBt7XTUgpWZhzXh+AQU81B3D9xKODASmQKHOYHN8KPBiSvG6a
   62umYeZSFv2surziTR5lzDXGoAD3n0aLEhkzO2W6whyB0M0UWVjFRU9nd
   RlAk05AEmquQRnLJD5oM3DlwEpgn7MwtaUw9EmMcJt01+SyvFp7O1s/UC
   60rHCkCEmFX+4chCGluIGr6SDcQlf1fDjzh9YnGf1lsf4yj/DYT8qF91m
   beufqwVRTMFecSd44VYZaGdKCO/spVutCNxGPTYQZW8+1NZQECRvp2znv
   Q==;
X-CSE-ConnectionGUID: SpdyrqD7SJarPfYjp4N1WQ==
X-CSE-MsgGUID: IApT3N47R3G6kN1SGytuiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21312553"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="21312553"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 12:14:27 -0700
X-CSE-ConnectionGUID: b2yRPJw1S/qPEOpEHJyX1Q==
X-CSE-MsgGUID: X6J1B2IWRcO/2D59LXNR1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="87883705"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2024 12:14:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbm71-0005e4-0Y;
	Wed, 07 Aug 2024 19:14:21 +0000
Date: Thu, 8 Aug 2024 03:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 9/9]
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c:2341:22: error:
 variable 'ctx' set but not used
Message-ID: <202408080335.xFZoPb8N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   f35e4ab7d881e058813ccd2de5aec024a2d7f656
commit: f35e4ab7d881e058813ccd2de5aec024a2d7f656 [9/9] CHROMIUM: media: platform: mediatek: isp: camsys support standard v4l2
config: arm64-randconfig-001-20240808 (https://download.01.org/0day-ci/archive/20240808/202408080335.xFZoPb8N-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080335.xFZoPb8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080335.xFZoPb8N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c:11:
   In file included from include/linux/remoteproc.h:40:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1776:
   include/linux/vmstat.h:502:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c:2341:22: error: variable 'ctx' set but not used [-Werror,-Wunused-but-set-variable]
    2341 |         struct mtk_cam_ctx *ctx;
         |                             ^
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [m]:
   - MALI [=m] && HAS_IOMEM [=y] && ARM64 [=y] && ARM64_PAGE_SHIFT [=12]=12 && !MALI_MIDGARD && MALI_MIDGARD!=m [=m]


vim +/ctx +2341 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c

  2334	
  2335	static int mtk_cam_buf_config(struct mtk_cam_device *cam,
  2336				      struct mtkcam_ipi_frame_param *frame_param,
  2337				      struct mtk_cam_buffer *buf)
  2338	{
  2339		struct vb2_buffer *vb;
  2340		struct mtk_cam_video_device *node;
> 2341		struct mtk_cam_ctx *ctx;
  2342		int ret;
  2343	
  2344		vb = &buf->vbb.vb2_buf;
  2345		node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
  2346	
  2347		ctx = mtk_cam_find_ctx(cam, &node->vdev.entity);
  2348	
  2349		/* update buffer format */
  2350		switch (node->desc.dma_port) {
  2351		case MTKCAM_IPI_RAW_IMGO:
  2352			mtk_cam_config_raw_path(cam, frame_param, buf);
  2353			mtk_cam_config_raw_img_out_imgo(cam, frame_param, buf);
  2354			ret = mtk_cam_config_raw_img_fmt(cam, frame_param, buf);
  2355			if (ret)
  2356				return ret;
  2357			break;
  2358		case MTKCAM_IPI_RAW_YUVO_1:
  2359		case MTKCAM_IPI_RAW_YUVO_2:
  2360		case MTKCAM_IPI_RAW_YUVO_3:
  2361		case MTKCAM_IPI_RAW_YUVO_4:
  2362		case MTKCAM_IPI_RAW_YUVO_5:
  2363		case MTKCAM_IPI_RAW_RZH1N2TO_1:
  2364		case MTKCAM_IPI_RAW_RZH1N2TO_2:
  2365		case MTKCAM_IPI_RAW_RZH1N2TO_3:
  2366		case MTKCAM_IPI_RAW_DRZS4NO_1:
  2367		case MTKCAM_IPI_RAW_DRZS4NO_2:
  2368		case MTKCAM_IPI_RAW_DRZS4NO_3:
  2369			mtk_cam_config_raw_img_out(cam, frame_param, buf);
  2370			break;
  2371		default:
  2372			/* Do nothing for the ports not related to crop settings */
  2373			break;
  2374		}
  2375	
  2376		return 0;
  2377	}
  2378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
