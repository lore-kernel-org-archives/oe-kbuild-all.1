Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2F53A1686
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817056; cv=none; b=oS+/89H+ulu82zTQvHbUKrDzy6Y2Cs/XoWppzCKngI9a6EHi7tJNf8hWYPkXcsp4obvHPu6nuugPIz7oWHzaa1Qg7znHp7opNT2xAtiE4U/yqLrU5aMtkiVeuwwZsF1IHS235MGF+Cxr5nGC4SfGU11R3uvl7hPehsyg8Nt2v/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817056; c=relaxed/simple;
	bh=o9SfOayrWajRW/+NG/zMKHW/ffcQ2S0g3uodt2BKZtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGwrqdEpy7uLakORI1wFtY/yTuZ5PtXcJD3dLrfJ07TbxwH0xUIiKBNJn7hIaAdU+5AogM9sXqU44+xqI57QaIuZPLfTdGOvWncp2LgwYWgJa4yUtK3LL8aVByytaXKb6CRQ5rtyZdzO045D4sEXqFR61RchFm/Q3CYMyPrh3ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=TtP4XErx; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="TtP4XErx"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c250f28f1cdso311438966b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 00:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1787817051; x=1788421851; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TC/uq2OAWBJlRWDS0+FgLZUaW3+hNg8rcbu4E+WX7w=;
        b=TtP4XErxUjh0u+FyZHyevM2Sbi80F2nY1+ACGQ7ZPj95Pd5b66vQT9yGdxnLaXW7+w
         g/imCQGRf34ceM3egekfxAnj80brbYBe4fMQpn4g/9LaEUH98TzbPru19KGfEaJQgTOS
         7I2tTYUSDcjN+QbBlmFp0FX8XvbUYT+jB201E8+wD1Xq4yx/PgRDrF+VDcLqvIYQwoIh
         ZNVJii/BK4jDRJoq+aC5bRFZyoXxeQZimBM1MUagg7WwhI1Y806PTRer06e2tzTallSp
         unLL4fQjLNWi4/7YT5AP8gJp6VVp8uFbtbbuU9XcDPIcwkfm+pnof3p4Vu/yfhcYOeA8
         ea/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817051; x=1788421851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TC/uq2OAWBJlRWDS0+FgLZUaW3+hNg8rcbu4E+WX7w=;
        b=G97vHixShpvwijVvgfY4nC1xphF6uzu+QhjrWlQQM1cYph+imhL1sxMoAynDi3QQ+M
         Sa50W3ZYTknB/m3YA6X0Nchc79Dlh/tsA3/ffK7VuarBdxozsgfjsrSILaj8qgXzLyno
         PkYgMoGN/jFLE1XUgzFsyWk8kgLk7E5OHOzimI5nk8c5DjJxnKM6EUU4opTFPu8/Xy4N
         lJr7AprIzM9jtdANjcr1WaQ0a5CJJioK8YHT+lCE5fRPecLKDN8zKyjl3HOb76SodlvQ
         UI/+xAHaPqxyvzBTViOANJeUMaTTi2470Mn8MhV/6yd6ET3r7YP6CUY52nntDMSyVL6M
         P2fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSC3xgmxM16qNknzwaLa/X4bPgcftRav7E3P0CDgcf7UtR9HYkbVED/KamaNIw4UacB3qnH+ISTOON2g8C@lists.linux.dev
X-Gm-Message-State: AFuF++mkR5S8RvdcBru7rihv32zvAjdsFjAI+1M1RTIiTwOYBUWAqDF4
	8cqkl1mYJacfOYuJlWZycxIN6qp+cW+5bR5GJkHuWYnv/zAllfcbh3AEWKtdOY2k5Q==
X-Gm-Gg: AR+sD12sBpGdBd1Ld0uaUaMiIgq55fCh81q3Zbm6AL7CMvZHAvkNVEW1wssR1STGERb
	fmO83uCDF9RV7Vm06+FocyX+5P5WZZ4OuiIuX6rnWCDUfR7FyEQRyyHw3NR/ohecivregeT9P6P
	9rzdukFMC8l9sLvLkDgQyxHiijwacVnnydR86yMiWQAScRKewwqqYIl8CwgFxCaMq6DDlhzHXP9
	0vrp8mPYYsTbsnKfOmQJEK26k5XsrpRkTyXEMC+HwjiB/o8qy/b6ANQqO+RCjKiaV8yNpDmDCQ1
	TQ7GFfbuHNco9hH1GLJqjLtqPuxfqTkBQv/96rqpt1DnIWOLjKWcRWQz1Duahv+9Gzd1FQ3Hl4T
	FH/mmeRtTQ3kLdJpLUVSMWsUaJMu7+qb8P1oj17oJS+vwbAJB1LFQa6zs6OBq6G6Yab7FTfpnHe
	fBh7bUoynaY5e48tnNdh8s4jSkOUxK7jb9TbklBqPbYMGDAjBpOD6L7XbAFpLJCwE9g11iWOvc8
	ZkauFwTal0sojw7j4LMyw==
X-Received: by 2002:a17:907:930b:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c250c330febmr1350343566b.13.1787817050958;
        Thu, 27 Aug 2026 00:50:50 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a722400sm652641166b.23.2026.08.27.00.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:50:50 -0700 (PDT)
Message-ID: <702a199e-6439-4890-9dbf-0111aa76aee1@monstr.eu>
Date: Thu, 27 Aug 2026 09:50:43 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: Fix MB_MANAGER build with older binutils
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260813024026.5402-1-kmehltretter@gmail.com>
 <ao-3jrT0aP0_fSBA@gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <ao-3jrT0aP0_fSBA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/27/26 06:06, Karl Mehltretter wrote:
> On Thu, Aug 13, 2026 at 04:40:26AM +0100, Karl Mehltretter wrote:
>> The suspend mnemonic is an alias for mbar 24, and both encode as
>> 0xbb020004. Use the underlying instruction, which GNU as 2.30 already
>> supports.
>>
>> Fixes: 88707ebe77e2 ("microblaze: Add custom break vector handler for mb manager")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202310310151.UhB396Qs-lkp@intel.com/
>> Suggested-by: Michal Simek <monstr@monstr.eu>
>> Cc: stable@vger.kernel.org
>> Assisted-by: Codex:gpt-5.6-sol
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Just a friendly ping in case this got missed.

will look at it after rc1.

M
-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

