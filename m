Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F87D1DE4C3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 20:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169878; cv=none; b=XMMDaaib/W7iDaLgtC81oLqWHXi+vCvyK+XHi+zDAN5zjbnDjVJEwQE5mqt5fmSRvCBhoQewf56ZwYi0opE37Eb6aYXJipfH+JW4bKGl19gTX6C3S9URl86jVJMRiYhRuxzfUyJPwCUpeUKmYTv91uM+P7V2zQNvA36Z0qMlCIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169878; c=relaxed/simple;
	bh=UtCOtqXRPs7Sc5hJn5pyGDgW7k9bHXuRSqjyhH4aEBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQZkKA+lnSRLFUW98vmZtcKP/sAqvxRyv6HnI1lfGXoWf4a1Z7T/V6ZYT6rEqNMAkf2wie5Qsd22UcEMn9xjcH7/pZJ0YbRGh+WToQ/w4Xb+IQz91OOLttvj8MXqJWTl5SrzBj6E5MtZnTClFOJCoraQfs1CWo4Sksyxh0caqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYTGVryc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYTGVryc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733169877; x=1764705877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtCOtqXRPs7Sc5hJn5pyGDgW7k9bHXuRSqjyhH4aEBQ=;
  b=YYTGVrycuCSZ9R7tV75QeEtS4nnd8Oq7kKp69+ZfsBGgRGbpp6Xb8Y9/
   E3BCEkQxJlpW8cSklq9pc8qh0k/R9VKrcI1gIiGkCpcM/mWq4svQTHS1H
   AyQV3/nAxQshABFG7uD1sjCLdoe39Reeh9fxwFZv6e4WxCME5nzMXERYl
   hrWITISdqutY+NvZVeGUbM8AalkNaxDOWxetQp5OGq82AUH3/nhPXIUCB
   tSNvqsu1Hma5ggDBbYjb1aydIT13+6XmgeobloTAa8tMdUz9MV6tv4yR5
   RIROLBOVLY1htBMhJwyz0orcgbe2jmxM44X7tsD7T5iqmQhNTHTFg3l1w
   g==;
X-CSE-ConnectionGUID: qCXSkCUgRb6YarXEawyQpQ==
X-CSE-MsgGUID: /tMOw/b3SdWr502yOVyIew==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44742191"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="44742191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 12:04:30 -0800
X-CSE-ConnectionGUID: LMCIOo3TQLGD+sgTaV9dvw==
X-CSE-MsgGUID: XeU2hpZzTRK7XEM78fRY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93103487"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2024 12:04:29 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tICeh-0002qT-1e;
	Mon, 02 Dec 2024 20:04:27 +0000
Date: Tue, 3 Dec 2024 04:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v1 8/37] drivers/clk/clk-rpmi.c:301:1-7:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_u64
 instead.
Message-ID: <202412030303.ayYB3bqb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v1
head:   bf7506e7bec204376453e68c7d7c3ab7ff37dcaf
commit: 10dfaa174d4f0b1eb57d9b078d7fddb759bf48d3 [8/37] clk: Add clock driver for the RISC-V RPMI clock service group
config: riscv-randconfig-r063-20241202 (https://download.01.org/0day-ci/archive/20241203/202412030303.ayYB3bqb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030303.ayYB3bqb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-rpmi.c:301:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +301 drivers/clk/clk-rpmi.c

   280	
   281	static long rpmi_clk_round_rate(struct clk_hw *hw,
   282					unsigned long rate,
   283					unsigned long *parent_rate)
   284	{
   285		struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
   286		u64 fmin, fmax, ftmp;
   287	
   288		if (rpmi_clk->type == RPMI_CLK_DISCRETE)
   289			return rate;
   290	
   291		fmin = rpmi_clk->rates->linear.min;
   292		fmax = rpmi_clk->rates->linear.max;
   293	
   294		if (rate <= fmin)
   295			return fmin;
   296		else if (rate >=  fmax)
   297			return fmax;
   298	
   299		ftmp = rate - fmin;
   300		ftmp += rpmi_clk->rates->linear.step - 1;
 > 301		do_div(ftmp, rpmi_clk->rates->linear.step);
   302	
   303		return ftmp * rpmi_clk->rates->linear.step + fmin;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
