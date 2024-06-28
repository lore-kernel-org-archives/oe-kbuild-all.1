Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96B1E898
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577903; cv=none; b=YrLAm9+ySiUQLw4Zi2bEbB54tC2JZpzq+h50Roye0ir2Z/iC315RL3LqAHedkGx+17OX+vyEMP/03O8nJdJdkn4xiSn/gTLEGq0rkUcawPIFINeK6bEPeuggruvBSXaKZtuOdefsMom/o52/sr0Eqh60b2H5bdYwfep8rMj6olA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577903; c=relaxed/simple;
	bh=ifcZthEzvCgVZZtznWPHSERM7LX1+YLQCyava4mvjvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGjmUMwEIar+CTqdDqHJR2dka51z6TjIesbncIX5L5cPBTdf8GMpYSVo7tHvdaSh0gZgvIA1CP/8bFpKCXo3TGM+knbWJRiYu4UC+2PtXJY7b1xXYKeyEngoCvXp7cDwl/HfKs55LBmiXjdg0xkiCH7HfY4XZtdL6+Y3sTp2zWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C48atdo0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C48atdo0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d07673185so691593a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719577900; x=1720182700; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bN3fly00vWL/YqxZZ4/kks5rIExYoSZS3cRtjKFJSk4=;
        b=C48atdo070diPmgcKKV+bsQMox6NN+Ngsuge1bZr/qk3cCMEYF6fuGrmq2I3P289ra
         m2xN+GxCQDAt2OVNE9ROYR+tSSMvBkljVXnuZ9ACUvz4T2mTq+fCc1EBhp5oaq65NSAD
         X3Kr5pJ4ekAmO1K0DCmqJiCmKOZ23dtAxc3ghhwyEmwgremMa+uLElPXgo688W9ftfS0
         q75ImyOLZr6XMNL8MY1Zap7Twgz6rj7uKSGXYu31+2oACixKDTs+ORwSQIWYqhcTQ6dY
         J6fX1KoRdOiVxhBoM3JiQSp/GMiNl/+cVf8hzZ+e+bJGOfc4TQtBSuHIn1grXvYE4+Ay
         k+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577900; x=1720182700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bN3fly00vWL/YqxZZ4/kks5rIExYoSZS3cRtjKFJSk4=;
        b=ukmEMafCkjOZoABXEC3Glnf25Ho2B4FRvIYzmtwLs0/Q8dLwQYK8TNd5ofb9MkXBit
         2EEUPEOzS5VVMYeNBq+ZhaNMocPy0HYgC4+GQFlNQ1g9xI8lYTuMMrnHpUWg60IhpoGy
         uMCE+BJnYRuytHG1huMHZc13UmI1udVUwLbbIXOdpXlwmi34dJmjHu2pGhpBvxkmae9T
         2k7WrGUCPSt5Zi0ikYpvNtUVUi2C7PITG/GPhAbOTLlcJJZcdZju1VH8lslX8hJIZTAc
         lFNgdO1agmLZYP7LPWRr2iA/zOZbsZ7NWvOEdtGtU/EO70/hTgoDzISMFmgkrYn/37EL
         PsTQ==
X-Gm-Message-State: AOJu0YxG3WULGRtTSD8DjrUmcUjfP7GeiSvYQwkQiYqoIGXseV7N06H1
	2i7IkiA38fFRAhmZ+jN/QYKEf0Wu4+lrBM1WzbRq2cj+EFeAty4=
X-Google-Smtp-Source: AGHT+IGmbVoiJBjg71jin/xw5lZR72sxuCGoVaVtfBpcWbMDVHqGoDaA8PdhFaUIzlnAEgaDkI+1Ig==
X-Received: by 2002:a50:f607:0:b0:57d:49b:ee06 with SMTP id 4fb4d7f45d1cf-57d4a281f1emr11454022a12.16.1719577899219;
        Fri, 28 Jun 2024 05:31:39 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:7e7f:f1c4:b61d:9665? ([2a02:810b:f40:4600:7e7f:f1c4:b61d:9665])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d50b32sm950056a12.65.2024.06.28.05.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 05:31:38 -0700 (PDT)
Message-ID: <934e3569-fae5-4ad2-ad36-419201fa970a@gmail.com>
Date: Fri, 28 Jun 2024 14:31:38 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7406/9027]
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c:
 failed to match any schema with compatible: ['realtek,rt5640']
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202406280804.Kc8B4xzn-lkp@intel.com> <2736121.mvXUDI8C0e@diego>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <2736121.mvXUDI8C0e@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 28.06.24 um 13:48 schrieb Heiko Stübner:
> Am Freitag, 28. Juni 2024, 02:55:26 CEST schrieb kernel test robot:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
>> commit: 7b4a8097e58b608638d416bd57469f8a9ab70e7b [7406/9027] arm64: dts: rockchip: Add Neardi LBA3368 board
>> config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280804.Kc8B4xzn-lkp@intel.com/config)
>> compiler: aarch64-linux-gcc (GCC) 13.2.0
>> dtschema version: 2024.6.dev2+g3b69bad
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280804.Kc8B4xzn-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406280804.Kc8B4xzn-lkp@intel.com/
>>
>> dtcheck warnings: (new ones prefixed by >>)
>>>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
>>>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000: failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
>>     arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: i2s-8ch@ff898000: '#sound-dai-cells' is a required property
>>     	from schema $id: http://devicetree.org/schemas/sound/rockchip-i2s.yaml#
>>
>>
> The sound-dai-cells are fixed already by
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8d7ec44aa5d1eb94a30319074762a1740440cdc8
> ("arm64: dts: rockchip: Add sound-dai-cells for RK3368")
>
> and the other two stem from those bindings not being converted
> to yaml yet.
Yeah, ....
Looking at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/arch/arm64/boot/dts/rockchip
the commits are in the "correct" order ... not sure what's wrong here. It
was pretty much the same with the CLK_NR_CLKS removal recently. It looks
like the kernel test robot builds every single commit (which is fine), but
the order it applies the patches seems to differ from git log.
>
