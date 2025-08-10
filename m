Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CB19E7F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754865535; cv=none; b=VKfcFH2bEI7F1kyyGX/zMSU7QnOi0js1Ak4Uk4p9nU65BKgJPJQbAxYoDBPkypeYsm2ljwSTO06CsuNbYcG9D7cf85eJHDrq2k9zfsL6Lprjy2V+frCbBkU9GGJSM9y0rm0kkKa1wjQWh39ztRTIJQkibEzQagp3+iNbw/teVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754865535; c=relaxed/simple;
	bh=IrAcrYDkJBzq83rqvE7lQRcv0ji2FEqANtIb0jJCVqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXFAPa9ZNgCNZc+g+P61vKbjs7NMTpi6X1L8YGppGmgi3zTKSGTlcoq3Wg5ri6u3IF0R8V0PYsLb9+qwtqfn591hmf2fA9IV5wCjJTPDNkE8Qa8ziDm7aCD+8idXd6K9bIqmImCzABAV0Ilf0lErAVQAbzIKDsOzOLVCtI3jh9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfKkjacS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfKkjacS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754865534; x=1786401534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IrAcrYDkJBzq83rqvE7lQRcv0ji2FEqANtIb0jJCVqA=;
  b=AfKkjacS7gX6szJCQ/gLIh5qdRFz+FkjqMKqsSuf2twxXTmXKMW+EqHU
   0attcXW5PqyW5O+bdpnSxN53MCuNH5g0mCHyAHUW+gqV3Gd+H2gwtNIZa
   /DIXn+VjBMcwFw2WYH4h7/Y0Ltj3Xz/srfPwRrSA5Cn4PSscclf1xlqqb
   n+1KN7WvX1cOMEdOvlzYZxSIQiPnTC/y+QMPLl8Nhl01BV3OpIRZGHINm
   iyTHO2rNFsj6FOfRUlAlIqQoikivc+4YAERjr0prEyRrBo4rCICr5Ew3c
   Me4dudE4zFmb5qRKiaPjBkM0r1LasxaTfq1xSKr7WWN5czA7joNBJUugF
   w==;
X-CSE-ConnectionGUID: AXnDnWE5SVCwoI6kfTKAtw==
X-CSE-MsgGUID: FfaBgEcFQcqIGTaOf1GUDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57025718"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57025718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 15:38:53 -0700
X-CSE-ConnectionGUID: KRY36ryXQaqKXXjvUXxSJw==
X-CSE-MsgGUID: QZiIRGxpRVqNo+WuqOw/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165656229"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Aug 2025 15:38:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulEgP-0005Su-00;
	Sun, 10 Aug 2025 22:38:35 +0000
Date: Mon, 11 Aug 2025 06:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 3/3]
 include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202508110632.0QjxjlLZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   33bc1b6a0df0f487dccdf2e2f27e0e4fa39825d1
commit: 49dffdfde462c7823de6ed882f71ce233aaeba63 [3/3] cred: Add a light version of override/revert_creds()
config: i386-randconfig-r111-20250810 (https://download.01.org/0day-ci/archive/20250811/202508110632.0QjxjlLZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110632.0QjxjlLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110632.0QjxjlLZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/cred.c:104:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:104:9: sparse:    struct cred *
   kernel/cred.c:104:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:105:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:105:9: sparse:    struct cred *
   kernel/cred.c:105:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:121:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t const [usertype] *v @@     got struct atomic_t const [noderef] __rcu * @@
   kernel/cred.c:121:9: sparse:     expected struct atomic_t const [usertype] *v
   kernel/cred.c:121:9: sparse:     got struct atomic_t const [noderef] __rcu *
   kernel/cred.c:124:22: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:127:17: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:218:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:218:13: sparse:     expected struct cred const *old
   kernel/cred.c:218:13: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:305:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:305:47: sparse:     expected struct cred const *cred
   kernel/cred.c:305:47: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:305:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:305:30: sparse:     expected struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:305:30: sparse:     got struct cred const *
   kernel/cred.c:306:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t const [usertype] *v @@     got struct atomic_t const [noderef] __rcu * @@
   kernel/cred.c:306:17: sparse:     expected struct atomic_t const [usertype] *v
   kernel/cred.c:306:17: sparse:     got struct atomic_t const [noderef] __rcu *
   kernel/cred.c:344:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:344:32: sparse:     expected struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:344:32: sparse:     got struct cred const *
   kernel/cred.c:395:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *real_cred @@
   kernel/cred.c:395:38: sparse:     expected struct cred const *old
   kernel/cred.c:395:38: sparse:     got struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:400:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:400:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:400:9: sparse:    struct cred const *
   kernel/cred.c:519:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *override @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:519:46: sparse:     expected struct cred const *override
   kernel/cred.c:519:46: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:301:19: sparse: sparse: dereference of noderef expression
   kernel/cred.c: note: in included file:
>> include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred

vim +182 include/linux/cred.h

   174	
   175	/*
   176	 * Override creds without bumping reference count. Caller must ensure
   177	 * reference remains valid or has taken reference. Almost always not the
   178	 * interface you want. Use override_creds()/revert_creds() instead.
   179	 */
   180	static inline const struct cred *override_creds_light(const struct cred *override_cred)
   181	{
 > 182		const struct cred *old = current->cred;
   183	
   184		rcu_assign_pointer(current->cred, override_cred);
   185		return old;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
