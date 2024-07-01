Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B28BE7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jul 2024 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719847861; cv=none; b=mYDZCvF/+w1pVD6ot0Q4C5LXlM3t8BEp5yJqOsATCHeEWqMhLyF6xSMa+t204uQOx3xpNe8SiwX2AIfcl7Ys1uSLAUgi2eFuqMr9qshekHcd8Yp+kSi0qLVeE3ZBB4sESdwmAB67N/6nppPwtkFccq9lYj6FxjUDIXayEc5HuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719847861; c=relaxed/simple;
	bh=sGliP2PiutYk5UYF6bYNEwM49QCLkeArGIK/hFCEjPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRowJRS7TZbiuR64cla68p+5Rth+mNvdOTcKHwqVqDp3OE6aSDGvEKrPMNcIkiPO8PKABbe68ZlMg/t56DsbiPZqDEJnuwRlSn2ClQag+xd7maRpJ63iYX4cTzb8I8O6agq1SwIfkQib9txfR7swI2KVYZIP9wdoriLR88YaLTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmbgrW1k; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmbgrW1k"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d6301e7279so2051699b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Jul 2024 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719847859; x=1720452659; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SJQGMb1lhp3kAJHh+M64U8L5B7nXxJSfmzMAMcWq94=;
        b=jmbgrW1kLH2VhZDhMmWjQFbClCzeAQ6qAS+b+e8+pE8p8ZmmJifPi7EHnHFZxPq1aa
         G+0BoVEYOlNKVYNDhnpnBvy+cuHIRgd6sAqD7AWxR8GeJ3EgjLAE7ywIO3eHc8SDGc3p
         67RvO7SgLbylamiI2AkenW/uf3HSSvMlFKxDmd1f1lsMwHBd1QBUFZW0JFmjV8fLI+oL
         c6WDKct/xi3q2LUpQKjHLF6Q0R/XB+ykXMYzIAreFbSZDOO492jzynMbwKN1YctqRwXD
         E4p6K4Zpwkze02oqqtLUdLJ528rr9U24ID1LrBsyGtKKwJf5E8Bb8ytgLbw7cKsVP8yw
         mXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719847859; x=1720452659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SJQGMb1lhp3kAJHh+M64U8L5B7nXxJSfmzMAMcWq94=;
        b=si1KFt3u4moYCXKEyLXYqyXmaCnHoHuBx/Bp7tHUP7QBZInrSr03RSQKLxjIGFh7Bt
         +XJMtVlQcUtUKfm6YgoTGDhnXN/Qq+g471i1IesYZQc0OmyMc5rfQKsWlMhuXkHs9V2V
         bdjSXDEumPIZZrCQHl3VPw8BE+YBXKvvjBOMs2jD7T8mN/ydfvsS5yCpGF8QsR9+lTUL
         jtf0TVk7dQ3RGjDPtq0K8+gx2jclQZ8wWRyVgziy32jo35J0kTreX5oeTvtd6vVEO7RK
         OtMjNuYD0dHmvbrWnrelLg0mJjvwiOmoFJJXYvTjNSGb6VIabrK3lESGDH+dYouEXZ/C
         pauA==
X-Forwarded-Encrypted: i=1; AJvYcCWo1nghTp0B3Zf/yzwPhOTbL3/J+6ttbK2frknq1y+Hfjqn3tS9FSVzU8C4FigsITHwnwbkesfWuwd0oev1H93lIGlTRgt1GvlXDcvHqA==
X-Gm-Message-State: AOJu0YzUgJiAua5sSOobHHNfpkrr4mx6p44DbUtvp8A/qEkXeqtS34gn
	yEBsAKwGuidhcSfXEGWVLl72/uBkd57orE+AWReUcAKieYRgnHas2dLn3qfyUhA=
X-Google-Smtp-Source: AGHT+IFAJ3sCecZ4Bn8KHUEDezD9VITNLcyFj8w+fAhxbQ+50cybl0b+iSfkW5/nBtkUFNfnYnspEg==
X-Received: by 2002:a05:6808:1789:b0:3d5:670f:baa5 with SMTP id 5614622812f47-3d6b4de2d0amr8859832b6e.44.1719847859102;
        Mon, 01 Jul 2024 08:30:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62f9b8d32sm1398227b6e.10.2024.07.01.08.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:30:58 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:30:57 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dumitru Ceclan <dumitru.ceclan@analog.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 15/61] drivers/iio/adc/ad7173.c:1254
 ad7173_fw_parse_channel_config() error: uninitialized symbol
 'is_current_chan'.
Message-ID: <fc29cd12-378f-420f-b076-92a1833907e5@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   e2afe21f9b0bfa3f188cd5a60940b07a85d65e9a
commit: cfc4c76b75ab68a95976e0db725baff385c4136d [15/61] iio: adc: ad7173: Add support for AD411x devices
config: x86_64-randconfig-161-20240623 (https://download.01.org/0day-ci/archive/20240623/202406232046.DKfBJq6o-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406232046.DKfBJq6o-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7173.c:1254 ad7173_fw_parse_channel_config() error: uninitialized symbol 'is_current_chan'.

vim +/is_current_chan +1254 drivers/iio/adc/ad7173.c

76a1e6a4280211 Dumitru Ceclan   2024-02-28  1184  static int ad7173_fw_parse_channel_config(struct iio_dev *indio_dev)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1185  {
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1186  	struct ad7173_channel *chans_st_arr, *chan_st_priv;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1187  	struct ad7173_state *st = iio_priv(indio_dev);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1188  	struct device *dev = indio_dev->dev.parent;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1189  	struct iio_chan_spec *chan_arr, *chan;
87477bf7433028 Dumitru Ceclan   2024-06-07  1190  	unsigned int ain[AD7173_NO_AINS_PER_CHANNEL], chan_index = 0;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1191  	int ref_sel, ret, is_current_chan, num_channels;
51d5a38b21113a Dumitru Ceclan   2024-06-07  1192  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1193  	num_channels = device_get_child_node_count(dev);
51d5a38b21113a Dumitru Ceclan   2024-06-07  1194  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1195  	if (st->info->has_temp)
51d5a38b21113a Dumitru Ceclan   2024-06-07  1196  		num_channels++;
51d5a38b21113a Dumitru Ceclan   2024-06-07  1197  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1198  	if (num_channels == 0)
51d5a38b21113a Dumitru Ceclan   2024-06-07  1199  		return dev_err_probe(dev, -ENODATA, "No channels specified\n");
51d5a38b21113a Dumitru Ceclan   2024-06-07  1200  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1201  	if (num_channels > st->info->num_channels)
51d5a38b21113a Dumitru Ceclan   2024-06-07  1202  		return dev_err_probe(dev, -EINVAL,
51d5a38b21113a Dumitru Ceclan   2024-06-07  1203  			"Too many channels specified. Maximum is %d, not including temperature channel if supported.\n",
51d5a38b21113a Dumitru Ceclan   2024-06-07  1204  			st->info->num_channels);
51d5a38b21113a Dumitru Ceclan   2024-06-07  1205  
51d5a38b21113a Dumitru Ceclan   2024-06-07  1206  	indio_dev->num_channels = num_channels;
51d5a38b21113a Dumitru Ceclan   2024-06-07  1207  	st->num_channels = num_channels;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1208  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1209  	chan_arr = devm_kcalloc(dev, sizeof(*indio_dev->channels),
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1210  				st->num_channels, GFP_KERNEL);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1211  	if (!chan_arr)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1212  		return -ENOMEM;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1213  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1214  	chans_st_arr = devm_kcalloc(dev, st->num_channels, sizeof(*st->channels),
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1215  				    GFP_KERNEL);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1216  	if (!chans_st_arr)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1217  		return -ENOMEM;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1218  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1219  	indio_dev->channels = chan_arr;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1220  	st->channels = chans_st_arr;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1221  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1222  	if (st->info->has_temp) {
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1223  		chan_arr[chan_index] = ad7173_temp_iio_channel_template;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1224  		chan_st_priv = &chans_st_arr[chan_index];
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1225  		chan_st_priv->ain =
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1226  			AD7173_CH_ADDRESS(chan_arr[chan_index].channel,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1227  					  chan_arr[chan_index].channel2);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1228  		chan_st_priv->cfg.bipolar = false;
ab6f0ab1781371 Dumitru Ceclan   2024-05-21  1229  		chan_st_priv->cfg.input_buf = st->info->has_input_buf;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1230  		chan_st_priv->cfg.ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1231  		st->adc_mode |= AD7173_ADC_MODE_REF_EN;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1232  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1233  		chan_index++;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1234  	}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1235  
cf84f1e0a8fd23 Jonathan Cameron 2024-03-30  1236  	device_for_each_child_node_scoped(dev, child) {
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1237  		chan = &chan_arr[chan_index];
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1238  		*chan = ad7173_channel_template;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1239  		chan_st_priv = &chans_st_arr[chan_index];
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1240  		ret = fwnode_property_read_u32_array(child, "diff-channels",
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1241  						     ain, ARRAY_SIZE(ain));
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1242  		if (ret) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1243  			ret = fwnode_property_read_u32(child, "single-channel",
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1244  						       ain);
cf84f1e0a8fd23 Jonathan Cameron 2024-03-30  1245  			if (ret)
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1246  				return dev_err_probe(dev, ret,
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1247  					"Channel must define one of diff-channels or single-channel.\n");
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1248  
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1249  			is_current_chan = fwnode_property_read_bool(child, "adi,current-channel");
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1250  		} else {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1251  			chan->differential = true;

is_current_chan not initialized on this path.

cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1252  		}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1253  
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07 @1254  		if (is_current_chan) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1255  			ret = ad4111_validate_current_ain(st, ain);
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1256  			if (ret)
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1257  				return ret;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1258  		} else {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1259  			if (!chan->differential) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1260  				ret = fwnode_property_read_u32(child,
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1261  					"common-mode-channel", ain + 1);
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1262  				if (ret)
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1263  					return dev_err_probe(dev, ret,
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1264  						"common-mode-channel must be defined for single-ended channels.\n");
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1265  			}
87477bf7433028 Dumitru Ceclan   2024-06-07  1266  			ret = ad7173_validate_voltage_ain_inputs(st, ain[0], ain[1]);
87477bf7433028 Dumitru Ceclan   2024-06-07  1267  			if (ret)
87477bf7433028 Dumitru Ceclan   2024-06-07  1268  				return ret;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1269  		}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1270  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1271  		ret = fwnode_property_match_property_string(child,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1272  							    "adi,reference-select",
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1273  							    ad7173_ref_sel_str,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1274  							    ARRAY_SIZE(ad7173_ref_sel_str));
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1275  		if (ret < 0)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1276  			ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1277  		else
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1278  			ref_sel = ret;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1279  
87477bf7433028 Dumitru Ceclan   2024-06-07  1280  		ret = ad7173_validate_reference(st, ref_sel);
87477bf7433028 Dumitru Ceclan   2024-06-07  1281  		if (ret)
87477bf7433028 Dumitru Ceclan   2024-06-07  1282  			return ret;
cf84f1e0a8fd23 Jonathan Cameron 2024-03-30  1283  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1284  		if (ref_sel == AD7173_SETUP_REF_SEL_INT_REF)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1285  			st->adc_mode |= AD7173_ADC_MODE_REF_EN;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1286  		chan_st_priv->cfg.ref_sel = ref_sel;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1287  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1288  		chan->address = chan_index;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1289  		chan->scan_index = chan_index;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1290  		chan->channel = ain[0];
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1291  		chan_st_priv->chan_reg = chan_index;
ab6f0ab1781371 Dumitru Ceclan   2024-05-21  1292  		chan_st_priv->cfg.input_buf = st->info->has_input_buf;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1293  		chan_st_priv->cfg.odr = 0;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1294  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1295  		chan_st_priv->cfg.bipolar = fwnode_property_read_bool(child, "bipolar");
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1296  		if (chan_st_priv->cfg.bipolar)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1297  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_OFFSET);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1298  
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1299  		if (is_current_chan) {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1300  			chan->type = IIO_CURRENT;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1301  			chan->differential = false;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1302  			chan->channel2 = 0;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1303  			chan_st_priv->ain = ad4111_current_channel_config[ain[0]];
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1304  		} else {
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1305  			chan_st_priv->cfg.input_buf = st->info->has_input_buf;
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1306  			chan->channel2 = ain[1];
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1307  			chan_st_priv->ain = AD7173_CH_ADDRESS(ain[0], ain[1]);
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1308  		}
cfc4c76b75ab68 Dumitru Ceclan   2024-06-07  1309  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1310  		chan_index++;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1311  	}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1312  	return 0;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1313  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

