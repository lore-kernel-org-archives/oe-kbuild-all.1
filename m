Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3851DB365
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730113737; cv=none; b=EBgl4p0eiOI+106CSfXVl/nkXPCcV4bowJBVHdeuvDzciUaTO/Uh8h053fTx7SYJZmvzoA7amgVqQQO4kZ6dx33qTrSCTTZsYx9OEws1U3JHmDnmtOWTEuEhJ0ScsaChk45/FWCupP2F3HJBcDg8LmW7KlKlaPDhnl/3B/z/Y08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730113737; c=relaxed/simple;
	bh=cNUFDgjWfki7+uGVa3Zf2KRrJdxaRRdRLtKPf4KQ76k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDOX2mJKeQAqrVJXQ7+1CmGA9su4D1ob65NOQaNasAkfppZ3oqYfRnojNXKwDDC7xL7VFJhPbKidNLdpDdC3bDVr/31o6xoQxDmrD6374eOX6LGeIRgaWxKOievSPhanpM/yGU72P+YB8cc4KxkEllkp0JxBaNO5OaL0vaG2+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl6tvJwL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl6tvJwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730113735; x=1761649735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNUFDgjWfki7+uGVa3Zf2KRrJdxaRRdRLtKPf4KQ76k=;
  b=Jl6tvJwL7rUXZRb5BkHcgI1A+6UlzuC6w0H565pKurzJR0QBc90Yt5ZL
   r/wZk/jvy/0itAHIf9yFhKuDR4OhQQA5oKfhO2ZpPQp6UekDNzyixToNy
   2iUuaoGokuuJUHGzUT25GQR/mUB7TXwxFTI9gI54u/MOO0QIs4MMfoBaF
   3ZNauqMavYfgqukDs0Vbx1lp2jaKChdNqYMSrDAvS9YTRpzx5enIegc4z
   d/9ijy6+S9Vi3ce51gjQpG6kXTqrqOZEum/rYXX3mOvIlcRRUlv6tPbOE
   B52NnxaSRXvwCvWi0ZdRu+tNZz9++RofRBSq53gXGKO/ULgEnDkoMQQdK
   Q==;
X-CSE-ConnectionGUID: qOAZqUW4TmC0n2L3x/Vckw==
X-CSE-MsgGUID: ac5BOgHHTx6/7QB8a5AMMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40241883"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40241883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 04:08:54 -0700
X-CSE-ConnectionGUID: suxq0N+FQz29j6wejrC8lw==
X-CSE-MsgGUID: 4D6wjV2uR3iGk/fzMVloNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81173552"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2024 04:08:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5NcB-000cLM-1F;
	Mon, 28 Oct 2024 11:08:51 +0000
Date: Mon, 28 Oct 2024 19:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-rsslro 62/70]
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:614:11: warning: variable
 'pd' is used uninitialized whenever 'if' condition is false
Message-ID: <202410281900.W3HLtP1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-rsslro
head:   edb2a7a8be4be71a6502d19afd5b069f6d9fbacc
commit: de758cbe68d93ad88b262742e65efc2aa7490ecf [62/70] pinctrl: mediatek: add changes suggested by angelo
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241028/202410281900.W3HLtP1B-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281900.W3HLtP1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281900.W3HLtP1B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:606:6: warning: unused variable 'err' [-Wunused-variable]
     606 |         int err, pd;
         |             ^~~
>> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:614:11: warning: variable 'pd' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     614 |         else if (!pullup)
         |                  ^~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:620:56: note: uninitialized use occurs here
     620 |         return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
         |                                                               ^~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:614:7: note: remove the 'if' if its condition is always true
     614 |         else if (!pullup)
         |              ^~~~~~~~~~~~
     615 |                 pd = 1;
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:606:13: note: initialize the variable 'pd' to silence this warning
     606 |         int err, pd;
         |                    ^
         |                     = 0
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:602:12: warning: unused function 'mtk_pinconf_bias_set_pd' [-Wunused-function]
     602 | static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +614 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c

   601	
   602	static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
   603					const struct mtk_pin_desc *desc,
   604					u32 pullup, u32 arg)
   605	{
   606		int err, pd;
   607	
   608		if (arg != MTK_DISABLE && arg != MTK_ENABLE)
   609			return -EINVAL;
   610	
   611		/* Either this */
   612		if (arg == MTK_DISABLE || pullup)
   613			pd = 0;
 > 614		else if (!pullup)
   615			pd = 1;
   616	
   617		/* Or this (but it's probably a bit too cryptic) */
   618		//pd = !(arg == MTK_DISABLE || pullup);
   619	
   620		return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
   621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
