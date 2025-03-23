Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7B1FFC4C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742723029; cv=none; b=fn3M3ZMkcamKtoxFbY3Z7F/lZtp/NtH/pVQC1kRqLHsxjOlr1fr0D9StwMX/zrlBcbKQ5YsUcGsA47YKe5O/MqFO5rt93r3ZcsURdEJQiWZ6IGi/brVtlaWQYQM0OPtsNJcG9LeGgB54L5llxKAxJxPAkg/CLeRQx5AG4o+FzsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742723029; c=relaxed/simple;
	bh=3OvUN1gtUEQMaTvp1Yd7m9qV9jiaNglpvf5Gu+nK/JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBNJY9XU0E5Syl32RHE2dUYS9DT6grrAtBjcWpItIQ7MD+rpPqZexXOuWwFo0p7Pe/rlhZO6lH5ZygzxrdNPQxkMuNhnCWwMutSXwpjqpcIuwujGUQXbZfp6H5xTSDlgXYKUVOfNtD0Ch59vee6VgU64UXfJFeJEjIdMI6hC6rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1Dp6XWb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1Dp6XWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742723027; x=1774259027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OvUN1gtUEQMaTvp1Yd7m9qV9jiaNglpvf5Gu+nK/JI=;
  b=H1Dp6XWbECPDCfcI5RxKs95sxQO6qRvi3Ro+iX+KldRn/B2ex5rig6+W
   ilzeBtKNJIFLHHAQgsIwmu8ndbGmOdlmUxGiDeH4TEJpJKY35mZH0M4Fk
   KHtLzZJuqeT3DpGAmM9qngeF68mjB+f+Tpu8/kmPHGpVhBhsxUQEXK0or
   lRUwy5yx2GbWTfNcxrPG+WwmoOwQTgJwSvENwCv2OoNJtnLYckbtg/ill
   FNIPuvZdbc7Ze20nhrZIsQVJWVFhhhgkpv5+iY+E/11dutTawQ5Q1fz9l
   3VEL2bkUzPEIGpqT31irIO86546tI1VjubOOm8EzQPGE5KIICzLZNlgSf
   g==;
X-CSE-ConnectionGUID: LnK29pOBQp+u3CbHR9Plqg==
X-CSE-MsgGUID: Cbvj9BGUT/+dHCyAuNU6Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43822712"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="43822712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 02:43:46 -0700
X-CSE-ConnectionGUID: zmAHU3fVTPu780wk9ekfDw==
X-CSE-MsgGUID: B82ue3lRR4yp5Fqw+VluFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="123580125"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2025 02:43:45 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twHri-0002hD-0L;
	Sun, 23 Mar 2025 09:43:37 +0000
Date: Sun, 23 Mar 2025 17:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 9/21] drivers/pwm/pwm-mediatek.c:142:41:
 warning: passing argument 1 of 'clk_get_rate' makes pointer from integer
 without a cast
Message-ID: <202503231705.dUsuZsku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   aecd65419533fc7a9eb88c055189d4ec4c9fbdca
commit: 38fca6d9fa6497b95c4b53427d3e83908b807cf3 [9/21] pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
config: arc-randconfig-001-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231705.dUsuZsku-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503231705.dUsuZsku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231705.dUsuZsku-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/pgtable.h:14,
                    from include/asm-generic/io.h:1108,
                    from arch/arc/include/asm/io.h:229,
                    from include/linux/io.h:14,
                    from drivers/pwm/pwm-mediatek.c:11:
   drivers/pwm/pwm-mediatek.c: In function 'pwm_mediatek_config':
>> drivers/pwm/pwm-mediatek.c:142:41: warning: passing argument 1 of 'clk_get_rate' makes pointer from integer without a cast [-Wint-conversion]
     142 |         do_div(resolution, clk_get_rate(clk_rate));
         |                                         ^~~~~~~~
         |                                         |
         |                                         long unsigned int
   include/asm-generic/div64.h:181:28: note: in definition of macro 'do_div'
     181 |         uint32_t __base = (base);                       \
         |                            ^~~~
   In file included from drivers/pwm/pwm-mediatek.c:15:
   include/linux/clk.h:751:40: note: expected 'struct clk *' but argument is of type 'long unsigned int'
     751 | unsigned long clk_get_rate(struct clk *clk);
         |                            ~~~~~~~~~~~~^~~


vim +/clk_get_rate +142 drivers/pwm/pwm-mediatek.c

  > 11	#include <linux/io.h>
    12	#include <linux/ioport.h>
    13	#include <linux/kernel.h>
    14	#include <linux/module.h>
    15	#include <linux/clk.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/pwm.h>
    19	#include <linux/slab.h>
    20	#include <linux/types.h>
    21	
    22	/* PWM registers and bits definitions */
    23	#define PWMCON			0x00
    24	#define PWMHDUR			0x04
    25	#define PWMLDUR			0x08
    26	#define PWMGDUR			0x0c
    27	#define PWMWAVENUM		0x28
    28	#define PWMDWIDTH		0x2c
    29	#define PWM45DWIDTH_FIXUP	0x30
    30	#define PWMTHRES		0x30
    31	#define PWM45THRES_FIXUP	0x34
    32	#define PWM_CK_26M_SEL		0x210
    33	
    34	#define PWM_CLK_DIV_MAX		7
    35	
    36	struct pwm_mediatek_of_data {
    37		unsigned int num_pwms;
    38		bool pwm45_fixup;
    39		bool has_ck_26m_sel;
    40		const unsigned int *reg_offset;
    41	};
    42	
    43	/**
    44	 * struct pwm_mediatek_chip - struct representing PWM chip
    45	 * @regs: base address of PWM chip
    46	 * @clk_top: the top clock generator
    47	 * @clk_main: the clock used by PWM core
    48	 * @clk_pwms: the clock used by each PWM channel
    49	 * @soc: pointer to chip's platform data
    50	 */
    51	struct pwm_mediatek_chip {
    52		void __iomem *regs;
    53		struct clk *clk_top;
    54		struct clk *clk_main;
    55		struct clk **clk_pwms;
    56		const struct pwm_mediatek_of_data *soc;
    57	};
    58	
    59	static const unsigned int mtk_pwm_reg_offset_v1[] = {
    60		0x0010, 0x0050, 0x0090, 0x00d0, 0x0110, 0x0150, 0x0190, 0x0220
    61	};
    62	
    63	static const unsigned int mtk_pwm_reg_offset_v2[] = {
    64		0x0080, 0x00c0, 0x0100, 0x0140, 0x0180, 0x01c0, 0x0200, 0x0240
    65	};
    66	
    67	static inline struct pwm_mediatek_chip *
    68	to_pwm_mediatek_chip(struct pwm_chip *chip)
    69	{
    70		return pwmchip_get_drvdata(chip);
    71	}
    72	
    73	static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
    74					   struct pwm_device *pwm)
    75	{
    76		struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
    77		int ret;
    78	
    79		ret = clk_prepare_enable(pc->clk_top);
    80		if (ret < 0)
    81			return ret;
    82	
    83		ret = clk_prepare_enable(pc->clk_main);
    84		if (ret < 0)
    85			goto disable_clk_top;
    86	
    87		ret = clk_prepare_enable(pc->clk_pwms[pwm->hwpwm]);
    88		if (ret < 0)
    89			goto disable_clk_main;
    90	
    91		return 0;
    92	
    93	disable_clk_main:
    94		clk_disable_unprepare(pc->clk_main);
    95	disable_clk_top:
    96		clk_disable_unprepare(pc->clk_top);
    97	
    98		return ret;
    99	}
   100	
   101	static void pwm_mediatek_clk_disable(struct pwm_chip *chip,
   102					     struct pwm_device *pwm)
   103	{
   104		struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
   105	
   106		clk_disable_unprepare(pc->clk_pwms[pwm->hwpwm]);
   107		clk_disable_unprepare(pc->clk_main);
   108		clk_disable_unprepare(pc->clk_top);
   109	}
   110	
   111	static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
   112					       unsigned int num, unsigned int offset,
   113					       u32 value)
   114	{
   115		writel(value, chip->regs + chip->soc->reg_offset[num] + offset);
   116	}
   117	
   118	static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
   119				       int duty_ns, int period_ns)
   120	{
   121		struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
   122		u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
   123		    reg_thres = PWMTHRES;
   124		unsigned long clk_rate;
   125		u64 resolution;
   126		int ret;
   127	
   128		ret = pwm_mediatek_clk_enable(chip, pwm);
   129		if (ret < 0)
   130			return ret;
   131	
   132		clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
   133		if (!clk_rate)
   134			return -EINVAL;
   135	
   136		/* Make sure we use the bus clock and not the 26MHz clock */
   137		if (pc->soc->has_ck_26m_sel)
   138			writel(0, pc->regs + PWM_CK_26M_SEL);
   139	
   140		/* Using resolution in picosecond gets accuracy higher */
   141		resolution = (u64)NSEC_PER_SEC * 1000;
 > 142		do_div(resolution, clk_get_rate(clk_rate));
   143	
   144		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
   145		while (cnt_period > 8191) {
   146			resolution *= 2;
   147			clkdiv++;
   148			cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
   149							   resolution);
   150		}
   151	
   152		if (clkdiv > PWM_CLK_DIV_MAX) {
   153			pwm_mediatek_clk_disable(chip, pwm);
   154			dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
   155			return -EINVAL;
   156		}
   157	
   158		if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
   159			/*
   160			 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
   161			 * from the other PWMs on MT7623.
   162			 */
   163			reg_width = PWM45DWIDTH_FIXUP;
   164			reg_thres = PWM45THRES_FIXUP;
   165		}
   166	
   167		cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
   168		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
   169		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
   170		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
   171	
   172		pwm_mediatek_clk_disable(chip, pwm);
   173	
   174		return 0;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
