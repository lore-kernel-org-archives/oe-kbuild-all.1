Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0153F3314BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817243; cv=none; b=MTHYFsYFud2TnW03imkXu9vY9ELDBF7GILMzr6HDuFPWoBFlTVQRJ0g4CldWJ/zDbk2UMTLx8eI5qUwJhs3RXEv3uuP3s7x2b/fFBneV8yyjxxnjIsKt4D2We/0OtLYCPz5pvdEHJjq/Si9mFSN059hkcL6YC9OtwrumzJamELo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817243; c=relaxed/simple;
	bh=+vMqyBElwqstzIJM+Sv5AFh3PipYO3mFQ5mIvyuN3tQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iUbDcRiv8VYM62ARfpkKfcnWJnFAYSwYoPs3wBLdLYD4bKOtZ+uaMHZxkgEjeeLURzuAgRJEOvjQuvTok0cJRFQ207kNP7U4gHfhF/JYJI6c6/SGwJ0CGvIDZhrYxT9tjD/iqMrLn84S0LBAXUfMTme+atjqEtHUH8QHV4j0N/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOGWsiH/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOGWsiH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773817242; x=1805353242;
  h=date:from:to:cc:subject:message-id;
  bh=+vMqyBElwqstzIJM+Sv5AFh3PipYO3mFQ5mIvyuN3tQ=;
  b=TOGWsiH/6gastdQsR7Uj5jKbwe+rBr239ybzHgu1UHzTWHok4LdxYVYi
   3BSuRNplE/WGTB0eeYx1/iGbEn0Py/XOcNa7nxz5DY8gD4OHzvO3LVrex
   b9dyOmBjK4L7QF1OssJt0u1QZlsTNS5UYyZnI8ZIiPTNWmxoPqqNdQu3o
   oEMgxzwkqrPZJRfads/0/6VPo1a43EzqDm9YqfidO0NyDdlTMTtnKjEum
   GkWpbRw8MaqolaRFEdxFi6KSTXUvwbH1OzF44Kixh8bOoyru7I75U4HsO
   Kt9Tb5aDEv/nYJUPyRbACjV7fJ3KSrWjcBwGnAf8W/iREqI1W7Dq7tzeq
   g==;
X-CSE-ConnectionGUID: q6A5tm4VTHOZ+htRN3bSuw==
X-CSE-MsgGUID: mtgg1w/MQ/WPeVN+zf0RVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74750621"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74750621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 00:00:39 -0700
X-CSE-ConnectionGUID: 4gxe+WliRx2AbDhgaMLc2A==
X-CSE-MsgGUID: R6t8ckPGTuyRalvaawz/Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218577782"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 00:00:37 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ktP-000000002eh-05mo;
	Wed, 18 Mar 2026 07:00:35 +0000
Date: Wed, 18 Mar 2026 15:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Subject: [linux-next:master 6300/6828] fs/erofs/ishare.c:157:8:
 error: call to undeclared function 'security_mmap_backing_file'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202603181427.rvXV3aC8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 0e2baaf8fed0eba6ae83949b8bd317d808efd220 [6300/6828] lsm: add the security_mmap_backing_file() hook
config: x86_64-randconfig-102-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181427.rvXV3aC8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181427.rvXV3aC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181427.rvXV3aC8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/erofs/ishare.c:157:8: error: call to undeclared function 'security_mmap_backing_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     157 |         err = security_mmap_backing_file(vma, realfile, file);
         |               ^
   1 error generated.


vim +/security_mmap_backing_file +157 fs/erofs/ishare.c

   149	
   150	static int erofs_ishare_mmap(struct file *file, struct vm_area_struct *vma)
   151	{
   152		struct file *realfile = file->private_data;
   153		int err;
   154	
   155		vma_set_file(vma, realfile);
   156	
 > 157		err = security_mmap_backing_file(vma, realfile, file);
   158		if (err)
   159			return err;
   160	
   161		return generic_file_readonly_mmap(file, vma);
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
