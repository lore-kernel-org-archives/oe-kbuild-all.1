Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B92F43
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 03:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729393697; cv=none; b=dYOWX2fPG08SiTL+osyClMx0CW3Kd6fwRXl8/hpAAOMhLHXxtrSpLlM4P5+xFYj2eh9JSUtFlB1kXadDIP2pZJqYkzxA5GLjq04q5GXHiivVq6d6DsHNYpynEnGq7byqB2/YbCZng2X+2QsjcDAIlNnkkA8wqfex/MenZFbcNm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729393697; c=relaxed/simple;
	bh=MoYHGbFn/WBlM3uW48mmI6rGmGvwjx747ZNG9GB98tU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsMAJ1wHxazG9WKRiKJTSPn52jBZfysYYAEK2ThCsBi09Xx6zZW516SV8z8cwirDk0RhdUOFznrKmueF2JMRTHcJW5ZKHSXQ3OtO5MYCzuuVWGEZLvfVuNrVxKw3Lm4fsl9Ka7kXUNI+GKF5RF5nv9Jdxk3vUy7tnVodQ1qMSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwKFoWfa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwKFoWfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729393694; x=1760929694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MoYHGbFn/WBlM3uW48mmI6rGmGvwjx747ZNG9GB98tU=;
  b=mwKFoWfapqNlkdeaB43NhcHpq3mqM4LhejD+7aTmjintbtS0gCqrwxXr
   RvmFp2+4M+0EHnyGsYtAP826W2nH2ydoZC3Wob6/lwCArGmtwNHqOYDU8
   n1zUhcUPjRhSralc4jC7EBhzVedaVd8MJzslRJBafusa0FD2ButsHZR34
   zqoX3VlsdcqjzPCpTfLVORTzCCfK0vIViDXSnft6shaVuXroqVIaQbw4e
   9OvqfBBk1MUScVkV8C/CJPIGwz2NrGfdyFKZY+2Ux2lx9kZPl8ysaw2OY
   /meBf3T2bRTwuZPdYFh426fzXCHZ6PO4v2fQ1OT7UgVsmv60qEv7Wr5o3
   Q==;
X-CSE-ConnectionGUID: BX/g1RjgTay+LDFzjEz10g==
X-CSE-MsgGUID: abKj5PbUTPGkRoHc52k2bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39442877"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39442877"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 20:08:13 -0700
X-CSE-ConnectionGUID: vw2qkUGRRsyxP91ZLxf5Mg==
X-CSE-MsgGUID: AnuqrqkAR/62r6aJn66axA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79167638"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2024 20:08:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2MIc-000Poi-0A;
	Sun, 20 Oct 2024 03:08:10 +0000
Date: Sun, 20 Oct 2024 11:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/3]
 include/trace/define_trace.h:95:10: fatal error: 'trace/hooks/sched_ext.h'
 file not found
Message-ID: <202410201111.IxSiUcy9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   32c1bffe815c9ed746ce7d84cae07da17db6bca4
commit: 662100c8e61044374da90c4088c255e43e63ed04 [1/3] Merge 88264981f208 ("Merge tag 'sched_ext-for-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext") into android-mainline
config: i386-buildonly-randconfig-003-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201111.IxSiUcy9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201111.IxSiUcy9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201111.IxSiUcy9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   In file included from kernel/sched/ext.c:980:
   In file included from include/trace/events/sched_ext.h:32:
>> include/trace/define_trace.h:95:10: fatal error: 'trace/hooks/sched_ext.h' file not found
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:90:32: note: expanded from macro 'TRACE_INCLUDE'
      90 | # define TRACE_INCLUDE(system) __TRACE_INCLUDE(system)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:87:34: note: expanded from macro '__TRACE_INCLUDE'
      87 | # define __TRACE_INCLUDE(system) __stringify(TRACE_INCLUDE_PATH/system.h)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^~~~~~~~~~~~~~~~
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^~
   <scratch space>:73:1: note: expanded from here
      73 | "trace/hooks/sched_ext.h"
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +95 include/trace/define_trace.h

a8d154b0091683 Steven Rostedt 2009-04-10  94  
a8d154b0091683 Steven Rostedt 2009-04-10 @95  #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
a8d154b0091683 Steven Rostedt 2009-04-10  96  

:::::: The code at line 95 was first introduced by commit
:::::: a8d154b009168337494fbf345671bab74d3e4b8b tracing: create automated trace defines

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
