Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72331BDCD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710609482; cv=none; b=NHls8WbyiCFHaB/hqz+B4+uRn0GOR3iLLtuJ+OO+KQI5GiGmlJLB9V8qufiR4WbFoSwUZVO+5ujfKwTjrz50mJOR+1QVifcx5ouzOz9nnVpxPtdrWOJwkfE1XT7F4OnKDCbPDJxmqOSmsJ5odirSmyO1f9XgddeiPw5rURtWczA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710609482; c=relaxed/simple;
	bh=MA3VURGOEPacP27UsxDXdd6ePPDlDC4rIrMU7sQQKec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WumWboS16xywo+tpK9mM67XY9PjnrlKYB1j9b0vo7/m+uy1FxxyDcyyI2uUiAH+R6cOMiVE8bSeowSF1PaDqRjycT83SZ0acVZ4Mp+vhP5OvUrI0MrAPBFACkXtuJPqT5PNz+HCyi5frwflmepMJLUuHwR1bsqeg4KlMHkX0l6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMcAi8rb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMcAi8rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710609480; x=1742145480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MA3VURGOEPacP27UsxDXdd6ePPDlDC4rIrMU7sQQKec=;
  b=lMcAi8rblNYKcQwnhR2Yag9WGqb2neqp7lozKen+udNw6aYR2kdUxanl
   dZieYL95lFOec3p+PdDjskGbjKMpcaRU6mNj9cHfM/REvYtRCE5bKvUFd
   kw6adzJqZsJVkP3E+mACV1/TizjQJHKIZH1bVb265SX3G9WXuxH5/0/DB
   u07uqsOah1woVpyRaP3Wts/ApYg3S8NBBKhLfJELYbas9pEyTJpMWCr79
   wiXHtCswVqd3zehJ9QOMdPutvM/gYG+1ypNlpDBT0t0t0gzPrWlb0Tf4a
   EGR6QHhILLdum1MO9Tk4u2jHUeoogXup5PywPHamc8K0r2cof9D/m9edu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16612485"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="16612485"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 10:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="17475753"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2024 10:17:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlXfN-000Fe1-1t;
	Sat, 16 Mar 2024 17:17:53 +0000
Date: Sun, 17 Mar 2024 01:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26617/27507]
 kernel/cgroup/cgroup.c:6267:6: warning: no previous prototype for function
 'cgroup_css_set_fork'
Message-ID: <202403170136.FN4syAtz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: d59852078d94c8512772bc9bd5086b675797e73a [26617/27507] sched_fork: Fix race between cgroup_migrate and sched_fork
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240317/202403170136.FN4syAtz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170136.FN4syAtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170136.FN4syAtz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:6267:6: warning: no previous prototype for function 'cgroup_css_set_fork' [-Wmissing-prototypes]
    6267 | void cgroup_css_set_fork(struct kernel_clone_args *kargs)
         |      ^
   kernel/cgroup/cgroup.c:6267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6267 | void cgroup_css_set_fork(struct kernel_clone_args *kargs)
         | ^
         | static 
>> kernel/cgroup/cgroup.c:6275:6: warning: no previous prototype for function 'cgroup_css_put_fork' [-Wmissing-prototypes]
    6275 | void cgroup_css_put_fork(struct kernel_clone_args *kargs)
         |      ^
   kernel/cgroup/cgroup.c:6275:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6275 | void cgroup_css_put_fork(struct kernel_clone_args *kargs)
         | ^
         | static 
   2 warnings generated.


vim +/cgroup_css_set_fork +6267 kernel/cgroup/cgroup.c

  6266	
> 6267	void cgroup_css_set_fork(struct kernel_clone_args *kargs)
  6268	{
  6269		spin_lock_irq(&css_set_lock);
  6270		kargs->cset = task_css_set(current);
  6271		get_css_set(kargs->cset);
  6272		spin_unlock_irq(&css_set_lock);
  6273	}
  6274	
> 6275	void cgroup_css_put_fork(struct kernel_clone_args *kargs)
  6276	{
  6277		struct css_set *cset;
  6278	
  6279		cset = kargs->cset;
  6280		kargs->cset = NULL;
  6281		if (cset)
  6282			put_css_set(cset);
  6283	}
  6284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
