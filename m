Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364E21257B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756127081; cv=none; b=sRTDhzFnQIr79bnqYGlvETDR9+5Uc20sHu4nVAJR6bDOuIGDcuJ2+3Nk103Hq+zjR2uqyuwm+9WRCz2aAx568PYTvGhZyE8Tv9BPuTj2mzWB0cI57dOkND6MP31NLkuvfPZwVpApq03VQmPW0+OaSFrxWCIjRwqB0lvbj6J+Tlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756127081; c=relaxed/simple;
	bh=opFb1gxgcEF24Psznxc91Reb7NqPoIFXHn+O+SyBDys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jx8Y7jYN23DdXR6NCGMwZ3KpkkFp+eMZu5XkocscVokXuRM4CdDlsqWxu3T60geQ9IaCFnWDi+njMcEef7RysIeTEo9fJSUykmE6ah14NwpubogZAxM8IEb5dI3d5zgqIwOycPXMLLXW4P5H2G+UlBFPZALf3ParIOLzFIZdMrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N9paMDZT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9paMDZT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so23341645e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756127074; x=1756731874; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn/SviJD49c7rc7vSoZpIs1ZaUK/bPx4EhxTEwUIQvk=;
        b=N9paMDZTKjQqtkQzA5JRWjTJc+W9oChfUoWD2WKWftVWv++HLk0DSF/oZAkQpCWGMS
         MUHJZq/D58chexfrT5lPfnvpFdihEhIKRhyg2VLG2/alzirTI1DTuHyJMzOKg1/ZuBGj
         CQ02WHzzVDTw6B5nV3LFEzIM6XvVgOwy4xjvv0gtRc5TcZOabvEN4D8m6bs462MOVHlN
         TgjyIlNOax9aenCLsIAa/ovRmSsXl8Z3NATC2zjjYW6s7UBs8Gi4t5ahsBxYDQ9eTKJj
         iDA1M7HV7bxxKho5JvBdvaUwsDQ+CLPHnFWp4OVTie7nkz2GlDJRN19h5XKVleyQPvgB
         TwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756127074; x=1756731874;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qn/SviJD49c7rc7vSoZpIs1ZaUK/bPx4EhxTEwUIQvk=;
        b=TzTHTSfyhn0zf/ra5SSgKU4oFkvhbKBMpBRqA9PSJT/g+fJuN4BigyJmsB17CcddWQ
         qBmkyGi0SQ+kS7dbOdVQKGIUdLfNdLEpkg72kbLacSCbQpt5Jj39xzvFB6hUfsJDF3Yo
         G8msfw+vI7RU5GArGbhMM1fPzUhAxUwi0WVIhmkHEVbeZDWgDoW8ivrFskz+hCKy4LUf
         MjEYodGbDDGGbDKxpdmeLQKTg8Z/YCXxbJz0Rx4VpmqD7YYQHmb4Ej6VkIJLPm2XEpIM
         02Os5XIqesLsdoTGLp91BUp4IUKCqqlIgTqzwDmZ0aor4rycNeYSEoIYym27pBR8T+1u
         IfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOX/5M6i0Nw/Y6/Fk8z2QDknSDUcFo6XBdxPrpWanMwx6xQIfX9IASWpYOYLqalsAqIEh6CIjIPiM/gEOP@lists.linux.dev
X-Gm-Message-State: AOJu0YxxlwYtxLGe/lisfgHIB1T/7hZNZoe7AwldFMtzQGUua1OL34qD
	A7zYydcXSIB16VqOWBWo9mDb9QfcXJpoS5jJC5Fu9nieSr/LJQ2FZQFh8IIgXbNGTx8=
X-Gm-Gg: ASbGncvNm7GN1zZJkGsRAmPUMFRlsquTcCXk3t0RQljg4BMh1eujk7+az/L295Ft4sc
	lJJNjASFkTlumV6FMm9kGAOAyV8pXh374io5AhnrUkk547jvB/i+GHyav2cnirXtm2UA8poYIvX
	agTX9KGzdE6JCMq50GpbftOebSdCGZztQ6PyYKv2QCdJIllUe1k+E24ujo1xaxR9Z77EfNt6/XK
	+xAWK5BpSRoIROI1lekplDLSEg4/jda/h2JdbI++q1OdD4h/I3YJkAz4StQpoYMubCrzrSCjEfz
	TRaTfx2L8Ra8568/nYU9Xa61LUjTwi6X6N1z8L4S4qSM9sTXEkzto7inmYVHU3BpGNmtScb8DSP
	Hl3M9uhjePkMkh4vmi8L+6WTF0KY=
X-Google-Smtp-Source: AGHT+IFLTANhGv+KQFDBIFZjxSd5yvOaXONO+ygW9Srw+cCR8S/bQ48zKRnQ+aqZqSS//O4r2HbX5A==
X-Received: by 2002:a05:600c:3596:b0:458:bd31:2c35 with SMTP id 5b1f17b1804b1-45b517cca56mr108449475e9.25.1756127074447;
        Mon, 25 Aug 2025 06:04:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b57492878sm108933675e9.19.2025.08.25.06.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 06:04:33 -0700 (PDT)
Date: Mon, 25 Aug 2025 16:04:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>,
	johannes@sipsolutions.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org, arien.judge@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: Re: [PATCH wireless] wifi: mac80211: increase scan_ies_len for S1G
Message-ID: <202508251233.r1IFboEm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822062020.904196-1-lachlan.hodges@morsemicro.com>

Hi Lachlan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lachlan-Hodges/wifi-mac80211-increase-scan_ies_len-for-S1G/20250822-142135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250822062020.904196-1-lachlan.hodges%40morsemicro.com
patch subject: [PATCH wireless] wifi: mac80211: increase scan_ies_len for S1G
config: x86_64-randconfig-161-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251233.r1IFboEm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508251233.r1IFboEm-lkp@intel.com/

New smatch warnings:
net/mac80211/main.c:1277 ieee80211_register_hw() error: uninitialized symbol 'supp_s1g'.

vim +/supp_s1g +1277 net/mac80211/main.c

de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1262  
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1263  		/*
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1264  		 * Due to the way the aggregation code handles this and it
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1265  		 * being an HT capability, we can't really support delayed
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1266  		 * BA in MLO (yet).
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1267  		 */
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1268  		if (WARN_ON(sband->ht_cap.ht_supported &&
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1269  			    (sband->ht_cap.cap & IEEE80211_HT_CAP_DELAY_BA) &&
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1270  			    hw->wiphy->flags & WIPHY_FLAG_SUPPORTS_MLO))
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1271  			return -EINVAL;
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1272  
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1273  		if (max_bitrates < sband->n_bitrates)
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1274  			max_bitrates = sband->n_bitrates;
5ef2d41afb7fce net/mac80211/main.c      Johannes Berg         2009-03-31  1275  		supp_ht = supp_ht || sband->ht_cap.ht_supported;
ba0afa2f22e1e3 net/mac80211/main.c      Mahesh Palivela       2012-07-02  1276  		supp_vht = supp_vht || sband->vht_cap.vht_supported;
0eafa59746812a net/mac80211/main.c      Lachlan Hodges        2025-08-22 @1277  		supp_s1g = supp_s1g || sband->s1g_cap.s1g;
                                                                                                           ^^^^^^^^
Initialize supp_s1g to 0 at the start of the function.

04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1278  
e8c1841278a783 net/mac80211/main.c      Johannes Berg         2023-08-28  1279  		for_each_sband_iftype_data(sband, i, iftd) {
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1280  			u8 he_40_mhz_cap;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

