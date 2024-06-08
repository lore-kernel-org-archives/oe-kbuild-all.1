Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E141BC43
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 11:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717847331; cv=none; b=uR4fYQc4W6Bk9xzif5FzVhfHFSA+Q4mOv5iOeh+1qIoaSxd+lapvw7F2z1DntDl/Yw2wsqNr/SAXnQkMNLOVIHk6sWOgdKywImeqRPhchMeLm5w5QKeWBP/de9hlKYM9KFOjYkCqrDJQSdBosWmrd4M/J6QOJaO4EH5RSaD2lTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717847331; c=relaxed/simple;
	bh=QswxofCWT6p5oMxAUibGzSDnmeyXbuazrtkkm4GGxwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+zZ6HKFutlBgGT1LBLjc5azEPjePU9qPvmrpZhmqTvoO0i0Q27/zhT2PwIrdM26472lLKD+ni+PNGU9caZfCBv7W1gfd0GikVrnyT1Sn932BroFYoAwvkB6fugA8Ph73xdEnoVP1VXnNFkKlELsdCgwcg1M7asI8U3jMQaRZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1DT0Rfg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1DT0Rfg"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6ef8e62935so100624266b.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 08 Jun 2024 04:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717847328; x=1718452128; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgEozYEpRnm1HCHc1V6ewTzY/frefA6Lvzpvz3jUqms=;
        b=U1DT0RfgT10+Sn8Sxc/ElPpmfNRzn6tUFC9LPI5EzCBQdYWUl5sKSoujcc9+k8JsxQ
         EcHz1B2hoGPOaBWeiSdfK+Yierho/0563TPmrv1PS3ptDQzPWKrUUr2wmSwT9BJS7aUc
         yT9zP9XjRkVulLLTp+37LSHxT7BJmV4ynkTi1S6tvbu74mbfWeTgF8km9pwy1dXFzjEL
         GBn4w75ngnwNRXDl112o6L1/xtT/fApg59eLnSX7E3PkhcZDXh/2+wbYq0kWxqU4bnVN
         UHzEbGKV/0OS+kKuxUPhymBSdl2M68DohuGSRfAfkGaEyT+SyLUn1CoXRZuXmC/E74OT
         7GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717847328; x=1718452128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgEozYEpRnm1HCHc1V6ewTzY/frefA6Lvzpvz3jUqms=;
        b=hL75mDJj1+ad451eeb2bxh6TVZz5mvIJARLnJjcNTFrXUjanAy8lvRW/B1jUXxfiCB
         ts8NTfGhxBFn1ICnHgy4Zu70hNIF1RVqqmQlYRwdNgLuRbDl/YYyDNtwfEzspCML5nGC
         3BztVksz8l6GPF3s05iQaq6siCY4AR8s7Uooq1AYx05QEyKujhP1KieB8WCIII793w23
         o/sfBGvxVDQr+EAt6UfSTCeH7btdw1lNyFayc/tyzV7dsaPGiJZG9P9BOaNEF3UoUAIK
         QteXDNz1GwN+v7gfwmqGZjcEvm9k7S3fDXNUQJbUwhQTSnoHNyQK4YhYmDzU+dsobrM5
         q6Aw==
X-Gm-Message-State: AOJu0YwOKOrKVc7s4HHSKeyjYvYWoiKTY5wy3pGfr/U7XzgIK/uumgf1
	HGAqYItT6dm+QoiieDeIxF1j07iVTIYyg5XQygepTa4koS2xu84=
X-Google-Smtp-Source: AGHT+IF9gabaxOxHa5x2Qq0OBiqMsOS6PSwBbmA4kM6wizafHBooQIGe9c+EsolwXqjpdshVpNJYZg==
X-Received: by 2002:a17:906:2542:b0:a5a:51dc:d12 with SMTP id a640c23a62f3a-a6cd560fa01mr396404266b.2.1717847327704;
        Sat, 08 Jun 2024 04:48:47 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:be1c:a6b2:4433:4c11? ([2a02:810b:f40:4600:be1c:a6b2:4433:4c11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eb0e5sm376382566b.99.2024.06.08.04.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jun 2024 04:48:47 -0700 (PDT)
Message-ID: <154cdec8-7d0c-4cc6-8d09-0354546203ee@gmail.com>
Date: Sat, 8 Jun 2024 13:48:46 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1912/4582] dtbs_check:
 arch/arm/boot/dts/rockchip/rk3128-evb.dtb: /dsi@10110000: failed to match any
 schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202406081302.0CAdvAA9-lkp@intel.com> <3048353.WAvfycf1tz@diego>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <3048353.WAvfycf1tz@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 08.06.24 um 13:26 schrieb Heiko Stübner:
> Am Samstag, 8. Juni 2024, 07:58:10 CEST schrieb kernel test robot:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
>> commit: 73fc389129dfe22b5706b4b6cbc1a4f86d1fbc1b [1912/4582] ARM: dts: rockchip: Add DSI for RK3128
>> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
>> dtschema version: 2024.6.dev1+g833054f
>> reproduce: (https://download.01.org/0day-ci/archive/20240608/202406081302.0CAdvAA9-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406081302.0CAdvAA9-lkp@intel.com/
>>
>> dtcheck warnings: (new ones prefixed by >>)
>>>> arch/arm/boot/dts/rockchip/rk3128-evb.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
>> --
>>>> arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
> I guess something went wrong when that specific next-tree was constructed.
> Looking at the current linux-next, the drm-specific parts really are not
> present, but they are in the drm-misc tree for a while now:
>
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9bb3d9ad3e19f16efc34f427a58e480424c56a16
> (in the correct drm-misc-next branch) and has been in a pull request
> to main drm on may 30th [0]
>
> Not sure if Dave is on vacation or so.
>
>
> [0] https://patchwork.kernel.org/project/intel-gfx/patch/20240530-hilarious-flat-magpie-5fa186@houat/
Yeah - looking at [0] it seems there's something off with drm-misc-next
tree. I know there was an gitlab update of the freedesktop's instance last
week. Looks like something went wrong there when comparing [1] and [2]. I'm
sure the commits which trigger this error were in linux-next aleady.


[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3502729a63ec22f0f097c039a98b97cf7c9d27c4

[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/for-linux-next
[2] https://cgit.freedesktop.org/drm/drm-misc/log/?h=for-linux-next
>
