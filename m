Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217FEC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 01:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGe/Zy1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697591579; x=1729127579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3y4VOaeb5VOWwjk004T1iDytBCrLOtFdXPCLmP84Imc=;
  b=HGe/Zy1RSI9qaDZK0+iOLj2NFlJyNBPE3P276hdruMMdI44ZwZS3rEwn
   zShT0/kH09gfhePRWT9Rsqr7wxFIYVDpMc9Wkzb4yUoIlqxiwHH7g6h2o
   4hQEJPM0Y7+wymhkUTSj9pyY2mCp78+kxSuzEIhBXi958n5TbaOnm9gJH
   3v9OMNTfRSQTbDT3hJSkxQ54L3AegxvmQ4jjHKOBy/DvPbdC6/HIGB0bk
   2VVBS95dciZj84Q4VEKxeDh7mkSVDtswtT0t3fLC76Xudc2X+Ce0aUEC5
   NUemBoi0ismYiw3ZIKQom6UXg7uQ/nsW7sEDT1+jt6Vqn8W+fmY5g83vr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384792393"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="384792393"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 18:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826667277"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="826667277"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2023 18:12:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsv7H-000AJX-1e;
	Wed, 18 Oct 2023 01:12:55 +0000
Date: Wed, 18 Oct 2023 09:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v5 1/2] net: dsa: Use conduit and user terms
Message-ID: <202310180907.RbYMqtyd-lkp@intel.com>
References: <20231017233536.426704-2-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017233536.426704-2-florian.fainelli@broadcom.com>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Fainelli/net-dsa-Use-conduit-and-user-terms/20231018-073644
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231017233536.426704-2-florian.fainelli%40broadcom.com
patch subject: [PATCH net-next v5 1/2] net: dsa: Use conduit and user terms
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180907.RbYMqtyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180907.RbYMqtyd-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#4682: FILE: net/dsa/tag_sja1105.c:399:
 					    "Expected meta frame, is %12llx "
+					    "in the DSA conduit multicast filter?\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
