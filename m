Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B23168DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="At28EfuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697476736; x=1729012736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FmHxupYSGIGZZy7efTHcijKVrsATkxfPqf2T9nUUHVo=;
  b=At28EfuOsu5dRvveEvvraVu054a52yGyBTZncSCE/J6UKuMpB3gIdJIT
   9XnRsrdxKbs/yKeDjL7AYxh+iA/7AEQq09HRlzyAqjcfkvu8k9insP9ZQ
   hUIbfcUSqG2E9UV0lw2caPCkLsKAkvGfV2B82/qV7AD2C13YvL+jNG13K
   bUSVQexBq2kAIGu0oL6GFhe7BR1fuxa5rJM4geLERuOXGIldBqCRFHdBx
   /T4/atoTpKVJ8tJ/laX0Vug391SIin0uKVrV4g2tplUUKzOXgdMnCGuBX
   2YlEEj6kJrWYAu5oeWgOry+Lju6GE7rXSzauQYchrfyb4+bwL/F0rqhFP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370667750"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="370667750"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="879493723"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="879493723"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Oct 2023 10:13:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRA2-0008Wt-1g;
	Mon, 16 Oct 2023 17:13:47 +0000
Date: Tue, 17 Oct 2023 01:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/cpus_have_const_cap 5/38] checkpatch: WARNING: else
 is not generally useful after a break or return
Message-ID: <202310170119.1RcxGNrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/cpus_have_const_cap
head:   e8d4006dc24e66105444715d6d5daa244aa2bdec
commit: 7bf46aa1c9cbd85e173a9ab8cbf6d7092c388947 [5/38] arm64: Add cpus_have_final_boot_cap()
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170119.1RcxGNrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170119.1RcxGNrJ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#56: FILE: arch/arm64/include/asm/cpufeature.h:491:
+		return __cpus_have_const_cap(num);
+	else

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
