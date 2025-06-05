Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4A8462
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 03:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749093148; cv=none; b=dkcdyRirrkdJOPAmKYQvOtqsLXw0w6fUbH8sUYOd5CCsIsGqhUbKY//dHJFQccloXUwmvXUCv4kmNdE32pGw0/AuYZfKJxV2lo8ssjKJCIK66UPcx9dxWCJBtNRD7fnVIZG9nBDMHtrCEwWF1m7bUseXtJPAveXCqFFKPgPy5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749093148; c=relaxed/simple;
	bh=sQX1IG9jCHvZlXRIO/SyEELcZCMBKeODqOb3g7V72Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S73iK2pQTUYslFBtdfvAiGEnd8RCTCnODpM8h4Azf7eBv1ReIxhSG5EaluTr+LG5eJf6n8OI86FocOaDlWd8sGFPLYwISoQYXWkwfLunxgm0sSV4fZauVTOmvEbAz3eDUchj2WWPm439aSLReo4yMAAxZ3H21usHL+HLoef/hMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NQaA3EXn; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NQaA3EXn"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-234c5b57557so4485835ad.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Jun 2025 20:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749093146; x=1749697946; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bORZcVaczvjtgVGYgydOq0BbRRc7YKXOt8dfoCPs5qY=;
        b=NQaA3EXnLVr+yFSxdqLAI9+YaZ8LhH0TxfHnRQoP2a3gVtNtdWREiwnBgsltAj718v
         pt6K2QNLLixxW/sD4p62YidroKrEoHBF8dO7/ZAPPLk2eB4YV4oul766PqC/n3Fuy3Es
         /FB9924pKcCNL1y50Zv7p7LahATMoYkB5irD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749093146; x=1749697946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bORZcVaczvjtgVGYgydOq0BbRRc7YKXOt8dfoCPs5qY=;
        b=KqSJw9Ofd57TXk++isYy+tIf8q2oZjqKAhvb0b5hhyuFCs813cii0S3ggLDwrWQPgX
         DrA7Qd4O1VUga1Gbw97h6KGp9/r4JBb1JgvRUKCkKJH6jtIY6HzhaqxDhj8nJU6GW9UF
         kKAf2BFEl5LK6vyez90r9cFMCuAle8mhpAY/g+P0a2RoQqitihcXbN/8gm/3Un325ws0
         E9sB7RK11ljUKFmzMvER21VDUBNPEF9eY69IbgWffKyVXMmOKG9aTqilAZHBrWazJ14r
         UWwXCs4b2yioMb0Ps76wl4BjC3erH2W6qIYbUjPo1sNBKK1rs2uLhtvgJiHODv8X9vu7
         wSzA==
X-Gm-Message-State: AOJu0YwVcrOIlw6Vfptsj7vcoprxZY60FUvJNtzGxYfrfGzM9K1PZnrc
	oK7oVGCM9vxWBLZzeRLajf51NA/I9lOcfznySlazQoeH1Ni5mibVTc7kM4EFUcK8NOtGkgyJjLb
	R0GJp9jXA
X-Gm-Gg: ASbGncs7d4oRWA+Vc5YrysPSxn01qpX42s2VwuBAQlTBwCOTDwtOHS6I4ItbMUhv15B
	BCGmGVOYarSclKC84EZgE2kTpC5AIkATFfLkacuvDzWpcW0kAEBigg7yhUUHn4v7kYFcJrqfbwb
	TubWi844iSeDE/NY8IR5tP55X4BPurEzjvugfbyo0nMVlLri+V8ihVZ0WWmUCNqC/7rWQUvsAHh
	mowKFIUJB/rmCErujyvZ1xuZ6lvwacruHzwKEt2NUGpDEqRGL3gGXuCRNHGjCRPEZV3RtnfngW2
	LY4q432kkk2Ps6bDrv9JpzKLYhyrzRAzXcj2HZMfm6L8z95WBm/lcrOT/6LbcCWxXI7aEoqz2Gt
	2T6E7d4IlG2l+OJbS+YkrX6A0Qon3P9OyKoSCF1Dj
X-Google-Smtp-Source: AGHT+IHAD0UFdcr/0sAy2kUhUG8lNLY5h8wbJRJhGj8EoGQpXqQF5ij/Q/XKchQ9R9I5O7+8yuYR9w==
X-Received: by 2002:a17:902:ce8f:b0:229:1619:ab58 with SMTP id d9443c01a7336-235e120601dmr75384015ad.43.1749093145667;
        Wed, 04 Jun 2025 20:12:25 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm110846785ad.97.2025.06.04.20.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 20:12:24 -0700 (PDT)
Message-ID: <6851a81e-d37a-40d0-bdce-3e26398ba25b@broadcom.com>
Date: Wed, 4 Jun 2025 20:12:20 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 13769/14339] drivers/clk/clk-rp1.c:16:10:
 fatal error: 'dt-bindings/clock/raspberrypi,rp1-clocks.h' file not found
To: kernel test robot <lkp@intel.com>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202506050803.IIBuzodB-lkp@intel.com>
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
In-Reply-To: <202506050803.IIBuzodB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/2025 5:41 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   911483b25612c8bc32a706ba940738cc43299496
> commit: 5610966e6503870d1d6fc63bb194f613c496e095 [13769/14339] clk: rp1: Add support for clocks provided by RP1
> config: arm-randconfig-r071-20250605 (https://download.01.org/0day-ci/archive/20250605/202506050803.IIBuzodB-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050803.IIBuzodB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506050803.IIBuzodB-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 911483b25612c8bc32a706ba940738cc43299496 builds fine.
>        It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/clk/clk-rp1.c:16:10: fatal error: 'dt-bindings/clock/raspberrypi,rp1-clocks.h' file not found
>        16 | #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1 error generated.
> 
> 
> vim +16 drivers/clk/clk-rp1.c
> 
>      15	
>    > 16	#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
>      17	
> 

Ah ah, I see what's going on here, the "next" branch that I publish 
results in the following order for commits:

45ff30895891 (HEAD -> next, broadcom-github/next) Merge branch 
'maintainers/next' into next
55f0067b9bf8 Merge branch 'drivers/next' into next
2dd5b6347b6d Merge branch 'devicetree-arm64/next' into next
3ce0f81b9a01 Merge branch 'devicetree/next' into next
19086952c25c (broadcom-github/drivers/next, drivers/next) misc: rp1: 
RaspberryPi RP1 misc driver
70b855023d2b pinctrl: rp1: Implement RaspberryPi RP1 gpio support
10730c2b48df (broadcom-github/devicetree-arm64/next, 
devicetree-arm64/next) arm64: dts: broadcom: Add overlay for RP1 device
cbaec80bda2e arm64: dts: broadcom: Add board DTS for Rpi5 which includes 
RP1 node
0c4ab80c7708 arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
22b60cf9fd64 arm64: dts: rp1: Add support for RaspberryPi's RP1 device
9e2a0a8aec52 dt-bindings: misc: Add device specific bindings for 
RaspberryPi RP1
2e373e93bb28 dt-bindings: pinctrl: Add RaspberryPi RP1 
gpio/pinctrl/pinmux bindings
041f1a3afbd7 dt-bindings: clock: Add RaspberryPi RP1 clock bindings
4e69827e27d7 (broadcom-github/maintainers/next, maintainers/next) 
MAINTAINERS: add Raspberry Pi RP1 section
b8e22cf599d1 (broadcom-github/defconfig-arm64/next, 
defconfig-arm64/next) arm64: defconfig: Enable OF_OVERLAY option
10c68f40b86e arm64: defconfig: Enable RP1 misc/clock/gpio drivers
5610966e6503 clk: rp1: Add support for clocks provided by RP1

with the clock driver sitting at the bottom and prior to the 
devicetree/next commits, which is why each commit being tested 
individually would not build. I guess that means "dt-bindings: clock: 
Add RaspberryPi RP1 clock bindings" must be in the same branch as "clk: 
rp1: Add support for clocks provided by RP1".
-- 
Florian

