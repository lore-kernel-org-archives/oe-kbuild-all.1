Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224912FB03
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711643239; cv=none; b=lcEFww4zRB+hpER7u8mbFUDKsGZ5efVwTmAJ9DtfaKlZf/p1bBvTsHOS4CQ8VufLOvD1Pgz54dAF3ZwbHVbFjhTf/SigUMP2n7DsFfKpbJU3BsKAgscKgjkhhm3FXfLaniqPKhuzaWc9fSIiDwb1gxpVIh9iSLpNPwUH36yzHOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711643239; c=relaxed/simple;
	bh=XXfrPd73SV7zhuOuricTlTGLH2KER8aBmxwhuPtD1xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4oy4LJJbGBiDgCWL3F6gtvcU9tol5ooLnhar0EYj4IrFrLAJYSROU8pliNljnptVk9LOHOfLp/+a7/FS9CmScEzH7McI6lOnNWW7P6Uise2cmO6c6P5xUUzLJrZ+QzYkIQeytE7Zfz119jC4t/6ENb+XFiXQKpQhXuFASFvIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcrjbHGg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcrjbHGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711643238; x=1743179238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXfrPd73SV7zhuOuricTlTGLH2KER8aBmxwhuPtD1xQ=;
  b=CcrjbHGgfdGwI6O/Dg/x9kPlOQ/T9KbCzR7KZwgGUbDOgGDfNM42db4i
   7hWWHquky28nAO3rsFQ+bnqNXZUtHO7g4mpkvR/Y01aXXX1gbCe1Tuj9L
   pJ9Rk7pi5VGVUCPOHA2PprBxkTqr+rdIIMlvkovp4Gu4YRyeC7YDgjdXc
   7Jz4m5Q2J19OClVX6J9tjmCE+qamT8zwVY0US5JmpWc2vTXpXl/gRU5ai
   n0Dj4tF9f9M84q4GetM9GuorLN+f4/xSXNLQBDah9oT0Fqt64zS//FgFa
   +bMUXGWNen1Q+RQ/YkevSt1AOeNTpcjD2Sn5RzjBcc2SdenIjRCo/jh0s
   g==;
X-CSE-ConnectionGUID: op+4CibmQRSn6OSDf1EuVw==
X-CSE-MsgGUID: ENgtbRHERha6RD6Sh56Wyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10592297"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="10592297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 09:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17141000"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2024 09:27:15 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpsau-0002KA-20;
	Thu, 28 Mar 2024 16:27:12 +0000
Date: Fri, 29 Mar 2024 00:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kristen Carlson Accardi <kristen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>,
	Haitao Huang <haitao.huang@linux.intel.com>,
	Tejun Heo <tj@kernel.org>
Subject: [jarkko-tpmdd:sgx-cgroups-v9 3/21] kernel/cgroup/misc.c:446:25:
 warning: variable 'parent_cg' set but not used
Message-ID: <202403290053.FqcY10bG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git sgx-cgroups-v9
head:   c9feec6d07a914300bfbb5eab86ad3222945f631
commit: e9af4921b9f22706e997afcc7a371a7bbeb69da6 [3/21] cgroup/misc: Add per resource callbacks for CSS events
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403290053.FqcY10bG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290053.FqcY10bG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290053.FqcY10bG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/misc.c: In function 'misc_cg_alloc':
>> kernel/cgroup/misc.c:446:25: warning: variable 'parent_cg' set but not used [-Wunused-but-set-variable]
     446 |         struct misc_cg *parent_cg, *cg;
         |                         ^~~~~~~~~


vim +/parent_cg +446 kernel/cgroup/misc.c

   433	
   434	/**
   435	 * misc_cg_alloc() - Allocate misc cgroup.
   436	 * @parent_css: Parent cgroup.
   437	 *
   438	 * Context: Process context.
   439	 * Return:
   440	 * * struct cgroup_subsys_state* - css of the allocated cgroup.
   441	 * * ERR_PTR(-ENOMEM) - No memory available to allocate.
   442	 */
   443	static struct cgroup_subsys_state *
   444	misc_cg_alloc(struct cgroup_subsys_state *parent_css)
   445	{
 > 446		struct misc_cg *parent_cg, *cg;
   447		int ret;
   448	
   449		if (unlikely(!parent_css)) {
   450			parent_cg = cg = &root_cg;
   451		} else {
   452			cg = kzalloc(sizeof(*cg), GFP_KERNEL);
   453			if (!cg)
   454				return ERR_PTR(-ENOMEM);
   455			parent_cg = css_misc(parent_css);
   456		}
   457	
   458		ret = _misc_cg_res_alloc(cg);
   459		if (ret) {
   460			_misc_cg_res_free(cg);
   461			if (likely(parent_css))
   462				kfree(cg);
   463	
   464			return ERR_PTR(ret);
   465		}
   466	
   467		return &cg->css;
   468	}
   469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
