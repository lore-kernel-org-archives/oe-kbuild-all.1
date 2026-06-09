Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B313DDAA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 02:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780972387; cv=none; b=kcscEekSV9TyAokwcXGUZNLAR+tkNHM/+JxL/MZVrQTrKrLCtlo+D/IwdH1ONWaiZeiSrEyisC7gn0BdFpa9QwnhwgHq7zvoF0kHPZGHtv1gBST6VJdWqWCm87eIJG47p4Fhz/PxgQR1LsQpIWqz+CDsUQhNrNGsS5ee4xpWvYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780972387; c=relaxed/simple;
	bh=7+C2WZZYwe2vjpiFBeekbv4omDHOemASdqfbP0Z5gpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cmksl8ibYA0byD9XSgvrhH91vIQcZSotzPBsg6AzVSWIHMQDv8RVs8vSrYsRSU7WuMY789zjl5+XtrrvHyHw3EeKzSOE/0ewqLKV7xbJhxf1g+8OHywv3lCG9f4CMp+ZA3Rant3G3P8toY9w5MjopHk9H8x/YTr99ViXdBm8k74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwCEICT2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwCEICT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780972385; x=1812508385;
  h=date:from:to:cc:subject:message-id;
  bh=7+C2WZZYwe2vjpiFBeekbv4omDHOemASdqfbP0Z5gpc=;
  b=nwCEICT2j7IIsMFN1f82jRa9zJNkRqywRZLn3AswpaYKYQ5I97GcBciQ
   fq3BwPwF7sKpvCqdExI+UqHN6wjO3qsp/NdJgSTkFVGscMZxbgdRTYnl4
   +sABywbwu40cNEqHbmK7wl11YLb8g6frzfKnt/omyx8NLos8AHxnZAyJF
   +7x98ezmywYwy+0Jm0s/9wl7QgPnOBzGxS2bhmm7/4ofmwHK87SH6ahLq
   3kETYGcyI+zisJn59i1TD0sUoi44kYV9rG6mdAtvpHIt6C51w/1KKJCau
   uWoqX5AQKduOg0bPL4NxHzeOjQigEZjbzzsjmpVwxQgpPgQSKQ7D8E7W6
   Q==;
X-CSE-ConnectionGUID: 8FfOIadgSv+8XeZptLdDKA==
X-CSE-MsgGUID: sn4rQD3PRR6MPtiaP0PcVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92831430"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="92831430"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 19:33:05 -0700
X-CSE-ConnectionGUID: /UNeCf4UQt25KQbQPTGM+A==
X-CSE-MsgGUID: mwwlqL7dTVmLZTPejOMSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="245574906"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Jun 2026 19:33:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWmGy-00000000JWg-3ys2;
	Tue, 09 Jun 2026 02:33:00 +0000
Date: Tue, 09 Jun 2026 10:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 4/4]
 sound/soc/intel/avs/path.c:137:38: warning: 'strcmp' reading 1 or more bytes
 from a region of size 0
Message-ID: <202606091003.h7ZQ4kF0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   839a808be3da5300418d7231fa1f5ae5f05d5ab3
commit: 595b7f155b926460a00776cc581e4dcd01220006 [4/4] ASoC: Intel: avs: Conditional-path support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260609/202606091003.h7ZQ4kF0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091003.h7ZQ4kF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 595b7f155b92 ("ASoC: Intel: avs: Conditional-path support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091003.h7ZQ4kF0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'avs_tplg_path_template_id_equal',
       inlined from 'avs_condpath_find_match' at sound/soc/intel/avs/path.c:160:6,
       inlined from 'avs_condpaths_walk' at sound/soc/intel/avs/path.c:1269:13:
>> sound/soc/intel/avs/path.c:137:38: warning: 'strcmp' reading 1 or more bytes from a region of size 0 [-Wstringop-overread]
     137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/intel/avs/path.h:14,
                    from sound/soc/intel/avs/path.c:15:
   sound/soc/intel/avs/topology.h: In function 'avs_condpaths_walk':
   sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object 'id' of size 4
     150 |         u32 id;
         |             ^~
   sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object 'id' of size 4


vim +/strcmp +137 sound/soc/intel/avs/path.c

   133	
   134	static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
   135						    struct avs_tplg_path_template_id *id2)
   136	{
 > 137		return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
   138	}
   139	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
