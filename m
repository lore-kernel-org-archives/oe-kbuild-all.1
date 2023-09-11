Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA6C3D8C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 09:44:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so49110625e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 02:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425440; x=1695030240; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLDb4H30mTqVI+rM5RA7ugQrCsRCBy8KoPReQkheNqU=;
        b=uadqvKKAq4ZFWbRr0NkxoJI287mp/u9K5pPxdx1jmqRCC1ZKg24xSl7VFPVFSFs6an
         XxOw7jx+Vib20WprsTqwa8pHi0rUHD4Q8AYH9CGVmfPpcxtUgDqRnUHo+Z0SduSdGN0e
         +bsttBZuzc1VovR7WCYt1SH8pd/QcRuMGiTPS32i9I30m10LZ03DRrxiyn7oRCbC57x/
         LGCiri0CGhqfcYewLPmTIyD1hcVBK1PajhY3ecTsBKzz+UZM8V7WZThbA5XsI/YGkJtt
         40uhvI0csyxhFtLal7QZ78D6qfuaXl5N6BM+6NwAkv7MXnMtalTBBc07ilTPZBm4K0ZX
         YTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425440; x=1695030240;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fLDb4H30mTqVI+rM5RA7ugQrCsRCBy8KoPReQkheNqU=;
        b=g6SPAGWUgB1/hmPRz+Iw1uRYtAwys1NSJNgCsEUgjGFK5M20JMmd8MllPLKyO4U7wD
         BnMOpyiU4ONjqiBlr9tDxJICPDHYrjbQ0ZQgr1qWlYEr5+A6MfczVWWEi0Q/2eyHo8pL
         zanTXCRpq/HB8y15OYQ5nvd2zfiFFsA2/dK/NnD+MiJFBxsdMWZcWJ7lNB99bsJ0rQyE
         G1YelpwGX2oo1ac2+rKNODsWbct2mwk0Dla76MDDlxhATrEg+Xe3Nya4u3WrgXe71B5P
         k3ueiO3K0biWvq2Y+7wLPyEvYaiT4RZsPbRrqS18mPb9N29ikgGGCxbBs9Solk8Y3YVC
         tmxg==
X-Gm-Message-State: AOJu0YyM61OPAOWAEp5ubx4cjQEhX/W9rpqGXZyZ+b+j5fXFdfjZK05T
	tVLt78Ittf6Aj4BB2Yop1rvqkQ==
X-Google-Smtp-Source: AGHT+IFgZL1ICv3VOvrb4VwZ3Q/S8xVELBgCKv+uhnJF/AQbX9e4Q7e9M5FHV/wSJJso6cqBpcIZ8w==
X-Received: by 2002:a05:600c:2191:b0:3fe:16c8:65fa with SMTP id e17-20020a05600c219100b003fe16c865famr7780806wme.4.1694425440437;
        Mon, 11 Sep 2023 02:44:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id c25-20020a05600c0ad900b003fee567235bsm12787183wmr.1.2023.09.11.02.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 02:43:59 -0700 (PDT)
Message-ID: <35ece4b2-9422-4da4-9713-7d103dca6939@linaro.org>
Date: Mon, 11 Sep 2023 11:43:59 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [amlogic:v6.7/arm64-dt 28/35] Error:
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi:228.21-22 syntax error
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 kernel test robot <lkp@intel.com>
Cc: George Stark <GNStark@sberdevices.ru>, oe-kbuild-all@lists.linux.dev,
 kernel@sberdevices.ru, rockosov@gmail.com
References: <202309090349.edkQ35JZ-lkp@intel.com>
 <20230911094046.bhv5pj4pglfdi3k3@CAB-WSD-L081021>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20230911094046.bhv5pj4pglfdi3k3@CAB-WSD-L081021>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2023 11:40, Dmitry Rokosov wrote:
> Hello Neil,
> 
> On Sat, Sep 09, 2023 at 03:09:43AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.7/arm64-dt
>> head:   1e728f46085667071fdf0f2d6f68c51c844d46c2
>> commit: 2aee4cd48c56062c37ade35f1bc3c0b5b8db14c8 [28/35] arm64: dts: meson: a1: add saradc definition
>> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230909/202309090349.edkQ35JZ-lkp@intel.com/config)
>> compiler: aarch64-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090349.edkQ35JZ-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202309090349.edkQ35JZ-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/amlogic/meson-a1.dtsi:228.21-22 syntax error
>>>> FATAL ERROR: Unable to parse input tree
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 
> The above problem is caused by the absence of the following patch
> series, in which you merge all clock headers into the public part:
> 
> https://lore.kernel.org/all/20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org/
> 
> The clock binding for SARADC_SEL was originally located in the private
> part, but in your patch series, you are moving it to the public part. We
> have already merged your patch series into our branch, and it is working
> fine on our side.
> 
> So, do you plan to incorporate these changes for version 6.7, or should
> I send a spot fix that moves SARADC_SEL from the private header to the
> public one?"
> 

Sorry for the noise, the branch is now rebased on v6.6-rc1.

Neil
