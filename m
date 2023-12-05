Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F569780
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqkVR4NS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775589; x=1733311589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eKFPtkl6RBw2TlHlEijKrHHv+A9qLn173Bbp+1CCAXc=;
  b=DqkVR4NSPbPFO0SJ2FoPk4m51vMNa56fY55fn8+z4y80COqG/Dx3PS2D
   EF0Ux+f5zsOs2RDc9J/xgSp3CMoOO1FZdPxS7gSlFuVCXc/vysoR4wEw9
   bb7z6S/nd/Mx1NQp+rXnXx8lbS8VLz2bJwHEcPx4QHI+UMAgrOhz1opY1
   vcZTyCayckMfxR3yF/lnzTmCa1bduyD1Jbv2XHkWzf7pdPjfRKrlkO8ML
   2bAgBl4Z/HUazpYoioofpvA43sl4dhPw4KyCYiLqnYH+IrNYeGgfqbX0m
   CAQKjJ0UxFp666kynCo/vnxfT2KYmZhE8uK2LYcE9KhaD3ucb2dt/Xisw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="943519"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="943519"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747193391"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="747193391"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 03:26:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATZJ-0008rb-1J;
	Tue, 05 Dec 2023 11:26:25 +0000
Date: Tue, 5 Dec 2023 19:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8450-sm8550-on-next 45/48] make[6]: *** No
 rule to make target 'sound/soc/qcom/sm8450.o', needed by
 'sound/soc/qcom/snd-soc-sm8450.o'.
Message-ID: <202312051928.3QaiUx5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8450-sm8550-on-next
head:   576bf568f725b8b640e25e6de6240b087fac318d
commit: a5f41ea5ea0e49b1cab9ae8c905aff9e7c95ead4 [45/48] LOCAL: drop sm8450 ASoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312051928.3QaiUx5f-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051928.3QaiUx5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051928.3QaiUx5f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'sound/soc/qcom/sm8450.o', needed by 'sound/soc/qcom/snd-soc-sm8450.o'.
   make[6]: Target 'sound/soc/qcom/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
