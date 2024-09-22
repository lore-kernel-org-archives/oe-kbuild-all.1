Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F53193071
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 01:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726968858; cv=none; b=WYAJqLgS8jDn7pukawrkzgapgJEmw/G3XlJPCbGLLQTnv/vJ6MhvLKVAmm1P8A4HvxUYlnHGkRLjDwfj/e2n/k1knt2MKfPaAa1xXLF3Za3Z0Mrj+35kiQ0FEG17tAj1EgtjX8MCxw3l0Ei7GOFQ65ctzMv3ibrYVutxkxDWhLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726968858; c=relaxed/simple;
	bh=1nkCZlKlE+JE1I3M3Pq5g5Zctxdu231v4n3Ag9cXTyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCMcle5R/HaZhXYApGA/JmrNz8pgwoJopBJQ9yX3bZ1VYwa5kBUop9MrNB746hKXfAq7w0mGpywp+Rr3zQOJhnx+pnYIg2RQUT5uWCkcfM2GqDgjhiuq5CMNmo3UzRy0ykrfxKlGX9KaTPrfybphqxtL1nqDtdKLlGZ3eXdACD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj4ILxaF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj4ILxaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726968857; x=1758504857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1nkCZlKlE+JE1I3M3Pq5g5Zctxdu231v4n3Ag9cXTyM=;
  b=Fj4ILxaFKGJcfp9geZEz9w5V+XWlHtGB3oyAMyapnpKfgcV0OW5dbNNY
   Zkbs7R6rH6QTYc1/sxbJkj/aiDagVDydVc7hET3/aCf0cNNz+dd3KR52G
   y0jWtt2VIuvsjsyr+ojxBamZEcvONhWjT9dPAoHSiwFvs8l7jLZ66ZBIa
   aTndW+8qTFvpcXNpjoldzG7QZ3Xv3eadhGolM05HvARLq6q/+pjOJvr+y
   858UCu05Pff3PnocmlPcmbShv495tPmnJkP6RHNoXJxEhyro5C+TOrg9L
   jCr8tee1eUMsowpnhacGh5O3xIYKMAO9+eakoXeiLhrzDHkDFCE/sq/7x
   A==;
X-CSE-ConnectionGUID: 3wHfJED0SJiKq1Vuks4wZQ==
X-CSE-MsgGUID: OUDuF3JzR9muu5Oan6nC5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37077096"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="37077096"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:34:14 -0700
X-CSE-ConnectionGUID: 83Kb8Im6QMm4Gx2GWmJbGQ==
X-CSE-MsgGUID: pVRUZo9pRmiCruGUSRmpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="74809216"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Sep 2024 18:34:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssBUH-000FwF-1F;
	Sun, 22 Sep 2024 01:34:09 +0000
Date: Sun, 22 Sep 2024 09:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com, "Luke D. Jones" <luke@ljones.dev>
Subject: Re: [PATCH v3 1/5] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
Message-ID: <202409220913.WEYnCgBL-lkp@intel.com>
References: <20240918094250.82430-2-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918094250.82430-2-luke@ljones.dev>

Hi Luke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240918]
[also build test WARNING on v6.11]
[cannot apply to linus/master v6.11 v6.11-rc7 v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-D-Jones/platform-x86-asus-armoury-move-existing-tunings-to-asus-armoury-module/20240918-174540
base:   next-20240918
patch link:    https://lore.kernel.org/r/20240918094250.82430-2-luke%40ljones.dev
patch subject: [PATCH v3 1/5] platform/x86: asus-armoury: move existing tunings to asus-armoury module
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240922/202409220913.WEYnCgBL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220913.WEYnCgBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220913.WEYnCgBL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/x86/asus-armoury.c:23:
>> include/linux/platform_data/x86/asus-wmi.h:182:35: warning: 'asus_use_hid_led_dmi_ids' defined but not used [-Wunused-const-variable=]
     182 | static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/platform/x86/asus-wmi.c:45:
>> drivers/platform/x86/asus-wmi.h:89:35: warning: 'asus_rog_ally_device' defined but not used [-Wunused-const-variable=]
      89 | static const struct dmi_system_id asus_rog_ally_device[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/asus_use_hid_led_dmi_ids +182 include/linux/platform_data/x86/asus-wmi.h

ffb6ce7086ee2d Daniel Drake  2018-10-09  180  
a720dee5e03923 Luke D. Jones 2024-07-13  181  /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
a720dee5e03923 Luke D. Jones 2024-07-13 @182  static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
a720dee5e03923 Luke D. Jones 2024-07-13  183  	{
a720dee5e03923 Luke D. Jones 2024-07-13  184  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  185  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
a720dee5e03923 Luke D. Jones 2024-07-13  186  		},
a720dee5e03923 Luke D. Jones 2024-07-13  187  	},
a720dee5e03923 Luke D. Jones 2024-07-13  188  	{
a720dee5e03923 Luke D. Jones 2024-07-13  189  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  190  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
a720dee5e03923 Luke D. Jones 2024-07-13  191  		},
a720dee5e03923 Luke D. Jones 2024-07-13  192  	},
a720dee5e03923 Luke D. Jones 2024-07-13  193  	{
a720dee5e03923 Luke D. Jones 2024-07-13  194  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  195  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
a720dee5e03923 Luke D. Jones 2024-07-13  196  		},
a720dee5e03923 Luke D. Jones 2024-07-13  197  	},
a720dee5e03923 Luke D. Jones 2024-07-13  198  	{
a720dee5e03923 Luke D. Jones 2024-07-13  199  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  200  			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
a720dee5e03923 Luke D. Jones 2024-07-13  201  		},
a720dee5e03923 Luke D. Jones 2024-07-13  202  	},
a720dee5e03923 Luke D. Jones 2024-07-13  203  	{
a720dee5e03923 Luke D. Jones 2024-07-13  204  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  205  			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
a720dee5e03923 Luke D. Jones 2024-07-13  206  		},
a720dee5e03923 Luke D. Jones 2024-07-13  207  	},
a720dee5e03923 Luke D. Jones 2024-07-13  208  	{
a720dee5e03923 Luke D. Jones 2024-07-13  209  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  210  			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
a720dee5e03923 Luke D. Jones 2024-07-13  211  		},
a720dee5e03923 Luke D. Jones 2024-07-13  212  	},
a720dee5e03923 Luke D. Jones 2024-07-13  213  	{ },
a720dee5e03923 Luke D. Jones 2024-07-13  214  };
a720dee5e03923 Luke D. Jones 2024-07-13  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
