Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C132D0C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768630968; cv=none; b=BzXwUGrNJO/bLaA7SPHFKBsJQeuXji+anSTO4BpOA2Z3QHD3C9U+8m/3h7foZxdTHvGpQJhayPNE9uD52LJtvyUklscROMi06D5+V/9mnD/bpPwf4Mrz6OCNGX3FYPMQhAjObDVgMA1S5oA4wTwa55EY2FlGbhsybCjzUwynawU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768630968; c=relaxed/simple;
	bh=/FquNOusjZSaYbIZE0kdN18qpsdzltFYXA3evu19SSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRqWCS9VhfOfY2eRT1hb11BGd8Y6THraViFyoRwdabU1z93vMlOI7LfJirkXItHnQLLk5hDk+si6nrywMaE88T4YuhaXBVq6tzkMSoTPnsOAZtkpaJZWxeRAQgB9w+yg91g25GnTEkR4SkKnqqQjMN5G35rDKrqWqevk70rLpnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alhoTPcB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alhoTPcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768630967; x=1800166967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FquNOusjZSaYbIZE0kdN18qpsdzltFYXA3evu19SSo=;
  b=alhoTPcB8UEwMa6odoor/GahgFIqryWENZNidREummlWpuhEmeEK2aJY
   kah1X70iGo/HcZst1loWLMdgy5cCS4b3iUygYOPqLIpJFZxnqJU08dqcO
   6O4ghFVOTYmc3OdnjIObLVgkWnpl83GiNg2irCQn0Lb2XFlfKEXbFq+6d
   vxWirgNsydRQD5qvNLwYPM8ho0OrRlMs38Hk6lWi/xxS2wjLcfrnBiSHE
   +cHFYJruokNFL8uRMIZqJ4jpO78AFr3wCJjimaHs+OQnKHZ4mdUbV8sum
   cwaDQV44vhbG7oPRFDCPgxFdHvxWGQH3heCFHXzPDNnkTA70YIk5FZGmn
   g==;
X-CSE-ConnectionGUID: 1nJLzREiTmKj8awCnFnBSw==
X-CSE-MsgGUID: 2e5Eg5lnT5mu1mZp3xNymg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69987903"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69987903"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 22:22:44 -0800
X-CSE-ConnectionGUID: IyrdKoFtSIyDNgKcW6DHRA==
X-CSE-MsgGUID: /VkcHJltTaeqY+luj4ow6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205319083"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jan 2026 22:22:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgzho-00000000LcK-09Ex;
	Sat, 17 Jan 2026 06:22:40 +0000
Date: Sat, 17 Jan 2026 14:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim.bird@sony.com>, jason.wessel@windriver.com,
	danielt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-spdx@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH] kernel: debug: Add SPDX license ids to kdb files
Message-ID: <202601171457.nc8dNrA8-lkp@intel.com>
References: <20260117003621.669382-1-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117003621.669382-1-tim.bird@sony.com>

Hi Tim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19-rc5]
[also build test WARNING on linus/master next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/kernel-debug-Add-SPDX-license-ids-to-kdb-files/20260117-083842
base:   v6.19-rc5
patch link:    https://lore.kernel.org/r/20260117003621.669382-1-tim.bird%40sony.com
patch subject: [PATCH] kernel: debug: Add SPDX license ids to kdb files
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20260117/202601171457.nc8dNrA8-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171457.nc8dNrA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171457.nc8dNrA8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/debug/kdb/kdb_private.h:17,
                    from kernel/debug/kdb/kdb_io.c:23:
>> kernel/debug/kdb/../debug_core.h:2:1: warning: '/*' within comment [-Wcomment]
       2 | /*


vim +2 kernel/debug/kdb/../debug_core.h

53197fc4954924 Jason Wessel 2010-04-02 @2  /*
53197fc4954924 Jason Wessel 2010-04-02  3   * Created by: Jason Wessel <jason.wessel@windriver.com>
53197fc4954924 Jason Wessel 2010-04-02  4   *
53197fc4954924 Jason Wessel 2010-04-02  5   * Copyright (c) 2009 Wind River Systems, Inc.  All Rights Reserved.
53197fc4954924 Jason Wessel 2010-04-02  6   */
53197fc4954924 Jason Wessel 2010-04-02  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
