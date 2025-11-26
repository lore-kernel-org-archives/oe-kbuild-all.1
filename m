Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E041287517
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194696; cv=none; b=AF0vTlg9p9EZi2kAcKWR7GmIlxgwvDQzlkmJ8BDg51hwNNfT4J4/Uf4h0khY5Tpy2n5FGPtobbNc28rWCRpMS9SI+8QSmqxqziTnebfDZwZPafrt6hDjZwYweOoqs3DMRLg2Zn5bEbbagJg/7Pp69vXmanHzzqXd6xMI+lNrGII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194696; c=relaxed/simple;
	bh=gqLSwHsrGZkhN+aFNTbmKSZgZc3SbCkcYs3ExiI7vJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiQ1Z47ILgDifMKsV+NsUX6xGsoUI7By0yRC8tPWjpt4yVidxjti0XXmqJyMFCLopk0SDaxEBj7n4aVEZhRrOBOfBb9uxfup63JMEfWih1ejynj4NXnr2IkiZeFaaJr9pWA475BptN1FUYLIVhtKedpg7fsjE3MMNcFqTBL3Y5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iEGOpzmD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iEGOpzmD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so178866b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764194694; x=1764799494; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=iEGOpzmDKPoywbmtRpWdhQRuW2VrJj0KlbHGtPp6jL+YPRHoYCkuCKA56lRISg0ODj
         t8WFViJnPaPwlKS5OMp0spy2siMF6wAdjZX3Ik7RrnfasPt89pjc1thBYEHpnXmaaC0C
         FOL+pYSt7slVKlcO7z5Bc38eh0b2fUKg9iJc1Ed+uXBzgBCxoBgLUVLadJ/meBIsZoin
         3Ddv/f65qtLvuFZR5wBJfR4jgZX/jbjOcjslOkJl3S+r71zt7lp1xOSpB/ZAU3+r8MWh
         /AauVpOyxu0nDsbCWLfNu2WwxmmM9931OZngoAuygfYwmCQL9ttwllz9H7J0YKEet1G1
         2zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194694; x=1764799494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=haYk8KmiIYX2o3UN4QmFeZduFSaJznz1RjoEp/ojniZa2fn9IBt2owOVZ+Q5K+YfA1
         570ymk7DSUxkJTaSCR1ZnoGcw0IRDOqJz2OWVd6P+zANVzRFwFGXLz1TC4ViKxPG4XyV
         Gv9x3jo6ksCGvlmZ81MI2/zMdXk6wSEfPL+f9YY0pAYqu8g/MizFxmcEi5DFvsR8+5rg
         tFiO9fIzpiNjTrK/mqdOpIxDE1O+y18bc90gXkKY49XfZ3INhdrYA0kAADGXAHDHepKI
         ncFeKcyS2Y3fHHFrBfs3IckEKWatprYXSoarqlZWCh1+/929LKx8RMmzpDTthsDeIY99
         P98Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDjykniCS3EevVUoEzLTbEZIH+ksiZ87YKcrdKhB+hAOaXxZK6D6Dhzq/ZkJReIr5l156pE1XpDDsxDBF5@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5YwCQ0GQOzqqWz0F7bSJ1j6H0Cy6ofBy3Itg23IzPhSock4fw
	z3XTJ05rum3dxKc/1FgN+pUQQCbs0yv0UMK+PB5RV+RwGwRr7H3vYXrxekYS/6LsFQ==
X-Gm-Gg: ASbGncut0lPzOM5LnYK/PJFXSwZo9qE16Nu8fL2X34K7vsstb1+cNCs1qCCTqMNWvJt
	KfmsGXssaUezuOkYEn2NxG53ZNdZKiTj4Sr1CigHdnJrwV5ZY+3NnubYUGhgHMgfNrdEdFU9Bbj
	uNHZcw9tfHLwKI5+uRjHIXzoQEUS+HEI/Bt36rzZkLjeOWuPbh1OuauM/JvynN19qSZsO1DDoz6
	nIvG2VXsGfEB17cgpsnR9P39ZV7Qs7AFvwgL8xTkJnk+OHBaWRFrw7/GFcedNVNqcHNxefm5PqN
	bJnVwfAEO4eqGEtCtyFAP2Nl7PgJQXGczgkxoT4SAdpdAkka4AZenaOUSJTwpxfWRdPcxAVq2sI
	3mVUtYR4j5Xc1D9TePES3GnZnbIdTfObxBmjwhZf5NEpLrKP4v9cmcWpxydA3ZpNdeNH9eAWceA
	oWvRYAqfPC0IrxlPCbnJKb8kX5pFYQ3mAxeNKOrZW6nw5OR8SwluUc6AMfGOkbHX1tph5/RQieB
	wD+6YiyHkn+rQ==
X-Google-Smtp-Source: AGHT+IHgCBAVlJ/1/Oj2H+nvmtjVOEfs8Cj4GuvQ7p3t9lR/WHGAMof8mvn31hs8D+Fx43GprBkfMw==
X-Received: by 2002:a05:6a20:244d:b0:343:64dc:8cc with SMTP id adf61e73a8af0-3614eb15e9fmr24287915637.12.1764194693250;
        Wed, 26 Nov 2025 14:04:53 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm20451772a12.4.2025.11.26.14.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 14:04:52 -0800 (PST)
Message-ID: <be908072-fd0a-48dc-97e0-b120539f5584@google.com>
Date: Wed, 26 Nov 2025 14:04:51 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] power: supply: max77759: add charger driver
To: kernel test robot <lkp@intel.com>,
 Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-5-6b2e4b8f7f54@google.com>
 <202511261521.hSYp4ttf-lkp@intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <202511261521.hSYp4ttf-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/25/25 11:38 PM, kernel test robot wrote:
> Hi Amit,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 39f90c1967215375f7d87b81d14b0f3ed6b40c29]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-power-supply-Add-Maxim-MAX77759-charger/20251123-163840
> base:   39f90c1967215375f7d87b81d14b0f3ed6b40c29
> patch link:    https://lore.kernel.org/r/20251123-max77759-charger-v1-5-6b2e4b8f7f54%40google.com
> patch subject: [PATCH 5/6] power: supply: max77759: add charger driver
> config: um-randconfig-001-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511261521.hSYp4ttf-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `max77759_charger_probe':
>>> max77759_charger.c:(.ltext+0x27b): undefined reference to `devm_regulator_register'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `enable_usb_otg':
>>> max77759_charger.c:(.ltext+0x983): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `disable_usb_otg':
>     max77759_charger.c:(.ltext+0x9c3): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `usb_otg_status':
>     max77759_charger.c:(.ltext+0xa06): undefined reference to `rdev_get_drvdata'
>     clang: error: linker command failed with exit code 1 (use -v to see invocation)
I believe this is because of a missing "depends on REGULATOR". Will fix 
it in the next revision.
