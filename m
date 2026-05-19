Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D4E54B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209815; cv=none; b=Y5BimEGCpTOev/uzqnJI7CIFgDTYPSNf6nZAxSlJsiZSqalZVMksFp4z2CQqoeHe2xmQR+3H86nqNwD0NQkay8CFLsWoyU8Ebqfj55WfroMNqNfwjcggWpqmtj6WRVSeL+qQ+0GbBTXTtOceCDcHnfY7PjHUcdxewuaxGNhc24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209815; c=relaxed/simple;
	bh=erPbNfpL+tDKEOD3oSwKKnYxfZUujOY2V8g1+qWUi24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPYoW8F3fDgJGV1f3ENG7OdVh+Z6RDJu2SLJ0dn1dqLpB4wDBAV/1ounHPJ1jQ3W8HTAa9JXz4jcdshtMGWbYJcYUcjNm8egfu1tZwdUsOP5pOpP0llR7+cOiOJiOg3xs6YbkeR0IxG1qaaDKzlcp/y3Hfot2+PIY3PNWhwdGvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDZDUEjP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDZDUEjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779209812; x=1810745812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=erPbNfpL+tDKEOD3oSwKKnYxfZUujOY2V8g1+qWUi24=;
  b=UDZDUEjPymPMGoHJJoEfL64Eh/bjAd/776m4fmtNen1Va5Xo1ip6M/DJ
   dgAaRZJD1zG1xz0HhEyDC7Yv4DB0aQ40sQoNyJDzJDOQ2q3xZmkpGyhRR
   rl4Xzpdzfj8/lDJ6ZXsP5qS4BjtECAmu+xiQGaJJWann7wLwAsswJT8XE
   oqnvD6jUg/s9CV6Fwd/uTiJmxUkQFhefQEV7vzKmbEdhQsKMwpYx9qzHP
   D9jDl1AhYWpvSv4/8EO1eIoz64of3Nh9fa4GLpLOJ9DwJ3abP1JJj23fL
   oWLAp9M8rJ+1xjskZ/D7x/u5GJoOg8HM4xzI4mxSlcE6yFkSBgl7nal5C
   A==;
X-CSE-ConnectionGUID: M1hyjr4uRh6RYRjp/XLxHw==
X-CSE-MsgGUID: FY29bL5UQ+esKmgbM8YCRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91490945"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91490945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 09:56:51 -0700
X-CSE-ConnectionGUID: YrBKTXdJQq2ymDB7ND5Ubg==
X-CSE-MsgGUID: PMdgOFwcS+Syr2ageN3wJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239677416"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2026 09:56:48 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPNju-000000001Xt-1kvw;
	Tue, 19 May 2026 16:56:24 +0000
Date: Wed, 20 May 2026 00:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
	shumingf@realtek.com, derek.fang@realtek.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH v3] ASoC: rt722-sdca: Add a control to support CAE
 firmware update
Message-ID: <202605200045.T22EqJtF-lkp@intel.com>
References: <20260519054737.3457747-1-jack.yu@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519054737.3457747-1-jack.yu@realtek.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jack-yu-realtek-com/ASoC-rt722-sdca-Add-a-control-to-support-CAE-firmware-update/20260519-172233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260519054737.3457747-1-jack.yu%40realtek.com
patch subject: [PATCH v3] ASoC: rt722-sdca: Add a control to support CAE firmware update
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260520/202605200045.T22EqJtF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200045.T22EqJtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200045.T22EqJtF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt722-sdca.c: In function 'rt722_cae_load':
>> sound/soc/codecs/rt722-sdca.c:569:1: warning: the frame size of 1416 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     569 | }
         | ^


vim +569 sound/soc/codecs/rt722-sdca.c

   348	
   349	static int rt722_cae_load(struct rt722_sdca_priv *rt722)
   350	{
   351		struct device *dev = &rt722->slave->dev;
   352		static const char func_tag[] = "FUNC";
   353		static const char xu_tag[] = "XU";
   354		const char *dmi_vendor, *dmi_product, *dmi_sku;
   355		char vendor[128], product[128], sku[128];
   356		char *ptr_vendor, *ptr_product, *ptr_sku;
   357		char cae_filename[512];
   358		const struct firmware *cae_fw = NULL;
   359		unsigned int cae_st_spk, cae_st_hp, cae_st_mic;
   360		unsigned int func, value;
   361		unsigned int combined_val;
   362		unsigned int addr, size;
   363		unsigned int fw_offset;
   364		unsigned char mbq_high_val = 0;
   365		unsigned char *param_data;
   366		unsigned char *fw_data;
   367		char tag[5];
   368		int ret = 0, i;
   369		int retry = 50;
   370	
   371		dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
   372		dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
   373		dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
   374	
   375		if (dmi_vendor && dmi_product && dmi_sku) {
   376			strscpy(vendor, dmi_vendor);
   377			strscpy(product, dmi_product);
   378			strscpy(sku, dmi_sku);
   379			ptr_vendor = &vendor[0];
   380			ptr_product = &product[0];
   381			ptr_sku = &sku[0];
   382			ptr_vendor = strsep(&ptr_vendor, " ");
   383			ptr_product = strsep(&ptr_product, " ");
   384			ptr_sku = strsep(&ptr_sku, " ");
   385			dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
   386				vendor, product, sku);
   387	
   388			snprintf(cae_filename, sizeof(cae_filename),
   389				 "realtek/rt722/rt722_RAE_%s_%s_%s.dat", vendor, product, sku);
   390			dev_dbg(dev, "%s: try to load CAE file %s\n", __func__, cae_filename);
   391		} else {
   392			dev_warn(dev, "%s: No CAE file found!\n", __func__);
   393			return -EINVAL;
   394		}
   395	
   396		regmap_write(rt722->regmap, RT722_SPK_CAE_PARAM1, 0x5f);
   397		regmap_write(rt722->regmap, RT722_HP_CAE_PARAM39, 0x5f);
   398		regmap_write(rt722->regmap, RT722_MIC_CAE_PARAM39, 0x5f);
   399		usleep_range(50000, 60000);
   400	
   401		request_firmware(&cae_fw, cae_filename, dev);
   402		if (!cae_fw) {
   403			dev_err(dev, "%s: Failed to load CAE firmware\n", __func__);
   404			return -ENOENT;
   405		}
   406	
   407		regmap_read(rt722->regmap, RT722_SPK_CAE_PARAM38, &cae_st_spk);
   408		regmap_read(rt722->regmap, RT722_HP_CAE_PARAM68, &cae_st_hp);
   409		regmap_read(rt722->regmap, RT722_MIC_CAE_PARAM99, &cae_st_mic);
   410		cae_st_spk &= 0x80;
   411		cae_st_hp &= 0x80;
   412		cae_st_mic &= 0x80;
   413	
   414		dev_dbg(dev, "%s(%d) spk_crc:%x, hp_crc:%x, mic_crc:%x\n",
   415			__func__, __LINE__, cae_st_spk, cae_st_hp, cae_st_mic);
   416	
   417		if (cae_st_spk)
   418			rt722_sdca_index_update_bits(rt722, RT722_VENDOR_EQ_CAE,
   419				RT722_EQ_CTRL_SPK, 0x0008, 0x0008);
   420		else if (cae_st_hp)
   421			rt722_sdca_index_update_bits(rt722, RT722_VENDOR_EQ_CAE,
   422				RT722_EQ_CTRL_HP, 0x0008, 0x0008);
   423		else if (cae_st_mic)
   424			rt722_sdca_index_update_bits(rt722, RT722_VENDOR_EQ_CAE,
   425				RT722_EQ_CTRL_DMIC, 0x0008, 0x0008);
   426	
   427		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
   428				RT722_MISC_CTRL1, 0x8000, 0x8000);
   429	
   430		regmap_update_bits(rt722->regmap, RT722_SPK_CAE_PARAM34, 0x1, 0x0);
   431		regmap_update_bits(rt722->regmap, RT722_HP_CAE_PARAM64, 0x1, 0x0);
   432		regmap_update_bits(rt722->regmap, RT722_MIC_CAE_PARAM95, 0x1, 0x0);
   433	
   434		while (--retry) {
   435			regmap_read(rt722->regmap, RT722_SPK_CAE_PARAM35, &cae_st_spk);
   436			regmap_read(rt722->regmap, RT722_HP_CAE_PARAM65, &cae_st_hp);
   437			regmap_read(rt722->regmap, RT722_MIC_CAE_PARAM96, &cae_st_mic);
   438			dev_dbg(dev, "%s(%d) cae_st_spk:%x, cae_st_hp:%x, cae_st_mic:%x\n",
   439				__func__, __LINE__, cae_st_spk, cae_st_hp, cae_st_mic);
   440			if ((cae_st_spk & 0x40) && (cae_st_hp & 0x40) && (cae_st_mic & 0x40))
   441				break;
   442			usleep_range(1000, 1100);
   443		}
   444	
   445		if (!retry && !((cae_st_spk & 0x40) && (cae_st_hp & 0x40)
   446			&& (cae_st_mic & 0x40))) {
   447			dev_err(dev, "%s: CAE is not ready to be loaded.\n", __func__);
   448			ret = -ETIMEDOUT;
   449			goto out_release;
   450		}
   451	
   452		dev_dbg(dev, "%s, cae_fw size=0x%zx, start\n", __func__, cae_fw->size);
   453	
   454		rt722_sdca_index_write(rt722, RT722_VENDOR_EQ_CAE,
   455			RT722_EQ_CTRL_AMIC, 0x8000);
   456		rt722_sdca_index_write(rt722, RT722_VENDOR_EQ_CAE,
   457			RT722_EQ_CTRL_DMIC, 0x8004);
   458		rt722_sdca_index_write(rt722, RT722_VENDOR_EQ_CAE,
   459			RT722_EQ_CTRL_HP, 0x8074);
   460		rt722_sdca_index_write(rt722, RT722_VENDOR_EQ_CAE,
   461			RT722_EQ_CTRL_SPK, 0xa074);
   462	
   463		regcache_cache_bypass(rt722->regmap, true);
   464		for (fw_offset = 0; fw_offset < cae_fw->size;) {
   465	
   466			if (fw_offset + 12 > cae_fw->size) {
   467				dev_err(dev, "%s: Unexpected end of firmware\n", __func__);
   468				ret = -EINVAL;
   469				goto verify_abort;
   470			}
   471	
   472			fw_data = (unsigned char *)&cae_fw->data[fw_offset];
   473			memcpy(tag, fw_data, 4);
   474			tag[4] = '\0';
   475	
   476			if (strcmp(tag, xu_tag) == 0) {
   477				dev_dbg(dev, "%s: This is a XU tag", __func__);
   478				memcpy(&addr, (fw_data + 4), 4);
   479				memcpy(&size, (fw_data + 8), 4);
   480	
   481				if (fw_offset + 12 + size > cae_fw->size) {
   482					dev_err(dev, "%s: Firmware payload out of bounds\n", __func__);
   483					ret = -EINVAL;
   484					goto verify_abort;
   485				}
   486	
   487				param_data = (unsigned char *)(fw_data + 12);
   488	
   489				dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
   490	
   491				if ((addr <= 0x05302300 && addr >= 0x05300000) ||
   492					(addr <= 0x020020b4 && addr >= 0x020000b1)) {
   493					if (addr & BIT(13)) {
   494						mbq_high_val = param_data[0];
   495						dev_dbg(dev, "MBQ: High Byte 0x%02x\n", mbq_high_val);
   496						fw_offset += (size + 12);
   497	
   498						continue;
   499					} else {
   500						regcache_cache_bypass(rt722->regmap, false);
   501						combined_val = (mbq_high_val << 8) | param_data[0];
   502						if (addr == 0x20000b1 || addr == 0x20000b4)
   503							combined_val |= (0x2 << 8);
   504						ret = regmap_write(rt722->regmap, addr, combined_val);
   505						if (ret) {
   506							dev_err(dev,
   507								"MBQ fail: addr=0x%x ret=%d\n", addr, ret);
   508							regcache_cache_bypass(rt722->regmap, true);
   509							goto verify_abort;
   510						}
   511	
   512						dev_dbg(dev, "MBQ-reg=0x%x, value=0x%x\n",
   513							addr, combined_val);
   514	
   515						fw_offset += (size + 12);
   516						regcache_cache_bypass(rt722->regmap, true);
   517						continue;
   518					}
   519				}
   520	
   521				for (i = 0; i < size; i++) {
   522					ret = regmap_write(rt722->regmap, addr + i, param_data[i]);
   523					if (ret) {
   524						dev_err(dev,
   525							"CAE write fail: addr=0x%x ret=%d\n",
   526							addr + i, ret);
   527						goto verify_abort;
   528					}
   529				}
   530				fw_offset += (size + 12);
   531			} else if (strcmp(tag, func_tag) == 0) {
   532				dev_dbg(dev, "%s: This is a FUNC tag", __func__);
   533	
   534				memcpy(&func, (fw_data + 4), 4);
   535				memcpy(&value, (fw_data + 8), 4);
   536				dev_dbg(dev, "%s: func=0x%x, value=0x%x\n",
   537					__func__, func, value);
   538	
   539				if (func == 1)
   540					msleep(value);
   541	
   542				fw_offset += 12;
   543			} else {
   544				dev_err(dev, "%s: No XU/FUNC tag at fw_offset=0x%x\n",
   545					__func__, fw_offset);
   546				ret = -EINVAL;
   547				goto verify_abort;
   548			}
   549		}
   550	
   551		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
   552				RT722_MISC_CTRL1, 0x8000, 0x0000);
   553		regcache_cache_bypass(rt722->regmap, false);
   554		rt722->cae_update_done = 1;
   555		dev_dbg(dev, "%s: CAE FW update done.\n", __func__);
   556		release_firmware(cae_fw);
   557		return 0;
   558	
   559	verify_abort:
   560		regcache_cache_bypass(rt722->regmap, false);
   561		if (!ret)
   562			ret = -EIO;
   563	out_release:
   564		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
   565				RT722_MISC_CTRL1, 0x8000, 0x0000);
   566		release_firmware(cae_fw);
   567		dev_err(dev, "%s: CAE FW update aborted (ret=%d).\n", __func__, ret);
   568		return ret;
 > 569	}
   570	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
