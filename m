Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BF228C031
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295572; cv=none; b=AxdhFHygS3vLAhjP88VJtLtMNkqnFm79X3CgKbyntrQaYD1UBb1+9J/BM80XDhgOwtBfe9kZLQyTsTV3ydVddVUnSzFMoy+4LehDG7AUPHme4B5gOKCm/jCcfw9Rr5X974aTPGMpT6KWr+GphKUL9ih5FnyowcVmaX0eUfpRLoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295572; c=relaxed/simple;
	bh=kHZG/SAHtaCXvJPooJ1iE8nE6vSy8XcqduQc3aJRiIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lG7+pE0oFoZJi94qP92VwavgcVtyfsflDe4iIQg1piPt/eDr1RV9rh7LQK0Rr5SMlPZjDWjZzKw6txJO16lCxqOCrMSJpmxn/foxB4RYWvD43tWOrj3obPkh7of1OLSCR5MU7Pd4Yzvhmda1WSiIs9L4j3Pj/XpXWAtW6gC4C+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5MYW/Oa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5MYW/Oa"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb5ec407b1so398299466b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751295569; x=1751900369; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZODcrcofm3wCiChuUI5ZxeqAT+1tWcc0clYojsHPHM=;
        b=Y5MYW/Oau6Iuo2xmM1MguRugFUIJ+ubPlkzpfbn5U85KL5LUo76oFlZ0zKnCTXuW8k
         SbWxJLEQ+jLxMEpBROC5YLtGtH+djGgz4QjRgKmeL3GYney/KwmvzCBa39o1NoEfjy7G
         BNOY5IxoZDdnozNmZ/Vb6cMLw/JZm36l0lfXz/Ny0ilzd2S4g6ftORdGIzCXUUNj6VWx
         V6qVtw/As7YYspP6G9YsD0EHZdnbetLKCevvvmH48lXKp3hVG5movktdaI7oDlsgHr9Z
         LeXxepSUX/lR0UGQMS2IHd8l5ReMsxYfxFuCHmBuQZDJYeu4ps2YO8/0NJsFyfJwfqaP
         dHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295569; x=1751900369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZODcrcofm3wCiChuUI5ZxeqAT+1tWcc0clYojsHPHM=;
        b=Sw3KFCuz8ncJgNO0qxkLLIsO8jT/R4jNfdTrk2AQ7zSpGHk/qwus7qduRsDTEJ0tau
         KUrV6b5Ep+fg887FeJ6phQmBuyfYad1xCFXvcTVixgCFI1on7012NdIfyRPcQTwU7fnS
         1jTgHqtpamt+bF08U8gcjX5427P37jqbjXo+50ZRn/uEsKXCQhVowWmzZs/Bm8DZtVoH
         99rjqHPAvD8KIzYmvkDElq875HCvzceFvTjikRm8TlIksSHnZJ7v8TFRzXKzEtVAuyzp
         EZP6nLzsIaGWzuzrIZEggJmxH5tjSV2kVzf23fhaO3qclvudSqCglFqy5z6UQZFpC6Xf
         WNHQ==
X-Gm-Message-State: AOJu0YxclS3mKeC86Y+zjugJSAxVsmH2+pBIt0G+0eNhHTJSgCT8h2Z5
	fUTxRoNHyMZ73bvg04Tr4UBobk3aDL2tWl0Y8IIXS5eyD9F2iIFXrbPD
X-Gm-Gg: ASbGncuhJx6+YiqsRh9bnNi0j1/Rb+EgIDeDRoiEK/Cv+DVCaGfgZQZnwqnEAnGseQj
	iS/784B6cmIr523eiSN+3DOQZqLPeurSZwbW9hquTwIHE6oSu2GT9/OiVkh6Db/hOadgfjL5qBo
	qFVKUdiN697YWxow9yD0crH8zeYA1yLj2PXIY++buxCelXLXuU2sfpfBkaQ/xtqj+DCJVn9xiS2
	NnrWDlbBbNBjuyzxyEbHp+mM6jy1jHfmtfL/QzYw4f9G/lgPKsfco5Png51T8nbAloKVrdO0uD7
	7kRHb3S3E8RV9XzJFRK8cmnhbHQzCj/flER4fifdqp4/oFnAuR8E1YIzsfkuLcRfC/ZYf8najj/
	NnnKvVnmHaxM9YexV2KIFbA==
X-Google-Smtp-Source: AGHT+IHDFRjJ772iqS77I2LkwKiaoRWD8c/M97Vl3pT5NO8QRHrk7P9+uiILla9TUhzZkDy6xm8HbA==
X-Received: by 2002:a17:907:3e8b:b0:ae3:6eb9:60d0 with SMTP id a640c23a62f3a-ae36eb96270mr904600566b.42.1751295568458;
        Mon, 30 Jun 2025 07:59:28 -0700 (PDT)
Received: from [192.168.32.20] (public-gprs411093.centertel.pl. [37.47.237.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a00bsm674931066b.43.2025.06.30.07.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 07:59:28 -0700 (PDT)
Message-ID: <e33f4cec-dec5-41ae-a1dd-aa6953604526@gmail.com>
Date: Mon, 30 Jun 2025 16:59:26 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
To: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 kernel test robot <lkp@intel.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20250508214305.836406-1-titanv3585@gmail.com>
 <202505100535.vKH3zHW6-lkp@intel.com>
 <f5594328-11e4-4310-b961-41d8ca0c8116@gmail.com>
 <cce2d94e-8798-489f-8c9f-68f021bb21a7@cosmicgizmosystems.com>
Content-Language: en-US
From: Vadym Tytan <titanv3585@gmail.com>
In-Reply-To: <cce2d94e-8798-489f-8c9f-68f021bb21a7@cosmicgizmosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Should it be      .attr    = { .name = "dualshock4_bt_poll_interval", .mode = 0644 },  ?
> 
> Or did you not expand the macro fully on purpose?
> 
> Thanks,
> Terry

Here's my own quote

> P.S. Macro was expanded and variable name was changed from `dev_attr_bt_poll_interval` to `dev_attr_dualshock4_bt_poll_interval` because this attribute only applies to DualShock4
So, yes, i expanded it like that on purpose, as it applies only to DS4, 
and while being attribute, it applies only per device, so no collision 
is possible.

You're welcome
Vadym
