Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015C433F59C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785469068; cv=none; b=p2my9AeH2DH3olIzUOi7frxRfp7Mn3U+q/q9kUOeQ1jbqIDZ8AqkagU0z4JcVzK8Lwgh5zqu1tf8EUAp7nNCRx9eXjllBQHOQsLRcjpvITl0+bYf8FS4Z0CwMmF5s1z5hHDY4OS8NmpiNwaCVeaKdAZgIIt1X63O5J3L92lEksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785469068; c=relaxed/simple;
	bh=Fd3labKKObekFopZnHQJj1znplXpPDuPuIv+y6CAdVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N94N40jwzjWBvvi7gUZorZAkSgRnLiWK3gbnwWbL/MHFStEzfpRhr7/dTYCqbun3CPxO2q1NkUxKPwoz7U0RbxHQZe+nYMHrdLcGPPLyMx2hGO4IyadbqnLHCC+q1mBkK8QtwhLcYfG926hTGWvf0aTwr3QBWLZXXuj9yCdAc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V++1KbO8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V++1KbO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785469067; x=1817005067;
  h=date:from:to:cc:subject:message-id;
  bh=Fd3labKKObekFopZnHQJj1znplXpPDuPuIv+y6CAdVg=;
  b=V++1KbO83G6rENKaUxFVVLLQAveRpqNVNu3vG+Cm/o/RMAWRkTyRFiyc
   0omBJFtZnR21bX0D2s8khMLTr0PXNNeSBojpoLbLieaSY6/o0cUAMqbx9
   ekb7oF2llmHX0nKT8i/4v8bKanTF1a2A4PjYCeYfNe1uVTAdp4Pagt2HC
   ruPhAl3KoswgKjKGPs7Rh4Q2yfdsofWnXM/KbKj6ipjsk4DbdSl6Dp9/J
   XXkioRR8tK5+UVknS9F1kBIqfYtkqLv+5xztMj67ePNWNK5Qn4l/48/JB
   TJhwP35eeSkaP21OOQBmUZg3yHau5jGWeJnqkXGmt65UBzlXLIcHmbOTg
   A==;
X-CSE-ConnectionGUID: 33PlF0naRTa6kUZP5M/sSg==
X-CSE-MsgGUID: 5UKXQ19uRPqZkZTJaSdNKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86110446"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86110446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 20:37:47 -0700
X-CSE-ConnectionGUID: 4yL70KXvS32HHW0PIihDLQ==
X-CSE-MsgGUID: mKsx1GbDRU+Ne824C+Tu0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="256567780"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2026 20:37:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpe47-0000000002a-03gh;
	Fri, 31 Jul 2026 03:37:43 +0000
Date: Fri, 31 Jul 2026 11:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 7/700]
 drivers/clk/mstar/clk-msc313-sc-gp-ctrl-muxes.c:104:39: warning:
 'ssd210_data' defined but not used
Message-ID: <202607311150.rwyg4xQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 5d38c8bb63dfff32fcb793382ce55d140fce0f93 [7/700] clk: mstar: msc313 sc_gp region clock driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311150.rwyg4xQy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311150.rwyg4xQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311150.rwyg4xQy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/mstar/clk-msc313-sc-gp-ctrl-muxes.c:104:39: warning: 'ssd210_data' defined but not used [-Wunused-const-variable=]
     104 | static const struct msc313_muxes_data ssd210_data = MSC313_MUXES_DATA(ssd210_muxes);
         |                                       ^~~~~~~~~~~


vim +/ssd210_data +104 drivers/clk/mstar/clk-msc313-sc-gp-ctrl-muxes.c

    97	
    98	static const struct msc313_mux_data ssd210_muxes[] = {
    99		EMAC_MUXES,
   100		/* same as ssd20xd above */
   101		MSC313_MUX_CLK_PARENT_DATA_FLAGS(SSD20XD_SC_GP_SDIO_GATE, "sdio_gate", sdio_parents, SSD20XD_SDIO_BOOT_MUX,
   102				-1, 3, 1, -1, 0, CLK_SET_RATE_PARENT),
   103	};
 > 104	static const struct msc313_muxes_data ssd210_data = MSC313_MUXES_DATA(ssd210_muxes);
   105	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
