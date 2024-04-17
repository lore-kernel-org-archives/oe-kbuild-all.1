Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392FF7D3EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341950; cv=none; b=Oo6MviggrOqauqpKpuiMAJzbzjd2xwg83vzjjscTsRVjYRlehueYSa/kHS0Nx8H1l9jmrsLjg05mRlXufBT/KJrJIgAioxruCxpSmB3ZGY9fjgKTL2JB//Y3OIdb4BYP7glTcTIJl0MPZH6ltMF1XiMWinCtE7S187zO9z33fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341950; c=relaxed/simple;
	bh=vQ0bSBSXVcW7woDznB4l2mZtCtQ6d2dmKIq6OArUyRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcY0QiAievZcd3h9BMMHy5gu3ZMWQIVwR6G/rMZzhISypZFVxrH7G5Xg8VcUuywsQhjQhbdqAOandvo1YKI+F6XGLmAhzgI5aJ+1uX07nEnP7dWv/1KVFuvhsdItnilILL6nbbRXeiTJbbmOPX+LZi3ehoTbbBXMV2yXIUjJjHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx+3nBjX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx+3nBjX"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d487659bso6384851e87.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713341947; x=1713946747; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WVqvTWkSJuMK42oCBd4QTeLpoVUswiSt5bNCxSQhCk=;
        b=Cx+3nBjXM1a2sWZk0rbr94EvVQSID6XHgH63sTv3K5F3YRLBO6CWxzYTtNrDZXzYrt
         4iOqAfQHr2I0sQw2SEJC9SHH1SputKAcNhwbUTni17ocn7BaILDRiqHFCCGQO5EyzqBT
         Y+IXBheW9NevKzH20NZZ4Zza+OVwO9QGxa+fVsnri3Pj7aqqHToTTIZ+wVxQarDXS3ho
         nruvj6VhSfeo4sFCcC/uyzrmLVBQGYmsLOSoV5KegUiYC7dCk5mmBuTetP8LXb9RVhaf
         RkvaGI2dxxXtuWSesMGx3nqCxeeLse58IKch4zRdXOQY47AyyTGkWS156AtXKMglzyDW
         hhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341947; x=1713946747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WVqvTWkSJuMK42oCBd4QTeLpoVUswiSt5bNCxSQhCk=;
        b=K3HwOcp8xqPR4gFy6GBbhJ5bKk/20OqiUhKDTuQaP94L4JORkxx45bxKSFtNoCE9vL
         M8mDYx155RqAeJ2wfyM3V5R6rdxWkZJqXFB9CgNl+US5vLCeNdoktcgmymuL7ohTy421
         vRMvVkpf3rCKwWMcTOGyG7kMf/UP3O3vtbrpqslQA+5fsPPrF6m93lcjKEBDvJyEIibQ
         /AIiZmR4JQ7mkft0LHip8Qn3ezLxXxiEp3VjOZapGUP30dfcUhMcVD4JDsjwVjE2KjzD
         BWUeIZYEbFua7p56WIdos6Tqc3m6sZYGwlvL3HUqvxT3YGVaRVkYqIdysztve1IcdOoL
         zzuw==
X-Gm-Message-State: AOJu0YxzMdAEqdLmjrv+Xdbxk/2utU+uVGnZlyGDL8tdvHGQJf3bh/+4
	nWILWZDkIC4JgwWXTTEIrBcX4eLUId2gsVZHnKPtIOWt34aU8Lw/
X-Google-Smtp-Source: AGHT+IEZH+ylq78IQkJNfP5FDxkXscm3aRgH3ubDyx46wNRqQbkl2T+2tyX+4h0ejdbXrQysINo+Vg==
X-Received: by 2002:ac2:5106:0:b0:518:8c8c:db33 with SMTP id q6-20020ac25106000000b005188c8cdb33mr8624693lfb.7.1713341946952;
        Wed, 17 Apr 2024 01:19:06 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id p27-20020ac246db000000b00518948d6910sm1446525lfo.205.2024.04.17.01.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:19:06 -0700 (PDT)
Message-ID: <04f71d99-aad2-4e56-8f92-89469c159b48@gmail.com>
Date: Wed, 17 Apr 2024 10:19:03 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: rtc: google,goldfish-rtc: move to
 trivial-rtc
To: kernel test robot <lkp@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240408-rtc_dtschema-v1-2-c447542fc362@gmail.com>
 <202404170656.LoL9eBYs-lkp@intel.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202404170656.LoL9eBYs-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/24 00:45, kernel test robot wrote:
> Hi Javier,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on fec50db7033ea478773b159e0e2efb135270e3b7]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/dt-bindings-rtc-orion-rtc-move-to-trivial-rtc/20240408-235612
> base:   fec50db7033ea478773b159e0e2efb135270e3b7
> patch link:    https://lore.kernel.org/r/20240408-rtc_dtschema-v1-2-c447542fc362%40gmail.com
> patch subject: [PATCH 2/9] dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
> reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170656.LoL9eBYs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404170656.LoL9eBYs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>    Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
>    Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
>    Using alabaster theme
> 

This issue has already been addressed in v2, which was sent a week ago.

Best regards,
Javier Carrasco
