Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276B2C0285
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267222; cv=none; b=tKlZg9PCzr42H5gpBmAOVvdpL0tSqq05le51VajANYSBqwO1c7TEkOfbuKIlwYNqUZg2gh0sphKEgZGJHKCUIJL8TKkii1e/K5Q4PuS4nsPphxPDw/MnhL9z+haPYt71GR5oZbA6uxJ6o8ezH0w8TbE7Kk59ck60Lv1VGhgW41Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267222; c=relaxed/simple;
	bh=AX6eSW5yJ/7HyPyw+j8QlsxkuE6rI5AqV/8RNOAdcnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVtNAMqxe78psUWoGP4M5YSivEr1Qm8NpfcDCO7KpG1qjyH3G/IW5tbDKX09VBRMvk6z7FOR8nn8deMJkLDmWVk9B1gz0KaBgO8dwBiXybYse7IHyLacb0+5Oja8RMjIMlrI82Zinsww4Bynd7TCdZxhUfZxaKWPWmD+TIe7Qa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdO2z52Z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdO2z52Z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso43680535e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Dec 2025 00:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765267219; x=1765872019; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tmka3JktcHDrYJGde3cixZm7oQKlb4NTL3rNxrjAUtE=;
        b=zdO2z52ZCf55UHKuB/bCvkVx9AEA0ZP+mLO+EEslTsMtne75CYKay5KwtmhbIJ58rV
         Nm0CTJVKmqI7N27nUcUnolscyQgtHoQND4831OTLFD1GhN+KFGcHjE4xjGXY3UfHdWaB
         nmLdjT05iJW+jl60iTLOIKAsPcZh/qBU352Lan8XCXX8bsj3U77bSApnB7OGq4HpZVoR
         29/5QYgUyCdXXpLsyd02EcqGXbMa0tezOdul3VKCk5mz85OWUZ9p1VNvR3N4Ly1ApW7T
         KCXT0YgtNIBYX/JXuaJ19iXSd3GSjeRPUgUV1sh/Ab+ObvMTYdQzTevLVLaTsxaoxmol
         +1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765267219; x=1765872019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tmka3JktcHDrYJGde3cixZm7oQKlb4NTL3rNxrjAUtE=;
        b=AbC9Ji90TFpiGfoG2or8qht6VF77YgrRzzHhAqgPCPWLWkZq76ZL9AUMagZX7AQYGh
         nOjjFluAiymyjZttGyIgN9GD90x7XIhiqoQIPq2W3m2NDnAwGxS2obsmapxBajP+7zX7
         EYDWcMCG8ecsNrO2tXcxK0eNONQ302tMvaoQ0K/GW+HzP4qiFmUoOLdeJ+XyPFL7E+jt
         FzXt46cltVIvVeDJodouLOhUdxFUOYJh0JdroG+dML7qHz/Nj9e1MOXOqA+7VrSyY0fj
         z/1xlqUVF548V52Fi0sMpybd6ixTNqqvnRufIwFxXBh23lXWKvm4ZN+IKV4B8VgBUTk2
         Kudw==
X-Forwarded-Encrypted: i=1; AJvYcCVvyKnteYY7rDX4BB8Ftk+JLzOBw2mYUvhNMCwyMxdluz0irvazIHteB4f/dQNm17bfzRmJn30mHRBAb1WE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3mOYf4jcFI6j43Pps90YIKjk5zKSN6V85zeFUlfA93z8b4nsU
	pgg8rloz2SNKa17vq4jRc0GVLCHgOb0anVGw2e1sU+SrLpSWEV/uZho1wUal/Utjc/0=
X-Gm-Gg: ASbGncvpfEP4pV/4z7w4h0DbOyc895v3LAEU+daLvWOJh3hHviz09AwoKCiX1iENzJi
	a+xZqa5KbrAd8DAqojf3YvibzkIDHTjPhOXJMbV8hB3XBR3Gj/b7FOHOQZ9CsInvnPDNDZGmecD
	tMMiUxWf6eBfdp3HzuJvbPeGcKSBHMb3aqfEiiBRypc+tf/hXst2AOOdzJ4dX9l6ZKvwT34Kki6
	1MF6LQkQpOXLDGnHwL4WeKVaz7VMlLSnCr5KCMYRVzINtKriIiyc1JUzwr3arD2DbFgjIlpRj5R
	8VaTOqopJNS7E0I3ojN5xUNd8QNYENEwstcpj18wWjVlgWZqO2oT0tPpl0+X5eSxlAmsgcQ8QMi
	u/zj5ABStNT/rDelRhtSMTYWOd5M3/ee7UFRR2A7b/2Lwi4aMZV9aCABkoz1ptRhICzueTFtDX9
	S09gUCSZKpx4MzP28w
X-Google-Smtp-Source: AGHT+IE3ghNwrNOx+6iZ9DcMqMmy5s8i9Zh7MXao3d4UGCe2IE2brSZRwp3Hnsv5iPJub4IvB1lH0A==
X-Received: by 2002:a05:600c:8b68:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-47939dff070mr111169925e9.15.1765267218935;
        Tue, 09 Dec 2025 00:00:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d58609esm27119715e9.0.2025.12.09.00.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:00:18 -0800 (PST)
Date: Tue, 9 Dec 2025 11:00:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, James Morse <james.morse@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Fenghua Yu <fenghuay@nvidia.com>, Ben Horgan <ben.horgan@arm.com>
Subject: drivers/resctrl/mpam_devices.c:1042 __ris_msmon_read() error:
 uninitialized symbol 'now'.
Message-ID: <202512091519.RBwiJcSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cfd4039213e7b5a828c5b78e1b5235cac91af53d
commit: 823e7c3712c584641b4ef890a8af34884c677197 arm_mpam: Add mpam_msmon_read() to read monitor value
config: arm64-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251209/202512091519.RBwiJcSq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512091519.RBwiJcSq-lkp@intel.com/

smatch warnings:
drivers/resctrl/mpam_devices.c:1042 __ris_msmon_read() error: uninitialized symbol 'now'.

vim +/now +1042 drivers/resctrl/mpam_devices.c

823e7c3712c5846 James Morse 2025-11-19   988  static void __ris_msmon_read(void *arg)
823e7c3712c5846 James Morse 2025-11-19   989  {
823e7c3712c5846 James Morse 2025-11-19   990  	u64 now;
823e7c3712c5846 James Morse 2025-11-19   991  	bool nrdy = false;
823e7c3712c5846 James Morse 2025-11-19   992  	bool config_mismatch;
823e7c3712c5846 James Morse 2025-11-19   993  	struct mon_read *m = arg;
823e7c3712c5846 James Morse 2025-11-19   994  	struct mon_cfg *ctx = m->ctx;
823e7c3712c5846 James Morse 2025-11-19   995  	struct mpam_msc_ris *ris = m->ris;
823e7c3712c5846 James Morse 2025-11-19   996  	struct mpam_props *rprops = &ris->props;
823e7c3712c5846 James Morse 2025-11-19   997  	struct mpam_msc *msc = m->ris->vmsc->msc;
823e7c3712c5846 James Morse 2025-11-19   998  	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
823e7c3712c5846 James Morse 2025-11-19   999  
823e7c3712c5846 James Morse 2025-11-19  1000  	if (!mpam_mon_sel_lock(msc)) {
823e7c3712c5846 James Morse 2025-11-19  1001  		m->err = -EIO;
823e7c3712c5846 James Morse 2025-11-19  1002  		return;
823e7c3712c5846 James Morse 2025-11-19  1003  	}
823e7c3712c5846 James Morse 2025-11-19  1004  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
823e7c3712c5846 James Morse 2025-11-19  1005  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
823e7c3712c5846 James Morse 2025-11-19  1006  	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
823e7c3712c5846 James Morse 2025-11-19  1007  
823e7c3712c5846 James Morse 2025-11-19  1008  	/*
823e7c3712c5846 James Morse 2025-11-19  1009  	 * Read the existing configuration to avoid re-writing the same values.
823e7c3712c5846 James Morse 2025-11-19  1010  	 * This saves waiting for 'nrdy' on subsequent reads.
823e7c3712c5846 James Morse 2025-11-19  1011  	 */
823e7c3712c5846 James Morse 2025-11-19  1012  	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
823e7c3712c5846 James Morse 2025-11-19  1013  	clean_msmon_ctl_val(&cur_ctl);
823e7c3712c5846 James Morse 2025-11-19  1014  	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
823e7c3712c5846 James Morse 2025-11-19  1015  	config_mismatch = cur_flt != flt_val ||
823e7c3712c5846 James Morse 2025-11-19  1016  			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
823e7c3712c5846 James Morse 2025-11-19  1017  
823e7c3712c5846 James Morse 2025-11-19  1018  	if (config_mismatch)
823e7c3712c5846 James Morse 2025-11-19  1019  		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
823e7c3712c5846 James Morse 2025-11-19  1020  
823e7c3712c5846 James Morse 2025-11-19  1021  	switch (m->type) {
823e7c3712c5846 James Morse 2025-11-19  1022  	case mpam_feat_msmon_csu:
823e7c3712c5846 James Morse 2025-11-19  1023  		now = mpam_read_monsel_reg(msc, CSU);
823e7c3712c5846 James Morse 2025-11-19  1024  		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
823e7c3712c5846 James Morse 2025-11-19  1025  			nrdy = now & MSMON___NRDY;
823e7c3712c5846 James Morse 2025-11-19  1026  		break;
823e7c3712c5846 James Morse 2025-11-19  1027  	case mpam_feat_msmon_mbwu:
823e7c3712c5846 James Morse 2025-11-19  1028  		now = mpam_read_monsel_reg(msc, MBWU);
823e7c3712c5846 James Morse 2025-11-19  1029  		if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
823e7c3712c5846 James Morse 2025-11-19  1030  			nrdy = now & MSMON___NRDY;
823e7c3712c5846 James Morse 2025-11-19  1031  		break;
823e7c3712c5846 James Morse 2025-11-19  1032  	default:
823e7c3712c5846 James Morse 2025-11-19  1033  		m->err = -EINVAL;

now isn't initialized on this path.

823e7c3712c5846 James Morse 2025-11-19  1034  	}
823e7c3712c5846 James Morse 2025-11-19  1035  	mpam_mon_sel_unlock(msc);
823e7c3712c5846 James Morse 2025-11-19  1036  
823e7c3712c5846 James Morse 2025-11-19  1037  	if (nrdy) {
823e7c3712c5846 James Morse 2025-11-19  1038  		m->err = -EBUSY;
823e7c3712c5846 James Morse 2025-11-19  1039  		return;
823e7c3712c5846 James Morse 2025-11-19  1040  	}
823e7c3712c5846 James Morse 2025-11-19  1041  
823e7c3712c5846 James Morse 2025-11-19 @1042  	now = FIELD_GET(MSMON___VALUE, now);
823e7c3712c5846 James Morse 2025-11-19  1043  	*m->val += now;
823e7c3712c5846 James Morse 2025-11-19  1044  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

