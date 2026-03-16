Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2E3254AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645041; cv=none; b=mtav9rlGUK2IGBOCQBP+7iUVYN3agbUc7bWqTnvgX2QGJOMC4RPTJuBWGhIXKV887H4vgtOwY8L8XWOb0gLY/Nm/0nrXq51En4g7H8GuahfkCSseDSCYVkF/+bn1LJdsvBMisRQrZSs+2NjseEMulPmteemMWbm9MfD2tRiTIz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645041; c=relaxed/simple;
	bh=DXTF4G/hhsTUhpIsxQoVUVzmu6abtwkBfdQlf+iCfjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ulVZrRDMof+ItRMUcM0q7zTEQPztYfDo+pWXcYmLjHmyecrZB5Jo7bUX/jlMeO5fLasS8biUxR90sxfwvYy+1AoYqTk0xS4THCeUbYhkRHRYR4VlFZrImtcDmVe5qJwhXmuiHTYpkmOk4q0BDdbjLuaVPS7bYXC4uEb/6cSeoGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn6Vf1Z1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn6Vf1Z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773645039; x=1805181039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DXTF4G/hhsTUhpIsxQoVUVzmu6abtwkBfdQlf+iCfjc=;
  b=Jn6Vf1Z1ZnC3dbKnhbo01VXEFbonIYUATM+iwADZO2PiWpUvqGY9eaf0
   zeNtTuMXBjTTMdCeODmdI0DxhC4ztkf5/nBX/xMfQumnvwRdDfRQpPb/W
   hgq9Zxvbr4cz2d4sQ1wheUVJjEMaAg5I2RKWEkQyqUJT67ymNUoETEHJC
   6irkv/UiA+yrluytAt+95QIgBZhyGWLzguh7rJ8WC7wWKnB5OsdZGkZ4Z
   uxD0ksLJz31gy+H53wEgB4u6EnM6LyE84uF7r7Gy0TdDwY8IQ7FQSblam
   AmIf/mJ0uvGXc32687apnLhMX6WAJqGKqvxmvj3myxINzZWOo5MD0eO/0
   Q==;
X-CSE-ConnectionGUID: R1yvHjdyTf6WVlXInUJwBw==
X-CSE-MsgGUID: K6USNQLTQpeLmnD2ZWOZsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74628342"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="74628342"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 00:10:39 -0700
X-CSE-ConnectionGUID: w6/9UM3oT4aJINhIr1QZ8Q==
X-CSE-MsgGUID: c+WOSK4gShyB+JtmzW3Bdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="225937067"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Mar 2026 00:10:37 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w225y-000000000HG-0Hjk;
	Mon, 16 Mar 2026 07:10:34 +0000
Date: Mon, 16 Mar 2026 15:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jump-batch-n 76/79] include/linux/jump_label.h:363:13:
 error: unused function 'static_key_apply_queued'
Message-ID: <202603161424.BOZeI5VL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git jump-batch-n
head:   3eafae45451bbc9ea7f96beacc5a928bc3edd593
commit: 58a3d3a59bbfeaeaf50e1e57c3cfe09fab217e73 [76/79] dyndbg: use static-key queueing API in dynamic-debug (working)
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260316/202603161424.BOZeI5VL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161424.BOZeI5VL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161424.BOZeI5VL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:18:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:11:
   In file included from include/linux/rbtree.h:24:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
>> include/linux/jump_label.h:363:13: error: unused function 'static_key_apply_queued' [-Werror,-Wunused-function]
     363 | static void static_key_apply_queued(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/static_key_apply_queued +363 include/linux/jump_label.h

   362	
 > 363	static void static_key_apply_queued(void) {}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
