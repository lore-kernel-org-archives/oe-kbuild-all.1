Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89B449997
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635196; cv=none; b=GF1Cd4s0bEsVtOzyTZTmhTlpvnqJq4tycw8kvXy5hSWw4S+x0VjWLPDzFcchZ2XQgm+NDEQ6kzLd869ms9y1st7uxs+PZhXR4OrEp8IRER7ssvLfe4bsOlF5ms9uanj4QHf4386mBp8k3oZfKM6IRunf0KKrF0HcqO//Bg7cYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635196; c=relaxed/simple;
	bh=0eTYNlzbh+kIaRy623BfcosbEBLTuHWoTR/NIMNDK/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tB7HycBTc/9+gXgvJku4yqp4o9doS65QkhhW6SGqSbSf4mJye67PEC6WQBuLJjkRi0iL9+zmWTn8qCb7owHXh+9mKSIvJ1XHy5FzHyYeEuqR5w8P2j2LVDpnihww2fnqof1t+zwxqUATXHhNSe6YjUEPDA12dMTBo2dIg80dZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hktdTzRT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hktdTzRT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so167269b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Jul 2026 15:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783635195; x=1784239995; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBqXMmYpW+Czf210p4ltTJGXBH9BD8XV3lG4s6qiSeI=;
        b=hktdTzRTL0sXin5qWJ3QZO88sstrNPIx5V/inv1TH/DkJeAa08j3p+quXIeM2v5Xsk
         iusKc8ZF6NaJNPIwp4H/api0Ed9EEXeeis1ZXXIm5e5GEr9HNxq97dW3BcCjaZh5F/mU
         g+kGvNVuRddIhzRBIk6tPBw0Ko3SbiZqLiKHehrQUrhB6sW5TO5zg1dcyJHV6D5fBhZE
         MSgbaW0MyfIt7/f79Qua2ueP8kmQrb/n/fl61d5yxFExWoHfZ6d+wEcxZ9g45YS/pyPV
         H3CBhB/NagSxwrPva45JWj6B7YnjcOVPNoXENvQDQrwP9jDJgyJKTXBNze7ItPkZbKBd
         3BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635195; x=1784239995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBqXMmYpW+Czf210p4ltTJGXBH9BD8XV3lG4s6qiSeI=;
        b=BQ112dtJQx+jDnErTTVjl1SGMEcnkSbCY+yHmFbvXHbfPa4//okODBQcCyJpPl5iLA
         Kww+NXm8RO9EvMMKiKB4mcoukdYlSH0FQUYtzBlCU4vEIF9Ee/f9AcjtFEwAuRU/MR0Y
         QnhBk6xE4CASFcTwlM6hDQz7DeYUkv+ZIkqHKU5IY+RdMLhT2fABPTgJuvwBtZTEVsou
         qaC6sRu1uKJ9RKjLlR5FoUEYf5wSeIex7D3GgR6LPY848Mm6Hx230wZyHzfBbpLCCXYm
         E8V2XMmusFrKOusH1hcv03jwXfg9KUnqjrdRqgNQx7qdO07PgJMJfh3G8+TseHlZramu
         42aw==
X-Gm-Message-State: AOJu0YwqcKXl4X38aH8/VwpMIycvXOt6d/Zmaojp4r4t7V6ZaM5NxFNj
	+lS6JozBReenxHPMw1GB+8neUmXUMOcA8MKTp7WNWXH86Tp0FKVcC9WvB1ByuHeYKG3wNatecVD
	ILstIsCAp
X-Gm-Gg: AfdE7cmHe11Fx7cyGGZWkHNGHR6NPIthfB0ibuqnBudYhFo0c/Vf58HZ2Ls2vQV7r74
	Pf/4tGhS8vZNpgJUhoYU79tcbLzuZ+5QDUmCPSFK7fkb+3Qmv1f6crCwntW6KFracX3lYF+qayF
	NR4emZ1fhdold9t15sZ5kl7kgJlpaN5XvCNON/gZr+nPcDShSEE/SVFLtuZLZCXfEcLMNb/P6+N
	p0kSW8W7KGQ4aUJf/EIohB9CqhQ0KQerceyY6e5HIClvD40HKPdQj9S955w738S1d4D72eVhGqn
	sSXCdgZv/c3b39lDsIoW/DicFVn4DpPqZDCZ7ndtPbHDfERKCstbvksoNGVLQ9lSeUx5VHp+XSA
	KcuyROF1MZT8Ap5KCDPpYreJtlDD2wp4+E2Gove737pzIX8/zaJmUGNWDStWHhTjZtDoG7MToIm
	eSY8XTtyrO3AfwXmNtjInovJid3Dcny5UgRQUtKrNjIBEzeByMfcgPI02A4msUpuLKE22gT8rzv
	YRNFnVKwcxKdDUvB6RuCSP3YY/VcvjEE++3t7lB4WwDP3o=
X-Received: by 2002:a05:6a21:a89:b0:3c0:9c19:b27c with SMTP id adf61e73a8af0-3c0bcce9962mr10814503637.74.1783635194306;
        Thu, 09 Jul 2026 15:13:14 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:973a:bff5:6198:4261? ([2a00:79e0:2e7c:8:973a:bff5:6198:4261])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm13470044eec.25.2026.07.09.15.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 15:13:13 -0700 (PDT)
Message-ID: <d0fcf5d4-ed39-42cb-925b-47f72c67f49b@google.com>
Date: Thu, 9 Jul 2026 15:13:10 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [usb:usb-testing 23/28] tcpm.c:undefined reference to `__udivdi3'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>
References: <202607092212.lINETdSF-lkp@intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <202607092212.lINETdSF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 7/9/26 7:17 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   472ce6621e371aafc03c0704d1d940f51d8159db
> commit: b3c9b6925ca2e02ef2fd77d0aa5e0ca6b2a67f5a [23/28] usb: typec: tcpm: Add support for Battery Status response message
> config: i386-buildonly-randconfig-005 (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607092212.lINETdSF-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     ld: drivers/usb/typec/tcpm/tcpm.o: in function `tcpm_pd_send_batt_status.constprop.0':
>>> tcpm.c:(.text+0x6743): undefined reference to `__udivdi3'
>>> ld: tcpm.c:(.text+0x6764): undefined reference to `__udivdi3'

W=1 build fails in 32 bit architectures as I have directly used "/" 
operator for division in my patch instead of the kernel helpers. I have 
a fix for this. I will send a new revision for the original series [1], 
hope that's okay?


[1] 
https://lore.kernel.org/all/20260701-batt-status-v4-0-a31d97b1ae57@google.com/


Thanks,

Amit

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
