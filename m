Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D865BE4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731776753; cv=none; b=FPfZkiZOA7Piplh8FvM+tRoeOp/jo7s0fwVEAamIbGS1qbsuJSYBYMaokmB5V7HPsTzxWmZoOLa10qmOZtXqC/wNnd1P8NLKEQBsefg23HbSffZC1Rwitu3DJCWJjmE7e1agyGdjuBNbFdZpfrEpSDeTErLQwcKg4p5AimoQUfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731776753; c=relaxed/simple;
	bh=+07b1zepdp4KOVxfwYxcYx8qwgbbRSD9HbR/Dq0XhzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AbTNa9guPpA/dyovyf8ALjGtHaoIbHbyRrFBi+kw2b37ppqOo5z+HVzKTj9Bk1meImF1iaLqwCmfvUqhiHIeREW3zPeQKbMbBHYr9HVNbIxm97SGBDWgC1F13DtAhxREsTAA94XTdLyH4ha6EaoKwpW8KlkF3xQaYdFQknuRH2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jS4P8y+v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jS4P8y+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731776751; x=1763312751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+07b1zepdp4KOVxfwYxcYx8qwgbbRSD9HbR/Dq0XhzY=;
  b=jS4P8y+vXwntciM3fCgcxc3GjHhw64ITFhTYwMJstaeNugqjJQN3n8Mi
   uxiStk3eDMvJkF88A1yasq+GFs4sHsxylVTSkRf5zsipTqz6IN04vPiQT
   aaK2l/GVb6gp3i/n3I+/J3XJlvpwk4J4joDByHxzVT7p5TFUK7EYseEI6
   vVdY0ifZHF07TPpbtUl9pzMP5Wh40ruAXXJRKBwzBgrRgizznu+fK9kbS
   CUNFKNIpihnt3ZMm82zHLBmTZH6WJ6WXfH6E4I9BawQvH++COS7wguJQ4
   ICdB9B92SofGt7uxmtXqQlVTBpnB9U0owDEuhXd+mARC2NiAO+2OmE4Z9
   A==;
X-CSE-ConnectionGUID: nnbGJXzjQhGMOc0C7F/AMg==
X-CSE-MsgGUID: iKYQ2Bn0RvOVHx5lA/aMyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42298724"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42298724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:05:50 -0800
X-CSE-ConnectionGUID: asVlhhMjQyOq5fn+P92jQA==
X-CSE-MsgGUID: 6oXAlLfLSA2pQCqCFdO4nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93775741"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 09:05:49 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMF0-0000zP-2o;
	Sat, 16 Nov 2024 17:05:46 +0000
Date: Sun, 17 Nov 2024 01:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 31/67]
 drivers/media/platform/mediatek/isp/isp_50/dip/mtk_dip-dev.c:411:15:
 warning: variable 'total_plane_size' set but not used
Message-ID: <202411170155.beqqb5eF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e2b6daceb83c9b9ae90fca4b78fc265484ded662
commit: 524bbd4dd314fcf6877aeb31b393e8ab321b8014 [31/67] BACKPORT: FROMLIST: media: platform: mediatek: isp: Add Mediatek DIP driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170155.beqqb5eF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170155.beqqb5eF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170155.beqqb5eF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/isp/isp_50/dip/mtk_dip-dev.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
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
>> drivers/media/platform/mediatek/isp/isp_50/dip/mtk_dip-dev.c:411:15: warning: variable 'total_plane_size' set but not used [-Wunused-but-set-variable]
     411 |         unsigned int total_plane_size = 0;
         |                      ^
   6 warnings generated.


vim +/total_plane_size +411 drivers/media/platform/mediatek/isp/isp_50/dip/mtk_dip-dev.c

   402	
   403	static void mtk_dip_fill_ipi_img_param_mp(struct mtk_dip_pipe *pipe,
   404						  struct img_image_buffer *b,
   405						  struct mtk_dip_dev_buffer *dev_buf,
   406						  char *buf_name)
   407	{
   408		struct v4l2_pix_format_mplane *pix_mp = &dev_buf->fmt.fmt.pix_mp;
   409		const struct mtk_dip_dev_format *mdp_fmt = dev_buf->dev_fmt;
   410		unsigned int i;
 > 411		unsigned int total_plane_size = 0;
   412	
   413		b->usage = dev_buf->dma_port;
   414		b->format.colorformat = dev_buf->dev_fmt->mdp_color;
   415		b->format.width = dev_buf->fmt.fmt.pix_mp.width;
   416		b->format.height = dev_buf->fmt.fmt.pix_mp.height;
   417		b->format.ycbcr_prof =
   418			mtk_dip_map_ycbcr_prof_mplane(pix_mp,
   419						      dev_buf->dev_fmt->mdp_color);
   420	
   421		for (i = 0; i < pix_mp->num_planes; ++i) {
   422			u32 stride = pix_mp->plane_fmt[i].bytesperline;
   423	
   424			/*
   425			 * We use dip_mdp_fmt_get_plane_size() to get the plane sizes of
   426			 * non-M multiple plane image buffers. In this case,
   427			 * pix_mp->plane_fmt[0].sizeimage is the total size of all
   428			 * b->format.plane_fmt[i].
   429			 */
   430			b->format.plane_fmt[i].stride = stride;
   431			b->format.plane_fmt[i].size =
   432				dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
   433							   pix_mp->height, i);
   434			b->iova[i] = dev_buf->isp_daddr[i];
   435			total_plane_size += b->format.plane_fmt[i].size;
   436		}
   437	
   438		if (!mtk_dip_is_contig_mp_buffer(dev_buf))
   439			return;
   440	
   441		for (; i < DIP_MCOLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
   442			u32 stride = dip_mdp_fmt_get_stride_contig
   443					(mdp_fmt, b->format.plane_fmt[0].stride, i);
   444	
   445			b->format.plane_fmt[i].stride = stride;
   446			b->format.plane_fmt[i].size =
   447				dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
   448							   pix_mp->height, i);
   449			b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
   450			total_plane_size += b->format.plane_fmt[i].size;
   451		}
   452	}
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
