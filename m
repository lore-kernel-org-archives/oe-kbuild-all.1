Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7884127470
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754518629; cv=none; b=Tcxp7FZNQhx9TvBojkh1xe5s2lPxIDtRNsR20goAao+aUf8z1M3HlYcWzh/Z7uUZIFNaoGP7elU0I8nxcTNJt7gWSAvj810vLI+GCdZBgu/sTA7qRrPxHiz9z3sXAV3h8iMFXgQv+eHK6ang9JChe+pq9f3HimT2gwA+cpHYuz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754518629; c=relaxed/simple;
	bh=OLLGkl7v/GntKsUgO1dpoauem9fix5440e5vm+xw2Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJfFzNVT1mvpjrat1tELv35ww3JIKDNsJqlbcRzuC70u6ZJB9AtFkdqYcp7tB5QnBKkLNSx2nikBMAaVbsRuR82uoUKTYKuZqUTcM2hsbrZ5fpGBsq0jwYl+WAyuBx7dkSF0HhyAiHphdrGcosYfZhGo77KwGJAUF9cKyH3kkuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0ugIIbA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0ugIIbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754518628; x=1786054628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLLGkl7v/GntKsUgO1dpoauem9fix5440e5vm+xw2Nk=;
  b=P0ugIIbA1VLgoB8S/G2Mf8srAs4CBcoPBQNuh4xao/Tbz5JX0iUEOJXV
   y15VSJ7GIsmg1ivUAvF8OIzoR1wSR8OkCUQIgfi/cDwvJFsJiTbz+J989
   XX254LVJ4mknCd/kfFYEafgVOr25poWYlsdlhvyK5Mb2BTDdP1+OGYS6K
   xcNt13cmmb6bE7eC1GdPvUr+rg1z9jvE8f4Qrisp5tHIv3HsUMTYPoOUY
   XJxOHFsTkokCZzhKBmOpbnrBEyg9CHn0AQW3PWO2XFkNoHrnV8yluBXfR
   cFZgaU/oLU75Wua1mi+TiSWqqMXDD41kK0TkI7plPI6FwTOEKu6yhFFna
   Q==;
X-CSE-ConnectionGUID: YFTPgGs/RmqCV9asKTGLoA==
X-CSE-MsgGUID: NeGc0KqXQB2tV4oG0Hmxeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56927615"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56927615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 15:17:07 -0700
X-CSE-ConnectionGUID: HOOjaaEtQ+Cvy5TzWrOCjg==
X-CSE-MsgGUID: fMO3c3JoTZK1GwsosIIkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="188560103"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2025 15:17:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujmRP-00029S-07;
	Wed, 06 Aug 2025 22:17:00 +0000
Date: Thu, 7 Aug 2025 06:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753]
 block/blk-io-hierarchy/iodump.c:571:7: warning: no previous prototype for
 '__bio_stage_hierarchy_start'
Message-ID: <202508070635.5wrIFk3h-lkp@intel.com>
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
head:   464c0bf980f96a307759f809825ab0a3b59f8b70
commit: ac91631e9ef7b530c02e40d10085072c08fb4a0a [1753/1753] blk-io-hierarchy: support new stage for bio lifetime
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250807/202508070635.5wrIFk3h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070635.5wrIFk3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070635.5wrIFk3h-lkp@intel.com/

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
