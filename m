Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844B37F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 08:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675500400; x=1707036400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sk2J2M+A9CeErrHV2gjN/SS9gUsg4upQvvn3HNvLezY=;
  b=XH1TOytGZoQI0ktYVu1lCoFkYDO98Rx0NTLVPzSdKO9fPwL3WfcSGmkK
   7M4HABJxUej5NLw1JTwbVEcM63W4zNEatqThJiay8nLzdKQa9bckj3mDD
   m8OCaolQQeTT/fqQVd2nB346nSNWjSNOYD5ckZii2fvzLMrDa4RsohzfF
   NgG8ds1l+iJKQ5JSAoDpeCBbHhm145dCxDDBVXetXkU+KP+EbKwi3qRYe
   8nkWfEHWfRdujQNaqOniCu7Cs4tAUiPuUdNhQi6QOkmfUCx7ipK5+LNfY
   nAQ5Vv4RWR7gZ55L7tS4hkRlkpKcEGGZuJW+AWgEUbjabPu9eezVRYKTN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309263965"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309263965"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 00:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754731784"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="754731784"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 00:46:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOEBx-0001Am-1R;
	Sat, 04 Feb 2023 08:46:37 +0000
Date: Sat, 4 Feb 2023 16:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:saa7146 3/3]
 drivers/media/common/saa7146/saa7146_fops.c:116:34: warning: unused variable
 'next'
Message-ID: <202302041621.mvNM0kzS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git saa7146
head:   dfa6b1bac6ab077dca78499bc9178734b07a74f7
commit: dfa6b1bac6ab077dca78499bc9178734b07a74f7 [3/3] wip
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230204/202302041621.mvNM0kzS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree saa7146
        git checkout dfa6b1bac6ab077dca78499bc9178734b07a74f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/common/saa7146/saa7146_fops.c: In function 'saa7146_buffer_next':
>> drivers/media/common/saa7146/saa7146_fops.c:116:34: warning: unused variable 'next' [-Wunused-variable]
     116 |         struct saa7146_buf *buf,*next = NULL;
         |                                  ^~~~
>> drivers/media/common/saa7146/saa7146_fops.c:116:29: warning: unused variable 'buf' [-Wunused-variable]
     116 |         struct saa7146_buf *buf,*next = NULL;
         |                             ^~~
--
   drivers/media/common/saa7146/saa7146_video.c: In function 'video_end':
>> drivers/media/common/saa7146/saa7146_video.c:382:34: warning: unused variable 'q' [-Wunused-variable]
     382 |         struct saa7146_dmaqueue *q = NULL;//&vv->video_dmaq;
         |                                  ^
   drivers/media/common/saa7146/saa7146_video.c: In function 'video_open':
>> drivers/media/common/saa7146/saa7146_video.c:1201:28: warning: unused variable 'fh' [-Wunused-variable]
    1201 |         struct saa7146_fh *fh = file->private_data;
         |                            ^~
   At top level:
   drivers/media/common/saa7146/saa7146_video.c:1035:13: warning: 'release_all_pagetables' defined but not used [-Wunused-function]
    1035 | static void release_all_pagetables(struct saa7146_dev *dev, struct saa7146_buf *buf)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/saa7146/saa7146_video.c:1022:12: warning: 'buffer_activate' defined but not used [-Wunused-function]
    1022 | static int buffer_activate (struct saa7146_dev *dev,
         |            ^~~~~~~~~~~~~~~
   drivers/media/common/saa7146/saa7146_video.c:316:12: warning: 'video_begin' defined but not used [-Wunused-function]
     316 | static int video_begin(struct saa7146_fh *fh)
         |            ^~~~~~~~~~~
   drivers/media/common/saa7146/saa7146_video.c:196:12: warning: 'saa7146_pgtable_build' defined but not used [-Wunused-function]
     196 | static int saa7146_pgtable_build(struct saa7146_dev *dev, struct saa7146_buf *buf)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/next +116 drivers/media/common/saa7146/saa7146_fops.c

^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  112  
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  113  void saa7146_buffer_next(struct saa7146_dev *dev,
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  114  			 struct saa7146_dmaqueue *q, int vbi)
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  115  {
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16 @116  	struct saa7146_buf *buf,*next = NULL;
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  117  
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  118  	BUG_ON(!q);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  119  
44d0b80e5ff741 drivers/media/common/saa7146_fops.c         Joe Perches    2011-08-21  120  	DEB_INT("dev:%p, dmaq:%p, vbi:%d\n", dev, q, vbi);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  121  
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  122  	assert_spin_locked(&dev->slock);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  123  	if (!list_empty(&q->queue)) {
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  124  		/* activate next one from queue */
dfa6b1bac6ab07 drivers/media/common/saa7146/saa7146_fops.c Hans Verkuil   2023-02-03  125  #if 0
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  126  		buf = list_entry(q->queue.next,struct saa7146_buf,vb.queue);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  127  		list_del(&buf->vb.queue);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  128  		if (!list_empty(&q->queue))
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  129  			next = list_entry(q->queue.next,struct saa7146_buf, vb.queue);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  130  		q->curr = buf;
44d0b80e5ff741 drivers/media/common/saa7146_fops.c         Joe Perches    2011-08-21  131  		DEB_INT("next buffer: buf:%p, prev:%p, next:%p\n",
44d0b80e5ff741 drivers/media/common/saa7146_fops.c         Joe Perches    2011-08-21  132  			buf, q->queue.prev, q->queue.next);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  133  		buf->activate(dev,buf,next);
dfa6b1bac6ab07 drivers/media/common/saa7146/saa7146_fops.c Hans Verkuil   2023-02-03  134  #endif
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  135  	} else {
44d0b80e5ff741 drivers/media/common/saa7146_fops.c         Joe Perches    2011-08-21  136  		DEB_INT("no next buffer. stopping.\n");
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  137  		if( 0 != vbi ) {
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  138  			/* turn off video-dma3 */
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  139  			saa7146_write(dev,MC1, MASK_20);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  140  		} else {
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  141  			/* nothing to do -- just prevent next video-dma1 transfer
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  142  			   by lowering the protection address */
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  143  
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  144  			// fixme: fix this for vflip != 0
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  145  
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  146  			saa7146_write(dev, PROT_ADDR1, 0);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  147  			saa7146_write(dev, MC2, (MASK_02|MASK_18));
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  148  
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  149  			/* write the address of the rps-program */
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  150  			saa7146_write(dev, RPS_ADDR0, dev->d_rps0.dma_handle);
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  151  			/* turn on rps */
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  152  			saa7146_write(dev, MC1, (MASK_12 | MASK_28));
^1da177e4c3f41 drivers/media/common/saa7146_fops.c         Linus Torvalds 2005-04-16  153  

:::::: The code at line 116 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
