Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6856A22370A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831307; cv=none; b=Jt3Y5Ex9AqjHNcXeI/8Luq2Ry7/6lyOinuXxLFa04HtvkjSr4DTACjK8d0mh4i42mogUz/h6FOCFM8ntpbs+0IuwLNrGIvlGTfPwScL0+C7Hs6PJQp5t77YTi3vchJWqraw//1wiCThBax3N0dZ0bYymdUFU+y5G+uzbAJPGflU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831307; c=relaxed/simple;
	bh=uURz62nZWFFcYJCQgjV5JTfqinMR1RROY0CkiSNsN+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pxh40ru1zPJ9Z6vFm85MQhBGcnUsuusj25rWGw2K54rit4ZxUEqBAsWqDayvmwB+7ZwaBXh6DuKWoyC1+i2yWR94HcYpPoys0goghzwG7Ms0LzUaXMwTvsbdiXS8HcLP3iSSHnDVCb6NhdFl3b0snof+J7TH/Bv9BVS4ylHkTXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8+EP91G; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8+EP91G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782831307; x=1814367307;
  h=date:from:to:cc:subject:message-id;
  bh=uURz62nZWFFcYJCQgjV5JTfqinMR1RROY0CkiSNsN+s=;
  b=D8+EP91GtBi1w/a+tRTwdqwU9HBMPmb2nZvGByMe5I2i1lexpfvk2m9J
   CznCF/LPNFC/TJGI9cqBJnKhX3raoFcH9lyjfGEZfJ3us/UqP/OmNQxET
   w4cFlgm80qH2JnmU4DH3MOdUszJGd91Q1th/MX6PEAbrM0H0ux1/0+CZi
   V7DeD17Ql/3ED2xXx90luJhkAyj7b932Fm/asDX1wvgl+fYB/5/3vQ6D1
   mN/mVTs+lAJ4uUbCOb6vK+GrV786Pig2IbC7P5BwGPlT8RS08Uzj0X4ai
   6hDjejxKRhjzxePCYfhBr99IrDrtEdzva2lwF909xlYeBJW6hi4l19FFW
   A==;
X-CSE-ConnectionGUID: e41xDej2RJutzy1PUGFkdw==
X-CSE-MsgGUID: ip5MepNJSRKJMqp1wJV2sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83545023"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83545023"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 07:55:06 -0700
X-CSE-ConnectionGUID: 7rpm1vcVTSec4s1GEMXsFg==
X-CSE-MsgGUID: 0YQgwlczSaWKJGHwcMXQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="252938659"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2026 07:54:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weZrL-000000008Qs-1Yqw;
	Tue, 30 Jun 2026 14:54:47 +0000
Date: Tue, 30 Jun 2026 22:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 130/160]
 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: error:
 call to undeclared library function 'strncpy' with type 'char *(char *, const
 char *, __size_t)' (aka 'char *(char *, const char *, unsigned int)'); ISO
 C99 and later do not support...
Message-ID: <202606302235.lV3jInZv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 5f25c6617c5fa2a6913c15e0c9c7d5c3894a446e [130/160] net: phy: as21xxx: update driver to v1.9.2
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606302235.lV3jInZv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302235.lV3jInZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302235.lV3jInZv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: error: call to undeclared library function 'strncpy' with type 'char *(char *, const char *, __size_t)' (aka 'char *(char *, const char *, unsigned int)'); ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      52 |         strncpy(buffer, input, sizeof(buffer));
         |         ^
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
   1 error generated.


vim +52 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c

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
