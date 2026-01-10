Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87503155389
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768030119; cv=none; b=s4u5juY8SsQBnrvHgXNsixPNw2MAovorriPNByIZC8zNTGhV6DekyT9VuE4RTZYocbYyMKjUgFygfaCzh3GvPvEKVJs5QK12BhamBYLu5hOjD46MOn4fsjbNsVo+2E/frZ/gT1EVgudx2gkKsYp80Hw9femRwcKfig5dcVEfWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768030119; c=relaxed/simple;
	bh=pcXgOjN19rr0Ruzy2gf164Ess7oGyUWi6TJs1J+j24U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ozWmtnm6RLPmH00CpsvsrNiBDK3DnEPEdX8rMxxbdASMx3nF/kI2ttO7ex82HMXKlkpopEnHceIh80HVozk2FsVmm4NxGU2YpzSwPASR+d8GUQKGHYG3kQ90VE8bfoaB94rc9qdRUEI7XAfCec+1coFexpHOocqhamnaWjmtwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7eyBqMc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7eyBqMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768030118; x=1799566118;
  h=date:from:to:cc:subject:message-id;
  bh=pcXgOjN19rr0Ruzy2gf164Ess7oGyUWi6TJs1J+j24U=;
  b=M7eyBqMc4wq/5pmTG2gFemBd2TnjibfG3v1MDzhwKEqwmPHTe99opnKa
   1+tMfjDkoh/sOTRr/ci54WxEWbWX43mD3f6oHGt95lNG4QmaGRtcIZqIY
   ZdqqJfuVBbflVVAPFeuuxiQYw/LM3+vlgmr/tJti6nrFPhxCuVoj3RKnz
   I1U6318tO6pYP7Ez4lHSjz9LJbV4xR2T9hZ7bJV5071MwMDkkACn503Wv
   RDvQnlalwa5zl8Ssd25I2ubpr9yel6r+6SC7TEjBuf/XSR3G5gW1VR4ho
   dw+BNyGynkqCScsm8slsQlidW1RBAsMWhO2srg28xxWloipy/jhDteRZ/
   g==;
X-CSE-ConnectionGUID: KE6FwcARQdqRYAz7DHjKWQ==
X-CSE-MsgGUID: f+JRj7MkTeCi7XX1TJxKxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68402504"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="68402504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 23:28:37 -0800
X-CSE-ConnectionGUID: uTETkLSkRSiNbfJIE4NH0Q==
X-CSE-MsgGUID: s5bJGSw9T+6X7ucrM2iFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208134136"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2026 23:28:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veTOj-000000008Pg-2O5U;
	Sat, 10 Jan 2026 07:28:33 +0000
Date: Sat, 10 Jan 2026 15:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:setlease-6.20 31/33] fs/kernfs/dir.c:1932:27:
 error: 'generic_setlease_warn' undeclared here (not in a function); did you
 mean 'generic_setlease'?
Message-ID: <202601101553.yPV92Tvd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git setlease-6.20
head:   598d158c60458df0f87c3f292a14fded7f5ad7d4
commit: 1bbd4ddee91090a88766298aec112a6dd4f865c4 [31/33] kernfs: add a generic_setlease_warn() function and use it
config: sparc-randconfig-002-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101553.yPV92Tvd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101553.yPV92Tvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101553.yPV92Tvd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/kernfs/dir.c:1932:27: error: 'generic_setlease_warn' undeclared here (not in a function); did you mean 'generic_setlease'?
    1932 |         .setlease       = generic_setlease_warn,
         |                           ^~~~~~~~~~~~~~~~~~~~~
         |                           generic_setlease
--
>> fs/kernfs/file.c:1027:27: error: 'generic_setlease_warn' undeclared here (not in a function); did you mean 'generic_setlease'?
    1027 |         .setlease       = generic_setlease_warn,
         |                           ^~~~~~~~~~~~~~~~~~~~~
         |                           generic_setlease


vim +1932 fs/kernfs/dir.c

  1926	
  1927	const struct file_operations kernfs_dir_fops = {
  1928		.read		= generic_read_dir,
  1929		.iterate_shared	= kernfs_fop_readdir,
  1930		.release	= kernfs_dir_fop_release,
  1931		.llseek		= generic_file_llseek,
> 1932		.setlease	= generic_setlease_warn,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
