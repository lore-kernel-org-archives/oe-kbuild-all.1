Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F72FE2E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfrNl1SR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699563013; x=1731099013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qEkTB2XDUI0FKh91zSZ010xzzkEFlr00Hv21Ko8WQh4=;
  b=kfrNl1SRAY381tFEi6ATtpZhRkStZFQanyGY7r+U3Ox5g86vOafSfPvs
   g+k5wKSNpcKZTuVJICWHgRacpRuQu567g6Fhdsh1ueFd9ZqXMWIkYAseB
   fNJ6EPP/SCy6mImLqI1vCx3RG/jNzp28HaoFZck9nIKkgnDAUbaDx1dDh
   cvuarKUV2wQZRLJT169f+jBvvzMGg8hIfJKvl4jAsrAuTqwH7Bb1AbGWI
   c0YZXJqFfKG8Kl5Vnk4Zw7RfPu3c6CCsJw5B1BNy0AsQ0mSUN4tkrPnoP
   /1/gYP9lc/mCVpy72tOTiVygPE7flXsbUitp6Sgh9aXKls5UR5WVRjysI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="370279942"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="370279942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 12:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792668640"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="792668640"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2023 12:50:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ByZ-00098g-1c;
	Thu, 09 Nov 2023 20:50:07 +0000
Date: Fri, 10 Nov 2023 04:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zach O'Keefe <zokeefe@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/khugepaged.c:747:25: sparse: sparse: symbol
 'khugepaged_collapse_control' was not declared. Should it be static?
Message-ID: <202311100404.GhXGWRFN-lkp@intel.com>
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
commit: 34d6b470ab9cf3a038f9bcd0f8cf09016a2e6fbe mm/khugepaged: add struct collapse_control
date:   1 year, 2 months ago
config: i386-randconfig-062-20230909 (https://download.01.org/0day-ci/archive/20231110/202311100404.GhXGWRFN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100404.GhXGWRFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100404.GhXGWRFN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/khugepaged.c:747:25: sparse: sparse: symbol 'khugepaged_collapse_control' was not declared. Should it be static?

vim +/khugepaged_collapse_control +747 mm/khugepaged.c

   745	
   746	
 > 747	struct collapse_control khugepaged_collapse_control = {
   748		.last_target_node = NUMA_NO_NODE,
   749	};
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
