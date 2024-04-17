Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222512F375
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713346187; cv=none; b=JI0VHE8DiB31UzQ/tlJO9F9hJuRHcPFj42mFVqRD09uBlrTKl5iUdrpsUeNr1/JWc2DApNvCvdquQV5EmE+bAju3hQyTJAn5QNXcpZHI+lKYA0Ziz1H2+ea2B/vQjdQ2LBKX6w5uCcNv1r+2yuHUN7DV3mF7DoiPIny1YKQ0PK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713346187; c=relaxed/simple;
	bh=7TGwkSWPpmyYEMaR49oTRHmKvOpSumI2ySsG4y+C19M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SXECk4QN/G4T4HGVFrmHMykhx4ZhI7wxf7mZKua4gE8rsu0WEOvd0Bnz4u/Bwr2KkyYzt2Q2Incwt4SxeolfWRbKzt2TYwKtrETd9QPMrlaUvRJnzmhLRWXO//tsHx5HxtlB1Kpk+RCrsnc+TCqZfbSHDyvEPJMAGcxdvkm8CwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh5a9ZWJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh5a9ZWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713346186; x=1744882186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7TGwkSWPpmyYEMaR49oTRHmKvOpSumI2ySsG4y+C19M=;
  b=Rh5a9ZWJSmmjgW2u/BGMdMM2EGnrDrcG6U9spqbhXhRD62NS7525r79o
   xxma86D/Ox8jvyVFXS1MIz57oRy0h4LQFMgX3jCR8PRyZxlfOXrZ5pnng
   FTOVit5HfbrdlsZo1KmMZf4qoyAlf4qu7s5QO/ousUuwcfxThT258gKKc
   eyR7ba/TSPJj5CkESmkOCdI3lC0Lr9oI4MyIZbo4p9NaoqvDmJOjKmPAB
   Cx0Gg4IYAZL+3IHtYOK98tAlwNEe6J0Je/TLhGsIq808i2ZU1HBA/2+8A
   fUV0Irzp1NTydK4hIX8kuAkDQbO15CZsl/Ctx3CJ93n9Bi7unvYhGy4AZ
   g==;
X-CSE-ConnectionGUID: 6z9kYgrlTau9x279qJK8Ow==
X-CSE-MsgGUID: ag8CmRlYRb2TWDp68Wa5Ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19386419"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="19386419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 02:29:46 -0700
X-CSE-ConnectionGUID: yi0KtwpJRAeMd+q9UH4mwg==
X-CSE-MsgGUID: AJ47/3qSSemEwIRB1BoSeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22630646"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2024 02:29:44 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx1bo-0006RE-0d;
	Wed, 17 Apr 2024 09:29:40 +0000
Date: Wed, 17 Apr 2024 17:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [sforshee:fscaps-vfsid 12/55] include/linux/security.h:1007:13:
 warning: 'security_inode_post_remove_fscaps' defined but not used
Message-ID: <202404171757.TLSUqki9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fscaps-vfsid
head:   67b9a93c9bb8c7cc4697fa1f9d0635a07fd51c83
commit: a2b6ed90ebb32bd67a92d23111985ff5b8335dd7 [12/55] security: add hooks for set/get/remove of fscaps
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240417/202404171757.TLSUqki9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171757.TLSUqki9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171757.TLSUqki9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from init/main.c:21:
>> include/linux/security.h:1007:13: warning: 'security_inode_post_remove_fscaps' defined but not used [-Wunused-function]
    1007 | static void security_inode_post_remove_fscaps(struct mnt_idmap *idmap,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/security_inode_post_remove_fscaps +1007 include/linux/security.h

  1001	
  1002	static inline int security_inode_remove_fscaps(struct mnt_idmap *idmap,
  1003						       struct dentry *dentry)
  1004	{
  1005		return 0;
  1006	}
> 1007	static void security_inode_post_remove_fscaps(struct mnt_idmap *idmap,
  1008						      struct dentry *dentry)
  1009	{ }
  1010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
