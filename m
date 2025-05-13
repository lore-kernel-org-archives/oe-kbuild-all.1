Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703731E1E06
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125890; cv=none; b=tlZIW1LG4TzGB60i4nNVuNBSDA6dOEczqxeJyQZu/NHT4oBC5NHRHjirYhEO+/moFUkZvUHav0u8N3pS5p+2jqifZO9mDqU9qzxxIT655gNjScM5MayScpU0piro8m/xTSoTt/mnE7y0W8Ehlln0J8Obryp4YDI8Dwt0uzdNUFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125890; c=relaxed/simple;
	bh=rsaKQs4K1djvMy11y6HRb1i4tTMkgggzE5YFXchGPsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nykm+VBU6Qwkcy+pUuNOlB3GYvF5ZEPWZ89I+P3WqGo2uFbEpckUf3wI4vc9Mn7JuI8i9nWkO9MKUS3vUzGI3uklPrv5bdnZ8iJejs71TfB4m7n2DMFwq+Ioboo7UM41Ls+lBhogh9Strv/qNsPjC5IsssCrwShwEr+cP0w60Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8agqcJ+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8agqcJ+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54e816aeca6so7545615e87.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747125886; x=1747730686; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/mMlyrcrj1DZJWRA7Si4O9nxfUJRo0CA7NsYn1buv8=;
        b=K8agqcJ++z1u9roNUHwiNDdHuvAeMqq0k+bz/iwkgetr96QWOta9zpSh+4mMFG/KpY
         omKQjsvIPvsUKzDMuwyMaj/duZQCYIh2kvXoPcOujPr4i/Tx9Ko04jFcLEBPRSfoON38
         peAkzYl5w4bPDkU6Xqog8pi3jGiejqyUD7Tu17iM+tXowz7V+pkVz64QPxhSYYemNANc
         PhlEtwNcs80hQ9EJ6IygHed+XQJZ7/zA7rceJ6+NfwEfZnlfxt+Rdi0f8ODAxUnC6vD0
         PRjjSwKLBkrAXa1MCOdIIfZ6+B97c0nBht0b2GeOaW00t4rm9HOjypk1Ocr7zCgMXonl
         IJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125886; x=1747730686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/mMlyrcrj1DZJWRA7Si4O9nxfUJRo0CA7NsYn1buv8=;
        b=QEW3Y4OdZbKkbqhurUU6RiUzJe7wB7j4MXA6Y9LRPIMzy9/BGgtuqTg3e8mTV+65We
         4qHk3D71RBqGuE8FFEtM19qktRXmuV60tR259aH1KdL+44V32U3IpOXfCIFiHN1kMsVU
         lIHtlm3asxNS3TEVwBiO5Plyqof1CDOKmRpuLV70B6kUTCoNIhVnFNE5R2cHVpW2oyp0
         t1s8/SzzwW/+Jsl1ElyS2gkJEsKkfjiGCx34D6/wbOCtNi+CuBBHGQVTxtHVUZSZaD3Q
         T7CaHfxhPA5Hjk/6+e/tK0gjDcAgxP9Gxp2gP4STvAoGzfnEIGuYxdeiHer21BAIjfK6
         gOsw==
X-Gm-Message-State: AOJu0YxqbIOqlyv0Y0tVmf69ZIiY8WNOuEwhusnJz/O0zZXPHbs6/EM2
	07owenBFyUvu9wFGtli//l1oh4uJW8QZeDR5NrkqXEO6T6fU3A12
X-Gm-Gg: ASbGncs6cX8Pwb2KBcyRQocloDMx7R33HD0RxI6lmwPePQKCl1vwazAOyQMl9NlzsGI
	Z1g03ATLfMtQCe8Q74vLMhq6aff5st0cqmq2CQhvxgKz9XfrsN2hF35voFlrKBLbAZR25vFb2ng
	LBs58FGrkCEdDf/u9bjzec4NG1+rk0j4DkMW0WCelLfwHSaZG1Culewgi5CWlsgi8uyaqLuap8J
	Sf3vBPgW4GgLPqAVhOtgstbzn7IG95aObQtWZbAV0txwbL+GUm1GXJujAOiD5RNGltO5fWEOAa5
	+Ds7zW2nzzMHuNeVqwIbNNc5zNQS+jO75NaB+YVYXyguh3GAo4IlVVzfKYPEWdoGZvn4wGRlDjI
	NLMQc4yx22tQ=
X-Google-Smtp-Source: AGHT+IE0INsiXd9JPWSY9AvmV431RVt59UdxkcetBzz2qpQTgfQ3fEnhDFP09c/AIuULnWGCV9BlUw==
X-Received: by 2002:a05:6512:4201:b0:54e:81ec:2c83 with SMTP id 2adb3069b0e04-54fc67c2180mr4957570e87.18.1747125886120;
        Tue, 13 May 2025 01:44:46 -0700 (PDT)
Received: from [192.168.32.20] (public-gprs411161.centertel.pl. [37.47.237.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cbb12sm1758394e87.213.2025.05.13.01.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:44:45 -0700 (PDT)
Message-ID: <f5594328-11e4-4310-b961-41d8ca0c8116@gmail.com>
Date: Tue, 13 May 2025 10:44:43 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
To: kernel test robot <lkp@intel.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20250508214305.836406-1-titanv3585@gmail.com>
 <202505100535.vKH3zHW6-lkp@intel.com>
Content-Language: en-US
From: Vadym Tytan <titanv3585@gmail.com>
In-Reply-To: <202505100535.vKH3zHW6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> kernel test robot noticed the following build warnings:
>
> sparse warnings: (new ones prefixed by >>)
>>> drivers/hid/hid-playstation.c:1773:25: sparse: sparse: symbol 'dev_attr_dualshock4_bt_poll_interval' was not declared. Should it be static?
> 
> vim +/dev_attr_dualshock4_bt_poll_interval +1773 drivers/hid/hid-playstation.c
> 
>    1772	
>> 1773	struct device_attribute dev_attr_dualshock4_bt_poll_interval = {
>    1774		.attr	= { .name = "bt_poll_interval", .mode = 0644 },
>    1775		.show	= dualshock4_show_poll_interval,
>    1776		.store	= dualshock4_store_poll_interval,
>    1777	};
>    1778	

This piece of code is expanded `DEVICE_ATTR` macro with changed variable 
name.
`DEVICE_ATTR` is defined as:
```c
// Reference: 
https://github.com/intel-lab-lkp/linux/blob/Vadym-Tytan/HID-playstation-DS4-Add-BT-poll-interval-adjustment/20250509-054413/include/linux/device.h#L138-L158
#define DEVICE_ATTR(_name, _mode, _show, _store) \
	struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, 
_store)
```
It doesn't use `static` so neither did I.

P.S. Macro was expanded and variable name was changed from 
`dev_attr_bt_poll_interval` to `dev_attr_dualshock4_bt_poll_interval` 
because this attribute only applies to DualShock4

