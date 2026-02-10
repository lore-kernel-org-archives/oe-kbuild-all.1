Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04A0338F45
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759005; cv=none; b=hHvkmgEtX7dexSKVEgZ/G4Figvt//Yb1Yu97anwtKPC+1jop70F5kItT2Iy5mwgcO+oHTSmlcpGv9WCuh6/1cHC8AzKS49BXFm7K/Tc2kEF1jdlqP4Cda1yGYm+a379R9puMHImn2ADX1Y0xijsMVCM3U6yy7IEOlwB+rvl36wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759005; c=relaxed/simple;
	bh=CRNk/kGUmibrJKNsr0neiaw/0lBEomVosB9X0QJ5zMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BTx4bzXL91K2TY/zxlzwlfe8pA9r0i2RlSOar4klBVY1PD7tsy4pGRAWiC6SIeSXXyWe0OnLPsxa2CNc5oj14r98KW9SJ01UAm90GNkAvye3WR3a5nfHIeyBKmT3Rn/wrjem4bcn8fpK4sVHjW14xk6tTPqamBvWHm7I0QFPwEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lD/T4+zq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lD/T4+zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770759003; x=1802295003;
  h=date:from:to:cc:subject:message-id;
  bh=CRNk/kGUmibrJKNsr0neiaw/0lBEomVosB9X0QJ5zMc=;
  b=lD/T4+zq9cs/z9+Vv8gS+9EU+KLGR2DSRnzdUU51y2uuLcwSTpxw/3jT
   BJde6+LNq3T+8+r3rnVmCrh1QFutrdYd8UVTOUdP1lmL9S62uLP1J3RXC
   aB3JDu9nwFGTSmRYLoZvNd5XIH9wKM+W4lxQxM/hhLLXc6DxYSXW9PVAT
   25XivUaU+BXPFJlb0Ll7pMpQQJEV3kyKXHEzw+4kPAZT5M+7KR1E3N+iu
   8U6GhGlY2BZQnowTBARn5CsTSTMzztA13U8F7CKRjgTKNZuM4WppGjmaW
   iJ3OFO2kuDbc8LVYLF9ykDcrjjRD5WjgZRq6ma1CUR7nPYQJLF3yFMQjv
   w==;
X-CSE-ConnectionGUID: jEV2DxY6RS6Ryu0dIi+Z+g==
X-CSE-MsgGUID: t9KzD6zXSjqc1JcNIlI8sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71887126"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71887126"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 13:30:02 -0800
X-CSE-ConnectionGUID: ajtJDxYRQ5WJBYQPU+TJBg==
X-CSE-MsgGUID: lRIb4TxlRGiSHEXzbPiDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216575858"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 13:30:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpvJ0-00000000pQy-05iy;
	Tue, 10 Feb 2026 21:29:58 +0000
Date: Wed, 11 Feb 2026 05:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josua Mayer <josua@solid-run.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [ulfh-mmc:next 67/72] drivers/mux/core.c:312:14: error:
 redefinition of 'mux_control_states'
Message-ID: <202602110514.DLb4xrVt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   13dc45d829d5ae06f6eee3fbd3cd1f6818c08e48
commit: ad314348ceb4fe1f2ffd2848193ab27ab6d34c4f [67/72] mux: Add helper functions for getting optional and selected mux-state
config: x86_64-buildonly-randconfig-004-20260211 (https://download.01.org/0day-ci/archive/20260211/202602110514.DLb4xrVt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110514.DLb4xrVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110514.DLb4xrVt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mux/core.c:312:14: error: redefinition of 'mux_control_states'
     312 | unsigned int mux_control_states(struct mux_control *mux)
         |              ^~~~~~~~~~~~~~~~~~
   In file included from drivers/mux/core.c:19:
   include/linux/mux/consumer.h:70:28: note: previous definition of 'mux_control_states' with type 'unsigned int(struct mux_control *)'
      70 | static inline unsigned int mux_control_states(struct mux_control *mux)
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:375:5: error: redefinition of 'mux_control_select_delay'
     375 | int mux_control_select_delay(struct mux_control *mux, unsigned int state,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:74:32: note: previous definition of 'mux_control_select_delay' with type 'int(struct mux_control *, unsigned int,  unsigned int)'
      74 | static inline int __must_check mux_control_select_delay(struct mux_control *mux,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:413:5: error: redefinition of 'mux_state_select_delay'
     413 | int mux_state_select_delay(struct mux_state *mstate, unsigned int delay_us)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:79:32: note: previous definition of 'mux_state_select_delay' with type 'int(struct mux_state *, unsigned int)'
      79 | static inline int __must_check mux_state_select_delay(struct mux_state *mstate,
         |                                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:435:5: error: redefinition of 'mux_control_try_select_delay'
     435 | int mux_control_try_select_delay(struct mux_control *mux, unsigned int state,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:84:32: note: previous definition of 'mux_control_try_select_delay' with type 'int(struct mux_control *, unsigned int,  unsigned int)'
      84 | static inline int __must_check mux_control_try_select_delay(struct mux_control *mux,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:469:5: error: redefinition of 'mux_state_try_select_delay'
     469 | int mux_state_try_select_delay(struct mux_state *mstate, unsigned int delay_us)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:90:32: note: previous definition of 'mux_state_try_select_delay' with type 'int(struct mux_state *, unsigned int)'
      90 | static inline int __must_check mux_state_try_select_delay(struct mux_state *mstate,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:487:5: error: redefinition of 'mux_control_deselect'
     487 | int mux_control_deselect(struct mux_control *mux)
         |     ^~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:118:19: note: previous definition of 'mux_control_deselect' with type 'int(struct mux_control *)'
     118 | static inline int mux_control_deselect(struct mux_control *mux)
         |                   ^~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:513:5: error: redefinition of 'mux_state_deselect'
     513 | int mux_state_deselect(struct mux_state *mstate)
         |     ^~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:122:19: note: previous definition of 'mux_state_deselect' with type 'int(struct mux_state *)'
     122 | static inline int mux_state_deselect(struct mux_state *mstate)
         |                   ^~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:636:21: error: redefinition of 'mux_control_get'
     636 | struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
         |                     ^~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:127:35: note: previous definition of 'mux_control_get' with type 'struct mux_control *(struct device *, const char *)'
     127 | static inline struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
         |                                   ^~~~~~~~~~~~~~~
>> drivers/mux/core.c:655:21: error: redefinition of 'mux_control_get_optional'
     655 | struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:131:35: note: previous definition of 'mux_control_get_optional' with type 'struct mux_control *(struct device *, const char *)'
     131 | static inline struct mux_control *mux_control_get_optional(struct device *dev,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:667:6: error: redefinition of 'mux_control_put'
     667 | void mux_control_put(struct mux_control *mux)
         |      ^~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:136:20: note: previous definition of 'mux_control_put' with type 'void(struct mux_control *)'
     136 | static inline void mux_control_put(struct mux_control *mux) {}
         |                    ^~~~~~~~~~~~~~~
>> drivers/mux/core.c:688:21: error: redefinition of 'devm_mux_control_get'
     688 | struct mux_control *devm_mux_control_get(struct device *dev,
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:138:35: note: previous definition of 'devm_mux_control_get' with type 'struct mux_control *(struct device *, const char *)'
     138 | static inline struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name)
         |                                   ^~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:831:19: error: redefinition of 'devm_mux_state_get'
     831 | struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:142:33: note: previous definition of 'devm_mux_state_get' with type 'struct mux_state *(struct device *, const char *)'
     142 | static inline struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
         |                                 ^~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:848:19: error: redefinition of 'devm_mux_state_get_optional'
     848 | struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:146:33: note: previous definition of 'devm_mux_state_get_optional' with type 'struct mux_state *(struct device *, const char *)'
     146 | static inline struct mux_state *devm_mux_state_get_optional(struct device *dev,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:866:19: error: redefinition of 'devm_mux_state_get_selected'
     866 | struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:151:33: note: previous definition of 'devm_mux_state_get_selected' with type 'struct mux_state *(struct device *, const char *)'
     151 | static inline struct mux_state *devm_mux_state_get_selected(struct device *dev,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mux/core.c:885:19: error: redefinition of 'devm_mux_state_get_optional_selected'
     885 | struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mux/consumer.h:156:33: note: previous definition of 'devm_mux_state_get_optional_selected' with type 'struct mux_state *(struct device *, const char *)'
     156 | static inline struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mux_control_states +312 drivers/mux/core.c

a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  305  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  306  /**
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  307   * mux_control_states() - Query the number of multiplexer states.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  308   * @mux: The mux-control to query.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  309   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  310   * Return: The number of multiplexer states.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  311   */
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14 @312  unsigned int mux_control_states(struct mux_control *mux)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  313  {
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  314  	return mux->states;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  315  }
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  316  EXPORT_SYMBOL_GPL(mux_control_states);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  317  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  318  /*
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  319   * The mux->lock must be down when calling this function.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  320   */
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  321  static int __mux_control_select(struct mux_control *mux, int state)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  322  {
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  323  	int ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  324  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  325  	if (WARN_ON(state < 0 || state >= mux->states))
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  326  		return -EINVAL;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  327  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  328  	if (mux->cached_state == state)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  329  		return 0;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  330  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  331  	ret = mux_control_set(mux, state);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  332  	if (ret >= 0)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  333  		return 0;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  334  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  335  	/* The mux update failed, try to revert if appropriate... */
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  336  	if (mux->idle_state != MUX_IDLE_AS_IS)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  337  		mux_control_set(mux, mux->idle_state);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  338  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  339  	return ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  340  }
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  341  
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  342  static void mux_control_delay(struct mux_control *mux, unsigned int delay_us)
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  343  {
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  344  	ktime_t delayend;
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  345  	s64 remaining;
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  346  
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  347  	if (!delay_us)
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  348  		return;
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  349  
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  350  	delayend = ktime_add_us(mux->last_change, delay_us);
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  351  	remaining = ktime_us_delta(delayend, ktime_get());
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  352  	if (remaining > 0)
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  353  		fsleep(remaining);
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  354  }
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  355  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  356  /**
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  357   * mux_control_select_delay() - Select the given multiplexer state.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  358   * @mux: The mux-control to request a change of state from.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  359   * @state: The new requested state.
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  360   * @delay_us: The time to delay (in microseconds) if the mux state is changed.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  361   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  362   * On successfully selecting the mux-control state, it will be locked until
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  363   * there is a call to mux_control_deselect(). If the mux-control is already
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  364   * selected when mux_control_select() is called, the caller will be blocked
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  365   * until mux_control_deselect() or mux_state_deselect() is called (by someone
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  366   * else).
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  367   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  368   * Therefore, make sure to call mux_control_deselect() when the operation is
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  369   * complete and the mux-control is free for others to use, but do not call
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  370   * mux_control_deselect() if mux_control_select() fails.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  371   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  372   * Return: 0 when the mux-control state has the requested state or a negative
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  373   * errno on error.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  374   */
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07 @375  int mux_control_select_delay(struct mux_control *mux, unsigned int state,
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  376  			     unsigned int delay_us)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  377  {
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  378  	int ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  379  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  380  	ret = down_killable(&mux->lock);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  381  	if (ret < 0)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  382  		return ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  383  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  384  	ret = __mux_control_select(mux, state);
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  385  	if (ret >= 0)
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  386  		mux_control_delay(mux, delay_us);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  387  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  388  	if (ret < 0)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  389  		up(&mux->lock);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  390  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  391  	return ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  392  }
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  393  EXPORT_SYMBOL_GPL(mux_control_select_delay);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  394  
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  395  /**
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  396   * mux_state_select_delay() - Select the given multiplexer state.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  397   * @mstate: The mux-state to select.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  398   * @delay_us: The time to delay (in microseconds) if the mux state is changed.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  399   *
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  400   * On successfully selecting the mux-state, its mux-control will be locked
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  401   * until there is a call to mux_state_deselect(). If the mux-control is already
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  402   * selected when mux_state_select() is called, the caller will be blocked
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  403   * until mux_state_deselect() or mux_control_deselect() is called (by someone
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  404   * else).
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  405   *
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  406   * Therefore, make sure to call mux_state_deselect() when the operation is
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  407   * complete and the mux-control is free for others to use, but do not call
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  408   * mux_state_deselect() if mux_state_select() fails.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  409   *
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  410   * Return: 0 when the mux-state has been selected or a negative
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  411   * errno on error.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  412   */
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07 @413  int mux_state_select_delay(struct mux_state *mstate, unsigned int delay_us)
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  414  {
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  415  	return mux_control_select_delay(mstate->mux, mstate->state, delay_us);
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  416  }
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  417  EXPORT_SYMBOL_GPL(mux_state_select_delay);
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  418  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  419  /**
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  420   * mux_control_try_select_delay() - Try to select the given multiplexer state.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  421   * @mux: The mux-control to request a change of state from.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  422   * @state: The new requested state.
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  423   * @delay_us: The time to delay (in microseconds) if the mux state is changed.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  424   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  425   * On successfully selecting the mux-control state, it will be locked until
f22d1117b9c3e2 drivers/mux/core.c     Peter Rosin        2022-01-07  426   * mux_control_deselect() is called.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  427   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  428   * Therefore, make sure to call mux_control_deselect() when the operation is
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  429   * complete and the mux-control is free for others to use, but do not call
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  430   * mux_control_deselect() if mux_control_try_select() fails.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  431   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  432   * Return: 0 when the mux-control state has the requested state or a negative
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  433   * errno on error. Specifically -EBUSY if the mux-control is contended.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  434   */
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07 @435  int mux_control_try_select_delay(struct mux_control *mux, unsigned int state,
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  436  				 unsigned int delay_us)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  437  {
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  438  	int ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  439  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  440  	if (down_trylock(&mux->lock))
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  441  		return -EBUSY;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  442  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  443  	ret = __mux_control_select(mux, state);
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  444  	if (ret >= 0)
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  445  		mux_control_delay(mux, delay_us);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  446  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  447  	if (ret < 0)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  448  		up(&mux->lock);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  449  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  450  	return ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  451  }
17b5b576ff5faf drivers/mux/core.c     Vincent Whitchurch 2021-10-07  452  EXPORT_SYMBOL_GPL(mux_control_try_select_delay);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  453  
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  454  /**
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  455   * mux_state_try_select_delay() - Try to select the given multiplexer state.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  456   * @mstate: The mux-state to select.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  457   * @delay_us: The time to delay (in microseconds) if the mux state is changed.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  458   *
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  459   * On successfully selecting the mux-state, its mux-control will be locked
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  460   * until mux_state_deselect() is called.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  461   *
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  462   * Therefore, make sure to call mux_state_deselect() when the operation is
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  463   * complete and the mux-control is free for others to use, but do not call
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  464   * mux_state_deselect() if mux_state_try_select() fails.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  465   *
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  466   * Return: 0 when the mux-state has been selected or a negative errno on
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  467   * error. Specifically -EBUSY if the mux-control is contended.
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  468   */
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07 @469  int mux_state_try_select_delay(struct mux_state *mstate, unsigned int delay_us)
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  470  {
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  471  	return mux_control_try_select_delay(mstate->mux, mstate->state, delay_us);
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  472  }
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  473  EXPORT_SYMBOL_GPL(mux_state_try_select_delay);
84564481bc4520 drivers/mux/core.c     Aswath Govindraju  2022-01-07  474  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  475  /**
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  476   * mux_control_deselect() - Deselect the previously selected multiplexer state.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  477   * @mux: The mux-control to deselect.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  478   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  479   * It is required that a single call is made to mux_control_deselect() for
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  480   * each and every successful call made to either of mux_control_select() or
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  481   * mux_control_try_select().
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  482   *
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  483   * Return: 0 on success and a negative errno on error. An error can only
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  484   * occur if the mux has an idle state. Note that even if an error occurs, the
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  485   * mux-control is unlocked and is thus free for the next access.
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  486   */
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14 @487  int mux_control_deselect(struct mux_control *mux)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  488  {
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  489  	int ret = 0;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  490  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  491  	if (mux->idle_state != MUX_IDLE_AS_IS &&
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  492  	    mux->idle_state != mux->cached_state)
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  493  		ret = mux_control_set(mux, mux->idle_state);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  494  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  495  	up(&mux->lock);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  496  
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  497  	return ret;
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  498  }
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  499  EXPORT_SYMBOL_GPL(mux_control_deselect);
a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin        2017-05-14  500  

:::::: The code at line 312 was first introduced by commit
:::::: a3b02a9c6591ce154cd44e2383406390a45b530c mux: minimal mux subsystem

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
