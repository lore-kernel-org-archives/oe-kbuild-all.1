Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3AC20F5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+WMXD25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054715; x=1732590715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BxKPCfNJZxaZ4jDQagVjB1CO+MBXnsW88XDweDyEf0Q=;
  b=S+WMXD25v5KTUR6GrM3/moAPkdzHbZBASN60ROrTKCK2hjAIHdNCtvnq
   eN/0mYXx/aVIdP1RbwJzXIB1btG6WflcK7EWVPbPOycAjEZpRt1QJmsQm
   b7aJgymS/VZqsaUL55UyG5C1cOyBqIvotOmuvtQ98vs9itr3z30gSVKa7
   yiRwOuYm8nXQGUyS619FKfiokFP5PRfCpkAjyDS8ofkUVcIa0ASreLX9u
   SARKdL3as9ChXEd3Zl/36qQuabCkNTUkYh98hP9Ijw5wVQnOvKe/RRay7
   xV60lQ4G0ULoVRJ4PEjV8G3ZxAjvu7SzpomB/GEX9zdUSEL7nEMpdM1N9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14187899"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="14187899"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717907949"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="717907949"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Nov 2023 19:11:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S1n-0005m6-0Q;
	Mon, 27 Nov 2023 03:11:19 +0000
Date: Mon, 27 Nov 2023 11:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 2589/2998]
 drivers/leds/leds-sun50i-a100.c:309:12: error: call to
 __compiletime_assert_280 declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202311270852.wLjVrXUy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: 090a25ad97983720f52b11d9c5a8d1a446217c1d [2589/2998] leds: sun50i-a100: New driver for the A100 LED controller
config: powerpc64-randconfig-r123-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270852.wLjVrXUy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270852.wLjVrXUy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270852.wLjVrXUy-lkp@intel.com/

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
