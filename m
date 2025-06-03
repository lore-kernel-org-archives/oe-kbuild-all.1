Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27362C3244
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748927477; cv=none; b=aRbv/TbT0UJVi7kwF6jk4r4U/e6v9RV5fYM1q5+VYygjtta8/W+hOeVJBOQkRcfW2L2/haJdhpYZlYTEJObWzdK9dQw/O11lVvixqEGN/+e2djsG4ASWAsHaeb6I38Uf+4RKd/zbtJEXuD/E1WCSmmGZ3fKMGCP8UFgNV1Pn5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748927477; c=relaxed/simple;
	bh=TG2eyMyvIfYZk9jJgOBypq898ZnUmlREexQqsWV7bDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fcoiH6LAJR0cjzzV6S4SZ1qViG/viYUs1SxYbxvmGwkxrSiZMrXL56C5tkJQ0Ov7Enl5NrLyeaSElY9Nr/82KWpHfUTywBm/gAvJYNsP8FLZY/0f5Nn/ttYjrfpXtQae7tZzmbHvUPXBkKvWoUZzEQfy+igVrh8GgBvDJaiHTqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkiQiG9B; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkiQiG9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748927475; x=1780463475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TG2eyMyvIfYZk9jJgOBypq898ZnUmlREexQqsWV7bDY=;
  b=HkiQiG9BxB8Fm5cZ4nHO+Uf8Qd1y3W8f6z6Gr89DPuREaDJUi8teVa/a
   zbn5O9116rBeJGzqTzRdw3jXwrdIWilad43ZO8PNVNP2EH3fgCGeUhWPc
   n2mlvh9///Q73J17loRfzQZeQJLjuuZIi60eIqJQ/SSB+uAe2H/pFQ24X
   UvqoE77FwdG7PUwiC+jZYC1kL6cspJlviFTXLlM/25Q+P01/JpHPEuXB4
   8XEO++NANsnzCJZWQImMvQH/xQlgjqmXvS1GwuIDaErkmWN/ojKvTWCBA
   ac2hYeS1rvIxOXXkceL8e9DY3XtaQhGwTs0mqwGuwTJLX+m6rsuvEBBrW
   Q==;
X-CSE-ConnectionGUID: Mz/rIy4bQXGt13gCYThCLQ==
X-CSE-MsgGUID: x+edKbavTEKyISwX4n+SQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62006976"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="62006976"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 22:07:27 -0700
X-CSE-ConnectionGUID: O8oMk72tRWubRRmZ/Ff+yg==
X-CSE-MsgGUID: 6zRTQYjYRcGVmfcIM915PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="175595099"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jun 2025 22:07:27 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMJrv-0001QI-1R;
	Tue, 03 Jun 2025 05:07:23 +0000
Date: Tue, 3 Jun 2025 13:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:712:38: warning:
 variable 'plane_fmt' set but not used
Message-ID: <202506031353.9wOkldEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   21fc2218c3dfde22b522a0352bb0112b85d0fe72
commit: 748d2650c057ecda791e6b2d3efecc353679fa09 [0/1] CHROMIUM: media: jpeg: fix jpegdec resolution handle flow
config: i386-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250603/202506031353.9wOkldEH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031353.9wOkldEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031353.9wOkldEH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_buf_prepare':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:712:38: warning: variable 'plane_fmt' set but not used [-Wunused-but-set-variable]
     712 |         struct v4l2_plane_pix_format plane_fmt = {};
         |                                      ^~~~~~~~~


vim +/plane_fmt +712 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  707  
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  708  static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  709  {
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  710  	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  711  	struct mtk_jpeg_q_data *q_data = NULL;
934e8bccac9542 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c kyrie wu   2022-09-29 @712  	struct v4l2_plane_pix_format plane_fmt = {};
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  713  	int i;
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  714  
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  715  	q_data = mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  716  	if (!q_data)
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  717  		return -EINVAL;
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  718  
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  719  	for (i = 0; i < q_data->fmt->colplanes; i++) {
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  720  		plane_fmt = q_data->pix_mp.plane_fmt[i];
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  721  		if (ctx->enable_exif &&
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  722  		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
748d2650c057ec drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c Kyrie Wu   2024-09-30  723  			vb2_set_plane_payload(vb, i, vb2_plane_size(vb, i));
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  724  		else
748d2650c057ec drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c Kyrie Wu   2024-09-30  725  			vb2_set_plane_payload(vb, i, vb2_plane_size(vb, i));
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  726  	}
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  727  
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  728  	return 0;
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  729  }
b2f0d2724ba477 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Rick Chang 2016-12-14  730  

:::::: The code at line 712 was first introduced by commit
:::::: 934e8bccac9542540493a4e5257d6b0db4162478 mtk-jpegenc: support jpegenc multi-hardware

:::::: TO: kyrie wu <kyrie.wu@mediatek.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
