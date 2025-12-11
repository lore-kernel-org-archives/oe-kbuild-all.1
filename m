Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0145C21770B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765423713; cv=none; b=HELwDQ8IAAvzTODuKPQu9B2whuyx1F8Y7XHCpAPQ9o5aO/TRzMgUwuZIPjr794/aWqQqjDyjxDpti9jzdSbBUg1sSI1zbT21DbVLTpfA/7Gf1l2XoLqMcCCZnjD8MAEshsrxIFBJxrByxngX1qbZ5LsimGbTllNPsXjW+HtGpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765423713; c=relaxed/simple;
	bh=RXiny5Wr5/GDubDps8+98q+1Lid5WEq4ISr8EJL6+os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYaUaMMI0nCNTmbELuXUnuIBybc0MrQNqGCulWLxvf0Ub6QvxsyuCd04DValkY/m5eRlAM0ZMVfuDbPVIKWvxS5F6p/QilTseCVPpQuDgR3//lHBvAY8twq3lHZD380zeNHICLz20YoerE3ZQ/jM1wFCZvXNb92hUsfaTmISBHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNdkNSvV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNdkNSvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765423712; x=1796959712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXiny5Wr5/GDubDps8+98q+1Lid5WEq4ISr8EJL6+os=;
  b=WNdkNSvVBrnsvL0O5ASjq81EwJ+U1cLjeyYCZupXVtcA1bLirRll9U2P
   IIuWQzh4UOzpHfwqmAmriocoVJVftSNY96fkLhs0YkDjDbFfcm7tz4qw5
   9TSKPHJ+JtfLJGgS0wIVfXBnw17nJN7fORET2npm0CizwesAf5E5YvED8
   TBwMKjWkCNNbvqtp04QzYSr9MmjcM1U4pERKPyug8igGPUkQzsLe24gD0
   gzmmC4cxXl08NwQ1asO1z8vf+QnzdPXLykPKWQQketwxK9zbVMRvEAYLw
   RpGKeDYVDjx/pO1r0+FKIO1btP7EmNYqnJbenefMoQTS5/TVSh8fVL746
   Q==;
X-CSE-ConnectionGUID: h+Niq8ypRSm0lAhVRup6QA==
X-CSE-MsgGUID: IH+aIvvtTk+LcCpvpASBDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67288679"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67288679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:28:31 -0800
X-CSE-ConnectionGUID: nXznAk2lREGOBEN+6oerlA==
X-CSE-MsgGUID: F1BZ2IY0Tj2S+gxzNSZ2IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234104605"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 19:28:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXLv-0000000046R-45jC;
	Thu, 11 Dec 2025 03:28:27 +0000
Date: Thu, 11 Dec 2025 11:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] block/blk-ioinf.c:530:60: error: array
 has incomplete element type 'const struct blk_mq_debugfs_attr'
Message-ID: <202512111132.APojgRTS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 4192ef0b07762c6dabf617654df442fecffe8510 [3534/3534] blk-ioinf: add rqos/inflight/stat debufs interface
config: x86_64-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111132.APojgRTS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111132.APojgRTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111132.APojgRTS-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-ioinf.c:248:6: warning: no previous prototype for function 'ioinf_done' [-Wmissing-prototypes]
     248 | void ioinf_done(struct ioinf *inf, struct ioinf_rq_wait *rqw)
         |      ^
   block/blk-ioinf.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     248 | void ioinf_done(struct ioinf *inf, struct ioinf_rq_wait *rqw)
         | ^
         | static 
>> block/blk-ioinf.c:530:60: error: array has incomplete element type 'const struct blk_mq_debugfs_attr'
     530 | static const struct blk_mq_debugfs_attr ioinf_debugfs_attrs[] = {
         |                                                            ^
   block/blk-rq-qos.h:14:8: note: forward declaration of 'struct blk_mq_debugfs_attr'
      14 | struct blk_mq_debugfs_attr;
         |        ^
   block/blk-ioinf.c:547:5: warning: no previous prototype for function 'ioinf_calc_budget' [-Wmissing-prototypes]
     547 | u32 ioinf_calc_budget(struct ioinf_rq_wait *rqw)
         |     ^
   block/blk-ioinf.c:547:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     547 | u32 ioinf_calc_budget(struct ioinf_rq_wait *rqw)
         | ^
         | static 
   2 warnings and 1 error generated.


vim +530 block/blk-ioinf.c

   529	
 > 530	static const struct blk_mq_debugfs_attr ioinf_debugfs_attrs[] = {
   531		{"stat", 0400, ioinf_stat_show},
   532		{},
   533	};
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
