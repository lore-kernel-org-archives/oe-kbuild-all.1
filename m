Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5D4280338
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350270; cv=none; b=aWGYsIXdEhRHeVkRukEx49M7dn41gGv5OuuTg96Vy1W/tz4dxuw2XsITaouRw5Weid2nTb0Jfs0X73j8xYcpai2gury2OQ+mUHzO+U3xZlSS2tGIQtOU4wcwUJlyViIj4A4sKxkoFDViULqFKgLK+Igi9ywL8VSbgV4edXo1mjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350270; c=relaxed/simple;
	bh=hoU6B1IUKqEePrjSbJ1rl3P9dAuWbzaOt76sUeMAdSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPqWPzy/GWn/mHxa8S03+774gh1ghT+UUr0YUaxf+YNEIahZ/IEXxKW/mI7EgYC7O42wxAS98qyyiNVUOnQSegqEBH37YG3y2P4RIN/OiKlrUbeO1CeuumC8JIeuANVXVM5p/J6NUnpP6fwyBAPTSBXMLPVNd6zGqpOtnlQB5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QU/UpeWz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QU/UpeWz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so2614749f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Dec 2025 23:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765350267; x=1765955067; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wneUdiZIUvSz4bIt7t7dzaQ34xX/EF8I1Wc2lGxK/KU=;
        b=QU/UpeWzw0Gh/lKT2RTHQVbkLItlD1nTblTnVbLULC6woJUHZUQkjmgTYxwGdz/vOv
         5tztKA5n5d3ApqmOm1wFtMXZDOOGoXzSwI5uNYTNdM+/sN2AAGdjj9Gg0L1ClBwOMi5W
         3PK8QIWcAYWeguTZx9zCdb26aV4brqvS9rpuzaT9WMrrOqxqnNRuRzwCpIJlXnVbvzDj
         +LnFvKp+hSlzsI21awyM+ZFI7YiCr3eQee8VYQTAuqK2k01o3Nm+gYiZuffDVFdQEcuc
         8AgBmCZLEg38RmMRXNx1q4nsX0ZJFbMgOGoYM5c8a8e0c4ad1oqDrxS7253UrNKfSzUH
         G+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350267; x=1765955067;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wneUdiZIUvSz4bIt7t7dzaQ34xX/EF8I1Wc2lGxK/KU=;
        b=wc8DbJx7mNZQkq96+SqMEj1C6YK177Ocn227VwOCeLrx+9AXa1zbgf06Vp14IQiD1u
         9bECVhEpU5eK4j/q4jNT1Zq5TzdQYwO70/GfgA0ojEiVgvubmXcHmC1ao7t16mmUslXS
         CJUlLH6QqUAePsDnUF4Ivofew95OXOEVFrxD3LIUc1fajvnHJP0AqWD6Sc97aGAna3I4
         D3/PPv4jkFRjy0tVKBSiIzSbfKLZSKYHNqLG5s+XM5zAxzC8hAnuxQeodn7Yhik9KhYi
         HpgcLrHvz9JMz+AOuBq+lA2lN3/p2A32hy5ayn556roLVuTP5g+VIL2+fY2DSw1DFUuW
         HsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRujvJKw4aOwxANGJ0P9J6T9dkLBRVIp99iG4XNwjcbgbwGShsRY/JpciDgkNM9dxsNvAWUfTwDaqCLsiS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+eHxS6d5Dl++q0+3MfHX2XriQmw6XGLsuYaAzH8frj23yLHF+
	GSr/IpPQKHldj+nQpa6M+c0UH0hlmQiR4aBg1HgURBWH/5sKipa3XaVDMposbtaWSsw=
X-Gm-Gg: AY/fxX4IlZBzIn4zPj9rOYRCUOahiEU1I/ljEFlYkNstvEsOlt3zR55KLE2xVHTNdwg
	Id9hofaY7M5Qm0KA1BElj+kufwfLRDUfYG60upu3YNJQgPPyNrDWH2v/YGr605UsyEHPg/XY/qk
	wK0fiW+kjX1FzUNhQvWvityTvRwdFHtqCm0ye1j6yVGlf9r2SKHVPD9hhKjkd/x8Jr054ANADGh
	CCOhnubekOLuPszIfbjW5TDh/DNbCQQDb4yzT4bXd1HLREvcagCVIajjzlD+ZaF5es5gyd61zEj
	67b4LuzjxyMeEUDBIbzTEHkJ9lS1jmaJEw70DBzovNzV22xxqoEO7kOZt/pCzGYPJvv2KIqTvde
	ksBuFxBRGCpmiv8+N5aJi1E8cfDQXaByPEzcOa3mfkdKil4hhWF49XKsh2sICLo1VyboSUCkB/Z
	Q6xNUIWDi/Hxw9Dg0c
X-Google-Smtp-Source: AGHT+IFcZ/UTVwf8224aO0fl35Qk8UwQ0QlCQ27fmB7JwmfzLHOOZKb1nT6qHZ293CtrmggIF1MUcg==
X-Received: by 2002:a05:6000:2dc7:b0:42b:3bee:a7ff with SMTP id ffacd0b85a97d-42fa39d2f96mr1265827f8f.24.1765350266483;
        Tue, 09 Dec 2025 23:04:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331df0sm37067886f8f.36.2025.12.09.23.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 23:04:26 -0800 (PST)
Date: Wed, 10 Dec 2025 10:04:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rohit Mathew <rohit.mathew@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Fenghua Yu <fenghuay@nvidia.com>, Gavin Shan <gshan@redhat.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: drivers/resctrl/mpam_devices.c:1112 __ris_msmon_read() error:
 uninitialized symbol 'overflow'.
Message-ID: <202512100547.N7QPYgfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: 9e5afb7c32830bcd123976a7729ef4e2dff0cd77 arm_mpam: Use long MBWU counters if supported
config: arm64-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251210/202512100547.N7QPYgfb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512100547.N7QPYgfb-lkp@intel.com/

New smatch warnings:
drivers/resctrl/mpam_devices.c:1112 __ris_msmon_read() error: uninitialized symbol 'overflow'.

vim +/overflow +1112 drivers/resctrl/mpam_devices.c

823e7c3712c584 James Morse  2025-11-19  1070  static void __ris_msmon_read(void *arg)
823e7c3712c584 James Morse  2025-11-19  1071  {
823e7c3712c584 James Morse  2025-11-19  1072  	u64 now;
823e7c3712c584 James Morse  2025-11-19  1073  	bool nrdy = false;
823e7c3712c584 James Morse  2025-11-19  1074  	bool config_mismatch;
b35363793291e3 Ben Horgan   2025-11-19  1075  	bool overflow;
823e7c3712c584 James Morse  2025-11-19  1076  	struct mon_read *m = arg;
823e7c3712c584 James Morse  2025-11-19  1077  	struct mon_cfg *ctx = m->ctx;
823e7c3712c584 James Morse  2025-11-19  1078  	struct mpam_msc_ris *ris = m->ris;
41e8a14950e173 James Morse  2025-11-19  1079  	struct msmon_mbwu_state *mbwu_state;
823e7c3712c584 James Morse  2025-11-19  1080  	struct mpam_props *rprops = &ris->props;
823e7c3712c584 James Morse  2025-11-19  1081  	struct mpam_msc *msc = m->ris->vmsc->msc;
823e7c3712c584 James Morse  2025-11-19  1082  	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
823e7c3712c584 James Morse  2025-11-19  1083  
823e7c3712c584 James Morse  2025-11-19  1084  	if (!mpam_mon_sel_lock(msc)) {
823e7c3712c584 James Morse  2025-11-19  1085  		m->err = -EIO;
823e7c3712c584 James Morse  2025-11-19  1086  		return;
823e7c3712c584 James Morse  2025-11-19  1087  	}
823e7c3712c584 James Morse  2025-11-19  1088  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
823e7c3712c584 James Morse  2025-11-19  1089  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
823e7c3712c584 James Morse  2025-11-19  1090  	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
823e7c3712c584 James Morse  2025-11-19  1091  
823e7c3712c584 James Morse  2025-11-19  1092  	/*
823e7c3712c584 James Morse  2025-11-19  1093  	 * Read the existing configuration to avoid re-writing the same values.
823e7c3712c584 James Morse  2025-11-19  1094  	 * This saves waiting for 'nrdy' on subsequent reads.
823e7c3712c584 James Morse  2025-11-19  1095  	 */
823e7c3712c584 James Morse  2025-11-19  1096  	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
9e5afb7c32830b Rohit Mathew 2025-11-19  1097  
9e5afb7c32830b Rohit Mathew 2025-11-19  1098  	if (mpam_feat_msmon_mbwu_31counter == m->type)
b35363793291e3 Ben Horgan   2025-11-19  1099  		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
9e5afb7c32830b Rohit Mathew 2025-11-19  1100  	else if (mpam_feat_msmon_mbwu_44counter == m->type ||
9e5afb7c32830b Rohit Mathew 2025-11-19  1101  		 mpam_feat_msmon_mbwu_63counter == m->type)
9e5afb7c32830b Rohit Mathew 2025-11-19  1102  		overflow = cur_ctl & MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;

overflow not initialized on else path, but I haven't looked at how
&cur_flt is set in read_msmon_ctl_flt_vals() so this could be a
false positive.

b35363793291e3 Ben Horgan   2025-11-19  1103  
823e7c3712c584 James Morse  2025-11-19  1104  	clean_msmon_ctl_val(&cur_ctl);
823e7c3712c584 James Morse  2025-11-19  1105  	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
823e7c3712c584 James Morse  2025-11-19  1106  	config_mismatch = cur_flt != flt_val ||
823e7c3712c584 James Morse  2025-11-19  1107  			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
823e7c3712c584 James Morse  2025-11-19  1108  
b35363793291e3 Ben Horgan   2025-11-19  1109  	if (config_mismatch) {
823e7c3712c584 James Morse  2025-11-19  1110  		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
b35363793291e3 Ben Horgan   2025-11-19  1111  		overflow = false;
b35363793291e3 Ben Horgan   2025-11-19 @1112  	} else if (overflow) {
                                                           ^^^^^^^^
here.

b35363793291e3 Ben Horgan   2025-11-19  1113  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
9e5afb7c32830b Rohit Mathew 2025-11-19  1114  				      cur_ctl &
9e5afb7c32830b Rohit Mathew 2025-11-19  1115  				      ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
9e5afb7c32830b Rohit Mathew 2025-11-19  1116  					MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
b35363793291e3 Ben Horgan   2025-11-19  1117  	}
823e7c3712c584 James Morse  2025-11-19  1118  
823e7c3712c584 James Morse  2025-11-19  1119  	switch (m->type) {
823e7c3712c584 James Morse  2025-11-19  1120  	case mpam_feat_msmon_csu:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

