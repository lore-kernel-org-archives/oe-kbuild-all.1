Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5069224B04
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764741320; cv=none; b=sqp6pW1bD/Tu7ArCZGxZ2hhxgHM7Swsdet9MLBj1ozBvn8ujZybyqvsqUFrMBsRdU4SncIOtm8rpuWTOP1KajWfThKe3p1joVt7QPFf2af9ud7JPHiqmoJ0dN9fBneYlfM2OTLLJJ93//nd5sRwpzvJUxb/AhiTsF1Dw3ePFToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764741320; c=relaxed/simple;
	bh=+Gz0eqDhKsjr1+dH0qKY49HSCEzWK5rdT6ItsnopJtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UeHsW2PAmzOnIVHSPh7yZC+cBBW3W1Fe6R4ZL6bbS3cCR0qoBf7rq9vqV8P8Rn6qM9I9tSXFc70U29cXL4VYn3WCJ5DG873AO68o1zvwlrIUgOWqfTXMfa9VOvRm2KbvaDFlAzfhJDoCQb1OU0Ab+AwhXxXnARsWhkjBtRrDrVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7S7gA2Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7S7gA2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764741319; x=1796277319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Gz0eqDhKsjr1+dH0qKY49HSCEzWK5rdT6ItsnopJtk=;
  b=F7S7gA2QzeIUoxaW08FP2YNPZzDPK6cTiUdzlHvPuQBaiOzE7U9x1a5s
   CYrylV7KQsUSd+wjKQHFzcnOdW/cZNyLDLtE7+hvcK8J4d1cSEtWzMm7c
   UgHMPZIDSc2c3sZJLhG54St8RTlkwT6eiNNDLJQXvbQmLe84L0hH6dpt3
   oSBXFLkenSxc77qM4rCg/1lMRUVR9NMpgFqLn53zL88jmZNfwg2LBOhax
   7ul+xf9wgEWg/fzI1/xFZaSeL8HBnvLrp/DG318t2OJj3IGju+KRTBW8h
   XE4z2qyv6LuGA3RLKnMLTGtmZeMmw1FiIyJvVYFJGfbB1Slo5k1ck6ihb
   w==;
X-CSE-ConnectionGUID: Cud/86Z7RvmmCbjqiWnzDA==
X-CSE-MsgGUID: cJh/greWRqa90ovQXunauw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66891568"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66891568"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 21:55:18 -0800
X-CSE-ConnectionGUID: WhcYh1akRrCp/y6ISz/RVw==
X-CSE-MsgGUID: iIjRO9xRTyuoBDryvpC78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194680707"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2025 21:55:18 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQfpb-00000000Add-1mRE;
	Wed, 03 Dec 2025 05:55:15 +0000
Date: Wed, 3 Dec 2025 13:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 22/25] drivers/pinctrl/pinconf.h:175:18: error:
 expected ';' after return statement
Message-ID: <202512031341.irCmGclc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   adc6515a5eb0c69fae2b21414dfa290e4d215a5d
commit: e300bffd74b605b291ebc590e8f019ffe057950d [22/25] pinctrl: add generic functions + pins mapper
config: x86_64-buildonly-randconfig-003-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031341.irCmGclc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031341.irCmGclc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031341.irCmGclc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/pinctrl-sx150x.c:29:
>> drivers/pinctrl/pinconf.h:175:18: error: expected ';' after return statement
     175 |         return -ENOTSUPP
         |                         ^
         |                         ;
>> drivers/pinctrl/pinconf.h:170:5: warning: no previous prototype for function 'pinctrl_generic_pins_function_dt_node_to_map' [-Wmissing-prototypes]
     170 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^
   drivers/pinctrl/pinconf.h:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         | ^
         | static 
   1 warning and 1 error generated.


vim +175 drivers/pinctrl/pinconf.h

   163	
   164	#if defined(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) && defined (CONFIG_OF)
   165	int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
   166							 struct device_node *np,
   167							 struct pinctrl_map **maps,
   168							 unsigned int *num_maps);
   169	#else
 > 170	int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
   171							 struct device_node *np,
   172							 struct pinctrl_map **maps,
   173							 unsigned int *num_maps)
   174	{
 > 175		return -ENOTSUPP

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
