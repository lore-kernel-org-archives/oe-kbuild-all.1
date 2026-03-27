Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721512DF701
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624429; cv=none; b=CfuPnKcWQTCh5MKkR+rRYfzZ2+5aXn9gNwohKW6ZDSglAAO9gibS20+ngdBdqB9zu3b4gWr6vzM140zF+WZq8dgDeRZjPDLuJtb2KTz/QAaJU4j7QQF7auv5K8OskjWbdAzBVN8P7TkBRTiJp7MZRacdRMDZy1EZkJC2C+8jc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624429; c=relaxed/simple;
	bh=aZTIOazBOjOE0KqMAGuDLAvGUKYPwDBJBDR/C47UmNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8hx1ZKPmIspVs028uouEaHpYV+eE6s6n6UVu/OuVBMVSTWF1zx04uWc6I9duNzA56NUNREtnzVokRjWuaItd/SSwP5MXLS3IhgWRW8Snr8dFPpzTeQNwx2FwmTmdUoeuZ5EWBVGg9GwleBmdR9H3NVdRkCqVabb44rALUrocIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=z0PbN0eN; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="z0PbN0eN"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-467166cb638so843865b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774624426; x=1775229226; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8rRXVqh1SAwiLT8iMgdXmcqlBZbSii7YK+16tzmAI8=;
        b=z0PbN0eN8mrw0tSYIoNzjTs7+o0IIksrnQKORhmYPOKcYakpxROtyEj8CGVsjoizQs
         Q9zHw1cX7HYui6eF7yuiqLuVN6W/SA+492thQEjV5TAHnRCmQFFmuXCpNO6g7nK4sMan
         +StCCaXlNe3XYew+MoP6/eJWVsjOsep+qtfZYMbDkRIc67gxAN778TipA2a/QdhRm2En
         Q5XHpoVXIvPBeI56XTDjyqu4KlO9knt3uGXpsaJXllRTjwNj11nPnfUfnkHPNiMWF38b
         AQaJdpmVIXO1p7DqlCi8INwIw5O2azZIfv7AYn15GT1Fj6YjFcUEQ0VZ97taFg8lT+5Q
         0Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624426; x=1775229226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8rRXVqh1SAwiLT8iMgdXmcqlBZbSii7YK+16tzmAI8=;
        b=iLwnMcJqSFRxm3EpLwydxh47W/jv5pmTfCH8HuegULEjusPAkVrUeBe8oPPqr6Wlfn
         Rg/e4PLCI2qMgNmdyJ8PUO5sfawwvgTw+YOA5Pf6xCyyVsQu4gVqui3kr/4tmd4F3d/0
         KfBdyU/O+02ZZre0of7itU2AUOsY7zewYmpvCArUShmSuZbwrTP1G5s2BNZVb+DUhX5z
         ltQpUDmF53xPsC1HvYzNoo4rjZKnT2x9oeMbDyw/V68+hRpqB2JEdY0AYMOsG1Dc2vaU
         F8azg6FBdQyvZnwTX121uo/Mgoli3DLo/ll8g+6RkGt9Xgu1yWMobZUM4ie/udH/uAVN
         3NbA==
X-Forwarded-Encrypted: i=1; AJvYcCWq3TpJ6JPk+4bThkyJ0Vy81qJbY1JKLM3DO6Th6UGRxNyVoVKzUN/H0wp0RivcDPwu4xq1Z6+rMDP4rKi0@lists.linux.dev
X-Gm-Message-State: AOJu0YwxFtmgLqXxsN/gX++z1vmgZ7OSgnlCumgchgUE+/kiKGqKqK+e
	ZOgeoHUPsXa+JmqWSSdR1NdYrXu73/FM3uMeZQnQJ8M0oynSIxt/ucrkWKS3dmsnQQw=
X-Gm-Gg: ATEYQzwlUAkto+cYjjQKcrc1CYj7CJ5XpZQEZHsixi49yYK+5uNI+koJQwS4/5YjpnC
	TOG26IrFr8IMWDulWImpyXYeoo1WAOe40Ws3FVOr7XRy4LEiVnWvsMIk8roOrvfBLYJ7FZ/ojT/
	sHRmz4dYfVrQlTczCuyETIOoMxgcpHDBLsA2Et8l6spRE3pD6gPUlpYeZl9tfQsjHID26UWiUc4
	/PtkDRmPxjOflhazDLq9oE/tnNDYBS5OQvGmIJv28iefz+xQt0zpfiLmHLV7zYp8/Lu/aSMU1/k
	sPO6XqcWgB+I4Je3mhs6OU2ucNDjQ6qaIEY6tIYp70cBP7jqKqDyLKfs9D2hoVQhcRYzYWSzPVA
	407wDXzg/coAG+FLCx3o4JQyO2C7sdrS7BedQnFiWqu+jyBS82puJ1k1eNyXsfyHh5i6Tq7vES/
	CEBdvYl4L/b0E3Vt0BT3Nl0Q7Ccb1cexn57q9cqU0tKaoib/N4LsTAp617WNHAd6WLY+ULqbCJR
	6Da3gmN
X-Received: by 2002:a05:6808:6786:b0:467:fd2:69d with SMTP id 5614622812f47-46a8a3d9441mr1284227b6e.17.1774624426397;
        Fri, 27 Mar 2026 08:13:46 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc775b12dsm5147255fac.3.2026.03.27.08.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:13:45 -0700 (PDT)
Message-ID: <292b324e-2532-48db-9632-2e1a8d912ca2@kernel.dk>
Date: Fri, 27 Mar 2026 09:13:45 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:rw_iter 204/525] drivers/misc/bcm-vk/bcm_vk_msg.c:1054
 bcm_vk_read() error: we previously assumed 'entry' could be null (see line
 1045)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202603271746.xX5EENwP-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202603271746.xX5EENwP-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/26 4:59 AM, Dan Carpenter wrote:
> 
> This was fixed in ba75ecb97d3f ("misc: bcm_vk: Fix possible null-pointer
> dereferences in bcm_vk_read()").  Why are you working against a 2 year
> old tree, Jens?  :P

I'm not working against a 2 year old tree, the tree is current. But it was
_originally_ against 6.12-something, and it looks like that commit had a
terrible merge resolution that ended up backing out the fix from
ba75ecb97d3f. I'll take a look.

rw_iter is just a toy branch so far, it's not like this is going anywhere
anytime soon.

-- 
Jens Axboe

