Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CBA199E9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371512; cv=none; b=pqHTsPGIDV3UbfwQe6hQ+2CMi3ms2I+hlsV6zktKHiOWT/Vm7cf67UxVoQ3ei2UEWXTv87yT/ptSnw/muXm3sOlBnWTpj8xptYO2DCviLKVlx6N+SVjya8K9l3YzH7380mbYKc6DjOjiBPstzIHWmOuVTdTNMTuQSVxCNVos0no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371512; c=relaxed/simple;
	bh=hoVQzluCFIotM5msvnAMMkjDKf+k4QIgjsr0/PSw7rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QmrrS/j3RzE2+rFrD2ffhU1JF5SogEXWIlT2zKrgLKuIuXpiXYYE6Gy775fZGNYZEDYi4ZUMhOQ4KQ0Jfsh2JQySxG8aiH/+eDngbLZZl1ROdLf+ehFgDETQCmVJq6EigJYRdcH/OipLK567UpBL1SYGUL1jDWk2NXkMpNS/e4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oz/NtzDt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oz/NtzDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730371510; x=1761907510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoVQzluCFIotM5msvnAMMkjDKf+k4QIgjsr0/PSw7rs=;
  b=Oz/NtzDtHI92e8WdI4rHHb5fJkSXWv7nr2U3aVGhfP2BOej9EtSgBKrC
   shbB1LGIyVbV/PouoXBizLqoivvPhinFDgpL+QnW5URqBEl4fIwseM5bO
   8zBO4qN2qhOMaV64750aV6jjMlOGu1XpHvwntwZmZNyCS+ZSmoY5QU8gS
   ScSHP1PEjrNCRcR3SVlKQOssQIYYEoprsG4OjAChCngakiOv/zwHQp+NT
   /2n/28qhskK3t6aJcEaIT+MGBl885Cx8bprHID9nAArGYKppRzP9GBDyJ
   0/GRESD7ohH8Ne3HN1miylXQxGqqePsqlmPIzXSAoPKM8JhUcHj7eNzCA
   g==;
X-CSE-ConnectionGUID: PCDVY2lWR5+HyUekVO9rgA==
X-CSE-MsgGUID: 6uFb/Lu1QbmIarbthNp+bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="34032485"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="34032485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:45:10 -0700
X-CSE-ConnectionGUID: U9W1bb7BSpaJ2A6lA5yJ3g==
X-CSE-MsgGUID: EhHeCSdURjyOumsFg1RS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113442027"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 03:45:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Sfq-000fzZ-2S;
	Thu, 31 Oct 2024 10:45:06 +0000
Date: Thu, 31 Oct 2024 18:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 73/78]
 drivers/md/dm-verity-chromeos.c:418:26: error: passing argument 2 of
 'blkdev_put' makes pointer from integer without a cast
Message-ID: <202410311812.HMFtgq71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c177bfa506750a08f31510adc2d3aa8ceec0f6c4
commit: 1963b113a7341f89f48813b72c9d9022970e0560 [73/78] CHROMIUM: dm-verity: use GPT try counter for integrity retries
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241031/202410311812.HMFtgq71-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311812.HMFtgq71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311812.HMFtgq71-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/dm-verity-chromeos.c: In function 'chromeos_handle_retries':
>> drivers/md/dm-verity-chromeos.c:418:26: error: passing argument 2 of 'blkdev_put' makes pointer from integer without a cast [-Wint-conversion]
     418 |         blkdev_put(bdev, dev_mode);
         |                          ^~~~~~~~
         |                          |
         |                          fmode_t {aka unsigned int}
   In file included from drivers/md/dm-verity-chromeos.c:20:
   include/linux/blkdev.h:1511:50: note: expected 'void *' but argument is of type 'fmode_t' {aka 'unsigned int'}
    1511 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                            ~~~~~~^~~~~~
   drivers/md/dm-verity-chromeos.c:445:34: error: passing argument 2 of 'blkdev_put' makes pointer from integer without a cast [-Wint-conversion]
     445 |                 blkdev_put(bdev, dev_mode);
         |                                  ^~~~~~~~
         |                                  |
         |                                  fmode_t {aka unsigned int}
   include/linux/blkdev.h:1511:50: note: expected 'void *' but argument is of type 'fmode_t' {aka 'unsigned int'}
    1511 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                            ~~~~~~^~~~~~
   In file included from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from drivers/md/dm-verity-chromeos.c:19:
   drivers/md/dm-verity-chromeos.c: In function 'chromeos_update_tries':
>> include/linux/fs.h:111:33: error: passing argument 2 of 'blkdev_put' makes pointer from integer without a cast [-Wint-conversion]
     111 | #define FMODE_READ              ((__force fmode_t)0x1)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   drivers/md/dm-verity-chromeos.c:481:33: note: in expansion of macro 'FMODE_READ'
     481 |         blkdev_put(kernel_bdev, FMODE_READ);
         |                                 ^~~~~~~~~~
   include/linux/blkdev.h:1511:50: note: expected 'void *' but argument is of type 'unsigned int'
    1511 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                            ~~~~~~^~~~~~


vim +/blkdev_put +418 drivers/md/dm-verity-chromeos.c

   373	
   374	static int chromeos_handle_retries(struct bio *bio,
   375					   dev_t devt,
   376					   u8 active_gpt_entry_id,
   377					   sector_t hdr_lba,
   378					   struct page *hdr_page,
   379					   struct page *tbl_pages)
   380	{
   381		struct block_device *bdev;
   382		fmode_t dev_mode = 0;
   383		int ret = 0;
   384	
   385		dev_mode = FMODE_READ;
   386		bdev = blkdev_get_by_dev(devt, dev_mode,
   387					 chromeos_handle_retries, NULL);
   388		if (IS_ERR(bdev)) {
   389			DMERR("update_tries: could not open device for reading: %ld",
   390			      PTR_ERR(bdev));
   391			dev_mode = 0;
   392			ret = -1;
   393			goto failed;
   394		}
   395	
   396		/*
   397		 * Request read operation with REQ_PREFLUSH flag to ensure that the
   398		 * cache of non-volatile storage device has been flushed before read is
   399		 * started.
   400		 */
   401		if (chromeos_gpt_io_submit(bio, bdev, REQ_OP_READ,
   402					   REQ_SYNC | REQ_PREFLUSH, hdr_lba,
   403					   hdr_page, tbl_pages)) {
   404			DMERR("update_tries: failed reading %s GPT",
   405			      hdr_lba == 1 ? "primary" : "secondary");
   406			ret = -1;
   407			goto failed;
   408		}
   409	
   410		if (chromeos_increment_gpt_err_count(hdr_page, tbl_pages,
   411						     active_gpt_entry_id)) {
   412			DMERR("update_tries: retries exceeded");
   413			ret = -1;
   414			goto failed;
   415		}
   416	
   417		/* The block dev was being changed on read. Let's reopen here. */
 > 418		blkdev_put(bdev, dev_mode);
   419		dev_mode = FMODE_WRITE;
   420		bdev = blkdev_get_by_dev(devt, dev_mode,
   421					 chromeos_handle_retries, NULL);
   422		if (IS_ERR(bdev)) {
   423			DMERR("update_tries: could not open device for writing");
   424			dev_mode = 0;
   425			ret = -1;
   426			goto failed;
   427		}
   428	
   429		/*
   430		 * Request write operation with REQ_FUA flag to ensure that I/O
   431		 * completion for the write is signaled only after the data has been
   432		 * committed to non-volatile storage.
   433		 */
   434		if (chromeos_gpt_io_submit(bio, bdev, REQ_OP_WRITE,
   435					   REQ_SYNC | REQ_FUA, hdr_lba,
   436					   hdr_page, tbl_pages)) {
   437			DMERR("update_tries: failed writing %s GPT",
   438			      hdr_lba == 1 ? "primary" : "secondary");
   439			ret = -1;
   440			goto failed;
   441		}
   442	
   443	failed:
   444		if (dev_mode)
   445			blkdev_put(bdev, dev_mode);
   446	
   447		if (!ret)
   448			DMERR("update_tries: updated %s GPT",
   449			      hdr_lba == 1 ? "primary" : "secondary");
   450	
   451		return ret;
   452	}
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
