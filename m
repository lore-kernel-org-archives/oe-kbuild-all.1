Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B11C17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myY7FAw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697272423; x=1728808423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9b3p/g9ysTuWdTzzhcVeKCyJnUhAdhNBaIXLyXUk1u8=;
  b=myY7FAw54BxEts1vdMbVT0lEjgBfx1f4WRRM7dJmMprL7HZOCkKfgzwI
   iPSD9jp708S3KO6aCnQrqXXedVas6iMQC/4vBEq5TAudtbcfVmi87rgIL
   UeBfm6eCw3pYxT0o8f93cmpziKCLNx+ilfqFUi4WPsA/je+eVhiBv6BEm
   rCRGGYogZQKxnsIzI8ASuIzHySyoa/DhsseNO4lko4NdRp3Nkvr6J6FJt
   JeZyvc+RWQ1TKCMufJ151BeLeTFEIrdXFtGvfLVXwo6KUMBOdjNN1ppVv
   A5YBU/rvEtO9BEgQ3dPbXIhJjAjkkW/BlE5EpzZxhMQlfz77ZxuI/x6TN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388167128"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="388167128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731633911"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="731633911"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 01:33:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qra5a-0005tr-2I;
	Sat, 14 Oct 2023 08:33:38 +0000
Date: Sat, 14 Oct 2023 16:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pcmoore-lsm:next-queue 17/18] checkpatch: WARNING: Block comments
 use a trailing */ on a separate line
Message-ID: <202310141619.eC11Sdqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next-queue
head:   44cc05348273c0e26a9093fe5b882f3ab5203424
commit: 391a24e5c17ec2769383af84abc4bf0c717e0a41 [17/18] SELinux: Add selfattr hooks
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141619.eC11Sdqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141619.eC11Sdqf-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#130: FILE: security/selinux/hooks.c:6392:
+				 * we should audit that */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
