Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91818AFD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 00:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764807643; cv=none; b=nk5YOk5Xl7ONQnmOHSm20lnxyJAW7u2l7KOVbcvCTGhMnQ/r33aq38oOYJnoH82mJIM9eGKn3Q/ZrAL8jUnQ3FLgSbw1aHW6boc7DUyA2j3GxW4mgEuQHOs6RPsv/KxhApsxxvn2z5vjomKnaEJb9stU8hEDK1OuJ+N2L5+wH8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764807643; c=relaxed/simple;
	bh=Ob0hmPFCRNuIrLRLU3kbT2CTH0I332CyRs1po7vOPBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZqYe5wYQRIHgEP/zds2kUKeIpMseq4LOJ4/pvqqsau+Wxu+XB61t3ja+c7KGZC7mPp0JP3+7eTH7y0hZ7tS8PD71xW0JxltxK5ih5tTaRAldn7JsTK3jHSdlMOtcg0c7dBaC7yVjkC7gQGVQ9goPx0/lpzj9W35AZeLsoztvhtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/UgrN0q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/UgrN0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764807642; x=1796343642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ob0hmPFCRNuIrLRLU3kbT2CTH0I332CyRs1po7vOPBg=;
  b=M/UgrN0qafdzD6gCQ8dDydwlHiAWLFlgjZvReHlYP5La4+ZMhohbsE5P
   ED2OyWSs8f8/TmvHg4xPxlu6Ip30FLrg0KRP/VhxrNW0Qs4C7hEvU6AkC
   XGzWZH7eSxz4XJM0mw4cxpSBuStgc8zP8584La0HgykxzJnQnt8nHPHK3
   ot7UhJnLrHqcsGurTHGl+0gAKnExllYDb+4w3wEOTMGtByqm06LS32Ldh
   U3LJpx1Kr50jhEaise6NeIX9+i9SgHWxP95fsAen6IVgLxi2Pfoeja4QL
   kvkaNTJI2VK5yTgQWjm/u5yauBj71v7NEFYyiFsELsWe515o4vOS5mjpC
   Q==;
X-CSE-ConnectionGUID: 7XusCSoTQRyPoylbBIQD3g==
X-CSE-MsgGUID: e0tuSB2zSQOciiycgYS7tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92297019"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="92297019"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 16:20:41 -0800
X-CSE-ConnectionGUID: KHGZyiSDTX+7vVLb85NEIw==
X-CSE-MsgGUID: guHvKwlBSOWj8IMDEHUDiw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2025 16:20:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQx5K-00000000DJZ-2XiX;
	Thu, 04 Dec 2025 00:20:38 +0000
Date: Thu, 4 Dec 2025 08:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 22/25] drivers/pinctrl/pinconf.h:174: multiple
 definition of `pinctrl_generic_pins_function_dt_node_to_map';
 drivers/pinctrl/core.o:drivers/pinctrl/pinconf.h:174: first defined here
Message-ID: <202512040842.oNw2moff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   792b41ff7de94d1e05bc7070de949d0b8634b0a8
commit: 6765ded8f8600e6d76699cfb11cf85c23c60b07a [22/25] pinctrl: add generic functions + pins mapper
config: i386-randconfig-r072-20251204 (https://download.01.org/0day-ci/archive/20251204/202512040842.oNw2moff-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040842.oNw2moff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040842.oNw2moff-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pinctrl/pinconf.o: in function `pinctrl_generic_pins_function_dt_node_to_map':
>> drivers/pinctrl/pinconf.h:174: multiple definition of `pinctrl_generic_pins_function_dt_node_to_map'; drivers/pinctrl/core.o:drivers/pinctrl/pinconf.h:174: first defined here
   ld: drivers/pinctrl/pinconf-generic.o: in function `pinctrl_generic_pins_function_dt_node_to_map':
>> drivers/pinctrl/pinconf.h:174: multiple definition of `pinctrl_generic_pins_function_dt_node_to_map'; drivers/pinctrl/core.o:drivers/pinctrl/pinconf.h:174: first defined here
   ld: drivers/pinctrl/pinctrl-sx150x.o: in function `pinctrl_generic_pins_function_dt_node_to_map':
>> drivers/pinctrl/pinconf.h:174: multiple definition of `pinctrl_generic_pins_function_dt_node_to_map'; drivers/pinctrl/core.o:drivers/pinctrl/pinconf.h:174: first defined here


vim +174 drivers/pinctrl/pinconf.h

   163	
   164	#if defined(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) && defined (CONFIG_OF)
   165	int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
   166							 struct device_node *np,
   167							 struct pinctrl_map **maps,
   168							 unsigned int *num_maps);
   169	#else
   170	int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
   171							 struct device_node *np,
   172							 struct pinctrl_map **maps,
   173							 unsigned int *num_maps)
 > 174	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
