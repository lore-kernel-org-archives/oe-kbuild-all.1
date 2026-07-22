Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410423C5837
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784693329; cv=none; b=Jnb2jEDgStEdN+JvUyinKGRFNjMvPGXiTXamGQZQxq6GqHnzksNF/QfrRsw2sC8sT/WMoBinlNIq8kDIxGU1f2aP6CmP5jVOhI+QMBYYwJNeeBwOGh7QSzGg2C0ncd1agSaqbmFhEcQ/U3DOtcLhOwtJPgQokyA7dm6Fdn/hlfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784693329; c=relaxed/simple;
	bh=GL9CsKF7VhJjEYTNSesZgMrr54MhiSbAgy5ztsBue1o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ghfiJQ/vTxB7YnDDuDWwh5U63vLR284QKt0/gdcr5VbvEe1briengnmgIkgG3VzTHNDIsAN2gtcKFaO5I/+X1R5R3ho8BtZM7kWgyYfM66fhBQ2PLfx/hnghP3Z3ASe3n52/5qbzy40hc9zcDDKZ4pF/6dYC84dstZR+Z2wevxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq/rbcoB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq/rbcoB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38175907a56so4362751a91.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 21:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784693328; x=1785298128; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptL1Njyw7k3uQHYEwE+CxIxJ/IMY8w4WS4O7DHqvlDU=;
        b=Iq/rbcoBct3s1kd0oscyhOfx3qmVPVXv6WRuimaJMi59hsmfVTJb6Z/J4AWmNDLnsC
         id5clixsmMzvDjNCzniexwjo2WEB9IifimfB2eWLq1REsGz97JQf9OWlFWrJxA9E0C+d
         bZMF0P9J3TkC00Qj/BVEGm4COE3oaTYbh7uUEPsqLkAinvI+HoySVzvBMPvI4NmrMg8K
         /D5xF4BOJ5xfzk7lSEdSM2snm6eTDyu6e+MatQSpJXlqDaaNs+DJytCSoRXKIwGH7gVO
         zvdri/I0jwIqPyd022hHvPz/DfqXUWO9MctJgwrbTlMDLrMAyNRhc61PJiXTPeLoeUUi
         CPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784693328; x=1785298128;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:sender:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ptL1Njyw7k3uQHYEwE+CxIxJ/IMY8w4WS4O7DHqvlDU=;
        b=kQTD5qcJZkOZsVknUu2hTSxvQbwzZZqLVw7pZYbmfRlo3gKWRBXT8axHaSe0Qg6cFs
         0MWNNnmMwcq/ultR3AnTjY5i84F6LS+wto3ZiO5OBG/EUbF1EelvPFNun24lfPQgpEfr
         ga5S6eGLDvUm8wTJ8nWBoYNqFJp5gHZbgVE9QfqXMsgMOvde8Cfc6VDxQEFV4kX7CnLF
         qqJDCWXuONAMnMkqSi/fQ9GrDPeJp/0yKuytNdJ7uA+EaNXZWtbHU+tOc7wLfOx8gAPz
         YudqU+CtDGC76eAf1cQnirkNTEl9yrrC93T521SQ1eeIDgzatKXdoFgtWNXxOYx7g8ie
         jOeA==
X-Gm-Message-State: AOJu0YxafsG/f2/483cUcZyHhv8D+jBIjAY3WPbPieK+igY4xKqSjKvu
	sDGYWbSoXnIz7dn8vsOxJJ/zxZ76trTyFRC3ln2HvU2N77QlZCtSA6dRd6F63w==
X-Gm-Gg: AR+sD10mPoam8ZJNL05ec89xjxnFiJDxeHOQBKfJ7S2R9UN8rIZnNkenPqfpKId8zHi
	pmjRqBkrX94EHSfx/GBCh64dEWLTdD/y3Ys9fP0VL4WCZwV2Bic56i3G6tYcryHMmtcgdHO/rsi
	ylM/s1q9Rjq4h6GUdhdwZ7mjbJf/T4VUDJGEwWbnwh7o5x6EFBaYnIly61LPZqp/+flqUvleWpW
	iN61HDBL4eDT3DHQnUECwJk40Je2e86F63luHN6iMjhibzs/TuSpzKPFsZTYLPAZNUDCyf6uZZm
	Xk96KeAqTniL+B63CYoBqgK64hdYtQWjqlsizkL6ESSMVk4Tx3iugrvApj2UERCliStnQYak4RL
	MDj4D9T0tDAVXe9QhXDxTiJvvEHHqfSiiimgX9EMJ7UyHTt3VE1XSZ2bbcvNmTGSuyzDp1Cg7xE
	rPQ6VGBSuw6TjW7Z+2Mf7p5n9QiGLQXtkj5YDLWikBnpgnMf/hwRg=
X-Received: by 2002:a17:90a:d445:b0:38e:7f52:c8a9 with SMTP id 98e67ed59e1d1-38ea379633dmr2288788a91.15.1784693327625;
        Tue, 21 Jul 2026 21:08:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm1696087c88.11.2026.07.21.21.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 21:08:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <430b9801-247e-4d8b-90c6-e99eba328942@roeck-us.net>
Date: Tue, 21 Jul 2026 21:08:45 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6914/8209]
 drivers/watchdog/watchdog_core.c:283:65: warning: '%d' directive output may
 be truncated writing between 1 and 10 bytes into a region of size 8
From: Guenter Roeck <linux@roeck-us.net>
To: kernel test robot <lkp@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: oe-kbuild-all@lists.linux.dev
References: <202607221029.3DpWtIFm-lkp@intel.com>
 <55920902-7b86-43e5-b22d-8c2794d1b3fa@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <55920902-7b86-43e5-b22d-8c2794d1b3fa@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 21:05, Guenter Roeck wrote:
...
>>   > 283                snprintf(alias, sizeof(alias), "watchdog%d", id);
> 
> Sure, never mind that id can only be in the range of 0 .. MAX_DOGS - 1, or 1 .. 31.
> 
> I hate clueless compilers, but then I don't want to be bugged by this until
> I die either. Rasmus, any suggestion ? We could make alias a 20-byte string,
> or validate check the range of id. Not sure what would be less annoying.
> Any preference or other idea ?
> 

Never mind, using scnprintf() does the trick. I'll update the code.

Guenter

