Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872D2114
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710645253; cv=none; b=R5K1BAhyDxAmD/oMUY57pfVsgwYqN6burmWdBiZ/lOH04jYciVPiF2QOmza5My+b2NANCs1WJMhn863ZaTB9zg23LLh6iaZ7kD/lzCMe12gCiqUYZTHA0E0axWd9KyAoTIiZEnRPykicQkT97RK2ubL3P6zBNNuJTfSFlMT5LN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710645253; c=relaxed/simple;
	bh=RaakrQAWym5GLL6L6GwFCO4v8w83uiE/nXqoiSmXPMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDjBcIog0vJO2zqUHpwUEWYFDYquhAwAC43ivXs26A/jVNk3l2JksQ5Oy4ujkaQ0/31vEjjBIkrMbTZsnUxJ1u11xlm2J1o2t6PGPc/J669kvAasaUj8DNEJqQmf2VnHgPNI6gnBUB+sB297Eb3GQCw7jBvSUzzRCoQeE5lRG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYLry6an; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYLry6an"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710645251; x=1742181251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RaakrQAWym5GLL6L6GwFCO4v8w83uiE/nXqoiSmXPMk=;
  b=MYLry6anTTklH0bJdgYaepfgA1iWc0yKkX+YjbeezSl0LdzkVrG3a38I
   AV24lNWYTS/j8XPbNlcIAEW7bT3WfAxp1eTJp0MZMCDLTXSf45KaScudm
   g7rp8s3jqaSqQEIjKF362DRJCAatzJJokzkJSpQHh5Y1fs3ePgHP7G20E
   QTfWZjQcijKnsQiiG1mHFIPGlyC6mJTzkxQLix5dnjbefE+QL9WGKeBVu
   WXXIxiCFptOa2l5nAVUQAE3pSKlBu/MvHMHjEHqHbaLudhpS6B7JsQaZU
   SnUoxIORxjK/PMNMrPJrqFyrmzJQky+3K1SlA7Ziz1Sj4vZNYJorsAPAV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="5615296"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="5615296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 20:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="17806626"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Mar 2024 20:14:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlgyM-000FyT-2v;
	Sun, 17 Mar 2024 03:14:06 +0000
Date: Sun, 17 Mar 2024 11:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 42/43] error: target file
 "./scripts/target.json" does not exist
Message-ID: <202403171100.1M1c45XV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   55e41b4e7955d261d26d167a0e9a847553a8ef55
commit: f7b58e210ad8271699903e301c4052fdcbeb24bd [42/43] rust: Add cpufreq-dt driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240317/202403171100.1M1c45XV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171100.1M1c45XV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171100.1M1c45XV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: target file "./scripts/target.json" does not exist

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
