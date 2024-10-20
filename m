Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634C3209
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729394297; cv=none; b=O4mQxcERHcdgYDJs/i5IPl6OZ19yXIOAgDuDwyo/VULIgACZ5yf5DFbBpo1m9HizmDzmXL+eD7rjjRrftv5I1oTDl3CcHYb9F144LJ5czcFC6+wJIKNSP7V13EKITY7N+sM2sU5sXtVfd4DhTPHAFg93WdPJ6Nw2/dRTj5eT2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729394297; c=relaxed/simple;
	bh=8GZMI0yEATExBupqNCg+WxtvPX6/Px2dqnOuhgaxRNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+2o2KB36u52o6ZI+JiUbBROdBudb9feQyQQzle6BeJ+FBgbAsTkqJC/xWpXSLsxFdE3tCQ12CQ7fCm/hjfufnNInnS9NHuG3dB+GXj+kGMyTprf2dNbU78e3QuZ4gzEUIJ9H5WYEo6ZxB/Jzgf0BxiKL6O8RHn08xQSm1LVWQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OayeQ8SU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OayeQ8SU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729394294; x=1760930294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8GZMI0yEATExBupqNCg+WxtvPX6/Px2dqnOuhgaxRNs=;
  b=OayeQ8SUF8PaY1+iO/Ty74SJ/dTef1dnESvbLQiEMdztbrPkqMaaI3Vq
   gdYHOsZRvism2lPgxDi4cNoCzvLWxz+BiEOZWMV0EHrwx/NRhQaB6DEzA
   FD9PV1oRo8n9GZlS6Zx5iP2K3UAmjlI8NpJ7iFyv1Ybw1ymI16nBDsZvF
   gLEGTf3HBrDXykdFBVle2BtU6KEM+CxJ0TKt/CVrP26U+a+lbSuER7Z1G
   pShFhgtQN8yL9oSessq4QEXUKUJfJnSgAlLfs0XOqxCU/LV9SSpTTVDWt
   YgHHQKG3BpsBclIm1QkYc5NqzrSMSmpuBmMKq4IisL19EHNX444FkiXYN
   Q==;
X-CSE-ConnectionGUID: ymDkl/hsTny+Z2w8szbY5Q==
X-CSE-MsgGUID: NWPnxhTkT6q+m91OymqU3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="32697995"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="32697995"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 20:18:13 -0700
X-CSE-ConnectionGUID: VdJtwip3Qz+tfoKXzht0IA==
X-CSE-MsgGUID: HXRxVdlVQFa1Xl14AYkAVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="78864449"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2024 20:18:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2MSI-000PpF-0r;
	Sun, 20 Oct 2024 03:18:10 +0000
Date: Sun, 20 Oct 2024 11:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 3/42]
 drivers/media/platform/mediatek/isp/isp_50/dip/mtk_dip-dev.c:411:15:
 warning: variable 'total_plane_size' set but not used
Message-ID: <202410201133.bRPcaFyx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f80404ea0956d01dcbcdfb1e4807883883fb46bb
commit: f3dfe20a2f4b990f6640e16f5a45563c02459b06 [3/42] BACKPORT: FROMLIST: media: platform: mediatek: isp: Add Mediatek DIP driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241020/202410201133.bRPcaFyx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201133.bRPcaFyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201133.bRPcaFyx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/isp/isp_50/dip/mtk_dip-dev.c:411:15: warning: variable 'total_plane_size' set but not used [-Wunused-but-set-variable]
     411 |         unsigned int total_plane_size = 0;
         |                      ^
   1 warning generated.


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
