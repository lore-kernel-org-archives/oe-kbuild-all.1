Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF9033DD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137575; cv=none; b=iYzgREgSnsKiXg7ZTSdlVg4pZMKGccdxkg/NKQ9l5ev5Zmx1O9c/FB5NsvkH/392w3inCXA4yZGQ8BFONaZSkF7fYSEgRJOh5iMgptWN8SjzlWKQLv8LXMrHeA8rMASLfSHajzJb6pdXSRtpSMY6EsCGM7VFonhMo5JKboAyiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137575; c=relaxed/simple;
	bh=HkHgehI+WaG4c0DqeBYHe1vEiL7jpcCz3alv2nQMpVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=kpCnGgBmLrDMAaXDMicKdQ+CgUP5J1T/2J5UyXf12w93DCYUuYSksqVkXF4ifKuJ/DHYGtYghDqRlfLJmC1y9cD2TryCufgQRBOg+iX06TYFvBrGT8siL6RP3R/qKbZOWtmvXM83B310biXTDPoAOXHTyEqIWK+VgfjXOhRxNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=DEIhUntk; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="DEIhUntk"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78406c22dc7so287195185a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Feb 2024 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1707137572; x=1707742372; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HkHgehI+WaG4c0DqeBYHe1vEiL7jpcCz3alv2nQMpVE=;
        b=DEIhUntk4QJTHw+tfNhdMh8mWmi8VqkLiK3RoERFVeK/yeggrGc+Kvyw7CI40DCZ5n
         AUFmeCUyMGip/RQ8xIi3QZgvqWOetzWa0YWmP4HoyCt1n3if/kg0idIVHWyB1LNyQn0/
         d5AkuVqRwG6Yi6rn0Y5W2+BPwPGsrNv4t3Zj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137572; x=1707742372;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkHgehI+WaG4c0DqeBYHe1vEiL7jpcCz3alv2nQMpVE=;
        b=mg+otlkF4kZjikEE5kGvS0s+Mf9sBYcfR6m84IrcbQrxMnglofnZleXwRXKK99XW3d
         IjleLRMkmlFhXQsq9VsXsgnWlr1pZjVrSyN0SDCd1Y46wBuvvXGxjkzGNHtXyqzt8nzg
         fAXo1wf2b4pA2+HxfJj4HjmeXM7pGNlVZp2hL1ap738rmP/P8/i9SkyfCBQSe1DFDMZj
         72unJyJ50G/aBHkDxPd/2zHoUaKWZXIUEWQQgkHrOGahKCSXJyQzaq4Ji1bEWL3uE/t7
         COL4wk5uYLdcNVr/tNKf/ZTjf1zQEUpkaZ0Wu2iTabUvA50WHU3gEbkTwLm81GCEI+D+
         bMjg==
X-Gm-Message-State: AOJu0YzMLVJHZuyfZ5KjdatB1eA9PUwn9+OOoRl2yJhyBWRNJ435Ai+6
	HW1eRF/Go7zNRoAGdTT3S1s3dN/gbMOG+w6DMoAdYcC1R73T/CwCDg9AN0mQ6GafrwWfeBKiLpz
	C
X-Google-Smtp-Source: AGHT+IHv3J+Oy1vQFgBNQay5e2uYyjMXZUhDEAAG1ojm3yKUyWo6jVNCqGESjMKGxhTJMs1ZwTVrhg==
X-Received: by 2002:a05:620a:b82:b0:783:7fa2:e6 with SMTP id k2-20020a05620a0b8200b007837fa200e6mr11873808qkh.67.1707137572338;
        Mon, 05 Feb 2024 04:52:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU/0CS/ctURe7AZkyH0035lhV5nv5FUihR2ayRY4vS+xLB1oqpj0CLWJZem0eZ9o/mchF9SIh0lnReTlHvMxMje8YuKT2caIpwZCc9dKVQ+4Qe4hr+XxMX8Vx4VmZkxtvFsX5PIBh+HNgLXa2NgmQJjRcmEI1CdGnsfDGHFOCRZTtkSpSiACJZG5/oQ/enHNx++fpo3Ji9G3P1D179WekeS
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id n9-20020a05620a222900b0078565ed2bc6sm1839309qkh.124.2024.02.05.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:52:51 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: luzmaximilian@gmail.com
Cc: W_Armin@gmx.de,
	ivor@iwanders.net,
	linux-hwmon@vger.kernel.org,
	linux@roeck-us.net,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:87: undefined reference to `__ssam_device_driver_register'
Date: Mon,  5 Feb 2024 07:52:49 -0500
Message-Id: <20240205125249.3740-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <50af81da-779b-4782-9326-043bc204bfe6@gmail.com>
References: <50af81da-779b-4782-9326-043bc204bfe6@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

> Missing 'depends on SURFACE_AGGREGATOR' in the Kconfig.

Unfortunately, `SURFACE_AGGREGATOR` is what was in the Kconfig, it should
have been `SURFACE_AGGREGATOR_BUS` instead, that's where the missing symbol
is defined. I wonder if that split still provides value, but that's
off topic for this thread.

I see that c3747f28ebcefe34d6ea2e4eb2d3bb6b9d574b5f is no longer in the
branch, but 42c88a7d1474b6f6e53acca3522d179d3c9b1c6f is where this is
already changed over.

Thanks again Guenter!

~Ivor
