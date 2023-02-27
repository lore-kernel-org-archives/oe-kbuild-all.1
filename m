Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4B2F3A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677518396; x=1709054396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3+JXX+I3/aD24ac926PbfS5q0WnhDS5rMelnazzhew=;
  b=JGRc90J6oTj/ZM/697tVO2XbntxKKgp/+P5gIyhhpp7/dWE2CAuOnuNX
   DEN6vJG80SWTCHqL1rwAItkBob4PI183jKPBL2AtbKGOHifaQHE/bn/Gm
   rQITr2ZrQj0CVJVOTZa3oZEo4Xnzmnsr73Q97wcmbBBvhiq3+QOrT2gEs
   oHVDzIj1FErO54p88iyse/NyavN6OPncPnFW/lmvnApK1/7nQy0Z37pfl
   oj4vojacAfT6GUupyVuaAUkexrP8zWTpJ+NrLLHFBh4EL1fuunh7PF399
   Hd9kzybrpQ0I/swsg7eSvPh1l1ynstn66sHmGVdmhzVySelrnXg1tzmGz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="361471853"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="361471853"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 09:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="797723290"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="797723290"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2023 09:19:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWhAF-0004cR-1k;
	Mon, 27 Feb 2023 17:19:51 +0000
Date: Tue, 28 Feb 2023 01:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:saa7146 5/7]
 drivers/media/common/saa7146/saa7146_video.c:1204:22: warning: unused
 variable 'size'
Message-ID: <202302280122.6aSdk7Xx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git saa7146
head:   5c5c956a0a7165bba8f5c499562b729b64ff2130
commit: 5c5c956a0a7165bba8f5c499562b729b64ff2130 [5/7] wip
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302280122.6aSdk7Xx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree saa7146
        git checkout 5c5c956a0a7165bba8f5c499562b729b64ff2130
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280122.6aSdk7Xx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/common/saa7146/saa7146_video.c: In function 'buf_init':
>> drivers/media/common/saa7146/saa7146_video.c:1204:22: warning: unused variable 'size' [-Wunused-variable]
    1204 |         unsigned int size = vv->video_fmt.sizeimage;
         |                      ^~~~
   drivers/media/common/saa7146/saa7146_video.c: In function 'buf_prepare':
>> drivers/media/common/saa7146/saa7146_video.c:1226:33: warning: unused variable 'vbuf' [-Wunused-variable]
    1226 |         struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
         |                                 ^~~~
   At top level:
   drivers/media/common/saa7146/saa7146_video.c:1022:12: warning: 'buffer_activate' defined but not used [-Wunused-function]
    1022 | static int buffer_activate (struct saa7146_dev *dev,
         |            ^~~~~~~~~~~~~~~
   drivers/media/common/saa7146/saa7146_video.c:378:12: warning: 'video_end' defined but not used [-Wunused-function]
     378 | static int video_end(struct saa7146_fh *fh, struct file *file)
         |            ^~~~~~~~~
   drivers/media/common/saa7146/saa7146_video.c:316:12: warning: 'video_begin' defined but not used [-Wunused-function]
     316 | static int video_begin(struct saa7146_fh *fh)
         |            ^~~~~~~~~~~


vim +/size +1204 drivers/media/common/saa7146/saa7146_video.c

  1196	
  1197	static int buf_init(struct vb2_buffer *vb)
  1198	{
  1199		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
  1200		struct saa7146_buf *buf = container_of(vbuf, struct saa7146_buf, vb);
  1201		struct vb2_queue *vq = vb->vb2_queue;
  1202		struct saa7146_dev *dev = vb2_get_drv_priv(vq);
  1203		struct saa7146_vv *vv = dev->vv_data;
> 1204		unsigned int size = vv->video_fmt.sizeimage;
  1205		struct saa7146_format *sfmt;
  1206		int ret;
  1207	
  1208		sfmt = saa7146_format_by_fourcc(dev, vv->video_fmt.pixelformat);
  1209	
  1210		if (IS_PLANAR(sfmt->trans)) {
  1211			saa7146_pgtable_alloc(dev->pci, &buf->pt[0]);
  1212			saa7146_pgtable_alloc(dev->pci, &buf->pt[1]);
  1213			saa7146_pgtable_alloc(dev->pci, &buf->pt[2]);
  1214		} else {
  1215			saa7146_pgtable_alloc(dev->pci, &buf->pt[0]);
  1216		}
  1217	
  1218		ret = saa7146_pgtable_build(dev,buf);
  1219		if (ret)
  1220			release_all_pagetables(dev, buf);
  1221		return ret;
  1222	}
  1223	
  1224	static int buf_prepare(struct vb2_buffer *vb)
  1225	{
> 1226		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
  1227		struct vb2_queue *vq = vb->vb2_queue;
  1228		struct saa7146_dev *dev = vb2_get_drv_priv(vq);
  1229		struct saa7146_vv *vv = dev->vv_data;
  1230		unsigned int size = vv->video_fmt.sizeimage;
  1231	
  1232		if (vb2_plane_size(vb, 0) < size)
  1233			return -EINVAL;
  1234		vb2_set_plane_payload(vb, 0, size);
  1235		return 0;
  1236	}
  1237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
