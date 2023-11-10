Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F2A38DD6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUMN3vEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699643806; x=1731179806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=myYJkjJglpdQ79ldx0ce9qdatGoner9BgOpSWsFYIiI=;
  b=hUMN3vENxC0UzdKpCrcLXsQv+3NV/SQJjwyXG2Vk659CI8KSm4cmcDWn
   a/WLDSH5lT7mjqqMpnfyU5jwj8GsLDW+B1ZDCDf4n/+mQYQxS8QQTgTDV
   hlJWN/vMBzDjiMzGqFlu/kveT88diBOkf3mxPwxNNDCiGJF8FFEXlmRdZ
   8K9bSNtDZPLTyG84/Ys7RkkPMZ/CDIZRAkDbj3FkIuHJDxCxOCB/Ly7pG
   6ER69KzzhgxvCcI3zijg1vwDTvv7eEmCChwZbWb1HyeRCbstNrTb/yBsW
   rv1N09Bi18z68/XfYKmtYR1JCRCA92ijXxCYhzH5+Ia+YzjcTnSAaAK8A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369556317"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369556317"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 11:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="881038973"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="881038973"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 11:16:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Wzg-0009qU-1U;
	Fri, 10 Nov 2023 19:16:40 +0000
Date: Sat, 11 Nov 2023 03:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Dae R. Jeong" <threeearcat@gmail.com>, borisp@nvidia.com,
	john.fastabend@gmail.com, kuba@kernel.org, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ywchoi@casys.kaist.ac.kr
Subject: Re: [PATCH] tls: fix missing memory barrier in tls_init
Message-ID: <202311110243.1Rkt9wSg-lkp@intel.com>
References: <ZU4Mk_RfzvRpwkmX@dragonet>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZU4Mk_RfzvRpwkmX@dragonet>

Hi Dae,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dae-R-Jeong/tls-fix-missing-memory-barrier-in-tls_init/20231110-190047
base:   linus/master
patch link:    https://lore.kernel.org/r/ZU4Mk_RfzvRpwkmX%40dragonet
patch subject: [PATCH] tls: fix missing memory barrier in tls_init
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110243.1Rkt9wSg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110243.1Rkt9wSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110243.1Rkt9wSg-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: net/tls/tls_toe.o: in function `tls_toe_bypass':
>> (.text+0x280): undefined reference to `tls_ctx_create'
>> alpha-linux-ld: (.text+0x288): undefined reference to `tls_ctx_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
