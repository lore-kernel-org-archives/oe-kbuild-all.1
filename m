Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3D61DD0F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737805266; cv=none; b=uSmo1o1p3qanvUyaKMCMI9ue7HWuwYxLTgYaStlC/OemmA8HPx6LTXLOSFPu9BQ+/9YVHh3pBwJ5NixK3kPoGmyGrrGTkqgNC5fiZVdf24+2Bv5i908Zely5hRfAkvTb0P7iWbbCbTqFTq3c/3j6wPV1kfP9Ht2gLiKYxp8Hhgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737805266; c=relaxed/simple;
	bh=w84sKJdWQCwBQYssoNeJg5/hPAj+aFlWh1DrOywhXcY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjtLwoj5LqhjTPbsElG4nIA12tAqqwKdPDx08XH5vzX5A3XAUgSsjQyylX9/p5AldpeV9ky00UbiEYxEhv8EhzwUsYb7ieDJX6e+UU43p1+TWI03sItXzo0TmA3IqOROpSkiQimmlLgXHEuU1HbF1KUKWai9BHYruZY6Ih7r6tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImlLVWL+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImlLVWL+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so33221335e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 03:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737805263; x=1738410063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IpqaCHI7Vc98vcBPC7g/XzpCpn5eoiPJXvPj9IcZThs=;
        b=ImlLVWL+SeSseeXXmSyEhDLBW2wW4GNdC02gzS+ZHYscjqlYB+AOfcid6ShZdRd+pS
         +a2Ya/M1nrod8ld0ElHQtAqO3OLWAntUQXBK9OZqU2vOTjLlNWpQObBiCpP40FUTSHFW
         Rhq733GFD90Q6AUBudS3lu73wmYuRzgS+0KgRWd58VGsjwB9pme2bvymAtUkR+i4/koZ
         AiJsriPd9L/xS7lmFiR9EmYz0rKjgLZrOFFbUrMKwMlq6LA2LqsvwIBYMLSHjAS2UKn+
         9TMf2OQvR8J37HgO4kNwcrinHRq6NQl+bt3PIG0drER4MGbZEd0QNKg9f7hhalIm2VnS
         0u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737805263; x=1738410063;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpqaCHI7Vc98vcBPC7g/XzpCpn5eoiPJXvPj9IcZThs=;
        b=NSW+8rqLwdNjkSKm8mPx2hiOkuJ7Ojo2vmBg8Tn6HnNeJ6rarnZbnw7SEd992C4qrQ
         9SU0Nj21+qEKmYEFf30sRMktT3sVIQCoQ6HSEOiMQ00s0y5ZsnM40u4I1vb9/ZRN6WjK
         WjbXDUJbDdIpLn7/jXtwjheH3cv4KhMpCUoLwsqN/4dLzKMY0wpKPJDFMY8s6KrzBcrU
         75RnluRlEcEDWydj0cqWDdoABR8OsibWquHfcXeg9cTpxHVwjqvykN7ygDTbKfJfXYPB
         FUo7O+Nf+D2Z6/V5B+zQkzg8eHUqQs1ijIhcxkNmgYe2r+Uhd5ljk1K4pR2QJahD7vzm
         FSzA==
X-Gm-Message-State: AOJu0Yy9lBvQq7FpsomfQ+oV1HdbkEt4LOkTMMR90eKIzeuSqvPw97ev
	UJ4oqKDcSFZJDKysOLZuUoffNqJWJK9GySboCzsUGqnKpXG6H06+
X-Gm-Gg: ASbGncuAB9ZEjEMONU9hMN90DVqNeYChGbwsfZ2tyR+cIs2wxrpc70uYCRQiaCUic3a
	PVCGJoRPZJ+ay7Ge5BKYrx8pWfYHjud21ZVtKuVbYcTJvrG1yIzZiEIBElf6CIYcnuMy9uNcn5B
	k+St3bf3QTE2jjDK0dbMo/QDs4u3n2NaRb3ckbCgo0LvF2Ufq/c6+6v+aWlogQBMOFj/kmdpu7B
	NOCnn8saM5ga1uD5FUfpzvZl70fERbHR5SgTl84jfRGXH8jQpjkqKBT6ajn/4tTjFp0W/DsQlYj
	hbyEB20Iy1wr6zO0kd5OlgfVfY5epj0FUbUl
X-Google-Smtp-Source: AGHT+IHW5ZQJ/Gj33iycxo5oaWsCYh64S+CtguBMjqXlY02FtFH3SQkw1Bxrvh+EOaOvFtNRAIz64g==
X-Received: by 2002:a5d:648b:0:b0:385:f220:f779 with SMTP id ffacd0b85a97d-38bf57bfbd7mr28807146f8f.49.1737805262429;
        Sat, 25 Jan 2025 03:41:02 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507fe8sm56791755e9.24.2025.01.25.03.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 03:41:02 -0800 (PST)
Message-ID: <6794cdce.050a0220.33f6d6.1d10@mx.google.com>
X-Google-Original-Message-ID: <Z5TNyyOMHiv5ZBuc@Ansuel-XPS.>
Date: Sat, 25 Jan 2025 12:40:59 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: drivers/cpufreq/airoha-cpufreq.c:109:34: warning:
 'airoha_cpufreq_match_list' defined but not used
References: <202501251941.0fXlcd1D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501251941.0fXlcd1D-lkp@intel.com>

On Sat, Jan 25, 2025 at 07:38:50PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b46c89c08f4146e7987fc355941a93b12e2c03ef
> commit: 84cf9e541cccb8cb698518a9897942e8c78f1d83 cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
> date:   8 days ago
> config: sh-randconfig-r071-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251941.0fXlcd1D-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251941.0fXlcd1D-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501251941.0fXlcd1D-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/cpufreq/airoha-cpufreq.c:109:34: warning: 'airoha_cpufreq_match_list' defined but not used [-Wunused-const-variable=]
>      109 | static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
>          |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/airoha_cpufreq_match_list +109 drivers/cpufreq/airoha-cpufreq.c
> 
>    108	
>  > 109	static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
>    110		{ .compatible = "airoha,en7581" },
>    111		{},
>    112	};
>    113	MODULE_DEVICE_TABLE(of, airoha_cpufreq_match_list);
>    114	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Should be already fixed in theory.

-- 
	Ansuel
