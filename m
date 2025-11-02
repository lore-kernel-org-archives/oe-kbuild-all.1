Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F654C8FE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762086596; cv=none; b=tfA9Bm6JiZ7rOCj+mZQp4GygGSmYnTTIGY2jsC4A7q9BnE4DYLrJVn5oO3KCtQlDXaq6pwFGKizXOVMhMPvOI99jcMNkAfRJRMRK8s6TJpr96EWYFsARYJamymPrViJKwFRPz4LIKlc91b0VHUeVg2xYvUFNIRdFjt5Fd5RVa1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762086596; c=relaxed/simple;
	bh=qhiPwVc8PzfPA3wxAIA/UpecwTz1a+mulL7p/CQiDZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FdTatPEhfJsyp5QRnXhZy8+TmjjXy9J/WltmJCyM//AQlHAsdm23vmg5FrunOp9J777cE5eMKTAt5glqttc2eyDHroDD3+L7FITkZiQytvHCqzkQDH8wBs4DGNL0dCnBKVh0z34Nbgh5f3YoRe7kAGh3fory1GZpl2wk0LQr8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lW7G7Akk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lW7G7Akk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762086594; x=1793622594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qhiPwVc8PzfPA3wxAIA/UpecwTz1a+mulL7p/CQiDZk=;
  b=lW7G7AkkmPR7USUjWF1l83Wls9fro5ef6BwqhrKp/UYBrPd6LEvUBCfy
   yRLchzfdQa277AfGDu68mnHo1em5ZUIOOJAXdPcDuu2wYXAZvDFUtPb7D
   n5w5HRli8CA8bIx4vG4Auq7r6VRIMmyjHOvVmEyRBiWL4jkw4sebi7JGB
   gwU443AQ8d6SH2iXi2bcgZWnAThrr8pVjE0RVKCTEupUKr9CRswO7krfH
   JxSH/5sFwjajbBMw+3bA5JSTncW6k59TYyQhe1Z2Hqz1oOG9oXoikmF/G
   ao6so3cWlpeXm48EMF+EuDGsr1biUxmZ7ZSlILqAFae0uAx65y+hbCIcS
   w==;
X-CSE-ConnectionGUID: Xyb79hl2SXaF/9mwgKKh3g==
X-CSE-MsgGUID: Ydz8SmPaQZu4nu6wcRv5gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="89646087"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="89646087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 04:29:53 -0800
X-CSE-ConnectionGUID: g5fHw4epRaiXw52XwBL2cw==
X-CSE-MsgGUID: avrMjB7bRkOTJwpye6ZB9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="191792377"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Nov 2025 04:29:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFXDL-000PDK-0F;
	Sun, 02 Nov 2025 12:29:44 +0000
Date: Sun, 2 Nov 2025 20:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 4/7] include/linux/cred.h:187:16:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202511022057.9pVKhclz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   9e970633688388842161b767155f88179084b2b7
commit: 3eb21f2ecd0cf5d1c0a113ae87f7d687b3be95c4 [4/7] nbd: don't copy kernel creds
config: arm-randconfig-r132-20251102 (https://download.01.org/0day-ci/archive/20251102/202511022057.9pVKhclz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511022057.9pVKhclz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511022057.9pVKhclz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/block/nbd.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
>> include/linux/cred.h:187:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const [noderef] __rcu *__tmp @@     got struct cred const * @@
   include/linux/cred.h:187:16: sparse:     expected struct cred const [noderef] __rcu *__tmp
   include/linux/cred.h:187:16: sparse:     got struct cred const *
>> include/linux/cred.h:187:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct cred const * @@     got struct cred const [noderef] __rcu *__tmp @@
   include/linux/cred.h:187:16: sparse:     expected struct cred const *
   include/linux/cred.h:187:16: sparse:     got struct cred const [noderef] __rcu *__tmp

vim +187 include/linux/cred.h

49dffdfde462c7 Vinicius Costa Gomes 2024-11-06  184  
96f4c245efbd62 Christian Brauner    2025-10-31  185  static inline const struct cred *__assume_kernel_creds(void)
96f4c245efbd62 Christian Brauner    2025-10-31  186  {
96f4c245efbd62 Christian Brauner    2025-10-31 @187  	return rcu_replace_pointer(current->cred, init_task.cred, 1);
96f4c245efbd62 Christian Brauner    2025-10-31  188  }
96f4c245efbd62 Christian Brauner    2025-10-31  189  

:::::: The code at line 187 was first introduced by commit
:::::: 96f4c245efbd62c63b9aa5312b3f8d78d4616191 cred: add {scoped_}with_kernel_creds

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
