Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E408614001
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRh7OPzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302675; x=1728838675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2GNn608Yrz1xx/zi09HaWLGWQqTa+Ti9stPgHsk9jo=;
  b=mRh7OPzcWEXgAKiQnT4TlM3qWqVg7CsQa+fZy/4rX9IxzIJP6lgmuFgy
   KplKo15jafsl5JrYII03eZC6/Dtg861WoYRw3q0l8K7Zx3+PREHwD24pk
   AS8MyofM9ck+/HzlaJI1SZ/hCccDQDq91Lat7l4MmWMHn117ByqG4m07d
   a5P6sSDJAyZ2fyIVbc3UYD2qAU27hTWyFZBIiD2S4uAZmK23ClzSvUbkt
   N9/fTMhFMRsqe8sJyXMp+eiq0KVcR7qRdYoJa+dAGHGUCSbfEbNlPZEvu
   2htWqTWLtOzJfJkRgyW7CIWvXaBGxef3mBS/eGOuiK6t2rz94tS5eakrh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3947124"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3947124"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748712362"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748712362"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 09:57:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhxW-0006Q5-37;
	Sat, 14 Oct 2023 16:57:50 +0000
Date: Sun, 15 Oct 2023 00:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 15/101] checkpatch: ERROR: Macros
 with complex values should be enclosed in parentheses
Message-ID: <202310150022.QUl8M3JM-lkp@intel.com>
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
commit: 2a23978056c01e4bb31eb28c4c55145bc4157752 [15/101] resctrl2: Build domain lists for resources
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150022.QUl8M3JM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150022.QUl8M3JM-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#206: FILE: fs/resctrl2/internal.h:21:
+#define for_each_resource_by_cap(r, capability)			\
+	for_each_resource(r)					\
+		if (r->capability)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
