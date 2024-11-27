Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4445D200BAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725767; cv=none; b=NHfiaf/D9SJkXI+sA/+Cz3OETIxKtuA6/5P65u2JAY9wLhm7h2UXWcbuNfsRs53kiPFOrjMruLI0SzVoUwsiDGxeR/B9qD1L3xohwal+iN7pnc/zOGrfhZOKZNMCsZPT8AMjdSYKMQS17w6Rla1bjgt4oNKeIg86/MtATlVHfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725767; c=relaxed/simple;
	bh=mWEL3zMhe55nAdjTPK2yaffnMS8UxjGu9YV64GYNR0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+Jz1DWhPfkTlDP46ApV2SewxUEdkJ4mSJek5hMcWCYYZsg8OUTkkE3cT3MfrDH+lEGlRFc+r1gO99qsxZ83sq97YsIpY6fzWzFUaoGQwLaQ/brAGY7lfdXXnF8Mu61om0ZYUIGSsRTH2+l2+aJo5zWYJ611TwtGyAKam54qW7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K40BnbmW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K40BnbmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732725765; x=1764261765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWEL3zMhe55nAdjTPK2yaffnMS8UxjGu9YV64GYNR0c=;
  b=K40BnbmW2UgVDMSvV4DN1i21ta9PAIPIMQW5b6629g+gEDEOcUmElEc7
   jqPL7EWJTGuNBJAqIVXLsu2TlYnvZ/+ePQAiIxdLmy18T1UJ2vT7buzv9
   rsXr5mC6UoddtOSNkWBvvnuWeAS6opHWidDuHoxF8hF2zR1dPThNSynO7
   pt47OMCWpWKsAl1a5z1UVVaAP1WWnfhHbuFa6BUa6O+UMtGFGOfrnzT49
   EXiT6sUdq3vZModeWX8RMipPA0w7pscB2rUnxQjJ2S+3hK6bhfQQhCqhq
   gqv4NAvnK9d0NC3qQDB+j3v/YsvmWLpMKTL3aaNv5IZzV+2lPkry0d6EC
   g==;
X-CSE-ConnectionGUID: 25bn4qyRRhqDCBIdSH1pXQ==
X-CSE-MsgGUID: N5HkReFESauUKiRE2DG5Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="55437440"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="55437440"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:42:42 -0800
X-CSE-ConnectionGUID: 1SV2ZEt1R3GZwfqbNPsLvw==
X-CSE-MsgGUID: nhqT0YZsSbG5ReUtWC8XkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92462619"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2024 08:42:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGL7e-00089f-34;
	Wed, 27 Nov 2024 16:42:38 +0000
Date: Thu, 28 Nov 2024 00:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] mm/mem_reliable.c:345:2: error: call
 to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202411280009.pYeZw217-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4a0359af8c9d84ec3320a8a18f41c7fddf1f7a23
commit: 425771499c0742a996ab28df143d7a5123102686 [1540/1540] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-004-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280009.pYeZw217-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280009.pYeZw217-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280009.pYeZw217-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mem_reliable.c:345:2: error: call to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
