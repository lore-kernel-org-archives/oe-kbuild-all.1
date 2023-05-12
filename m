Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C208924129
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683907907; x=1715443907;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6NYzPG7ZnTomxT7L0ly554RI+aWZ8yEBEpVyyXBN2Io=;
  b=SoXYqq0Ix7sS/NZC9KauHfKdJ+AA08L9AbtTSNdFYSUrIT3AJzr5Ho8b
   cKRb6pF9mWOBZJV4fNjhsnmafXikpjpcTeFRl8lwN0UILB6RWbd1TRKAA
   YQANXDEUBR+3z09B6u4ovlXkwWiBAGml4CPawMlXZ0XbMcdKoLK/zJteo
   y/zS3Da2TiUrRiC3wVTZaQwJrfOqm58Eoeq5S0q1NOKyKDoXJW252rxoR
   UQygHVSaWvqGBS+lbWhlYyvKUhy5VH/PLOTMG965kWkyD7C3OtR3NePmS
   omYlj4eZ4fxhOfoDhUIw6C7+kVNkRK0Pfprj834CmbZbNsG87MGrlVyPg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353075257"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353075257"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 09:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="677713790"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="677713790"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 May 2023 09:10:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxVM2-0004xY-0L
	for oe-kbuild-all@lists.linux.dev;
	Fri, 12 May 2023 16:10:50 +0000
Date: Sat, 13 May 2023 00:09:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 15097/30000]
 drivers/pwm/pwm-stm32-lp.c:63:50: warning: format specifies type 'unsigned
 int' but the argument has type 'u64' (aka 'unsigned long long')
Message-ID: <202305130047.OaamH5Tr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fenglin,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   180df1199944ebd8928f320a1bd16c8a87dba2ed
commit: d892c9f3571faa2e691fc3a9eb6ea4f4da1d7eab [15097/30000] ANDROID: GKI: pwm: core: Add option to config PWM duty/period with u64 data length
config: mips-randconfig-r025-20230511 (https://download.01.org/0day-ci/archive/20230513/202305130047.OaamH5Tr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/d892c9f3571faa2e691fc3a9eb6ea4f4da1d7eab
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout d892c9f3571faa2e691fc3a9eb6ea4f4da1d7eab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash M=drivers/pwm

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130047.OaamH5Tr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mfd/stm32-lptimer.h:12:
   In file included from include/linux/clk.h:17:
   In file included from include/linux/notifier.h:14:
   In file included from include/linux/mutex.h:14:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:5:
   include/linux/thread_info.h:141:29: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned int') [-Wsign-compare]
           if (unlikely(sz >= 0 && sz < bytes)) {
                                   ~~ ^ ~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   In file included from drivers/pwm/pwm-stm32-lp.c:13:
   In file included from include/linux/mfd/stm32-lptimer.h:12:
   In file included from include/linux/clk.h:17:
   In file included from include/linux/notifier.h:14:
   In file included from include/linux/mutex.h:14:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:5:
   include/linux/thread_info.h:141:29: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned int') [-Wsign-compare]
           if (unlikely(sz >= 0 && sz < bytes)) {
                                   ~~ ^ ~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from drivers/pwm/pwm-stm32-lp.c:13:
   In file included from include/linux/mfd/stm32-lptimer.h:12:
   In file included from include/linux/clk.h:17:
   In file included from include/linux/notifier.h:15:
   In file included from include/linux/rwsem.h:16:
   In file included from include/linux/spinlock.h:88:
   In file included from arch/mips/include/asm/spinlock.h:13:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   include/asm-generic/qrwlock.h:75:36: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                                                cnts, cnts | _QW_LOCKED) == cnts);
                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   In file included from drivers/pwm/pwm-stm32-lp.c:13:
   In file included from include/linux/mfd/stm32-lptimer.h:12:
   In file included from include/linux/clk.h:17:
   In file included from include/linux/notifier.h:15:
   In file included from include/linux/rwsem.h:16:
   In file included from include/linux/spinlock.h:88:
   In file included from arch/mips/include/asm/spinlock.h:13:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   include/asm-generic/qrwlock.h:75:36: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                                                cnts, cnts | _QW_LOCKED) == cnts);
                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from drivers/pwm/pwm-stm32-lp.c:14:
   In file included from include/linux/module.h:13:
   In file included from include/linux/kmod.h:22:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1000:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   In file included from drivers/pwm/pwm-stm32-lp.c:14:
   In file included from include/linux/module.h:13:
   In file included from include/linux/kmod.h:22:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1000:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from drivers/pwm/pwm-stm32-lp.c:17:
   include/linux/pwm.h:453:50: warning: comparison of integers of different signs: 'u64' (aka 'unsigned long long') and 'int' [-Wsign-compare]
           if (state.duty_cycle == duty_ns && state.period == period_ns)
                                              ~~~~~~~~~~~~ ^  ~~~~~~~~~
   include/linux/pwm.h:453:23: warning: comparison of integers of different signs: 'u64' (aka 'unsigned long long') and 'int' [-Wsign-compare]
           if (state.duty_cycle == duty_ns && state.period == period_ns)
               ~~~~~~~~~~~~~~~~ ^  ~~~~~~~
>> drivers/pwm/pwm-stm32-lp.c:63:50: warning: format specifies type 'unsigned int' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
                   dev_dbg(priv->chip.dev, "Can't reach %u ns\n",  state->period);
                                                        ~~         ^~~~~~~~~~~~~
                                                        %llu
   include/linux/device.h:1527:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   11 warnings generated.
   Assembler messages:
   Fatal error: invalid -march= option: `mips32'
   clang: error: assembler command failed with exit code 1 (use -v to see invocation)


vim +63 drivers/pwm/pwm-stm32-lp.c

e70a540b4e0230 Fabrice Gasnier 2017-08-28   32  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   33  static int stm32_pwm_lp_apply(struct pwm_chip *chip, struct pwm_device *pwm,
e70a540b4e0230 Fabrice Gasnier 2017-08-28   34  			      struct pwm_state *state)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   35  {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   36  	struct stm32_pwm_lp *priv = to_stm32_pwm_lp(chip);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   37  	unsigned long long prd, div, dty;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   38  	struct pwm_state cstate;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   39  	u32 val, mask, cfgr, presc = 0;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   40  	bool reenable;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   41  	int ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   42  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   43  	pwm_get_state(pwm, &cstate);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   44  	reenable = !cstate.enabled;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   45  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   46  	if (!state->enabled) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   47  		if (cstate.enabled) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   48  			/* Disable LP timer */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   49  			ret = regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   50  			if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   51  				return ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   52  			/* disable clock to PWM counter */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   53  			clk_disable(priv->clk);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   54  		}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   55  		return 0;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   56  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   57  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   58  	/* Calculate the period and prescaler value */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   59  	div = (unsigned long long)clk_get_rate(priv->clk) * state->period;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   60  	do_div(div, NSEC_PER_SEC);
65348659535d23 Fabrice Gasnier 2019-09-18   61  	if (!div) {
65348659535d23 Fabrice Gasnier 2019-09-18   62  		/* Clock is too slow to achieve requested period. */
65348659535d23 Fabrice Gasnier 2019-09-18  @63  		dev_dbg(priv->chip.dev, "Can't reach %u ns\n",	state->period);
65348659535d23 Fabrice Gasnier 2019-09-18   64  		return -EINVAL;
65348659535d23 Fabrice Gasnier 2019-09-18   65  	}
65348659535d23 Fabrice Gasnier 2019-09-18   66  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   67  	prd = div;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   68  	while (div > STM32_LPTIM_MAX_ARR) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   69  		presc++;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   70  		if ((1 << presc) > STM32_LPTIM_MAX_PRESCALER) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   71  			dev_err(priv->chip.dev, "max prescaler exceeded\n");
e70a540b4e0230 Fabrice Gasnier 2017-08-28   72  			return -EINVAL;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   73  		}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   74  		div = prd >> presc;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   75  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   76  	prd = div;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   77  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   78  	/* Calculate the duty cycle */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   79  	dty = prd * state->duty_cycle;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   80  	do_div(dty, state->period);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   81  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   82  	if (!cstate.enabled) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   83  		/* enable clock to drive PWM counter */
e70a540b4e0230 Fabrice Gasnier 2017-08-28   84  		ret = clk_enable(priv->clk);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   85  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   86  			return ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   87  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28   88  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   89  	ret = regmap_read(priv->regmap, STM32_LPTIM_CFGR, &cfgr);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   90  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28   91  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   92  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   93  	if ((FIELD_GET(STM32_LPTIM_PRESC, cfgr) != presc) ||
e70a540b4e0230 Fabrice Gasnier 2017-08-28   94  	    (FIELD_GET(STM32_LPTIM_WAVPOL, cfgr) != state->polarity)) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28   95  		val = FIELD_PREP(STM32_LPTIM_PRESC, presc);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   96  		val |= FIELD_PREP(STM32_LPTIM_WAVPOL, state->polarity);
e70a540b4e0230 Fabrice Gasnier 2017-08-28   97  		mask = STM32_LPTIM_PRESC | STM32_LPTIM_WAVPOL;
e70a540b4e0230 Fabrice Gasnier 2017-08-28   98  
e70a540b4e0230 Fabrice Gasnier 2017-08-28   99  		/* Must disable LP timer to modify CFGR */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  100  		reenable = true;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  101  		ret = regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  102  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  103  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  104  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  105  		ret = regmap_update_bits(priv->regmap, STM32_LPTIM_CFGR, mask,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  106  					 val);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  107  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  108  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  109  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  110  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  111  	if (reenable) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  112  		/* Must (re)enable LP timer to modify CMP & ARR */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  113  		ret = regmap_write(priv->regmap, STM32_LPTIM_CR,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  114  				   STM32_LPTIM_ENABLE);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  115  		if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  116  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  117  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  118  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  119  	ret = regmap_write(priv->regmap, STM32_LPTIM_ARR, prd - 1);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  120  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  121  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  122  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  123  	ret = regmap_write(priv->regmap, STM32_LPTIM_CMP, prd - (1 + dty));
e70a540b4e0230 Fabrice Gasnier 2017-08-28  124  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  125  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  126  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  127  	/* ensure CMP & ARR registers are properly written */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  128  	ret = regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  129  				       (val & STM32_LPTIM_CMPOK_ARROK),
e70a540b4e0230 Fabrice Gasnier 2017-08-28  130  				       100, 1000);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  131  	if (ret) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  132  		dev_err(priv->chip.dev, "ARR/CMP registers write issue\n");
e70a540b4e0230 Fabrice Gasnier 2017-08-28  133  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  134  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  135  	ret = regmap_write(priv->regmap, STM32_LPTIM_ICR,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  136  			   STM32_LPTIM_CMPOKCF_ARROKCF);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  137  	if (ret)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  138  		goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  139  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  140  	if (reenable) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  141  		/* Start LP timer in continuous mode */
e70a540b4e0230 Fabrice Gasnier 2017-08-28  142  		ret = regmap_update_bits(priv->regmap, STM32_LPTIM_CR,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  143  					 STM32_LPTIM_CNTSTRT,
e70a540b4e0230 Fabrice Gasnier 2017-08-28  144  					 STM32_LPTIM_CNTSTRT);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  145  		if (ret) {
e70a540b4e0230 Fabrice Gasnier 2017-08-28  146  			regmap_write(priv->regmap, STM32_LPTIM_CR, 0);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  147  			goto err;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  148  		}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  149  	}
e70a540b4e0230 Fabrice Gasnier 2017-08-28  150  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  151  	return 0;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  152  err:
e70a540b4e0230 Fabrice Gasnier 2017-08-28  153  	if (!cstate.enabled)
e70a540b4e0230 Fabrice Gasnier 2017-08-28  154  		clk_disable(priv->clk);
e70a540b4e0230 Fabrice Gasnier 2017-08-28  155  
e70a540b4e0230 Fabrice Gasnier 2017-08-28  156  	return ret;
e70a540b4e0230 Fabrice Gasnier 2017-08-28  157  }
e70a540b4e0230 Fabrice Gasnier 2017-08-28  158  

:::::: The code at line 63 was first introduced by commit
:::::: 65348659535d23e6fb7a79aa9d54332479cf980e pwm: stm32-lp: Add check in case requested period cannot be achieved

:::::: TO: Fabrice Gasnier <fabrice.gasnier@st.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
