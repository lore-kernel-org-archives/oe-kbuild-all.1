Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12FE1DE4E0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786290633; cv=none; b=JPQ7UhEpfwOlK3HOeT/AHsfppI0aY1+Kpl7lfkve+xYZQ1QhGIdxs6Ym6DepoD8fH+dkyAbdaLzPgleyMkSLAJu3bWhb2nzXRyWAik27dQgw1UcGpOFihQM70t84r9sr+w+REV6v25P1oA2ulXMBGfLBHZ9nImm/UsN7SOQQl5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786290633; c=relaxed/simple;
	bh=IlISIo4MG/jnab8YgVXMrdwn6TvBnOuzwPS4DdVjyYQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y7GeEEz24olClLZhEWs7xnXDtzIXqwiZMTx9cwQaAOnWOtYzTTthysPSVpXgvLKux+jBtDvl0OS3RWo60h20dv54KPUdsaKw8DgbZ7AWdY15ibdfJ5nd1AELJRZ6FK0LWwIgmAiMyrOCMfz957WDrDn0WLe4OypPlup+fimc55I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ld5DxN3Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ld5DxN3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786290631; x=1817826631;
  h=date:from:to:cc:subject:message-id;
  bh=IlISIo4MG/jnab8YgVXMrdwn6TvBnOuzwPS4DdVjyYQ=;
  b=Ld5DxN3ZPNbz1b2MJL3DpbDWJwkj3scBoqPDi3nLjTmTJJqsFHulW23G
   MqEdSO3pIIkaT1YVCvYRObRqAKBYZnhxiGy1A7LJW5gWdTF2DE4jQipJJ
   fRWu6flzgT1z0N3p6r/d2o9su+nBhejRgBRmR6SkEpU98OC1H/3M50SpK
   sxDHJPGxHDmto0soKKguEFbjRJ74FYcM72uxFArVWbU5SZpZZTtoRsQPO
   rL2uDK7GEfV7SRVIAW3u574nWG32e4/ULv5T2hLmY8BCKVXY6c2Pv1SEz
   ugghEscu9cn/W4aq/XGwGM9iDNBeKQSU/LgeOrJ9GV3Yi4vokbVFEs76t
   Q==;
X-CSE-ConnectionGUID: FMcGvNN3QCWEx2j5IiC4jQ==
X-CSE-MsgGUID: pNwHhmvlTUemm3LzPnn9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="85937920"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="85937920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 08:50:30 -0700
X-CSE-ConnectionGUID: I7aP0zwWSf2QVeueqJdVYg==
X-CSE-MsgGUID: 0wKVdKcaRluWofGfOn048Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="258965397"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Aug 2026 08:50:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt5n8-00000000M0H-2Ams;
	Sun, 09 Aug 2026 15:50:26 +0000
Date: Sun, 09 Aug 2026 23:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 220/220]
 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:9: warning:
 incompatible implicit declaration of built-in function 'strncpy'
Message-ID: <202608092301.Qm43JV8C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   c29ccda7eca8bca9686ca69e284690c38ca9ed1c
commit: ba737cf5097bc593b8c8851be4d568aaa516bffb [220/220] net: phy: as21xxx: update driver to v1.9.2
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260809/202608092301.Qm43JV8C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608092301.Qm43JV8C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608092301.Qm43JV8C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c: In function 'parse_cmd_args':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
      52 |         strncpy(buffer, input, sizeof(buffer));
         |         ^~~~~~~
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:31:1: note: include '<string.h>' or provide a declaration of 'strncpy'
      30 | #include "as21xx_api.h"
     +++ |+#include <string.h>
      31 | #include <linux/timekeeping.h>
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:9: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
      52 |         strncpy(buffer, input, sizeof(buffer));
         |         ^~~~~~~
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:9: note: include '<string.h>' or provide a declaration of 'strncpy'


vim +/strncpy +52 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c

    38	
    39	/******************************************************************************
    40	 * Static Function
    41	 *****************************************************************************/
    42	static int parse_cmd_args(const char *input, struct parsed_cmd *result, int max_args)
    43	{
    44		char buffer[MAX_BUF];
    45		char *token, *ptr;
    46		int count = 0;
    47		size_t len;
    48	
    49		if (!input || !result || max_args > MAX_ARGS)
    50			return -EINVAL;
    51	
  > 52		strncpy(buffer, input, sizeof(buffer));
    53		buffer[sizeof(buffer) - 1] = '\0';
    54	
    55		// clear '\n'
    56		len = strlen(buffer);
    57		if (len > 0 && buffer[len - 1] == '\n')
    58			buffer[len - 1] = '\0';
    59	
    60		ptr = buffer;
    61	
    62		token = strsep(&ptr, " ");
    63		while (token && *token == '\0')
    64			token = strsep(&ptr, " ");
    65	
    66		if (!token)
    67			return -EINVAL;
    68	
    69		strncpy(result->cmd, token, sizeof(result->cmd) - 1);
    70		result->cmd[sizeof(result->cmd) - 1] = '\0';
    71	
    72		while ((token = strsep(&ptr, " ")) != NULL && count < max_args) {
    73			if (*token == '\0')
    74				continue;
    75	
    76			if (kstrtol(token, 0, &result->args[count]) != 0)
    77				return -EINVAL;
    78	
    79			count++;
    80		}
    81	
    82		result->argc = count;
    83		return 0;
    84	}
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
