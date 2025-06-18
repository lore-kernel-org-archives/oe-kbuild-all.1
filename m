Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE427E052
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 22:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750287469; cv=none; b=iw2vmUTFE3l2intB3K9+DKWqwFkWjpl9f+uSFIcvzAYdvgbjw/Ytv4VpX+hBsmlIQYxFUkzhpoaFwBknBn5S+9bwt8gzeXlpwEHDZtGpveyZCgZDVdyrXPpolVYfu3oeL3Jd4780P1S1QBM6AWsqaB+amdHSZuK+vBU95NDRVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750287469; c=relaxed/simple;
	bh=AvGpVTLf/Nps6fggDmlQaYoS0Bt6Sp4YEnD2790teCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fpTbpj8riZXeNV4J4IrSNUy4peWlTn8U9C3560SudOrMO5F3CSHOcQO9xIa3Wd+hcfA+dqoL+0Td//TmIhXVh2IDdfkawliaWzvMcUIdym//M730jBiSgdem0qlce6RZ7N9HV0UxaKe7KK8hVqXbiTveB02hTDhNzW+81JXG6nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hc5XCZbE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hc5XCZbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750287468; x=1781823468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AvGpVTLf/Nps6fggDmlQaYoS0Bt6Sp4YEnD2790teCE=;
  b=hc5XCZbED3fgfpxA3MkTN86va1pDrzHl1zh+wjmVXUXxlNk2vvwKnJ9S
   RDhVfBrPwDKUiaZrcxOFCYaOPw+YHzwAkz9oCmPilObk6LWF91vFo8vJp
   Sfm3Y3OvbwVgqAEG1+KH9xY+dxt7VNcsB2PF0ZH+Z1qqSLSci0LENVAQ6
   7qXFKcoU/I4P0WRTPkMeBXGyTWuwcSCuLsBBKaQgD+Yqb2oqT9WLqzgGO
   Z1txuXiUks+E8K3OyeKLUS00D9GtpdB9JP+e5Cyll5M7cvLb79UzaVeQ5
   OtY43rYMH6bdlZJlJHGyI0rSTTk6ptV2rmOHDqzCQSmots7A/hPqF06VA
   Q==;
X-CSE-ConnectionGUID: 3S1i3zExRUush3kMQGNzDQ==
X-CSE-MsgGUID: 8nPGsBkbQlyzB4pSKWegSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40138284"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="40138284"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 15:57:45 -0700
X-CSE-ConnectionGUID: iz9Xj95/Svy9HxO6uINWRQ==
X-CSE-MsgGUID: 3O6zep4eTI6xQXsvqaZKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="150779489"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2025 15:57:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS1iw-000KEp-1E;
	Wed, 18 Jun 2025 22:57:42 +0000
Date: Thu, 19 Jun 2025 06:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream 2/12] include/linux/bpf.h: linux/mutex.h is
 included more than once.
Message-ID: <202506190630.OXXtSSfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream
head:   c1d2a174989543fbad6b85fd49c9363227edb616
commit: 389e61f669f07d04ed1cab60c714ee4ac0bda052 [2/12] bpf: Introduce BPF standard streams
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190630.OXXtSSfj-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/bpf.h: linux/mutex.h is included more than once.

vim +19 include/linux/bpf.h

     9	
    10	#include <linux/workqueue.h>
    11	#include <linux/file.h>
    12	#include <linux/percpu.h>
    13	#include <linux/err.h>
    14	#include <linux/rbtree_latch.h>
    15	#include <linux/numa.h>
    16	#include <linux/mm_types.h>
    17	#include <linux/wait.h>
    18	#include <linux/refcount.h>
  > 19	#include <linux/mutex.h>
    20	#include <linux/module.h>
    21	#include <linux/kallsyms.h>
    22	#include <linux/capability.h>
    23	#include <linux/sched/mm.h>
    24	#include <linux/slab.h>
    25	#include <linux/percpu-refcount.h>
    26	#include <linux/stddef.h>
    27	#include <linux/bpfptr.h>
    28	#include <linux/btf.h>
    29	#include <linux/rcupdate_trace.h>
    30	#include <linux/static_call.h>
    31	#include <linux/memcontrol.h>
    32	#include <linux/cfi.h>
    33	#include <asm/rqspinlock.h>
  > 34	#include <linux/mutex.h>
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
