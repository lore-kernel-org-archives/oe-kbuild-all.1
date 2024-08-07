Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD4615534D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 23:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723072285; cv=none; b=EjhPkugkf6vQ6adnJOJxhTmxyZoOKn8O+BTPhjN0T3p3cK/wezj6DZq8NUlZQwWTZ+nlewHgntwzVpkJdp879bCl3QGEQzzKyWoLTLiGxCo0hf3F+jDSuk1vGzMySutJvOImXj6dz9bTgP/KkoCA1vcy7fpxKPrtnrHTJI4+MOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723072285; c=relaxed/simple;
	bh=NodEApMFAUxtuhta/xF+6wiybcGJaJBNUO1xpRpKXJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZn4TZ09B1HGcn/cABUOKZ4fICHyu6zN/tlDvk6qm94CPKE3ax5uNGAZ1TdG/77csxmaSMyf4raCWre79en9z+eNvHi5Ap7nAH4h8MJevuSBVSh+7kUacdZa436hzQ5lalzeMmRbEBpNwAKFjnrwRNUD6/DFoomqKJFqonT3fP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0+ZsTyE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0+ZsTyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723072284; x=1754608284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NodEApMFAUxtuhta/xF+6wiybcGJaJBNUO1xpRpKXJY=;
  b=K0+ZsTyEzRkWk+7FksVN/+NBdtUlbTvQimknmw/oi/uSAog6btVVJmpI
   baVZBRQe0V1kUbLUtGueKIpw9N/y4FrRfg72YoF3vzlSUPn7bza/v/DjV
   jlb7IeVPjP7s0dd9Ifvk6RGFl+pKdHp1ECQ8ggeKRwVeoC1ENy7hkNvcT
   JGIDT9bkFfQmM4qPFurF90w1LJTeGEWTe4j8fg2uiWeH9NdrV+p/BnaDj
   rCGrblt96oLFdEDDtNevnx3Hp9atZmxfWPfUHKUSVOvegS1fOHufyANzg
   rnUcRQLn3GLp93vqfmHYT/B+3H4XoNzkFpM9ZxQeWO8vZN+uksKYx+v/z
   A==;
X-CSE-ConnectionGUID: c//F1BBSQG+FYIzep4QXgw==
X-CSE-MsgGUID: ExTUcm2VSYiQ+MpCUqslUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43693513"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="43693513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 16:11:23 -0700
X-CSE-ConnectionGUID: xFjwzB3OTnyBPnJ8yVYJ9w==
X-CSE-MsgGUID: CrqReSYDTP2OfyaGgSzVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56698050"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2024 16:11:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbpoN-0005n2-0v;
	Wed, 07 Aug 2024 23:11:19 +0000
Date: Thu, 8 Aug 2024 07:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 9/9]
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c:2341:29: error:
 variable 'ctx' set but not used
Message-ID: <202408080707.5c7iuIkC-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080707.5c7iuIkC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080707.5c7iuIkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080707.5c7iuIkC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c: In function 'mtk_cam_buf_config':
>> drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c:2341:29: error: variable 'ctx' set but not used [-Werror=unused-but-set-variable]
    2341 |         struct mtk_cam_ctx *ctx;
         |                             ^~~
   cc1: all warnings being treated as errors


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
