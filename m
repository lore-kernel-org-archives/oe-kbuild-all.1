Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4710437CAB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ST6OvYMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697490036; x=1729026036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnAQb5FAEJ+kClpstY4oGY7uSxCf3MjcM68et324bnA=;
  b=ST6OvYMTsaNHaH2iI+EkDdI/ZjIN2btaIyPi80knVEvfCLVo/vCq8h4I
   vklnkt+dJ6/jagNKNKx+T3zrdEUJ0ioaMMqN3UlEjCsxQg6OarCKACpHx
   M4VyiKBe3IgslQE8jUAL2GDKFxarEMl3omaqilhUGBhF6LfLcIoxFZV9D
   dwEIEVcNgpOu6nu4IKM99FjfJdU3THMRq3fRyCu16fJY4VGyktT7ujruE
   K2lPFl5sYkWHQosB+aquBSjPDc7lBeWpxmTysGOhm+vJk5rXJeFmcMMDf
   sFhJ0rfGJI1wJZ3j7b2ra9sR1YmXGXA5Kx5qNC46QLhIvRetiM+cL5kgH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="364991923"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="364991923"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="879559965"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="879559965"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Oct 2023 14:00:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsUhR-0008gH-0X;
	Mon, 16 Oct 2023 21:00:29 +0000
Date: Tue, 17 Oct 2023 04:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 52/232] checkpatch: WARNING: Symbolic
 permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal
 permissions '0600'.
Message-ID: <202310170449.unCu3Ntm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   74d338d77518cf071da9b6ee3676154341830251
commit: 41235cd68205a8d60c149dcea61c288ec6b12608 [52/232] X86/mce/inject: Add mcgstatus for mce-inject debugfs
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170449.unCu3Ntm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170449.unCu3Ntm-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal permissions '0600'.
#60: FILE: arch/x86/kernel/cpu/mce/inject.c:716:
+						      .perm = S_IRUSR | S_IWUSR },

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
