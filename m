Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1266217C5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 21:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675631022; x=1707167022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4tGP7YECaEXuftXsDhXb8MnUI+Jm5VnqZNZCKCTFN8=;
  b=XA8iqMv78xwZqb2RMDmIBhPYupJ3D/kZ+MCigZMeBfLAzEHejOtF+vrx
   zC5z2hd0O5/bRssaC+c1nurrmdC59eX4cSKQqO4wLP+oUtYMAFSakRJY+
   eXW9XtgS9zfNWA6Fcat8p4Uhhl7b+nghlOXG2VfjltUgIuT1lNk9oXkQV
   ndpTL5OyhyklIN4x3dnBVmn0tI8xdcrFdy6JaZUO8rPeSYaUQKe8lKrAI
   Yf3BLKKP12ZvKcsYycRxWqXgau9IvsOjEUp9fJlxfwVLEVRmqjaKJYrqi
   4GB3gZUqxREK0ANTXOos2s7bc3yEObB/NT1Z7+kPPDW1a/yt0LJffnfSN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415308288"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="415308288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 13:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="666306746"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="666306746"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Feb 2023 13:03:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOmAf-0002DS-2W;
	Sun, 05 Feb 2023 21:03:33 +0000
Date: Mon, 6 Feb 2023 05:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/media/virtio/virtio_video_vq.c:532:41: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202302060411.AveowtsE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: bc32f55417037a061fc11e60c35c084d454f8b85 FROMLIST: drivers: media: virtio: Support virtio objects in virtio-video driver
date:   2 years, 2 months ago
config: m68k-randconfig-s051-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060411.AveowtsE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=bc32f55417037a061fc11e60c35c084d454f8b85
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout bc32f55417037a061fc11e60c35c084d454f8b85
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_video_vq.c:241:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:242:21: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] stream_id @@
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     expected unsigned long id
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     got restricted __le32 [usertype] stream_id
>> drivers/media/virtio/virtio_video_vq.c:532:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int data_offset @@
   drivers/media/virtio/virtio_video_vq.c:532:41: sparse:     expected restricted __le32
   drivers/media/virtio/virtio_video_vq.c:532:41: sparse:     got unsigned int data_offset
   drivers/media/virtio/virtio_video_vq.c:597:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_data_sizes @@     got unsigned char [usertype] num_data_size @@
   drivers/media/virtio/virtio_video_vq.c:597:31: sparse:     expected restricted __le32 [usertype] num_data_sizes
   drivers/media/virtio/virtio_video_vq.c:597:31: sparse:     got unsigned char [usertype] num_data_size
   drivers/media/virtio/virtio_video_vq.c:774:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] top @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:774:31: sparse:     expected restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_vq.c:774:31: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:775:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] left @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:775:32: sparse:     expected restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_vq.c:775:32: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:776:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] width @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:776:33: sparse:     expected restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_vq.c:776:33: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:777:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] height @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:777:34: sparse:     expected restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_vq.c:777:34: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:824:18: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:866:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] @@
   drivers/media/virtio/virtio_video_vq.c:866:34: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_vq.c:866:34: sparse:     got restricted __le32 [usertype]
   drivers/media/virtio/virtio_video_vq.c:865:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] format @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:865:30: sparse:     expected restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_vq.c:865:30: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:309:28: sparse: sparse: context imbalance in 'virtio_video_queue_cmd_buffer_locked' - unexpected unlock

vim +532 drivers/media/virtio/virtio_video_vq.c

   512	
   513	int virtio_video_cmd_resource_create_object(
   514		struct virtio_video *vv, uint32_t stream_id, uint32_t resource_id,
   515		uint32_t queue_type, unsigned int num_planes, struct vb2_plane *planes,
   516		struct virtio_video_object_entry *ents)
   517	{
   518		struct virtio_video_resource_create *req_p;
   519		struct virtio_video_vbuffer *vbuf;
   520		int i;
   521	
   522		req_p = virtio_video_alloc_req(vv, &vbuf, sizeof(*req_p));
   523		if (IS_ERR(req_p))
   524			return PTR_ERR(req_p);
   525	
   526		virtio_video_cmd_resource_create_core(vv, req_p, stream_id, resource_id,
   527						      queue_type, num_planes);
   528	
   529		req_p->planes_layout =
   530			cpu_to_le32(VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER);
   531		for (i = 0; i < num_planes; i++)
 > 532			req_p->plane_offsets[i] = planes[i].data_offset;
   533	
   534		vbuf->data_buf = ents;
   535		vbuf->data_size = sizeof(*ents);
   536	
   537		return virtio_video_queue_cmd_buffer(vv, vbuf);
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
