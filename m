Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444285;
	b=hadniUwxgfKmEZzLgzGNU1uCPr5dQZpdaUxLRr9i0b7am6IGpHyOy+aj4em9RUclmpr7
	 uUndbKbpmfM7BXWJz5pYeZJ7hffQm1lzyPV8wFyKJT7rj9dvlHeuJ8ElGtTtFFOpfpE6i
	 y87LAiQDamCSymmSd4yBiejmK1rcivtEzweoIFuGElG6dLaiCTdA89XX2Ka0H/31/7WeZ
	 4jRMGdTQdsbwfxtQWM3BMntSayy+zCKhRPPTJZpJL2YwnNbdQ+QmDrBU/Auv8YWxpO7bd
	 aNeCtKywK8I6wk5yEgMNGNwVqh9LG7feWBFUGGhbFqeZVmR13odr1DsWnfvZwvUrJXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444285;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6pIzCALUONPlUeZ6VorOuOywCtIrue97Ba3Fr6uPUxs=;
	b=Z3IM5JV+O/rtRpdZ+xr+7HyWvS9nPD1ZFVjyqv0J1E4w+uJtW6qKMyFsXe1EnJ7F2b3p
	 xGzzMavTlpoC5FAIow1E/jH3wYsn/1GzbHP2aHpS3X1HK9Npwem8llO+tnmK7ZmDZZLUc
	 oyn2+2m6ux96nYsrL4sl6dpr3cRd8cgluhft7OW2onpTROA0L/tQ3fMRpE3CxVN0onnXR
	 pR5wSup3688+6sDktAZYwrUiYgPS095pPElBkoMT5MzDy9TH6cw0pGEtce0x0UjgbO/XS
	 xBYgX0Ca3aYYsi78hnfTaNAG+Atd4ljwrCaIhbL2Wq67tyan1HacPMh+Kl7v0IkFcOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HKt5h3uU;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120F8606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 21:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 120F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HKt5h3uU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792444285; x=1823980285;
  h=date:from:to:cc:subject:message-id;
  bh=k4cb2hMG/dwpT9VtNKAIxokVg0H2RcC3bK4qf1buphI=;
  b=HKt5h3uUlG1CofMqqARCWgBPHOsdHXl/a5jNT0wqBbxuvVXUxg1lujZ8
   foc+SxalsY0rkr16pkMWPrSgD7ZqABQ9N8Etf8GZtg+NReVEQdsYIh23K
   A5NYJZLlBPD294jTDXe1GLDZaMVCtlD7ItHxDp0bu47ubCziHxyd6ss+F
   Du/yQSf9aAfHG0nj9vQ2ooZUhta1sAS3cViHiSYov5fk70mw1bJMjX1du
   gKox1hSq1JSHHMTNxCN+G4qH/U6pw7c9C9BvsmBqbdQkMrLklc9D5N2UJ
   8s5GY5yegGPcRyJVXeJ3OJW41IlfqN3ve9iF106BcMf63abNN491Wao6A
   g==;
X-CSE-ConnectionGUID: sngOVe2yTayPCo/5CWDJTg==
X-CSE-MsgGUID: NtVLUDtuSL2hK6bpVrDSLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1158722"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1158722"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 14:11:24 -0700
X-CSE-ConnectionGUID: FlFDtughSK+nDy0jGy3q5Q==
X-CSE-MsgGUID: 8M5CzczBTBaBnar0DM1IbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3000646"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Oct 2026 14:11:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIudc-00000000MQw-0G6Z;
	Mon, 19 Oct 2026 21:11:20 +0000
Date: Tue, 20 Oct 2026 05:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct
 rq_list'
Message-ID: <202610200552.S1KXbPpH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   49f96790cc7636a02b5b36d2f486a318b80031f2
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [0/2] UPSTREAM: block: add a rq_list type
config: i386-buildonly-randconfig-1003-20261020 (https://download.01.org/0day-ci/archive/20261020/202610200552.S1KXbPpH-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200552.S1KXbPpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200552.S1KXbPpH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1699:17: error: field has incomplete type 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                        ^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:239:11: error: incomplete definition of type 'const struct rq_list'
     239 |         return rl->head == NULL;
         |                ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
>> include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
     244 |         rl->head = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
     245 |         rl->tail = NULL;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
     251 |         if (rl->tail)
         |             ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
     252 |                 rl->tail->rq_next = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
     254 |                 rl->head = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
     255 |         rl->tail = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
     260 |         rq->rq_next = rl->head;
         |                       ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
     261 |         rl->head = rq;
         |         ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
     262 |         if (!rl->tail)
         |              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
     263 |                 rl->tail = rq;
         |                 ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
     268 |         struct request *rq = rl->head;
         |                              ~~^
   include/linux/blkdev.h:1699:9: note: forward declaration of 'struct rq_list'
    1699 |         struct rq_list req_list;
         |                ^
   In file included from drivers/pnp/resource.c:20:
   In file included from include/linux/libata.h:21:
   In file included from include/scsi/scsi_host.h:11:
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;


vim +1699 include/linux/blkdev.h

  1697	
  1698	struct io_comp_batch {
> 1699		struct rq_list req_list;
  1700		bool need_ts;
  1701		void (*complete)(struct io_comp_batch *);
  1702	};
  1703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
