Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962D273817
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721018; cv=none; b=QnMW2Y94pNHf3HBBHKhdCnDHJOM+R1JAl9J6rr+UfqzDKD2WnOxv00ohZ2Uq65hwtk6QV8mSLw8U0ANJc3XpyvHwwR+YtuVPIRqb9nSNY5VB6owrGWotv5oA0zEIuTUciSVCedfsly/mA2w3wOVXDgcHLDNjpFswmVL8UsgfO0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721018; c=relaxed/simple;
	bh=rhjEXzsTwnZFAF5osPavXR0nQ1U3valXq3FCuGUvhIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfgcfFABqFjrd7cnaZRgbworZ9J9EkHn4SIeho0YqIg3pZiAGMlSrujKaBTB3P1XzdyLsGccjX7cdj8CLGXDWykKRwkGhK7p1qg5tE3M6d8ZyQjI1J7Jbc+9YFrXseM3XDWeuYVCb3sluJNr1Z8R5yH53FxhpgJXWk7lwXMBlOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=M+LtEjuq; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="M+LtEjuq"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-87c04c907eeso404652639f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753721015; x=1754325815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=M+LtEjuqYj8+IyVHcxFRrhATZws6rv+GueMpicyMo+3VJCxZ5bANwpxXnYKYUxrZSL
         gLgfl6EZpa/m/Ex8aF1+K6TNzHDMo8nr6KfYb7HNE3rubf0wSC2itaSmBChFLGOZEG8P
         PDW7ucoDk/C/eRAJWuiC5CAw6C0pjr9pq5EECHF2Xf/wWznWIsQODoxCQt0Nked8suaY
         FCuxg77M+0d2M3DUJfbUoqLKjsecZhq+QZEbJk/+cDM4u3UOi+VcNeBfFy0zZg37CqGF
         NdgeRkyjIW9FqE9Bs9c2Zx7AijMVTqXwyUEPIbIJ1A5WEUgcGNNAvIHJdy9Cu427UuFe
         tQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721015; x=1754325815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=f+9b26C9KbeUJN3KGHuFe9K0BPWoqnfBuuQc+Bh0fE+JkbsztHU5Xg5lGGTov2QDmS
         XJ2Pk3TQh0ayAKJwUoApHqKT+/nRka/zToOnnDB/hSduev+QCKNU2PdilaS4Tyl2aBoC
         Bk4fUT2RIinfTERaCde6ECTf+hXwY7kPzlomkcd5LCJCnDhzVlO0fEkQfFuIR3ZD2Cvd
         AQqnF8FUnsBUs0G3zpegxw+wsw8Yr7ltxhID8BZlCrp6cBwPdzS1eBJpV3WgpGTWZgf2
         R638bJWYEzW45/0XqVz1PvWufGA6TS9Sjmf43O2ua787LKnzJ9oXVlaU+EH64dVtVG6w
         3bww==
X-Forwarded-Encrypted: i=1; AJvYcCVRuX4npbZqkpt15On3Rii3S+8DRZadmp7CzEt7zGg5X9JTCvaNlhPhr6zP22Qv6buHqcdRLQZCyLv/Fg3z@lists.linux.dev
X-Gm-Message-State: AOJu0YyPZND0FETnGZHpbFBUeDFm6Fn5nB59uLVuYv/d3CvMe4vxXpbt
	iKEa7sawpKnlKFD9NzOaCTFzTvGrGp73l4A55S8MP5E1zKZybJoias5C38qUuYTLpg4=
X-Gm-Gg: ASbGncs/qpjgUbIVhQXVWGTonphd/HbSTIqMsAu60sHHINI1IJzIjp+gc4kJqRsQW7w
	NVlFz7FrRRycELIy6l2L6kXEFzuqsKYA5vAn8AvZ77IMkOqf18XvV7VvZhtslWE+BrKgt9dIYu8
	Poxbi4cmhUt9vP9YYpJw3YATsQsQMPxm9RpTuQA9a8KNX1kdQNAOc/XRlFNMnrLe3SneAk+0EaI
	nXmQzfCh7F/3XIzriydjbyNCsRIXQfjOWUKBg9PRhChIFO5kcUXgiz8rJsCF81hI8bYiwXQHbDv
	xXCkT6LFbepvvUGmHfIycdSc0Wgr5PvIIC2wm8ov+EO9ZlyHiTyK/31H7af2Bc+h9lCbuMbNOWK
	WtoGA1oZZCH3dnK4aiS67wiuwrO8JzjC0PfZ0FDdSARdW5TGYb8a0idtRf/zZt88=
X-Google-Smtp-Source: AGHT+IEKf13G5VVtKix2Gq667g//FiBaGINonaogdX3yn8hZwcFv6711Pe8N6gMwP+Vbi5i7MjtaZg==
X-Received: by 2002:a05:6e02:1805:b0:3e2:9f1e:e291 with SMTP id e9e14a558f8ab-3e3c53125b1mr209554715ab.21.1753721014595;
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e3cad13c7csm25861755ab.61.2025.07.28.09.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Message-ID: <ef2b4526-3725-4a25-9118-ab77a1d91362@riscstar.com>
Date: Mon, 28 Jul 2025 11:43:32 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1
 regulators
To: kernel test robot <lkp@intel.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250726131003.3137282-5-elder@riscstar.com>
 <202507281558.lZ0NYtth-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202507281558.lZ0NYtth-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/25 2:37 AM, kernel test robot wrote:
> Hi Alex,
> 
> kernel test robot noticed the following build warnings:

I have a fix for this, and will include it in v11 of this series
when I publish it.  I will wait to do that until I get additional
feedback.

The fix is to make REGULATOR_SPACEMIT_P1 depend on I2C, in addition
to ARCH_SPACEMIT || COMPILE_TEST.

					-Alex

> 
> [auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250726-211530
> base:   d7af19298454ed155f5cf67201a70f5cf836c842
> patch link:    https://lore.kernel.org/r/20250726131003.3137282-5-elder%40riscstar.com
> patch subject: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1 regulators
> config: alpha-kismet-CONFIG_MFD_SPACEMIT_P1-CONFIG_REGULATOR_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507281558.lZ0NYtth-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1 when selected by REGULATOR_SPACEMIT_P1
>     WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1
>       Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
>       Selected by [y]:
>       - REGULATOR_SPACEMIT_P1 [=y] && REGULATOR [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y])
> 

