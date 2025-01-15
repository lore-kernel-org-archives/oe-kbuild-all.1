Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85379132C38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 22:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736978550; cv=none; b=fli54PRtBYMpTWIfbNmnAIoY1vGExE1Di7BfrLftuyZ6fLEXcr9UIQgJ64gTHxjQCxerSe0sdVQdbOd8ttsolR4ldUhFlShf7CYQkeOWF5MjNkfxhkZoFx5vktvZMiLcvHM7jQfP21RklgBVGEes8+cBBRfHZyn2hp36KJxm9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736978550; c=relaxed/simple;
	bh=xEHQCZr57xj24gTQFn6bueCQldBIfKJ04VhSkruoSc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGKhLXhO/37OVKE3/1wEDmmMu8ryJ7CqIgzrAuh6Y/OnApz7yUHSf3LbPayfM4kNMMAR4ErvVVsCBaT4yiIg+2Mv3LbatxgBXdd9hywf7BIYsedubW0Ho4VXM4O69UzDM3k1lB/YQZEEEt40MvtaeyNQZRSlX3JU7VrjEjBMu1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaPXUnuQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaPXUnuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736978549; x=1768514549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xEHQCZr57xj24gTQFn6bueCQldBIfKJ04VhSkruoSc8=;
  b=VaPXUnuQqGdl+ZT4XrWOmeOnmVKTX7LnGicecUgp8yqqeV2TmeuiLpPr
   838cxfUFaC8WUHnAPUFJEEXmJbNwjV+A44xUu/Zs7DAbty5JRt7l1tmV5
   DmAMlUj/dnkxu8kq9wfFFVeu3anlsiJDRMN4rUWgay3fcF7/Zexn4j3Sh
   CYSx4v/Gm2R/Pglgq0W7bbMHJhG8bqm49Vs1jvRG5UsfcchbdRA2ggpsg
   KWE9JWcbrihMz168QHlK8oikwOHHV5OodGgii6Yz5SuD5w4OnOI0Ge4MP
   Fpq6Ag9oeMq5KhOtiVdVVtDD4yJl5RLEu/FAZmUTZfachWq//B2rk4GaR
   g==;
X-CSE-ConnectionGUID: MQam2g8iQGSFm6DkTE4JXg==
X-CSE-MsgGUID: uIiWNkCjTZyli82WRkcP+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41272141"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="41272141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 14:02:28 -0800
X-CSE-ConnectionGUID: P2XX9V71RSaU4gqx9zJmzQ==
X-CSE-MsgGUID: F8jqYqGpQkWReQnT3O3h7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="105040006"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jan 2025 14:02:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYBSy-000Qwh-2i;
	Wed, 15 Jan 2025 22:02:24 +0000
Date: Thu, 16 Jan 2025 06:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 278/278]
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:712:31: warning:
 variable 'plane_fmt' set but not used
Message-ID: <202501160542.7tmwuj2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   48b50213e678679ceae03f9a6b223e7f5827df88
commit: d7b7ecf4c8541f64a9d5497ae7598c08a3f9e57b [278/278] CHROMIUM: media: jpeg: fix jpegdec resolution handle flow
config: x86_64-buildonly-randconfig-005-20250116 (https://download.01.org/0day-ci/archive/20250116/202501160542.7tmwuj2b-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160542.7tmwuj2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160542.7tmwuj2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:21:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:712:31: warning: variable 'plane_fmt' set but not used [-Wunused-but-set-variable]
     712 |         struct v4l2_plane_pix_format plane_fmt = {};
         |                                      ^
   2 warnings generated.


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
d7b7ecf4c8541f drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c Kyrie Wu   2024-09-30  723  			vb2_set_plane_payload(vb, i, vb2_plane_size(vb, i));
45f13a57d81344 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c      Xia Jiang  2020-08-14  724  		else
d7b7ecf4c8541f drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c Kyrie Wu   2024-09-30  725  			vb2_set_plane_payload(vb, i, vb2_plane_size(vb, i));
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
