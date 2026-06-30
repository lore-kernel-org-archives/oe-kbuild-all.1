Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089353672AA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813327; cv=none; b=pWHGox+ALq9iOQo3MDRtvjAMpRKzuRaNISA+RYxttXj3vHavkcpDeJlMlYZgSDU74oZF5fLubopx3FMhf34wH57lpasvlhH4FKvWPGJdlbsRZANfTL5+z4guchBdmplrXAz0RE9dCH3jOzeS264JpdflX0BHMC1/8j2GHHiHMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813327; c=relaxed/simple;
	bh=vtoxHI7XCO4TcIVQidsHwCCn7gBbcvqaxaIxjBVh3wk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PYHyodlb6hnA5wYGLIqFWnxnNeTUyl8i/PsdYxLVUStP8OsZp+KyGrNlavtYfdhPnmMZMUItdjS7K1DegiFnM3wnsb2tyyGHe3Byj/L6Nvwnny3LW9BcAgwtKP9uqRtlcmtgg4lJuEE+1hABBUb5mjvwFuwouiKTqQcCBFIfoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXGYfeMk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXGYfeMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782813326; x=1814349326;
  h=date:from:to:cc:subject:message-id;
  bh=vtoxHI7XCO4TcIVQidsHwCCn7gBbcvqaxaIxjBVh3wk=;
  b=CXGYfeMkzsWW5qxRP2jlW+TkWbMt+dm9tWA9WwI8eiCORAwDd1ZGI3FV
   GQjejaYeoHW3DYEo2iYN8aAu1yAUuhZDA2+nxeNNvtbo/cwehiV2ko3fX
   WK/ZeuExOKlxG0tjU6g5TGZB/mO0vQYegZ0ROc7XitSRsztSxbGVohjTh
   RSYJ15DhAbZF+hO1k9FRHF3BHm+duO2CO2NMsp6I3MkIHjED/0HbwCi9s
   13fKgOPTvj2nsdn+h2prYDcati18/6SJXBeu8kdz1NCYjDQfTs0H0G/1z
   Axb77xo+9tUZM6t8d/W5Etb5bab7dIE5xHpJ2GK2AYII5DWpmEL71mxai
   g==;
X-CSE-ConnectionGUID: j6/sRc/ISCOYFKf4cjDYZQ==
X-CSE-MsgGUID: 9zedtdvAQwCwYkI4jjrb7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83548574"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83548574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:55:26 -0700
X-CSE-ConnectionGUID: FXYc/6A0S869iUrNBEpmTg==
X-CSE-MsgGUID: SiY53+izQQWf1QIvC1/1Fw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jun 2026 02:55:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weVBZ-000000008Dp-2Tuo;
	Tue, 30 Jun 2026 09:55:21 +0000
Date: Tue, 30 Jun 2026 17:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 130/160]
 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:9: error:
 implicit declaration of function 'strncpy'
Message-ID: <202606301751.GkMcWRq4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 5f25c6617c5fa2a6913c15e0c9c7d5c3894a446e [130/160] net: phy: as21xxx: update driver to v1.9.2
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606301751.GkMcWRq4-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301751.GkMcWRq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301751.GkMcWRq4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c: In function 'parse_cmd_args':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
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
