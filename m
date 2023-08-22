Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902441FD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692689232; x=1724225232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5BvUBVq5c18FYkdow2LtUFiNA3JaxATcBp9fWqHOv4M=;
  b=QO2Eg4xnR2Gh59QcR2XpMp9jwoD+ZKg8oEYddOUSkLuSFuqdT28ygFJT
   AJo70/Yv5IlbVA2If2WTg858QcI6zszILUTWoHy6PfwzldTC62NNiHN/o
   Unou3V4RRPapadByEeOb7weEBnhq+n6+9eOXhy7qX9aRa/pJhFAP10MbJ
   JNlBXCVArGDcoyZ9vAQy4i99RMDSmIBN9mhm/Vz0GQEYPiKMkcDENYZCE
   zUyehzQInnyDY43ToNaci9n2qBTxfzp2DuyUaomzYHYxZh2U+GkGpGUDo
   0mpDwRQ281sJZ+LkxPGpx10+hphQuQ/v3Fbdx/fAX48OouNAwirSmO4u3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353374841"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="353374841"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 00:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909994836"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="909994836"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 00:24:45 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYLkp-0001Vj-1a;
	Tue, 22 Aug 2023 07:24:43 +0000
Date: Tue, 22 Aug 2023 15:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] x86/srso: Use CALL-based return thunks to reduce
 overhead
Message-ID: <202308221422.3HLEiqns-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-005-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221422.3HLEiqns-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221422.3HLEiqns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221422.3HLEiqns-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/retpoline.o: warning: objtool: srso_fam17_return_thunk(): can't find starting instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
