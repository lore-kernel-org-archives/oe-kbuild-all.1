Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C2129E88
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711494970; cv=none; b=Y37tNF0/DaGjyVidsOO4VptbM9kJdUswxZOFBRZorGewT3vvBFPC6/sI8z5j3hussADKCAlpHM0O0XSxZg45sZVLusk7hLQ3geFJqcLvdcZSp1YOqHizOdpdkTmU/JIfLr7d1HayVYLky+6auTlksP57X9cpYX3H/yMDUBhTuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711494970; c=relaxed/simple;
	bh=OG/f6XARvrhPiV/bUfXJ8mwwU1Q8B9KY5DVwaCfWGbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDdowfpuf8uzrpcSfVzMbgVFeXrp2MlfvwubECpfU7j2deuE1TpKo5GqpWER72003+YKNtfZR/F8BJW3PD8+tJdmad+paG9EY9VGCNflzq2UMOXmd7s02mF+jfujoQUHk/vk64irB5OLTzIX17HuveDC5WurVzo3/BOlSBrOj5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNefyiF6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNefyiF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711494970; x=1743030970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OG/f6XARvrhPiV/bUfXJ8mwwU1Q8B9KY5DVwaCfWGbs=;
  b=GNefyiF6ivRMkDm1L1hjmxsysglVY96HDh0TzUOMe+S+7zYDY31zPY9e
   eOTk7PdgkyQE5wHUGwLDmvSwc0mTo0klXicNTmOZcyec+6Tapg9LQIWPs
   dJ0GYTqq0p4WehlCytXFgvSp2QjECyyVKkRl4uZvpjM6WdQV8G6EMa3ld
   /zMx2tdQ9rmPfAiNEL7RB/624a/F7T/G/h3haiNJUOn+Huf+eN/hlmkYx
   yaJckBPuccByZGTovpuvfLEOeKOHudXhhIIFfy2ybk9wuP6UQEYEUbz4a
   GzEawzY+ZEkmqN2W5V4SrTA5YP31c9lkBMeEeA3masKWPeuhNTHTgxT9B
   Q==;
X-CSE-ConnectionGUID: fSGhQx1bS0ui9kdOC12fOg==
X-CSE-MsgGUID: f+wBt3JZSYKxBnBiIc/MsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6431564"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6431564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 16:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="47118201"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2024 16:16:05 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpG1S-0000X0-1T;
	Tue, 26 Mar 2024 23:16:02 +0000
Date: Wed, 27 Mar 2024 07:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2413/6880] mm/mem_reliable.c:345:2: error: call
 to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202403270722.6XFnuheL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f655b9d050aaaf0405a45888ad590504de2cb090
commit: 425771499c0742a996ab28df143d7a5123102686 [2413/6880] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-002-20240327 (https://download.01.org/0day-ci/archive/20240327/202403270722.6XFnuheL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270722.6XFnuheL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270722.6XFnuheL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mem_reliable.c:345:2: error: call to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           mem_reliable_ctrl_bit_disable(idx);
           ^
   mm/mem_reliable.c:345:2: note: did you mean 'mem_reliable_ctrl_bit_disabled'?
   mm/mem_reliable.c:320:13: note: 'mem_reliable_ctrl_bit_disabled' declared here
   static void mem_reliable_ctrl_bit_disabled(int idx) {}
               ^
   1 error generated.


vim +/mem_reliable_ctrl_bit_disable +345 mm/mem_reliable.c

   322	
   323	static void mem_reliable_feature_disable(int idx)
   324	{
   325		char *str = NULL;
   326	
   327		switch (idx) {
   328		case MEM_RELIABLE_FALLBACK:
   329			reliable_allow_fallback = false;
   330			str = "fallback";
   331			break;
   332		case MEM_RELIABLE_SHMEM:
   333			shmem_reliable = false;
   334			str = "shmem";
   335			break;
   336		case MEM_RELIABLE_PAGECACHE:
   337			pagecache_reliable = false;
   338			str = "pagecache";
   339			break;
   340		default:
   341			pr_err("unknown index: %d", idx);
   342			return;
   343		}
   344	
 > 345		mem_reliable_ctrl_bit_disable(idx);
   346		pr_info("%s is disabled\n", str);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
