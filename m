Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914213;
	b=4dxhrPvNzm0r1R2WR5I6KiQehpqjgkAKkbcGXAolroJO327gUfCT5ih3/T7wYZ5ajTWu
	 odbwXCMSDQdg7ymSgLTpbIDs2nu/mVl/SyfMLNiHGdq+0Iqotpe9Zb/SKwm8rByT+8xjL
	 edTU5OmH/fzmPLZvyiv+EvCp0tLqOxH+6gbYvmUXqy1gmhfR7RUMiiJ00BoHO3ZHUE43+
	 Z2kWg2odO7FCtf9GE5oEamoc27Xv2AhY3CuQXk2UDExlX+aVAm+KE0Y9wRA6wzhWj3iLx
	 /bix8iZah4UMMURY4Z9RMgSi6YALOgs2n0RluktcouLNl/dpy+c4IhXFLvfN8NOb/fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914213;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kbAMULgpvdcxuci6ZA98TI9liV++3FfDSO+ys0enRIw=;
	b=fl6BcJhy8wE9/AI/lmDSjJI34NB+VN/NogAzHzSBZgcTcH/mmujypBfsX9LWIWvRth+a
	 oKwJvqvUBFSc4zvQaxfAzw02VoiN/8gZS/oWdSUxosvHQS/7NGOYMHbR04PQYfsOAybrW
	 mtpfYot1TMZUQHBDT90A8X8Rl1uAXEZHQqEu92qAbeleT6aXtbrJdBRoSkeM//UjCkkWJ
	 Z9cclOsQ6JlPHIU+n5xYu0dy+4sFcJSUniGQBnzE8+XmjsH1xbo/YkHGhnPliLyFVnQs0
	 AAybjB9qioVaqHpsyaMx8b7bS04Kw0RvrrEfq6YhApMDZeNbev/bI5mbfoDZLfBzSLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RIhqKY55;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9D8606A32E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 21:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A9D8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RIhqKY55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793914211; x=1825450211;
  h=date:from:to:cc:subject:message-id;
  bh=qDfvBMUKOJ7OJMf4SX9rF4SebBXTDazFnAOGUdsqTfM=;
  b=RIhqKY55Of5RNLtMg/ZoWl/VX+sAVvWomX4KbHkDS7t0qbfVyBAsT0ci
   2CM6joTPuqG+JOrPvkOPKdaZICuyEsQ64Ep0yfg9I+8agQuFrfz/KYZ95
   m5PXcZN/EYtYQr/FimxjLXRZXRXWPK6/zKudL5qDdEjQLNat8jpx+Kxm6
   bHaVeEuBBPYcg4JL2ivMPSc4iFjqmp5cL06HfavLuCQwyNtgjKPRRrfh4
   DcD6FSJ13K2R++/o2Q6DRtIGW9NE9B3r4w/OH5FSNnk0bJ0RhurTlruEK
   JocRG1rTRD6XJOb54AUArjTihEyADQrFl5W2mkcDkn+i54Flwm2wTYare
   A==;
X-CSE-ConnectionGUID: ZFtjXb4PT8CS5YfQ0dstZg==
X-CSE-MsgGUID: nDc4l+WCTOaJrut1PgqyCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2714137"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2714137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:30:11 -0800
X-CSE-ConnectionGUID: Ol5wUDPGQ9CyzbEdmFJamg==
X-CSE-MsgGUID: n3FzWWj9SeOIKWn/BQxIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7432507"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2026 13:30:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP525-00000000mt5-47DE;
	Thu, 05 Nov 2026 21:30:05 +0000
Date: Fri, 06 Nov 2026 05:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next 18/34]
 drivers/leds/leds-pca955x.c:562:32: warning: returning 'void *' from a
 function with return type 'int' makes integer from pointer without a cast
Message-ID: <202611060517.YOgU4Gr8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a379f4e0adf2de7b11aa3ef87eeb7d9c838069b3
commit: abeb74220fefe28ab68789659f554f49e3b4a51e [18/34] leds: pca955x: Take a reference on the child firmware node
config: sh-randconfig-1000-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060517.YOgU4Gr8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060517.YOgU4Gr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060517.YOgU4Gr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/of.h:20,
                    from include/linux/irqdomain.h:14,
                    from include/linux/gpio/driver.h:9,
                    from drivers/leds/leds-pca955x.c:44:
   drivers/leds/leds-pca955x.c: In function 'pca955x_parse_fwnode':
   drivers/leds/leds-pca955x.c:544:44: error: 'client' undeclared (first use in this function)
     544 |         device_for_each_child_node_scoped(&client->dev, child) {
         |                                            ^~~~~~
   include/linux/property.h:202:44: note: in definition of macro 'device_for_each_child_node_scoped'
     202 |                 device_get_next_child_node(dev, NULL);                  \
         |                                            ^~~
   drivers/leds/leds-pca955x.c:544:44: note: each undeclared identifier is reported only once for each function it appears in
     544 |         device_for_each_child_node_scoped(&client->dev, child) {
         |                                            ^~~~~~
   include/linux/property.h:202:44: note: in definition of macro 'device_for_each_child_node_scoped'
     202 |                 device_get_next_child_node(dev, NULL);                  \
         |                                            ^~~
>> drivers/leds/leds-pca955x.c:562:32: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     562 |                         return ERR_PTR(res);
         |                                ^~~~~~~~~~~~


vim +562 drivers/leds/leds-pca955x.c

   532	
   533	static int pca955x_parse_fwnode(struct pca955x *pca955x)
   534	{
   535		struct device *dev = &pca955x->client->dev;
   536		u8 bits = pca955x->chipdef->bits;
   537		struct pca955x_led *led;
   538		int count;
   539	
   540		count = device_get_child_node_count(dev);
   541		if (count > bits)
   542			return -ENODEV;
   543	
   544		device_for_each_child_node_scoped(&client->dev, child) {
   545			u32 reg;
   546			int res;
   547	
   548			res = fwnode_property_read_u32(child, "reg", &reg);
   549			if ((res != 0) || (reg >= bits))
   550				continue;
   551	
   552			led = &pca955x->leds[reg];
   553			if (led->fwnode)
   554				devm_release_action(&client->dev, pca955x_fwnode_put,
   555						    led->fwnode);
   556			led->type = PCA955X_TYPE_LED;
   557			led->fwnode = fwnode_handle_get(child);
   558	
   559			res = devm_add_action_or_reset(&client->dev,
   560						       pca955x_fwnode_put, led->fwnode);
   561			if (res)
 > 562				return ERR_PTR(res);
   563	
   564			led->default_state = led_init_default_state_get(child);
   565	
   566			fwnode_property_read_u32(child, "type", &led->type);
   567		}
   568	
   569		return 0;
   570	}
   571	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
