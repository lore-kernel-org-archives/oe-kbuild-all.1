Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0F39AE1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+k041fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704881146; x=1736417146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9vUWHdhX1zqeXe01/O8RlckpFZg3DnJ4T4JpTrBB08M=;
  b=Y+k041fr1ghBtkWS3Ks5JZKvAlM2c+fb5JUg8EZVzX6Q+oQGxnYKzi6z
   qn2+eKdjGxFI920BZ/CoiibZPfTCBKCFo9e6IOvDlQQaVZpWmA6/wt83D
   WYKlmD2Yr3a/IQwcO/HBJtZ8m2YTHlUwr1DDyopFlWM8lnGxwlK3G2So5
   Er2anE+uGNWbg0hs0nz2iLoeqeN+2b6lPx01RJeNF030hJMsRcx+UEStD
   agAMHn1HNt4Z/dEHsrK0+80MRE1T8OHI/YCBp2iqq9SUB71LRqf/luAWq
   zJKG/SO7nlfajsmct/zc1cTIm2R7CxQCinkMoNf8TEEDDURB20NzljWJ4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5244579"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5244579"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 02:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1029103734"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="1029103734"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jan 2024 02:05:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNVSR-0006ra-2O;
	Wed, 10 Jan 2024 10:05:18 +0000
Date: Wed, 10 Jan 2024 18:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.2 18/35] lib/dynamic_debug.c:621:7: warning: no
 previous prototype for 'skip_spaces_and_comma'
Message-ID: <202401101740.n2bKWp02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.2
head:   c438921c4424913334b3622bf725bddc3db724e8
commit: 0c25952b3398e024b22ba55879ba074ca617865c [18/35] dyndbg: treat comma as a token separator
config: arm-aspeed_g5_defconfig (https://download.01.org/0day-ci/archive/20240110/202401101740.n2bKWp02-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101740.n2bKWp02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101740.n2bKWp02-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:621:7: warning: no previous prototype for 'skip_spaces_and_comma' [-Wmissing-prototypes]
     621 | char *skip_spaces_and_comma(const char *str)
         |       ^~~~~~~~~~~~~~~~~~~~~


vim +/skip_spaces_and_comma +621 lib/dynamic_debug.c

   620	
 > 621	char *skip_spaces_and_comma(const char *str)
   622	{
   623		str = skip_spaces(str);
   624		if (*str == ',')
   625			str = skip_spaces(++str);
   626		return (char *)str;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
