Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7BB23775
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Geq2BSpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697456030; x=1728992030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2OnQjuWNtQOmGRLWXbQXGOltSuenTTCcLgKhj3cYxDE=;
  b=Geq2BSpnsxzz3mutw1qnJOVOorxz9bw2NX/t9VWXdoGje/4eQmd2Cj1Z
   sl3szS62QZsr+I+m3zNb2zvXr6Iu2gWlH/+XXiNrG74RHTe7NOzLPMhdu
   Y0mOttJuPgpTiMyRYc1stijP7GJ4jZpCZgzZVy0BiVzL0CDsX1YrgmJpr
   K+nsWgTFpmX0iMwh9mYDzcOChpJC9hEnF0mMgKVP3/1eqf1GJDTy7euTF
   gCQrirhIyAeEe/Sb81dS9LHg0hZgM9XNXS9QXI5K+FLfqLqUh0uReSdU8
   VAOu0Mhbp/CxG2EEN7xTIZychenx2nrffQ83saEktleECfhlwtMEAy+0r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449714061"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="449714061"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 04:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002899594"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="1002899594"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Oct 2023 04:33:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsLqf-0008LJ-21;
	Mon, 16 Oct 2023 11:33:25 +0000
Date: Mon, 16 Oct 2023 19:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Om Prakash Singh <quic_omprsing@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 11571/12451] undefined reference to
 `devm_hwrng_register'
Message-ID: <202310161945.VDy8ESWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d0515b235dec789578d135a5db586b25c5870cb
commit: f29cd5bb64c258f29b4c49452532481f50eb43ca [11571/12451] crypto: qcom-rng - Add hw_random interface support
config: parisc-randconfig-r001-20221214 (https://download.01.org/0day-ci/archive/20231016/202310161945.VDy8ESWa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161945.VDy8ESWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161945.VDy8ESWa-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/crypto/qcom-rng.o: in function `qcom_rng_probe':
>> (.text+0x11c): undefined reference to `devm_hwrng_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
