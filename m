Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE4DDB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMoDDJqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697093887; x=1728629887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ABu5lp5Ax6a3RJUHgkM6lPMdUFBES0aF2MLpyXGfs1M=;
  b=TMoDDJqTTngbic0VrKyAWwo21bI/2vJfioDBbQ0rWYVER45KmJZWut00
   gKIUXtbxQa+QERNVXbLoulrSJj8Ma7Brt4kGy2r8GHOYd6XmR4KUhLcjD
   JAzHx9GpWGdP3ugwFKfM8gBZLrGA1rEI82zL5Xd7u2qUF4jD/s71LJaiX
   Y4XpwQO+yUTgjN3ouoiWfG5BfFnit12+0+VZj6eVu5WGdwsXA1MiCyn6D
   +/JrD99B5IC8vJJbkon0iy/hAhX6dpe0WsPrTRyU+bMDGpIfQrZFnfU/o
   KBqLdwm2nfUdco1dWa6CfRtsyN9pzMPXB8PSjjloQYZpeuq7/mJFTBxcq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="382090217"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="382090217"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824483646"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="824483646"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2023 23:58:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqpdw-0003Hp-1F;
	Thu, 12 Oct 2023 06:58:01 +0000
Date: Thu, 12 Oct 2023 14:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 8/235] checkpatch: WARNING: do not add new
 typedefs
Message-ID: <202310121456.pWOVKJil-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   7a3180b27232bff6b95d65874e05272fa0c99b01
commit: 4b5b517fc0d38b3945b6d03df3de4059d7d7f455 [8/235] KVM: Add a dedicated mmu_notifier flag for reclaiming freed memory
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121456.pWOVKJil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121456.pWOVKJil-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:NEW_TYPEDEFS: do not add new typedefs
#41: FILE: virt/kvm/kvm_main.c:572:
+typedef struct kvm_mmu_notifier_return {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
