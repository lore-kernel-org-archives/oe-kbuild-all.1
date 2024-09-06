Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E14B1D04A4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634412; cv=none; b=d9869CELhc3hdBKDDRkEwxtWBgZ1qo5ioL4eIiJ82it16Xec9hj2G+36oS4dsZu/t0/GhxBZsEohPXfCaxkpGf6Zm//Npfu/jR1WoREdJaIQwA+lJWZGYBnLLZEHoMPuuIp66qkkG6nQHrJadTO0Uyc8EVJMVYilO30Awhxaxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634412; c=relaxed/simple;
	bh=HKWIgQv8HqWYd5RDlOgeqG7IXjwQSPaVcs5JOvIqNPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWKvVkdpC4hoqauSH783Rfo5iXaf9lhzg2PJPP/oNpFh3tu0sZFxcxgTZIHSi9hi7f8XQpW/2XKXge7HwZKyzNB/jrCcktguIRymNV+Chobv9kUSS4qil4XpCDpC/8AWWuCl73kp9q+SJXVhi5GXM7am7GIdx8y5lawdhvWXMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WadhTEMX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WadhTEMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725634409; x=1757170409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HKWIgQv8HqWYd5RDlOgeqG7IXjwQSPaVcs5JOvIqNPQ=;
  b=WadhTEMXKedDAum/v+RHKjn8VaD/eij89ODoBlbgfj537CQrX4bZu00R
   BQEe54ZC5AsNU3NtcKbsRi5VqbbzV1wdtxySqmKkO95TK/fhHRpMxPPJZ
   t2Rw43svQQ6gjm+vfxulhc8MjpUqEvm082DuKi5YsG2ejxGG4+wEERQTi
   mwgZhGyLaqWvHXsMlOnwGZjPRBOSNplGbYhmyyUO8KQgdxJKRmyxrqErB
   6O+BRYslqupKiaVquVdSMmC13/rqpm2LTXfpmlJA9SX61U2X/fVirbvCd
   37fyDKmIBVoaTk+cYL1W/2ezT11TtDl43HA8Ob4wzj5xrMlmx0NXJogqK
   A==;
X-CSE-ConnectionGUID: fERwhpbRSj2cEXjqmIa92w==
X-CSE-MsgGUID: 69+xrAgrQBWT8jgJVamrzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23900359"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="23900359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 07:53:29 -0700
X-CSE-ConnectionGUID: qaZVZ49MTFWtd86xWeZHwA==
X-CSE-MsgGUID: ZPqBFTTBQQeZkCaydsFNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="65952825"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2024 07:53:27 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smaKz-000BNu-0H;
	Fri, 06 Sep 2024 14:53:25 +0000
Date: Fri, 6 Sep 2024 22:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 23675/23701]
 block/blk-io-hierarchy/iodump.c:571:7: warning: no previous prototype for
 '__bio_stage_hierarchy_start'
Message-ID: <202409062219.DDwu0HG6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   13b424f97ef548612c760cfd0892f96de96707e0
commit: ac91631e9ef7b530c02e40d10085072c08fb4a0a [23675/23701] blk-io-hierarchy: support new stage for bio lifetime
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240906/202409062219.DDwu0HG6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409062219.DDwu0HG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062219.DDwu0HG6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-io-hierarchy/iodump.c:571:7: warning: no previous prototype for '__bio_stage_hierarchy_start' [-Wmissing-prototypes]
     571 | void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/arm64/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:81,
                    from include/linux/spinlock.h:51,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/seq_file.h:11,
                    from block/blk-io-hierarchy/iodump.c:14:
   In function 'check_object_size',
       inlined from 'check_copy_size' at include/linux/thread_info.h:90:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:143:6,
       inlined from 'threshold_store' at block/blk-io-hierarchy/iodump.c:273:6:
   include/linux/thread_info.h:59:17: warning: 'b' may be used uninitialized [-Wmaybe-uninitialized]
      59 |                 __check_object_size(ptr, n, to_user);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'threshold_store':
   include/linux/thread_info.h:52:13: note: by argument 1 of type 'const void *' to '__check_object_size' declared here
      52 | extern void __check_object_size(const void *ptr, unsigned long n,
         |             ^~~~~~~~~~~~~~~~~~~
   block/blk-io-hierarchy/iodump.c:267:14: note: 'b' declared here
     267 |         char b[MAX_BUF_LEN + 1];
         |              ^


vim +/__bio_stage_hierarchy_start +571 block/blk-io-hierarchy/iodump.c

   570	
 > 571	void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
   572					 loff_t *pos)
   573	{
   574		struct pos_data *pdata = &bstage_ddata->pdata;
   575		struct rq_dump_data *rq_ddata = &bstage_ddata->rq_ddata;
   576	
   577	retry:
   578		if (stage_is_bio(pdata->stage)) {
   579			struct list_head *list;
   580			struct bio_dump_data *bio_ddata =
   581				get_bio_stage_ddata(rq_ddata->q, pdata->stage);
   582	
   583			if (!bio_ddata) {
   584				bio_stage_start_next_stage(bstage_ddata, pos);
   585				goto retry;
   586			}
   587	
   588			spin_lock_irq(&bio_ddata->lock);
   589			list = seq_list_start(&bio_ddata->head, pdata->count);
   590			if (list)
   591				return list;
   592	
   593			spin_unlock_irq(&bio_ddata->lock);
   594			bio_stage_start_next_stage(bstage_ddata, pos);
   595			goto retry;
   596		}
   597	
   598		if (pdata->stage == STAGE_BIO &&
   599		    __rq_hierarchy_start(rq_ddata, pdata->count))
   600			return bstage_ddata;
   601	
   602		return NULL;
   603	}
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
