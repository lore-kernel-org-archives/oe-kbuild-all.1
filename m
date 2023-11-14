Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3352E83A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTwOVLch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700000568; x=1731536568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vnZSDFlO6pJDmvncw6FdtOux83jE5JCf2Pni8UNa0XY=;
  b=GTwOVLchVI0gezvHzUihMWDwDSz/2wNAQXG5Ez4VyM5QPPOoufj6vhl2
   wh7wIDhkItLO5EzIucESdh1tTwmBaiC8U1Fga5YPk9Ph5U2gAUtlIDmas
   kd7M4y02gLAzfioTCJ1r0GKUsderxto6bF4IQW4Lez0Mk/vXWtww7UaLl
   j9P/hH1YBKb8QPBikuvbywkwjDq5D8WEQAXTrfH4ER8aWxmfvA0zDtd4T
   RdtLiGwQdPXfIj0rysyXe9bZ2bJMkghgneakLOqIZ7otfUxxSs6CIzr/W
   2lwhuDSDqZPxWGWPbfD4bPTMVnZJ1GoI9opx6cImwqwX4aktXFBgTJwDT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421857938"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="421857938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 14:22:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="12942343"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2023 14:22:45 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r31nu-0000jg-0o;
	Tue, 14 Nov 2023 22:22:42 +0000
Date: Wed, 15 Nov 2023 06:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Suwan Kim <suwan.kim027@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Christoph Hellwig <hch@lst.de>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: drivers/block/virtio_blk.c:570:68: error: '%d' directive output may
 be truncated writing between 1 and 11 bytes into a region of size 7
Message-ID: <202311150655.hb4vzaIj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: 4e0400525691d0e676dbe002641f9a61261f1e1b virtio-blk: support polling I/O
date:   1 year, 5 months ago
config: x86_64-sof-customedconfig-edison-defconfig (https://download.01.org/0day-ci/archive/20231115/202311150655.hb4vzaIj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311150655.hb4vzaIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311150655.hb4vzaIj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/virtio_blk.c: In function 'init_vq':
>> drivers/block/virtio_blk.c:570:68: error: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 7 [-Werror=format-truncation=]
     570 |                 snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
         |                                                                    ^~
   drivers/block/virtio_blk.c:570:58: note: directive argument in the range [-2147483648, 65534]
     570 |                 snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
         |                                                          ^~~~~~~~~~~~~
   drivers/block/virtio_blk.c:570:17: note: 'snprintf' output between 11 and 21 bytes into a destination of size 16
     570 |                 snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +570 drivers/block/virtio_blk.c

   511	
   512	static int init_vq(struct virtio_blk *vblk)
   513	{
   514		int err;
   515		int i;
   516		vq_callback_t **callbacks;
   517		const char **names;
   518		struct virtqueue **vqs;
   519		unsigned short num_vqs;
   520		unsigned int num_poll_vqs;
   521		struct virtio_device *vdev = vblk->vdev;
   522		struct irq_affinity desc = { 0, };
   523	
   524		err = virtio_cread_feature(vdev, VIRTIO_BLK_F_MQ,
   525					   struct virtio_blk_config, num_queues,
   526					   &num_vqs);
   527		if (err)
   528			num_vqs = 1;
   529	
   530		if (!err && !num_vqs) {
   531			dev_err(&vdev->dev, "MQ advertised but zero queues reported\n");
   532			return -EINVAL;
   533		}
   534	
   535		num_vqs = min_t(unsigned int,
   536				min_not_zero(num_request_queues, nr_cpu_ids),
   537				num_vqs);
   538	
   539		num_poll_vqs = min_t(unsigned int, poll_queues, num_vqs - 1);
   540	
   541		vblk->io_queues[HCTX_TYPE_DEFAULT] = num_vqs - num_poll_vqs;
   542		vblk->io_queues[HCTX_TYPE_READ] = 0;
   543		vblk->io_queues[HCTX_TYPE_POLL] = num_poll_vqs;
   544	
   545		dev_info(&vdev->dev, "%d/%d/%d default/read/poll queues\n",
   546					vblk->io_queues[HCTX_TYPE_DEFAULT],
   547					vblk->io_queues[HCTX_TYPE_READ],
   548					vblk->io_queues[HCTX_TYPE_POLL]);
   549	
   550		vblk->vqs = kmalloc_array(num_vqs, sizeof(*vblk->vqs), GFP_KERNEL);
   551		if (!vblk->vqs)
   552			return -ENOMEM;
   553	
   554		names = kmalloc_array(num_vqs, sizeof(*names), GFP_KERNEL);
   555		callbacks = kmalloc_array(num_vqs, sizeof(*callbacks), GFP_KERNEL);
   556		vqs = kmalloc_array(num_vqs, sizeof(*vqs), GFP_KERNEL);
   557		if (!names || !callbacks || !vqs) {
   558			err = -ENOMEM;
   559			goto out;
   560		}
   561	
   562		for (i = 0; i < num_vqs - num_poll_vqs; i++) {
   563			callbacks[i] = virtblk_done;
   564			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
   565			names[i] = vblk->vqs[i].name;
   566		}
   567	
   568		for (; i < num_vqs; i++) {
   569			callbacks[i] = NULL;
 > 570			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
   571			names[i] = vblk->vqs[i].name;
   572		}
   573	
   574		/* Discover virtqueues and write information to configuration.  */
   575		err = virtio_find_vqs(vdev, num_vqs, vqs, callbacks, names, &desc);
   576		if (err)
   577			goto out;
   578	
   579		for (i = 0; i < num_vqs; i++) {
   580			spin_lock_init(&vblk->vqs[i].lock);
   581			vblk->vqs[i].vq = vqs[i];
   582		}
   583		vblk->num_vqs = num_vqs;
   584	
   585	out:
   586		kfree(vqs);
   587		kfree(callbacks);
   588		kfree(names);
   589		if (err)
   590			kfree(vblk->vqs);
   591		return err;
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
