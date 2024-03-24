Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4933CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711267713; cv=none; b=bfH6j1lMHHJc6qx16NOon4aP/dGF4J+29apXkHNPiS9gjgW3LW6V9XgECrccFK28d0AqJDL2lMxUGNJnVXL4BDnEE5bMV5ArnfpxYp+W33G1AnVzAYP+B92QayzusXrwreVEnfZhUZ9SK8QWRmMqkErL+Ok5onWQGStUqHhSYn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711267713; c=relaxed/simple;
	bh=2zDdB+c7zcAdpIoQSSzoNILM/bQATOYd5ubFC6eb9KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqJ2k1P2GLlPaoYIyGZTnNarTApq+cFOG3wG10ysceiVGVLjEsVizUKcz4ZLoaj6Ey1Ti/WVwuKrC7RSQ2zvhOq0mV3eo7EPJQnqFJWIabjqhUil3MUSHi87lsLqcWrCmM/k1wtok/WYoUnljUCKREz7hEQ3FLGe8vch/U6PgrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCCioOgA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCCioOgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711267711; x=1742803711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2zDdB+c7zcAdpIoQSSzoNILM/bQATOYd5ubFC6eb9KE=;
  b=dCCioOgAK0ghKh/9HvDbB5ORl0BIQhhmO2OHfUPQA+Z3Rabq3rKpBpTF
   K5W2bLkUu561LX2TIjeM6AiU9uOwp0S7zW8riAVjXQUyZNWy9816Ef8zh
   2I7rGV2Qj04yRwVA7PXZfitO2ffIaowqS/ZIqBV+79rihTL9/u0BuK02z
   jA+qH9NCalYQEulR3+QTbrmFr0Ot/vtkLDXJmdm3956ScMlMDcgkshpo6
   qUiGm/fmMq7btWVUv97RU1yphzPtJtzoqLgiQb3bzLC+hbMwh+PPfxJM4
   E59kb9uVJqx0PVHBBpcI86l2ExLLNvmCU33KQneeHojfzz3vnXGv4iVKZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="16912441"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="16912441"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 01:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="15723198"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Mar 2024 01:08:29 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roIu2-000Lib-3A;
	Sun, 24 Mar 2024 08:08:26 +0000
Date: Sun, 24 Mar 2024 16:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21526/30000] ld.lld: error: undefined symbol:
 fg_console
Message-ID: <202403241522.RiSJ0uDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: d74f3b70d73220d919db010ec1c81aa1d89082b6 [21526/30000] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-016-20240323 (https://download.01.org/0day-ci/archive/20240324/202403241522.RiSJ0uDv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241522.RiSJ0uDv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241522.RiSJ0uDv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fg_console
   >>> referenced by ls2k500sfb.c:244 (drivers/video/fbdev/ls2k500sfb.c:244)
   >>>               video/fbdev/ls2k500sfb.o:(ls2k500sfb_events_fn) in archive drivers/built-in.a
   >>> referenced by ls2k500sfb.c:244 (drivers/video/fbdev/ls2k500sfb.c:244)
   >>>               video/fbdev/ls2k500sfb.o:(ls2k500sfb_events_fn) in archive drivers/built-in.a
   >>> referenced by ls2k500sfb.c:244 (drivers/video/fbdev/ls2k500sfb.c:244)
   >>>               video/fbdev/ls2k500sfb.o:(ls2k500sfb_events_fn) in archive drivers/built-in.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
