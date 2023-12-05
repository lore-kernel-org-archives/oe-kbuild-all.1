Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A420EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIfFb+Oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701765863; x=1733301863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A806gmJsnL7+U+4kmyf56bUAHFMUQqjFnagPIeAH+dY=;
  b=GIfFb+OqUFk3Dgh9Q0QMLEbeV3n1vpGMk/aG5V+Bx6/8FkDbjm1oCkAd
   WVxc8JYzxkCVE10eTkXLwmIDot3GvbNYY3tbdcllBFhCKcckzTQT9foDW
   Dz7QkQpnx3n+EbCi+tNES0llAXvNjmWA47YD4UHZg2hMSddhIWTo3S6wE
   sYQkG8B2mcwVqd0pdVbfeh8Wi2cXpzchjrzDOYZl1L3Vtn8zKZ9XHb3pY
   WLote0jtBRPV2SFVqS3oGX02cc181ASBr+AshB6rxKTiIKnm2h5JDDTTh
   Nab7WhsNtrIcXQkfqwTU9FJ8HhVfGshIu02FJ16qvoeqUGR6wifw6SDIq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384261795"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="384261795"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 00:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="944182127"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="944182127"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 00:44:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAR2O-0008b0-1a;
	Tue, 05 Dec 2023 08:44:16 +0000
Date: Tue, 5 Dec 2023 16:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8450-sm8550-on-next 45/48] make[6]: *** No
 rule to make target 'sound/soc/qcom/sm8450.o', needed by
 'sound/soc/qcom/built-in.a'.
Message-ID: <202312051616.fQTlV27N-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051616.fQTlV27N-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051616.fQTlV27N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051616.fQTlV27N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'sound/soc/qcom/sm8450.o', needed by 'sound/soc/qcom/built-in.a'.
   make[6]: Target 'sound/soc/qcom/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
