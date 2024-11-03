Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7894879B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 06:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730614698; cv=none; b=NZyIQLLCGuL463yH938YWHcs52HVLiTUsmtmlRFrI/61/x5/CNACfdU+EDDtVLqJ9Yj2iYupBPTaVAz8tQeAt8g1nKfkSHeuIznILU7NtSU1lVYW8LVB+bfY9DLuVb2v2/Aa9RH3UkL49Sl7pSVci0o4G7FZMopNa+KnHb1WesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730614698; c=relaxed/simple;
	bh=EUpenFsi6e2EPUjWqTlIiL5vakx2xUi7YxRPPnC63X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b18yDcy4F8TjvqJEX1smfKNlElEFX0VpVR00+NPPAbAvbIOcOR1k/Omk1ofHB5t9fc4Oltn5wWmvT91w9meNjwCkvGvkapKqJa3OYCC9Fil5oc8Bjj4k/60rOsqg1Jc5h5MPi/kXOpqFJEltZqlHAfMf1kTpalnRthj0UMTHynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Df0TfAzk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Df0TfAzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730614697; x=1762150697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EUpenFsi6e2EPUjWqTlIiL5vakx2xUi7YxRPPnC63X0=;
  b=Df0TfAzk+sHVayy1idfCj99A7ktJaAsXIZiJq8/VNoYMxNRmB+C9UYlA
   0A4cjdXui04BUPboziLFEXIKsklX1cTTWg9xelLwyf6zJFexCWHqmf/C1
   34yzPN5qsej7dXTYpzxcQ6eNGJHNarsPHs3Odz/HQnOnobABO7INt2XJd
   TwSl4uiiAY0mf3C/bcW7MZD0iqueaYgk+/ThIMHQk9sTj7aZRBvHyAsv2
   vaPeA6v/x6cBMIvuMVPOrLtt/ncJs8jjVIHecz3k7BUb7FdwGHgGRb5uA
   j4BhZXD0PkvfVrvRmYNRfDWwqzy6SPMGalUQJ+YuSsoD1fWqP/twKvcms
   A==;
X-CSE-ConnectionGUID: WYyeQDqHRvukJzgK4Pimjg==
X-CSE-MsgGUID: 7Atkd/x9SwSDX862VQ5+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="40962244"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="40962244"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 23:18:16 -0700
X-CSE-ConnectionGUID: VkmM/F5rQa6hH6QOgpLlDw==
X-CSE-MsgGUID: 1NYvwbYAR0+z/6qD6TNB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="88480419"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Nov 2024 23:18:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7TwD-000jkH-0o;
	Sun, 03 Nov 2024 06:18:13 +0000
Date: Sun, 3 Nov 2024 14:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] phy: dphy: Fix Unit Interval(UI) calculation formula
Message-ID: <202411031424.r0OxfDmX-lkp@intel.com>
References: <20241031123643.272111-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031123643.272111-1-changhuang.liang@starfivetech.com>

Hi Changhuang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Changhuang-Liang/phy-dphy-Fix-Unit-Interval-UI-calculation-formula/20241031-203920
base:   linus/master
patch link:    https://lore.kernel.org/r/20241031123643.272111-1-changhuang.liang%40starfivetech.com
patch subject: [RFC PATCH] phy: dphy: Fix Unit Interval(UI) calculation formula
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241103/202411031424.r0OxfDmX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031424.r0OxfDmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031424.r0OxfDmX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/phy/phy-core-mipi-dphy.o: in function `phy_mipi_dphy_calc_config':
>> phy-core-mipi-dphy.c:(.text+0x4c): undefined reference to `__udivdi3'
   ld: drivers/phy/phy-core-mipi-dphy.o: in function `phy_mipi_dphy_config_validate':
>> phy-core-mipi-dphy.c:(.text+0x268): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
