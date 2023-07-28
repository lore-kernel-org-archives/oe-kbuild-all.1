Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE67C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 01:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690508066; x=1722044066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jbHajxxW1UJTor/nOeQcW/1HnGXY20/mLD8j9PtNdhs=;
  b=IF0nREHGQZqicFjMlNN5khCMr2e5hxDcpuLAjAkDdobpn22V/dHMtn3r
   zkqaUKYcmg+HbWdsk0ocu3DSyzn8J1s0DZDvs7Ch3p45MVM75XR7IJ3c1
   SSpvvnIJYmn4Rf6X4vTyg0+0RCIpI/dv+Gg5yc9HYIGl7301pY+uZ60Jm
   CpZuimWMGSEjis4H3MIZnNpjvJdJYbCYWxTClvzcBXaGkt7DsPa/Bct7u
   lE24ZmWUH6DQEz9hO2x8KE0M3hkx9qvtwAjaYHJd0BH4FnYmO2ViEYY9g
   2XzW/bmuIHZbtpyX+GBx/9zJdyS41Kr7XaS9AHEC515hgRlOt8Ki4uAuT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399417256"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="399417256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 18:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901043595"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="901043595"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 18:34:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPCN4-0002l5-16;
	Fri, 28 Jul 2023 01:34:22 +0000
Date: Fri, 28 Jul 2023 09:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 1582/5027] drivers/counter/rz-mtu3-cnt.c:602:
 undefined reference to `rz_mtu3_shared_reg_update_bit'
Message-ID: <202307280957.1acIz9dc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
commit: b8b28b718ddd56e546d44107cf7c57f3a07d7efd [1582/5027] mfd: Add module build support for RZ/G2L MTU3a
config: parisc-randconfig-r033-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280957.1acIz9dc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280957.1acIz9dc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280957.1acIz9dc-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_ext_input_phase_clock_select_set':
>> drivers/counter/rz-mtu3-cnt.c:602: undefined reference to `rz_mtu3_shared_reg_update_bit'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_cascade_counts_enable_set':
   drivers/counter/rz-mtu3-cnt.c:563: undefined reference to `rz_mtu3_shared_reg_update_bit'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_ext_input_phase_clock_select_get':
>> drivers/counter/rz-mtu3-cnt.c:583: undefined reference to `rz_mtu3_shared_reg_read'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_cascade_counts_enable_get':
   drivers/counter/rz-mtu3-cnt.c:544: undefined reference to `rz_mtu3_shared_reg_read'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_lock_if_counter_is_valid':
   drivers/counter/rz-mtu3-cnt.c:111: undefined reference to `rz_mtu3_shared_reg_read'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_direction_read':
>> drivers/counter/rz-mtu3-cnt.c:304: undefined reference to `rz_mtu3_8bit_ch_read'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_function_write':
>> drivers/counter/rz-mtu3-cnt.c:283: undefined reference to `rz_mtu3_8bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_function_read':
   drivers/counter/rz-mtu3-cnt.c:208: undefined reference to `rz_mtu3_8bit_ch_read'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_write':
>> drivers/counter/rz-mtu3-cnt.c:194: undefined reference to `rz_mtu3_16bit_ch_write'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:192: undefined reference to `rz_mtu3_32bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_read':
>> drivers/counter/rz-mtu3-cnt.c:172: undefined reference to `rz_mtu3_16bit_ch_read'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:170: undefined reference to `rz_mtu3_32bit_ch_read'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_enable_read':
>> drivers/counter/rz-mtu3-cnt.c:488: undefined reference to `rz_mtu3_is_enabled'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:486: undefined reference to `rz_mtu3_is_enabled'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:486: undefined reference to `rz_mtu3_is_enabled'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_ceiling_write':
   drivers/counter/rz-mtu3-cnt.c:384: undefined reference to `rz_mtu3_16bit_ch_write'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:386: undefined reference to `rz_mtu3_8bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:382: undefined reference to `rz_mtu3_32bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_action_read':
   drivers/counter/rz-mtu3-cnt.c:208: undefined reference to `rz_mtu3_8bit_ch_read'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:653: undefined reference to `rz_mtu3_shared_reg_read'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_initialize_counter':
   drivers/counter/rz-mtu3-cnt.c:413: undefined reference to `rz_mtu3_8bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:415: undefined reference to `rz_mtu3_8bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:416: undefined reference to `rz_mtu3_8bit_ch_write'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:417: undefined reference to `rz_mtu3_enable'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:399: undefined reference to `rz_mtu3_8bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:401: undefined reference to `rz_mtu3_8bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:402: undefined reference to `rz_mtu3_8bit_ch_write'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:404: undefined reference to `rz_mtu3_enable'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:405: undefined reference to `rz_mtu3_enable'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_enable_write':
>> drivers/counter/rz-mtu3-cnt.c:468: undefined reference to `rz_mtu3_disable'
>> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:464: undefined reference to `rz_mtu3_disable'
   hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:465: undefined reference to `rz_mtu3_disable'


vim +602 drivers/counter/rz-mtu3-cnt.c

0be8907359df4c6 Biju Das 2023-03-30  407  
0be8907359df4c6 Biju Das 2023-03-30  408  static void rz_mtu3_16bit_cnt_setting(struct counter_device *counter, int id)
0be8907359df4c6 Biju Das 2023-03-30  409  {
0be8907359df4c6 Biju Das 2023-03-30  410  	struct rz_mtu3_channel *const ch = rz_mtu3_get_ch(counter, id);
0be8907359df4c6 Biju Das 2023-03-30  411  
0be8907359df4c6 Biju Das 2023-03-30  412  	/* Phase counting mode 1 is used as default in initialization. */
0be8907359df4c6 Biju Das 2023-03-30  413  	rz_mtu3_8bit_ch_write(ch, RZ_MTU3_TMDR1, RZ_MTU3_TMDR1_PH_CNT_MODE_1);
0be8907359df4c6 Biju Das 2023-03-30  414  
0be8907359df4c6 Biju Das 2023-03-30  415  	rz_mtu3_8bit_ch_write(ch, RZ_MTU3_TCR, RZ_MTU3_TCR_CCLR_TGRA);
0be8907359df4c6 Biju Das 2023-03-30  416  	rz_mtu3_8bit_ch_write(ch, RZ_MTU3_TIOR, RZ_MTU3_TIOR_NO_OUTPUT);
0be8907359df4c6 Biju Das 2023-03-30 @417  	rz_mtu3_enable(ch);
0be8907359df4c6 Biju Das 2023-03-30  418  }
0be8907359df4c6 Biju Das 2023-03-30  419  
0be8907359df4c6 Biju Das 2023-03-30  420  static int rz_mtu3_initialize_counter(struct counter_device *counter, int id)
0be8907359df4c6 Biju Das 2023-03-30  421  {
0be8907359df4c6 Biju Das 2023-03-30  422  	struct rz_mtu3_channel *const ch = rz_mtu3_get_ch(counter, id);
0be8907359df4c6 Biju Das 2023-03-30  423  	struct rz_mtu3_channel *const ch1 = rz_mtu3_get_ch(counter, 0);
0be8907359df4c6 Biju Das 2023-03-30  424  	struct rz_mtu3_channel *const ch2 = rz_mtu3_get_ch(counter, 1);
0be8907359df4c6 Biju Das 2023-03-30  425  
0be8907359df4c6 Biju Das 2023-03-30  426  	switch (id) {
0be8907359df4c6 Biju Das 2023-03-30  427  	case RZ_MTU3_16_BIT_MTU1_CH:
0be8907359df4c6 Biju Das 2023-03-30  428  	case RZ_MTU3_16_BIT_MTU2_CH:
0be8907359df4c6 Biju Das 2023-03-30  429  		if (!rz_mtu3_request_channel(ch))
0be8907359df4c6 Biju Das 2023-03-30  430  			return -EBUSY;
0be8907359df4c6 Biju Das 2023-03-30  431  
0be8907359df4c6 Biju Das 2023-03-30  432  		rz_mtu3_16bit_cnt_setting(counter, id);
0be8907359df4c6 Biju Das 2023-03-30  433  		return 0;
0be8907359df4c6 Biju Das 2023-03-30  434  	case RZ_MTU3_32_BIT_CH:
0be8907359df4c6 Biju Das 2023-03-30  435  		/*
0be8907359df4c6 Biju Das 2023-03-30  436  		 * 32-bit phase counting need MTU1 and MTU2 to create 32-bit
0be8907359df4c6 Biju Das 2023-03-30  437  		 * cascade counter.
0be8907359df4c6 Biju Das 2023-03-30  438  		 */
0be8907359df4c6 Biju Das 2023-03-30  439  		if (!rz_mtu3_request_channel(ch1))
0be8907359df4c6 Biju Das 2023-03-30  440  			return -EBUSY;
0be8907359df4c6 Biju Das 2023-03-30  441  
0be8907359df4c6 Biju Das 2023-03-30  442  		if (!rz_mtu3_request_channel(ch2)) {
0be8907359df4c6 Biju Das 2023-03-30  443  			rz_mtu3_release_channel(ch1);
0be8907359df4c6 Biju Das 2023-03-30  444  			return -EBUSY;
0be8907359df4c6 Biju Das 2023-03-30  445  		}
0be8907359df4c6 Biju Das 2023-03-30  446  
0be8907359df4c6 Biju Das 2023-03-30  447  		rz_mtu3_32bit_cnt_setting(counter);
0be8907359df4c6 Biju Das 2023-03-30  448  		return 0;
0be8907359df4c6 Biju Das 2023-03-30  449  	default:
0be8907359df4c6 Biju Das 2023-03-30  450  		/* should never reach this path */
0be8907359df4c6 Biju Das 2023-03-30  451  		return -EINVAL;
0be8907359df4c6 Biju Das 2023-03-30  452  	}
0be8907359df4c6 Biju Das 2023-03-30  453  }
0be8907359df4c6 Biju Das 2023-03-30  454  
0be8907359df4c6 Biju Das 2023-03-30  455  static void rz_mtu3_terminate_counter(struct counter_device *counter, int id)
0be8907359df4c6 Biju Das 2023-03-30  456  {
0be8907359df4c6 Biju Das 2023-03-30  457  	struct rz_mtu3_channel *const ch = rz_mtu3_get_ch(counter, id);
0be8907359df4c6 Biju Das 2023-03-30  458  	struct rz_mtu3_channel *const ch1 = rz_mtu3_get_ch(counter, 0);
0be8907359df4c6 Biju Das 2023-03-30  459  	struct rz_mtu3_channel *const ch2 = rz_mtu3_get_ch(counter, 1);
0be8907359df4c6 Biju Das 2023-03-30  460  
0be8907359df4c6 Biju Das 2023-03-30  461  	if (id == RZ_MTU3_32_BIT_CH) {
0be8907359df4c6 Biju Das 2023-03-30  462  		rz_mtu3_release_channel(ch2);
0be8907359df4c6 Biju Das 2023-03-30  463  		rz_mtu3_release_channel(ch1);
0be8907359df4c6 Biju Das 2023-03-30 @464  		rz_mtu3_disable(ch2);
0be8907359df4c6 Biju Das 2023-03-30  465  		rz_mtu3_disable(ch1);
0be8907359df4c6 Biju Das 2023-03-30  466  	} else {
0be8907359df4c6 Biju Das 2023-03-30  467  		rz_mtu3_release_channel(ch);
0be8907359df4c6 Biju Das 2023-03-30 @468  		rz_mtu3_disable(ch);
0be8907359df4c6 Biju Das 2023-03-30  469  	}
0be8907359df4c6 Biju Das 2023-03-30  470  }
0be8907359df4c6 Biju Das 2023-03-30  471  
0be8907359df4c6 Biju Das 2023-03-30  472  static int rz_mtu3_count_enable_read(struct counter_device *counter,
0be8907359df4c6 Biju Das 2023-03-30  473  				     struct counter_count *count, u8 *enable)
0be8907359df4c6 Biju Das 2023-03-30  474  {
0be8907359df4c6 Biju Das 2023-03-30  475  	struct rz_mtu3_channel *const ch = rz_mtu3_get_ch(counter, count->id);
0be8907359df4c6 Biju Das 2023-03-30  476  	struct rz_mtu3_channel *const ch1 = rz_mtu3_get_ch(counter, 0);
0be8907359df4c6 Biju Das 2023-03-30  477  	struct rz_mtu3_channel *const ch2 = rz_mtu3_get_ch(counter, 1);
0be8907359df4c6 Biju Das 2023-03-30  478  	struct rz_mtu3_cnt *const priv = counter_priv(counter);
0be8907359df4c6 Biju Das 2023-03-30  479  	int ret;
0be8907359df4c6 Biju Das 2023-03-30  480  
0be8907359df4c6 Biju Das 2023-03-30  481  	ret = rz_mtu3_lock_if_count_is_enabled(ch, priv, count->id);
0be8907359df4c6 Biju Das 2023-03-30  482  	if (ret)
0be8907359df4c6 Biju Das 2023-03-30  483  		return ret;
0be8907359df4c6 Biju Das 2023-03-30  484  
0be8907359df4c6 Biju Das 2023-03-30  485  	if (count->id == RZ_MTU3_32_BIT_CH)
0be8907359df4c6 Biju Das 2023-03-30 @486  		*enable = rz_mtu3_is_enabled(ch1) && rz_mtu3_is_enabled(ch2);
0be8907359df4c6 Biju Das 2023-03-30  487  	else
0be8907359df4c6 Biju Das 2023-03-30 @488  		*enable = rz_mtu3_is_enabled(ch);
0be8907359df4c6 Biju Das 2023-03-30  489  
0be8907359df4c6 Biju Das 2023-03-30  490  	mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  491  
0be8907359df4c6 Biju Das 2023-03-30  492  	return 0;
0be8907359df4c6 Biju Das 2023-03-30  493  }
0be8907359df4c6 Biju Das 2023-03-30  494  
0be8907359df4c6 Biju Das 2023-03-30  495  static int rz_mtu3_count_enable_write(struct counter_device *counter,
0be8907359df4c6 Biju Das 2023-03-30  496  				      struct counter_count *count, u8 enable)
0be8907359df4c6 Biju Das 2023-03-30  497  {
0be8907359df4c6 Biju Das 2023-03-30  498  	struct rz_mtu3_channel *const ch = rz_mtu3_get_ch(counter, count->id);
0be8907359df4c6 Biju Das 2023-03-30  499  	struct rz_mtu3_cnt *const priv = counter_priv(counter);
0be8907359df4c6 Biju Das 2023-03-30  500  	int ret = 0;
0be8907359df4c6 Biju Das 2023-03-30  501  
0be8907359df4c6 Biju Das 2023-03-30  502  	if (enable) {
0be8907359df4c6 Biju Das 2023-03-30  503  		pm_runtime_get_sync(ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  504  		mutex_lock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  505  		ret = rz_mtu3_initialize_counter(counter, count->id);
0be8907359df4c6 Biju Das 2023-03-30  506  		if (ret == 0)
0be8907359df4c6 Biju Das 2023-03-30  507  			priv->count_is_enabled[count->id] = true;
0be8907359df4c6 Biju Das 2023-03-30  508  		mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  509  	} else {
0be8907359df4c6 Biju Das 2023-03-30  510  		mutex_lock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  511  		rz_mtu3_terminate_counter(counter, count->id);
0be8907359df4c6 Biju Das 2023-03-30  512  		priv->count_is_enabled[count->id] = false;
0be8907359df4c6 Biju Das 2023-03-30  513  		mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  514  		pm_runtime_put(ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  515  	}
0be8907359df4c6 Biju Das 2023-03-30  516  
0be8907359df4c6 Biju Das 2023-03-30  517  	return ret;
0be8907359df4c6 Biju Das 2023-03-30  518  }
0be8907359df4c6 Biju Das 2023-03-30  519  
0be8907359df4c6 Biju Das 2023-03-30  520  static int rz_mtu3_lock_if_ch0_is_enabled(struct rz_mtu3_cnt *const priv)
0be8907359df4c6 Biju Das 2023-03-30  521  {
0be8907359df4c6 Biju Das 2023-03-30  522  	mutex_lock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  523  	if (priv->ch->is_busy && !(priv->count_is_enabled[RZ_MTU3_16_BIT_MTU1_CH] ||
0be8907359df4c6 Biju Das 2023-03-30  524  				   priv->count_is_enabled[RZ_MTU3_32_BIT_CH])) {
0be8907359df4c6 Biju Das 2023-03-30  525  		mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  526  		return -EINVAL;
0be8907359df4c6 Biju Das 2023-03-30  527  	}
0be8907359df4c6 Biju Das 2023-03-30  528  
0be8907359df4c6 Biju Das 2023-03-30  529  	return 0;
0be8907359df4c6 Biju Das 2023-03-30  530  }
0be8907359df4c6 Biju Das 2023-03-30  531  
0be8907359df4c6 Biju Das 2023-03-30  532  static int rz_mtu3_cascade_counts_enable_get(struct counter_device *counter,
0be8907359df4c6 Biju Das 2023-03-30  533  					     u8 *cascade_enable)
0be8907359df4c6 Biju Das 2023-03-30  534  {
0be8907359df4c6 Biju Das 2023-03-30  535  	struct rz_mtu3_cnt *const priv = counter_priv(counter);
0be8907359df4c6 Biju Das 2023-03-30  536  	unsigned long tmdr;
0be8907359df4c6 Biju Das 2023-03-30  537  	int ret;
0be8907359df4c6 Biju Das 2023-03-30  538  
0be8907359df4c6 Biju Das 2023-03-30  539  	ret = rz_mtu3_lock_if_ch0_is_enabled(priv);
0be8907359df4c6 Biju Das 2023-03-30  540  	if (ret)
0be8907359df4c6 Biju Das 2023-03-30  541  		return ret;
0be8907359df4c6 Biju Das 2023-03-30  542  
0be8907359df4c6 Biju Das 2023-03-30  543  	pm_runtime_get_sync(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  544  	tmdr = rz_mtu3_shared_reg_read(priv->ch, RZ_MTU3_TMDR3);
0be8907359df4c6 Biju Das 2023-03-30  545  	pm_runtime_put(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  546  	*cascade_enable = test_bit(RZ_MTU3_TMDR3_LWA, &tmdr);
0be8907359df4c6 Biju Das 2023-03-30  547  	mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  548  
0be8907359df4c6 Biju Das 2023-03-30  549  	return 0;
0be8907359df4c6 Biju Das 2023-03-30  550  }
0be8907359df4c6 Biju Das 2023-03-30  551  
0be8907359df4c6 Biju Das 2023-03-30  552  static int rz_mtu3_cascade_counts_enable_set(struct counter_device *counter,
0be8907359df4c6 Biju Das 2023-03-30  553  					     u8 cascade_enable)
0be8907359df4c6 Biju Das 2023-03-30  554  {
0be8907359df4c6 Biju Das 2023-03-30  555  	struct rz_mtu3_cnt *const priv = counter_priv(counter);
0be8907359df4c6 Biju Das 2023-03-30  556  	int ret;
0be8907359df4c6 Biju Das 2023-03-30  557  
0be8907359df4c6 Biju Das 2023-03-30  558  	ret = rz_mtu3_lock_if_ch0_is_enabled(priv);
0be8907359df4c6 Biju Das 2023-03-30  559  	if (ret)
0be8907359df4c6 Biju Das 2023-03-30  560  		return ret;
0be8907359df4c6 Biju Das 2023-03-30  561  
0be8907359df4c6 Biju Das 2023-03-30  562  	pm_runtime_get_sync(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  563  	rz_mtu3_shared_reg_update_bit(priv->ch, RZ_MTU3_TMDR3,
0be8907359df4c6 Biju Das 2023-03-30  564  				      RZ_MTU3_TMDR3_LWA, cascade_enable);
0be8907359df4c6 Biju Das 2023-03-30  565  	pm_runtime_put(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  566  	mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  567  
0be8907359df4c6 Biju Das 2023-03-30  568  	return 0;
0be8907359df4c6 Biju Das 2023-03-30  569  }
0be8907359df4c6 Biju Das 2023-03-30  570  
0be8907359df4c6 Biju Das 2023-03-30  571  static int rz_mtu3_ext_input_phase_clock_select_get(struct counter_device *counter,
0be8907359df4c6 Biju Das 2023-03-30  572  						    u32 *ext_input_phase_clock_select)
0be8907359df4c6 Biju Das 2023-03-30  573  {
0be8907359df4c6 Biju Das 2023-03-30  574  	struct rz_mtu3_cnt *const priv = counter_priv(counter);
0be8907359df4c6 Biju Das 2023-03-30  575  	unsigned long tmdr;
0be8907359df4c6 Biju Das 2023-03-30  576  	int ret;
0be8907359df4c6 Biju Das 2023-03-30  577  
0be8907359df4c6 Biju Das 2023-03-30  578  	ret = rz_mtu3_lock_if_ch0_is_enabled(priv);
0be8907359df4c6 Biju Das 2023-03-30  579  	if (ret)
0be8907359df4c6 Biju Das 2023-03-30  580  		return ret;
0be8907359df4c6 Biju Das 2023-03-30  581  
0be8907359df4c6 Biju Das 2023-03-30  582  	pm_runtime_get_sync(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30 @583  	tmdr = rz_mtu3_shared_reg_read(priv->ch, RZ_MTU3_TMDR3);
0be8907359df4c6 Biju Das 2023-03-30  584  	pm_runtime_put(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  585  	*ext_input_phase_clock_select = test_bit(RZ_MTU3_TMDR3_PHCKSEL, &tmdr);
0be8907359df4c6 Biju Das 2023-03-30  586  	mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  587  
0be8907359df4c6 Biju Das 2023-03-30  588  	return 0;
0be8907359df4c6 Biju Das 2023-03-30  589  }
0be8907359df4c6 Biju Das 2023-03-30  590  
0be8907359df4c6 Biju Das 2023-03-30  591  static int rz_mtu3_ext_input_phase_clock_select_set(struct counter_device *counter,
0be8907359df4c6 Biju Das 2023-03-30  592  						    u32 ext_input_phase_clock_select)
0be8907359df4c6 Biju Das 2023-03-30  593  {
0be8907359df4c6 Biju Das 2023-03-30  594  	struct rz_mtu3_cnt *const priv = counter_priv(counter);
0be8907359df4c6 Biju Das 2023-03-30  595  	int ret;
0be8907359df4c6 Biju Das 2023-03-30  596  
0be8907359df4c6 Biju Das 2023-03-30  597  	ret = rz_mtu3_lock_if_ch0_is_enabled(priv);
0be8907359df4c6 Biju Das 2023-03-30  598  	if (ret)
0be8907359df4c6 Biju Das 2023-03-30  599  		return ret;
0be8907359df4c6 Biju Das 2023-03-30  600  
0be8907359df4c6 Biju Das 2023-03-30  601  	pm_runtime_get_sync(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30 @602  	rz_mtu3_shared_reg_update_bit(priv->ch, RZ_MTU3_TMDR3,
0be8907359df4c6 Biju Das 2023-03-30  603  				      RZ_MTU3_TMDR3_PHCKSEL,
0be8907359df4c6 Biju Das 2023-03-30  604  				      ext_input_phase_clock_select);
0be8907359df4c6 Biju Das 2023-03-30  605  	pm_runtime_put(priv->ch->dev);
0be8907359df4c6 Biju Das 2023-03-30  606  	mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  607  
0be8907359df4c6 Biju Das 2023-03-30  608  	return 0;
0be8907359df4c6 Biju Das 2023-03-30  609  }
0be8907359df4c6 Biju Das 2023-03-30  610  
0be8907359df4c6 Biju Das 2023-03-30  611  static struct counter_comp rz_mtu3_count_ext[] = {
0be8907359df4c6 Biju Das 2023-03-30  612  	COUNTER_COMP_DIRECTION(rz_mtu3_count_direction_read),
0be8907359df4c6 Biju Das 2023-03-30  613  	COUNTER_COMP_ENABLE(rz_mtu3_count_enable_read,
0be8907359df4c6 Biju Das 2023-03-30  614  			    rz_mtu3_count_enable_write),
0be8907359df4c6 Biju Das 2023-03-30  615  	COUNTER_COMP_CEILING(rz_mtu3_count_ceiling_read,
0be8907359df4c6 Biju Das 2023-03-30  616  			     rz_mtu3_count_ceiling_write),
0be8907359df4c6 Biju Das 2023-03-30  617  };
0be8907359df4c6 Biju Das 2023-03-30  618  
0be8907359df4c6 Biju Das 2023-03-30  619  static const enum counter_synapse_action rz_mtu3_synapse_actions[] = {
0be8907359df4c6 Biju Das 2023-03-30  620  	COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
0be8907359df4c6 Biju Das 2023-03-30  621  	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
0be8907359df4c6 Biju Das 2023-03-30  622  	COUNTER_SYNAPSE_ACTION_NONE,
0be8907359df4c6 Biju Das 2023-03-30  623  };
0be8907359df4c6 Biju Das 2023-03-30  624  
0be8907359df4c6 Biju Das 2023-03-30  625  static int rz_mtu3_action_read(struct counter_device *counter,
0be8907359df4c6 Biju Das 2023-03-30  626  			       struct counter_count *count,
0be8907359df4c6 Biju Das 2023-03-30  627  			       struct counter_synapse *synapse,
0be8907359df4c6 Biju Das 2023-03-30  628  			       enum counter_synapse_action *action)
0be8907359df4c6 Biju Das 2023-03-30  629  {
0be8907359df4c6 Biju Das 2023-03-30  630  	const bool is_signal_ab = (synapse->signal->id == SIGNAL_A_ID) ||
0be8907359df4c6 Biju Das 2023-03-30  631  				  (synapse->signal->id == SIGNAL_B_ID);
0be8907359df4c6 Biju Das 2023-03-30  632  	struct rz_mtu3_channel *const ch = rz_mtu3_get_ch(counter, count->id);
0be8907359df4c6 Biju Das 2023-03-30  633  	struct rz_mtu3_cnt *const priv = counter_priv(counter);
0be8907359df4c6 Biju Das 2023-03-30  634  	enum counter_function function;
0be8907359df4c6 Biju Das 2023-03-30  635  	bool mtclkc_mtclkd;
0be8907359df4c6 Biju Das 2023-03-30  636  	unsigned long tmdr;
0be8907359df4c6 Biju Das 2023-03-30  637  	int ret;
0be8907359df4c6 Biju Das 2023-03-30  638  
0be8907359df4c6 Biju Das 2023-03-30  639  	ret = rz_mtu3_lock_if_count_is_enabled(ch, priv, count->id);
0be8907359df4c6 Biju Das 2023-03-30  640  	if (ret)
0be8907359df4c6 Biju Das 2023-03-30  641  		return ret;
0be8907359df4c6 Biju Das 2023-03-30  642  
0be8907359df4c6 Biju Das 2023-03-30  643  	ret = rz_mtu3_count_function_read_helper(ch, priv, &function);
0be8907359df4c6 Biju Das 2023-03-30  644  	if (ret) {
0be8907359df4c6 Biju Das 2023-03-30  645  		mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  646  		return ret;
0be8907359df4c6 Biju Das 2023-03-30  647  	}
0be8907359df4c6 Biju Das 2023-03-30  648  
0be8907359df4c6 Biju Das 2023-03-30  649  	/* Default action mode */
0be8907359df4c6 Biju Das 2023-03-30  650  	*action = COUNTER_SYNAPSE_ACTION_NONE;
0be8907359df4c6 Biju Das 2023-03-30  651  
0be8907359df4c6 Biju Das 2023-03-30  652  	if (count->id != RZ_MTU3_16_BIT_MTU1_CH) {
0be8907359df4c6 Biju Das 2023-03-30 @653  		tmdr = rz_mtu3_shared_reg_read(priv->ch, RZ_MTU3_TMDR3);
0be8907359df4c6 Biju Das 2023-03-30  654  		mtclkc_mtclkd = test_bit(RZ_MTU3_TMDR3_PHCKSEL, &tmdr);
0be8907359df4c6 Biju Das 2023-03-30  655  		if ((mtclkc_mtclkd && is_signal_ab) ||
0be8907359df4c6 Biju Das 2023-03-30  656  		    (!mtclkc_mtclkd && !is_signal_ab)) {
0be8907359df4c6 Biju Das 2023-03-30  657  			mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  658  			return 0;
0be8907359df4c6 Biju Das 2023-03-30  659  		}
0be8907359df4c6 Biju Das 2023-03-30  660  	}
0be8907359df4c6 Biju Das 2023-03-30  661  
0be8907359df4c6 Biju Das 2023-03-30  662  	switch (function) {
0be8907359df4c6 Biju Das 2023-03-30  663  	case COUNTER_FUNCTION_PULSE_DIRECTION:
0be8907359df4c6 Biju Das 2023-03-30  664  		/*
0be8907359df4c6 Biju Das 2023-03-30  665  		 * Rising edges on signal A (signal C) updates the respective
0be8907359df4c6 Biju Das 2023-03-30  666  		 * count. The input level of signal B (signal D) determines
0be8907359df4c6 Biju Das 2023-03-30  667  		 * direction.
0be8907359df4c6 Biju Das 2023-03-30  668  		 */
0be8907359df4c6 Biju Das 2023-03-30  669  		if (synapse->signal->id == SIGNAL_A_ID ||
0be8907359df4c6 Biju Das 2023-03-30  670  		    synapse->signal->id == SIGNAL_C_ID)
0be8907359df4c6 Biju Das 2023-03-30  671  			*action = COUNTER_SYNAPSE_ACTION_RISING_EDGE;
0be8907359df4c6 Biju Das 2023-03-30  672  		break;
0be8907359df4c6 Biju Das 2023-03-30  673  	case COUNTER_FUNCTION_QUADRATURE_X2_B:
0be8907359df4c6 Biju Das 2023-03-30  674  		/*
0be8907359df4c6 Biju Das 2023-03-30  675  		 * Any state transition on quadrature pair signal B (signal D)
0be8907359df4c6 Biju Das 2023-03-30  676  		 * updates the respective count.
0be8907359df4c6 Biju Das 2023-03-30  677  		 */
0be8907359df4c6 Biju Das 2023-03-30  678  		if (synapse->signal->id == SIGNAL_B_ID ||
0be8907359df4c6 Biju Das 2023-03-30  679  		    synapse->signal->id == SIGNAL_D_ID)
0be8907359df4c6 Biju Das 2023-03-30  680  			*action = COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
0be8907359df4c6 Biju Das 2023-03-30  681  		break;
0be8907359df4c6 Biju Das 2023-03-30  682  	case COUNTER_FUNCTION_QUADRATURE_X4:
0be8907359df4c6 Biju Das 2023-03-30  683  		/* counts up/down on both edges of A (C)  and B (D) signal */
0be8907359df4c6 Biju Das 2023-03-30  684  		*action = COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
0be8907359df4c6 Biju Das 2023-03-30  685  		break;
0be8907359df4c6 Biju Das 2023-03-30  686  	default:
0be8907359df4c6 Biju Das 2023-03-30  687  		/* should never reach this path */
0be8907359df4c6 Biju Das 2023-03-30  688  		mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  689  		return -EINVAL;
0be8907359df4c6 Biju Das 2023-03-30  690  	}
0be8907359df4c6 Biju Das 2023-03-30  691  
0be8907359df4c6 Biju Das 2023-03-30  692  	mutex_unlock(&priv->lock);
0be8907359df4c6 Biju Das 2023-03-30  693  
0be8907359df4c6 Biju Das 2023-03-30  694  	return 0;
0be8907359df4c6 Biju Das 2023-03-30  695  }
0be8907359df4c6 Biju Das 2023-03-30  696  

:::::: The code at line 602 was first introduced by commit
:::::: 0be8907359df4c62319f5cb2c6981ff0d9ebf35a counter: Add Renesas RZ/G2L MTU3a counter driver

:::::: TO: Biju Das <biju.das.jz@bp.renesas.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
