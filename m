Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C95F208D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065094; cv=none; b=OQMFdnsRxbc2dpEmng7UAAOqsGfDh6jSy7G6PSuUH3ZU//N93gub0X5K1RgtC33GZ9O82LG4bdC4vy2pNbs6eOfp/uclOofUK6clJ7YXiCI5YGMEPy/LbdWt3vvsGYLS+WeDrNDRsLRODnCQfOBydn/TMYREwnYeVp9FrbhSCqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065094; c=relaxed/simple;
	bh=m1QtmVnaUsN+mXr3hawrmBkxGmIMh494eTN5lMWeD/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X6BnJGUynzm/a8b/1s+hFIbJu6nRxvZOWE7vobrt9gGGb5IAUN9NjudO3RqsDcCx9YEb2qzlwJZj0+fU4v53eo7z0YyrCwbVVfpibg6hJgMVtv8f6m/KcGWFsQhYyM8WvxnD/UCEMi1JhSzEP0QZ2b8XRBx/Tic2VvW6gzy9HY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUMbNAoL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUMbNAoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065093; x=1763601093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1QtmVnaUsN+mXr3hawrmBkxGmIMh494eTN5lMWeD/8=;
  b=DUMbNAoL36FaDCJTDmOIa2U5ZrhnwscTsVetf1zgbQxfFf2kylSM3Jw/
   Dx28OK7BL2lA9/8+Ww0AuIBnJLNnmOozPB4xYs1/bjR5ipnAP7zmFTqiV
   leiCEPdAPHC1GrKK0FFUMv1sBpdcBZ4JqQt7wNgYh9MwGNlxmxoMTIkzj
   AbNnjjEgOMsgDMX6CeGYjfRrwdwFfO+bPl3CJMNR4Bs8GUNI2OQCXZLOr
   3OvnV2DQ7EsVfF7D1sR6cv+atfwL4Sbdvr/arno2nFyzFxID6XYMOsHZR
   5q4/ajuchnYMI4bzgyj8VYY2wGjiY2Yq4yGPm24aHreaJ0ssdEOSMVwkw
   g==;
X-CSE-ConnectionGUID: qEfrem9+R0KSkBNdeAXVaQ==
X-CSE-MsgGUID: zabEnel/QxmHgUTC8F2qhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31851271"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31851271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: NaYrXeBHTSWv0hxHdzQp8g==
X-CSE-MsgGUID: vPnK8f2sSDO5l+QJ/Nw4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90572462"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 17:11:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000Nv-1U;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.12.y 109/139]
 include/linux/interconnect.h:118:1: warning: non-void function does not
 return a value
Message-ID: <202411191720.bdWHIgSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.12.y
head:   c7a2a43e9cf8aff2e1c41bf6d8d75b918df3b9e6
commit: 403c8e85dad04fedf3e79a9ad520f945cffa2b93 [109/139] interconnect: Add a wrapper to set the tag and apply it
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241119/202411191720.bdWHIgSz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191720.bdWHIgSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191720.bdWHIgSz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/opp/core.c:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/opp/core.c:23:
   In file included from drivers/opp/opp.h:15:
>> include/linux/interconnect.h:118:1: warning: non-void function does not return a value [-Wreturn-type]
     118 | }
         | ^
   5 warnings generated.
--
   In file included from drivers/opp/cpu.c:20:
   In file included from drivers/opp/opp.h:15:
>> include/linux/interconnect.h:118:1: warning: non-void function does not return a value [-Wreturn-type]
     118 | }
         | ^
   1 warning generated.


vim +118 include/linux/interconnect.h

   115	
   116	static inline int icc_set_tag_flush(struct icc_path *path, u32 tag)
   117	{
 > 118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
