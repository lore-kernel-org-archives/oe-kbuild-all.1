Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869727;
	b=Q1mEDeq5vblWUGDXV7NymkipeaOHtyciuety4i6xGXPPskavbQ4aywRCVIuF9vmgl/+K
	 gJlaK2n+rMxx9OEKjjJYhGeLuOUwznU8n4tdhvBRONAE+sDK3zv9Hl2CDu/7jAFL6uSph
	 uSrpGTVRcxed5sRjAKDxrIvz+WAbP0cRwaYg/jHOc2QTKqA6KG7Mpei//UjXgJmEHKGWS
	 q7B2VsABfDnxMecEkjQyWsmDwuH53wdPVzQV318+jchadJpZblg0UbZ/0GC8bTcDd5Tat
	 t9Hq7myKFu52CaoWOCKv5jBwEGVfEr5EZxgpt/25kvCvkeKr+b8874VK0X7qS2NdbAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869727;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=StcTBKote0faR+ZUt2I1a0oiGv5vZN1xtXS3+VCqDt4=;
	b=SxC6JGj93RZnd+lefJtwDzEbCCaDG8m+tDltpHUtkoyjCLFbQgKCwwNyH1YvUAR7pLEg
	 v2BwFETsLGwHI3SQ64JZGyds0Ixyd8TIFG2SrWR4vEx2nmu740VGXC2D3unRs3mbYYlqO
	 DvoOjtig2FEaKlp2J9uCfABGbEuYX9EcDuE3Ed3Vjx41Ash4kER15PlUwRzbuW+QGIFCk
	 50j+i9uu0flVogrqgPIpKV3UyojTjhfdHOzN0UXK9t9zL2RtMc2dTbGaT+0/Js6AxxZ6H
	 fFCxH+HulINTRzP5tKzl6QTQBBmAawkM+P9QrWQWfYXUsNX8BvYCF3zFEiuIFKsi1aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DlFdwvcX;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D3606A323
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 22:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B3D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DlFdwvcX
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so295171a91.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 14:55:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869726; x=1795474526;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=StcTBKote0faR+ZUt2I1a0oiGv5vZN1xtXS3+VCqDt4=;
        b=1yqtrIrkcTTkD6NOqLPgLOCVNmjm9+jbDllAfT14zrEN8ePjqc41wwLo2EiIgr3/6o
         KGN2DOQgUh5d28OiUYJeeLml7KVTfKU3HDVVJPvwm/DsVgILuJz3cO1v6VE9MUUpTtvc
         kcPs6xZ92gjgrIr583+EcRVRum9kT/aaFtIXiNV5HB7VIEdIyHrotEYe0pUjK1qpLLaS
         dPdBA07LPyYLQw3/E5LURkeEXvblsqV3VxuW5TXLFgYra3Pm3aXE/vCxew+UUg8+U1Gq
         CbNS4AC9of53rKmgfljMV2bA6vN1Oeh052CicM9VxJk9mTxQtN5YqEbmbPoMibSLxIE4
         /0lQ==
X-Gm-Message-State: APuU4Z9D886phJhqRPONrtcc0YFwUhVqZavyAszfTcE0T4littoeItqq
	0+S9oejJDhcr0nexWzspk/I1jte8nPoIubTE+71J5yt0Ik2zklfsnRxZRZGqpLIg7Z1CU72bPnV
	Vx80RhQ5cEGa613aHHZUVzeGIp0D8sTpHr1FnxdUbpnpFGwyziJVVuf9EaTOLF/ov/cKw6SBgdq
	xu16V/lco6NncynziKyBNgd4bEyeNFkTSrkGs372olWI9fJ/Z/9S08v9ElWtaPm7JPMt+aYdVQo
	SnbmiyP7q4VzJr45ymEeEHqEg==
X-Gm-Gg: AZFdTZfMh8c+MNVceJJAtjaxF8CB/163JNT7ttLqR19PKFtmyeU6Oh51NvAOS8LnX0s
	uy0IHOMF/GlTXJv8O40VSOIBEiAg+uIH18uxfmV8p1szfzO1112F9mAKz/pn5jZUtd5HVx+A5gg
	FTLugRSJk7dIVzYryV1GwI6XaHmlvqtX3P0t1YUurdlMWWStTG7CHcYT2GAPZCyJVo46CT01qd+
	fLLkCfAIVAP7+MVS+B/PnO5RWk4FWOKIFYDdi2JCRjs5Y9s2KZxc9OM7IF9Fen3lym7p6y98z+A
	1yUu87+6/zcio8e+0M3qHscaw/PPIMFDQJEQlRtIliomwO9coa9NXlf+MyjIGBg0gquAh99Rysx
	t0RP0b2TUXiZ4jYO83TXWeUWXNtf5EBofJS405VkyPZEZs1QELYdVK+qs+Hg7O6smaIcr7gFrAD
	StB554IupDCmqiZXVJWe4ULOHO3AevRAo2keUnYZE7
X-Received: by 2002:a17:90b:1cce:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3b1b0a4a16amr11681380a91.52.1794869726329;
        Mon, 16 Nov 2026 14:55:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3af69e8d4sm141098a91.2.2026.11.16.14.55.25
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:55:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so4456858eec.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 14:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794869724; x=1795474524; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StcTBKote0faR+ZUt2I1a0oiGv5vZN1xtXS3+VCqDt4=;
        b=DlFdwvcXQiUHTpMEU6jwxOgXxbIdBO5b73pXrNHAnEnNMpkwPFxx0K9gX8nInwOnWL
         eEEe2OMvc9tDWTj5abzsw5ODs6yFCamaN3bxZrnbLqxTIBXk+K/mTksRvpB+V0phf1j9
         HvJ4Xxn3fw79oJQlMDq37ZcrzXXb4h2ne7sOA=
X-Received: by 2002:a05:693c:2a18:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-37967316347mr10230632eec.32.1794869724503;
        Mon, 16 Nov 2026 14:55:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a18:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-37967316347mr10230617eec.32.1794869723823;
        Mon, 16 Nov 2026 14:55:23 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm36816739eec.29.2026.11.16.14.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:55:23 -0800 (PST)
Message-ID: <c28c631c-4aac-49b1-b38d-66b399d05b2c@broadcom.com>
Date: Mon, 16 Nov 2026 14:55:22 -0800
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
Subject: Re: [PATCH v4 6/6] firmware: raspberrypi: Fix inconsistent indenting
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20261116-fix-raspberrypi-firmware-v4-6-33c0797d20fa@gmail.com>
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
In-Reply-To: <20261116-fix-raspberrypi-firmware-v4-6-33c0797d20fa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 11:30, Sander Speetjens wrote:
> The three lines that store the newly registered platform devices
> had an extra leading space compared to the surrounding code.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611160006.Lgyh7ZuO-lkp@intel.com/
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

Thanks, folded into firmware: raspberrypi: Store child devices in struct rpi
-- 
Florian
