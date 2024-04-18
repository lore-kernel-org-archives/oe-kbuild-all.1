Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099FE657D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713421455; cv=none; b=o1ITHURCJQ4HDFXm4X3FASFJJutczkRkkqfuU6TcEraNZ6PPwRTphoUo9jhpN2jKZ37o/fbRYCY/nbCvEW6UXI/u8XE76LCEk4H5DljWyKhx3bC6vYwcBzJS+mmzMIb9csOCZTwaS5lQ5hF/tYxCCFnwIeWNav7Rkag58cdyKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713421455; c=relaxed/simple;
	bh=y9HP7h/p1BQuRHbLysB506Fr8+HRoUQiMCSfzTLDcTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QT+YZmkLxJVSoF8fzPwGxgL0zdPdOILxASiVV+fXR+LsYwsE4Cs+5+pqR+trnHvI/EVmuL4d0sNmV6YjmQrn2Bi6d80PgdZYnLyyxkBbHrjfMCoLRGkv+IIylxcT3IyYyYsAk4w2QuivpQdc43y2CRbWOGSoaYp3FgNlK63QuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVrL7ccI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVrL7ccI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713421454; x=1744957454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9HP7h/p1BQuRHbLysB506Fr8+HRoUQiMCSfzTLDcTU=;
  b=RVrL7ccInu4Jj0ybHYvOnOPljgSRO50YMxwdw4QxDfmGhpFrs8OKCqpZ
   szsERLbTAi3GSN5QQWWj1NsmNAT8C21YxETDGiN/KmfvqAe86soQmq02r
   DQTDsG2XKXE/b1dvnfoIE9eUVx6gC3Ttm52RdHu5VrqwueaunnHeC8HKh
   Wds4RRuLbhEThqpo8Mv5AAQfGzHL11OKi96tLRLlrIEdEovvwRNImIMT/
   D7gUYcn6V7KpwjAFZm4l9lXMVxDsucpCUVgJWKnrwzxfnhIThgW2ZmBTo
   S95eJs/7it3nI3OVjXhiguQCL1xREbNBjVcRAvTEoKvddRjOrT4qMc92F
   A==;
X-CSE-ConnectionGUID: 5Kkh3q1hSO2+a+E+CzXQdw==
X-CSE-MsgGUID: RCaIX9rQSUCwHkHxLkwWnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20093057"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="20093057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 23:24:13 -0700
X-CSE-ConnectionGUID: HebUKZNTQmWh0ijtjqQL5Q==
X-CSE-MsgGUID: BwpmnUSMRSqTxyYm3wXdhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="46155974"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Apr 2024 23:24:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxLBq-0007NQ-0S;
	Thu, 18 Apr 2024 06:24:10 +0000
Date: Thu, 18 Apr 2024 14:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 10/12]
 include/sound/sdca.h:33:1: error: expected identifier or '(' before '{'
 token
Message-ID: <202404181451.r2KHLtwS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/parse-functions
head:   999b877354e492b6b1c8206962dcf1fd21c09f15
commit: cd24ac936a37b583771317da3d0865c6857cca92 [10/12] soundwire: add SDCA alloc/parsing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240418/202404181451.r2KHLtwS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404181451.r2KHLtwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404181451.r2KHLtwS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/soundwire/bus_type.c:9:
>> include/sound/sdca.h:33:1: error: expected identifier or '(' before '{' token
      33 | {
         | ^
>> include/sound/sdca.h:32:19: warning: 'sdca_find_functions' used but never defined
      32 | static inline int sdca_find_functions(struct sdca_data *sdca);
         |                   ^~~~~~~~~~~~~~~~~~~


vim +33 include/sound/sdca.h

e02a796a482bc2 Pierre-Louis Bossart 2024-04-15  31  
d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15 @32  static inline int sdca_find_functions(struct sdca_data *sdca);
d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15 @33  {
d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15  34  	return 0;
d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15  35  }
d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15  36  

:::::: The code at line 33 was first introduced by commit
:::::: d4bcf59ba748770a8e243d7598c83e5919cf3ac4 ASoC: sdca: parse function type and controls

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
