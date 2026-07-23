Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B0438014
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801439; cv=none; b=RyCYrlTmHVfh/jG5uZl7OmfTSwA6pNaOlyoo+qKoQel9u4OnuDHrHeIcDlO/q59LZ2OTG8XG/1Lioaig7wBzTIuxdNCmWun3kyj8QkV3aN9YoWEdGEPf1eOriwFAu6VLVQ8b4hW3Zz+nb4YK6QmulcqE7nG4QcfUpfuT05kbeWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801439; c=relaxed/simple;
	bh=q1O2QXkBv8QuYn1SHREgbhRruAYGV/++q/ngeTn4oP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvTzHdQ/i1kbg/JtB5cQrO+pyvmHs1gkIzXdQponflaSmIMub4AC27TLLC9vB8xbKMiyyuTvq2JcjWxtVTmrE4F5UqZqNGzQY/TDd9Chgrju36cq4B8237LuNuQZf2prAWSrrTsWP8QfIMhxJF0r3Hgpp6C7buUwtNppd2id6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLPuIvS8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLPuIvS8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so305526f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801436; x=1785406236; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnast4lTTFuERWKfxK3aibnv+2Qqz5yf1iG+SlSyfMA=;
        b=gLPuIvS8+AgQgBgj0HHZi710fklszTdvkFcK/s39lsJSYCYeH1hgK+snqV2UC+vpTb
         TBluhTgmo/fjoPmriA+7hc4eUIJLk6RZRmgGsBIazZfW/v5KAXOjka8erl+ljGRv4mRR
         84P7o/LWLyC5EynSpGAH8LJ4iSEmqf3PCuDpFJ4A9umKnaSUY/ws5N2Y0m7UtJcKFZ9F
         Pm3AwlDzKflK18G4KhxZ2TMW4eIrAraosDEOHhBSEpapEBP05GDhlWRYWOkbX5rBp785
         0lgcRRAFUa2DFkZjOkOn12Mzm1Az4LUmZ3ENv5f6jX1/pks69CGL5L9PoCo7lo7Vr5uP
         i9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801436; x=1785406236;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jnast4lTTFuERWKfxK3aibnv+2Qqz5yf1iG+SlSyfMA=;
        b=ineYmcCHKLFaFGmcVllDbiWoLKNC0396fuLADDFb3bDMB5SlDbLPDCfN3YHwilvttq
         qvHlxnX0DMIxEquzd18feqVV8HxbuGT3EILzDLDznO82IHnUZKVKSwsF7Q4uX9+Pu3Yg
         sqaHj0lIMbs0LkU1ReyDxfJredDkf6GVKM2llARNc5vf+UC1Pl3blJNrjdccuxueh5z1
         Xw4EGt76Q3fIGGg1t4yx9AJFnBDV2m/rzDG3j3976N02pKNQwgEQj3vg9HQ8Y9pT+/Fa
         6p0n0YZJTOFYSkY5l5RZDwLYC8I0iCWYQ1UYYdxyVSzyEL+7EeEDcNj0DXfB7Gb5/iYo
         Q3cw==
X-Forwarded-Encrypted: i=1; AHgh+RoyMQlAGE4zayOykE23hlNljtvOyc7xCAb50/I8Uw49pLdeQoYvQtxVGUbrRaFrMRsQJ3enonNAOGIVAYl3@lists.linux.dev
X-Gm-Message-State: AOJu0YyGjM8ALqJNCvLIPQ6PtfN5Oe0jAuL/39C2ukHUcbRuF9Rj4HMH
	+5PoCceKyYhix2D5gruH6vdq0cmqOrykRAluHlZu6aw7/5HQOTRD5azl
X-Gm-Gg: AR+sD10ZT5lkPAQcnd8Fk4k91L+LJIQbb2gnEH8HgZFgYaLDAPn76plzAGkJRSum/Y+
	Bygt4kLl1nIBTpCuWh4+axYO/jWklVuZ93Idbu20hd0Nq6dUuzqCcWwxfqgE4IMyA380gUMFN9u
	yXIPPEAi/e5WXEfpz8cHCHKMKnvGRttecP+kqjVWXk4t1CN06psPl7PGZa8Ke05B//YMGC80Y6X
	AjHrfHfolBn22ywt5Tmg7+/QJHkcWcjktxHeZa0fbFauvbBgo3lEpKZ5q4fiQGNaOHatlCvIHJM
	IXDnkgYB+r1UKkB6FPm8xq9hLNp93ywL07ZbKhnwo0KzmCjjAQe5OBvzeufTogDCFIhrA4ZtqGN
	67WEmW4s4LNwY9UBwNyNXbAMbfUDPcTlMcDZB/P7HaI6qGf8VxD57oDjf1JFGzxPv3EGzcBEA6Q
	==
X-Received: by 2002:a05:600c:350f:b0:495:6f6b:127 with SMTP id 5b1f17b1804b1-49573cb9f95mr24793795e9.6.1784801435817;
        Thu, 23 Jul 2026 03:10:35 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a64d4b6sm128760015e9.15.2026.07.23.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:10:35 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:31:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Charlene Liu <Charlene.Liu@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Gabe Teeger <gabe.teeger@amd.com>,
	George Zhang <george.zhang@amd.com>
Subject: [linux-next:master 5141/7793]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c:1192
 dcn10_link_encoder_dp_set_phy_pattern() warn: variable dereferenced before
 check 'param' (see line 1169)
Message-ID: <202607220316.QHZEudqb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
commit: b6f466c509ad2f390b3fc91cd0de4783554f5f98 [5141/7793] drm/amd/display: add null pointer access check
config: x86_64-randconfig-161-20260721 (https://download.01.org/0day-ci/archive/20260722/202607220316.QHZEudqb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607220316.QHZEudqb-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c:1192 dcn10_link_encoder_dp_set_phy_pattern() warn: variable dereferenced before check 'param' (see line 1169)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c:1206 dcn10_link_encoder_dp_set_phy_pattern() warn: variable dereferenced before check 'param' (see line 1169)

vim +/param +1192 drivers/gpu/drm/amd/amdgpu/../display/dc/dio/dcn10/dcn10_link_encoder.c

f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1163  void dcn10_link_encoder_dp_set_phy_pattern(
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1164  	struct link_encoder *enc,
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1165  	const struct encoder_set_dp_phy_pattern_param *param)
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1166  {
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1167  	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1168  
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26 @1169  	switch (param->dp_phy_pattern) {
                                                                                                                        ^^^^^^^^^^^^^^^^^^^^^
Dereference

f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1170  	case DP_TEST_PATTERN_TRAINING_PATTERN1:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1171  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 0);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1172  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1173  	case DP_TEST_PATTERN_TRAINING_PATTERN2:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1174  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 1);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1175  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1176  	case DP_TEST_PATTERN_TRAINING_PATTERN3:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1177  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 2);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1178  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1179  	case DP_TEST_PATTERN_TRAINING_PATTERN4:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1180  		dcn10_link_encoder_set_dp_phy_pattern_training_pattern(enc, 3);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1181  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1182  	case DP_TEST_PATTERN_D102:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1183  		set_dp_phy_pattern_d102(enc10);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1184  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1185  	case DP_TEST_PATTERN_SYMBOL_ERROR:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1186  		set_dp_phy_pattern_symbol_error(enc10);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1187  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1188  	case DP_TEST_PATTERN_PRBS7:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1189  		set_dp_phy_pattern_prbs7(enc10);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1190  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1191  	case DP_TEST_PATTERN_80BIT_CUSTOM:
b6f466c509ad2f drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c Charlene Liu   2026-06-22 @1192  		if (param)
                                                                                                                            ^^^^^
The patch adds a pointless check.

f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1193  			set_dp_phy_pattern_80bit_custom(
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1194  				enc10, param->custom_pattern);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1195  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1196  	case DP_TEST_PATTERN_CP2520_1:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1197  		set_dp_phy_pattern_hbr2_compliance_cp2520_2(enc10, 1);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1198  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1199  	case DP_TEST_PATTERN_CP2520_2:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1200  		set_dp_phy_pattern_hbr2_compliance_cp2520_2(enc10, 2);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1201  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1202  	case DP_TEST_PATTERN_CP2520_3:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1203  		set_dp_phy_pattern_hbr2_compliance_cp2520_2(enc10, 3);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1204  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1205  	case DP_TEST_PATTERN_VIDEO_MODE: {
b6f466c509ad2f drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c Charlene Liu   2026-06-22  1206  		if (param)

And another.

f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1207  			set_dp_phy_pattern_passthrough_mode(
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1208  				enc10, param->dp_panel_mode);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1209  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1210  	}
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1211  
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1212  	default:
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1213  		/* invalid phy pattern */
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1214  		ASSERT_CRITICAL(false);
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1215  		break;
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1216  	}
f0cd0a346dfd1d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c     Eric Bernstein 2018-04-26  1217  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

