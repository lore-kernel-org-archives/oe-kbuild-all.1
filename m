Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0813B293
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 03:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725505654; cv=none; b=NEv5ijlMq+EhwTdcbXDFsXrpj5eEeZNYHl58GVSZ+SM/jm897IF1IPWr7yr5s85qSm4Tv52ruCEuxeuNNoxoN/8P9af+jPjTcJahI43gSXLPpqDIcSwXoBB0VJi/alkKMuqEH9oWzJufW+f/lNl7xpdj/i1HB/BJQl8p/aBghWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725505654; c=relaxed/simple;
	bh=dbUjRR00lyc7nH95/wNV5DAC/xcHzJ2Z/6P2VtTAvyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ms8G0ynP/kFUB5wm5Fc41mD2k+uL1CPpsc21P85/ZHW0MeI1Xkc6c/r8XseWFwNZLiyfQR0T2jd5po1ecCKRj1fLZKsGZbKGRpBqHlx+1esKXXrwdsr2ZFW3b6PQneyXmPSeZhGGf6iMcB20PCnUZSUHrG6uIaMQM2oKM1gPp9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItuHLx0E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItuHLx0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725505652; x=1757041652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbUjRR00lyc7nH95/wNV5DAC/xcHzJ2Z/6P2VtTAvyM=;
  b=ItuHLx0EeY6g3dv/ZF570yUlv/CcyPzoKRLjtMPf22SlVevrs8uUa+mm
   S2tnnRgJS59nU1FXY+gdq80AMhg5QM40QVfvYd/gFApQtJkcmNPIGIO/5
   KmkjHKBYYy3r5dA9tR45Mg+BqtDY1gNM/3djG35ePeQu62wg7VTxe5YBs
   stVJ3il9WFOkVhxeaCcOlTcrRoOm+7N/C7MCAU4b4NTLjXzNAvqojX3Sr
   i+PL/6gcSHIohLh66Y44vQxL8EnETZE5UUoJttmuZThqhOQb0nLXSO7Tg
   dDRsYksWCXqlz3TgMdppaxPbLXLFKZfAbxyU1fZk8coAYPaJlaU8ae/kL
   g==;
X-CSE-ConnectionGUID: y3H7jhQzQmW2jw74/ZGlkQ==
X-CSE-MsgGUID: awVP+cUoRHe0nqR61F6gBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35554691"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="35554691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 20:07:30 -0700
X-CSE-ConnectionGUID: khsdNiOBQV+eowNjm56E5w==
X-CSE-MsgGUID: esK0O9yySPyxR+Q8A0iEYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="66001296"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2024 20:07:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm2qE-0008qz-2m;
	Thu, 05 Sep 2024 03:07:26 +0000
Date: Thu, 5 Sep 2024 11:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 23675/23694]
 block/blk-io-hierarchy/iodump.c:571:7: warning: no previous prototype for
 function '__bio_stage_hierarchy_start'
Message-ID: <202409051155.tjBfzaXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bd317843995067c2f78bd884340fcd0a27acab8d
commit: ac91631e9ef7b530c02e40d10085072c08fb4a0a [23675/23694] blk-io-hierarchy: support new stage for bio lifetime
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240905/202409051155.tjBfzaXC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051155.tjBfzaXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051155.tjBfzaXC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-io-hierarchy/iodump.c:15:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-io-hierarchy/iodump.c:571:7: warning: no previous prototype for function '__bio_stage_hierarchy_start' [-Wmissing-prototypes]
     571 | void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
         |       ^
   block/blk-io-hierarchy/iodump.c:571:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     571 | void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
         | ^
         | static 
   2 warnings generated.


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
