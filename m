Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AE261B75
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 05:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755580385; cv=none; b=IuYOhpoAO3CmvwePDKi7oJ/cyXHRIvZZgKUcB5DTm74km6N4hwY4HSjg4BiOeyfOcwrwH5ha0RC9qufRU7vePPYhepeStq4eXr5jp5V/Na2Uf+iSlmJiR5Wk4AP6ulREgpJOsuNViginsx1RyPypHDME4zvxRYF0MHL/zJopAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755580385; c=relaxed/simple;
	bh=GyAd93irheGG3YcIQJokx3/1ZD+qANLqx3x4qNE6zcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKW5eX+fBA8bIo9VglOBI7vKNCxw+NQHBVnWVwxCDhWHJubS3mKerhedIpEa8fjoLHkU4PsCZcr6pKFyjqupSkP7YwVullAKCOSi6G3wcJziOEKDA1PFVxTg2fzJ3ENJNRmESUfZApLPJ0vwTRw7B5AYnzs+CrIu7POfy0WsazE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vh48zjv0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vh48zjv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755580383; x=1787116383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GyAd93irheGG3YcIQJokx3/1ZD+qANLqx3x4qNE6zcg=;
  b=Vh48zjv04MV3nE7TetdwYCJ8Up3usMIQebBuHyUDWHWgu8f0euqOtVEH
   Mu1VlTTYP0c7E+oHSnpQFab6anze/LTwZhvIhmUt8B2jsF1a/utrXJiMg
   0YWZJDeubTn/5tZIMMYUTGlUop/5nJfYogvKLkSpKpzN0MWhYfgseB4st
   K7yuZ+M4mSCleTuyfA/URqpC/XMYqO7MC2peRsC9CoyKIIVbRINjZuM6A
   igMWygcl+SDRL1s3VPlz6vrXtyZFum8GIKVDKloqzSbE+ihJS0bdj5sy8
   HKHxN6t16xFjE0TM8nM6TVV2AFlS88DfCXbmtyUPW+/7UHYu59HD7bP47
   Q==;
X-CSE-ConnectionGUID: YlH9dpMkSny5IevpUXC3rA==
X-CSE-MsgGUID: 4Tlxr8EAQ368wsBQpWSylw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56842526"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="56842526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 22:13:02 -0700
X-CSE-ConnectionGUID: SzT7MFRoREWaFwkGrhRFBg==
X-CSE-MsgGUID: vAZySPLdTzS6mFt+NKzr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167708529"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Aug 2025 22:13:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoEeX-000GWt-1J;
	Tue, 19 Aug 2025 05:12:57 +0000
Date: Tue, 19 Aug 2025 13:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH 2/2] mtd: nand: realtek-ecc: Add Realtek external ECC
 engine support
Message-ID: <202508191251.z4mFuzA6-lkp@intel.com>
References: <20250818092725.1977105-3-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818092725.1977105-3-markus.stockhausen@gmx.de>

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master v6.17-rc2 next-20250818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/dt-bindings-mtd-Add-realtek-rtl9301-ecc/20250818-173253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20250818092725.1977105-3-markus.stockhausen%40gmx.de
patch subject: [PATCH 2/2] mtd: nand: realtek-ecc: Add Realtek external ECC engine support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250819/202508191251.z4mFuzA6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191251.z4mFuzA6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191251.z4mFuzA6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/ecc-realtek.c: In function 'rtl_ecc_wait_for_engine':
>> drivers/mtd/nand/ecc-realtek.c:165:19: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     165 |         all_one = FIELD_GET(RTL_ECC_ALL_ONE, status);
         |                   ^~~~~~~~~


vim +/FIELD_GET +165 drivers/mtd/nand/ecc-realtek.c

   143	
   144	static void rtl_ecc_wait_for_engine(struct rtl_ecc_ctx *ctx)
   145	{
   146		struct rtl_ecc_engine *rtlc = ctx->rtlc;
   147		int ret, status;
   148		bool all_one;
   149	
   150		/*
   151		 * The ECC engine needs 6-8 us to encode/decode a BCH6 syndrome for 512 bytes of data
   152		 * and 6 tag bytes. In case the NAND area has been erased and all data and oob is
   153		 * set to 0xff, decoding takes 30us (reason unknown). Although the engine can trigger
   154		 * interrupts when finished, use active polling for now. 12 us maximum wait time has
   155		 * proven to be a good tradeoff between performance and overhead.
   156		 */
   157	
   158		ret = regmap_read_poll_timeout(rtlc->regmap, RTL_ECC_STATUS, status,
   159					       !(status & RTL_ECC_OP_STATUS), 12, 600);
   160		if (ret) {
   161			ctx->rc_status = ret;
   162			return;
   163		}
   164	
 > 165		all_one = FIELD_GET(RTL_ECC_ALL_ONE, status);
   166		ctx->rc_status = FIELD_GET(RTL_ECC_RESULT, status);
   167		ctx->rc_bitflips = FIELD_GET(RTL_ECC_CORR_COUNT, status);
   168	
   169		/* For erased blocks (all bits one) error status can be ignored */
   170		if (ctx->rc_status && all_one)
   171			ctx->rc_status = 0;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
