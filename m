Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B071311AC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854883; cv=none; b=MjbZUVnHGPtj6LALVtBBCD80R3tfUWpJcnvim840LQRhYC4tVrgnjLcX99gAP134PyIGEDhICYCyrm+MZMo+HJzoGnYIC9I8cfmpHggpmg+u0Mql3Ah4NlBHiLL4g5Xr4JtRLnx/EMLygrazbIIHdpbRUWi5cDCqSNsMAS6xFyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854883; c=relaxed/simple;
	bh=1erOG6BD+UVqmjSzqgy0UeFWC6Qbup+YMTG/351ock8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkgT2OBnu44U4ZzaKhXbtd90kPQ0TBnENKd3bLGRrIUtEZvQoUa9BJbJ2+s37MyKkMx21NYm/0ysjW4cDWE/nbAcZEf5gYSF+cc5JAz5gbd5o86LnDCsqGbkbRzpV3LQzs8B5htOzzARi8LgpOQ7QdsT3DY22miCyL+c3DsD+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oXjSHM0C; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXjSHM0C"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc6ee64512so76145065ad.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Aug 2024 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722854881; x=1723459681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ4eC6aco2OMzLZcW32lNcwJ0jDMMtztuSf2DOiIEmU=;
        b=oXjSHM0CpVuabVEDVc6RRLSIMn7xoVyEinRoxr4POJI1wAil0D34vTaag3FVQ6VYUe
         mrdHZXTb21tPi5jig0CCw6iWbXumEVcIhLYh6q+QRvP1TP41Zpq4/F14czQNuB13ARBN
         7wM+KiazcY9ekZfS+2bJJIVStXZ1LaOEV3QBu3hKYdM7kRau8s/aydRIjOi6zrnLOxnH
         iG+ScJP3IzGFTfvQdXMrWXwNcrgzNzEBN6GiSnBjm6wx/PTGX9HB+VWqxsfl90Xd1tIH
         B2jG2AbESFQMsIOxo6b2lPh9oUq5Vd5VrJ7eMg2vj+FHSKSui0jq2aAYNcVRCvgUKdkC
         u8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722854881; x=1723459681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ4eC6aco2OMzLZcW32lNcwJ0jDMMtztuSf2DOiIEmU=;
        b=u5DOcJEWtpTkcBRY5mh39kSIpl028tn6Ubwc4NZEOfaidE+4ZIAcSLiG8sdPzX3eJd
         Y1NCVOJuIsoSsQEkIH32r6D1SMa4ulQ/Q/I3aMyCbPzoICXYzFsHdkfSonlyFABBM66l
         nnpwVIb0GhjkHK2E5H1faErq4OxaSuCR5S+ZushvMLJHLMvLRrYAATa5rdxPipZhBWx4
         rLjtU4gA4GS70qV9E/xbH8N1nTWACLSehPouT3HIL1qxBt3JmesP684gwIXshrkXNSvJ
         65jGpGQ/GzTSRl9KbBLEcyxN8y8tVczeQDqYiwPk87o5DpPi9lKDLLKO8vvyEME4U0Z4
         nXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFE5LWpQvNVFZrnL8Bb0x0qcrkTYAotawmEIQaf54+6lTUesPoBEM4U98BLGCViEFafylKtKKmcMDw3NsvIobhcPMGfUwWVVKSD5vFzA==
X-Gm-Message-State: AOJu0Yw3ukve0DgdAMwaEWAiOw50po7fFG9P67sjKwD+RRU9QkHPd8zu
	9tyzaKX+Q3jtwvGU5kP2KvkGoQ5znGomoFonc8A2ml1a4UJPGZgNeY0VZR3jAn0=
X-Google-Smtp-Source: AGHT+IHspederY56HLknhhlUUMxPp2/ot8UlLUewi1mzpD8jqzWyRsMD9OvpzVtKoiLvrCnVYGjDng==
X-Received: by 2002:a17:903:234b:b0:1fb:984c:555a with SMTP id d9443c01a7336-1ff574ba872mr107623905ad.52.1722854881353;
        Mon, 05 Aug 2024 03:48:01 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff591797f6sm64592435ad.208.2024.08.05.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 03:48:00 -0700 (PDT)
Date: Mon, 5 Aug 2024 16:17:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 2/2]
 drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is
 uninitialized when used here
Message-ID: <20240805104758.52obllbjvuvtmd4n@vireshk-i7>
References: <202408030418.gnJDcCpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408030418.gnJDcCpm-lkp@intel.com>

On 03-08-24, 05:01, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next
> head:   dca2ef2b7d916c718c6e88084170413a8a1942d0
> commit: dca2ef2b7d916c718c6e88084170413a8a1942d0 [2/2] cpufreq: spear: Use of_property_for_each_u32() instead of open coding
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20240803/202408030418.gnJDcCpm-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030418.gnJDcCpm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408030418.gnJDcCpm-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
>                    freq_tbl[i].frequency = val;
>                             ^
>    drivers/cpufreq/spear-cpufreq.c:176:12: note: initialize the variable 'i' to silence this warning
>            int cnt, i, ret;
>                      ^
>                       = 0
>    1 warning generated.
> 
> 
> vim +/i +202 drivers/cpufreq/spear-cpufreq.c

Rob, can you please send a fix for this ?

-- 
viresh
