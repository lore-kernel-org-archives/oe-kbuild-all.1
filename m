Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBE223D2AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529804; cv=pass; b=KsxXn1q8LmEK50Y1vna1IiFXjGQK2FS4K9oszgGISZMur0x8ul96wAb8dWHjJlvnTxpvD+n2AbTN5KBGBgUlcSiZJwytg24SCMwljZjAnUa80Iqmoim+W+JAfILR17nXNDNDwMieMX1NbyoLEt4zEeBdjF5ARHBcqoK9V28ASdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529804; c=relaxed/simple;
	bh=g9+Va9TZCkDh+UZztowq9t+kAPcN+Y1f7CB0ZpxAfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4JhyeumkaHFGdKNIzcNLzpno2pLjOjAAVSFMnfeMSDjxVKcnGOzIha7TNKmP/uGT9aqJApQDLjYLBgWTygwieNajSpxEvWzb8YixdHj7lh0B/cz7i8sDPmG9Owqi6vvXAktwcwmWoQjnql89dnPB7u3Hd2lVF+0Lj3VFJntJMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=UZiO9eiO; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="UZiO9eiO"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66b0f489f3aso63127a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 05:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774529801; cv=none;
        d=google.com; s=arc-20240605;
        b=GextRS5OVYdp+I1H/L/RlyKDeF14ajWIFjjeSrUubxO5KFlsTKim4EA+FiN60M/WlD
         rXg53xlgXS68DAnT/cbTbolzkp+y0I+pcL727Kv8waVqdJwLg2q8JuGiXOPFCox9ab09
         KI6Io97mXf86563jDiNW9U6KNbtOeHFLp60T5awg84KzHY2J0wWIFHkXKNR0RHf2wEcu
         Yic/7zY2e/X6FMwyiQ7PYr2iisJzC94RyghllwfvQI6Ob2uHw4QsG1o2AEy43ra9mYKr
         4+HYAxr7IO4gjqC/udRAplG81iOGn78NIsaQM1Oa9AeVNcMzUUyKvO5rzlejG/eR+3m/
         w7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b7WBrdkJyJ8ilFsOjziO6DcmQMXZYqd7ADy5vYhUj8k=;
        fh=Q6eC3KLLO38h71hT0xxM6EiCILRWK/TPIi9F+IodBwE=;
        b=ZP3jhmCl2MWf57VzT8da4lElecA/0Wml+bvD0vfS9MJ5CusUUs32SJVGV0cSVjMREr
         kzOGt1+yq08SxTLO0QuR029WkjsZzMx+xAvoy0+sKcpNSxxSUzdqD0y9/8yKFQkrvL/4
         1R0mbQeS0FUglUUySbleJh9/DbiQEuXyeFOoEyzu0BR/RByImKT90nq3nLdWac5svm9g
         L7wwoNn536sdGOMfknwd40WaGPstEkd88VwbfdBW9X7wAmSK1W5oicpYaGwyDWIe94Qx
         5/4zHz+Wu8F/ZLu67AxwLImnOUN7OXRWBfwRhLjlNjargcoWDbEHnttjuUkUgDoZ74MQ
         RFbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1774529801; x=1775134601; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7WBrdkJyJ8ilFsOjziO6DcmQMXZYqd7ADy5vYhUj8k=;
        b=UZiO9eiORKFNfHVEh9i/z0qr5uuwuTj4oYiIhTsrzvvNhOAcW1GgqhOWRFJ0MjGRRY
         E8c3vti8Z6Z9nKM8GJ8FfsaVrSMSq5gsdCwNhFABdaoja7JbfTI5OE8WHBUlR89xar2s
         H3s5WGVM/06oxzG0VKFcAHw6dzOwlzJ6zsAOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529801; x=1775134601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7WBrdkJyJ8ilFsOjziO6DcmQMXZYqd7ADy5vYhUj8k=;
        b=lcJWivLEGc0oSM4nc1AWXEQBm4vXDWzH/ZcenFOHC7vlk3qg/oWGZ6xF33rA6IxNQE
         FPGMyBgnUPKbyDV7j3Mx9sExnYPK6293TT4XB1Qw/zMOjhXsbl6dJlRJV5RGK6xEVNBA
         YZtuaIh9YRJVtFIvQv3ZYLCZcZfybzr7qULls0T7HxDBiJ/IHi+TpYwVRAn/4fre+Gxq
         DNKlH5TFLJBH5hQ8yhyLyQsqj228Km1jvDUTDz4aFNRsCNVOd3cexQOu7Q2pxuTu9BXy
         0O0aSe6HwQvLSOPSBfLslkj+Zo/h3yjCHmAQ4voWPoNWhf9WtXzld8b6wAN5a4RX8FaU
         O8pg==
X-Gm-Message-State: AOJu0Yw3MHF3ip5/wu9opRdOcqarV0Wa8RGf0FLrom+30cNOGZCFnt1q
	j+DEMd4CylGZwFugODLKIU1szmbH0tbcRI0H0qxOZdZ/FP4nIEQrL68hw0xW2kXd8LxqzMZR+fb
	2/TBefE0oFvmcQbV9BvNxpOreI7/IK/pUiVEunBX+t/gK9CYSihU5
X-Gm-Gg: ATEYQzxW8YXtu1ZT6Zt19OjGcj/sndX7h/pp79bJiPJAphrvq65XvAIXGCNySWsVfWJ
	0+yK03ffwZNO6NJV/W+7lR/ZOOnL79BmS7D2vuSq1lj0VXhkm+kM488Sw9smtHGHhAqSIvRfRkb
	7brZI0NxUPluZaRHRJ66uyHsc4zlF2buSgH0ViROBUqRlbOtCoFuo5fx5zXee+EaY96BQQLl2wz
	me9Oj3xD/lus8jfvmN911ByQQHK5ibrdKkOHKySlR1zh4hxvm95MLvKHzgS+sP0v54xsX0EBSj0
	wIyb
X-Received: by 2002:a05:6402:44d8:b0:66a:19aa:4ff6 with SMTP id
 4fb4d7f45d1cf-66a826152f0mr4161210a12.3.1774529800453; Thu, 26 Mar 2026
 05:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603260904.0mYHPZwr-lkp@intel.com>
In-Reply-To: <202603260904.0mYHPZwr-lkp@intel.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 26 Mar 2026 21:56:27 +0900
X-Gm-Features: AQROBzAMcch5PT0CooFXctG5_MkyeIjmuz048l8HhSyb6aNeHSDIdZ7QdVfdEEQ
Message-ID: <CAFr9PX=WBVw9jzokOLpsiPG6zh54_V20M53ZNP85UJmOJ9Jy3Q@mail.gmail.com>
Subject: Re: tc358746.c:(.text.tc358746_probe+0x472): undefined reference to `devm_clk_hw_register'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hello robot,

On Thu, 26 Mar 2026 at 10:13, kernel test robot <lkp@intel.com> wrote:
> All errors (new ones prefixed by >>):
>
>    m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
> >> tc358746.c:(.text.tc358746_probe+0x472): undefined reference to `devm_clk_hw_register'

Fix is sent but the issue seems to have nothing to do with my commit.
The driver isn't depending on the common clock framework but using it.
This would have failed to build even without the blamed commit as far
as I can tell.

Cheers,

Daniel
