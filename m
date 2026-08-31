Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584B8473C66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197382; cv=none; b=ql68lOkVbk/f/9vJABNIU4mHGwbX4zKfXlPQiyeG1bSBciDvCkfOUUyLpXoGaWewB8+EsoRUbfvZ9I0r1mgUNUsBzH4UzD2F7Ff/sjc0qgm1mlD2hVY41sxOZqfgkMdR0Gy+6lSHmpiaCGSI/R3T9FSX0ynBkSaVEqAUPM7+oV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197382; c=relaxed/simple;
	bh=2pVudAJZTmolbUBM+xxHpXaiGj47/QOAiTa/1xmUrfA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=snOjGjwj3gYMdZ/pdY1QqtI/zgL0/AQPPG7Qgs7gFEUZGR/SKgdklE72qI6bGFMU1bvASydT67QPddXVuJDUpS6njuGOP/fumTGUQrrX1SotSbpEjJLo1eushtJL8ISDB19wWuSffZKxRxrFcMCUI7y2OYQ+22kdaVfgb8nu7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/MKUkzs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/MKUkzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788197380; x=1819733380;
  h=date:from:to:cc:subject:message-id;
  bh=2pVudAJZTmolbUBM+xxHpXaiGj47/QOAiTa/1xmUrfA=;
  b=k/MKUkzsX6pGHxgV8innlpUdHhKeMfXa+VTDhvN7dbePjDM2VfkYpojo
   sAbx9j95MJNDGPl9nsZ0rn/ZOC38tqwNKXBvq6nJxngjxVLbkcnBGXRtG
   nYCmIIMQrwsDX9pKO0pGHi4HoSmWsQJPpIazOLT1rxGzzGrh3wQbjEzdq
   chaIXddhgNPQvpj9RniijxjkOKmIfX3P1KDxa/uusSz6qW2Sev04OP7rK
   /vJtGSiDSsOgryg3nEr8oowebS0Rda5I+qZuCIPLlp8BfKyQVf/3zZDEh
   KO8yjWYWtqSVbYs5gPMipKLjpltTp98yLXm7yslsB/pyUcLjcEAh0WMch
   w==;
X-CSE-ConnectionGUID: 1d8GIL/CRFyRNVUhFrkYAw==
X-CSE-MsgGUID: BHYnwO38SaW/5VPquba++g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88737058"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88737058"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:29:39 -0700
X-CSE-ConnectionGUID: Y1YJEqL0RmiBDvfkTfjHxw==
X-CSE-MsgGUID: 215gBQqsTmqfW6f2pobeAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267050525"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2026 10:29:38 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x15pA-000000000wJ-0tiu;
	Mon, 31 Aug 2026 17:29:36 +0000
Date: Tue, 01 Sep 2026 01:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 213/213]
 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: error:
 call to undeclared library function 'strncpy' with type 'char *(char *, const
 char *, __size_t)' (aka 'char *(char *, const char *, unsigned long)'); ISO
 C99 and later do not suppor...
Message-ID: <202609010140.6ybLjc5l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   8f1ae3a99f8f4bbde9c6a17df87b4585fc4eb674
commit: 2cb20c86841cfe9fb52a28ab7025aca03c73bb73 [213/213] net: phy: as21xxx: update driver to v1.9.2
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260901/202609010140.6ybLjc5l-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 316b0edee400b3ef72ed0a082dae9bd337ac01a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609010140.6ybLjc5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609010140.6ybLjc5l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: error: call to undeclared library function 'strncpy' with type 'char *(char *, const char *, __size_t)' (aka 'char *(char *, const char *, unsigned long)'); ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
