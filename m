Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B673AC0C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695218253; x=1726754253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1x2Ttzj8WjkBiDYr4XpsFCCMdbi2Yl7HFiQzRHr2I0=;
  b=hJydgpfnvbjO8L3CQMDKExkiOGwtebRNA2+oA5BlVRu10xbb3sCyM9JE
   MAuFUSYhY03W10hAOgP/PNPYK1Jk9qC4OlGy6zRFEWWx5ld7d21EBHXHe
   oDi9b+fa1+lYNX3Hwd2TmsE0qEuFVJT3ALpGdk/OOVngCyVYjaDVhIaZ/
   aIwyQzYwjcjGSdIKYwK8P19+EyXRyrEPul/xNCfiPhyR+BY34mJyj9TOT
   vzvhV0huOsUnr8sRduv+MRTXaZUbYyM4b9A2qa1cGqWV1kLk4iz64pgWO
   m7i3ZBvRviqQXI/1EyuW8aZpV+z3z3TBcV4qjRN4+7aGde9PzrimPbMIT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379110187"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="379110187"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="723294913"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="723294913"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Sep 2023 06:57:30 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qixho-0008nQ-1Q;
	Wed, 20 Sep 2023 13:57:28 +0000
Date: Wed, 20 Sep 2023 21:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org
Subject: [herbert-cryptodev-2.6:master 47/64] xfrm_algo.c:undefined reference
 to `crypto_has_aead'
Message-ID: <202309202112.33V1Ezb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
head:   1c43c0f1f84aa59dfc98ce66f0a67b2922aa7f9d
commit: a1383e2ab102c4e0d25304c07c66232c23ee0d9b [47/64] ipsec: Stop using crypto_has_alg
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230920/202309202112.33V1Ezb1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202112.33V1Ezb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202112.33V1Ezb1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: net/xfrm/xfrm_algo.o: in function `xfrm_aead_get_byname':
>> xfrm_algo.c:(.text+0x46c): undefined reference to `crypto_has_aead'
>> arc-elf-ld: xfrm_algo.c:(.text+0x46c): undefined reference to `crypto_has_aead'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
