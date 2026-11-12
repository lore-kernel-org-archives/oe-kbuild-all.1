Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467996;
	b=4zOAZj9ryxxxe5PWIJj59vCfPtPjVvXAbl3I5W/Jcxq34SC0JO07S0mT2/Cc5MBsAWYU
	 nhpjoEzSeNu6B/opBi7hQvX6suTO4c4PcLoIOE8Z7dBdBB35DaKXiTCuJFO06OsCiqP1f
	 D8LwKJysZ+UB45o8wzhIoh3NqDIm4bKwR3DZ3ViABHIkc4hqJPpT81OglC62jPBYJW9tk
	 aVhwHbbVrMwuUm+bzfA8u5tGLye+t1X29JmOuEeZnv1E4vvT3aKd9JDPo66axtdlKqDsW
	 MXPNeqnDFh6PI91uoItOyxzt6eCdy/Y0KmvmeZRsEcZI6lpWhYFQFPHOdPNAZObpktw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467996;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SnubMawUTx29pV/SgYpemSZfaWTUru48zjKWlzNojF0=;
	b=C89+LI3VSIvN0mBiIrz/UCO+MTUlWAiY4BCE3w75Iow3HTfVjnrJn3qXZQP9VIBRh3J3
	 +82iN7u/MVQJ+c+2a+135kZhfDhcEq07niqBdezzRMAa2hmgYVTMn4pO9sKr2+H7wdqDG
	 HaSLy8tg/31X8XGt6Jjr/T8XWLdqAJo7MlDYW+8xsjj9WxJewM+ErIXKUnZ/AKvgOxgQp
	 aMFHIbZFFiEkVctz/0qfYeTuG96WD+hpLE/IZX5fSJiBAy3T8uYXE/VLCZpEw3dBcVQQX
	 J8pawjWQ5tWDO1aTZJpqtDUsJBrROGfr7md4PSIf6ClGay6qLm1kK1uHUtg9iJ+2HlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvI4Z1iI;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D0606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 07:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvI4Z1iI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794467996; x=1826003996;
  h=date:from:to:cc:subject:message-id;
  bh=byvbUX0ypfn3yjysH1rizrpxkV9v7JBJeOqBqlBSu3k=;
  b=RvI4Z1iIO0L9EJuA76W8TCztzVjBGJsurkxFPZqn7B8GsU+vpKlNULHx
   jPSXD/70/doPSZHPYidY383LTGacOiGS87bNcX7KBxWMbFypw1i3kA2/x
   On4HR2hiq4S9mJEa22F6XgH0nuPGa6m+tjbS3eHtCE9/UM7/1NU80Uw77
   ta28j5dBeznIwFQ6wTYfIzMwdx0z4kPBjp6UfdSPbeQz8tArXhkkhm1oq
   ZYM5Cx+pWvVGQf+L1drtTWBnBvyXy/wDvIZXsspDEr6P7FgXvQHyZyd/2
   ayWM0mr6z+eP47krGkCShrxJKTwivlfmdjmUYfRemSfAXp7+aHFu01+zo
   Q==;
X-CSE-ConnectionGUID: SvorSOnGQNGAf7InuB0hfA==
X-CSE-MsgGUID: O2nhgpZdQhunQ4+LyITcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3330217"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3330217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:19:56 -0800
X-CSE-ConnectionGUID: unbyUxGkQyCkJGY1iTqvHw==
X-CSE-MsgGUID: QKNzFAXASEaFIJo1OIvdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8411691"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Nov 2026 23:19:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRP66-000000010dl-1Gdf;
	Thu, 12 Nov 2026 07:19:50 +0000
Date: Thu, 12 Nov 2026 15:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 648/788] Warning: kernel/sched/alt_core.c:102
 cannot understand function prototype: 'int sched_yield_type __read_mostly =
 1;'
Message-ID: <202611121544.mv5WaNLp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   0e9b4632056a823b0595507f7fa5d2a638a8defc
commit: ca8e0fde64fcfaf8691f1aa16d875770a5896ca5 [648/788] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611121544.mv5WaNLp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611121544.mv5WaNLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611121544.mv5WaNLp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:102 cannot understand function prototype: 'int sched_yield_type __read_mostly = 1;'
>> Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
   Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'
>> Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
   Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
