Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB072D1F4E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936289; cv=none; b=AZ1YwLYjBG7SqdDzbMuIJnGplZywHq6YQBFod3nUBMErK2NetBOdLKqcxx0/AO1p4lP9J1EGRoFlhUWkuMBbQ9tDH5T3U347m8gqdXg2qKTO0EwN5QoQ3f7AvAlV80dU1vzi2r9SaY/pxPhGKztpQZR1WSVxyEn775KKKgC+ptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936289; c=relaxed/simple;
	bh=Bozte8L1ls+A2q90MlPMmsHyyJIgzW/Y7cqxJ5dAXGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u36IUQ8QihKn9nmM5ptrMl7N3gSDL75sEw5zz3AL51LDgPIs4+vUNGg+xHYUosJNLYveX8h4XLPm6XHKcEd+WmQzHzfznb9+LKcr6ksf75m3csRedWWu3kU9akyA7mQ2t1/lIwfuvLLjiJ+HDdK2aBrbQHvERlVre31W5nT/+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hwp2inR0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hwp2inR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762936289; x=1794472289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bozte8L1ls+A2q90MlPMmsHyyJIgzW/Y7cqxJ5dAXGg=;
  b=Hwp2inR0H3LdNO17atJr8/sWq6kiJ/E1ZIMRwpTt2r32O/PGKvoAaEfm
   AekXsnovr/r7VkA6ISzWVb88kYL6OupP26N9B7Vp9bP+7IlRNvd4Fnw+A
   gsSmZdydWpneEjLwwbl1TrfU48bFH77ze0PvVFIJhdQZHcgzBfy8sLT+2
   uVlPcD6Q7mF/ewKMIHVSOKTvWRECTQ7g+XFd1N5KcSIUFo+vwKXrTMFYd
   dKRa+KwhK9A4E2UoO6w474KtLH+Kuk6vLZ93yeMexwqHSd05UwfyhD8YL
   /Kg9TIMeBEo4mFpdEJzxXXz8AgA0EEBE1HQrx+Yo+G64nYH1vmpAGtPxp
   g==;
X-CSE-ConnectionGUID: Omf9YRONTTqDRPkrv2brHA==
X-CSE-MsgGUID: X3pgVXv1QV2m/lWGaU2i3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76098431"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="76098431"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 00:31:28 -0800
X-CSE-ConnectionGUID: szlijYz/S6WH+AG6HsOpyQ==
X-CSE-MsgGUID: D/GCmVURQpegfMK+oh8NMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="219887215"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 00:31:26 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ6GC-00041z-0D;
	Wed, 12 Nov 2025 08:31:24 +0000
Date: Wed, 12 Nov 2025 16:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 19/20] drivers/pinctrl/pinctrl-mpfs-mssio.c:373:17:
 error: incomplete definition of type 'struct group_desc'
Message-ID: <202511121609.GYPXqw7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   0f0b8ab0b2d5245d9b9f4d73a6d28421de5c8b7d
commit: 24262b12792e95c94625a991f3009abb9e3c349e [19/20] pinctrl: add polarfire soc mssio pinctrl driver
config: hexagon-randconfig-001-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121609.GYPXqw7H-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121609.GYPXqw7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121609.GYPXqw7H-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-mpfs-mssio.c:300:9: error: call to undeclared function 'pinctrl_generic_add_group'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = pinctrl_generic_add_group(pctrl_dev, group_name, pins, npins, pinmuxs);
                         ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:320:8: error: call to undeclared function 'pinmux_generic_add_function'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = pinmux_generic_add_function(pctrl_dev, np->name, group_names, ngroups, NULL);
                 ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:320:8: note: did you mean 'pinmux_generic_free_functions'?
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:333:22: error: use of undeclared identifier 'pinctrl_generic_get_group_count'
           .get_groups_count = pinctrl_generic_get_group_count,
                               ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:334:20: error: use of undeclared identifier 'pinctrl_generic_get_group_name'
           .get_group_name = pinctrl_generic_get_group_name,
                             ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:335:20: error: use of undeclared identifier 'pinctrl_generic_get_group_pins'; did you mean 'pinctrl_get_group_pins'?
           .get_group_pins = pinctrl_generic_get_group_pins,
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                             pinctrl_get_group_pins
   include/linux/pinctrl/pinctrl.h:206:12: note: 'pinctrl_get_group_pins' declared here
   extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
              ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:369:10: error: call to undeclared function 'pinctrl_generic_get_group'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           group = pinctrl_generic_get_group(pctrl_dev, gsel);
                   ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:369:8: error: incompatible integer to pointer conversion assigning to 'const struct group_desc *' from 'int' [-Wint-conversion]
           group = pinctrl_generic_get_group(pctrl_dev, gsel);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:373:17: error: incomplete definition of type 'struct group_desc'
           configs = group->data;
                     ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:366:15: note: forward declaration of 'struct group_desc'
           const struct group_desc *group;
                        ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:375:27: error: incomplete definition of type 'struct group_desc'
           for (int i = 0; i < group->grp.npins; i++)
                               ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:366:15: note: forward declaration of 'struct group_desc'
           const struct group_desc *group;
                        ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:381:25: error: use of undeclared identifier 'pinmux_generic_get_function_count'; did you mean 'pinmux_generic_free_functions'?
           .get_functions_count    = pinmux_generic_get_function_count,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                     pinmux_generic_free_functions
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:382:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
           .get_function_name      = pinmux_generic_get_function_name,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                     pinmux_generic_free_functions
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:383:25: error: use of undeclared identifier 'pinmux_generic_get_function_groups'; did you mean 'pinmux_generic_free_functions'?
           .get_function_groups    = pinmux_generic_get_function_groups,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                     pinmux_generic_free_functions
   drivers/pinctrl/pinmux.h:177:20: note: 'pinmux_generic_free_functions' declared here
   static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
                      ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:381:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
           .get_functions_count    = pinmux_generic_get_function_count,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:382:23: error: incompatible function pointer types initializing 'const char *(*)(struct pinctrl_dev *, unsigned int)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
           .get_function_name      = pinmux_generic_get_function_name,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:383:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *, unsigned int, const char *const **, unsigned int *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
           .get_function_groups    = pinmux_generic_get_function_groups,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:644:10: error: call to undeclared function 'pinctrl_generic_get_group'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           group = pinctrl_generic_get_group(pctrl_dev, gsel);
                   ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:644:8: error: incompatible integer to pointer conversion assigning to 'const struct group_desc *' from 'int' [-Wint-conversion]
           group = pinctrl_generic_get_group(pctrl_dev, gsel);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-mpfs-mssio.c:652:13: error: incomplete definition of type 'struct group_desc'
           pin = group->grp.pins[0];
                 ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:639:15: note: forward declaration of 'struct group_desc'
           const struct group_desc *group;
                        ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:658:27: error: incomplete definition of type 'struct group_desc'
           for (int i = 0; i < group->grp.npins; i++)
                               ~~~~~^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:639:15: note: forward declaration of 'struct group_desc'
           const struct group_desc *group;
                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +373 drivers/pinctrl/pinctrl-mpfs-mssio.c

   361	
   362	static int mpfs_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev, unsigned int fsel,
   363					unsigned int gsel)
   364	{
   365		struct mpfs_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
   366		const struct group_desc *group;
   367		struct mpfs_pinctrl_mux_config *configs;
   368	
   369		group = pinctrl_generic_get_group(pctrl_dev, gsel);
   370		if (!group)
   371			return -EINVAL;
   372	
 > 373		configs = group->data;
   374	
   375		for (int i = 0; i < group->grp.npins; i++)
   376			mpfs_pinctrl_set_pin_func(pctrl, configs[i].pin, configs[i].function);
   377	
   378		return 0;
   379	}
   380	static const struct pinmux_ops mpfs_pinctrl_pinmux_ops = {
   381		.get_functions_count	= pinmux_generic_get_function_count,
   382		.get_function_name	= pinmux_generic_get_function_name,
   383		.get_function_groups	= pinmux_generic_get_function_groups,
   384		.set_mux		= mpfs_pinctrl_set_mux,
   385	};
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
