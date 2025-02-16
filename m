Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B1E17BBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 04:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739680582; cv=none; b=ZexifAWxlxEsBT07FRMc1+58zBDwr30UeHqxn0WGiEmQWvSu7X465TODguoaY2M7bz6YePUEXbiJerexyfVc/VgxKEd18F7rdRPxa/V8l9TCUBafwH2SCW3QUlYBd81Pt78dupfRqQoRscL9sx3fEVjN3/G0lSk5wyPuGtO5fJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739680582; c=relaxed/simple;
	bh=cUXmX6kF8YlD2gDzQuL7H11zkMyHDzmW27TRhcoKQC0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a6oRiTjJu7cPNbrG5Gi/1pCsuxWHX07owwCRD+8E0lMpvrNDHoJWsicMvl273FbC1EQRdEPwQtzE5EXdl2O7lu40BjDlaGz/IX+mmBg+ryPY/mR6BJWclqb6wNp01/h8w23kdsxIeW9fIdSoYSDyMGVyLzA/ud/8mCdQ5Sognks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sq3njqhV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sq3njqhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739680580; x=1771216580;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cUXmX6kF8YlD2gDzQuL7H11zkMyHDzmW27TRhcoKQC0=;
  b=Sq3njqhV6MTbdExRJfSO2QHaBVRWZ8GLos4VkZ+wvUlt/whDgd+Ffh+z
   Yp7FIgs1FeLCMkSv4n7lhj0jkoA8BrnuSuZqfr32cTir/92ixgmzfQwei
   qQjkNzSMXg0/L6vhPpwv+vFcoS6oYKkiOL6K0XTYn/nTRcMdoerAzxPW5
   Xbl/I3S1jtjn5GfrGDKm3vHP6m/N/SrIwvmnF0WshYQEUsjlG4vbP6nxe
   470fniB+p0sHdjlz6n83yMfSBxRJBuLm8jWSIaO2TxkIw+WZeoGPjvboQ
   yB1f7aFIWSmf4WdLWPTJ/KfCNITh/uopZNRjdGzWzKs4Bfu9l5nsb9OAY
   A==;
X-CSE-ConnectionGUID: sp/ZO29CSMKhXHiVGzvwhQ==
X-CSE-MsgGUID: PzDyrYCnRHmcesY8HrQtQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="50606811"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="50606811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 20:36:19 -0800
X-CSE-ConnectionGUID: KaVIy53JT1OkZfzZwhZnlQ==
X-CSE-MsgGUID: Gt3irL06SY2G3CaVYgkiSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="114001689"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2025 20:36:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjWO8-001BZn-15
	for oe-kbuild-all@lists.linux.dev;
	Sun, 16 Feb 2025 04:36:16 +0000
Date: Sun, 16 Feb 2025 12:36:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 3/3] fs/hostfs/hostfs_kern.c:972:9: error:
 implicit declaration of function 'fsparam_string_empty'; did you mean
 'fsparam_string'?
Message-ID: <202502161242.HGh7Uabf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   da3aec3fdaa3fcb8c9f9760d4edef06741ccfc6e
commit: be80de30b347dc2eae35dd5f7905ad9c9167dc08 [3/3] hostfs: fix the host directory parse when mounting.
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250216/202502161242.HGh7Uabf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161242.HGh7Uabf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161242.HGh7Uabf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/hostfs/hostfs_kern.c:972:9: error: implicit declaration of function 'fsparam_string_empty'; did you mean 'fsparam_string'? [-Werror=implicit-function-declaration]
     972 |         fsparam_string_empty("hostfs",          Opt_hostfs),
         |         ^~~~~~~~~~~~~~~~~~~~
         |         fsparam_string
   fs/hostfs/hostfs_kern.c:972:9: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   fs/hostfs/hostfs_kern.c:972:9: note: (near initialization for 'hostfs_param_specs[0].name')
>> fs/hostfs/hostfs_kern.c:972:9: error: initializer element is not constant
   fs/hostfs/hostfs_kern.c:972:9: note: (near initialization for 'hostfs_param_specs[0].name')
   fs/hostfs/hostfs_kern.c:973:9: warning: braces around scalar initializer
     973 |         {}
         |         ^
   fs/hostfs/hostfs_kern.c:973:9: note: (near initialization for 'hostfs_param_specs[0].type')
   cc1: some warnings being treated as errors


vim +972 fs/hostfs/hostfs_kern.c

   970	
   971	static const struct fs_parameter_spec hostfs_param_specs[] = {
 > 972		fsparam_string_empty("hostfs",		Opt_hostfs),
   973		{}
   974	};
   975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
