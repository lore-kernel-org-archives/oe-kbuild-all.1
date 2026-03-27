Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1A349AE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619658; cv=none; b=AozGrOuBVUgDsAJAI3pRB3hGE9yvSqAQvTQefOPbA91lIUzPWVuJ5XhidSrghwINS9em5wtKcnD8l/an1H7IYe/o5OGDPpTW2RRjt7iABxv8E5yy1ayXZPhJd0IcpyNF1KkDAexypz4MpM6QVZa7XzVErzVmngrMIQ5IpDlc5b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619658; c=relaxed/simple;
	bh=F8nqQtP6HknANaBoPAe6dwl5ApJC8kya6guOXtyTiPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6P0tzmPcrqMGwAkhkrThUSDnlvxhnAhBdiLSuSrID7augSo0c4a1k3sS2JjQKYDgaikVFigwrgVhoy7wLR0Joyr6tdHOvOH1F//ltthwCt6PI0eYj1Iolz0zUKmdX3dAOieUURm0N/MYy+vbsYasGswNmiskuAtz8MAgVRpr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rb4bgXIG; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rb4bgXIG"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d55b97f358so1266782a34.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774619654; x=1775224454; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsiRzlu0kDThiDmUQXOxPDfKN3XDauB2BbTLDlcDoZY=;
        b=rb4bgXIGFyBNAsotFItxzbL6WFGKnIK7jdv1eCn9TJVjpZpfA5+5V0JAIZvoZzQRRu
         83tRnfwv4M5id2H86YxJc2ragyaW5UazsnrA3rfSA7qpd0SJ+eImdUTSO7fPbxDb4HEE
         QSlRJCtPANJ9WSmtpEvP+sE0m7CFX3ObjHkAu9WFFmj1EUJv/M8n9vzeuKEAdXqLNnJA
         Yy2+w6U9tFGJY+wI1MXQQ11XEUCO/ssDNkkJeV4kOyb47EiFCec2K/8xCMn4NcL60eoo
         oHDwwCmOm3Ro1IVIiL3f5OCFfO24IRUpVMBAvLUn5GnoguQKRlad6DjHyf7KGjlFF0MD
         NFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619654; x=1775224454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsiRzlu0kDThiDmUQXOxPDfKN3XDauB2BbTLDlcDoZY=;
        b=EKXw6P07Jlvm1hou2H5I7gEAbdOlUvQJC2S0bN8IuJl6ohgu9ORoMpoMOhRuJwwbjQ
         ailg5LY4T/3R4mamjsPfYFsUZb5BFquV5DP0aAIJS9q4slZkcGs5Z21XRH1rNSJVncEv
         VPud+TDfcHLpbtI20lLFGZLGEeilyEJuyPMloatOA+Zxw6OpcFmkrnFCWlWYD5eXPote
         oXwBjMlvA+zpV7dwcehLREymEDW4RxD3JFa5aenYs3/Q5o71EK24wxW/IUWlzWqDaZMG
         /4tjGtGvbIYcTLJLBvKlTfIFzPgvr9N0xuk3TCn9QO5MvprIMAu3U+eR8MLdezNHVF0j
         DLGg==
X-Forwarded-Encrypted: i=1; AJvYcCWWoh8iuEgvmHtj671RQ4uDPbNy6PGVb9mCiB3aNDckw5IZec4KdsaSYmECW3F3O0+Fhqvk2jrPcp/M9QXu@lists.linux.dev
X-Gm-Message-State: AOJu0Yxmvm38w+NW4EbQ7PnDlhaRUGMVYMtOL9ESbNPx99mBVMLt+ITj
	2wWzILYnJkMCWDPScyryLDKr54G/lmRQClRojVAIp2kgSuvmD2QxflDerr0aAaJO8aw=
X-Gm-Gg: ATEYQzyotC4HyJbzYOtGOYlcFOxiMlcyPRFe8OIgOGq4Z5ZSKNDNfdHVp72RZ9mxNIv
	LsQ9b/Z1s+5O5RtukO78GrKAr5iBCjBno/hgAiwXznEGhsnVdz7hdZ30Tlz+BezWT4tE8N/HLXG
	rZx83qFh5ncrrFkPW2zvaep6AthEDOwDwgPQtyxMwvh+05NY7KXyjVYO9d9XZXAJ15i9vRyahv1
	ERRtcRlqqOM3qUYZ9apRXQVHXTsk0fDidEc8do5H+t6MnMycPTwRbg8H3c6KEtePc5TDniTW94q
	8jOjYo/TehWPUtlMEW6QjOBxhMuQG4Dsafe7UQSAnQiJM4ptTrsL8LTPIfhuiFUGNSohdzZNH/0
	eU6iNqQRMSP5gjGpoPbRQqPGoZaDR/soxt1DdY7eh3Z7N/GB+fwZFrHzYahoA/a/fScQ01bfv79
	wWR4bnV8JlPi+qpMWUj4mEKWyyEGpV6oyHSblnr4eGajPK2hwjkf/rpZjB3uCvynHYlSjSz27Nv
	g==
X-Received: by 2002:a05:6830:4392:b0:7d7:f617:3573 with SMTP id 46e09a7af769-7d9fadfd5a3mr1377794a34.10.1774619654222;
        Fri, 27 Mar 2026 06:54:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:54a7:4cbc:7d2e:3b99? ([2600:8803:e7e4:500:54a7:4cbc:7d2e:3b99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e724e977sm4787166a34.22.2026.03.27.06.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:54:13 -0700 (PDT)
Message-ID: <3558dc31-e998-4a50-9732-0ae751b4fd7a@baylibre.com>
Date: Fri, 27 Mar 2026 08:54:11 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: ti-adc161s626: use DMA-safe memory for
 spi_read()
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 kernel test robot <lkp@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Matt Ranostay <mranostay@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260314-iio-adc-ti-adc161s626-fix-scan-buf-v1-2-56243b11e87b@baylibre.com>
 <202603271734.pnWuSmNr-lkp@intel.com> <acZRgSH2Vvmm1Usg@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <acZRgSH2Vvmm1Usg@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/26 4:44 AM, Andy Shevchenko wrote:
> On Fri, Mar 27, 2026 at 05:13:16PM +0800, kernel test robot wrote:
>> Hi David,
>>
>> kernel test robot noticed the following build errors:
> 
> 
>> All errors (new ones prefixed by >>):
>>
>>    drivers/iio/adc/ti-adc161s626.c: In function 'ti_adc_read_measurement':
>>>> drivers/iio/adc/ti-adc161s626.c:87:24: error: implicit declaration of function 'get_unaligned_be16' [-Wimplicit-function-declaration]
>>       87 |                 *val = get_unaligned_be16(data->buf);
>>          |                        ^~~~~~~~~~~~~~~~~~
>>>> drivers/iio/adc/ti-adc161s626.c:94:24: error: implicit declaration of function 'get_unaligned_be24' [-Wimplicit-function-declaration]
>>       94 |                 *val = get_unaligned_be24(data->buf);
>>          |                        ^~~~~~~~~~~~~~~~~~
> 
> + linux/unaligned.h should fix this.
> 

Jonathan caught this already [1], so should be fixed already [2].

[1]: https://lore.kernel.org/linux-iio/20260321204506.4b5df02a@jic23-huawei/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=fixes-togreg&id=768461517a28d80fe81ea4d5d03a90cd184ea6ad
