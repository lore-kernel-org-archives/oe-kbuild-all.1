Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA751FE44B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763920675; cv=none; b=hAkEZAsGi6iRgyf0NP27QZeVah6kf3JwiJxubptVN3WdXYsRVz4bFqCKxMiTzNNHwjx9xB8M/ZDBuWX+or3Rwy2woaCeRU37VFCEvePNOizqP6bvCMwluGSdjynZoY0XxFQeb6Q7DWbK3aHSrINqHZN6hn9cBmq75Wwa/UVgUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763920675; c=relaxed/simple;
	bh=9t/2tmvU9FOadULC1rpEOOF+wxXg4qy5y3mnHuoW8m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7j1jQbnkdDl1s4puqP77JmvWH0IjhIePU3Oo7EirfRf4JtVSc/YDF0UKjp+BhFb/fjWPlkPnFFYk+Okrq+AltcU33eUJ6cPykLVT8t8hCcbgii4anA9HFlcQDQEP2wfAW6JaacOkOxul/rRG6h6VzC9wIH2rhRtqbkZlDk0Hbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PbAGUOGJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PbAGUOGJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso5419783a12.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 09:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763920672; x=1764525472; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tpsNplA1Voxrb2YjfEKZCml9qot8JSx+g9qK04gre68=;
        b=PbAGUOGJ8ibnQO+xyTiZ3evU4RhmeCLHV7gQmzWlpjj18yoBCjXcBkXRZBW6B9YSOF
         AeOTT4wE7S9U5ZixZ73aAV6NBGqnyMppnQSIfKf+XJyAKxzi2An1a3iuWBOnDswtUuUO
         +IwO7AmKygd3dZMiUI/iDbvJvDLDX4AR0jXC9PwdqwUjeDhcDhrQfUTpgqAZ39jERxER
         k5Sfpsl2LVlI5QUvP6l+iHcni94ZGjYMYDfLG9tso49tMFp3grJlmfYliErDTTHDkk6l
         ffnSuA+INqh2RVlcMVmOiZYw6Z7I3mjao0oc9wnEn9zzwe8Vwekx0TLPxve6/+CC/UOy
         ojFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763920672; x=1764525472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpsNplA1Voxrb2YjfEKZCml9qot8JSx+g9qK04gre68=;
        b=wjTjLtyQD9edwG5nOBEwb1nD++HOTUT8U+aX54jR/C0NFX+OY2U+CFWo0onBXE8grT
         fAtys0hZkr2uNmjZBKahDlc+H/TdcfsZluftDnbNpMChEJCG5CJHPYYTXwLRxxTooGde
         UxLCp9Wn8IIVRLrHXkiDEfAeYG60vinLCINUIyBjvkwYzR1QzWyIpV123SfSU2CSEkDX
         XVLlwQtgi6zdOlS48D9NlobbGGawaZ3dXkbBmBS6dIBp1lDzRJB2Si1EOKu8ZklJ0xJ5
         iiO0t21nTXuh/DF3PciasAwRRqJhgOYQdSmAaXHziN796ndCanSkdFzBer0TSpZrDvjx
         Yvvg==
X-Gm-Message-State: AOJu0YyiRyOAK4QbDf6e+QFucqCBmqi4w8NrmenCJWriiQwMQw8kp3He
	SyisW5v5iFNlNLRmuaWWrMQh/8Fy2FlIEtSPVtDnM9XKEU90t9CDJKvQZs1oX70tK7is90YUaIw
	iwPFqLgvNP5S0QhTP0UGbk9wC4PHIY9FGdmKZOj5isg==
X-Gm-Gg: ASbGncu+6WW+hSKEVyseT1veIg5lSG1C3swDb7s4w0BKy6pJcKlJQlu30jIz0BvoXF9
	bEZ/mwmveaC0dOgMREP7ux4uQPgGobe/jXDDAuHYof94fwm765PpA1sI7a/ofbnSdxyTpfC0C+H
	Tf9F0qc7eFRQR5Nh2S1BRmfpKAuxeY4hCBR4Af7v8qkdbjxWWWCwBb+lTE9M7lOyhdp1If3QYES
	EKlLM0FTGp96ps537D30+JKKouS+T0UZVnsAHBmK869IHjC/4g1kmUa8wYxddY2mBGm
X-Google-Smtp-Source: AGHT+IGpPvGwBwElKBibg79KxrBIQZdO1vFW5PwlaPoM2uZEHzARN/i8TzvXzLxaRVhlOvuafeBOkUf5sYbTlf60CsU=
X-Received: by 2002:a05:6402:2750:b0:640:f1ea:8d1b with SMTP id
 4fb4d7f45d1cf-64554665a54mr8854375a12.16.1763920671902; Sun, 23 Nov 2025
 09:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aSKvbLiFT0aParmU@rli9-mobl>
In-Reply-To: <aSKvbLiFT0aParmU@rli9-mobl>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 23 Nov 2025 12:57:15 -0500
X-Gm-Features: AWmQ_bkrWaeby1Q8WA0pRgWJpDWpR9oPfzbbe6thBvqJtwQSoichCxeFeoD0NkI
Message-ID: <CA+CK2bAsNp2j=U4o9pAfC87TSE+1sPRA4Gd6AjCUW2ZGKffTgw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 86/104] liveupdate.c:21:10: fatal
 error: errno.h: No such file or directory
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

> Note: the akpm-mm/mm-nonmm-unstable HEAD 5b8dc8b45ebd9e7f3fea3adefeccd9ce94215103 builds fine.
>       It only hurts bisectability.
>
> All errors (new ones prefixed by >>):
>
> >> liveupdate.c:21:10: fatal error: errno.h: No such file or directory
>       21 | #include <errno.h>
>          |          ^~~~~~~~~
>    compilation terminated.

I am not sure what needs to be done here. I have tried to reproduce
this, and every single other selftest that includes standard libraries
(most of them) spits out exactly the same error.

Pasha
