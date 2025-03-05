Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B8A32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741135390; cv=none; b=igP/w/Rw2KRo1dzQzOM4sYrvbUCEzUjR02CzBfV6tBlzN27aIIo0otVsk97gZ1TtFxW7AGyJXD2iyb/fcr26Kuasj4q+fl+eUZ0iclPn/ESAexgCl9IgV2+oZF4UKgCWr9pRqufsozWVgFxYoxEaZRQeCOcmQg2CiVZGOUBzxGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741135390; c=relaxed/simple;
	bh=28cAZQCp9zK2evGCFPFUivOsWuNhednSahCsVE4hEMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+LwbeARjqE9ofjReKYZCPyhODm7v6JyGN/7GIKboZndLcAtktoQFNZq3Rfit/WaV3mXc77PUKwU76Xe0YdjeH7jmtNh2e8UfQThqWVpkuxszO2TKrhlbSTReEQm5H9Gc6qusI51r/SS5av9ssdF3V4gWzGPfkj0NciJZhSIJJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuMLD7GZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuMLD7GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741135389; x=1772671389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28cAZQCp9zK2evGCFPFUivOsWuNhednSahCsVE4hEMo=;
  b=QuMLD7GZ9MxUoVB2JU6e12hB0hz1o3pNyF3+Tm6y/YkJK4NXfnK4KmtK
   RVzPSVSmevCyRZRVTdfgR5C/gEMi65eHicolYAYomnEI687RKl3a2nqXz
   N5GB8h8Z1j7SrxPGHVwTeMbtudI5sQAv769ll614f980hh+qRZ1+jyb00
   rhVXhMPy6q6OOk6pkmdAV7zTz1OvEKBmiJXlx59ou1qVpmafM0+/30/J1
   QkoL+MyxN/l71TJEN/wlPONTtnIRnLtes0ZW6JHRQcRkmTrufgLDr5lNL
   RFIw/DDLGGqqM5X9EItJSJUXlG+or1V4FhPCw8r9A4/so8xD9KER79Riz
   Q==;
X-CSE-ConnectionGUID: h2hpSAlWSKuvTdfHP/jv9g==
X-CSE-MsgGUID: kuxLYZH+SfCn60ojaIBc4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53480786"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="53480786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 16:43:08 -0800
X-CSE-ConnectionGUID: jwSBPUueS1ORiQjcKoH0hg==
X-CSE-MsgGUID: IBFcq4MhTWyd9T9M2Vg2zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119428726"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2025 16:43:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpcqn-000KQS-0P;
	Wed, 05 Mar 2025 00:43:05 +0000
Date: Wed, 5 Mar 2025 08:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:timed-may-goto 2/2] vmlinux.o: warning: objtool:
 arch_bpf_timed_may_goto+0x10: call without frame pointer save/setup
Message-ID: <202503050838.lBJR5D7N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux timed-may-goto
head:   3fbb9ca619e9a0f83a12e1cb356dd8be574fa6c5
commit: 3fbb9ca619e9a0f83a12e1cb356dd8be574fa6c5 [2/2] bpf, x86: Add x86 JIT support for timed may_goto
config: x86_64-randconfig-161-20250305 (https://download.01.org/0day-ci/archive/20250305/202503050838.lBJR5D7N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050838.lBJR5D7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050838.lBJR5D7N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: arch_bpf_timed_may_goto+0x10: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
