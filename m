Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9BC1F3BB5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 02:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753064262; cv=none; b=dOjwMWBPx+ii4/diUdrQY1CC46W2qDo3OPqIpaQ2Lo8TDEcd3Tg5RZPDoNZ1aHhI66b1dpcN4RTJN+sTy5BSR4vANiZsTwCbW/tjV3eebFwdLSHMV276f4QgJkYjJh1M0SHSxW503tQvPhi1j6wvrL1ETXc2LAl8Icyopx8t2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753064262; c=relaxed/simple;
	bh=id1eVoL9ZodGK2uIXEqLcu5PhSCOghhZhMTAEX3vApg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lh3dzR0Gu1pZRi+9fbcXvbOZB/dnlRIlD/Xva4EGOPSbcWk9GQP0NPql5nhhcxdm5SjQtXA2V3E4BAZZiVbizCqhL9+dscSwtWkgajW7cqtjQ1HR+mHlp0T6iwEDYlnsxwzyMgJwr3Hxwb3Ay0ZvVjTrYaLd7GVFQv4sKMqiIXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qou9ELEF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qou9ELEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753064260; x=1784600260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=id1eVoL9ZodGK2uIXEqLcu5PhSCOghhZhMTAEX3vApg=;
  b=Qou9ELEFyeXpAaNllha6KWw8JP/WhXjj7rXYa5CYv151x34J50sqRw5u
   7SiXu67CA1LCYgp8zVAQc5Wp8gizxx0gKg7SkFl3Xig6y19EdU/LmpzMl
   cDQNnra35GQfc7H1SbW3m0EV2SlBE7VD0CRErbhJ8Dt3MdRXuhhQ/uzFE
   pULv35hqu5LpAHQRM3UnmSCt5ivikJ3jWbnhxtWVRvG9TUAiBjNEMKmaY
   h5HJajIHPxYlMa+FV3Np5m7yMelXOtToLAPVAIVpAjPBnCXov2K5rLBey
   pEO6VcG7T5h7JURRtcSppQ4/qfvDj/CVYqBbfyDIDPNqapgf/vv73/j2h
   Q==;
X-CSE-ConnectionGUID: cxOoyAFLSNGBqDNDXClTRA==
X-CSE-MsgGUID: r3qQbjh9RmSSC19OIO86LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="42893083"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="42893083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 19:17:39 -0700
X-CSE-ConnectionGUID: tXdoTjl4SEuSOqxR+rlYJA==
X-CSE-MsgGUID: AQSnpybwTRy4gYYBwT2bsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="159241020"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jul 2025 19:17:39 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udg5w-0001KX-22;
	Mon, 21 Jul 2025 02:17:36 +0000
Date: Mon, 21 Jul 2025 04:17:11 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1]
 fs/proc/meminfo.c:37:30: warning: variable 'sunreclaim' set but not used
Message-ID: <202507210441.Cb31OObP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   4d8e1d27db152f18e8e9064c37d1fa993f4d7e77
commit: eedf4ae2be04591b38a81690ef85cefd83b78cb3 [0/1] ck: meminfo: Add meminfo support for rich container
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250721/202507210441.Cb31OObP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210441.Cb31OObP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507210441.Cb31OObP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/meminfo.c:37:30: warning: variable 'sunreclaim' set but not used [-Wunused-but-set-variable]
      37 |         unsigned long sreclaimable, sunreclaim;
         |                                     ^
   1 warning generated.


vim +/sunreclaim +37 fs/proc/meminfo.c

e16e2d8e14a14b Joe Perches     2016-10-07  32  
e1759c215bee5a Alexey Dobriyan 2008-10-15  33  static int meminfo_proc_show(struct seq_file *m, void *v)
e1759c215bee5a Alexey Dobriyan 2008-10-15  34  {
e1759c215bee5a Alexey Dobriyan 2008-10-15  35  	struct sysinfo i;
e1759c215bee5a Alexey Dobriyan 2008-10-15  36  	unsigned long committed;
61f94e18de94f7 Vlastimil Babka 2018-10-26 @37  	unsigned long sreclaimable, sunreclaim;
e1759c215bee5a Alexey Dobriyan 2008-10-15  38  	int lru;
e1759c215bee5a Alexey Dobriyan 2008-10-15  39  
eedf4ae2be0459 Xunlei Pang     2021-06-04  40  	struct mem_cgroup *memcg = NULL;
eedf4ae2be0459 Xunlei Pang     2021-06-04  41  	struct sysinfo_ext ext;
eedf4ae2be0459 Xunlei Pang     2021-06-04  42  

:::::: The code at line 37 was first introduced by commit
:::::: 61f94e18de94f79abaad3bb83549ff78923ac785 mm, proc: add KReclaimable to /proc/meminfo

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
