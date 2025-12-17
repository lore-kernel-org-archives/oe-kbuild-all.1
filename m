Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40225B1FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977829; cv=none; b=q9RVmuviPGyXkRiJnaBrHlsuMwlSk/iWyFRbRU9vH/uSpJKav8wcS7vnk+lrYy/lKBhEfgyFn0g06KZypqhRoD6wTyZoBZ8sI+X9Sdk5+qxFsJQgUFsETqobCFUHs7e23UdmxN7l/Ikv4aVQctaA5vGpEDklkrL/AoJeoV2R5pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977829; c=relaxed/simple;
	bh=/4BVwaZ501abu4RjNMDoAqOjve5zBtBwnEofdcNSnNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0j2onfZWphq2tgZYXsDQ+I5DR7iSu/oWMf6AbtUy9E8UUZTYjEjElZZwNISc5RFk7s1xAtq6foqtjhhBVDd8f75KPD4vX1rp9oyisIcQ5ru+f5YDGBuBAQ42TVxwMSYLT3+5mm4q+W0G9hojcqvgxKXpRii5Q0LPL/W07ACT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xS6hvQr7; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xS6hvQr7"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477632d9326so34501365e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765977823; x=1766582623; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cloz77zvEkwBD5gExGvIivlXyFzpjuuYSckjIdDL/UA=;
        b=xS6hvQr7Y+UwHITkHkj0kLeiNbUDydC0ieGc3uRDsgIhuht4nRCOA8a6+29NElh05q
         2pRlhzhGXKKveKspu1ZiS6djXfCKgU55uP0KKENhihWEpXYl5gYewO+EPmrVWde0N6Qi
         2Eez9KvX24nU1YXWbLQgbu9vynzQV6nTCqMjN/3HzBPhC7P9ERPJOJC+YAyfPwtDYHjc
         66K4Cfa69qM87fMN642+RGODL0Y6H7cwnhak6fMdLvFRlTQn0yKjjSZjQZ3vGJefUSz1
         x02p2SsdzhckKAlOWIzj4HTG81E4/UXJqAspAbADMmf8FULUIL5QBmMthzvN7Q4o3Z/C
         tMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977823; x=1766582623;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cloz77zvEkwBD5gExGvIivlXyFzpjuuYSckjIdDL/UA=;
        b=olMy2fVYxm9STarDuJr7eDkf1IMTJOzn9NjQMSWNtDV1awUoiG3w8qpSZfeYT/xJ9h
         kT5byNHmi/gg4PWpgB8wYDLShRaAq+CRyf4ReInyZ+P9ADxvpTkAAM+ORssQUGUnqsbC
         /HFDA91RU4MZcAPz09vBluOzm2+2zrP0737dP6xTLIFrV6KngdD2kxI16QWZtJ0sR7Nr
         wMJ6D4DtsphngO64CJD3twlTVALpKNKZDNyOSXH6JCTxCkJFpZFpP2WLuaMPz2ZUdKrw
         +6uLvlNsFdCO+YnS7d7GnNlaMv8Xrcg9gBXJEktgDkuozcm6BaBhS7y9uIm0Pq5S1ntv
         MZJA==
X-Forwarded-Encrypted: i=1; AJvYcCXxc2d61GmPZuXpwnfEIAC5r+Eqpo2vIEGJXS+8xZA6vtp4RRRkhYSvIkqtX/2FyXlSnLudO7mQlaDC0nzj@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7xIVAsMSkvfNfJPOEMQB/4V7TprEsmuei0g5cDFYfZFwQChEI
	MfX4JQ6/KrsVmMGCLtiQ6iNfc/7Fz0EDHg3B5YiqpWgiDA8SnksD6H8s0AsBOsAAWK1baPAx6MF
	ZBbpb
X-Gm-Gg: AY/fxX7+kGhPOdhYJuKrydDBJBaKbRZui2Le9tvhr3OsdJ7BOw7VrbWgu0ETuAGnM8+
	7qMpfY/RslJPKYPWUGXQErTvgLb/TE1OlugrWbefR0lAuFg6R6sQJZvSSTGS3nIsZdqqJ0oaS2o
	isOReaNtKTtUZmNrtzYXrGDPdR7Jq6QLb6N8K/iCIUuLIg//DpocCNmt5YN4A2S82MeiTAlfQ+Y
	YZDtJMFkm3XmRat2cPsHFz7+2xTgtkIUbpMk/pRGxjErY53sE5hWfvNlwCXR3k2pucsalmZCJJj
	7vC8RgXQFQESYcmB7j/p3mpumeoaQYFcn4jEiABRmvPN2+jR2ZgmvRZFX/QVNamOnOpp2Jr2GZM
	R1YwO0gIFGnMGuW1I6RFVX+PHH1dGTj2opuYYMmFh2odlm5qTBWBsGmSWkE1OQ0KllCu+HHlEfZ
	hXxNYILhNj7PpMOsQF
X-Google-Smtp-Source: AGHT+IH/uKFC8IM5XNFEVoy9B5zOwvmEOOr8JEQYm8Uud9CipblJ8J8kvB9XL5+u6ogxsIY9jdYrLg==
X-Received: by 2002:a05:600c:840f:b0:479:1a09:1c4a with SMTP id 5b1f17b1804b1-47a96378c50mr162062905e9.31.1765977822394;
        Wed, 17 Dec 2025 05:23:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc64c2c0sm36499095e9.8.2025.12.17.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:23:41 -0800 (PST)
Date: Wed, 17 Dec 2025 16:23:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Kisel <romank@linux.microsoft.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: drivers/hv/hv_common.c:242 hv_kmsg_dump() error: uninitialized
 symbol 'bytes_written'.
Message-ID: <202512172102.OcUspn1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: f41ceff1748612b9e1538becc13dc2f1617d9d14 Drivers: hv: Enable VTL mode for arm64
date:   7 months ago
config: arm64-randconfig-r072-20251216 (https://download.01.org/0day-ci/archive/20251217/202512172102.OcUspn1Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512172102.OcUspn1Z-lkp@intel.com/

smatch warnings:
drivers/hv/hv_common.c:242 hv_kmsg_dump() error: uninitialized symbol 'bytes_written'.

vim +/bytes_written +242 drivers/hv/hv_common.c

9c318a1d9b5000 Long Li         2023-04-20  225  static void hv_kmsg_dump(struct kmsg_dumper *dumper,
e1a261ba599eec Jocelyn Falempe 2024-07-02  226  			 struct kmsg_dump_detail *detail)
9c318a1d9b5000 Long Li         2023-04-20  227  {
9c318a1d9b5000 Long Li         2023-04-20  228  	struct kmsg_dump_iter iter;
9c318a1d9b5000 Long Li         2023-04-20  229  	size_t bytes_written;
9c318a1d9b5000 Long Li         2023-04-20  230  
9c318a1d9b5000 Long Li         2023-04-20  231  	/* We are only interested in panics. */
e1a261ba599eec Jocelyn Falempe 2024-07-02  232  	if (detail->reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
9c318a1d9b5000 Long Li         2023-04-20  233  		return;
9c318a1d9b5000 Long Li         2023-04-20  234  
9c318a1d9b5000 Long Li         2023-04-20  235  	/*
9c318a1d9b5000 Long Li         2023-04-20  236  	 * Write dump contents to the page. No need to synchronize; panic should
9c318a1d9b5000 Long Li         2023-04-20  237  	 * be single-threaded.
9c318a1d9b5000 Long Li         2023-04-20  238  	 */
9c318a1d9b5000 Long Li         2023-04-20  239  	kmsg_dump_rewind(&iter);
9c318a1d9b5000 Long Li         2023-04-20  240  	kmsg_dump_get_buffer(&iter, false, hv_panic_page, HV_HYP_PAGE_SIZE,
9c318a1d9b5000 Long Li         2023-04-20  241  			     &bytes_written);

kmsg_dump_get_buffer() is a no-op if CONFIG_PRINTK is disabled.

9c318a1d9b5000 Long Li         2023-04-20 @242  	if (!bytes_written)
                                                            ^^^^^^^^^^^^^^
uninitialized.

9c318a1d9b5000 Long Li         2023-04-20  243  		return;
9c318a1d9b5000 Long Li         2023-04-20  244  	/*
9c318a1d9b5000 Long Li         2023-04-20  245  	 * P3 to contain the physical address of the panic page & P4 to
9c318a1d9b5000 Long Li         2023-04-20  246  	 * contain the size of the panic data in that page. Rest of the
9c318a1d9b5000 Long Li         2023-04-20  247  	 * registers are no-op when the NOTIFY_MSG flag is set.
9c318a1d9b5000 Long Li         2023-04-20  248  	 */
0e3f7d120086c8 Nuno Das Neves  2024-02-20  249  	hv_set_msr(HV_MSR_CRASH_P0, 0);
0e3f7d120086c8 Nuno Das Neves  2024-02-20  250  	hv_set_msr(HV_MSR_CRASH_P1, 0);
0e3f7d120086c8 Nuno Das Neves  2024-02-20  251  	hv_set_msr(HV_MSR_CRASH_P2, 0);
0e3f7d120086c8 Nuno Das Neves  2024-02-20  252  	hv_set_msr(HV_MSR_CRASH_P3, virt_to_phys(hv_panic_page));
0e3f7d120086c8 Nuno Das Neves  2024-02-20  253  	hv_set_msr(HV_MSR_CRASH_P4, bytes_written);
9c318a1d9b5000 Long Li         2023-04-20  254  
9c318a1d9b5000 Long Li         2023-04-20  255  	/*
9c318a1d9b5000 Long Li         2023-04-20  256  	 * Let Hyper-V know there is crash data available along with
9c318a1d9b5000 Long Li         2023-04-20  257  	 * the panic message.
9c318a1d9b5000 Long Li         2023-04-20  258  	 */
0e3f7d120086c8 Nuno Das Neves  2024-02-20  259  	hv_set_msr(HV_MSR_CRASH_CTL,
9c318a1d9b5000 Long Li         2023-04-20  260  		   (HV_CRASH_CTL_CRASH_NOTIFY |
9c318a1d9b5000 Long Li         2023-04-20  261  		    HV_CRASH_CTL_CRASH_NOTIFY_MSG));
9c318a1d9b5000 Long Li         2023-04-20  262  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

