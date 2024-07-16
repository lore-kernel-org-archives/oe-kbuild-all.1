Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736F3B784
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721162119; cv=none; b=ZXZDoHU2+sU1RvzRGnmh2Z5Ehgvue4TEJj8WC0u7lfTn39zftdwHRNNjKVkbIsHlrvGt4O1AAtSAviGTaxxTIfQDi0cm6/97WvOGO77SYmRtgMvjh12bEl5eD6zrbD8HmmqScyODKZ3VcMuUtY+WJRytxlkFJpb1Q7t29cKNDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721162119; c=relaxed/simple;
	bh=r4pKorBlov4DYcIhbd+8QFGUWoB8HHosaWo7epdhY+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJv/45/OShSNk/WYTuWAo7phDzw/JAyqgHT2mpaALLjM9nJ6vGK6nVbUEcmWWxOej1E/cdVqg1zZiNTgA5c0ZqqVigC5ATBy37+tYtKzH+kXJebEHFdlCRz+gWpcrZBzTzVnMvDb+ckpKoQlOh4XiKohqD11v5CUiBWOpbpRTgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDC7eTFW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDC7eTFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721162118; x=1752698118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r4pKorBlov4DYcIhbd+8QFGUWoB8HHosaWo7epdhY+Y=;
  b=cDC7eTFWhSpr5xm6nYhOgVwzYSDsld0IAWFpPXN2FGNMpGZVJ9QWZ5Re
   mEbBxQjTGItV/ks0QuwVxLd/GBmnoYud9/N1FkDQ0ifY9YRGxRdVmSOzF
   wEhXI5YsqGx+Iyz8BUtuCUvoDsbedwV4MMxB/vrvwZhTc4OXP3r+46q8t
   lT/Evtbp38l04Xq+GUzRINC2P34VvbStGqXrfNLnD/IUmtgSqXffHo5sH
   8nSjgLIwQp1QNl9Wfn97v5mQQeFb1wiyUkBEfAWknNP7gsljSuXT2e35C
   1HlLxjO9GJW3dAuRjEkewsuq/uCxJa2BlUv843heIOJ00LqgC4NEeweH+
   g==;
X-CSE-ConnectionGUID: 9LKlZ+oCSCWNfVcJxugw3g==
X-CSE-MsgGUID: r+QcO+t7Qqa77CQq/Apong==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36072239"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="36072239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 13:35:18 -0700
X-CSE-ConnectionGUID: Efn8ZzuCRe2HYwv5by6N6A==
X-CSE-MsgGUID: Viz70Wk7RiGoAO69/0WpDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="55294094"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2024 13:35:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTotF-000fec-2F;
	Tue, 16 Jul 2024 20:35:13 +0000
Date: Wed, 17 Jul 2024 04:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar4-fractional-pll-improvements-v1
 19/28] rcar-gen4-cpg.c:undefined reference to `__udivdi3'
Message-ID: <202407170431.6qjpdi1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar4-fractional-pll-improvements-v1
head:   f5a672b0ed67fa75083e13e5f82832cbe7a55e20
commit: 4557d64e7540f8fe383458738b45f317e2235f7b [19/28] clk: renesas: rcar-gen4: Add support for fractional multiplication
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407170431.6qjpdi1L-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170431.6qjpdi1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170431.6qjpdi1L-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function `cpg_pll_8_25_clk_determine_rate':
>> rcar-gen4-cpg.c:(.text+0x126): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function `cpg_pll_8_25_clk_set_rate':
   rcar-gen4-cpg.c:(.text+0x254): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
