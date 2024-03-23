Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1FC3B2BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711202766; cv=none; b=GgvtCUAhll7+ZnhU8WDZDQuZGKsTBdGJ9flWayjkfy0N5HhNUlBMZyMcaD1xH7pk7J5ghezHG/SFIr+NgNiPkK9s+8CdNrKPiicuWPe0z7L4Ga4oorkypKFky2R3QUstEiwJbEmmD0g0J3AWxlay5lRs9Kow+qu6deU/5Eln3OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711202766; c=relaxed/simple;
	bh=mHOLCUWy8Lgye3XGCh6SO6sCa3QIHxIylOwfsa5GuIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6tgRF1IspAqdkolRcgCuglKDMA+ppsO4KCwIeLb77pZg79utnpKI5yLPg76NbsVoF3JCm/XeIx6ExTvOctuBs9OCa/x0M9SCIEkflUG/a+xjoblLsWlumrPwU+/1V0BGcEqPVfi9N6A4tOz48I/qWStophqvWv1u4opRbYZIJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk8mNyV+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk8mNyV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711202762; x=1742738762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mHOLCUWy8Lgye3XGCh6SO6sCa3QIHxIylOwfsa5GuIs=;
  b=Lk8mNyV+rknbQLD82Ev9fAPhRq4DnZJEZb7eI1iSxzG3LbNFa+hmIfZt
   98QuVpiorrbTST2zUVg6N8Gv5sNUO20eArtJDDScl6t1TTzmuzPEfIuvZ
   s1Xchf1saBBbKByPgzef/u63xIgo5TVj2UWB4fWKw2Zt6KI6YFeq5KC/b
   yZXmnBQ3qjJa4E+Z4/Gp3Kg7MHTt0x368p0i6ZCclcLXm5SkYWapikiW6
   uqxuKfZW/U6epS3W2Zvz475CYvyRUeA6YfLjBryk+JtIAO/jq0+1E721L
   FhS/agwHxq2kxTq4xyRqxviPmIb4RFUc8/8t9cvDyAyn97gWE6fxeTZYs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="16881514"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="16881514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 07:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="19861765"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Mar 2024 07:06:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro20U-000LCt-0i;
	Sat, 23 Mar 2024 14:05:58 +0000
Date: Sat, 23 Mar 2024 22:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20947/21930]
 net/netfilter/.tmp_nf_nat_proto.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202403232115.AU4CMSAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   25bf6ba385a44e446068067e861e1b843f6174e2
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [20947/21930] netfilter: nat: remove csum_recalc hook
config: x86_64-buildonly-randconfig-004-20240323 (https://download.01.org/0day-ci/archive/20240323/202403232115.AU4CMSAJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403232115.AU4CMSAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403232115.AU4CMSAJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/.tmp_nf_nat_proto.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
