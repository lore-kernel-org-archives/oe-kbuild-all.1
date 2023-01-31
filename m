Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127B48C04
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675177830; x=1706713830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQLxou1869NSedWHSAE1jp/iuH4hJMt7uLe7LJAphR0=;
  b=f8wwpUY/C7o6oDW8jGjcasJUyP8/kHXQarM8W51Pj4XZFKPJxBGVw5Vp
   irZoYA8LlQYcVApp4y5jhQ/g4zWTYVHbnRmg+UWqIEKPmjb8j5oEzFCPu
   W9d9GOQENBbZ3YtxQQeRghs5oRK5oH+1uusemBbW2C58ZjF1JWTYvsAcz
   lrQGi7yxMZPNGOA+5EuDRvHJKYpEdNO5OOJGPp8E6JBLGxCV8GsIc+PuV
   NPkUMlQkydgkIZ+E7rskl0SeCKn1hKEKAsuF6Clf1P1KuMCXopasNs4I6
   tj1C1ItkKA1YESR/MgMP+nvdqrXdm9mu01tW92mDL4Ena7NEeJo0DcyeD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307519809"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="307519809"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 07:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="696845629"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="696845629"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2023 07:09:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMsGi-0004Ui-0i;
	Tue, 31 Jan 2023 15:09:56 +0000
Date: Tue, 31 Jan 2023 23:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:cx18 1/1]
 drivers/media/pci/cx18/cx18-fileops.c:681:38: warning: unused variable 'buf'
Message-ID: <202301312204.QmOJckDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git cx18
head:   dd156b1eb732069a1ec81273e9ea3e8dbe9c350d
commit: dd156b1eb732069a1ec81273e9ea3e8dbe9c350d [1/1] wip
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230131/202301312204.QmOJckDC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree cx18
        git checkout dd156b1eb732069a1ec81273e9ea3e8dbe9c350d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/pci/cx18/cx18-fileops.c: In function 'cx18_vb_timeout':
>> drivers/media/pci/cx18/cx18-fileops.c:681:38: warning: unused variable 'buf' [-Wunused-variable]
     681 |         struct cx18_videobuf_buffer *buf;
         |                                      ^~~


vim +/buf +681 drivers/media/pci/cx18/cx18-fileops.c

b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  677  
162e6376ac5844 drivers/media/pci/cx18/cx18-fileops.c   Kees Cook    2017-10-24  678  void cx18_vb_timeout(struct timer_list *t)
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  679  {
162e6376ac5844 drivers/media/pci/cx18/cx18-fileops.c   Kees Cook    2017-10-24  680  	struct cx18_stream *s = from_timer(s, t, vb_timeout);
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06 @681  	struct cx18_videobuf_buffer *buf;
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  682  	unsigned long flags;
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  683  
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  684  	/* Return all of the buffers in error state, so the vbi/vid inode
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  685  	 * can return from blocking.
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  686  	 */
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  687  	spin_lock_irqsave(&s->vb_lock, flags);
dd156b1eb73206 drivers/media/pci/cx18/cx18-fileops.c   Hans Verkuil 2023-01-31  688  #if 0
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  689  	while (!list_empty(&s->vb_capture)) {
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  690  		buf = list_entry(s->vb_capture.next,
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  691  			struct cx18_videobuf_buffer, vb.queue);
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  692  		list_del(&buf->vb.queue);
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  693  		buf->vb.state = VIDEOBUF_ERROR;
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  694  		wake_up(&buf->vb.done);
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  695  	}
dd156b1eb73206 drivers/media/pci/cx18/cx18-fileops.c   Hans Verkuil 2023-01-31  696  #endif
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  697  	spin_unlock_irqrestore(&s->vb_lock, flags);
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  698  }
b7101de3fff596 drivers/media/video/cx18/cx18-fileops.c Steven Toth  2011-04-06  699  

:::::: The code at line 681 was first introduced by commit
:::::: b7101de3fff596b35e45cd9fb7007caa07e97c9a [media] cx18: mmap() support for raw YUV video capture

:::::: TO: Steven Toth <stoth@kernellabs.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
