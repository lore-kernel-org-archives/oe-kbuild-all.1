Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAEB1DA20
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7cVDssg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699532313; x=1731068313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNr67NOFJTWsqVJbBxekluseStnG25WOCCJrnVSzJSs=;
  b=g7cVDssgDuavU7rgZ/WNjQN8lsPIycdoQvLSHepVbqvdpgV9OVD+UmQF
   CXz8urJ8n13SJNRL8Ic+haRy+jp5VE9o8jgw5Hb6Jpbf4f3VTKxrgXSw9
   Bdl9YrGBJ2cfJFr9Zlc+RBLnkdXf2P2YUh2vWlO18DH24X8Kmnz7Pf9sc
   slfQIqJdARwQEYUsUStObSTpS9cIyvKGokyrtaQ0nStHfwOeA0QGRzrAP
   aV5cFXXfgqpAeU2ur78d8ir55hiXOZa4bD6kTronX/TNGVLtaDg+ZeGTb
   pG2gAQVHHP72ZQ90uLmIKDuD5D62Kt6Z3bleMcDzdyeZQKHiGoI54bEE1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="11523440"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="11523440"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 04:18:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4708954"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2023 04:18:31 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r13zQ-0008i8-2g;
	Thu, 09 Nov 2023 12:18:28 +0000
Date: Thu, 9 Nov 2023 20:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: security/apparmor/lsm.c:1893:15: sparse: sparse: symbol 'nulldfa'
 was not declared. Should it be static?
Message-ID: <202311092038.lqfYnvmf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc986ab839c844e78a2333a02e55f02c9e57935
commit: 98b824ff8984fd523fc264fbb13208098ab09da3 apparmor: refcount the pdb
date:   3 weeks ago
config: i386-randconfig-062-20231104 (https://download.01.org/0day-ci/archive/20231109/202311092038.lqfYnvmf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092038.lqfYnvmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092038.lqfYnvmf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/lsm.c:1893:15: sparse: sparse: symbol 'nulldfa' was not declared. Should it be static?

vim +/nulldfa +1893 security/apparmor/lsm.c

  1889	
  1890	static char nulldfa_src[] = {
  1891		#include "nulldfa.in"
  1892	};
> 1893	struct aa_dfa *nulldfa;
  1894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
