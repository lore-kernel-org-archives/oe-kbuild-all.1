Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8EB27703
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ihw/JPRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697115671; x=1728651671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T31kuBqLHB3gQFXRrfnZJuXtBc1Qvz+ReUPd251dEWU=;
  b=Ihw/JPRcMpJfYt3/GTQS8BNXGO8ZVmcqRjKvnTG5+MmyyqWFXD/xjs37
   pLtOjfUZBfrkRIfqQ8n/9eP/B3ot8SviXWt/BVOXRq4eV+GoYqQLYRWnE
   1kxo1KMeQUuRC69pAatqR7V1asJ0jSzhCoxGZYs1JdhGXk+LqPsJu+5Hx
   ZhhSTOeVGhTLpDzu7L4KvWtcydiA7qk5EiGNPywFf2eYKy+GJvJqrr6/P
   nG5sv35rIC9mMdOh1A0I0iVrffZMWU4UwwXwEKk1+ES0UgxoH3Vh0S+ML
   EjMYMH/JaWqgILBSVTvPF5oA/LzTybKupOHh+rNDrH2/L6ISZZjsnit4U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388769670"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="388769670"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 06:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758010797"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="758010797"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 06:01:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqvJE-0003Sb-12;
	Thu, 12 Oct 2023 13:01:00 +0000
Date: Thu, 12 Oct 2023 21:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:ktext 20/20] checkpatch: ERROR: space prohibited before that
 '++' (ctx:WxB)
Message-ID: <202310122057.NFgzIwos-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   7fa946ce05c273d5ff092c814efe64978e5faf45
commit: 7fa946ce05c273d5ff092c814efe64978e5faf45 [20/20] arm64: text replication: verify kernel text
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122057.NFgzIwos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122057.NFgzIwos-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space prohibited before that '++' (ctx:WxB)
#43: FILE: arch/arm64/mm/ktext.c:147:
+			for (i = n = 0; i < size / 4; i ++) {
 			                                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
