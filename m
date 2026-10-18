Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165C49AA4B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 21:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792359275; cv=none; b=L/0fEsKfpiM3bTOVsfivNz38f5dSJUXhezlplFGPJCRrihWz0J7swcvAslbv8dMVUGJzpXx8k7rsKlYnQ8MfA0S+rMFwxRJQ/YEH7EW1fP4HTkmh0Jyb4oTxY43S7KRg+RxuxGpi4fyXAsFpFOXyrTnn8rjNyxvyuhsEGmTwhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792359275; c=relaxed/simple;
	bh=sILxKrlU6kk/Q5vsvpnSUJsWGmz87wJJPwwILsUbLd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gfBhh1l+ibaPzU3qGCNEbUAkBNspDC3e8Is8felzJEpdclHR6hVXxRPaF3lHHq8U2qnFavp9WiDlCMT6ZgP29kFyvMChhfGt2an+wpXkPH651rXHbERFC797gqYVWICsGBindczsEI8ud9MEtwbmTqAibJer+77tLHe2lzbDRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPjWbN0H; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPjWbN0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792359273; x=1823895273;
  h=date:from:to:cc:subject:message-id;
  bh=sILxKrlU6kk/Q5vsvpnSUJsWGmz87wJJPwwILsUbLd4=;
  b=GPjWbN0HWmYOz2KhiREIk0hQ4lBmzS8gKj+BmsIvU4rI905qoLglfZPV
   0OvX8KuctIOHNNcpmfmQrNU1kTm3gXtUkgwKgngLIqKLD/WOD0jhp/R1o
   5wh22F+aMYAE+KchLrEZx2e5kLnaeaZgyKn1Wrk886KXXIdLlkoTxsLt8
   CmCpSd80qwlkT3S3ABgBSuEkXEp4cS/tmsKCBocHJr1jTBgnG4NZBXXzh
   mtsvi0kouJwiNLyawoSJt8899AvkMBCur+NZv+p4v8hVeq5K9sqhd0TsC
   XH0/Bin3WEXscA63oIe1U9I8Y5aMdVDWVjiI8W7QwrUBvEi31p1xjHPhI
   A==;
X-CSE-ConnectionGUID: W5N4by8CTUyCTPxh6m7yug==
X-CSE-MsgGUID: UF8kb3/cRMep80fX7Eq/rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1059260"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1059260"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 14:34:31 -0700
X-CSE-ConnectionGUID: j/4fstdGRiOWICPYr8G7ZA==
X-CSE-MsgGUID: oNEXQKR3RU6aoPca73+xjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2720812"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2026 14:34:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIYWR-00000000Kro-2X3z;
	Sun, 18 Oct 2026 21:34:27 +0000
Date: Mon, 19 Oct 2026 05:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 29/32] arch/x86/kernel/process.c:179:23:
 warning: 'task_kshstk_top' defined but not used
Message-ID: <202610190526.6He4UAyv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: 0d406ff1f7a5af1161792f0810bd786d75e57057 [29/32] define-SHSTK_TOKEN_MODE64
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610190526.6He4UAyv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190526.6He4UAyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190526.6He4UAyv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/process.c:179:23: warning: 'task_kshstk_top' defined but not used [-Wunused-function]
     179 | static unsigned long *task_kshstk_top(struct task_struct *tsk)
         |                       ^~~~~~~~~~~~~~~
>> arch/x86/kernel/process.c:175:23: warning: 'task_kshstk_base' defined but not used [-Wunused-function]
     175 | static unsigned long *task_kshstk_base(struct task_struct *tsk)
         |                       ^~~~~~~~~~~~~~~~


vim +/task_kshstk_top +179 arch/x86/kernel/process.c

   174	
 > 175	static unsigned long *task_kshstk_base(struct task_struct *tsk)
   176	{
   177		return (unsigned long *)&task_thread_union(tsk)->stacks.shadow_stack[0];
   178	}
 > 179	static unsigned long *task_kshstk_top(struct task_struct *tsk)
   180	{
   181		return (unsigned long *)&task_thread_union(tsk)->stacks.shadow_stack[TASK_SHADOW_STACK_SIZE / sizeof(unsigned long)];
   182	}
   183	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
