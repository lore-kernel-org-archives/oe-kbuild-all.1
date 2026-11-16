Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853147;
	b=IH8v3UWC/ERsDRfeDe5p2Z0+fK3SMpGnI9pypjds8jYiTu7YsWse2Ro2vmDkC9pdliPI
	 fVNg5k1FDlfXM0Tz0LKtFRb2nrZCGALqABlEIRwnbWQ3MpceYKrTkccQOqLyCiUu/eh3N
	 smClA37aQvldIuUQUlg/778zvL5nfRXCBWRVSj4WTW4+FKxq4kpx6qUe/cjgJtjA2a5Bp
	 f6dDwfWk8hZJp+RhbjGbgU20csCUKDdxy9SncMuVP5c5BEHp91bsor/c88QLJK+LcaPbk
	 nf+ocvfmJw2Fr/eoeDzJ7QM8e1aqJpmF+Un1ThdYQDEi6nRgNv4ofVRyxY81wR2ybGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853147;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=GNB6X4OzSB8LK+0Gokszgl5m4DxsxThGsKHtJwkfWHo=;
	b=Qw3IsL8atv+WNfq7OJYiYr5eRNyQVh/FPmO/sRBw1nY6VUOsMsb9nATA9eB2LAtnDOfC
	 tgucb11x7hKbd/v+VAJQfl7TwtpNXYNKhPvMIw2M2XZGmJCVB6Mp3pvoSjndDIrS3P73t
	 uMLZA1xwu76gsnmjucKMJmK33oowTOV+hsG9rR7hSnP1D7NfQB68BBfAab9n2iiouwCo/
	 A3mEvWLvs6oBrKn3aUALauOSuyLD2TKEB9fkmcvrXk6+kKwRuD/zWCepqlrJ+LMd+2inx
	 nPsO+zCxw7kCnGhsG0d3cqa3EWp4oOe2cJeqv7bOKIn84m8RAycWwYZQKAOq2pK7Oxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O391PLIP;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C0606A322
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 18:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 888C0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O391PLIP
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2081643a12.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 10:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853146; x=1795457946;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GNB6X4OzSB8LK+0Gokszgl5m4DxsxThGsKHtJwkfWHo=;
        b=LiGw+GrfgT4utUKkyQkKF9r2NPOTBsqIJ0Cs+s7k1fEi4q7/7YsCTIG6paf4a3C/8k
         V1on3RNIEWHVNhsyEAC4DhrF9H/no/mqXHiVc2rsDANxYm1XSfZmOodPAQswbmygrkei
         QwmYqWgHYEYFZeKjo88G1kZ7/VXJAOSDe7GbRffX/okzj8sHp8eUUNz0cqkwSQhqWyeu
         m+cHEFeEMnjdOVmU7tt99LIwGY1ZP503W67sxFJahz3dE9Hi/FewUaSRFzaOfboFItg3
         eaVPJRZyJaEXmaYclOMenoHE3ib44HSxUZxudy9XQTGhSUU8h7wVKz1mTAv2TjaCiNnF
         Wq2g==
X-Gm-Message-State: APuU4Z9vDZKrvSIDwXe6EVe0qcBiEn8buxK1kXQ1PVvYXXv3GNFRKBZD
	sSFB/O8hddNUNxJB+RsHmh0YiHcAj0oKeTAZlNY6zvR4FPJygl4JT3NPwYf5MiNgVOCq00D1EaH
	utQkQluk/KmfPt9gjzXW4WOTjY4BMyIiSLlZLmCRf21NIqpzbIE9eKNQdTJqCzQWr/j0VBjXhCG
	brU4lTg2YiHaGjQjTMBCn5KLhP3v4q+6n22j2i5q9wUSbyWo0scojWVnFuJEBYRsXcZU9y1GT8Q
	TQyivNMJ3lBa5bQcFUiFxtcbA==
X-Gm-Gg: AZFdTZdZvskZyABC23UfdDZrtgBmRK2tzIhFaPCpaks+IaKIX66Uv7W48haWlz9l0d1
	dbJl1AdKM24u0Sc/fINxwUxh8UVCLS5wy+pV59W8BOll3Fsh/EFm47cGxsnX6ujrSSFq3PuFWUD
	5kiLrEV6yZkRiRdZKNArWTPS1/Q4GTZEYEdXKhCkLBt/fdi1XWDfpdMgCeHgHKaLTYQTbxfXlVA
	YfoEmjehNramB8sam53eG26mogKOQcL+VA3bPqhTftxFDgF0iRCmZRXHy8kYlj6e0eN3bDHgiqg
	8C5V8YvwN6c4gTDYFpKBQ/jgMrHYVWPXC+3MOi9lZJgVnS7iB3fVdxlV1DK3HeO/4xMEM+VWPiT
	n/qlkLyEhLaGts9GAjS8/w1e0ZHKkTgEJONYW1blGKsH7b9KaWZ143KfNVRVr7niOrQfLM6IQfT
	1uqkGCqsJzaNDQLXuN2tyPwmpjj122TTmWBKNmdZfF
X-Received: by 2002:a17:90a:e7c9:b0:3b0:ce1d:3398 with SMTP id 98e67ed59e1d1-3b1b09f3b5bmr12101528a91.18.1794853145410;
        Mon, 16 Nov 2026 10:19:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b2188ff4sm3759631a91.0.2026.11.16.10.19.04
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 10:19:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so339864685a.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 10:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794853142; x=1795457942; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNB6X4OzSB8LK+0Gokszgl5m4DxsxThGsKHtJwkfWHo=;
        b=O391PLIPu6uVCbX5GF+hvMczc/Uzuw7ypfhQ1VApmzX5Sm4QRKp4ET46+UML3na14P
         GPB1raEyK23wg5y6j83kSS1cjmgEt3WOYY92CmK2Y6o0pJU4dSYyIsDWhEDBLguIV9GW
         S6Fz2UhLvcWkn9gLkTLAOHnld3/WoMXZdnxpw=
X-Received: by 2002:a05:620a:8904:b0:93e:c12c:f137 with SMTP id af79cd13be357-9494bbbff0cmr1670446185a.82.1794853141753;
        Mon, 16 Nov 2026 10:19:01 -0800 (PST)
X-Received: by 2002:a05:620a:8904:b0:93e:c12c:f137 with SMTP id af79cd13be357-9494bbbff0cmr1670437885a.82.1794853140933;
        Mon, 16 Nov 2026 10:19:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c898badsm904767585a.30.2026.11.16.10.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 10:19:00 -0800 (PST)
Message-ID: <4f81fb9d-1fd8-4a02-ad49-d7db7afd9b26@broadcom.com>
Date: Mon, 16 Nov 2026 10:18:58 -0800
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [broadcom-stblinux:drivers/next 5/22]
 drivers/firmware/raspberrypi.c:221 rpi_register_hwmon_driver() warn:
 inconsistent indenting
To: kernel test robot <lkp@intel.com>,
 Sander Speetjens <sander.speetjens@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202611160006.Lgyh7ZuO-lkp@intel.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <202611160006.Lgyh7ZuO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Sander,

On 11/15/26 15:24, kernel test robot wrote:
> tree:   https://github.com/Broadcom/stblinux drivers/next
> head:   0cab822bca7a59667774725b83e948b71462290f
> commit: c518d43026b6ca7d08fd9d3b23016b9f5d09f47c [5/22] firmware: raspberrypi: Store child devices in struct rpi_firmware
> config: arm64-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160006.Lgyh7ZuO-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 15.3.0
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611160006.Lgyh7ZuO-lkp@intel.com/
> 
> smatch warnings:
> drivers/firmware/raspberrypi.c:221 rpi_register_hwmon_driver() warn: inconsistent indenting
> drivers/firmware/raspberrypi.c:247 rpi_register_clk_driver() warn: inconsistent indenting
> drivers/firmware/raspberrypi.c:267 rpi_register_rtc_driver() warn: inconsistent indenting
> 
> vim +221 drivers/firmware/raspberrypi.c

Would you be able to send me a fixup for me to apply to my drivers/next 
branch? Thanks!
-- 
Florian
