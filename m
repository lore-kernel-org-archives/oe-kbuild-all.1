Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434280;
	b=IJs7vloSSuTxfQNXKhf7Pj3WfP0fx/Iy5vMdRU4i4MdhaMWtGVIg/tqhFKgG0Z3Ud1Pp
	 mEp6Lg6bJyYHXcCTA8Xc/ir5CzF7my7GeSsV8QfywePxpR6BED9Uz8oWBOVVJGER0vYAq
	 81QafWRarCausqa/kRK5z+BjiZ168X8esX4KFoOc0RRSLczj04uvJ82HxCD7hdYxHcQPk
	 Suy4vBgUVGdoroquKnfhHhKrJQA2Niu9OaaEM23t+7s/s01IuVph0vbgIguwFJq3Rpf63
	 08rBXPzXxIfbhJ5fvIhdl06fiHX/MExpZpvN4Dm/BYum4ydaZ6KFHnYTVCh/coDrXJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434280;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=P4bIseEYXvn6vM99pkRKwXYsaE2vTzTGZ/k5Z9oT6Ls=;
	b=ieQQS0qQ/acRE8Ts8PB/Sk9Y/tYgIc4VKNoRnq0NoMEumRVNUplNDWmM/RqAipfvUDfJ
	 ueGHoecGw8QpkI8ZbafLijZky34LJNEaImlCfv1Yjqt0R71ux1sC5o2A+3xNfpkjyokhM
	 axCuVBNOKvY0G5o4W2G2qS/3ipFSWKhVQSKyvu/5mmfS72W53OUwy8q7br0Gjd7Y4SaWY
	 VpagP9m5DoM37vNgEnl/DgKA+EvDq1sFhQi4S06I0GtzBxTgZEpuVksEhi5lUPN3MF3F4
	 l3JVl4KAgJ/9JWJqWm3tH3Nn4FDA/gpJMcZZFyBCvffNiXuS2htdO5ePST1HzD7puEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XWbPwL+d;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D97C606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 18:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D97C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XWbPwL+d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792434279; x=1823970279;
  h=date:from:to:cc:subject:message-id;
  bh=gX1GKaI023Ub0rC8MmJHbhhp4tY3mxbBEmav6Tbr3nE=;
  b=XWbPwL+d31oeeAFXEa4YBQEDxZQlCcUk0L5O+J80cwhO6Y+ZGSqJ083D
   6emF++w8nQopm7qnY/ihBOhzFB3A5owIupAZtdiFjtB9xQ9m9jReeHaHU
   qsxKNdAslZGzkh+BzsEqeOFDk5/WEwWAw8QNc+TTBqmi3eAYnN16m3h7L
   UPpU/D/jB1w64nEsOejmmgk7SGs9jJDzz6+ZcVNbJa9p7u2boZXFtlkkL
   MEprzzGRDwApZ8tccOK7IbcP7v+ztZ16hiouzcNcykXXJ2DTCkNXmFgqZ
   Gff9K2npGIVkQUW/fJ7v5jPfuONyn1dMxl/FmnyeRobWDMIfonhNtv7gK
   w==;
X-CSE-ConnectionGUID: ivW/Rpg1TZSpLj1LZGJymA==
X-CSE-MsgGUID: psHM/FQfRiSmNhZOlwX5iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1147286"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1147286"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 11:24:39 -0700
X-CSE-ConnectionGUID: pu+d3iYxRGevRRk2L3gdkw==
X-CSE-MsgGUID: xdpnhZgRTgespN+N7FHTvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4433508"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 19 Oct 2026 11:24:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIs2F-00000000MC2-2SJK;
	Mon, 19 Oct 2026 18:24:35 +0000
Date: Tue, 20 Oct 2026 02:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 45/49]
 kernel/irq_work.c:184:27: error: parameter name omitted
Message-ID: <202610200128.BvigeHuX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: 8b3cdb229529280585c5ac39daa446e735bce900 [45/49] irq_work: Introduce irq_work_kick_cpu()
config: nios2-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200128.BvigeHuX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200128.BvigeHuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200128.BvigeHuX-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq_work.c: In function 'irq_work_kick':
>> kernel/irq_work.c:184:27: error: parameter name omitted
     184 | static void irq_work_kick(struct irq_work *)
         |                           ^~~~~~~~~~~~~~~~~


vim +184 kernel/irq_work.c

   183	
 > 184	static void irq_work_kick(struct irq_work *)
   185	{
   186		/*
   187		 * Kick the CPU, typically so that it takes action:
   188		 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
   189		 * * On the idle path so that the next tick is re-evaluated.
   190		 */
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
