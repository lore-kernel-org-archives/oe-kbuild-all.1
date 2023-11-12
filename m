Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A28317ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOVlSl5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699753162; x=1731289162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbRtOE6TpGXkYuSWT43CQbzcxeiNeQg2DfhnsrgcXAA=;
  b=DOVlSl5zt2z3Onu6LQzcN3fXxXZ11SVpqUjX4z26AIP6WyLXtEtd3YQW
   FjOu53AH2drhvpUtxq9uPuBy4veFLQ8JroQoYBRvQo75g4v0uliCZevkA
   bejltz+k4CuG8IcZktYga4m0ZYqtKVwsvvlNcHGvcCbbTQbjR190r3Ow8
   HBzZHNjDv8X4f5jj1GMLEYR9WQ+7SqFQkKJCXaQFm8qWaXpoHJVQ0HTFo
   x6ILtO6jHaEimgfWXMU8BIY9Q5EncHYpDn5xGWpJWuXx62KFRQMYirWeR
   gJLpCEH5pvxvxERxTncy9TEBIywWkqjMg5PRgp6sHiZc/pN4CUvplomao
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="369634515"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="369634515"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 17:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="767607662"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="767607662"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2023 17:39:17 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1zRT-000ArY-0y;
	Sun, 12 Nov 2023 01:39:15 +0000
Date: Sun, 12 Nov 2023 09:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 21/82]
 drivers/media/platform/chips-media/wave5/wave5-helper.c:223:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202311120910.GEhtQsTS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   a98195cd9fc9813d8a2c9959484e5d3f9eb2502e
commit: 1bb45095919cd3307dd7729168754a3212b7a119 [21/82] arm64: media: wave5: Add Support for frequency points
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120910.GEhtQsTS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120910.GEhtQsTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120910.GEhtQsTS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/chips-media/wave5/wave5-helper.c:223:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (acq_freq != inst->dev->opp_freq) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-helper.c:231:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/media/platform/chips-media/wave5/wave5-helper.c:223:2: note: remove the 'if' if its condition is always true
           if (acq_freq != inst->dev->opp_freq) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-helper.c:206:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   drivers/media/platform/chips-media/wave5/wave5-helper.c:248:28: warning: variable 'req_freq' set but not used [-Wunused-but-set-variable]
           unsigned long pixel_rate, req_freq;
                                     ^
   2 warnings generated.


vim +223 drivers/media/platform/chips-media/wave5/wave5-helper.c

   201	
   202	int wave5_set_dev_clk(struct vpu_instance *inst)
   203	{
   204		struct dev_pm_opp *opp;
   205		unsigned long calc_pixel_rate, req_freq, acq_freq, pixel_rate;
   206		int ret;
   207	
   208		pixel_rate = inst->dev->opp_pixel_rate;
   209		calc_pixel_rate = pixel_rate*(uint)(MAX_OP_HZ);
   210		req_freq = (calc_pixel_rate / MAX_PIXEL_RATE) + 1;
   211		opp = dev_pm_opp_find_freq_ceil(inst->dev->dev, &req_freq);
   212		if (IS_ERR(opp)) {
   213			opp = dev_pm_opp_find_freq_floor(inst->dev->dev, &req_freq);
   214			if (IS_ERR(opp)) {
   215				dev_err(inst->dev->dev, "Failed to get floor value\n");
   216				return -EINVAL;
   217			}
   218	
   219		}
   220	
   221		dev_pm_opp_put(opp);
   222		acq_freq = dev_pm_opp_get_freq(opp);
 > 223		if (acq_freq != inst->dev->opp_freq) {
   224			inst->dev->opp_freq = acq_freq;
   225			ret = dev_pm_opp_set_rate(inst->dev->dev, acq_freq);
   226			if (ret) {
   227				dev_err(inst->dev->dev, "Error setting the clock");
   228				return ret;
   229			}
   230		}
   231		return ret;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
