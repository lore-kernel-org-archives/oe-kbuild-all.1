Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF7623F38A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 21:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740778796; cv=none; b=ZAQ1APWoWCARqeksxRN0fDfOf6WGvIqf0+SfvBeg/09TbQJKcTNZQKCO8oHbOXBFk5beM/bl5PkBi74nhvaYvXxurQD83NQLjsSFcjQ26DjcpzRNh3MtOTTEIAIejZhXbaZHE7up0Z31GUcxXrbC3thmzx8tjvegt49hU7kEnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740778796; c=relaxed/simple;
	bh=N+LAKMFwGFE8Qvlo5zO4KhMjc9Syf2RW0t+yPMtoZUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8txCzQbNvQxd7QX6uEjWfFIbl4lvCHai5ZhIb2JBA3O/kHhLxYQc2mtPbWMjLEv4VcENQE1p+45FGYR2xc2YCCFyo/8KxwAtE2kdb4NlEp5i1rBF+DnJvhHTxzQ2mLd+3+g8M0Pk0YH5+pFF7Z6ZTu1yAmZnjydzkSDD5fZVZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWagaAwt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWagaAwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740778795; x=1772314795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+LAKMFwGFE8Qvlo5zO4KhMjc9Syf2RW0t+yPMtoZUA=;
  b=ZWagaAwtoSWgd35bKf0dM8T3OQuM1CwFe6TXlQX61XWWfA2uiqGKO6pj
   q28KFP/58jPMPb0I83aA+0nTVh4v1Y5TStG664yUhlq2WDeYtrMmfYQfw
   O0TNXtSU7MjjPzddSeLXidxxcmm7g1SlZeP9ze2a2iqpAGp00xQaOmTVB
   Ro6cZEtRNCayuVZtS2Y1TuwHGp0tHpFpWBMzDX+z3lqNSYojlir0ZCozq
   lC3FJh86VnItwmUbIaeUvp2o16f1prG35YGew6dhNPiFFDDHx2cw60jhZ
   4Th5ukcA+mTlBXKPBs92GxEvUFt9JoYNTEJ9oy0R3w8YVZsvMGp9ZWNAd
   Q==;
X-CSE-ConnectionGUID: IjkTySq6TRSeksnZy67alg==
X-CSE-MsgGUID: uGF5cdTcTb+bt2C0Iz069A==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52354513"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="52354513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 13:39:54 -0800
X-CSE-ConnectionGUID: hlWihSY1SO+CQQwyNLHMtw==
X-CSE-MsgGUID: 9Tm8Dc3KRoK9n5zO64c4qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="122581027"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Feb 2025 13:39:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to85H-000FXi-12;
	Fri, 28 Feb 2025 21:39:51 +0000
Date: Sat, 1 Mar 2025 05:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] mm/unevictable.c:501:30:
 warning: 'del_proc_fops' defined but not used
Message-ID: <202503010508.5b7c8Vxt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   b546d9695894905e1bc9de7646f89b06dbeae968
commit: 9eee07ca21b4bcb78a9e0092696f13a0b3db291a [0/1] ck: mm: Pin code section of process in memory
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250301/202503010508.5b7c8Vxt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010508.5b7c8Vxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010508.5b7c8Vxt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/unevictable.c:496:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     496 | const static struct proc_ops add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:501:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     501 | const static struct proc_ops del_proc_fops = {
         | ^~~~~
>> mm/unevictable.c:501:30: warning: 'del_proc_fops' defined but not used [-Wunused-const-variable=]
     501 | const static struct proc_ops del_proc_fops = {
         |                              ^~~~~~~~~~~~~
>> mm/unevictable.c:496:30: warning: 'add_proc_fops' defined but not used [-Wunused-const-variable=]
     496 | const static struct proc_ops add_proc_fops = {
         |                              ^~~~~~~~~~~~~


vim +/del_proc_fops +501 mm/unevictable.c

   495	
 > 496	const static struct proc_ops add_proc_fops = {
   497		.proc_read  = proc_read_add_pid,
   498		.proc_write = proc_write_add_pid,
   499	};
   500	
 > 501	const static struct proc_ops del_proc_fops = {
   502		.proc_write = proc_write_del_pid,
   503	};
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
