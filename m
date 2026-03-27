Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18DB361662
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629110; cv=none; b=J9Lkux5uqBZEyZZHkE8zMvaie2ZwqeQ5MwRtqIbJ1w08ff3/EdaPRmOQGSnHEVJ6a86k4pkGGtfHkWpoX/w5EZMZQFLOajhoLJD1DNBq02uaxqCU+5bzJuckkXuwqi0Sd9fVgXykGblUUIOR137GeY9vtbNLaQNgcfkxaF4y0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629110; c=relaxed/simple;
	bh=FrSOFC/hLbotn57dVLgoYlgAD3D7C42DeUtqi+IGl9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qDcLVtGMXMT+opzbPMVOgHnUbY8S/Om0dLbwfPcPT1GTzBT+7Urb1WdKm8UFpO3zkJG9GXjqZrd2iUEORrtMbZZPGvv7EMVf9wHM24mXvqk07IH8YfSENOLpUyMhFvm0BgRTRC9xf3QQNVBqpHnjlwDgkRM64Dbe6dRG6PH6Fjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nizf8o+E; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nizf8o+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774629109; x=1806165109;
  h=date:from:to:cc:subject:message-id;
  bh=FrSOFC/hLbotn57dVLgoYlgAD3D7C42DeUtqi+IGl9M=;
  b=nizf8o+Eq+T3v4TJ2W5eKZH3+9MDktj0jrdi72yhAzou4sEfefTkVGdw
   5XX/u1NnBmzaOlX9+jc/3A44wr8aDsZGfa0QPl4OaBMDs0NOFH00uhAog
   LGY5Q2WCXE8+N38G41Z0Q4RwELa7Oy33Er1XpvBXiArBAMvhcv4BSsOKa
   8UsCuV5qrV3MMSJUpeOR2xrsrLtIvy57ghWFOaFbgkzMItuK8xw+vLWVj
   EWW42hxHATmRhAG6QsKRaDpBWEl53HfacYo9rCM/HbJMR93XTWbdimr4K
   XP5ggcw2QXrg9ZIS+RKnmIH4A0wQdm+6pi4SnQpcprX4BB2xiE3LUizrd
   A==;
X-CSE-ConnectionGUID: OrvbqqgNSIaGCsefBmM3OA==
X-CSE-MsgGUID: coEv7WPxTEmgmsnJlqtLeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75586174"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75586174"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 09:31:49 -0700
X-CSE-ConnectionGUID: oxw6Mq2BQ9mKK0vrMzF8tg==
X-CSE-MsgGUID: AX2Pg3RYT+2wCjJFiRyW4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="255867576"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2026 09:31:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6A64-00000000ATJ-09iK;
	Fri, 27 Mar 2026 16:31:44 +0000
Date: Sat, 28 Mar 2026 00:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 97/106]
 sound/soc/soc-card.c:481 soc_card_check_tplg_fes() warn: inconsistent
 indenting
Message-ID: <202603280046.B4ExcVKR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kuninori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 61c94a63000ef877101c0bb55224a0c13494eeab [97/106] component
config: hexagon-randconfig-r073-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280046.B4ExcVKR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280046.B4ExcVKR-lkp@intel.com/

smatch warnings:
sound/soc/soc-card.c:481 soc_card_check_tplg_fes() warn: inconsistent indenting

vim +481 sound/soc/soc-card.c

   471	
   472	static void soc_card_check_tplg_fes(struct snd_soc_card *card)
   473	{
   474		struct snd_soc_component *component;
   475		const struct snd_soc_component_driver *comp_drv;
   476		struct snd_soc_dai_link *dai_link;
   477		int i;
   478	
   479		for_each_component(component) {
   480			const struct snd_soc_component_driver *component_driver = snd_soc_component_to_driver(component);
 > 481				struct device *component_dev = snd_soc_component_to_dev(component);
   482	
   483			/* does this component override BEs ? */
   484			if (!component_driver->ignore_machine)
   485				continue;
   486	
   487			/* for this machine ? */
   488			if (!strcmp(component_driver->ignore_machine,
   489				    card->dev->driver->name))
   490				goto match;
   491			if (strcmp(component_driver->ignore_machine,
   492				   dev_name(card->dev)))
   493				continue;
   494		match:
   495			/* machine matches, so override the rtd data */
   496			for_each_card_prelinks(card, i, dai_link) {
   497	
   498				/* ignore this FE */
   499				if (dai_link->dynamic) {
   500					dai_link->ignore = true;
   501					continue;
   502				}
   503	
   504				dev_dbg(card->dev, "info: override BE DAI link %s\n",
   505					card->dai_link[i].name);
   506	
   507				/* override platform component */
   508				if (!dai_link->platforms) {
   509					dev_err(card->dev, "init platform error");
   510					continue;
   511				}
   512	
   513				if (component_dev->of_node)
   514					dai_link->platforms->of_node = component_dev->of_node;
   515				else
   516					dai_link->platforms->name = snd_soc_component_name(component);
   517	
   518				/* convert non BE into BE */
   519				dai_link->no_pcm = 1;
   520	
   521				/*
   522				 * override any BE fixups
   523				 * see
   524				 *	snd_soc_link_be_hw_params_fixup()
   525				 */
   526				dai_link->be_hw_params_fixup = component_driver->be_hw_params_fixup;
   527	
   528				/*
   529				 * most BE links don't set stream name, so set it to
   530				 * dai link name if it's NULL to help bind widgets.
   531				 */
   532				if (!dai_link->stream_name)
   533					dai_link->stream_name = dai_link->name;
   534			}
   535	
   536			/* Inform userspace we are using alternate topology */
   537			if (component_driver->topology_name_prefix) {
   538	
   539				/* topology shortname created? */
   540				if (!card->topology_shortname_created) {
   541					comp_drv = component_driver;
   542	
   543					snprintf(card->topology_shortname, 32, "%s-%s",
   544						 comp_drv->topology_name_prefix,
   545						 card->name);
   546					card->topology_shortname_created = true;
   547				}
   548	
   549				/* use topology shortname */
   550				card->name = card->topology_shortname;
   551			}
   552		}
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
