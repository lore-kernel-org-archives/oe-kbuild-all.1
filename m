Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659928E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 05:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGkSOsSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703740775; x=1735276775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeBcNQfdNm8+LHkizWxvN/4xCdz34R/h8dvgz8x6eo8=;
  b=oGkSOsSwV78FWhONkXeRLqtk/36b2VD/l1VKvxDy91hgQ+sRpH1PeRpt
   Mumi0cwOmGsKi2F+1hdKMJ8vbfSigmSaN2P+BAT9AyqNyW8cfwGEHN/Mk
   5rAge7kQfwWqFr8WuLWAmjcIQm4MTav8AUMHmINOj1lUbXEgoEnujmtAM
   8ldWaZhF2GFTQq5AFdgoTJoRtJ55gYuaAQYuY5rhTy2MINJFUkXffNMqQ
   iejDZ/m7ZTRcMbs3BAh6ogoyTBiO0dU3vPAjMTbo+7IMdZXxk8QyPu6lt
   QTsEFwo3R4GG5J/o+G5OtA7V8uINsxOZYzG+OAsPvXARBLKOPECrIXT2b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482692891"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="482692891"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 21:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754643979"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="754643979"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Dec 2023 21:19:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIink-000G8B-05;
	Thu, 28 Dec 2023 05:19:24 +0000
Date: Thu, 28 Dec 2023 13:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.0 14/24] lib/dynamic_debug.c:158:43-48: WARNING:
 conversion to bool not needed here
Message-ID: <202312281329.isaE1arc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.0
head:   1f42080421213a7819e069d5b6d22cef0b6c9c61
commit: 174f9fe4a01a4aaaa0ecd08c295412b44e1a47d2 [14/24] dyndbg: add support for default trace destination
config: x86_64-randconfig-102-20231228 (https://download.01.org/0day-ci/archive/20231228/202312281329.isaE1arc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312281329.isaE1arc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:158:43-48: WARNING: conversion to bool not needed here

vim +158 lib/dynamic_debug.c

   154	
   155	static const
   156	char *read_T_args(const char *str, struct flag_settings *modifiers)
   157	{
 > 158		bool has_colon = *(str+1) == ':' ? true : false;
   159		int len = 0, idx = DST_TR_EVENT;
   160		char *end = NULL;
   161	
   162		if (!has_colon) {
   163			if (!has_tr_default_dst())
   164				return NULL;
   165			idx = trc_tbl.default_dst;
   166			goto end;
   167		}
   168	
   169		str += 2;
   170		end = strchr(str, '.');
   171		if (end && *(end + 1) == '\0')
   172			return NULL;
   173	
   174		if (end) {
   175			len = end - str;
   176			*end = '\0';
   177		} else
   178			len = strlen(str);
   179		len -= 1;
   180	
   181		/* destination trace events */
   182		if (!strcmp(str, DD_TR_EVENT))
   183			goto end;
   184	
   185		idx = find_tr_instance(str);
   186		if (idx < 0) {
   187			if (!has_tr_default_dst() ||
   188			    has_colon)
   189				return NULL;
   190			idx = trc_tbl.default_dst;
   191		}
   192	end:
   193		modifiers->trace_dst = idx;
   194		return end ? end : str + len;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
