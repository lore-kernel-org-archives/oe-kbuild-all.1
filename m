Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DC349B0D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 04:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152312; cv=pass; b=j10olNLSuxUrO64yL9UBe09S5B8gakCiY0LpCwA2t2LHIkLhojMeYzebGyAg6qs55W/4RjT1kJd2pEVUg0ZHlOU5V48oSeKCGMeeN2+WLuuyMMTpKmXgVTMv6ras9sSGJRQ8WeMan0NkBVEk8dPS6D9P2XsS1diVo2OvE9Gc3Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152312; c=relaxed/simple;
	bh=dMeIjGINU68XMQlxVozYPSjbGlLjooPfx/CcwJ9zxNY=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBZwVNUA9VHZc8z0Y3tBRe3kRg/h0qOgl/KCc6mQrhlA5UjJZh4tHeH0B3bpHpN/b/FoQ9BCmQ3xg+1iR3k4KOuqK7FNErYN0yNkAS/MmNA6ox2YMEHkHVZ20/wf+zb7tgtxw9gj0TrV5MIBUqkA/Tvy0r+gTkorG65p1Ie57y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIKLvgef; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIKLvgef"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso4295784a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 21:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788152309; cv=none;
        d=google.com; s=arc-20260327;
        b=KN3vrlozODGU+W1cj3ClxS+yVKw8QPQI3AUlhkQyGWFUjfuQGkEs9TKdvfSVySSa8y
         89MUs85UFom7xwY4s9Zm0eQ+p5GiOTn7XpKqK7cJvhANsNo2bNS8bjum0cxTXELhYWKD
         HCb9HEnQXlw7vyFjOCZmTCyhtjYI+TX7ZkXTxjb33KI4AB36PetNtVdo7wL+ipv35Bvl
         sUMfCjc246W/izdfWAnxv5KZtxFjy0tIzscuFVSzLSeBKBD8FzxrNrCHorfpXnhiaqp5
         J/b7WCZ5Lds1uu6X2NJCsGNrU5PhLANK8yzTfy1MqdLxkBkfP2yy72W/fmevPigqgN2y
         zRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=dMeIjGINU68XMQlxVozYPSjbGlLjooPfx/CcwJ9zxNY=;
        fh=9Qzo/MmqeGHXLBQLInXZjJ+TJR2VLfVDsWEBtmMVJwE=;
        b=YjqjsoZZATYRx4es+FjOrCCbHs5l2JbNRUhXQzJTkqfI8NtBmB/1jXO0LXRmt0apHy
         9v1NLCzZYkiQiKoc9tXxSr56lMN55X3WSLyH1Vq860h86pZcEJufv/dDzTCsZ29PE6KX
         kpD6tj7YUfDRynKoupUZQRmJMLIb4IICKGBlwYFvQayB6TlFThNWq9kk9BtAYGD6D3op
         QHB22kX6M1TN1EW0WHMYTcPlGFzeQcGOT9skN86VNNKZ1+HVYuyUBAz77oeaBTLprQSD
         5wR7Hg972ZyQ4Ei30dejQ4QhrwmkdHnDE8AOZ/oDC8yoOBYFlRs+yrFdrNPS/NyibYx+
         MxmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788152309; x=1788757109; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMeIjGINU68XMQlxVozYPSjbGlLjooPfx/CcwJ9zxNY=;
        b=cIKLvgef0Wp0lPxh4fjcts7MaNo9W2LeuvUEwDKCydx7Q2RhbSGgQMm2I6p7wpNgb7
         yPU4Hn6DZPXI9fPOVAoQEuvMBhVOeVOWSYUKCsQ7X7NdXsGjpZFOiuRGLrcJmYNLc2jg
         27D1hzcMb6C4JXJfyccypGjeBKQp9bt26xpGIiZ9leDFQHdwTaVcJ9PYNM8b3yGLafLP
         zWsnUj8Whe2jb1n8Jlo2W+Vf6/AzosWOQr8360yK09RrQLjdrXhxkn2qrlomAUGk2PoD
         8fqPBpqr0jg1Il2oIsXVAFYmsuMppPNxFX132CTIw7kgRcdHtZy1IHLC7KHWuaR37a15
         A9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152309; x=1788757109;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMeIjGINU68XMQlxVozYPSjbGlLjooPfx/CcwJ9zxNY=;
        b=H/63mGHHHE33y8M40nufaUkClCOkce46lkhwC4ascgbPXEiNkZ5+ddo1tioC7oAX9E
         HNG6ZLeeLYI1gjqX3QUyQK6+7kWLTryYtId+K1MlvjDrmiilmEeHQOWQIOcw5D1l2mYw
         uasIHzIomuiZweEYHrdQXi4NuZgN3/wzf5X2OBZg7hYavmb/0v7aaOLRUuA5tXsSPWD/
         BT9yqzlfS4NHs7P+/31bwzHWF6hqOlGbZXz6ScYYYnB+FYD59Fcjjkv7MZfGyg3Ni40Z
         ZQVASZ1JB7v5dxIt9zXImh88xKgzS2Au4zmib7grjsK1qYcnEJBs9XgsAKGWbuMjCnPK
         lICQ==
X-Gm-Message-State: AFuF++kC7y9W7XyjYjJIRjwOLvvQdmxbRT2UR/rAcmGnMiJqXPGaHjve
	0Iqlq9e7+6vWFghb8+0WFurm8zcYQbPbJ1KVlMUAXGmwI4F8x9yUZNNke1a4o1jwl9662yAjE4Q
	/fMk8JKv92KsJn8TT8bfO5iIZtj9pjdCpTqxr
X-Gm-Gg: AYBFou20BNi281Lnq57xhNB+r/InvIIsCGKhAskPFFxkpHRSkVBJd0ADHfshKXLtgU7
	RSTGIvxru7ROD8/Nhvha+6jJbNFK97svsitxGEgQ6IccvxADvtwL7xdXttyKOSbE4eqlg3anJvu
	zopwxBJcQnq+n+84AZBT23gWOfOBVdgGoPYP31o6yK8JXvaUfGdzoSDqFw01mtdBPTQTIEIFU5/
	x0LXRsYDxsESCpV74Z8b7Gij+7u1zCKuoCiwWrwisk1QDR+E61CNDvJjMv9/sbHjM9/76ei+ap1
	mRRDS17s+D+5+w/BZ2oJ0Fgk4ActUta+dehTzov8DDIWiCMkBIcTzBqbR/HE2+VXJL6/2jNvAhk
	/uA==
X-Received: by 2002:a05:6402:51c6:b0:6a6:32f5:5574 with SMTP id
 4fb4d7f45d1cf-6a632f556a0mr6173611a12.22.1788152309052; Sun, 30 Aug 2026
 21:58:29 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:27 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 06:58:27 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202608301900.19vrzwch-lkp@intel.com>
References: <202608301900.19vrzwch-lkp@intel.com>
Date: Mon, 31 Aug 2026 06:58:27 +0200
X-Gm-Features: AcwNN1Xv3VSb1ucSXGzy0LFA89dWt3lu69MTwHhWoVMxpPn0XH_7tKX2tcMP_W4
Message-ID: <CAH=xXfEEgtMkrWkD3u09mbBpM+7jov2DGZS+N+ff8bDLd-Odww@mail.gmail.com>
Subject: Re: [chao:feature/subpage 5/10] include/linux/f2fs_fs.h:347:24:
 error: flexible array member in union
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the report.

This has the same root cause as the earlier SIT report. Flexible array
members that are alone in a struct or used in a union now use
DECLARE_FLEX_ARRAY(), including the inode address array,
direct/indirect node arrays, and NAT/SIT entry arrays. The changes are
folded into their respective patches for the next revision.

A W=1 m68k build at the reported node-layout patch now completes successfully.

Thanks,
Kelvin
