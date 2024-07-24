Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CE814A4C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721813660; cv=none; b=bGdWJ+Z/UWGkxOQvSRn5mPpPjdIxSfsXNXqa9h1dhPdqfKXUkOyt5FdepgajfNqcTZQqm2TEbrotAWEnMzg7hl/wmnwuO2q7UPsi8xDJZkLsYXElI+0hXj/na8c6aWdHIwpsOIfUPhtLD/dIhaQNsE8awBPmjSxZzLPUz4eg0+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721813660; c=relaxed/simple;
	bh=/d/R+Jtv2TxyXOo1DyLnoVOlnVzpQs4G7vdwt3KYxHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3uOJcw5buuKFpdGltw+1xhj1nvhyXXQQmDM0JxC5O33SjqZnl08l6TqJUshm1AmViqn+8kxqVywFlfV9IpMj7szoTrmIqHOqIY6UpQNQ4K9icsvuvq7YbVP21MKXMEzTba/ToEQQxQghF8PDP72GUsfyKbXullQT+how1kB82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckRaW7Wf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckRaW7Wf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34722so1339533a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721813657; x=1722418457; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3tBRQ341G4zJiEApQuOjcWl/i8i6AP3dSWt1Dzj9wpw=;
        b=ckRaW7WfiJUTSp45u3nLnE3US7cEnViKgAJ5GlPchEY9EbQ7G+V5wMMzZ/Avp/oZG6
         GXdZbXr930yXjQAutmRWjz7Q3H8O2Q1giBGfodXkNIXKK7kAZAh3ZKpHeASUCTTMnK3w
         GciGdiiEGcCPkK8fjatXrWeWjDyqIqCGLne1PAHlfITQoVE1s5AbVEvlssn4iTBPID7k
         C4ySfdgj8z3V0XYyKyph41WuXN6ykvbYzVuOxXxOYXrZndlXIiTHCBBScTQZeW92mvpM
         7NZGuEAqVTHxPHKRNm5TMT/zQ0KqeRvMZqTYDN/wN0ClrBP/8IIDSfnVFs2/7QqLntkh
         oQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721813657; x=1722418457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tBRQ341G4zJiEApQuOjcWl/i8i6AP3dSWt1Dzj9wpw=;
        b=eWYVRjUxM4i5k3aEwe43atiSITI5maAolY0L/o/hBrgLglDsmTAgRQmYthnLnmqae2
         qpAPrHlXmLKCE6Es/4VtXOiDa5ASPRMO3A0XdMknJ+AKMHAHVKmfzLKzTvsvpY1HfVvC
         OCMnB+YBP3rNzFlubaLqKnbl/2fzc7TuQPYPDutEo2o6fk8C1bRzmjr6dhaxwyXV5kjO
         yHpfQvWPE77U9STLm65uB1BKdwGJzN5JZt2MHoJfcd8vUNX2a9RTxW1Xgi7oF01dc6fk
         Z2ZjSC6DArnfirVBlMZjnsyXNL4Uqyg1moChjh5TeAKBfAEm0Xqqwg+t11v/MIGz1nPZ
         Dc7A==
X-Gm-Message-State: AOJu0YyxiFz7XBqPgI3bN+6xCV6+AgHSDLc0K/0/sNrpdkS6GG3lpUC2
	i2m/EFRB4vS1BiFjp20rtUqntDEnty1j+mH9ouPSG8as6YJ2MbW7ZvIn3CeAoLk=
X-Google-Smtp-Source: AGHT+IFxhUTTRDvPyo0lpH0/GUkdZ8C/fIhzqnwjOo4eEGdyroaXawFTdeKqIkglMPf1olSrFmMRcw==
X-Received: by 2002:a05:6402:3489:b0:59e:bd8b:53eb with SMTP id 4fb4d7f45d1cf-5ab1a9a2ae2mr1512717a12.9.1721813657174;
        Wed, 24 Jul 2024 02:34:17 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30a4d6bf8sm8677605a12.18.2024.07.24.02.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jul 2024 02:34:16 -0700 (PDT)
Message-ID: <17772d95-5c76-4fdc-88bf-cc429e03d535@linaro.org>
Date: Wed, 24 Jul 2024 11:34:13 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: pma8084: add pon node
To: kernel test robot <lkp@intel.com>,
 Rayyan Ansari <rayyan.ansari@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240723-pmic-bindings-v2-3-e1cd614f8c4a@linaro.org>
 <202407240711.f7qtQGZG-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <202407240711.f7qtQGZG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 1:53 AM, kernel test robot wrote:
> Hi Rayyan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on dee7f101b64219f512bb2f842227bd04c14efe30]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Rayyan-Ansari/arm64-dts-qcom-pmi8994-Add-label-to-wled-node/20240723-175020
> base:   dee7f101b64219f512bb2f842227bd04c14efe30
> patch link:    https://lore.kernel.org/r/20240723-pmic-bindings-v2-3-e1cd614f8c4a%40linaro.org
> patch subject: [PATCH v2 3/3] ARM: dts: qcom: pma8084: add pon node
> config: arm-randconfig-051-20240723 (https://download.01.org/0day-ci/archive/20240724/202407240711.f7qtQGZG-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> dtschema version: 2024.6.dev4+g23441a4
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240711.f7qtQGZG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240711.f7qtQGZG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm/boot/dts/qcom/pma8084.dtsi:31.19-20 syntax error

Need #include <dt-bindings/input/linux-event-codes.h>

Konrad
