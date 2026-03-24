Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79CF3A4535
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357516; cv=none; b=mhErCFce3MpRJjlu2nEnv12mBv9MhXCJsH6p9HRMCY+JCxiQjq4OiAxjnCGENXq79OFVBj1Vg+OwF+QwQHgAFGj7pwqYSr6mbhBMVoB4cn4ErJO9QcTUQ4ieCBXbWSVW515NsmPI8cxTLKxD8/W9bUn8nSClX9WiGe3Chlgyouw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357516; c=relaxed/simple;
	bh=/LiWKgLeatosusPXHRguNH3kdrEQrVnXP1FgUZhi3dA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZEDKXba+U/gBrST127ki+EdN2n6BEitEkRZ0mHEgwP2R9FKF2AhEb//si5ncFewrLDxXlPlb3Nu3RZ5/wNBxCqp3jzSLVFPZhwlalBxzEr4sbALBYTU3zKLRcHRaFYyeOjTQbIU9TuyVjL8k4ejg0Kf55Y6nGS8UeZ8/OW13oUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnaQWwak; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnaQWwak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774357514; x=1805893514;
  h=date:from:to:cc:subject:message-id;
  bh=/LiWKgLeatosusPXHRguNH3kdrEQrVnXP1FgUZhi3dA=;
  b=QnaQWwak7HClMa4+2Beu0xHTNqze7SSVAG3zNUUsRg5vZyaz6TkT2+sT
   osVLW61lm742UCU8ku2EP41olLK7F9SfFTiWrqlY5pBsFQJB8wYDFshgs
   B8awle+Fpi7fJS8Y+iRXBaglFyYqB4D+SFtc8G5NdjrPk/womEydM3J0O
   Yaog/4XVk7sP5dQBZeZzT8jnZWzab/vAWxxXMS+gdSzad1JIo8mJ2CGwA
   qubO4lQ0cyu9QtyWOLTp32sWfIGH/0rgQDnupH9eoqFHBWokxj9mmbFxS
   M+AeS3z0DNnjDC4EuOtLOeSv6YTFo66G3BJAasRTuxbWL+p0+E7XBGHw5
   A==;
X-CSE-ConnectionGUID: +ZbjqcSDT8a/Orpr5anlug==
X-CSE-MsgGUID: y+5xgULISAyYd3EOr7n+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="77975395"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77975395"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:05:14 -0700
X-CSE-ConnectionGUID: 9ZocoLI/TUKjCfe7PAk9cA==
X-CSE-MsgGUID: bTmbGSwXQSq7Y0tEW1+zTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229095425"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2026 06:05:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51RV-000000004af-2B1V;
	Tue, 24 Mar 2026 13:05:09 +0000
Date: Tue, 24 Mar 2026 21:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1]
 kernel/trace/blktrace.c:1087: warning: Excess function parameter 'q'
 description in 'blk_add_trace_rq_remap'
Message-ID: <202603242045.7cu4JkBx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   6bf9814ea94a96f4806f072609acf66d43ffef39
commit: 1cb3032406423b25aa984854b4d78e0100d292dd [0/1] block: remove the request_queue to argument request based tracepoints
config: x86_64-randconfig-014-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242045.7cu4JkBx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242045.7cu4JkBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242045.7cu4JkBx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/blktrace.c:1087: warning: Excess function parameter 'q' description in 'blk_add_trace_rq_remap'


vim +1087 kernel/trace/blktrace.c

5f3ea37c7716db block/blktrace.c        Arnaldo Carvalho de Melo 2008-10-30  1071  
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1072  /**
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1073   * blk_add_trace_rq_remap - Add a trace for a request-remap operation
546cf44a1b507c kernel/trace/blktrace.c Randy Dunlap             2010-05-29  1074   * @ignore:	trace callback data parameter (not used)
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1075   * @q:		queue the io is for
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1076   * @rq:		the source request
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1077   * @dev:	target device
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1078   * @from:	source sector
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1079   *
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1080   * Description:
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1081   *     Device mapper remaps request to other devices.
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1082   *     Add a trace for that action.
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1083   *
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1084   **/
1cb3032406423b kernel/trace/blktrace.c Christoph Hellwig        2020-12-03  1085  static void blk_add_trace_rq_remap(void *ignore, struct request *rq, dev_t dev,
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1086  				   sector_t from)
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01 @1087  {
c780e86dd48ef6 kernel/trace/blktrace.c Jan Kara                 2020-02-06  1088  	struct blk_trace *bt;
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1089  	struct blk_io_trace_remap r;
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1090  
c780e86dd48ef6 kernel/trace/blktrace.c Jan Kara                 2020-02-06  1091  	rcu_read_lock();
1cb3032406423b kernel/trace/blktrace.c Christoph Hellwig        2020-12-03  1092  	bt = rcu_dereference(rq->q->blk_trace);
c780e86dd48ef6 kernel/trace/blktrace.c Jan Kara                 2020-02-06  1093  	if (likely(!bt)) {
c780e86dd48ef6 kernel/trace/blktrace.c Jan Kara                 2020-02-06  1094  		rcu_read_unlock();
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1095  		return;
c780e86dd48ef6 kernel/trace/blktrace.c Jan Kara                 2020-02-06  1096  	}
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1097  
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1098  	r.device_from = cpu_to_be32(dev);
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1099  	r.device_to   = cpu_to_be32(disk_devt(rq->rq_disk));
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1100  	r.sector_from = cpu_to_be64(from);
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1101  
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1102  	__blk_add_trace(bt, blk_rq_pos(rq), blk_rq_bytes(rq),
caf7df12272118 kernel/trace/blktrace.c Christoph Hellwig        2017-04-20  1103  			rq_data_dir(rq), 0, BLK_TA_REMAP, 0,
1cb3032406423b kernel/trace/blktrace.c Christoph Hellwig        2020-12-03  1104  			sizeof(r), &r, blk_trace_request_get_cgid(rq));
c780e86dd48ef6 kernel/trace/blktrace.c Jan Kara                 2020-02-06  1105  	rcu_read_unlock();
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1106  }
b0da3f0dada788 kernel/trace/blktrace.c Jun'ichi Nomura          2009-10-01  1107  

:::::: The code at line 1087 was first introduced by commit
:::::: b0da3f0dada78832c9da03ad2152ae76bd9a2496 Add a tracepoint for block request remapping

:::::: TO: Jun'ichi Nomura <j-nomura@ce.jp.nec.com>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
