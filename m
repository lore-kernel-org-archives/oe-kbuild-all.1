Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824FD2770A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWTVT07e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697490688; x=1729026688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFpJPEfQMeTjmdKh7QEunNfUzDy5w1cwP7xKthru4Bg=;
  b=dWTVT07eW885g95OOylvwMm8RfZPs0rGvxXa4xHfcBrIBmf1j01Gk5Fq
   3hPvE3D9NJ9Ol56cilGsfbUwMA8sWZr4tLOxUbA3oSrTUoVyQJwLEC8e5
   MXeIKv46IKAhjnwFPj5qrD0HaBlE2Ow8AeDL73WpmQV8pVfhi5FM2zDYt
   B4IsfuvljehT64iYQZrGrWzbIjYYjXt/Jxl9+wySP6IrckIyjefDurJSj
   cRoox9biIbKuDim/w46O5B9jQ7D745v2U+lvMRNWXKgu6pND3+ALdkUUR
   rrz99E85tejyiti9EqyWPSMpw9k4+7O7KfIcDgb0EAqFVfSTeN9m+HsuV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="471860630"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="471860630"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785235968"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="785235968"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Oct 2023 14:10:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsUr7-0008gN-0c;
	Mon, 16 Oct 2023 21:10:29 +0000
Date: Tue, 17 Oct 2023 05:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 64/232] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202310170545.vUvElsyo-lkp@intel.com>
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
commit: c75b0643ca70cecb68211cbc2af561253de2e9a1 [64/232] KVM: selftests: Add FADV_MCE_INJECT and KVM_X86_MCE_INJECT
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170545.vUvElsyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170545.vUvElsyo-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#85: FILE: tools/testing/selftests/kvm/x86_64/private_mem_hwpoison_test.c:186:
+	char *buf = "sw\n";
+	open_write_close(MCE_FLAGS, buf, strlen(buf));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
