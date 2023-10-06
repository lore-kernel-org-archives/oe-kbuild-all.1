Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116D23A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 05:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANbf36fN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696569021; x=1728105021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IEHHnLL5ERit5Ayn/VUllYNl3Fr3CsAwLTDvUzdBxUA=;
  b=ANbf36fNMXDNzmA8gMRnysCKRN9b/+IfE62zrC5FSuqN0hsIHWk99D80
   WIYpshiNV/fUDA7JtP4liWulwByF/l/np/P2+K/XU5CHLq8dbHqwSO4Bp
   3GT10ygQRuftFVH8xMC/ZU3MTrnBhfU7WpuExOehtkJHOU4OIh3bil7HQ
   4NTjRA4uQfe8n9DC6g0ZXZmGwQBZ4FKwTJpg1s1dEFEjamaTH/dWzE3X9
   PcwNmAXTRbnzWqUZ29XrDNB/UhXq9gEXoE7P/cj+PpcxZZykMuwYpAiYi
   xkcZM9NsV/wicOgnLs3J/RLKLQ6fG33ixWvUYBcF9u160Ldo6qZ/xIFHe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387558645"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="387558645"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 22:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781512647"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="781512647"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Oct 2023 22:10:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qod6P-000MHU-07;
	Fri, 06 Oct 2023 05:10:17 +0000
Date: Fri, 6 Oct 2023 13:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [chanwoo-extcon:extcon-next 3/3]
 drivers/extcon/extcon-max77693.c:1261:34: warning:
 'of_max77693_muic_dt_match' defined but not used
Message-ID: <202310061305.YcAHQ8C7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
head:   8b467b48e2837bdae738a3a53b121b2995df0be7
commit: fce081a0b58422034bdf00868058f318d050e905 [3/3] extcon: max77693: add device-tree compatible string
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310061305.YcAHQ8C7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061305.YcAHQ8C7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061305.YcAHQ8C7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/extcon/extcon-max77693.c:1261:34: warning: 'of_max77693_muic_dt_match' defined but not used [-Wunused-const-variable=]
    1261 | static const struct of_device_id of_max77693_muic_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/of_max77693_muic_dt_match +1261 drivers/extcon/extcon-max77693.c

  1260	
> 1261	static const struct of_device_id of_max77693_muic_dt_match[] = {
  1262		{ .compatible = "maxim,max77693-muic", },
  1263		{ /* sentinel */ },
  1264	};
  1265	MODULE_DEVICE_TABLE(of, of_max77693_muic_dt_match);
  1266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
