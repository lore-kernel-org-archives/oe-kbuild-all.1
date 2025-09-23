Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D13C17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758585781; cv=none; b=Qd4Hq27iHh27bTYQANuS2IpNZz2OzHI4/aDJLqJXumcj4Z1jaZ8MBcEL+3WEZoCtPp2dd35r11Vs8/8UhSLzt0IqxybFryRHI/I63JwelF1Bd6+E2y014v6Ud9tmYzi4SrAfozms+yG/L7ATnj7zRxiWr+J4d/sG7YPxNLj8ZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758585781; c=relaxed/simple;
	bh=E4sG/m0Wq+B6BOil/MCqZCqMsuWQmezWYMXt0LGKAnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OR+ZHOjCqCX3INRrZ0Sj8FjyvfcyOkCPqPFv0wOJNbZkhqksqhQk05gra2efg8hls9w0/GsfMmij5Q3/JaxEeM91AaOwiwd4dun2NzwyIxDAAxmq6AnUymR15lo5B5qTz9/EilmnbkVVlOhJVmdnzjUlkNRDcyYlJoJ+sI7a1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XU5dI/V+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XU5dI/V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758585779; x=1790121779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4sG/m0Wq+B6BOil/MCqZCqMsuWQmezWYMXt0LGKAnU=;
  b=XU5dI/V+Mkmt/RPGtUsCwzvkl5VRz67QlsrGU2woFG4riXivLMuI1QPp
   9PhML23zPqEiCqqO3tQKqSiiSxxfTKvhWy+rS1XQn9H1OCax8lWv5LhYz
   9XHBEgtC3CQt1dGgLf1cgydQvKg8hCLHbuZw/wr28tobKyegjoQOYKY56
   N19lsiAcWl+GULapW0m0AdB7c7N2IMsGuy9aFYIZF5EbYywN8CheaINsb
   GjAcOt1H74At5e1Rakw7wr1CEFVvDvIUCd1Y/SJzkRA+DiYKHNyDemxwJ
   gjCoVCY7iFhOAVt6Q9Plklq8d6Vw6H2K14lY4/7bAT0fta/ofeHBsJtM8
   Q==;
X-CSE-ConnectionGUID: X/CWlsyqQ3+QXmSJ3+AgsA==
X-CSE-MsgGUID: PTTsK+R0RhemVRAMaK7rgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60915646"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="60915646"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 17:02:58 -0700
X-CSE-ConnectionGUID: OUKO2BfNRuG5GE2i6u1LZw==
X-CSE-MsgGUID: yVizfpYDQ1+ZQ5wwvVRe6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176985457"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2025 17:02:57 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0qUh-0002ZX-1M;
	Tue, 23 Sep 2025 00:02:55 +0000
Date: Tue, 23 Sep 2025 08:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909] mm/mem_reliable.c:345:2: error: call
 to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202509230718.hDzgcLLM-lkp@intel.com>
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
head:   a159deb279dfe156316d8c3957dc7f253686ff83
commit: 425771499c0742a996ab28df143d7a5123102686 [2909/2909] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230718.hDzgcLLM-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230718.hDzgcLLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230718.hDzgcLLM-lkp@intel.com/

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
