Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C72877FC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771950568; cv=none; b=EbTCN56necGT2K2f2WfRhlbcVqAJDlJwiuX9LBWRzwzvX0BQhrNI/O5icy3xn8Eyyw1fy750a/If2hNAJb9qH5xmMq00SptiXVLBuWk0dFCfnONy53F1ZbcQ8KJksA0yRTXZlXe2AiDd3hjim3gQOScRqON5rQ4ickhPjM8sddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771950568; c=relaxed/simple;
	bh=Yk5rCJvZeB07L63Qym1Ontr9isN+rV9s7Pka66EQKjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s/5/t2tr4PKMICP4TEOLdpCi5MCX10SlQuPQeVe62amrZMtsMxPTeBxEMRQLb2Rn08+bpi2RxLXAzjpi9E+H28YsERzCUL++gperaoUbO2lEFqmSROEuA5M7c31gBwai55FU0dWH0iWjSgSmquEb/ZHOzdrht26D3QagSBhLsPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMNhXIN9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMNhXIN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771950566; x=1803486566;
  h=date:from:to:cc:subject:message-id;
  bh=Yk5rCJvZeB07L63Qym1Ontr9isN+rV9s7Pka66EQKjU=;
  b=cMNhXIN94p0Jd9ReFL2Eozt8SCtUI3IaPxLGyhyD7g1cXSwTrFshGIgj
   OXytFcLrzKbVZfAgji3Jp7Ixwq4Fnp58quiplnrJYZkRs6wBcGQRc9fvN
   X6gcwIbk/qNL75qDs6JHxNTFaGxHKHpFdpjwluD+7QV6i7KiATmd3gqo1
   Qg8Bn+yLpML6EEM/ToyckCGvtvZmgvrVZVQhhXo3mYn4dsqwmptZVbMFh
   +XEenLH8qQ0vDqkb9RLyW04PKZcDmS/Fkh/gfthj/jIu3M2ring7TmSh2
   6JLhLQKsULPsxfXJsSWqm99GaK4WAHGQpmDCotI/2V+GbdmwDXqyqm9ag
   g==;
X-CSE-ConnectionGUID: Q6ZDSKQOTK+8y/LsbCVliQ==
X-CSE-MsgGUID: d1wJzJK0QF+hJ2w1ZTSxPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73150077"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73150077"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 08:29:26 -0800
X-CSE-ConnectionGUID: j8ANghjWSjK3BWMdBiNxjA==
X-CSE-MsgGUID: jS8hBzAPThKFj0PBvZghWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215832943"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2026 08:29:25 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuvHm-000000002DZ-3BLq;
	Tue, 24 Feb 2026 16:29:22 +0000
Date: Wed, 25 Feb 2026 00:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 12/12] Warning: fs/nfsd/export.c:575 Cannot
 find identifier on line:
Message-ID: <202602250056.4aGcS5HC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   112d4a209429d8a45cc5bd086392701c0fd120b3
commit: 112d4a209429d8a45cc5bd086392701c0fd120b3 [12/12] nfsd: add netlink downcall methods for svc_export cache
config: sh-sh03_defconfig (https://download.01.org/0day-ci/archive/20260225/202602250056.4aGcS5HC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250056.4aGcS5HC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250056.4aGcS5HC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/export.c:575 Cannot find identifier on line:
    * @cd: cache_detail for the svc_export cache
   Warning: fs/nfsd/export.c:576 Cannot find identifier on line:
    * @attr: nested attribute containing svc-export fields
   Warning: fs/nfsd/export.c:577 Cannot find identifier on line:
    *
>> Warning: fs/nfsd/export.c:578 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Parses one svc-export entry from a netlink message and updates the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
