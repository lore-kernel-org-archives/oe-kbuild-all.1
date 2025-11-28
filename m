Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B123C4F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358716; cv=none; b=eu4PO7zgnJZfUxju+XWUsktYGKIjpOudeFso31fYKLrXYvcYqSPJloAH5O8wBwG5b6/qFbiAe3R3PTYioFbBwIufZYtTgpl6+peVuCKBJjG84c9IarB7fh0PvntR/VfwTfPTNkjKW6dVUlhrxWv0ccUcpFpRsX/qLo9sZU86LJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358716; c=relaxed/simple;
	bh=SmJg7wHGO/OzMlk8EGQWiS6CF9OCIZjeXm/7lTGBMEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZ4tG6i2unjaGUgeGEYg2pQAGqEOR7mnHev2nlG5vl7Qfah1eB6u3sZEtAfTqbRlh6ycs+5J3+ss/VkUGxpelZfxPWM8O0ACUyQZPNGEuWauXsJtBn4qo+bCu8OMjgoRjOSpRVBnLg18b4FoFN5pf1WxWvFvREsA8MN7E7bLnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WR7kVsN9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WR7kVsN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764358713; x=1795894713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SmJg7wHGO/OzMlk8EGQWiS6CF9OCIZjeXm/7lTGBMEU=;
  b=WR7kVsN9m0YWq/2H8naKbrio5O+SZEwoT0cIjy4jXYnSgHkG7g4bJdmd
   kcVjJmQyny7rK5zuH5SXlrr6RE8kV++My+jdREudzEURX4k1ojGYkZYEv
   I8YfqRZN6xDTnmA67OXtQs+iinI58pKzQO8eNLpOm/hfh5nmJs266mFEG
   r1EGzGiIM+WDZR1hKfDUDv0waM4VWz3TDXJFvbHX/BqpymtKb4icAyy0P
   QNKjl0BQkcdWuPutR0Ml3W8QhakLLccjPp9EPQzsW7eotzTDjuF3v3kce
   5qvMubZA74QakhQ/ObXBD1F6lo48Z08x3+jGEhl6Npz0c5tExFWWdiw3+
   w==;
X-CSE-ConnectionGUID: 9aC9VZD4RX+4I+om+9CbjA==
X-CSE-MsgGUID: FlNnXhSTQEuIXHEHoPcljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70255169"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="70255169"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 11:38:31 -0800
X-CSE-ConnectionGUID: jw+ZBqwtQBKrWEsueBzkZw==
X-CSE-MsgGUID: f76wjxHqQPCw4+STY60U+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="194308358"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2025 11:38:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP4IX-000000006gX-3sea;
	Fri, 28 Nov 2025 19:38:29 +0000
Date: Sat, 29 Nov 2025 03:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10477/10599] Warning:
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:244 struct __packed
 mtk_mfg_opp_entry { __le32 freq_khz; __le32 voltage_core; __le32
 voltage_sram; __le32 posdiv; __le32 voltage_margin; __le32 power_mw; };
 error: Cannot parse struct or union!
Message-ID: <202511290304.GR8Tmh1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 615378e6cac251ab1900d577e48e36d160feed56 [10477/10599] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20251129/202511290304.GR8Tmh1q-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290304.GR8Tmh1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290304.GR8Tmh1q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:244 struct __packed mtk_mfg_opp_entry { __le32 freq_khz; __le32 voltage_core; __le32 voltage_sram; __le32 posdiv; __le32 voltage_margin; __le32 power_mw; }; error: Cannot parse struct or union!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
