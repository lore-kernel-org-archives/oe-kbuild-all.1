Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C46D199931
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 00:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771028577; cv=none; b=LLIKwgyhPoUD7aMmRKq6KehLeTfUarZItbybmMppfO6p3qNlLqAiJ0G406M473adq1lgO1OR0l9I6T1B/pq7IUC5dpt6MmveiBQw8h/TNhRTSkOdc0EATOmsVxwFhUPQRG3fonsOy8i58UfNOs2x/6mffWiB6K1XFFzvXCLt0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771028577; c=relaxed/simple;
	bh=CffHg1Nzg5oo8FhZO25dbcG1V5RjSrZQ1+ivX4PJCeU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RwIxNbGLSCYvGq3eZtcEW3aB47E5//DY/IbVR2Ym7tI0droW7YxeJdpV73jFUMlSskoQ7qZrOoZIAgrzeqpBYaskRgWhkeKbCkfwMwNzhr9u6w/MT0OiL/7Y6rFYj8kZy4TEPjXP1pxoAAGvPBCb+cmUhxOCfX7mWoOAum9dT9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlxiYNwG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlxiYNwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771028575; x=1802564575;
  h=date:from:to:cc:subject:message-id;
  bh=CffHg1Nzg5oo8FhZO25dbcG1V5RjSrZQ1+ivX4PJCeU=;
  b=IlxiYNwGZzRBv2jo6rrKTuY+1Y1HhZrUw4ahhxCs28W0d+liaqKRx/As
   HHxVn8wnkeedjXGca3qIxgcCD8Jji8RSkq4FlJepOqNsmExaREmiM7XkP
   BBjJ3qRbNqZPcuxGR7o0l9BWZqHPM5kxf9mDPsQaBQEHgkGjs3Fi+mX+v
   qZvHSUegzk7eD0JmXg1/OkI3Y6NWIak7pBrz+8gBB0xGGZT1hZj8jgxKW
   D+MX/idIDkMHhqTF+Bw212Sk1QyBjVQkr8nCJKH70xkYSlrnViB9DxzI+
   JniJFXxlYxhAT7sFrbp1SFnz9rx0vz44v7QwMkTbnt1NRe/VGjn/kxexF
   Q==;
X-CSE-ConnectionGUID: LfevLBzuSCKVND+jEsdUIw==
X-CSE-MsgGUID: vH99bizdRjiawrk/SMc7zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89805181"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="89805181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 16:22:54 -0800
X-CSE-ConnectionGUID: KwNSgcTJSUWMEF1moeGNEw==
X-CSE-MsgGUID: XgnbuK3OQ2a4UDbsWeaU1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212457931"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2026 16:22:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr3Qx-00000000vxA-0qgv;
	Sat, 14 Feb 2026 00:22:51 +0000
Date: Sat, 14 Feb 2026 08:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 1108/1155] fs/bcachefs/btree/cache.c:26:6:
 sparse: sparse: symbol 'bch2_mm_avoid_compaction' was not declared. Should it
 be static?
Message-ID: <202602140846.BggfQYp5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   d4bd02beae9ffcc8e3c028b54cb3a25b06e95beb
commit: 090d4a4b1567ae743f1342c976b449d104c53a6f [1108/1155] bcachefs: Avoid waiting on compaction when allocating btree node bufs
config: parisc-randconfig-r134-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140846.BggfQYp5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140846.BggfQYp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140846.BggfQYp5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/cache.c:26:6: sparse: sparse: symbol 'bch2_mm_avoid_compaction' was not declared. Should it be static?

vim +/bch2_mm_avoid_compaction +26 fs/bcachefs/btree/cache.c

    25	
  > 26	bool bch2_mm_avoid_compaction = true;
    27	module_param_named(mm_avoid_compaction, bch2_mm_avoid_compaction, bool, 0644);
    28	MODULE_PARM_DESC(force_read_device, "");
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
