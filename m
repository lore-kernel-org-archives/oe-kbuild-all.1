Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9AF38DE0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736470824; cv=none; b=SYmcgaDjrVFdOB/3Pu7iDXXNl5uN3YvSKCjtnX5JlXpq+Z5OIVo95r9EBFS2TMoDI2CgJHOpDWlVNG3S++nnBTqueDGKx0kjHCZkMMobLUge7d6hDQShse2754N1PTSNeZACtuJGUcLsG9Cih4U5nV73eChRrnG33aJDZzqzOLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736470824; c=relaxed/simple;
	bh=Mtlz8q5qjjhAmy0K+Gam+N84pVqKs57GIfmRQOhDxyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jvs+4dPo4Pxc4JiRfyuhBDJ+d5lP30Ax2+0qdI4EOhkICTtQETNBHJYByn5qneOMXdlc/yXOxyBdqlAejqr5dUIq/gQdmlnLyedlUfurd7wHIWBhX21vMtiINJXOaFKzXWS21ufF7hSwydp0k8Ves30HBtBFDtf8kEJ7MAksJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFGPh2Gp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFGPh2Gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736470823; x=1768006823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mtlz8q5qjjhAmy0K+Gam+N84pVqKs57GIfmRQOhDxyg=;
  b=JFGPh2GpH41ko4fojNA62jJcRIa7qcE/wOt3iFdcJKI3cxYIXIoUx1Rd
   PlK+SVqpdWKAj+HAsKuc5QR7DhY1FtShA2PNrpm5vpiJZC0wnSYYSgdlG
   CTgohqudJ5zzkW/4PiqKJPvrMOZVBG1iGLpJhNog0YCf5gCdEXkJAR8Jp
   BWBQYBwEAr+Q7uTBq4uqo9Qhws2lKoFrJGVTgyU9RWtrCIPECWbDytu02
   KqjiILaPXhX8+0wVjF8D4IoyeLzkKUi2nouslLQ/3jw+bqLm47yenXdNT
   QJzciyxnIAiua4xlXXj0ZcLmRdexl0zwfrEHFEO6ANPFK5wx0fm6ac0um
   g==;
X-CSE-ConnectionGUID: uxFCsfJuQkWFTLQ4CxcR7Q==
X-CSE-MsgGUID: PUAjCKWLSsGAFKz9ZWFZOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54299966"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="54299966"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 17:00:22 -0800
X-CSE-ConnectionGUID: ILbMzveyTS+6P/LH8ul0aA==
X-CSE-MsgGUID: wjPluLnAQHeWyXdk4hPG2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104102435"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2025 17:00:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW3Nq-000IM6-2F;
	Fri, 10 Jan 2025 01:00:18 +0000
Date: Fri, 10 Jan 2025 09:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402]
 block/blk-io-hierarchy/iodump.c:571:7: warning: no previous prototype for
 '__bio_stage_hierarchy_start'
Message-ID: <202501100811.yzRNoGB1-lkp@intel.com>
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
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: ac91631e9ef7b530c02e40d10085072c08fb4a0a [1402/1402] blk-io-hierarchy: support new stage for bio lifetime
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501100811.yzRNoGB1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100811.yzRNoGB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100811.yzRNoGB1-lkp@intel.com/

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
