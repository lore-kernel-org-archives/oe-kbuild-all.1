Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B123718F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595141; cv=none; b=p8lnM2P1RfX+30KyQYxx2gGZ8OV1SGfWT2ch+9qg38Z79uKaU3UQ7eQ4tpM0GgTueiTUWuTYggP2r2mdQmezz2DY2nvIDUV23GcEEdEOOQp7uDyLLzkOPKJIgJljYdOX6LpWOjkhv9Y/kCAEu7mTsar8eTW0PAOFXjuZFodeSUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595141; c=relaxed/simple;
	bh=qLdlH2P3sqSuod/uEg0Pgd+4bExQh3mgzPre5P6S5dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gOuRhArVFBRy2RnG5Kbh5Xdrq1HYvzzWQxA8kv0Eo8u5s5pw6f+Esq06ir6GPkFDWGGpVsXzPaW8Ii28iyXd6JGxvVFMZeHYb316fNsfxtvrG5xsNibmJWJzzTcJjiU3TPPwmKm7MIyIP9QJn0OgHgn/ylYdkPXxB032p/1OpRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7f1OEkh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7f1OEkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743595139; x=1775131139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qLdlH2P3sqSuod/uEg0Pgd+4bExQh3mgzPre5P6S5dw=;
  b=Q7f1OEkhKQgz2oOgC5CdXvULLAtF1paeOFBqEX0qAVP0AWltpUm2uZGp
   5AuE/9A6AFmx+NxRCVpmFHL4H0R18rfvTC54MJ3bBTNRlZ+SZ7EigjEeG
   lDX87iuFf5GHz4LuTkSSvyIpHXcvL96SeCR6V84acd6U/bzWukNi0Kkt5
   PlvhFKmSRI6CEkWNZuidUCNNdaJmpfwOQgMJt50ts9ZXTAwph1NxA8b07
   xXEWxIJh4mvfrD8y2O09Q20RUHqswonTki9qWW51K7HR4py0o8YY7T9tE
   VQWTxUuyHLrHzazsgshx2nzkR03/sncV21zmf4WWMKVBgdTNdNMG78g0l
   Q==;
X-CSE-ConnectionGUID: 3vtQSfcuS9imZDr+3abjNQ==
X-CSE-MsgGUID: ht2l/GtlRo2tbiUkJKZOBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44862409"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="44862409"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 04:58:59 -0700
X-CSE-ConnectionGUID: NTgxKmLdRUuBhbQkQLQEjQ==
X-CSE-MsgGUID: iK2KT02wSheDimBlzqwcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="126437590"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 04:58:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzwkB-000Afo-0J;
	Wed, 02 Apr 2025 11:58:55 +0000
Date: Wed, 2 Apr 2025 19:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tengda Wu <wutengda2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1555/1555] kernel/trace/trace_output.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202504021912.9ieuHMMu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7951fd324625a8af5097e1476cdc8c33c6009b48
commit: 31bf327231bb582ec7dca0490cc90c364b36e095 [1555/1555] tracing: Make sure trace_printk() can output as soon as it can be used
config: x86_64-buildonly-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021912.9ieuHMMu-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021912.9ieuHMMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021912.9ieuHMMu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_output.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
