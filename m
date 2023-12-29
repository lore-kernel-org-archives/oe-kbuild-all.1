Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8067315A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 02:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsLKnaI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703816452; x=1735352452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Ae1D9hI/8HznAbGDJXATw9o6LTAnqtLrsN5mgc1zzk=;
  b=DsLKnaI50KkwBeuLSYhoNb0n08Tyx77dtx+NtL3r2ebTFT5hIijhFcMF
   ytj9/ufOTcw6ho9lWwC1bAtZxDNgtOKWFf6NwF6kwSeppR+3sJGgu4jtD
   XTJO122tCk5Dr5NuLSZAlFkPv0kqpXpSEtKg+eE7BFw32H2YJVIh++5Ov
   Z5S4aFsFnG8S4z2oyJADxwJNfzN0mY/uLS1PC78RPncZIylfDpVwEAB7e
   fPoqJxqzg5sv0IhHS9V53nGe0gRYm8XH8/HT0o+prm6OISA9BIrYuBaVf
   uo/9FqgNY2HuGlwiAJRHgznWoassHxPNZ3Sz37PXI40YgSkdvXXllspRv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="399394470"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="399394470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 18:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="807573273"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="807573273"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Dec 2023 18:20:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ2UG-000H0f-0Q;
	Fri, 29 Dec 2023 02:20:40 +0000
Date: Fri, 29 Dec 2023 10:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [linux-next:master 5046/10295] kismet: WARNING: unmet direct
 dependencies detected for SM_GCC_8650 when selected by SM_GPUCC_8650
Message-ID: <202312291024.ak3b1dSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d857259d7d10cd0d5e8b60608455986167cfad
commit: 8676fd4f3874d06cdf0c897f4f306c7b11618f6a [5046/10295] clk: qcom: add the SM8650 GPU Clock Controller driver
config: arm-kismet-CONFIG_SM_GCC_8650-CONFIG_SM_GPUCC_8650-0-0 (https://download.01.org/0day-ci/archive/20231229/202312291024.ak3b1dSa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231229/202312291024.ak3b1dSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291024.ak3b1dSa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_8650 when selected by SM_GPUCC_8650
   
   WARNING: unmet direct dependencies detected for SC_GCC_8280XP
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SC_CAMCC_8280XP [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for SM_GCC_8550
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_CAMCC_8550 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for SM_GCC_8650
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_GPUCC_8650 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
