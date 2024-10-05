Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB0415AF6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156628; cv=none; b=BT5jY7b8vGu8DhayJLjDMzAr2dUG0ZjuqexXIm7HSv02/ZniQUEsYuc8+trjyDGhE/itMa7t9MWDaqFgHjUBo0KwvxR5FgNrsZp5PtKxRDPUywbjZ2tUwl7x/2vZcnOmFQGWlJEooV1hHGR8HaNTU+4RY4MX4Y6q1VfpCf6T8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156628; c=relaxed/simple;
	bh=MuHf9U2AZz4emvxJcCMevM/cNs3E6BVKB99KEkndFG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYoOADsizU6oDkp2FT7gFKSTf2D4OsIFUUILcqAO3hljqUamXGXHqAbd801v8zmQdBD99XRkonxaBeQ8RuTowZ/3KrZ3TQ/rp6P+Ty0W9ZCFKoNZO6MOtxVHXn/Smxw/TC3n4oP+sBhupB/NU1YoM2uwFKOnAHwVJsFGLhKkfVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVe3XuKK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVe3XuKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728156626; x=1759692626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MuHf9U2AZz4emvxJcCMevM/cNs3E6BVKB99KEkndFG4=;
  b=aVe3XuKKfyFnIJ/LFv8mb71Arc0A7NB0KQmWOLbXp4jb6eFNMstb5mS6
   uiiB2QdioGHuuA2ujx/cOiQRQcD7ajY2C8xB2YLkmXvGHYIBX7+gmB6oo
   tVKra/jCSdyBRDeebiyc681pXPNhRLcreqeOYGyC/iomHTWf451ZEEbCD
   IXhdwAOQuGXsoTV7cPXEwSwKlD1xStMXKe+CGf/TPat3fb15exs0DqF1U
   aC4qHuO/pJZgE0Oym+Km+oyVJot0omWjosqkwrvv6q5Z7L+MqSHpCzz56
   6g10BkFUHk/6K57uJ4UVbhRs6UJg0EQeyrbg8fsM7XuqZ+om0lxQJYmTi
   w==;
X-CSE-ConnectionGUID: JMdzw5tnTvqb+fLDwnnDVA==
X-CSE-MsgGUID: pHYNvtl6TM+yQmjnp6BkUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27163983"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27163983"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 12:30:25 -0700
X-CSE-ConnectionGUID: nRfZG6ScSC6Jw70sI5MJPA==
X-CSE-MsgGUID: JHnh/cfSTNaWfFjkKEISUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79609829"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2024 12:30:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxATu-0003IS-2y;
	Sat, 05 Oct 2024 19:30:22 +0000
Date: Sun, 6 Oct 2024 03:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.12-rc1 44/132] fs/resctrl/internal.h:
 linux/resctrl.h is included more than once.
Message-ID: <202410060311.Dnt7OnXh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: 8ea3f2e7b9587298878465123e0daa5aef405082 [44/132] AUTO SPLIT
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060311.Dnt7OnXh-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/resctrl/internal.h: linux/resctrl.h is included more than once.

vim +5 fs/resctrl/internal.h

     4	
   > 5	#include <linux/resctrl.h>
     6	#include <linux/sched.h>
     7	#include <linux/kernfs.h>
     8	#include <linux/fs_context.h>
     9	#include <linux/jump_label.h>
  > 10	#include <linux/resctrl.h>
    11	#include <linux/tick.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
