Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1D463B96
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196115; cv=none; b=ezcRD8Aa0G+fdcGpZxHqq5VXVnb/t5h5MVw9KtaE90lW04GuQnRZ5I+8dTIgRMFIo0QWGrR9MWn33THoHThKBXQIfEvCqZKRivyHDzbC+RwlXAQpCT8//khIkxrB8vUnZSczqHIEQGSy8bEXZftT75xjrL02+FsoDn4vwtmuNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196115; c=relaxed/simple;
	bh=nGgjWGyLmpaRcJbaEburgQl7vSkyQ/Wn3XOnl5LfIwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vs0NrQsvcld0G0TDrEGDr7kr+c/0/c4n89ojEB1wV0HJCZdmPQRHOE772MCG9qGH8P33KlCfpSOpihkTXSjKLmPl5TdNkPgnOWM4IGJFV4Ip2A4E5YeBkp1ndtjuTGopDOyjxOr/ajhtH15NEhtqfbAxJHqe4mGQElGNyefAhzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEVuSo0r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEVuSo0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788196114; x=1819732114;
  h=date:from:to:cc:subject:message-id;
  bh=nGgjWGyLmpaRcJbaEburgQl7vSkyQ/Wn3XOnl5LfIwU=;
  b=oEVuSo0rLfm5wQaCCvMyTR3hkDKoXk52xQuVgpVeptTnaPTXRgLL9kDA
   LqKXIURTEywcBXYjwQMZvww8saqav7Gs/cnDIznszE/N9vyW9GpsMWxwr
   BFMAsr+u0kGchWf5UEMPW65mjMQmxixebl7Ou68NbspVSl/J6exkHmMhj
   4wCDkX6IHhUPnlllRVdYk7JnNxPuSpEqhbkCuAVciruCRO9ZwaI8OUh/f
   lArwXgmliw/VKhh6Ew2MHQ/Wh6uOzbQz/dz37gvjgHNRih9e8ClXUgD8L
   yZIW3QSc4M62yQwuadt5MT5AvP759RxAjF9zlNs9vG7oQQ9/E4RVkXFud
   A==;
X-CSE-ConnectionGUID: Rc6URw45RV64j7v46D+TjQ==
X-CSE-MsgGUID: HWwJa8ZFQJu1VnOJA3UQ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100122526"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="100122526"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:08:34 -0700
X-CSE-ConnectionGUID: DHHzp4HvSpC7QgwWc0WO7g==
X-CSE-MsgGUID: lpQ6BfIXTjW15ZZMpnZHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262719782"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 10:08:32 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x15Uj-000000000ux-0ito;
	Mon, 31 Aug 2026 17:08:29 +0000
Date: Tue, 01 Sep 2026 01:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 213/213]
 drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: error:
 call to undeclared library function 'strncpy' with type 'char *(char *, const
 char *, unsigned long)'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202609010126.tTu0FdQd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   8f1ae3a99f8f4bbde9c6a17df87b4585fc4eb674
commit: 2cb20c86841cfe9fb52a28ab7025aca03c73bb73 [213/213] net: phy: as21xxx: update driver to v1.9.2
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260901/202609010126.tTu0FdQd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609010126.tTu0FdQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609010126.tTu0FdQd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:52:2: error: call to undeclared library function 'strncpy' with type 'char *(char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
