Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26F1C2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691650770; x=1723186770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCj2pcmO1N+JXPquZOKbzprgszdpbkARA3bzWGhHM58=;
  b=CfJYIvSxUBzV2IIMbNvpqDbypFEbE0ewhCfcj0NQrgsaKM5/IWKV5n/g
   kbGyrsTGH+E6WK5tmuQ9ROruAtn+dQkQs5xjEr45PBCsd+huD3PW+zXCo
   yCVVXcT4lDiyKDEGe8Qoage9PYV65zRgpDn+IEC8Jd2XBscLk2lleJGLp
   nO0TdE1MQQ7VWWs0fN9ATPT1V3XnCvlJf4X+JW8vGT7enawb8vbHJ0qLX
   pNjImKKrBwsabHjAqAFulAzv7C9MN6nK6smPzorNKwFa++FCYdtcecT9i
   4UBHvVbhfxr6vr+pAuGzlrjsBmCJojX9jPyYBG27TWnPtb5RA4i+07t1R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350898727"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="350898727"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 23:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735292088"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="735292088"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 23:59:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTzdO-0006om-0c;
	Thu, 10 Aug 2023 06:59:02 +0000
Date: Thu, 10 Aug 2023 14:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rw-misc:ubiblock_highmem 1/1] drivers/mtd/ubi/eba.c:775: undefined
 reference to `scsi_kmap_atomic_sg'
Message-ID: <202308101456.GfntcIOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git ubiblock_highmem
head:   4984f13afd92447b332059cb5ed06c45a1512f11
commit: 4984f13afd92447b332059cb5ed06c45a1512f11 [1/1] WIP: ubiblock: Refactor sg list processing for highmem
config: arm-randconfig-r046-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101456.GfntcIOW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101456.GfntcIOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101456.GfntcIOW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mtd/ubi/eba.o: in function `ubi_eba_read_leb_sg':
>> drivers/mtd/ubi/eba.c:775: undefined reference to `scsi_kmap_atomic_sg'
>> arm-linux-gnueabi-ld: drivers/mtd/ubi/eba.c:777: undefined reference to `scsi_kunmap_atomic_sg'
>> arm-linux-gnueabi-ld: drivers/mtd/ubi/eba.c:775: undefined reference to `scsi_kmap_atomic_sg'
>> arm-linux-gnueabi-ld: drivers/mtd/ubi/eba.c:777: undefined reference to `scsi_kunmap_atomic_sg'


vim +775 drivers/mtd/ubi/eba.c

   733	
   734	/**
   735	 * ubi_eba_read_leb_sg - read data into a scatter gather list.
   736	 * @ubi: UBI device description object
   737	 * @vol: volume description object
   738	 * @lnum: logical eraseblock number
   739	 * @sgl: UBI scatter gather list to store the read data
   740	 * @offset: offset from where to read
   741	 * @len: how many bytes to read
   742	 * @check: data CRC check flag
   743	 *
   744	 * This function works exactly like ubi_eba_read_leb(). But instead of
   745	 * storing the read data into a buffer it writes to an UBI scatter gather
   746	 * list.
   747	 */
   748	int ubi_eba_read_leb_sg(struct ubi_device *ubi, struct ubi_volume *vol,
   749				struct ubi_sgl *sgl, int lnum, int offset, int len,
   750				int check)
   751	{
   752		size_t map_len, map_offset, cur_offset;
   753		int ret, to_read = len;
   754		char *bounce_buf;
   755	
   756		bounce_buf = vmalloc(to_read);
   757		if (!bounce_buf) {
   758			ret = -ENOMEM;
   759			goto out;
   760		}
   761	
   762		ret = ubi_eba_read_leb(ubi, vol, lnum, bounce_buf, offset, to_read, check);
   763		if (ret < 0)
   764			goto out;
   765	
   766		cur_offset = 0;
   767		while (to_read > 0) {
   768			unsigned long flags = 0;
   769			char *dst;
   770	
   771			map_len = to_read;
   772			map_offset = cur_offset + sgl->tot_offset;
   773	
   774			local_irq_save(flags);
 > 775			dst = scsi_kmap_atomic_sg(sgl->sg, sgl->len, &map_offset, &map_len);
   776			memcpy(dst + map_offset, bounce_buf + cur_offset, map_len);
 > 777			scsi_kunmap_atomic_sg(dst);
   778			local_irq_restore(flags);
   779	
   780			cur_offset += map_len;
   781			to_read -= map_len;
   782		}
   783	
   784		ret = 0;
   785	out:
   786		vfree(bounce_buf);
   787		return ret;
   788	}
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
