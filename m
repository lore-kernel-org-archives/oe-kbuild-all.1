Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEBC3770B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Aug 2025 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756665941; cv=none; b=KkhT6aVHFl+W3DSrdmnxbZ3pXD/JsXrtTiNElgnsHTBZwnEc87ao+6NXn3E7U2iQxnAuGNqor6l1uEPZMxIecIwyd/T9RylLZt2r03cUHZJ277qLyd42A70/wGM5K4YFkgwJi+T1II1Vcav5c5IwYfvaYITdTj96wDrQ8KmAtHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756665941; c=relaxed/simple;
	bh=LHy9zw0Nfi/Fu8CPLzyGlNrjqksIa7095KqF1x/CAj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGJ9nPunhXTkurK5mRDIQfhmrujAiHs14D2Kilzr3zdc3P7k/bmkstfEI09Gm6beG512oJ9ojUXmbPCSKiCAVkQ05F6PhJHj7fWnn1Vca1odOzhuukVpJJyF2bBN9grpeIaI7+Wswq20ikHnNDJyEqUl+Gp21v6vh7Kyd5vVFag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdumsal9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdumsal9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756665939; x=1788201939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LHy9zw0Nfi/Fu8CPLzyGlNrjqksIa7095KqF1x/CAj0=;
  b=Sdumsal9+efgJ9LTisz1hun5V/QfIIWglS20xmzBrA+dDbofuXscUJuS
   NuEfUs2Yiha5CmR4qGB5TCsF1A6EdMpXw5q2xjITqvRiagfKfJN9Durco
   8fU0B+Fzf4dQQmCd+CbwbNHjuievizqT38t/2Z5vhlJu47GF9vwDrCLKJ
   OfSBPvsvpj6e6aR2VRoR+mgEcIn1SFdAK5z7xqZQuNUivlMU2cGX/lQGF
   hec9aYWwuOyReSPo/KYNgxown8+GrhJXU4A4axU6nHYGmg2AbjtXLPAnE
   aYYNdIYLMc3Z8IfKWNtDq2nxl4kmgbk0oxH70VnpRudn9L5GVWoqcb/cA
   w==;
X-CSE-ConnectionGUID: 7P4pI6VoTDm45w2hX5BA2g==
X-CSE-MsgGUID: WcNHvOVuTYmGN2kxIan2mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="70240597"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70240597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 11:45:39 -0700
X-CSE-ConnectionGUID: sYkHO2TjQG2LgkVJUzBUUQ==
X-CSE-MsgGUID: sLM3d35eQ0KI/LBpTIBw6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="176102416"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2025 11:45:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usn37-000WIF-1W;
	Sun, 31 Aug 2025 18:45:22 +0000
Date: Mon, 1 Sep 2025 02:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/5] clk: samsung: add Exynos ACPM clock driver
Message-ID: <202509010221.Q7juHzvW-lkp@intel.com>
References: <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-acpm-clk-v2-3-de5c86b49b64@linaro.org>

Hi Tudor,

kernel test robot noticed the following build errors:

[auto build test ERROR on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Tudor-Ambarus/dt-bindings-firmware-google-gs101-acpm-ipc-add-clock-cells/20250827-204355
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250827-acpm-clk-v2-3-de5c86b49b64%40linaro.org
patch subject: [PATCH v2 3/5] clk: samsung: add Exynos ACPM clock driver
config: xtensa-randconfig-r073-20250831 (https://download.01.org/0day-ci/archive/20250901/202509010221.Q7juHzvW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509010221.Q7juHzvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509010221.Q7juHzvW-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/clk/samsung/clk-acpm.o: in function `acpm_clk_set_rate':
>> drivers/clk/samsung/clk-acpm.c:55: undefined reference to `devm_acpm_get_by_node'
>> xtensa-linux-ld: drivers/clk/samsung/clk-acpm.c:55: undefined reference to `devm_acpm_get_by_node'


vim +55 drivers/clk/samsung/clk-acpm.c

    47	
    48	static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
    49				     unsigned long parent_rate)
    50	{
    51		struct acpm_clk *clk = to_acpm_clk(hw);
    52	
    53		return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
    54						clk->mbox_chan_id, clk->id, rate);
  > 55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
