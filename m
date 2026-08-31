Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5D3905F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161715; cv=none; b=J/P9WFkAABZUxoAMtD1i156IFCmTjl/Vi5Z2BIrlQfsU1rFNafXtOND3sLrMgbQmbvQD/T/0VWlsRHjzyp9Cp3PDPT85Kivdcd5KcGpX9vBgyxWMYUmM5uRWMpR3xmwxCpy2w3sKILcG1THnygQTbX1TBpcKD1VA1zEhJQ+SKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161715; c=relaxed/simple;
	bh=EEpMdvaSoRRNpzIw0uDeIf4lK9QMPRgw6IJLb2ROgLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6i0WgAS9oT+tR6SCcrEystASl4aORsuPGwqLDTSo4r+WNp0HarhnIs6xU+Wy3DGii4x/VJUQ8LC8G7a2u91Vo+Gvx5mki/+eHDHzLRBYuPb6W9W4EAiie2wGX186FPPC2oPb9hLfCRG+ZljjWdhPAdAGiBkaiwXTeHt7caCsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=yJ/zQwl2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="yJ/zQwl2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c26d7e951so547552566b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788161709; x=1788766509; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUJjc7NoHpI9mQtQ42R4ZIO0mKllq40nvRDUfnZeAwE=;
        b=yJ/zQwl2CUyljd6S9CNwii8ZuwCHi4BvJyj9O/NQxMhmLiD0gwWLS1iyp1t4j94FFQ
         Jxfc5uE303f1I/FPAqL+hL+kWt4oNJEipB1wfWTdcouctVXtqs/hkV1pwqjV6nH0D06p
         BBFgMMf2O3Yl0AcIe3JjsmUSznjQ/HB7NUmq6hljxRE8mvmpe/zuuQuEOLLVdzxj8/Kl
         +b+9htk8QUgw6JecSBPPoqubFmSlemTpZdbzJxv7qH5XYshpTtNtODgHbmXnGA37KEDU
         +MbSmEfzJ6j2VW5N9+WSg+tmxs9yEErX3pwq1FT7tgdJF0ezsvzHj4bWnitJRK50Vvqe
         vF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161709; x=1788766509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUJjc7NoHpI9mQtQ42R4ZIO0mKllq40nvRDUfnZeAwE=;
        b=Ie3enEeXIqntpzOESgO+9WQ+XRkJkup8LNA1iNaWL2fez2lR/jGyCa1wRsCaP/tnt/
         UO3BrhD3XAfejs0jIInUA70V8giWntdyjTde4l+S2kwe/6Ef0dT5pWeQmcPGIHNkLZAV
         MKHO7Cbs063E0JRKnmLs2IPwW3yDEQ9n7tHBtjsbZ9l4+XRhDc7SuMlPHTT1HUYJFtvP
         oJBHG5yEA+MIlI82mBs9FISsyR8YVfdh1XotawMmhTtQ0dvefwkl+6q4gxa5yRdMkVku
         TzWTWKeKC81LL8rb0Sns4vkMK10awNZPCrTcAdw5Uyx49yJ0W+CnqIa6X4gMq22bnqxe
         Uzdw==
X-Forwarded-Encrypted: i=1; AKwUvBw3YAJl7eH73hSK1nWDpHpFMg+EghOJ63jvjpclaBP0+vL0TZFKA4zngHyv6OOin3YYan8zc3HnHCLu5s2F@lists.linux.dev
X-Gm-Message-State: AFuF++kkyhaUSYsaAgUkGxUIdkOsjABisrJC6FIfYQHB050LX78xy0os
	jJRnTezSAyrv1/Zk/9tkeOcyNKuB8N2XSQ65Qz30COzMmwQZgf9TsXdHAJyhV8UbZg==
X-Gm-Gg: AYBFou0MKPz0tB47WAwjnvmR6w1iPhCaMVQtHd5tBfPas8CSI2PX6z4+6nMQB2G84Hi
	dF2N/IjWOrOUeyDX74IWsKKIxBGji07wV7riL1bqwaTWGPPfZzHBaaR9WgD4Ol5YdL66WWZUlhs
	racMYDGi3aa+UMPq/biBQta+7h/BLG3qYCU+G/iHuuXvluJEGvCKQ4xD4PwTjDcVrb3fxSXI9m8
	nSWi+oBe/M3EFTn/YGlKp9jt2i+TGsAl6m7Z9QEEyJiw1+bBhvz74nRqqyrgN4ihFHwsVIEpgM+
	Q9aUic2qUsRoBl/Wk2u4Pa8bq0RV4URB3/uSDbTQEn6B+i+RYDA4WV4eDniJF4Mh2qvR+T49hgy
	B9NGnhrdw1lXmcavHhRd8Vyo2nPVlY4XAbDCwkqV5ToXiYmwEchN8l0ZEh9tNO76fLqngyTjwE0
	NHfv6GyD9KPvl2hz2yvc76gpprtbzke807DFqT6jR+1GtEIq4KXwGcLUEc4brjk5Jf5Aq4+Vdh2
	ZsjOB8ZTzz4pUkkB8CZlAXtacNJh+6douH3
X-Received: by 2002:a17:907:960d:b0:c25:659:89ba with SMTP id a640c23a62f3a-c2556c4b566mr1404315366b.9.1788161708901;
        Mon, 31 Aug 2026 00:35:08 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2cc8asm404441566b.26.2026.08.31.00.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:35:08 -0700 (PDT)
Message-ID: <ab3f14c3-8249-492a-b3d9-817504095610@monstr.eu>
Date: Mon, 31 Aug 2026 09:35:07 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: Fix MB_MANAGER build with older binutils
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260813024026.5402-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260813024026.5402-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/13/26 04:40, Karl Mehltretter wrote:
> Commit 88707ebe77e2 ("microblaze: Add custom break vector handler for mb
> manager") added the suspend mnemonic to the MB Manager break handler.
> 
> GNU as only learned this mnemonic in binutils 2.42. Linux supports
> binutils 2.30, where enabling CONFIG_MB_MANAGER fails:
> 
>    arch/microblaze/kernel/entry.S:946: Error: unknown opcode "suspend"
> 
> The suspend mnemonic is an alias for mbar 24, and both encode as
> 0xbb020004. Use the underlying instruction, which GNU as 2.30 already
> supports.
> 
> Fixes: 88707ebe77e2 ("microblaze: Add custom break vector handler for mb manager")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310310151.UhB396Qs-lkp@intel.com/
> Suggested-by: Michal Simek <monstr@monstr.eu>
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>   arch/microblaze/kernel/entry.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/kernel/entry.S b/arch/microblaze/kernel/entry.S
> index 582d7256d8154..ad44341a5dbc7 100644
> --- a/arch/microblaze/kernel/entry.S
> +++ b/arch/microblaze/kernel/entry.S
> @@ -943,7 +943,7 @@ ret_from_break:
>   	mbar	1
>   	mbar	2
>   	bri	4
> -	suspend
> +	mbar	24 /* suspend */
>   	nop
>   #endif
>   

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

