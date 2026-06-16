Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C262E7376
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617894; cv=none; b=LqP5M8qawkvsY6B0Nh1Ec4ydkF4JVtoC7abNoeN0Vh1S/4WSs4s7HqIdc1KNgsIQb7FA5I/TgpHKDFmYCKvxMyY1kjzQKmApuiyM7weo/Rl49e++lBXNhxLMqheJ8V7MUmA35gpVBlwdW9PAX1asD9rIXq+6v0Z9b2t7Q3iIR0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617894; c=relaxed/simple;
	bh=mN3HBa8HLWzTZahmdLJ1OSgAikpDmhdQ7syE3KqLBLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sXmY4bwKxy3HyDsvpbnrwZCEx14oPF5fYpeZurbU1zkJrlXSrjv8my+a4eJqtjxiagYjbV13NnRb/rIxB2FeUvJUeOKMok6rroGqNTxI9sTjzeDnIAK7lgtDBLaSXzV+/6Jtwpdft95Xifb5L5JewCQLp45rJqfWoB76GSZ3ZqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekGwxwLY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekGwxwLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781617893; x=1813153893;
  h=date:from:to:cc:subject:message-id;
  bh=mN3HBa8HLWzTZahmdLJ1OSgAikpDmhdQ7syE3KqLBLo=;
  b=ekGwxwLYmBVItE9nRaky8mlhjS1ncoww5/5/3roPH/N5xxyzJLvYVktb
   vmJ/QcmywpivgrnfzATUCXvYSrfa/K52+O3RS55zgcgfIeVP71oicGpnU
   nNRCN9PevbmOzXHoqiEUF9pFWsOQxkNDuHQCLEMyg7ZjmXCaeBsJDwglb
   LXjL7eANwEZt5OUlHofa4nkjwmx9biOjVMbqALbgeUWEOKmgq9xb3Vfaa
   21OMAdEQIJWifSomSUu8V6CUra3RBA3yTLBEcNItZGKAXL4io1s7LSAtY
   mMMJbgnc8Y7IBILKPmpdT4MaG3oK5Vg8WZjn6bK9mdqa6VpwXZZfxDJz9
   g==;
X-CSE-ConnectionGUID: mRWdv6hHScOVlVrGjNm4wg==
X-CSE-MsgGUID: x4j3Tps4SRWXZkG86qjmeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82368551"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82368551"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:51:33 -0700
X-CSE-ConnectionGUID: J1nuguoqSVaDPTLraka7IQ==
X-CSE-MsgGUID: +BfXv2lPTQKKOaiWnGgdyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="243411873"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jun 2026 06:51:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZUCO-00000000TEQ-3oGA;
	Tue, 16 Jun 2026 13:51:28 +0000
Date: Tue, 16 Jun 2026 21:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 12/12]
 security/apparmor/policy.c:116: warning: Function parameter or member 'kref'
 not described in 'aa_pdb_free_kref'
Message-ID: <202606162142.lZf2XQny-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6a42fccfc2bced5291d91b45c2e71a48b1a09ab7
commit: 32928c1749e8a0162b168a5bb87c1b67e37281ff [12/12] apparmor: refcount the pdb
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260616/202606162142.lZf2XQny-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162142.lZf2XQny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606162142.lZf2XQny-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/policy.c:116: warning: Function parameter or member 'kref' not described in 'aa_pdb_free_kref'
>> security/apparmor/policy.c:116: warning: Excess function parameter 'kr' description in 'aa_pdb_free_kref'
   security/apparmor/policy.c:881: warning: Function parameter or member 'subj_cred' not described in 'aa_may_manage_policy'


vim +116 security/apparmor/policy.c

   110	
   111	/**
   112	 * aa_pdb_free_kref - free aa_policydb by kref (called by aa_put_pdb)
   113	 * @kr: kref callback for freeing of a dfa  (NOT NULL)
   114	 */
   115	void aa_pdb_free_kref(struct kref *kref)
 > 116	{
   117		struct aa_policydb *pdb = container_of(kref, struct aa_policydb, count);
   118	
   119		aa_free_pdb(pdb);
   120	}
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
