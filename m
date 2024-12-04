Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D0239180
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334871; cv=none; b=M8HBhcx3dmoM1Y2zxZM9asxduV+j5RIXO9Uw3potpDLv1pO/E1P9T7ZiPOsDzRBR7SIyYbloQD1ybY1eY7+q6YQ7qM4GAmPbIMaB/AnCtYqsqKl710IK+NCcuilpISFF5MsJy22v2tjiG51V4wYPlU7pV2728eLNfHxtWcx1VHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334871; c=relaxed/simple;
	bh=IvAw/9dJQ/6HTECQuZckd+xqGF/wAGSMXvFAiLeBjaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXrA25JbfDLZGm9PJLBJGQRQcrg5BFnIEETZtBf4/sEqPPXY9qTYAjUl8ccbVCCkW7c6eDlfs6BB8NUd53RBMzPP1KqWPZ33mp6k3Ld0YSuUEiXTuCKg08vehlR1vKSBp//PYmuLN+wUzILrozx9DGJ955xqu+0GEg5PMiKHpeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuZNv91D; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuZNv91D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733334870; x=1764870870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IvAw/9dJQ/6HTECQuZckd+xqGF/wAGSMXvFAiLeBjaQ=;
  b=GuZNv91D5S+hKklSCf2GYQ9rI+ANCGunm0aZ4thNGhfnpv6pGRJqbmMZ
   peHV0KoXOXvLcJC322FTWDOZEmbJ5yfu2k8n+S5qzjRSykLT1HrI5Qv0a
   nBLkIgi7uUzEME4+m0yvR/XTb0rWg/EM2cxIoEWXlIK/pGW7TkvsMwOpT
   oCklBUl/94v24LrGopwNZosvPBj3Cq4JoaNjD51ZoeypihC5bvxbQ8xPA
   SMPNKPpUSx9BRfK7sKxIu0Vruo6FguMIx7g304XAonHsful0v8tVWkyMc
   +S79XEOIZ8wra+DruO7p3yM6HfgcGzl7Ib3akakw3ZtfL/rXMP3ytjq5l
   A==;
X-CSE-ConnectionGUID: nJS3OiJXR16pvaiiZhsRiQ==
X-CSE-MsgGUID: otDmX2C6STO4SkO4/Bw95Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37277992"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="37277992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:54:28 -0800
X-CSE-ConnectionGUID: 4DZLnZG4RcG7Sq1a2zoBTQ==
X-CSE-MsgGUID: yrjWW0SlTSaTjF5hfoRh3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93713234"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Dec 2024 09:54:25 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tItZv-0003MP-1N;
	Wed, 04 Dec 2024 17:54:23 +0000
Date: Thu, 5 Dec 2024 01:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>, linux-um@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, thehajime@gmail.com, ricarkol@google.com,
	Liam.Howlett@oracle.com,
	Kenichi Yasukata <kenichi.yasukata@gmail.com>
Subject: Re: [PATCH v3 06/13] um: nommu: syscalls handler from userspace by
 seccomp filter
Message-ID: <202412050150.ZqbrNI0T-lkp@intel.com>
References: <f1aed0f9233f49880510e9506deddd52b33c2fc6.1733199769.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1aed0f9233f49880510e9506deddd52b33c2fc6.1733199769.git.thehajime@gmail.com>

Hi Hajime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bed2cc482600296fe04edbc38005ba2851449c10]

url:    https://github.com/intel-lab-lkp/linux/commits/Hajime-Tazaki/fs-binfmt_elf_efpic-add-architecture-hook-elf_arch_finalize_exec/20241203-163016
base:   bed2cc482600296fe04edbc38005ba2851449c10
patch link:    https://lore.kernel.org/r/f1aed0f9233f49880510e9506deddd52b33c2fc6.1733199769.git.thehajime%40gmail.com
patch subject: [PATCH v3 06/13] um: nommu: syscalls handler from userspace by seccomp filter
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050150.ZqbrNI0T-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/um/os-Linux/process.c: sys/prctl.h is included more than once.

vim +15 arch/um/os-Linux/process.c

  > 15	#include <sys/prctl.h>
    16	#include <sys/wait.h>
    17	#include <asm/unistd.h>
    18	#include <init.h>
    19	#include <longjmp.h>
    20	#include <as-layout.h>
    21	#include <os.h>
  > 22	#include <sys/prctl.h>
    23	#include <linux/filter.h>
    24	#include <linux/seccomp.h>
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
