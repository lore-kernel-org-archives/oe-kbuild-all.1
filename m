Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD12DA756
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787079864; cv=none; b=RBJPcwdZHyie5jP8rVoUxjZHrWkjqO5DF9xltJYlRs2fG63cxlXyxnZqhP+zlAM67ytZNPRFxiHiUR+LFvT9M2URfxbjy+vRBFIWIReoAQMFjaqpzzCgU09CgJQYW9i8vj+p9AdDLJkNU7uV0t7oJKnXcvzLdvRPZAunkA/26F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787079864; c=relaxed/simple;
	bh=edryjETM1b9ALcicNgdttfhXdJLPD+ETEqFh9GdoD5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bcSDftsND3ovafyYAOa2fzTJQoY9bwdH/RbsfJW6oOl40tuWZHmR2L8TjnT7I+6sQ+lNRFQJP1xgQBHCuXm4LQdcQz3XaDE02jErhn+0nFYFVLRWVdwuOZQBkj1hcRze+DTmaNYLvtXOcRT/AuNhuo53+jVfI9XDTpgGPy2qI4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNY9GsPW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNY9GsPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787079861; x=1818615861;
  h=date:from:to:cc:subject:message-id;
  bh=edryjETM1b9ALcicNgdttfhXdJLPD+ETEqFh9GdoD5Y=;
  b=PNY9GsPWc9iWEZQJzTEhFWH15KpKL4PhzVNQB3cMmd0SQOiFYdphgzd+
   ApnGrQdbs9Lw0ptc1VlqXFqZYJH85HZ7hQYL2RZsait/R0FOkbpsdi7LI
   gTVj65rKkTlK8MGl7BcQuJZvRlN1P3oGIAIsBavChmsh44OMxB7onidiZ
   aVgJHRb8xHjXh4nlQ1fbPCN+m2x6es1FTqKIes/tVKRLNz3rdMK90q9ng
   gpe3JhhhcPVbO+W9sVarfuntgV1RLHreaEM40/bOejFPC54G/pCTYCYYB
   2R5XZfVm/Xs0AppljBEEv6EcCtow9fD5KhCRPqUm2PBOfEtAOtcKxuiSz
   w==;
X-CSE-ConnectionGUID: I+uv+3kZS+KwAF968PuX7w==
X-CSE-MsgGUID: 2wsKrkv2RUmz/9kpi80D1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99107156"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99107156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 12:04:20 -0700
X-CSE-ConnectionGUID: no7tIQtKRUuHj593XfqTxg==
X-CSE-MsgGUID: hYwHAO6USOe+jQQHJJNmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267285589"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 12:04:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwP6d-00000000eW2-41bu;
	Tue, 18 Aug 2026 19:04:15 +0000
Date: Wed, 19 Aug 2026 03:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 186/217] Warning:
 drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in
 'si5351_clkout_config'
Message-ID: <202608190243.7GvNyBj4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: e7970ccf7d43de4fff1ece1a060514af6a9ffbb4 [186/217] clk: si5351: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260819/202608190243.7GvNyBj4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190243.7GvNyBj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190243.7GvNyBj4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'
>> Warning: drivers/clk/clk-si5351.c:123 struct member 'disable_state' not described in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:123 Excess struct member 'clkout' description in 'si5351_clkout_config'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_xtal' description in 'si5351_platform_data'
>> Warning: drivers/clk/clk-si5351.c:137 Excess struct member 'clk_clkin' description in 'si5351_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
