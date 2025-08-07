Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701AE1E5207
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 16:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754585941; cv=none; b=O///6kZgkWmMhJwv59/+A7nId6pNgxJCiGojqBPo2oTVQ1P9bzCY8TnmVhj+h5XGBK72yfEsWb6wUTkqhiO2BbLzE6NM3M0x4Xs8OdcgamlX28P2Pk4qL8Wnxw7rzqi4LZ7KtZcQBhp8Z2//qURj3S4DItp9tfsaGUFbyfyXhC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754585941; c=relaxed/simple;
	bh=rt0GbCHZBiGrm2gzpQW6FqGAxQL+XjnBc4n07Ptfb5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7+75/YXvqa9eXbo+BXIp9ArYT0AZ00r26N3t6JWOTPNSij8VQLA5QNhgqcQ34HMZMp8wJktKa76seFC2rC0gZ82QHNgbarLo9wqE1vcbN5Mu73onRppdc4dh10AAIs8DElj/9BcVKG5BrsFRkrpsU0qNDpl8+1glhn3lCIJxvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfCp9ECF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfCp9ECF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754585939; x=1786121939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rt0GbCHZBiGrm2gzpQW6FqGAxQL+XjnBc4n07Ptfb5c=;
  b=VfCp9ECFNFcXD8eXBhmjHFZIGM0AquTKvAsU+B/aCcC+nNwnq59IgmSa
   AX81d0FNqbdtg+B5vtanEXvPVMGa+wKnKuWAIrBuM5ilDShua7ivt4Tts
   y55OCotUmgBYs9ujY2uiyzqOCEr8US3S8o61xHoj2zzoSSQnQ6Xe/x5hg
   V6tY2ltvroNieR/fKkY9N1QD3pLAimADdY83g0leEa0c9FQF8Hx6SLriZ
   bs6vTa7cdGY0PzXft6BJBnnZMYmxEqPmTQz/yPTCjO7HUfoBG5EOujGA0
   0TW4Or87KBxt377zTu3jtcr+lgRcjPctNDLEpeO/zyHoWuCETQUuUa444
   g==;
X-CSE-ConnectionGUID: RGaZWSksRe+wvYXMLuKM+Q==
X-CSE-MsgGUID: pkEA+oY2TLGJ4WKti1hOAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60559544"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60559544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:58:59 -0700
X-CSE-ConnectionGUID: wiHaBGCLTO6a8y9Xcq14yA==
X-CSE-MsgGUID: XhZqarECRYK6pSHlzgG9tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165904011"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 09:58:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3x1-00031O-01;
	Thu, 07 Aug 2025 16:58:49 +0000
Date: Fri, 8 Aug 2025 00:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Winter <wintera@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 08/17] net/dibs: Register ism as dibs device
Message-ID: <202508080016.CpJRbysM-lkp@intel.com>
References: <20250806154122.3413330-9-wintera@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154122.3413330-9-wintera@linux.ibm.com>

Hi Alexandra,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandra-Winter/net-smc-Remove-__init-marker-from-smc_core_init/20250806-234621
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250806154122.3413330-9-wintera%40linux.ibm.com
patch subject: [RFC net-next 08/17] net/dibs: Register ism as dibs device
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250808/202508080016.CpJRbysM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080016.CpJRbysM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080016.CpJRbysM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/dibs/dibs_main.c: In function 'dibs_dev_alloc':
   net/dibs/dibs_main.c:72:16: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      72 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |                ^~~~~~~
>> net/dibs/dibs_main.c:72:14: warning: assignment to 'struct dibs_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      72 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +72 net/dibs/dibs_main.c

    67	
    68	struct dibs_dev *dibs_dev_alloc(void)
    69	{
    70		struct dibs_dev *dibs;
    71	
  > 72		dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
    73		return dibs;
    74	}
    75	EXPORT_SYMBOL_GPL(dibs_dev_alloc);
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
