Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BE73C2797
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073008; cv=none; b=Mg2G+fzSepJjcVteL9jSbOxiRTM/zavSBzMbRh2iKgMC9pWxFWPhMTyRhV391626rovSDRhcZ/orpjGeQntGWHKYIWSgIQDyyCejDsn7m+8I1gTG9BVqQA6Zgu2ZT8oGU6qp+r0N8oUIjGwdzRgcfaBNySq+B16kBBqmGpCM2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073008; c=relaxed/simple;
	bh=cyWsyva8ATykpRLTqBvk2n25sCLDkP7O1eiMqeyI/ao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WTDrEl0Yf5tTHX+33fEyjLJcsITcQbihN7OEZsc9P3LlBeYXEEklqeUcqR3TTBTjcUBODmC5TAOZ7vfOOXsAthGnXf6eEnbnW9maYitMsBF82tLk/CB4DxvuxiutaMq87uIhwyEyUkppTGwiIa3G+Xtq0OWZL7bdzsEe9y+H3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbuHHD+w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbuHHD+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773073006; x=1804609006;
  h=date:from:to:cc:subject:message-id;
  bh=cyWsyva8ATykpRLTqBvk2n25sCLDkP7O1eiMqeyI/ao=;
  b=RbuHHD+wlvZ5ZB/NYEHmW9FWOgEYbXEkqKWZoAMTmVsRnX1W/zQ1nz/m
   sKKOEAen7TBAPuVpthA9o+X83QBJ9Ox7qUrvl3id8/rqzZwvJQdjWz8HX
   x8ZWJ1hRDJJPnAFnR5SO9mZOG4gjDAVxgvMInl5TD6ou4WJxdiasGldF9
   f2/Tb64/OHtXAM0kflculGZqj+7EcvngMj7fWMYiFCCue5ep5dX+Ei2LO
   6BhD61SSwac1i8wtUW/ohQ9c+EDBt9nvNIlAfLLqXXqtrT1Di0bjvDtOk
   ltgzM1/+ccUz9oPwu+vVdIBT7CNzgXzCxurm/uq0LXNfv3Gq8Vy5hqPlu
   Q==;
X-CSE-ConnectionGUID: lHLuIW0mQ9SxoKkzSoKpBw==
X-CSE-MsgGUID: QkRjqZA0T9eDj9rlrBE3TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77707183"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77707183"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 09:16:46 -0700
X-CSE-ConnectionGUID: PbmkvQOuTni6aRFmmrpTCg==
X-CSE-MsgGUID: Q0WUSikNR5qrBKsBoDm4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224251737"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2026 09:16:45 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzdHe-000000000X6-1eeC;
	Mon, 09 Mar 2026 16:16:42 +0000
Date: Tue, 10 Mar 2026 00:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 14/87] undefined reference to
 `register_fwnode_pcs_notifier'
Message-ID: <202603100002.LJXw3rsu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: f28c5171542f5109193fdabe2a7e7b807cfdb78f [14/87] net: pcs: airoha: add PCS driver for Airoha SoC
config: microblaze-randconfig-r053-20260309 (https://download.01.org/0day-ci/archive/20260310/202603100002.LJXw3rsu-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100002.LJXw3rsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100002.LJXw3rsu-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `phylink_create':
>> (.text+0x7888): undefined reference to `register_fwnode_pcs_notifier'
   microblaze-linux-ld: drivers/net/phy/phylink.o: in function `pcs_provider_notify':
>> (.text+0x7ba0): undefined reference to `fwnode_phylink_pcs_get_from_fwnode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
