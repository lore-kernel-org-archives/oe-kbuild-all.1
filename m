Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A0361978
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204310; cv=none; b=N2F3wtD3gBRt6fZhPn//6G0us8dLJl3wtvIMgWpROxHYm0YXiuRJ8I5TiNbTN5pZdR8ObEWZ2fxg7D0+eBPpOGWEStr/uxaUzT8kpK/GnD7tm+v10IzM77F7ubbo2MRDOLqypqJ7miThPpbabdvO5xO1AVs6HR3pHJqu9Qdaecw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204310; c=relaxed/simple;
	bh=9OOwaSjzuOf0z89iRyKYcbCA9MVzmfg/kzhpL2rmLIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UF1+4tgaPDnrYk6aG8906FAUqvTPmvCOioWw3kHBNl8Zp/JKvA0A1mLZ4ZE+hwDjmonNaxvDtIKxK8pby9xXrvROsO9+UgiQFXVlPug9/5SEpvnpNzDnZkADyGgXsXmXXnOCj/+9nn9p9y/61/3Il9OYVEnk30ZYLwg2FKee2JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwDAewnQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwDAewnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788204307; x=1819740307;
  h=date:from:to:cc:subject:message-id;
  bh=9OOwaSjzuOf0z89iRyKYcbCA9MVzmfg/kzhpL2rmLIA=;
  b=hwDAewnQbrVxrjQKc/m+jWcF3LqCzpDa0vsbrg0hWqy1Pp52Z7EhXpX/
   7H+zMLuQwDQAJ/VlhsUy6figxdMdKwi+HbYorRQdjprhhVQZD0NowSZoQ
   3gLyvBJSrajrBiWGEK4FeV+QAc4F13zgLOqfd/IdaXmd6GT0hOZb1mBAc
   jO7KLfKoCLBmof+e0A+fptQs+RlSNT5+Rox/4C5PFmTKey1qHbuflSwHT
   xfoWpQq9r+pEdBrubxWlRGeR6LQaw+nUFoGaZPb3qfczZilg0UNe23Nj/
   3S74DwpgUs+FNIK9i/cN8Nz7wEy2oatwHMFWNsfK6BJ8EVV9SMN44+6IF
   Q==;
X-CSE-ConnectionGUID: 6DtH5lMoQ3KYXXl9SISlqQ==
X-CSE-MsgGUID: FM/wSJbmSAm2pW0W1DDxCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="76169761"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="76169761"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:25:07 -0700
X-CSE-ConnectionGUID: UmIH67aERi+N4W24HN+gmQ==
X-CSE-MsgGUID: Vf4v32GxR3OASxMPiRKMfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="269462417"
Received: from lkp-server01.sh.intel.com (HELO 773ca75d6f42) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Aug 2026 12:25:06 -0700
Received: from kbuild by 773ca75d6f42 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x17cs-0000000005o-4Ah7;
	Mon, 31 Aug 2026 19:25:02 +0000
Date: Tue, 01 Sep 2026 03:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 209/209]
 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: error:
 call to undeclared library function 'strncpy' with type 'char *(char *, const
 char *, __size_t)' (aka 'char *(char *, const char *, unsigned int)'); ISO
 C99 and later do not support...
Message-ID: <202609010356.FPlCP4le-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   63470c81335ce1106f6cebbf141b92a958a01e8a
commit: c5cd0ccfd13612a2ad02f2d734a6b35bf18b01bb [209/209] net: phy: as21xxx: update driver to v1.9.2
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260901/202609010356.FPlCP4le-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 316b0edee400b3ef72ed0a082dae9bd337ac01a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609010356.FPlCP4le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609010356.FPlCP4le-lkp@intel.com/

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
