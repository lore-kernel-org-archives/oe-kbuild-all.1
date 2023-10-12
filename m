Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888BADDBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiNTmvNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697094570; x=1728630570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3YUnb1LhCUkDyJ1cYUwbf8gMoVhM/7c3VEoyoGxVtk=;
  b=FiNTmvNGKdrzoS+hzWNKKrmGzSb8/dr8tZs/il9m+FO/mw5YXEBZuKjM
   AcdKHaK7RnmN9h9NaUFJpUiMYfvp/3eS2NCX76aMjPc8GhFeoGYo51O35
   WoABq8jbH3S9o3zMNwc7fDyVsFiwyOkuvEYLgTSk4OQq8zMyWB4H9vlGS
   v6JKXKSUaVedScqvzjFzXiQU54CsWxgwAQoejnGSzw/Ham6MDD+JdhRpd
   /CPROV3Vgwq+CVB85mE9rlKT/30Ifc7EsIGND7PNgwqahRm8W7g/la+pA
   0gj4rsO5LJW+52+ifTHMWTjMasVe9l8k3lNcznVcDu4N5JMWfTeg6KCVG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3441517"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="3441517"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 00:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730813747"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="730813747"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 00:09:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqpor-0003If-0z;
	Thu, 12 Oct 2023 07:09:17 +0000
Date: Thu, 12 Oct 2023 15:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 53/235] checkpatch: WARNING: Symbolic
 permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal
 permissions '0600'.
Message-ID: <202310121438.YkOHpv1G-lkp@intel.com>
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
commit: 5f1fa54eb9679de954dfbe9aba4887d16d0780d5 [53/235] x86/mce/inject: Add notrigger entry to suppress MCE injection
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121438.YkOHpv1G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121438.YkOHpv1G-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal permissions '0600'.
#93: FILE: arch/x86/kernel/cpu/mce/inject.c:739:
+						      .perm = S_IRUSR | S_IWUSR },

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
