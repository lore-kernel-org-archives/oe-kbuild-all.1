Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0621D86ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736978262; cv=none; b=SF5TKpZxnXMc5TYdpBQ6k6qMD3pLbdZkXm8F8uc1aMfhh7ufZSX2WCBso7SRZPiiPDFO0uV58TATiuBTY68UnXFYTzTtvKka+Q0WkD8zEbY7OPaSYjp1XNGDHG8iR7AuQi1cW2l4ZE9d3s94heFEFoPc6ozrdG+nAWJnuxNMdCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736978262; c=relaxed/simple;
	bh=COqQC2CFvmNncVhk+1W1w8jCE8vr1/a9HNaUVBDSENQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sx01hXdKjO3og5ba/A80P93LE3nL3yWiWZL59gPmerqrYl4DHz6bB98ug/TIMjekPseKLPzbhsPtCz32WoY7xzjbL6IuQkw6b84+iav4rQJcyeBwb50KuktTunhKm9fEm8OOxypNkvZ25UEZ4e9QoFylb5hUvfSmG3V7XtP9nEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NOR6q/7G; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NOR6q/7G"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2167141dfa1so4973705ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 13:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736978261; x=1737583061; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0eXV6XAXnJ9jLSCtE9dBV9xUI/zVKTCPRCKwIy0LuJI=;
        b=NOR6q/7GbH9Uiw2IV+L7dA7Mv5CA1EyW/pv5Qc8IiKpdxpTeB57axYxYcnwvIiwMBY
         aYhH61pxP0GzZCe9LiUO0rNLx/n2PTceq4Y2cobeiDzsA9fpNgvh5QoRrS6moFGFV5sB
         kM7uZb7I+Q0CUa83HfKM69lq1tP0RjKTxXcdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736978261; x=1737583061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eXV6XAXnJ9jLSCtE9dBV9xUI/zVKTCPRCKwIy0LuJI=;
        b=pPUVUD3Rsiu5SWaM1zUBZkuYZdU0Kl9xZ51mH2L44YcGD744ex9gofiG30mqWS8LSX
         70C5a8K77zsq0BiZglJMvWqmsRHBoHzXf6QnnGmzgZf611AMpEh0euwwr/63pcXn8SVG
         yXm7ZcZSRLfOZ/hbPfh3cElhjcP2i5qWGM48pJ+ye3g7ul7zdI4IEI9bbftIRDmykZLo
         XSsATY2YLwlQZhIO9D4/3/1wESeNqXIMMe4GstLSSmF5+4rL8f7aJbvM2YgNxtSg8UQM
         m00OhE+G0ljrRkB6B86fMj1FIbBP8HuAdKADcNI1zpaV3uPzB3fLXapQVeFBFlfEIgD5
         zFKg==
X-Gm-Message-State: AOJu0YyE8fPgvE51N/j5IitjkZWiUnbgtai8uFYU9EwSq5UC4D5cMmkz
	fshF76xNi3goKNUn5LJt0x4IqP1rVspw6eBTR7J5xKwDctwCYmz9AMzkNSDjcA==
X-Gm-Gg: ASbGncuyo/A62Okp9vt1BbBg5gBQd3N1I35c+qHbzt9k7ZzL7BB+Iv4YTbnHjgldrFl
	+LLDoVDd6WZrd6czeiLCMyT9lzBE7L9OWOReOCn5FhzANZTtz3nai9rcGX3b3X+8ipfpBca5PlC
	eQpPczhNHyoY5x/ossxCVXZv3FfiDw5KVKA6Ug2v3BOBDvBk3vX2PuRm7Y3u5auXz8SwquuNlKQ
	FuuqRx+/sjbWflOExgM4IYFInscdvj2aGKXL+UEbJ1bEcFT4WRnOijApKR2Yd8iTHVL9fBzdtUb
	FdOibOymZ855S2qmzLyH
X-Google-Smtp-Source: AGHT+IGDAKfmTPBWzukI+NnDWeTxu4yqsoKxsyFbaQ9JFz80y5In2re3yllxh8pVG+wIkz5NZ+65bQ==
X-Received: by 2002:a17:902:ecce:b0:216:4fad:35d0 with SMTP id d9443c01a7336-21bf077db09mr72270645ad.9.1736978260616;
        Wed, 15 Jan 2025 13:57:40 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f256fd8sm86489815ad.242.2025.01.15.13.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:57:39 -0800 (PST)
Message-ID: <4e7c06d7-665e-430c-8317-0f3a10a58762@broadcom.com>
Date: Wed, 15 Jan 2025 13:57:38 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:irq/core 6/17] ERROR: modpost:
 "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko]
 undefined!
To: "Dr. David Alan Gilbert" <linux@treblig.org>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <202501160501.6r9pNtBg-lkp@intel.com> <Z4gubTOiYm-_H1uW@gallifrey>
Content-Language: en-US
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
In-Reply-To: <Z4gubTOiYm-_H1uW@gallifrey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/25 13:53, Dr. David Alan Gilbert wrote:
> * kernel test robot (lkp@intel.com) wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
>> head:   12cbdcb9f05559ff72eb8a04df829852804c0276
>> commit: dd1f17a9faf5359d76644236cde4cc1720f1184d [6/17] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
>> config: arm64-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/config)
>> compiler: aarch64-linux-gcc (GCC) 14.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202501160501.6r9pNtBg-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> ERROR: modpost: "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko] undefined!
> 
> Hmm, that's not happy is it - I'll have a look.

We should be amending your original patch with the following:

diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 32ffcbb87fa1..c4a8bca5f2b0 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -162,6 +162,7 @@ void irq_gc_mask_disable_and_ack_set(struct irq_data *d)
         irq_reg_writel(gc, mask, ct->regs.ack);
         irq_gc_unlock(gc);
  }
+EXPORT_SYMBOL_GPL(irq_gc_mask_disable_and_ack_set);

  /**
   * irq_gc_eoi - EOI interrupt


This was not going to be a problem back when Doug's commit was accepted, 
but later on, irq-brcmsbtb-l2 was allowed to become modular with 
51d9db5c8fbbed160081d4cb5c193abdf67ded05 ("irqchip/irq-brcmstb-l2: 
Switch to IRQCHIP_PLATFORM_DRIVER").

This totally escaped me when I acked your patch making use of the 
generic irq_gc_mask_disable_and_ack_set implementation.
-- 
Florian
