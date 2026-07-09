Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F00E3BB101
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629314; cv=none; b=iz7xrfKRxhGOuOzCZ1dpnjS9Osp26LU9Rzk9G6wdvSX553aIuYv7ccxGhntxObQhQImAWUGTr2hMR5SR/Rk1HU8gkv9yHHLiOmCxzWk3mjv6FTf5wFocMLN7Y8ztrNcBkFJJHOTTrrQPZInKizY8uZ7AxQDpDi/qnreLwuKYnZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629314; c=relaxed/simple;
	bh=vxGXjnm7ECnqftUoLxdN9KihorJFVvx830Mk0vEDIjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYGBXldDmwMRLMxHtgz4iSWHXPfvOMXSl8Hveo6/7goxxmq7df0gi8z5WwsADZRiw8XV0L2K939QOz71+wDObYYtFbcHh+S26BwFwSPwYbIBN1VoSs4vq+3Y6aUAsY2l0qIoa5/bVttUrYakMJ1zmZvnZIR/0eq63NZLsqgpmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X15ZRlZd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X15ZRlZd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso1663035e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Jul 2026 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783629311; x=1784234111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rfEaA74kGgKkkpi1XdBp5kuyuDOHJYs0HpveYPGqvTA=;
        b=X15ZRlZdSI8Y0+Tih5LmUSQ6TJ1VeoUxoTI8A1RqKJLax8cuisarhNfsPS4IXzjdU6
         +AsbJTyOSyOsCWAntmHPw19Gy7XMXpR2U3RyHZ9bEVHTVivtITYXjjWAi+xjQVAN+5Sh
         EuDbcQ7TaKX3ua3HMNxDj57HIhpkAuj0wwBj9fP04U/VhPcwCkLn3IB79GRSchQin6Tk
         teLLUgj3DCEo72S+J2je7Xn4uC3Cg9AAHNalj+UDZQP/GPW7fkVe9Vt+3T6pUhUUZ4j+
         NH9PLspJFExloTgIEBcCZ5CPE1yBKRlb9O7+Yr+cQrmggea5ZfKrOe4pOOWWD9jqFIUd
         89Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629311; x=1784234111;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfEaA74kGgKkkpi1XdBp5kuyuDOHJYs0HpveYPGqvTA=;
        b=XVutb79aqPS/FEMYEiDnXZ2o4vD7+CMwP7ysZoo3AH++1BMXAMTO7FL1CFTAln7yp5
         4XrN7vHm8HQXk0o8RSANFJd94KNnjTVjreHwoh0kOkJhFkZqREQmnPPaG0o9DdMQzCZB
         mdtGjE3R8LdIwAYn9sV59hDH/9/nC+9rsAQ9D5QJkwL2PdFsOGw5Wko07q0SA8jbZDL4
         iy0dKuAR8+DtqYgiPjnFcaGgWz8brmN1joyH4KZYHd3KRW9IXjhC4XK7XLkJVxk0IJwj
         1AG5Y/wfEXkWqZmhrBvB7q4+j8htiZsJNr+RDVhejn5ixkFyjuWG6DA7a254DLqEC7hZ
         javg==
X-Forwarded-Encrypted: i=1; AHgh+Rr56Gg9wTqw3M6BWAy4tzOub7QXlAl21NKAHLsRihKitPGGc6OGik7m6eSHZo5XJJxt4sx48pLsmbTP1fl/@lists.linux.dev
X-Gm-Message-State: AOJu0Yyam8nHudkU1Y9YJ80IMOE0XUl/VfVebDEPaL8B+H9fBJeqg7aL
	mnEuyb8Yadr/LZT5IUZnGw+aV/vipnraR8sEi+TQ+lJVkvO29WUdWyvvbbcYkcZgYz0=
X-Gm-Gg: AfdE7cm58UO40VDpqHMxWwWvuTVl0qP/Y0Bga0vZ3ZT9lBj8hcCNM0HWF/jOz2GkRix
	yDaLPTKXjY51EPSWDoMQFhNovha2jQymKiWsitKwxZ0bKO71yOMJts7lgfK4dNkbLGR53WRUhoG
	b/H/5sEiNQ/wW7Sae0vqV6LIrFCcKcGNz/VoCoQBVz/u6caEmKejCrMmX+VPUV++9s7HYw/CZqp
	5nsErNSRoAEmrKWv9+hqlsGFpWaUg/6FKPok9vNyoRKh7yBs+r0D+kDFJgdR0Wz0BGtfFp+TZqr
	Z25dVGATmhzEs5586UF8wTjRMfTiMOlpU0WWh3ni7z/8yuJot3QB0oq3b/AECChWDIhSp8tEQXM
	yV7TFP5WPu1s/kw1UZoasiPzS+cJfmhINErqqELvOEYCWzcAhTYoBRVypjEIQ7gz5VavD7+UbHx
	NTxA0MaiJ/TqlBXOnVOYUSG+f4CQ==
X-Received: by 2002:a05:6000:2482:b0:475:f0d1:eb63 with SMTP id ffacd0b85a97d-47df07b9671mr9630515f8f.48.1783629310665;
        Thu, 09 Jul 2026 13:35:10 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm56246880f8f.21.2026.07.09.13.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 13:35:10 -0700 (PDT)
Message-ID: <32d12651-66ee-4d36-891d-b375d1f75a93@baylibre.com>
Date: Thu, 9 Jul 2026 22:35:09 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1679/3422] sound/soc/meson/aiu.c:313
 aiu_probe() warn: missing unwind goto?
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
References: <202607031022.4wWDCjAs-lkp@intel.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <202607031022.4wWDCjAs-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/9/26 12:34 PM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6eb8711ece2ce27e52e327a5b7a628ed39b97f45
> commit: 83b83024cdbfdddee104f4a84c2c2f1f8e6659f3 [1679/3422] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
> config: riscv-randconfig-r071-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031022.4wWDCjAs-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.4.0
> smatch: v0.5.0-9185-gbcc58b9c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202607031022.4wWDCjAs-lkp@intel.com/
> 
> smatch warnings:
> sound/soc/meson/aiu.c:313 aiu_probe() warn: missing unwind goto?
> 

Thanks for the heads up. I think that a fix for this issue has already 
been proposed in [1] a couple of days ago.

[1] 
https://lore.kernel.org/linux-sound/20260707012424.1661733-1-ethantidmore06@gmail.com/

-- 
Valerio

