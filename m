Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C03DDDA0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786598957; cv=none; b=u1C3Zl9KsAVWL2pmWEmRRPtgJvV7WR4LeBBIx7VcP+V7HxAJqqPgxpGFIs+uk3E17L98PfdLRMgZR30yUIbW0bD5Fg8spTBgr7LXDOXc1S9ppQPNpD43DeHsxMGDnviv85mQ2Sx1r+fjvLMmsLmjwLzvctIQ0NWyauAS6UQJTrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786598957; c=relaxed/simple;
	bh=T9EeiWNrz0hwUBxVZH6v0QXqCq6azgp2DqG3lLedtLc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aLAxIBEBRWzGxiEO9VlYYgknIFicYHovbQC1Cj/Vw3YNNps6G/UZHSSFggNxXoFOjvoKaC55wR7t4e6WcqvFDSxUmA864xqqlfOtyj7obso8Cu9pIOZ/hbj+YhsQ5NEVsWQPOKNoIGBy7rCqBo5V6qQFDsEzLAiJ5vffW6v5w+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmx1hdR8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmx1hdR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786598952; x=1818134952;
  h=date:from:to:cc:subject:message-id;
  bh=T9EeiWNrz0hwUBxVZH6v0QXqCq6azgp2DqG3lLedtLc=;
  b=bmx1hdR81xuVZcTmOpbTy5fDJ2FNEao2jh2Rch48eWDuvsya+mq9UOzM
   pUKfH+OUSS7zPJzb5t0W7FXwyRyYTgBLQ8So4ytZfTG9LvoTUKq7Vxmme
   sMiy533+jbYaVigKwois2inPqqRuQIiIr5lOt0vXfqw2CYuM4kzXuiAew
   uoeSXKfxVAMz8TapjjT5L+3Id9bhbSrmvP2V1soL0bRu+QhTr9wC5coAR
   8OrlWpFXmAIEv2LKz5Qy9DyfOimJn5jlwVQlkXQ4T++xgOriU1zAlu/uv
   WwRhAAxVmBsTqtdIz6TO01HLhCk9vuEmUS447wxGm886IhQz0mmZPcoPy
   A==;
X-CSE-ConnectionGUID: yP4IgQ73SP6h0N97LrTQ+Q==
X-CSE-MsgGUID: p2DL3MomQj2JyxBP7EhyNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86929761"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86929761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 22:29:08 -0700
X-CSE-ConnectionGUID: +yEr4OacRziRIoNmCrIvAw==
X-CSE-MsgGUID: nyfMbOVPS3m2Rbs4pAkw6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="288635717"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 22:29:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuNzz-00000000Sve-495I;
	Thu, 13 Aug 2026 05:29:03 +0000
Date: Thu, 13 Aug 2026 13:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 drivers/platform/x86/thinkpad_acpi.c:10451:36: warning: declaration of
 'struct platform_profile_handler' will not be visible outside of this
 function
Message-ID: <202608131313.1vWYIQNp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 82c3c913af0c82e7da403f126de414662b19d5ab [0/1] UPSTREAM: ACPI: platform_profile: Move platform_profile_handler
config: i386-randconfig-013-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131313.1vWYIQNp-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131313.1vWYIQNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131313.1vWYIQNp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/thinkpad_acpi.c:10451:36: warning: declaration of 'struct platform_profile_handler' will not be visible outside of this function [-Wvisibility]
    10451 | static int dytc_profile_get(struct platform_profile_handler *pprof,
          |                                    ^
   drivers/platform/x86/thinkpad_acpi.c:10526:36: warning: declaration of 'struct platform_profile_handler' will not be visible outside of this function [-Wvisibility]
    10526 | static int dytc_profile_set(struct platform_profile_handler *pprof,
          |                                    ^
   drivers/platform/x86/thinkpad_acpi.c:10603:27: error: too few arguments to function call, single argument 'dev' was not specified
    10603 |                 platform_profile_notify();
          |                 ~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/platform_profile.h:45:6: note: 'platform_profile_notify' declared here
      45 | void platform_profile_notify(struct device *dev);
         |      ^                       ~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10607:40: error: variable has incomplete type 'struct platform_profile_handler'
    10607 | static struct platform_profile_handler dytc_profile = {
          |                                        ^
   drivers/platform/x86/thinkpad_acpi.c:10607:15: note: forward declaration of 'struct platform_profile_handler'
    10607 | static struct platform_profile_handler dytc_profile = {
          |               ^
   drivers/platform/x86/thinkpad_acpi.c:10701:26: error: too few arguments to function call, single argument 'dev' was not specified
    10701 |         platform_profile_remove();
          |         ~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/platform_profile.h:40:5: note: 'platform_profile_remove' declared here
      40 | int platform_profile_remove(struct device *dev);
         |     ^                       ~~~~~~~~~~~~~~~~~~
   2 warnings and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +10451 drivers/platform/x86/thinkpad_acpi.c

c3bfcd4c676238e Mark Pearson  2021-01-11  10446  
c3bfcd4c676238e Mark Pearson  2021-01-11  10447  /*
c3bfcd4c676238e Mark Pearson  2021-01-11  10448   * dytc_profile_get: Function to register with platform_profile
c3bfcd4c676238e Mark Pearson  2021-01-11  10449   * handler. Returns current platform profile.
c3bfcd4c676238e Mark Pearson  2021-01-11  10450   */
d2386d791cb72e0 Hans de Goede 2021-02-04 @10451  static int dytc_profile_get(struct platform_profile_handler *pprof,
c3bfcd4c676238e Mark Pearson  2021-01-11  10452  			    enum platform_profile_option *profile)
c3bfcd4c676238e Mark Pearson  2021-01-11  10453  {
c3bfcd4c676238e Mark Pearson  2021-01-11  10454  	*profile = dytc_current_profile;
c3bfcd4c676238e Mark Pearson  2021-01-11  10455  	return 0;
c3bfcd4c676238e Mark Pearson  2021-01-11  10456  }
c3bfcd4c676238e Mark Pearson  2021-01-11  10457  

:::::: The code at line 10451 was first introduced by commit
:::::: d2386d791cb72e0dcaa5f43d509a4f71c44f47d8 platform/x86: thinkpad_acpi: Fix 'warning: no previous prototype for' warnings

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
