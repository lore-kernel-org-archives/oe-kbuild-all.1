Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896B328600
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919343; cv=none; b=jNaPzlURZ4HpOMJ473bVOS4adSVLitiG2dhggcx4SJ1bhWbI0YEfTgCuyhWBK60+p2vcXbxv9LP3e4YZEW3eWcGnTAwFbAjbzxQ3iOHoAjPU5dG/5tfoAJwXjwO7ux/bKmxL3ZE1O0wu2aZmZZHKWQJtCFlBluFFkWqBd/hjFtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919343; c=relaxed/simple;
	bh=zO4HfYHyG77lligX58GcpeUsXfmoKe4bOSQJtnv2qnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OQ8rfXmZrEwr4J9260BVjnqdLKN38g5tST3cjQLaeN3q3smviPqUQf9IKUtKgW9TyzDhpZ1Ph58z2hyvVMPBw4GB8KRSOZGNix0o5Hyhdn5BgeypCV6q/ffFVGN3KtbpbRbg29I/xAIJx8lJduwDQVGDVM3jtqmwR7Fp00xr8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YB3O3Lrd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YB3O3Lrd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso16515145e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Dec 2025 23:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919320; x=1765524120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzxFs8LzMrONfI1Cn6UlkRiahNYd5MhF609UmLpQAXo=;
        b=YB3O3Lrd0Ajn34FUZE8slDe6Bssm4I+cBGuTOOTtp/kEaXtBhUc+85zwEDfpDlvePT
         4o2Z4VmXupUsYkuSPImwZlqDrfI20aiEXu1HrnU97r0k1wL28iMpNk3R6TJnd+ZX9dMB
         wemQ4uCx3awts82n4PzsFcOjz6lLNZFjJhQiSYps3Dp9xbAZZmZq1+dOms5ADO1MR7Cx
         rrn/PRu784nLZDA2F5SriqAiiqZyZSRtVeraQmFedrH1BHtWlRNL3PbVPIhUyoU07qwi
         LKR2kwljl1XdgdbJO5xZhpCTx4+pSdY/+tLIlMp+JZ9g3JD0crwXFHRhZcjNmQpKVmRc
         oInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919320; x=1765524120;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzxFs8LzMrONfI1Cn6UlkRiahNYd5MhF609UmLpQAXo=;
        b=IQAcDcZtSL8FyUvoiSz+QM75gHdqOt9hPFWojaXfBh4EokiLVYeawMniIoRYEVItHw
         PIUdwR47q7cUPitBVLl8+QHb6THQ+jjf3WSX/vg7NKA8AMHXPyG0ijXI5lq2gesYl4aU
         QOiB4YsKNtt0166gjFAfQr18r14jo1RZuEEvH16209OeixfMk7u9ttJRf7/wy1O/JZZI
         xrkuocdMFCWWpd2kVBF8WSSveBCcu6Tc+nPSfgZ4z1fjA2RhsIptk/0rGbRZexerYhFt
         N8dWrt+ZmM2D93GIq+0Y2zBZ9tF/TGQCD/u2sEuY2QHSqA179xX2Fxa9d+iA+HutI6ih
         Ccew==
X-Forwarded-Encrypted: i=1; AJvYcCUm3COQiyBkh6evnzYztLonvHfJ9SzSJuF93gj3q759qCzylNtcdc43djV6cicSpZYFSzpHTVEkmgn6pLBW@lists.linux.dev
X-Gm-Message-State: AOJu0YxeWQjf/8mmihjOYjC5cH1UV0strMcKZwlkMzT9K2QvzdQdLGy1
	DEVlBusJ/B7oBGxDHpilnwdfBxDZv1R25DoYAg+/WZoBq3NGxXiqoTEfJsDgh2VFLns=
X-Gm-Gg: ASbGncsIKf4uOdUtEWsvTFUEq7az+SGE4peB+nGrQ12ksGFAkbjckZ5DeLaQq0QVn9c
	IAR8ScqfitNNAjGHDVLOQSI+FxbUB3IoqNA0vckaaR9YOXK58SjBZCjoSGHD7DPWNDJxm2DhodG
	6DPUnvAqdiTtfOAfCetWDlpm1ztmVzd7TBUx2PMSS3dbKhUH2tH7IKiyySUeG2EsQqyZpVRIAMt
	TEh6chzDBTvvO/ql27YJTqyRT7T940YESbWXhCpSWa2Nv7HV2DgdAknVZkSfqJpgxQIKZqWXYU5
	gnvG4LUTkxcd2QFqgFsC7xLBE80ResRPaPDiSQrfkTMlmt3Nt1Lk/jQKA5H0etMdXd/QTbSc8QF
	728OS4SsyI7QYeByd1Yj1Ehz2d0eXYg5NTNrtEov9Vma8r4eBHkgRh0QajJ41cJiLHrxY3j+7sN
	cAz1JoUncxPyTE90Xi
X-Google-Smtp-Source: AGHT+IGY46mYanaDcTERQwYze8S9vgpM9dAzNgia/FegejO4LmlZHO08fLRhzsVOYwX0bqvVtCm5lQ==
X-Received: by 2002:a05:600c:1f90:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4792eb12478mr66048795e9.2.1764919319970;
        Thu, 04 Dec 2025 23:21:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b12411fsm65146265e9.3.2025.12.04.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:21:59 -0800 (PST)
Date: Fri, 5 Dec 2025 10:21:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202512050233.R9hAWsJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>

Hi Brian,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251202-060924
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-3-9d5a0daadd98%40redhat.com
patch subject: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: arm-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050233.R9hAWsJN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/

smatch warnings:
drivers/clk/microchip/clk-core.c:300 roclk_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/microchip/clk-core.c:833 sclk_get_parent() warn: signedness bug returning '(-22)'

vim +300 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13  286  static u8 roclk_get_parent(struct clk_hw *hw)
                                                             ^^
returns a u8.

ce6e11884659988 Purna Chandra Mandal 2016-05-13  287  {
ce6e11884659988 Purna Chandra Mandal 2016-05-13  288  	struct pic32_ref_osc *refo = clkhw_to_refosc(hw);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  289  	u32 v, i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  290  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  291  	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  292  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  293  	if (!refo->parent_map)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  294  		return v;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  295  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  296  	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  297  		if (refo->parent_map[i] == v)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  298  			return i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  299  
ce6e11884659988 Purna Chandra Mandal 2016-05-13 @300  	return -EINVAL;
                                                        ^^^^^^^^^^^^^^^
So it can't return negative error codes.

ce6e11884659988 Purna Chandra Mandal 2016-05-13  301  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

