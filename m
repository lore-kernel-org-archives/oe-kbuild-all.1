Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2B4DDBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a12Ghq7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697094563; x=1728630563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ab3XCVHIbcePRjZfZDwyweMOyF+LJ+HEdmLaVbrcOVU=;
  b=a12Ghq7Yv0lugmU+zxsXX6YEF4zTBx9VwGs7XqKKy/Lw79yvuyHqdpL/
   8nymDpgCvWK25eD6HgotWhNSra+wjepIOQCpfiSBOJ5wq1R4ndzTLUOsm
   A5NFCBdsjoZVCRHEq7fgKQ73mWoxJHwFyZ/qBtbIGcErw+eaMLjG50IGj
   dn2sygV3NP3ccAG1dX2awQ6nitso/KAEmOHreULVEQQRmkdRw8a6NtcoD
   6NhB7pBzUMtXVxvw4O63Sp/oNn2/9mfvANO37vDeN3LKZ/AS9TO8H2Tlk
   VSVfy/oQ8shtqAqbN3ZQJLZXc3rhQX++7S46N0HCB7AnwFEX0GphMFC14
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384703341"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="384703341"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 00:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="704052361"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="704052361"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 00:09:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqpor-0003IZ-0e;
	Thu, 12 Oct 2023 07:09:17 +0000
Date: Thu, 12 Oct 2023 15:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 52/235] checkpatch: WARNING: Symbolic
 permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal
 permissions '0600'.
Message-ID: <202310121425.LJPCHqRm-lkp@intel.com>
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
commit: 41235cd68205a8d60c149dcea61c288ec6b12608 [52/235] X86/mce/inject: Add mcgstatus for mce-inject debugfs
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121425.LJPCHqRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121425.LJPCHqRm-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal permissions '0600'.
#60: FILE: arch/x86/kernel/cpu/mce/inject.c:716:
+						      .perm = S_IRUSR | S_IWUSR },

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
