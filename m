Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F914AB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714463707; cv=none; b=m8swwnLSsAuY+UhzURx6O8kXGFXa2JSFvDWcArynlJMkx6AyT301CEnXhCgdUbgRH/SfTvJP58FijoykxGLqkU7L13s3fe95ZepFRYp/3oxiXnxC8HjZCSEdrC66lOMM7pojhFCd72HKeQpPEzYHxwmkBhSn6fJnDq7hb9Vp9Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714463707; c=relaxed/simple;
	bh=QyO7UPtlHnW+b6HUplDf5qADygYlgox3avpwPbUW9Vk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RsbMyLqCl33nvjjQGlC4yImb4XoAVMhkggxn0qRtnZsJsQiAPJuzvI0AnCkZq6uAsfSA5/t7ozMO6h+lrnpGRUIsykGAfxo7smfjCJXlPEuI2GVPTl+MACfNqs0O3SY9NXGWC+o6AHSFOg/mx4/b8OnppgdyUYUXsSfcWVsocTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BTCPzA9d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BTCPzA9d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41ba0bb5837so26539895e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714463705; x=1715068505; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QyO7UPtlHnW+b6HUplDf5qADygYlgox3avpwPbUW9Vk=;
        b=BTCPzA9dmR94shD+LqCl7jQPzIPkEXTu3vZ7MpRx+40xU1kDoEUQzhAMPburau6i0R
         J8cTBuw9WeCjhWg6K7LH21zXNJXzBVIZQVwoYmF01BGnCIE0rMzmuEbRbWQ1+GNmPQof
         uA7spT2s6cVzdoWDpWd3x8+A8ZN00N0Z44rI2yTKg1SuC2LS98csPnW+ExzM4O1hJAJR
         ymSpig9AfOa522gBdakUXxb56lodM2xWBl/X0Kpv13sWuUIr7t9bVcXfB9cRXpzSt8SW
         aKjMJRM2Kf1yetHf9IKCsUg1mmEB2u7yR5wiKF6bZWMfJjP2C5NHpqkpF+2/ww8RuoUn
         91ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714463705; x=1715068505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QyO7UPtlHnW+b6HUplDf5qADygYlgox3avpwPbUW9Vk=;
        b=R0zu+CyeOzhgqTaGttA/nFi7X8swmmiUJv/fYQ3u95+xpaa5oFiKbz3ID4HHqltwaw
         N5/HroWAByx/ldewsOwUxuv2NSdWlNsDUUGRCet0Sgoxe0fKnDgQp+nBb2JT7lzDGqz5
         vsSImUllAOqNjMWKvJte4BXPUeo8cmXSpUKcLsoynK8P2VeZtJP77EamV6FQ9/6+sheO
         BqV0nNW2FMnRHh+/UoQ196zEx32jlXRQAXKVG+0h0GQ+fspQJQywcRv1dPa/ZP4oJ3rm
         pLfFZxyvwpdc3tuQRHgUvNs4rnyUt9VlWQnREUvQrEPDjJ/XiQj0QKTxhx8hCtS7IUPP
         JJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLb9rFt3IfBA2n45X7oH/O/6cHm0KB6rS5xPZ8vExKYgnzg65ZOXQfhcPd+p44Qage3rBkJz1u7m7TCCOJROre392o5Tu3Wi1Vh/+67A==
X-Gm-Message-State: AOJu0Yx13ar1e2JI7vk+O1f6C2auoX4O3ets0Ds809TYn9yE1O3ud/Ct
	V+iiJGdcMyIv7anSRBrL/1ZhZWZG8mQF3IFM1BRK8abLprW8mY9GQE9tHBGXj74=
X-Google-Smtp-Source: AGHT+IGSpoSFry4pE9uTsBILC16+fvaWelBfo7+NUhx4fBoQwfBtL8sXcmlBE2+RGEF1JtBrChz21Q==
X-Received: by 2002:a05:600c:46ce:b0:41c:2313:da92 with SMTP id q14-20020a05600c46ce00b0041c2313da92mr4603745wmo.4.1714463704670;
        Tue, 30 Apr 2024 00:55:04 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b004182b87aaacsm44080968wmq.14.2024.04.30.00.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:55:04 -0700 (PDT)
Message-ID: <4f163ad7ea0d65d14da6431cf6c1056b8e525dff.camel@linaro.org>
Subject: Re: [pinctrl-samsung:pinctrl-next 3/3]
 drivers/pinctrl/samsung/pinctrl-samsung.c:633:35: warning: variable
 'drvdata' set but not used
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot
 <lkp@intel.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Date: Tue, 30 Apr 2024 08:55:03 +0100
In-Reply-To: <15d45445-e664-40bc-b5b8-285df53167b5@kernel.org>
References: <202404300825.6lxLwvUY-lkp@intel.com>
	 <15d45445-e664-40bc-b5b8-285df53167b5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-04-30 at 08:04 +0200, Krzysztof Kozlowski wrote:
> On 30/04/2024 02:58, kernel test robot wrote:
> > tree:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/pinct=
rl/samsung.git=C2=A0pinctrl-next
> > head:=C2=A0=C2=A0 f9c74474797351c60e009ebc59a798fcfd93ee57
> > commit: f9c74474797351c60e009ebc59a798fcfd93ee57 [3/3] pinctrl: samsung=
: support a bus clock
> > config: arm-defconfig (https://download.01.org/0day-ci/archive/20240430=
/202404300825.6lxLwvUY-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.gi=
t=C2=A0f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240430/202404300825.6lxLwvUY-lkp@intel.com/reproduce)
> >=20
> I sent a patch to fix it.

Thank you Krzysztof.

> Guys, are your development trees tested by LKP?

Unfortunately not at this stage, no. We'll look into it.


Cheers,
Andre'

