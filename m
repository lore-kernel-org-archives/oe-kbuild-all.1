Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696A38A29F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 02:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048253; cv=none; b=TdehMpFemP9x1xxg15YEqDYT7QDrVieR9O4vQ7TGb2cGuF2bZHsf+MCcXJuJ7bQ4uCA5nAcU+ZDCU8o1Xy8/5CmqKgcBwvIr7dNCD0NBhLFi26ip3QjrZlmFZdzrOhiEA0T3+xHPfb3lFQUWFMqYEpcclaiKxJwb+UPJvkVhOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048253; c=relaxed/simple;
	bh=cvjWFWlBQgp7/Q0xKa5GlDVwHf6Kn7xfWmFdxxQMO4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SMqCutskvSZf3eAkf/8uFSFo3JAm2UgyjmUNYhOtRNGEfLezfXKCrnT9jVcUkCXTCVBU6UINEEsophWncIRd7n9DBZhJqN5nJ6QHy0/dz1afNMdn+XyCBa9aNixos/iwhhc5UuHFOCNfJI9XctuUMViaww0AHCJro93Otr7u/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/Be1jR3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/Be1jR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769048252; x=1800584252;
  h=date:from:to:cc:subject:message-id;
  bh=cvjWFWlBQgp7/Q0xKa5GlDVwHf6Kn7xfWmFdxxQMO4k=;
  b=m/Be1jR3z4Sj51IGNiXt0bCs3XccTqeSaRBGY3T26sHrfaJR8lT9TY8t
   UiVzpdu0WtUxeIcTedVqA9mMyNgYvaJnXZU2gIgtG2zCmS2tS57TwaI0Q
   DEKSEoTW4sC1SU7DbQTvT/5lrqdzg6fxJy3FcuiKFRyIeRfPc/mOOhG69
   0aTq1BSog0VsXsAaXKeXxSM1iPO+pd6uf3nEZkO3czeIk6DcpVCHPmcmO
   sLiEW5E299mbTsBDFdVMc9ewY05Qud7vKAzQAdsfdkhoErX5LG9p+GE6Y
   Gd6tbmqCWeSFgSBstYTmESaw832M3bE1+/rSSTmAC5fvjxeiGCqWGVcGE
   g==;
X-CSE-ConnectionGUID: TzaeB39EQseylNnRJUcdZg==
X-CSE-MsgGUID: kwNbvpMgQVmDfpk+PhyPiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69483943"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="69483943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:17:31 -0800
X-CSE-ConnectionGUID: bc1Dr+Z0QqGtOVogrIMbrQ==
X-CSE-MsgGUID: 7UxHncIGSyubR8oHOy66vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206513422"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 18:17:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikGD-00000000SJP-2eR6;
	Thu, 22 Jan 2026 02:17:25 +0000
Date: Thu, 22 Jan 2026 10:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 28/31] kernel/rseq.c:779:24:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202601221057.fyl6X39T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   81b74125144d2db6f40a345b875f085addbcd230
commit: a21cfe63bfa6e2ce8db20196438f85d97f00cd93 [28/31] rseq: Move slice_ext_nsec to debugfs
config: x86_64-randconfig-r113-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221057.fyl6X39T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221057.fyl6X39T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221057.fyl6X39T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rseq.c:779:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *s @@     got char const [noderef] __user *ubuf @@
   kernel/rseq.c:779:24: sparse:     expected char const *s
   kernel/rseq.c:779:24: sparse:     got char const [noderef] __user *ubuf

vim +779 kernel/rseq.c

   773	
   774	static ssize_t rseq_slice_ext_write(struct file *file, const char __user *ubuf,
   775					    size_t count, loff_t *ppos)
   776	{
   777		unsigned int nsecs;
   778	
 > 779		if (kstrtouint(ubuf, count, &nsecs))
   780			return -EINVAL;
   781	
   782		if (nsecs < rseq_slice_ext_nsecs_min)
   783			return -ERANGE;
   784	
   785		if (nsecs > rseq_slice_ext_nsecs_max)
   786			return -ERANGE;
   787	
   788		rseq_slice_ext_nsecs = nsecs;
   789	
   790		return count;
   791	}
   792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
