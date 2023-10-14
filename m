Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE81A262
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKrYQtbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302681; x=1728838681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ECxIo90ZTGYZuOHA713nlgdluDBcU94KnHBdwWUmuMA=;
  b=dKrYQtbOEWLwWCgJJuuwzOOjy6Zs+2MW33/e+jJHx1KXNvWVpttPuPX1
   Ebxb55826ppn4NghejbEk8AZD1FmAzbBM4aSBS61oXx2BjFaVAiql50II
   +b9qgPoUfr0dN/qOIfWdZQYaN2Y+8WDSHccTwRrilxsZIBmURJQ+jE0yr
   2GH/hl7U5lNLaHQI7ZOmfOXbf4xDuhmItejd1mjmuf6Cmv0Hhyl+7C/mH
   BTV9HOpsPMtuRcMDwXwNy4HO+W+4uq0+DwEkfmwMN6PV6tU8YEgQ9Oyln
   5+QgAnoRUMneIfCYfqJ8nKc9vSzDAF4Y3OGbAfg6EjUSppPqyYP89iGYA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3947127"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3947127"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748712368"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748712368"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 09:57:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhxW-0006Q8-3A;
	Sat, 14 Oct 2023 16:57:50 +0000
Date: Sun, 15 Oct 2023 00:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 37/101] checkpatch: WARNING:
 kfree(NULL) is safe and this check is probably not required
Message-ID: <202310150011.emTAtxHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   5923ca9112dd53a998ef4b986edcf65ee0b9065d
commit: a24b8de205e2e9e2a84752a709ec445bdeec85e0 [37/101] resctrl2: Allocate extra storage for control domains
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150011.emTAtxHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150011.emTAtxHq-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#49: FILE: fs/resctrl2/domain.c:108:
+		if (d->ctrls)
+			kfree(d->ctrls);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
