Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF5E39A7F6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948543; cv=none; b=djeFXXluIx4Wl02DhS/hg8f6jrYmg/Ggn6tYz8blK5zW4b6yainMs0F2oxdMRAeUcTe+0dSdQ06FLGdFYDNGkmki1BEpmO40ESDUXAZS4Tw51fRKNn5elp1PhC7o4tREvi7S2Lo9yAbLJnJhr62nz+DBn8pHa5daP1RmwMHDCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948543; c=relaxed/simple;
	bh=wM71TWaG6SXmSwKACf2H7BLclYTBm+/ZDLUVjHawQi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D0QeiZAlbfyZqHtaNja6O9VcgvH0YBZoGD99PcyvZ985xHQMDiFXPSWWdmQ3DDO/00i+Mlp466wogOjh8meNaWCWi+6iuONM9xJvBSnKI80+6PnJIZdPVaIkj9ZO9fPmqlLhw9HiQru6vZ5yq3XEFivnXGWl1kcWUuz6m7HqTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqbLLxx4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqbLLxx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782948540; x=1814484540;
  h=date:from:to:cc:subject:message-id;
  bh=wM71TWaG6SXmSwKACf2H7BLclYTBm+/ZDLUVjHawQi8=;
  b=RqbLLxx4Tgpm1pOXquDdIHy4EVr/7PXUz011fznB+q2ny0LgFfX+61Mw
   gqkW1IifP/jN1r0yKshDFCKuzCRznqrL16cNj06bkGeUOtprBM0//tHmv
   nb3Bk7vjPismKN6Bp3KbWQD+o2IGBFUeOc86pxE9C6PdDFXZBQAGaKbLQ
   VimdfD6k0HigXq+6pi4MLSRkgxY4VSgiuquMZxOg+suRqsVC+MS5DHpdt
   WfJblicILapDlAagvhCmB5SgpEl4zgLWnjRTQBo+vSJMdUhbYmOFMTWaK
   KA1C6nRnmR/byovn9DOM9x6uZ1MdZfsbfCDcA1BWLtJWT+56YNrCgfJv9
   Q==;
X-CSE-ConnectionGUID: 7r5BtRfiTOW3w6aIj6Fhyg==
X-CSE-MsgGUID: qWk80+1ESBWQsczjlb3a3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87373665"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="87373665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 16:28:50 -0700
X-CSE-ConnectionGUID: GcOmqa46RNGocD/SIEBrKw==
X-CSE-MsgGUID: Uxm0fqgCRS2gQTfFrCdBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282766895"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Jul 2026 16:28:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf4MH-000000009iF-3gop;
	Wed, 01 Jul 2026 23:28:45 +0000
Date: Thu, 02 Jul 2026 07:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 4/13]
 include/trace/events/block_iobuf.h:41:1: sparse: sparse: cast to restricted
 gfp_t
Message-ID: <202607020739.pqPu3n2S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: a808a1089c70f26044745b471dc7174f9b32a415 [4/13] block: add iobuf_pool pointer and limits_gen to request_queue
config: i386-randconfig-063-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020739.pqPu3n2S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020739.pqPu3n2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020739.pqPu3n2S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-iobuf.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/block_iobuf.h):
>> include/trace/events/block_iobuf.h:41:1: sparse: sparse: cast to restricted gfp_t
>> include/trace/events/block_iobuf.h:41:1: sparse: sparse: restricted gfp_t degrades to integer
>> include/trace/events/block_iobuf.h:41:1: sparse: sparse: restricted gfp_t degrades to integer

vim +41 include/trace/events/block_iobuf.h

bfd875145ed055 Luis Chamberlain 2026-06-29  40  
bfd875145ed055 Luis Chamberlain 2026-06-29 @41  TRACE_EVENT(block_iobuf_alloc,
bfd875145ed055 Luis Chamberlain 2026-06-29  42  
bfd875145ed055 Luis Chamberlain 2026-06-29  43  	TP_PROTO(struct request_queue *q, unsigned int order,
bfd875145ed055 Luis Chamberlain 2026-06-29  44  		 gfp_t gfp, bool success),
bfd875145ed055 Luis Chamberlain 2026-06-29  45  
bfd875145ed055 Luis Chamberlain 2026-06-29  46  	TP_ARGS(q, order, gfp, success),
bfd875145ed055 Luis Chamberlain 2026-06-29  47  
bfd875145ed055 Luis Chamberlain 2026-06-29  48  	TP_STRUCT__entry(
bfd875145ed055 Luis Chamberlain 2026-06-29  49  		__field(dev_t,		dev)
bfd875145ed055 Luis Chamberlain 2026-06-29  50  		__field(unsigned int,	order)
bfd875145ed055 Luis Chamberlain 2026-06-29  51  		__field(gfp_t,		gfp)
bfd875145ed055 Luis Chamberlain 2026-06-29  52  		__field(bool,		success)
bfd875145ed055 Luis Chamberlain 2026-06-29  53  	),
bfd875145ed055 Luis Chamberlain 2026-06-29  54  
bfd875145ed055 Luis Chamberlain 2026-06-29  55  	TP_fast_assign(
bfd875145ed055 Luis Chamberlain 2026-06-29  56  		__entry->dev		= q->disk ? disk_devt(q->disk) : 0;
bfd875145ed055 Luis Chamberlain 2026-06-29  57  		__entry->order		= order;
bfd875145ed055 Luis Chamberlain 2026-06-29  58  		__entry->gfp		= gfp;
bfd875145ed055 Luis Chamberlain 2026-06-29  59  		__entry->success	= success;
bfd875145ed055 Luis Chamberlain 2026-06-29  60  	),
bfd875145ed055 Luis Chamberlain 2026-06-29  61  
bfd875145ed055 Luis Chamberlain 2026-06-29  62  	TP_printk("%d,%d order=%u gfp=0x%x success=%d",
bfd875145ed055 Luis Chamberlain 2026-06-29  63  		  MAJOR(__entry->dev), MINOR(__entry->dev),
bfd875145ed055 Luis Chamberlain 2026-06-29  64  		  __entry->order, __entry->gfp, __entry->success)
bfd875145ed055 Luis Chamberlain 2026-06-29  65  );
bfd875145ed055 Luis Chamberlain 2026-06-29  66  

:::::: The code at line 41 was first introduced by commit
:::::: bfd875145ed05599540bcd911934c8c273726d41 block: introduce per-queue blk_iobuf_pool of higher-order folios

:::::: TO: Luis Chamberlain <mcgrof@do-not-panic.com>
:::::: CC: Luis Chamberlain <mcgrof@do-not-panic.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
