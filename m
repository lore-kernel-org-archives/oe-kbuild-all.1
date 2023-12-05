Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745436AB8E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcWbNnqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701806269; x=1733342269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iidq6+eT7uQVsBEMBxNEouw9UkVfE4VbsnM7z9CDRKs=;
  b=CcWbNnqtKZjnija3ERhsq8S8/d8mnaEet71rHk1swFMDKEy4Cxk6OJAa
   q9B54qvW5sfuON2DfV70g74zpSzFJwWUNcWkf0fcN/W4nRirD4WirN1AJ
   m9QdSAtpD7a1rKucOOCa/TSlOYg2dDKh+KAoIAL3/lWCXziT7tVn1uZlR
   cYy2V1eOY8iq8/99LpC5qTSyoh1LCs47zXM24DJPd5FA045zUYZ33aVln
   cm1yfqKpjIEB+1fUm5xOjeoKICQp4CsShTjN49vU948jnBT48pChJ39LZ
   weLjJCzdjWGMwZQQKo9ihIqKEpvkODtBgpxVQnneQNqSScqpWIzDEl7gK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378973704"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="378973704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:57:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12449684"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 11:57:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbY8-0009eU-21;
	Tue, 05 Dec 2023 19:57:44 +0000
Date: Wed, 6 Dec 2023 03:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 2053/4884]
 drivers/leds/leds-sun50i-a100.c:309:12: error: call to
 __compiletime_assert_280 declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202312060311.Tnsv2fl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Samuel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 090a25ad97983720f52b11d9c5a8d1a446217c1d [2053/4884] leds: sun50i-a100: New driver for the A100 LED controller
config: powerpc64-randconfig-r123-20231126 (https://download.01.org/0day-ci/archive/20231206/202312060311.Tnsv2fl2-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060311.Tnsv2fl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060311.Tnsv2fl2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/leds-sun50i-a100.c:309:12: error: call to __compiletime_assert_280 declared with 'error' attribute: FIELD_PREP: value too large for the field
           control = FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T1H, timing->t1h_ns / cycle_ns) |
                     ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:54:1: note: expanded from here
   __compiletime_assert_280
   ^
   1 error generated.


vim +/error +309 drivers/leds/leds-sun50i-a100.c

   301	
   302	static void sun50i_a100_ledc_set_timing(struct sun50i_a100_ledc *priv)
   303	{
   304		const struct sun50i_a100_ledc_timing *timing = &priv->timing;
   305		unsigned long mod_freq = clk_get_rate(priv->mod_clk);
   306		u32 cycle_ns = NSEC_PER_SEC / mod_freq;
   307		u32 control;
   308	
 > 309		control = FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T1H, timing->t1h_ns / cycle_ns) |
   310			  FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T1L, timing->t1l_ns / cycle_ns) |
   311			  FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T0H, timing->t0h_ns / cycle_ns) |
   312			  FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T0L, timing->t0l_ns / cycle_ns);
   313		writel(control, priv->base + LEDC_T01_TIMING_CTRL_REG);
   314	
   315		control = FIELD_PREP(LEDC_RESET_TIMING_CTRL_REG_TR, timing->treset_ns / cycle_ns) |
   316			  FIELD_PREP(LEDC_RESET_TIMING_CTRL_REG_LED_NUM, priv->max_addr);
   317		writel(control, priv->base + LEDC_RESET_TIMING_CTRL_REG);
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
