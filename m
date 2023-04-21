Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155A37A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 01:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682041863; x=1713577863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lrrOW9s3aACx4k5mkcXxqFKSO6rDBbv5d45h2s2y4Qo=;
  b=U1XTvvm/cidNLp7w4bTSpiNdbq+T1ctY1n7/JUY18OwvSGXnEU1KexKf
   aZfi47DRlzvL6BU0Njq7WdoXLjBCZFZw7huI+wc2+FJUIUmXsXzc2fm7c
   6bq4XzhScSV0gv6m5jVm72pOqOOdhZevTbdpEhi+dpc+FZJknLUiROhzg
   ELlpDVgzBIT3kgIczTkm3wkFDVNkrwDrBjbIWtVCOiH5QiWwr+COO4vyZ
   joP7WlYoAI1VIo6//ksA9p5HbKSujQqhy+dfJFp1SMcGpLZlmKNxWVOa+
   1x9OK8rH6tOnD0T+FSbKpH2iVfCeCJQk0wqeIJ5aGkYdmuml9QWA6L4fp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348684231"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="348684231"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 18:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021771792"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="1021771792"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 18:51:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppfvP-000gEO-26;
	Fri, 21 Apr 2023 01:50:59 +0000
Date: Fri, 21 Apr 2023 09:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Changpeng Liu <changpeng.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Daniel Verkamp <dverkamp@chromium.org>,
	Stephen Barber <smbarber@chromium.org>,
	Dylan Reid <dgreid@chromium.org>,
	Ryan Case <ryandcase@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 353/6555]
 drivers/block/virtio_blk.c:197:32: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202304210914.lnSXuku6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 9f34ca2c7bcf381efb6f3e1a876dedf95f9b68ed [353/6555] BACKPORT: FROMLIST: virtio_blk: add discard and write zeroes support
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230421/202304210914.lnSXuku6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/9f34ca2c7bcf381efb6f3e1a876dedf95f9b68ed
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 9f34ca2c7bcf381efb6f3e1a876dedf95f9b68ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210914.lnSXuku6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/virtio_blk.c:197:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __virtio32 [usertype] flags @@     got restricted __le32 [usertype] @@
   drivers/block/virtio_blk.c:197:32: sparse:     expected restricted __virtio32 [usertype] flags
   drivers/block/virtio_blk.c:197:32: sparse:     got restricted __le32 [usertype]
>> drivers/block/virtio_blk.c:198:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __virtio32 [usertype] num_sectors @@     got restricted __le32 [usertype] @@
   drivers/block/virtio_blk.c:198:38: sparse:     expected restricted __virtio32 [usertype] num_sectors
   drivers/block/virtio_blk.c:198:38: sparse:     got restricted __le32 [usertype]
>> drivers/block/virtio_blk.c:199:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __virtio64 [usertype] sector @@     got restricted __le64 [usertype] @@
   drivers/block/virtio_blk.c:199:33: sparse:     expected restricted __virtio64 [usertype] sector
   drivers/block/virtio_blk.c:199:33: sparse:     got restricted __le64 [usertype]

vim +197 drivers/block/virtio_blk.c

   175	
   176	
   177	static inline int virtblk_setup_discard_write_zeroes(struct request *req,
   178							     bool unmap)
   179	{
   180		unsigned short segments = blk_rq_nr_discard_segments(req);
   181		unsigned short n = 0;
   182		struct virtio_blk_discard_write_zeroes *range;
   183		struct bio *bio;
   184		u32 flags = 0;
   185	
   186		if (unmap)
   187			flags |= VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP;
   188	
   189		range = kmalloc_array(segments, sizeof(*range), GFP_ATOMIC);
   190		if (!range)
   191			return -ENOMEM;
   192	
   193		__rq_for_each_bio(bio, req) {
   194			u64 sector = bio->bi_iter.bi_sector;
   195			u32 num_sectors = bio->bi_iter.bi_size >> 9;
   196	
 > 197			range[n].flags = cpu_to_le32(flags);
 > 198			range[n].num_sectors = cpu_to_le32(num_sectors);
 > 199			range[n].sector = cpu_to_le64(sector);
   200			n++;
   201		}
   202	
   203		req->special_vec.bv_page = virt_to_page(range);
   204		req->special_vec.bv_offset = offset_in_page(range);
   205		req->special_vec.bv_len = sizeof(*range) * segments;
   206		req->rq_flags |= RQF_SPECIAL_PAYLOAD;
   207	
   208		return 0;
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
