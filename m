Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5634C9E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692652884; x=1724188884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yFDMfS49hlZ7MIwU7lpYtlCzzVKIkiHQdmv7EDPZfsY=;
  b=dWvdAENMcMDvTcjuIncAWNvDfWPGtfwOHipPm+n7quWt0MTTp/7LC0BF
   uklbJlD5v/eH+6/ctxWZDF1cWKbK4Dfsj2shyi/fe4XaF9Q4/8R0O/bwj
   A5Xow60guWE4zXOqU2jIujbiyISvCtpfCwzHZB0X1Pk60M+zrtxhho/G8
   +gl/Txz8scbZDdVRABQP49nHRu2TBEcCuHJvG+wS2kvcAUQU8Sz0H/TOI
   6RX2wzWNnf7rMqqk+AAXc22d0mBnDv72kBdoDYTSbompWTM7j5wu5xJNu
   oXzvfdaQMA1xTQ+Xu+vVDRI9DD5+kwk6BHLYHcELQkncShy8jfken93rC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377457362"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="377457362"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729567518"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="729567518"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Aug 2023 14:21:21 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYCKp-0000wU-2C;
	Mon, 21 Aug 2023 21:21:18 +0000
Date: Tue, 22 Aug 2023 05:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] x86/srso: Use CALL-based return thunks to reduce
 overhead
Message-ID: <202308220524.twcmMPN5-lkp@intel.com>
References: <20230821112723.3995187-5-andrew.cooper3@citrix.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821112723.3995187-5-andrew.cooper3@citrix.com>

Hi Andrew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6405b72e8d17bd1875a56ae52d23ec3cd51b9d66]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Cooper/x86-srso-Rename-srso_alias_-to-srso_fam19_/20230821-192855
base:   6405b72e8d17bd1875a56ae52d23ec3cd51b9d66
patch link:    https://lore.kernel.org/r/20230821112723.3995187-5-andrew.cooper3%40citrix.com
patch subject: [PATCH RFC 4/4] x86/srso: Use CALL-based return thunks to reduce overhead
config: x86_64-buildonly-randconfig-001-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220524.twcmMPN5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220524.twcmMPN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220524.twcmMPN5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: srso_fam17_return_thunk(): can't find starting instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
