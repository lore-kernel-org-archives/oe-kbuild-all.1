Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51433B6EA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059799; cv=none; b=JsS5T8ACwKZp1AhCx3K/1QvMGaLs5kEd3AGVHsqQra/D2x1ffmB1YgKhFdoV5M+AAyO8FKDMoC7NJr/UiYvN3rtUR+1RwgqCQKAUPHKdB4OmJfL0/Snont+HkXvKt6tyw8bSSCCHuXm4gsHA1+2Juhw4Edbd23bMtwh9xvrsh+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059799; c=relaxed/simple;
	bh=8o72i3Lc0Ho208mTiXv1/usXLYG5A2vHHsszlyWI8Xc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DjwIdF5Eahn+HyFEVT55pCDMZLv0sVOzH+2balGZyvpcLkGImILFhtlZTBCd+Kq6OiMt0ogqtM9PRpoyVji9w7EJ3NyLSoxNv4T2N6U39PgHh19LZ5tIvhhOEd5r/28yX68q6QImMZ2brINvZjElZrNM+yCkl3fzrEHqOZTbUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fefynxjh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fefynxjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783059797; x=1814595797;
  h=date:from:to:cc:subject:message-id;
  bh=8o72i3Lc0Ho208mTiXv1/usXLYG5A2vHHsszlyWI8Xc=;
  b=fefynxjhaD+QUBdgu8zpmRzgsyXgdOSCZ+LsDj80V7Zj96h6ENFiiF0t
   QvIPwaJ491v7Ljitd6b9F+iX2W1I+W2W+c46e3R2ZLMktaJX/XOcsZWqc
   nM6oyzumpjGg+LhDOrRwWil8SdnivBelhs+hCBvbH60jiqJbZlS6Np2y6
   yW4dm87iAOB/AHS5AtqhGE6W+nXUU3QKVMLklt20TsaTDfJPAuSH35EJ9
   XXE3cVHHIOAWya0jipm8zz2OC/k76dPqDGsDrOxQDY2JuQUenFerROPNa
   shhLxUzGvfkIkAMIFVwpsH6WLGUgyLG+jckSBlFwLTN7E38o/Dlhp23hg
   A==;
X-CSE-ConnectionGUID: JoUPa4FqS/CUjr6lwjaNgg==
X-CSE-MsgGUID: rHQE2mfDS+OQSx9xqesJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86354598"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86354598"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 23:23:16 -0700
X-CSE-ConnectionGUID: lZpvyeFARr6T8M1XXFeU8A==
X-CSE-MsgGUID: 0NYekiniSHmzlVAMMw+mpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="254953430"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2026 23:23:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfXIf-00000000Bkh-196Q;
	Fri, 03 Jul 2026 06:23:02 +0000
Date: Fri, 03 Jul 2026 14:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock6 35/36] arch/x86/kvm/x86.c:10237:28:
 warning: unused variable 'tk'
Message-ID: <202607031429.g83v1Wyf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock6
head:   e1c11e713bdc894d3acf634c88c78c65706e12a1
commit: a1e0928f3dd8d0151f2c55215bdb6717f95c1e40 [35/36] KVM: x86: Remove pvclock_gtod_data and private timekeeping code
config: i386-randconfig-r051-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031429.g83v1Wyf-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031429.g83v1Wyf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031429.g83v1Wyf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'get_kvmclock':
   arch/x86/kvm/x86.c:3304:1: warning: label 'fallback' defined but not used [-Wunused-label]
    3304 | fallback:
         | ^~~~~~~~
   arch/x86/kvm/x86.c:3243:39: warning: unused variable 'hv_clock' [-Wunused-variable]
    3243 |         struct pvclock_vcpu_time_info hv_clock;
         |                                       ^~~~~~~~
   arch/x86/kvm/x86.c: In function 'pvclock_gtod_notify':
>> arch/x86/kvm/x86.c:10237:28: warning: unused variable 'tk' [-Wunused-variable]
   10237 |         struct timekeeper *tk = priv;
         |                            ^~


vim +/tk +10237 arch/x86/kvm/x86.c

3f804f6d201ca9 Thomas Gleixner 2021-05-06  10230  
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10231  /*
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10232   * Notification about pvclock gtod data update.
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10233   */
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10234  static int pvclock_gtod_notify(struct notifier_block *nb, unsigned long unused,
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10235  			       void *priv)
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10236  {
16e8d74d2da992 Marcelo Tosatti 2012-11-27 @10237  	struct timekeeper *tk = priv;
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10238  
16e8d74d2da992 Marcelo Tosatti 2012-11-27  10239  

:::::: The code at line 10237 was first introduced by commit
:::::: 16e8d74d2da9920f874b10a3d979fb25c01f518f KVM: x86: notifier for clocksource changes

:::::: TO: Marcelo Tosatti <mtosatti@redhat.com>
:::::: CC: Marcelo Tosatti <mtosatti@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
