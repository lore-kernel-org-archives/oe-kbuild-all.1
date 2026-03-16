Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34068346AFC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 05:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639375; cv=none; b=kflhvrUqaJedlJuSHEmupyHW2C/P2kQSb/A7JSX3BP1xxZNg9RgaIJe30Bi1gnVC1V2/FnC7ARaBrWM+V+SeuoDx88XlQvS5qehZPOmKGkQ/2vUGbx7UABBlXq8rpQcjAG0rLTX9COGhu05jnEXQ0w3hSTfiwlrMZ2vqKU6BrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639375; c=relaxed/simple;
	bh=ZJxAK0DdNtO2iu2cK7G1k7HSLFw/6aeHBSTi8gDkcfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F0vFJI33GD9mmCBM28Zh63UiIGgCz+VPloJk4pdKxIS+JMNBURmPS8s7YqnKcQNeA5wGnY2YEYcWasWLVMep9w2Zpo/QEAixvBbYy/JTvoMdyU2u1hvCMKyL7bTx2QnpueHWqGX+76kcrffWkgDdqoJrgGTNZucWIINSOLmCe68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RofffWoS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RofffWoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773639373; x=1805175373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZJxAK0DdNtO2iu2cK7G1k7HSLFw/6aeHBSTi8gDkcfI=;
  b=RofffWoSLOabOTnu8/N2I9RpoYNeaeeWzlew+ADJlcuxolgtDu9+o38k
   2VqHL9sFQMe8zrcHK7G/tBLi/EAKHxmkTToGBjiffXWvAaogL3yGeQyYI
   6gZ2YE2Vgj3Q7C+0i/jnq0ipME8bomGrLTA1OnQ+iyidN8oMNLi654n+j
   /ySGx9qDzL2zrFlzrOSNU0kDu6pO9zyGTAwKmhhpyY+5+tzhznoN9ccu5
   JIg+qASR5lBU2ACQ0UI9FR4mndPOPA9bg1i5qDT8YfUmZAVRDaSNuEo0n
   kQQSWHiFa4TIq9m+9pzgS+WcG3/xZeGpozoRRU2BJN3FVrVGZQsnA6JGX
   A==;
X-CSE-ConnectionGUID: aiP55qotTjO0pD1IxNT9QA==
X-CSE-MsgGUID: IMuHnw9CQ6+rvHEKqwsDjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85350301"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="85350301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 22:36:13 -0700
X-CSE-ConnectionGUID: Ikr+hB9xQ4iFBwtPKjVKnQ==
X-CSE-MsgGUID: zhPZAiUBSyi0bApSMLCB8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="221034553"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Mar 2026 22:36:11 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w20ca-0000000008W-0YDw;
	Mon, 16 Mar 2026 05:36:08 +0000
Date: Mon, 16 Mar 2026 13:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jump-batch-n 76/79] include/linux/jump_label.h:363:13:
 warning: 'static_key_apply_queued' defined but not used
Message-ID: <202603161323.7V8lBV8j-lkp@intel.com>
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
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260316/202603161323.7V8lBV8j-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161323.7V8lBV8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161323.7V8lBV8j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/static_key.h:1,
                    from include/linux/tracepoint-defs.h:12,
                    from include/linux/sched.h:49,
                    from arch/alpha/kernel/asm-offsets.c:11:
>> include/linux/jump_label.h:363:13: warning: 'static_key_apply_queued' defined but not used [-Wunused-function]
     363 | static void static_key_apply_queued(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/static_key.h:1,
                    from include/linux/tracepoint-defs.h:12,
                    from include/linux/sched.h:49,
                    from arch/alpha/kernel/asm-offsets.c:11:
>> include/linux/jump_label.h:363:13: warning: 'static_key_apply_queued' defined but not used [-Wunused-function]
     363 | static void static_key_apply_queued(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/once.h:6,
                    from include/linux/prandom.h:12,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/jump_label.h:363:13: warning: 'static_key_apply_queued' defined but not used [-Wunused-function]
     363 | static void static_key_apply_queued(void) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/static_key_apply_queued +363 include/linux/jump_label.h

   362	
 > 363	static void static_key_apply_queued(void) {}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
