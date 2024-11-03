Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960C18BC2F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730671819; cv=none; b=a2sbXpEpvQwG/jVHA4Pf7fKeHRaB2BB/up5QQ4L64HV1mUCACtmwDUErKhsgLm3tVrNjhGkk7jTTrniq/QEr+QgnEsGNLiA6s27/RGl/Q37cG2AmjPt01BpbonpU4g2VoH/Hk2gXnipvMlLze5zg5q4oP17gbKB11YQrtNWJNMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730671819; c=relaxed/simple;
	bh=YfV5iYFCey8uL8RvVFXKpCmMrpkP6Yn7Yg2LpgeM26E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEYiP0U8610qDSoXeS5EFz/o0XqX4CSPd51iXRWQJ/CPDcJ25hd8v5rwd0j0jb/EQr+HMcHPPJh4H4T6dyZAMwSa1i0+PgvaSnJFP0vkgoLEKTokKQ5d3lnYFYgrAUuFADzmhXst1ScYM+8fhCUvjtE3EddXrH702f8Xm4foEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GAN3eosy; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GAN3eosy"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-715716974baso2115671a34.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Nov 2024 14:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730671814; x=1731276614; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUWYuqtR3aHLEhG7mg7lZrCRFDuphm1pLOvMuWzILNI=;
        b=GAN3eosyRJh0AFz/pr2wDs5cVUZrnaoJiiWcY5ZJxwOKRVymCxE3ofTTnjNhOucBgD
         Rig0TIqh+s5hyk4t6kXo8kJwaYti+T/2SpC7WSQuagxGcRBhke/BfHeOskMupnxgDa+D
         k0zIy31yRPUGRos/A4Td8wbMnhFhlwmt9Qr8VNTHaH7hCRR0toVqUG3WcrvsXlcN5eQx
         8S1L1D5KCslZQp8BMhCzqoxpS1Z997injzEO7zTTe08YwsAwcxHG1ql0fnuxqHVusE4L
         nXe+Tg2bFaxhjghA3ksH/awV/bt+E22JWYt4xtJb8F3B8H/DvC1f+sP5xlxQHRz/JS7k
         Xscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730671814; x=1731276614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUWYuqtR3aHLEhG7mg7lZrCRFDuphm1pLOvMuWzILNI=;
        b=tv7BRD7KjrcbGvyQtF67rSDWKVPNwVg50BBk6Za5gHPos8NccertAqWmWFUAuHSKc/
         QxvqW8BiNfSIY6OspaxW6tAKSJTG7rQl1o0lcTgqHUE9DisFEmBhyhvTZrMhQPUVtztT
         S7tJmhcDVnFqZ7DvgTiAoGH9tquOQDHURglKgqCEc4J7dyo42Mo5/meKvM0J+uDhKii9
         Ni7ML/o1A8gLerbRp1Xa5lz97vlgwkG0aPgOnLPLaOinlv0joRcvee3ZEfo+lFCwiFdi
         sTA7QreoD15Xg0EH1z+w2qKxwGKGgTG12LmAg3yX5L+vrj6uN8wQfk42OExIkmrBOO7g
         CGEg==
X-Forwarded-Encrypted: i=1; AJvYcCU7e47FQ5qD5DjpoLPk8HIERGAa2GwtSv9b+OmCy2OftUX1eefRG+BT4W+5CRjZ1EY4Rhn1xfgLqyBN+UCk@lists.linux.dev
X-Gm-Message-State: AOJu0YzsozbBIT5cD5esXpuoesvPgU6UbBJougDGrqIPV4ZhG1+1nuwF
	p/delwpc6noOfLNDZmh/klw50oHP70qGTd3n6Cwa6+DsAasep9xpsW1zRRUHgHs=
X-Google-Smtp-Source: AGHT+IGMfVh9LXk0iaYFioOzlB6HVEvHUV0T09OtRUqjTerOH+6ZJQ5jtvM98lKCEUKMBpdWBa6SFw==
X-Received: by 2002:a05:6830:310b:b0:718:118d:2be8 with SMTP id 46e09a7af769-719ca25bdd4mr6851108a34.28.1730671814414;
        Sun, 03 Nov 2024 14:10:14 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7189ccb15c0sm1745498a34.60.2024.11.03.14.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 14:10:13 -0800 (PST)
Message-ID: <88b1e5a4-a962-4ef3-abff-724af2f6c09e@baylibre.com>
Date: Sun, 3 Nov 2024 16:10:12 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ad7606: finish pwm_get_state_hw() TODO
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: kernel test robot <lkp@intel.com>, Jonathan Cameron <jic23@kernel.org>,
 Guillaume Stols <gstols@baylibre.com>, oe-kbuild-all@lists.linux.dev,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20241029-pwm-export-pwm_get_state_hw-v2-2-03ba063a3230@baylibre.com>
 <202411020101.5Hs6MkwQ-lkp@intel.com>
 <d44ab5s73kmochmwis3buhd6ci7ff4rwd7kgh47aqar6xeyqna@f4plwf6qbvlm>
 <awpjqzq2ksbqvlfkbh4xnpwqxrnf4np6amifdweasrh52v3jl3@lz3md7ydyhji>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <awpjqzq2ksbqvlfkbh4xnpwqxrnf4np6amifdweasrh52v3jl3@lz3md7ydyhji>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/3/24 2:20 PM, Uwe Kleine-König wrote:
> On Sun, Nov 03, 2024 at 03:00:14PM +0100, Uwe Kleine-König wrote:
>> Hello David,
>>
>> On Sat, Nov 02, 2024 at 01:50:35AM +0800, kernel test robot wrote:
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on 6fb2fa9805c501d9ade047fc511961f3273cdcb5]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/pwm-core-export-pwm_get_state_hw/20241030-052134
>>> base:   6fb2fa9805c501d9ade047fc511961f3273cdcb5
>>> patch link:    https://lore.kernel.org/r/20241029-pwm-export-pwm_get_state_hw-v2-2-03ba063a3230%40baylibre.com
>>> patch subject: [PATCH v2 2/2] iio: adc: ad7606: finish pwm_get_state_hw() TODO
>>> config: i386-randconfig-141-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020101.5Hs6MkwQ-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020101.5Hs6MkwQ-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202411020101.5Hs6MkwQ-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    drivers/iio/adc/ad7606.c: In function 'ad7606_read_raw':
>>>>> drivers/iio/adc/ad7606.c:765:23: error: implicit declaration of function 'pwm_get_state_hw'; did you mean 'pwm_get_state'? [-Werror=implicit-function-declaration]
>>>      765 |                 ret = pwm_get_state_hw(st->cnvst_pwm, &cnvst_pwm_state);
>>>          |                       ^~~~~~~~~~~~~~~~
>>>          |                       pwm_get_state
>>>    cc1: some warnings being treated as errors
>>
>> The problem here is that there is no declaration (and implementation) of
>> pwm_get_state_hw() with CONFIG_PWM=n. Does it make sense to enable the
>> ad7606 driver without enabling PWM support? If yes, we should add a
>> dummy implementation of pwm_get_state_hw(), if not, a depends on PWM
>> should be introduced.
> 
> Looking at the driver, the PWM is optional. So I rewrote the commit from
> patch 1/2 in this series and added a dummy.
> 
> Best regards
> Uwe

Thanks!
