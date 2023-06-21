Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FAD1C754
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687372285; x=1718908285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M5hlKsc/sOo9wCx+nOin+3JSK1jKNoUxH20kBq8+UF0=;
  b=e2Dy3TZo6s08+IMZyXdhV+Gm+pDHkYIKuYnuzwuhgoL0gnjAljyz2TPy
   wh39bUTbDFKDfDAB/ZKy8RQri5FUdAVXaO+mr3qRIJbzFFllwVA05pQ0i
   +p7IrCjBFj0awSfYoec30BrcNrwnsFynoGXsx8qjPs1pJHq2rJdkKQMpd
   Fzzo8WRhLegzAxgfzZJuoTMySEdyiLGmh2gtgu8Dgi2M/SwwprFMO/IBs
   5y9IZ2C4Ei9oo1OTOUvTNnfSbOEy3ZoYWkA+bZFQhv5cZhtU5Rc/gjfAr
   RnzE4gqXcBTc3p5/Iqi22Znp/dMPRpdt4EBsZkqKILi7bFXEVisPDnyML
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="359131864"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="359131864"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 11:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="838723062"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="838723062"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2023 11:31:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC2br-00071L-0I;
	Wed, 21 Jun 2023 18:31:15 +0000
Date: Thu, 22 Jun 2023 02:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 2583/26706] ld.lld: error:
 -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.
  Try: 'ld.lld --help'
Message-ID: <202306220215.4u5M3xaB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   8a896de7b60b2f6cc08bef3ff4be7e62b9713bc2
commit: 6f0e552d0f4018b3731866fd18f32c1295175a91 [2583/26706] ANDROID: x86, build: allow LTO_CLANG and THINLTO to be selected
config: x86_64-randconfig-a015-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220215.4u5M3xaB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220215.4u5M3xaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220215.4u5M3xaB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?
--
   lib/lib.a:irq_regs.o: no symbols
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
