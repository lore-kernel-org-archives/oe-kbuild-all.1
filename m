Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF823EA8E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 06:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743244; cv=none; b=OwWqjeoSJi9NHmElwFJq0m4YRcPhLkltuKyWBC5Qf8HFCbJsoNW1FuiRUFGEURpO0h0aRtX89kYlHIL1Fhgy1gc9mZinZvO3y9wkRQdlSspmFF3E08VCeR/JDwO1sAKzWihJtE36AIE8VY9VQdYWL/aFDk9L3vGw/BoDoNWlc48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743244; c=relaxed/simple;
	bh=aAnc4oG93HD1qqDCbdBfnBM5Hv3bULePOWAOZwwu3/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5M/MWG0c3TKP9J6Ht9S+5A9kqWUnT1RtYLyrXJ7l485P2aNVTjAzGOvJIiu/d3O2KLxeN5IPOvk1BpnVtLIU0w+7VcYf+rcc83EtxIev128pichV0IWsWTtYPmJRtilviLHiBwqu6enJBgYf9Lzpc5rp3HZCL2liRo3r28+Ico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPojI5gt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPojI5gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764743243; x=1796279243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aAnc4oG93HD1qqDCbdBfnBM5Hv3bULePOWAOZwwu3/w=;
  b=JPojI5gthPyQAbAElkfBHFYcRWkB7knFpXHIQnh6RwceUSOU12y0hmWv
   f91HPs8wCm3ArU61hShYWyj9agWsHWMpAWHf/eOgffw98TUZJ8zS1Cn5h
   RvlouQJftzOE7R0unJU0IhW0hpd1hdIQtgO0MyCXURe7JsfdbTTlZCgRd
   zjElQLs2LESbLSkuKBqaYi8UsHPech0vjpfFpyIB+qmT94z7DWHtzkUbY
   X8uaPZ3Umpa9z4G6e0xz4oEl55FUe154YODfXEa5vvqiM+obpP4Oid/Gx
   HAw+xUF6T/d96zZ3lAQdQ2Q/J1bgEoJ/NER2Ki0ziIxi9Hlp9HjgP/Emn
   w==;
X-CSE-ConnectionGUID: MfpzzMlrT2CtAzEmuARjbw==
X-CSE-MsgGUID: crBP23wER2q5ahc2YXZmhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66688793"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66688793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 22:27:20 -0800
X-CSE-ConnectionGUID: UP3Mo56rTcK7LjdJkL16pA==
X-CSE-MsgGUID: vB2LRx/FQyCm2MoWW47rKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="193870640"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2025 22:27:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQgKa-00000000Aew-1otv;
	Wed, 03 Dec 2025 06:27:16 +0000
Date: Wed, 3 Dec 2025 14:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 22/25] drivers/pinctrl/pinconf.h:176:1: error:
 expected ';' before '}' token
Message-ID: <202512031447.VPSdr1i4-lkp@intel.com>
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
config: x86_64-randconfig-161-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031447.VPSdr1i4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031447.VPSdr1i4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031447.VPSdr1i4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/core.c:37:
>> drivers/pinctrl/pinconf.h:170:5: warning: no previous prototype for 'pinctrl_generic_pins_function_dt_node_to_map' [-Wmissing-prototypes]
     170 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinconf.h: In function 'pinctrl_generic_pins_function_dt_node_to_map':
>> drivers/pinctrl/pinconf.h:176:1: error: expected ';' before '}' token
     176 | }
         | ^


vim +176 drivers/pinctrl/pinconf.h

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
   175		return -ENOTSUPP
 > 176	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
