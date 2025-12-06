Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B06B1514DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765042915; cv=none; b=MSigQHdEmolN4d04lI8arPxH6P2E/V/KLuiaFutACEumRwON5oSdo2vgLIMMuDzGadpfiZT6dh6ebsnarYih/ogIHj/RSsWk1+B1mha9OOwSddkdpOmLCVowzMLus2igUbnUVHiP9rjHCSj4z0dHAeTbyT03yjf8zKKz4a3ZcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765042915; c=relaxed/simple;
	bh=JaL8jVE6yYAQ7MVL6iqueV2HAndeovgsPUnxat/+aQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YxmKDnlOZ1ZaZX4a7OZRAkjz9BEECfLXTjlUWHzx354zjSQLy/xlOqEe4KXSzJ+dlAw5B1hPA9YTXOHtu+YQ0ycJnkbZk8WQt0JBAw5j8E6CNzpjPR3425x6yOjPC/aM9Mc5dwJUsn7WfatAxc+A6gnllhWhTTVDBgxfSKlhajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwFNRX+O; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwFNRX+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765042912; x=1796578912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JaL8jVE6yYAQ7MVL6iqueV2HAndeovgsPUnxat/+aQI=;
  b=dwFNRX+OQX4nYfX+s+fsDdXU+X+m3+YWhMnNt+F1m7h8XdVDHLCIXpXT
   KCcpfwQ/TW+dCQBYWMzwd/iwTNwPnG3BTJlWGhtKug7GXemKH+/t2InIs
   29g5WsgC2CwDlbUCtAQ9ffRJNs9C2ljZ3qo2vWMPFqMq97IgvX9gJAAsb
   7zMm13nw5EC9BJQIzsUB5Wu/7ZvFeLY/IfWGpZfgN2MA5MGOteVwrjHwM
   IO034/VzqE7lr7qAboFUhGrYSEI5cOEtv/FxvOP2orfuEkfslQBtToOOk
   WYTTsxwTuXGJvMMmXLsJ/UaNAh25ukWx9g1hOq8z3SLI0Ryt6Spt2/KtG
   A==;
X-CSE-ConnectionGUID: SdxFk+8iR0ihevgb6taZQA==
X-CSE-MsgGUID: QE4IuwqFQOCWVZ1/jtrpLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67128109"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67128109"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 09:41:52 -0800
X-CSE-ConnectionGUID: 9DJfSjC2TuWsnTI3bv3eSg==
X-CSE-MsgGUID: sbtJXC2AQRago0QQRXsCeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="194854920"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Dec 2025 09:41:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRwI0-00000000IdR-0tTC;
	Sat, 06 Dec 2025 17:41:48 +0000
Date: Sun, 7 Dec 2025 01:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1939/1939]
 block/blk-io-hierarchy/iodump.c:571:7: warning: no previous prototype for
 '__bio_stage_hierarchy_start'
Message-ID: <202512070135.dz9cuKSc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5bd996476c86f9b6d2039f9ab662f38d64fa6c70
commit: ac91631e9ef7b530c02e40d10085072c08fb4a0a [1939/1939] blk-io-hierarchy: support new stage for bio lifetime
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251207/202512070135.dz9cuKSc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070135.dz9cuKSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070135.dz9cuKSc-lkp@intel.com/

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
