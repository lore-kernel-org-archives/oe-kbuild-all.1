Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C93366051
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166972; cv=none; b=oVT0LCumuddZfXRBtDWUwdpgwbxI7E/OE9A8UIoeVVMylbBWxVE40CWACbyJXdP6rtz2YJwtNjahsHYmNpF0mJ2uttQ0ClwDACCP3oZlC8nO/LTj0SMIVac9s1X43Pau5+F5OrLLBJmLvN5wMYBmD7vbBb0uLeJ5q7Ubyejf/FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166972; c=relaxed/simple;
	bh=z4R2A2Tzw6m+sSNtulbqzVYZUWllGJeguBuUksfklX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QVBq6lriKs6ku6G/NMidJ7G07Ob1WZtU1zy4vAlLrxx5KqqgNlwJL+Fk67yfOmPQA2Eo1CCNLiodWphrfZshM4rQ7XM2RngSImp/E+D4YGKmd5eQ/Z+ck1ZnhKswE/+Xemfb09XzDDsoRTLoCFbo+DD9PY7ElJk0M6PfuE5bEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZewREZ2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZewREZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782166970; x=1813702970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4R2A2Tzw6m+sSNtulbqzVYZUWllGJeguBuUksfklX8=;
  b=eZewREZ2Zhgxo3D8oeTDNHv6rKYlwoU9YSqQLLDkglgiqJT3arRsKbvQ
   3u5nOT3PIW9ylj4uwF+eZJhvFYVr+qn+hYTaTeH1H4XYzJXEat3ltkdLo
   0i4FtCrqORsPeLG7y6QtCLpPiiUIJhTu8Qu+FfciaybayEK67no0erchG
   kXECcagVAWX14V6nTnGql5IzWSt9wqL/9zjwbdrV5b7N414WXL+baPqu0
   TaiSG25gqLvOiO1CtcJa2Us7z3eFkbqk5KNilO4+5SvFmECelwbpxHFfM
   4bU6rWD8drrP2r+ZVS6qipL1zygCETJeAv19maYxNeYRvdqyrHu6ugQZJ
   g==;
X-CSE-ConnectionGUID: xdMevqzFS5meSqexLEFCDw==
X-CSE-MsgGUID: Pz40wLy3RZ2YtO5BCGtV3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81885063"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="81885063"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:22:50 -0700
X-CSE-ConnectionGUID: H7QQwG5tRj65y8LgUCWlgg==
X-CSE-MsgGUID: Ae5xqL46RZSlZsqRJnotUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253238987"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jun 2026 15:22:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbn2U-0000000020z-2HZj;
	Mon, 22 Jun 2026 22:22:46 +0000
Date: Tue, 23 Jun 2026 06:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 10/124]
 drivers/clk/zte/clk-zx297520v3.c:644:27: warning: 'tdm_lsp_sel' defined but
 not used
Message-ID: <202606230639.SwKO7imF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 7b95ce97d9a13b0d3b2ca1c45b6bacc090309344 [10/124] clk: zte: Introduce a driver for zx297520v3 LSP clocks
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606230639.SwKO7imF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230639.SwKO7imF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230639.SwKO7imF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/zte/clk-zx297520v3.c:644:27: warning: 'tdm_lsp_sel' defined but not used [-Wunused-const-variable=]
     644 | static const char * const tdm_lsp_sel[] = {
         |                           ^~~~~~~~~~~


vim +/tdm_lsp_sel +644 drivers/clk/zte/clk-zx297520v3.c

   643	
 > 644	static const char * const tdm_lsp_sel[] = {
   645		"lsp_tdm_wclk",
   646	};
   647	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
