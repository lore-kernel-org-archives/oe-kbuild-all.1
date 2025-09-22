Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8537924167A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535472; cv=none; b=aliyX+CsBb5SvMOIYxgbtZneptBokR+tImJmcd+egU72UapQBsPCmu8jFFmUBTRu6YaIvNpmiBDSZLU76PCUxtHiDmweKiLU+16z0b+bdc4VxViuEFLPGZ1eoHKlmXtVH6+WthkBTmKvtb3/BfYDrzVrC8HETOsmHROIdFszTdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535472; c=relaxed/simple;
	bh=uzp84bkfgDGCDkyt1byr/PLrnRrEK8pPzGFXWccuSV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHRa2dzQmFgvEJYvx3p8dJuQzmCGUf+mAn96BzAdLWB5ePJwNfLAr4YWgfMo9ZeYRdLM1G+1UJEuS9nLEIkqhpCoTy0pYBcPXRrbWanDBGTYDTyyyAnEKC8ZqO1Awfx2LDWu5TtvHwFaeuw+6BEMD+j516CMcYyoazii0lhrMFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSX724gk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSX724gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758535469; x=1790071469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uzp84bkfgDGCDkyt1byr/PLrnRrEK8pPzGFXWccuSV4=;
  b=nSX724gk2WibuF9AK7e1HX3Fr7l5herbK3kJe/s2nPdDxAX0NIzb91YG
   hrBD1doPlvRpGOTtOYxiIJDjYGDRBbN3Q6VL8qN1/fveWuLMpsu9AAR9w
   PaL3dEeXNiBeUDRfxkwD/qZVY4v4CJiQCwOZEruTiJa0IJQmO6js4Qcw0
   kwFuaRYHEj9dYJu4YwZyF7D9/cslga224cBNohRKItF+jeCo9nXMVFtvk
   a/gftNDvq1jGEssY00ifMc+85VVhBKhTqNP1GUAB5Y7hiB5IkFdMB3Jzh
   gThiuohmUl5e2sneFRpRzo/D9JNwAQjkOeiD7tWV9oYo/78HRaNusFFX7
   w==;
X-CSE-ConnectionGUID: wgGjZaKYSBiIHHBFIqOPfw==
X-CSE-MsgGUID: RwqoIgICTgGRDTKkhCmF+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64614941"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="64614941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:04:28 -0700
X-CSE-ConnectionGUID: +bg5XQp4QE6xpCKkww4XOg==
X-CSE-MsgGUID: NrBB/oJYRza+Wma6NBSgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="181688930"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2025 03:04:27 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0dPC-0001Xp-15;
	Mon, 22 Sep 2025 10:04:23 +0000
Date: Mon, 22 Sep 2025 18:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/7] i2c: mux: add support for per channel bus
 frequency
Message-ID: <202509221717.tFrtT80c-lkp@intel.com>
References: <20250922-i2c-mux-v1-3-28c94a610930@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-i2c-mux-v1-3-28c94a610930@gmail.com>

Hi Marcus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 22f20375f5b71f30c0d6896583b93b6e4bba7279]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/i2c-core-add-callback-to-change-bus-frequency/20250922-142827
base:   22f20375f5b71f30c0d6896583b93b6e4bba7279
patch link:    https://lore.kernel.org/r/20250922-i2c-mux-v1-3-28c94a610930%40gmail.com
patch subject: [PATCH RFC 3/7] i2c: mux: add support for per channel bus frequency
config: i386-buildonly-randconfig-004-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221717.tFrtT80c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221717.tFrtT80c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221717.tFrtT80c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/i2c/i2c-mux.c:22:
   drivers/i2c/i2c-mux.c: In function 'i2c_mux_add_adapter':
>> drivers/i2c/i2c-mux.c:464:33: warning: too many arguments for format [-Wformat-extra-args]
     464 |                                 "channel (%u) is faster than parent (%u)\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/i2c/i2c-mux.c:463:25: note: in expansion of macro 'dev_err'
     463 |                         dev_err(muxc->dev,
         |                         ^~~~~~~


vim +464 drivers/i2c/i2c-mux.c

   336	
   337	int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
   338				u32 force_nr, u32 chan_id)
   339	{
   340		struct i2c_adapter *parent = muxc->parent;
   341		struct i2c_mux_priv *priv;
   342		char symlink_name[20];
   343		int ret;
   344	
   345		if (muxc->num_adapters >= muxc->max_adapters) {
   346			dev_err(muxc->dev, "No room for more i2c-mux adapters\n");
   347			return -EINVAL;
   348		}
   349	
   350		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
   351		if (!priv)
   352			return -ENOMEM;
   353	
   354		/* Set up private adapter data */
   355		priv->muxc = muxc;
   356		priv->chan_id = chan_id;
   357	
   358		/* Need to do algo dynamically because we don't know ahead
   359		 * of time what sort of physical adapter we'll be dealing with.
   360		 */
   361		if (parent->algo->master_xfer) {
   362			if (muxc->mux_locked)
   363				priv->algo.xfer = i2c_mux_master_xfer;
   364			else
   365				priv->algo.xfer = __i2c_mux_master_xfer;
   366		}
   367		if (parent->algo->master_xfer_atomic)
   368			priv->algo.xfer_atomic = priv->algo.master_xfer;
   369	
   370		if (parent->algo->smbus_xfer) {
   371			if (muxc->mux_locked)
   372				priv->algo.smbus_xfer = i2c_mux_smbus_xfer;
   373			else
   374				priv->algo.smbus_xfer = __i2c_mux_smbus_xfer;
   375		}
   376		if (parent->algo->smbus_xfer_atomic)
   377			priv->algo.smbus_xfer_atomic = priv->algo.smbus_xfer;
   378	
   379		priv->algo.functionality = i2c_mux_functionality;
   380	
   381		/* Now fill out new adapter structure */
   382		snprintf(priv->adap.name, sizeof(priv->adap.name),
   383			 "i2c-%d-mux (chan_id %d)", i2c_adapter_id(parent), chan_id);
   384		priv->adap.owner = THIS_MODULE;
   385		priv->adap.algo = &priv->algo;
   386		priv->adap.algo_data = priv;
   387		priv->adap.dev.parent = &parent->dev;
   388		priv->adap.retries = parent->retries;
   389		priv->adap.timeout = parent->timeout;
   390		priv->adap.quirks = parent->quirks;
   391		if (muxc->mux_locked)
   392			priv->adap.lock_ops = &i2c_mux_lock_ops;
   393		else
   394			priv->adap.lock_ops = &i2c_parent_lock_ops;
   395	
   396		/*
   397		 * Try to populate the mux adapter's of_node, expands to
   398		 * nothing if !CONFIG_OF.
   399		 */
   400		if (muxc->dev->of_node) {
   401			struct device_node *dev_node = muxc->dev->of_node;
   402			struct device_node *mux_node, *child = NULL;
   403			u32 reg;
   404	
   405			if (muxc->arbitrator)
   406				mux_node = of_get_child_by_name(dev_node, "i2c-arb");
   407			else if (muxc->gate)
   408				mux_node = of_get_child_by_name(dev_node, "i2c-gate");
   409			else
   410				mux_node = of_get_child_by_name(dev_node, "i2c-mux");
   411	
   412			if (mux_node) {
   413				/* A "reg" property indicates an old-style DT entry */
   414				if (!of_property_read_u32(mux_node, "reg", &reg)) {
   415					of_node_put(mux_node);
   416					mux_node = NULL;
   417				}
   418			}
   419	
   420			if (!mux_node)
   421				mux_node = of_node_get(dev_node);
   422			else if (muxc->arbitrator || muxc->gate)
   423				child = of_node_get(mux_node);
   424	
   425			if (!child) {
   426				for_each_child_of_node(mux_node, child) {
   427					ret = of_property_read_u32(child, "reg", &reg);
   428					if (ret)
   429						continue;
   430					if (chan_id == reg)
   431						break;
   432				}
   433			}
   434	
   435			of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
   436	
   437			/*
   438			 * Warn if the mux adapter does not disconnect channels or
   439			 * if a low-speed channel is seleced during idle.
   440			 */
   441			if (priv->adap.clock_hz < parent->clock_hz)
   442				if (muxc->idle_state != MUX_IDLE_DISCONNECT ||
   443				    muxc->idle_state == chan_id)
   444					dev_warn(muxc->dev,
   445						 "channel %u has improper idle state for this configuration\n",
   446						 chan_id);
   447	
   448			/*
   449			 * Warn if the mux adapter is not parent-locked as
   450			 * this may cause issues for some hardware topologies.
   451			 */
   452			if ((priv->adap.clock_hz < parent->clock_hz) && muxc->mux_locked)
   453				dev_warn(muxc->dev,
   454					 "channel %u is slower than parent on a non parent-locked mux\n",
   455					 chan_id);
   456	
   457			/* If the mux adapter has no clock-frequency property, inherit from parent */
   458			if (!priv->adap.clock_hz)
   459				priv->adap.clock_hz = parent->clock_hz;
   460	
   461			/* We don't support mux adapters faster than their parent */
   462			if (priv->adap.clock_hz > parent->clock_hz) {
   463				dev_err(muxc->dev,
 > 464					"channel (%u) is faster than parent (%u)\n",
   465					chan_id, priv->adap.clock_hz, parent->clock_hz);
   466	
   467				of_node_put(mux_node);
   468				goto err_free_priv;
   469			}
   470	
   471			priv->adap.dev.of_node = child;
   472			of_node_put(mux_node);
   473		}
   474	
   475		/*
   476		 * Associate the mux channel with an ACPI node.
   477		 */
   478		if (has_acpi_companion(muxc->dev))
   479			acpi_preset_companion(&priv->adap.dev,
   480					      ACPI_COMPANION(muxc->dev),
   481					      chan_id);
   482	
   483		if (force_nr) {
   484			priv->adap.nr = force_nr;
   485			ret = i2c_add_numbered_adapter(&priv->adap);
   486			if (ret < 0) {
   487				dev_err(&parent->dev,
   488					"failed to add mux-adapter %u as bus %u (error=%d)\n",
   489					chan_id, force_nr, ret);
   490				goto err_free_priv;
   491			}
   492		} else {
   493			ret = i2c_add_adapter(&priv->adap);
   494			if (ret < 0) {
   495				dev_err(&parent->dev,
   496					"failed to add mux-adapter %u (error=%d)\n",
   497					chan_id, ret);
   498				goto err_free_priv;
   499			}
   500		}
   501	
   502		WARN(sysfs_create_link(&priv->adap.dev.kobj, &muxc->dev->kobj,
   503				       "mux_device"),
   504		     "can't create symlink to mux device\n");
   505	
   506		snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_id);
   507		WARN(sysfs_create_link(&muxc->dev->kobj, &priv->adap.dev.kobj,
   508				       symlink_name),
   509		     "can't create symlink to channel %u\n", chan_id);
   510		dev_info(&parent->dev, "Added multiplexed i2c bus %d\n",
   511			 i2c_adapter_id(&priv->adap));
   512	
   513		muxc->adapter[muxc->num_adapters++] = &priv->adap;
   514		return 0;
   515	
   516	err_free_priv:
   517		kfree(priv);
   518		return ret;
   519	}
   520	EXPORT_SYMBOL_GPL(i2c_mux_add_adapter);
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
