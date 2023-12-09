Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7BB12B6C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJ/H1BJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702122377; x=1733658377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xM8WikcXr+pcO7/vio0ZF0TjmQbaiwku7r6cP2Aok64=;
  b=FJ/H1BJP9S2bNbgHC/WPtbXggjo1GRqjHSGjUiKSnn5VxIzasidX1rlH
   hSGI2mUbP5jDO/7SeRIHDSr1jWI/+CZaECT9FCA3GpXUvuQXOXJRV9Xy+
   x4lBHkqoVyhBCJlhCQtx/cVxcoMkOBIYZzAerGJZXVPtoGGx7ia0JmNSN
   yvlT5F/VwGxqKTYQymXzTqB1P4h7R7A+azs6Z91K2ILJrcO6CC63HOrDM
   g0VzdrSqGwkqnAxhPsYOBMue406Ng1fGTMYoXR4sXF3PFLfX78fDeKXix
   0nXWi39GMcSMGE/TPth2mQfYOXx8NQ8rc3ilv5MHQbsBdzm15W0+vBbd6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1605685"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1605685"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 03:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="748633617"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="748633617"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2023 03:46:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBvmf-000FJ7-0Q;
	Sat, 09 Dec 2023 11:46:13 +0000
Date: Sat, 9 Dec 2023 19:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-arcvm 11/16]
 drivers/media/virtio/virtio_video_enc.c:35: undefined reference to
 `__udivdi3'
Message-ID: <202312091944.wPYiWygP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   b26894471e7a8f8d1dc4c3c233e3e606540bbdd3
commit: d12a3174c5d0a6a0f498d6ba2abf6caee3844082 [11/16] Convert nsec to usec in encoder buffer timestamps
config: i386-randconfig-061-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091944.wPYiWygP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091944.wPYiWygP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091944.wPYiWygP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/virtio/virtio_video_enc.o: in function `virtio_video_enc_buf_queue':
>> drivers/media/virtio/virtio_video_enc.c:35: undefined reference to `__udivdi3'


vim +35 drivers/media/virtio/virtio_video_enc.c

    25	
    26	static void virtio_video_enc_buf_queue(struct vb2_buffer *vb)
    27	{
    28		struct vb2_v4l2_buffer *v4l2_vb = to_vb2_v4l2_buffer(vb);
    29		struct virtio_video_stream *stream = vb2_get_drv_priv(vb->vb2_queue);
    30		struct virtio_video_buffer *virtio_vb = to_virtio_vb(vb);
    31	
    32		/* Converting timestamp to usec for encoder to keep compatibility
    33		 * with lower layers
    34		 */
  > 35		virtio_vb->timestamp = vb->timestamp / 1000;
    36	
    37		v4l2_m2m_buf_queue(stream->fh.m2m_ctx, v4l2_vb);
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
