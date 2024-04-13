Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2696205E33
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713011187; cv=none; b=Qs7jyPyDOKXSEeGnkTmT0FA6NbvS9o3XGb7MQGPdRyZVKzNsnhFSx1LLrS0sBg76FSOwwlGycdqhLRWgtQksFl7SjGS0TBS1H7TziJVC9V7ZdIjGxfJr+BEz7K0l3ELRrMDedWFylLAqYZDWpCweKSOxZQA2wD7z1bNh7mSI+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713011187; c=relaxed/simple;
	bh=liiTl/uYcv+xQ81pFQZqgKFHwHI01PV6jx0a//5kfbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PukWhJUV6AnUFOaQhsNSN97AXaXqET6oX/CpObDR1LZqqqN0frWSFZ2K1rPTbW2sI5lqkzFGs7jN7yNtPrHckwn7o8QR9A606V8ojH7awHqs1r9FozwqH0A8T5tpt079XDBCqzZQsdupnZcukOGQvGB+bSDhxO6f8Q319VCZeng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANjOB1ZL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANjOB1ZL"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so2826516a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713011184; x=1713615984; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oUA1HQK/tMgrO9d5hLI5pXpwB7+wCzCmNrVVWk3rNs=;
        b=ANjOB1ZLLMiJfT+oqu9aKKqRGsp2AMhkzmi7qGnsL27Q1B+a6lLsRnJ2pv2O+dPfYe
         EdXQq2eK3ZdPeLvNNr1buAC7W3vcJF2HHBqz0CBWBQqC/58wgK4Yy+Hs3jG6Cs4/0wTE
         fTrWVxOQP03pNBgw/xhM/+sGY4k1tch11SWq+CDNskCEaQSQe1WjdnupNw5Ce3MaMRJ1
         klZ+QTYW1ZPuRwQYNLCHMg43U73/CtFXd4cELRcDLoaxG/DIMVB93V5cmrpmWx1tf3Pj
         ISuKKZZvgMVbNgbTXGXt/iER1HMaDUj/VOXQO65oIwK+oQ1hnzi0g3pTALR+OcJe/v7c
         kQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713011184; x=1713615984;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oUA1HQK/tMgrO9d5hLI5pXpwB7+wCzCmNrVVWk3rNs=;
        b=jnG9qQ9L3khNx5ARit+KG9pnPqMzotcdbVXsK8PxK9HJ+2fzC/UoD/eIqHlegeOE8I
         c+MN+5cumfWlimUM6/ZuDj57WLqlhaLaWDBBKLyOo7gkVmpanQ0IzCo+XuCR7dAIXtOr
         SXUfIOvIGtfkGIrep/wwASDeAs7NMLIGZk5wSzkVS/x2mOZiMnrAiCFFoTNbgb9i6jZw
         0tfv+9tmi+DmVau1q1TrvoUjvX2JKVm2lWOCoYIXKlZvE2mVW0eZcba0hsTjFXel68/u
         tOWBAGdPG+wdQ6TECZibmY+GrvpKl2WXfUktovb0TymupvZh5/vU0yJpt47mZAn6/yv+
         prKw==
X-Forwarded-Encrypted: i=1; AJvYcCXnsnxyKL68hrjGI/NeUR1t9mTW2lc+0olfJiLxYs+NT1cW10hpBLDRrg4sooAesX+XCniNV34mSUvKorVZ6fJAQrvSgaJD/2s4ZNbNIg==
X-Gm-Message-State: AOJu0YxRjAeEMqywZnBWsyNGN19FsSntehZ68Q9Rn4ruEbyrWU+YKBHx
	cezr27jJVecEaKFELeh3BEgz67z7mFIebnmt6eXm1HeNwC2EkNgg+stHbzFJrvI=
X-Google-Smtp-Source: AGHT+IHKushtdGtjQf4d0ST5FFqp9I19j888c6wnw1YG3WUriTZkUwEwjmFmhGJiTcRMY5bF0i3Wcg==
X-Received: by 2002:a50:d697:0:b0:568:b95f:5398 with SMTP id r23-20020a50d697000000b00568b95f5398mr4124249edi.38.1713011183428;
        Sat, 13 Apr 2024 05:26:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u5-20020aa7d985000000b0057000a2cb5bsm1394724eds.18.2024.04.13.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 05:26:22 -0700 (PDT)
Date: Sat, 13 Apr 2024 15:26:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Stefan Binding <sbinding@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [broonie-sound:for-next 12/13] sound/soc/codecs/cs35l41.c:1129
 cs35l41_dsp_init() warn: missing error code 'ret'
Message-ID: <5d053b20-f0f4-4326-9096-19802ad5ea20@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   47c44619b51cb0367249a1f5c53afd28cfd9dd82
commit: eefb831d2e4dd58d58002a2ef75ff989e073230d [12/13] ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config
config: mips-randconfig-r071-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131743.unitkCiT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404131743.unitkCiT-lkp@intel.com/

smatch warnings:
sound/soc/codecs/cs35l41.c:1129 cs35l41_dsp_init() warn: missing error code 'ret'

vim +/ret +1129 sound/soc/codecs/cs35l41.c

bae9e13fc55cbc David Rhodes   2021-10-29  1094  static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
bae9e13fc55cbc David Rhodes   2021-10-29  1095  {
bae9e13fc55cbc David Rhodes   2021-10-29  1096  	struct wm_adsp *dsp;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1097  	uint32_t dsp1rx5_src;
bae9e13fc55cbc David Rhodes   2021-10-29  1098  	int ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1099  
bae9e13fc55cbc David Rhodes   2021-10-29  1100  	dsp = &cs35l41->dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1101  	dsp->part = "cs35l41";
bae9e13fc55cbc David Rhodes   2021-10-29  1102  	dsp->fw = 9; /* 9 is WM_ADSP_FW_SPK_PROT in wm_adsp.c */
f517ba4924ad02 Charles Keepax 2022-01-07  1103  	dsp->toggle_preload = true;
0db99577c4cddc Stefan Binding 2022-05-09  1104  
0db99577c4cddc Stefan Binding 2022-05-09  1105  	cs35l41_configure_cs_dsp(cs35l41->dev, cs35l41->regmap, &dsp->cs_dsp);
bae9e13fc55cbc David Rhodes   2021-10-29  1106  
ff8aad072e6388 Stefan Binding 2022-05-09  1107  	ret = cs35l41_write_fs_errata(cs35l41->dev, cs35l41->regmap);
ff8aad072e6388 Stefan Binding 2022-05-09  1108  	if (ret < 0)
bae9e13fc55cbc David Rhodes   2021-10-29  1109  		return ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1110  
bae9e13fc55cbc David Rhodes   2021-10-29  1111  	ret = wm_halo_init(dsp);
bae9e13fc55cbc David Rhodes   2021-10-29  1112  	if (ret) {
bae9e13fc55cbc David Rhodes   2021-10-29  1113  		dev_err(cs35l41->dev, "wm_halo_init failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1114  		return ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1115  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1116  
eefb831d2e4dd5 Stefan Binding 2024-04-11  1117  	switch (cs35l41->hw_cfg.bst_type) {
eefb831d2e4dd5 Stefan Binding 2024-04-11  1118  	case CS35L41_INT_BOOST:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1119  	case CS35L41_SHD_BOOST_ACTV:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1120  		dsp1rx5_src = CS35L41_INPUT_SRC_VPMON;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1121  		break;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1122  	case CS35L41_EXT_BOOST:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1123  	case CS35L41_SHD_BOOST_PASS:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1124  		dsp1rx5_src = CS35L41_INPUT_SRC_VBSTMON;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1125  		break;
eefb831d2e4dd5 Stefan Binding 2024-04-11  1126  	default:
eefb831d2e4dd5 Stefan Binding 2024-04-11  1127  		dev_err(cs35l41->dev, "wm_halo_init failed - Invalid Boost Type: %d\n",
eefb831d2e4dd5 Stefan Binding 2024-04-11  1128  			cs35l41->hw_cfg.bst_type);
eefb831d2e4dd5 Stefan Binding 2024-04-11 @1129  		goto err_dsp;

missing error code?

eefb831d2e4dd5 Stefan Binding 2024-04-11  1130  	}
eefb831d2e4dd5 Stefan Binding 2024-04-11  1131  
eefb831d2e4dd5 Stefan Binding 2024-04-11  1132  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX5_SRC, dsp1rx5_src);
bae9e13fc55cbc David Rhodes   2021-10-29  1133  	if (ret < 0) {
eefb831d2e4dd5 Stefan Binding 2024-04-11  1134  		dev_err(cs35l41->dev, "Write DSP1RX5_SRC: %d failed: %d\n", dsp1rx5_src, ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1135  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1136  	}
eefb831d2e4dd5 Stefan Binding 2024-04-11  1137  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX6_SRC, CS35L41_INPUT_SRC_VBSTMON);
bae9e13fc55cbc David Rhodes   2021-10-29  1138  	if (ret < 0) {
eefb831d2e4dd5 Stefan Binding 2024-04-11  1139  		dev_err(cs35l41->dev, "Write CS35L41_INPUT_SRC_VBSTMON failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1140  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1141  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1142  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX7_SRC,
bae9e13fc55cbc David Rhodes   2021-10-29  1143  			   CS35L41_INPUT_SRC_TEMPMON);
bae9e13fc55cbc David Rhodes   2021-10-29  1144  	if (ret < 0) {
bae9e13fc55cbc David Rhodes   2021-10-29  1145  		dev_err(cs35l41->dev, "Write INPUT_SRC_TEMPMON failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1146  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1147  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1148  	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX8_SRC,
bae9e13fc55cbc David Rhodes   2021-10-29  1149  			   CS35L41_INPUT_SRC_RSVD);
bae9e13fc55cbc David Rhodes   2021-10-29  1150  	if (ret < 0) {
bae9e13fc55cbc David Rhodes   2021-10-29  1151  		dev_err(cs35l41->dev, "Write INPUT_SRC_RSVD failed: %d\n", ret);
bae9e13fc55cbc David Rhodes   2021-10-29  1152  		goto err_dsp;
bae9e13fc55cbc David Rhodes   2021-10-29  1153  	}
bae9e13fc55cbc David Rhodes   2021-10-29  1154  
bae9e13fc55cbc David Rhodes   2021-10-29  1155  	return 0;
bae9e13fc55cbc David Rhodes   2021-10-29  1156  
bae9e13fc55cbc David Rhodes   2021-10-29  1157  err_dsp:
bae9e13fc55cbc David Rhodes   2021-10-29  1158  	wm_adsp2_remove(dsp);
bae9e13fc55cbc David Rhodes   2021-10-29  1159  
bae9e13fc55cbc David Rhodes   2021-10-29  1160  	return ret;
bae9e13fc55cbc David Rhodes   2021-10-29  1161  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

