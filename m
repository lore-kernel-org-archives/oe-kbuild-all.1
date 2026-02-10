Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9673212D1F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770703811; cv=none; b=ZLv3Vyz1wtdi3WEV9kknKW8auoTrK63c+Kby0Q5pPnrAljVn51IyxGPJDDUT1pAn8m6pjnGr627rAlAIpMShfN2QkErpojUYshuMtkzQ2rqar9bjaJo8urtoMuy5oesHzKNtHipWvDikM5lqqrWUbc4/E5GFF/Y6feFNPsSZoxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770703811; c=relaxed/simple;
	bh=QAZtV7kq1MydC+AiB8Jif9im5WuivKHUVsLE9kc0CGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iy/+AjKpNfR87hNhV92qlU7RhQSC7eqh2ymlVB89cxiKp52oTHbSPVHAQF0eNxKnKGttmAY/KU4DDZ/wUEVyGbYgjpyVN1OMICKvmLZj7iSMtAjZRThefT73ZiNHiNYaKJh2ulJNER0y4TQgOJUxA5GNHBeSJMsvnZQ175HySPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuNCotud; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuNCotud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770703811; x=1802239811;
  h=date:from:to:cc:subject:message-id;
  bh=QAZtV7kq1MydC+AiB8Jif9im5WuivKHUVsLE9kc0CGg=;
  b=VuNCotudpVPA1kB3yNq1oFpo25NsdL843+UVlD5QEH4PGc9B0D0XKxd/
   wqH8LK8aub1KRCpBhamoUZr9yWuUGCZ4u4ZubYtZFgyRpsL4Iah3aWyZ3
   o/ZGPkE7f6OtdFOs3YMzq6F1IiLGp/bDGanvwBXkK+Po0JXOTJt/Rkohh
   mlGRu4OinV5+sUFYHq0n7DeBkxMf927KtHFKXfRonIb0ZFY1VOI6qMt/V
   7KTvj6cpiBxp4tyoFfr7FWNYqAzT3ebDxezkPpTNfe5ybQCHsengmtzii
   V9RTV9xZBovUxhTapPXqyiKQRyapvI7NWntie+CHHbcLkMBD5bHC+HUK8
   A==;
X-CSE-ConnectionGUID: 3wke+yrPR5amcyNfeelu1g==
X-CSE-MsgGUID: fxUY3UCRSoS7M970BDX2+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94466459"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94466459"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:10:10 -0800
X-CSE-ConnectionGUID: waVxdAJuRFO3/jLecUov3Q==
X-CSE-MsgGUID: BagGH8GJQbmnKcvb27u8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211849210"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 22:10:09 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpgwo-000000000gH-3cuT;
	Tue, 10 Feb 2026 06:10:06 +0000
Date: Tue, 10 Feb 2026 07:10:01 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 4/15] kernel/container.c:24:9:
 warning: 'pr_fmt' macro redefined
Message-ID: <202602100733.bVJbSmeq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   f62d2a134716e021cfca8d7860048f9c71bd53c4
commit: fb9ff38678d37c68b7cb2a895999b4a26bbdc2e7 [4/15] containers: Introduce a container type
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260210/202602100733.bVJbSmeq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100733.bVJbSmeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100733.bVJbSmeq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/container.c:24:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
      24 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^
   include/linux/printk.h:402:9: note: previous definition is here
     402 | #define pr_fmt(fmt) fmt
         |         ^
   1 warning generated.


vim +/pr_fmt +24 kernel/container.c

    23	
  > 24	#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
