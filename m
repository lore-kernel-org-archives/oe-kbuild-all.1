Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D846817CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 01:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695173108; x=1726709108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TiosvdW9D0XHKohPE4FUvafVgAf5bSYB1gwfnwgT60=;
  b=aTgqgTg2IGXTNBDX3vO966jMUIRWXhKwt+XogrzSwjvBh/lixFfjx9UZ
   qPBe/Z24AukbADE7uN2izVd0a6u1+0HDffvnK5Gay5U+uItjCdwJJBIds
   hxZJQJ3/+Odfjz2Ydnds4aBYK3la4fulnvuVT1JAyWw8JmccY/AzeIBj6
   mi86nOotN0r9XnH/YMg8IE5KtxIv93VhCj5DpfsRgii0XxF3CJnDfRF4Q
   Qm9IpnKndfXLDnMrt1yXdsTdonSMemcNsPKma4YIkL2Mn4n+waGU+/utk
   kMnbYqy50g/qSbWyHyC0WEE8/Wgn5AzqBGkd8fm0TGCj/tuN2K8UYiVnI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365146625"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="365146625"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 18:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861765598"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="861765598"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2023 18:25:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qilxc-00088a-0t;
	Wed, 20 Sep 2023 01:25:02 +0000
Date: Wed, 20 Sep 2023 09:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/34] kernel/power/user.c:438:1: warning:
 the frame size of 1312 bytes is larger than 1024 bytes
Message-ID: <202309200923.LlbQuQ3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   9fbb1d9f46a35f7b0842dc52236cd88dc741b182
commit: 9fbb1d9f46a35f7b0842dc52236cd88dc741b182 [34/34] CHROMIUM: hibernate: Reload image in stack local bios.
config: i386-buildonly-randconfig-002-20230920 (https://download.01.org/0day-ci/archive/20230920/202309200923.LlbQuQ3h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200923.LlbQuQ3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200923.LlbQuQ3h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/user.c:365:6: warning: no previous prototype for 'reinit_bio' [-Wmissing-prototypes]
     365 | void reinit_bio(struct bio* bio, struct bio_vec* bio_vec, unsigned short max_vecs,
         |      ^~~~~~~~~~
   kernel/power/user.c: In function 'snapshot_read_block_device':
>> kernel/power/user.c:438:1: warning: the frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     438 | }
         | ^


vim +438 kernel/power/user.c

93f59c16303a99 Brian Geffon 2023-07-14  372  
9fbb1d9f46a35f Brian Geffon 2023-09-18  373  /*
9fbb1d9f46a35f Brian Geffon 2023-09-18  374   * We are limited to the number of iovecs we can do on the stack without causing
9fbb1d9f46a35f Brian Geffon 2023-09-18  375   * too deep of a stack which will break compilation. We can do more but it will
9fbb1d9f46a35f Brian Geffon 2023-09-18  376   * have to be in a kmalloc'ed page. For now we stick with stack allocation
9fbb1d9f46a35f Brian Geffon 2023-09-18  377   * for simplicity.
9fbb1d9f46a35f Brian Geffon 2023-09-18  378   */
9fbb1d9f46a35f Brian Geffon 2023-09-18  379  #define BIO_VEC_SIZE 100
93f59c16303a99 Brian Geffon 2023-07-14  380  static int snapshot_read_block_device(struct snapshot_data *data) {
6a29e8e6604154 Brian Geffon 2023-01-18  381  	int res;
93f59c16303a99 Brian Geffon 2023-07-14  382  	struct snapshot_bdev *sbdev = &data->snapshot_bdev;
9fbb1d9f46a35f Brian Geffon 2023-09-18  383  	struct bio_vec bio_vec[BIO_VEC_SIZE];
9fbb1d9f46a35f Brian Geffon 2023-09-18  384  	struct bio bio;
9fbb1d9f46a35f Brian Geffon 2023-09-18  385  	unsigned long sector = 0;
9fbb1d9f46a35f Brian Geffon 2023-09-18  386  	bool is_full;
93f59c16303a99 Brian Geffon 2023-07-14  387          ktime_t start = ktime_get();
93f59c16303a99 Brian Geffon 2023-07-14  388  	ktime_t stop;
9fbb1d9f46a35f Brian Geffon 2023-09-18  389  	reinit_bio(&bio, (struct bio_vec*)&bio_vec, BIO_VEC_SIZE, sector, sbdev->bdev, REQ_OP_READ);
93f59c16303a99 Brian Geffon 2023-07-14  390  
93f59c16303a99 Brian Geffon 2023-07-14  391  	while (true) {
93f59c16303a99 Brian Geffon 2023-07-14  392  		res = snapshot_write_next(&data->handle);
93f59c16303a99 Brian Geffon 2023-07-14  393  		if (res == 0)
93f59c16303a99 Brian Geffon 2023-07-14  394  			goto transfer_complete_wait;
93f59c16303a99 Brian Geffon 2023-07-14  395  		else if (res < 0)
93f59c16303a99 Brian Geffon 2023-07-14  396  			goto out_err;
93f59c16303a99 Brian Geffon 2023-07-14  397  
93f59c16303a99 Brian Geffon 2023-07-14  398  		if (!data_of(data->handle)) {
93f59c16303a99 Brian Geffon 2023-07-14  399  			res = -EINVAL;
93f59c16303a99 Brian Geffon 2023-07-14  400  			goto out_err;
93f59c16303a99 Brian Geffon 2023-07-14  401  		}
93f59c16303a99 Brian Geffon 2023-07-14  402  
93f59c16303a99 Brian Geffon 2023-07-14  403  add_page:
9fbb1d9f46a35f Brian Geffon 2023-09-18  404  		is_full = !bio_add_page(&bio, virt_to_page(data_of(data->handle)), PAGE_SIZE, 0);
9fbb1d9f46a35f Brian Geffon 2023-09-18  405  		if (is_full || data->handle.sync_read) {
9fbb1d9f46a35f Brian Geffon 2023-09-18  406  			res = submit_bio_wait(&bio);
9fbb1d9f46a35f Brian Geffon 2023-09-18  407  			if (res)
93f59c16303a99 Brian Geffon 2023-07-14  408  				goto out_err;
93f59c16303a99 Brian Geffon 2023-07-14  409  
9fbb1d9f46a35f Brian Geffon 2023-09-18  410  			sector = bio_end_sector(&bio);
9fbb1d9f46a35f Brian Geffon 2023-09-18  411  			bio_uninit(&bio);
9fbb1d9f46a35f Brian Geffon 2023-09-18  412  			reinit_bio(&bio, (struct bio_vec*)&bio_vec, BIO_VEC_SIZE, sector,
9fbb1d9f46a35f Brian Geffon 2023-09-18  413  					sbdev->bdev, REQ_OP_READ);
9fbb1d9f46a35f Brian Geffon 2023-09-18  414  			if (is_full)
93f59c16303a99 Brian Geffon 2023-07-14  415  				goto add_page;
93f59c16303a99 Brian Geffon 2023-07-14  416  		}
93f59c16303a99 Brian Geffon 2023-07-14  417  
93f59c16303a99 Brian Geffon 2023-07-14  418  		sbdev->nr_blocks_used++;
93f59c16303a99 Brian Geffon 2023-07-14  419  	}
93f59c16303a99 Brian Geffon 2023-07-14  420  
93f59c16303a99 Brian Geffon 2023-07-14  421  transfer_complete_wait:
9fbb1d9f46a35f Brian Geffon 2023-09-18  422  	res = submit_bio_wait(&bio);
9fbb1d9f46a35f Brian Geffon 2023-09-18  423  	bio_uninit(&bio);
93f59c16303a99 Brian Geffon 2023-07-14  424  	if (res) {
93f59c16303a99 Brian Geffon 2023-07-14  425  		data->read_failure = true;
93f59c16303a99 Brian Geffon 2023-07-14  426  		return res;
93f59c16303a99 Brian Geffon 2023-07-14  427  	}
93f59c16303a99 Brian Geffon 2023-07-14  428  
93f59c16303a99 Brian Geffon 2023-07-14  429  	stop = ktime_get();
9fbb1d9f46a35f Brian Geffon 2023-09-18  430  	if (!snapshot_image_loaded(&data->handle))
9fbb1d9f46a35f Brian Geffon 2023-09-18  431  		return -ENODATA;
9fbb1d9f46a35f Brian Geffon 2023-09-18  432  
93f59c16303a99 Brian Geffon 2023-07-14  433  	swsusp_show_speed(start, stop, sbdev->nr_blocks_used, "loaded image via ioctl");
93f59c16303a99 Brian Geffon 2023-07-14  434  	return 0;
93f59c16303a99 Brian Geffon 2023-07-14  435  out_err:
9fbb1d9f46a35f Brian Geffon 2023-09-18  436  	bio_uninit(&bio);
93f59c16303a99 Brian Geffon 2023-07-14  437  	return res;
93f59c16303a99 Brian Geffon 2023-07-14 @438  }
6a29e8e6604154 Brian Geffon 2023-01-18  439  

:::::: The code at line 438 was first introduced by commit
:::::: 93f59c16303a994931d060c6aee739dcbd99e1be CHROMIUM: hibernate: Add SNAPSHOT_XFER_BLOCK_DEVICE ioctl on read

:::::: TO: Brian Geffon <bgeffon@chromium.org>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
