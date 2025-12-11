Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE673FFD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765415186; cv=none; b=jREDjxBrxvqkVN70JyNSFyxC9wHkJ5OCMnGq8efTSViviQX/s4q7ib7LvqWxzjDagYFk8dBiKNewI8KzMsLLmzZa0lX5ikxJNEKaNNJKMJT4GKINpB0M1KBf8pm46CxxdVWgwPFirSTibP0VjiiugpituniCpxtE2iJrS2v/Bjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765415186; c=relaxed/simple;
	bh=KXseSrluIHG/c/konUCPhT3//PE6S8YbY5M3qcxejbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Naa/f3aMOrE4WpeoZCHtgH0lE0sHbY4ALMLlqZwWdjWJtxYl8ISu7WtxoP2cwOLV4sCqGeEzqUKpycqVsnyqZSRc7L/k7X4wqKWYoUf2fh6xox1FFOJffEj4kuzF3H1j1Ds7HoiGFlEk4cG5olz5o5z88V0BOPuJEPEEadz0hm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E72BH4jb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E72BH4jb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765415184; x=1796951184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXseSrluIHG/c/konUCPhT3//PE6S8YbY5M3qcxejbg=;
  b=E72BH4jbsuHR4LH5C33ukSt8GgUkcofdtRvL+Njdly/4tmUix6XUu/Ao
   n3F/rBcvH5ZqD2Xc3Smfj8lLh4+Je6AySRT9GqN8fqLemReFsWKPsr+aZ
   By1Z4ogUx3/uxO/5kLILKxRSOdM4NUE3CD27cXOPH5oL01fvhIS3RCcYp
   i8T40cpKjuShFqtp0WDCstfwlr6BO9hEIqunb+Ghf5D6HEwikn0rbtLLi
   ht92BXqiDIe4oI/9TxSqJTBo2Uv9JlkrRVH41A7s3taWVsofWkCN2Jsbh
   /KEhJgfO31ypwMAyWvSdybAKyB8sCvEJs3XRuTDIoOTJe3LJbFjUmRpVJ
   A==;
X-CSE-ConnectionGUID: w3S8J5MVQYyphf3nX7mWog==
X-CSE-MsgGUID: utacLJD/R9u5QYJ6K2nn9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54940399"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="54940399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 17:06:22 -0800
X-CSE-ConnectionGUID: s78nYbmdQqCooRx4vsG9Yg==
X-CSE-MsgGUID: 9DCfRIStQ+m1LOSiXn4zYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196554221"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 17:06:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTV8N-000000003wP-0sI0;
	Thu, 11 Dec 2025 01:06:19 +0000
Date: Thu, 11 Dec 2025 09:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/5] net/smc/smc_sysctl.c:27:18:
 warning: 'net_smc_rmem_init' defined but not used
Message-ID: <202512110825.e1kQE6Od-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: 099d74fd4f27b175f1e9cb7186363ed6289cf95e [0/5] anolis: net/smc: Unbind {w|r}mem from TCP and change the default values
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512110825.e1kQE6Od-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110825.e1kQE6Od-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110825.e1kQE6Od-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/smc/smc_sysctl.c:27:18: warning: 'net_smc_rmem_init' defined but not used [-Wunused-const-variable=]
      27 | static const int net_smc_rmem_init = (64 * 1024);
         |                  ^~~~~~~~~~~~~~~~~
>> net/smc/smc_sysctl.c:26:18: warning: 'net_smc_wmem_init' defined but not used [-Wunused-const-variable=]
      26 | static const int net_smc_wmem_init = (64 * 1024);
         |                  ^~~~~~~~~~~~~~~~~


vim +/net_smc_rmem_init +27 net/smc/smc_sysctl.c

462791bbfa3501 Dust Li        2022-03-01  21  
0227f058aa29f5 Tony Lu        2022-09-20  22  static int min_sndbuf = SMC_BUF_MIN_SIZE;
0227f058aa29f5 Tony Lu        2022-09-20  23  static int min_rcvbuf = SMC_BUF_MIN_SIZE;
833bac7ec392bf Gerd Bayer     2023-08-04  24  static int max_sndbuf = INT_MAX / 2;
833bac7ec392bf Gerd Bayer     2023-08-04  25  static int max_rcvbuf = INT_MAX / 2;
833bac7ec392bf Gerd Bayer     2023-08-04 @26  static const int net_smc_wmem_init = (64 * 1024);
833bac7ec392bf Gerd Bayer     2023-08-04 @27  static const int net_smc_rmem_init = (64 * 1024);
1b91a3d3ea8cef Guangguan Wang 2023-11-22  28  static int links_per_lgr_min = SMC_LINKS_ADD_LNK_MIN;
1b91a3d3ea8cef Guangguan Wang 2023-11-22  29  static int links_per_lgr_max = SMC_LINKS_ADD_LNK_MAX;
43f2868a77048f Guangguan Wang 2023-11-22  30  static int conns_per_lgr_min = SMC_CONN_PER_LGR_MIN;
43f2868a77048f Guangguan Wang 2023-11-22  31  static int conns_per_lgr_max = SMC_CONN_PER_LGR_MAX;
0227f058aa29f5 Tony Lu        2022-09-20  32  

:::::: The code at line 27 was first introduced by commit
:::::: 833bac7ec392bf75053c8a4fa4c36d4148dac77d net/smc: Fix setsockopt and sysctl to specify same buffer size again

:::::: TO: Gerd Bayer <gbayer@linux.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
