Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA313AD527
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786652489; cv=pass; b=OyGquUqQUk+/2JcyqPVyF9Cp33bprwAy8VW6esAhp/83RJy+tQePknrT9AeoWdj8lmPcNlJMZYc9euf0RxB8ZP73gRxd4rSSP79ZYe7uv8BYUrYvQFH6fvyJWnlNYswhPNBxZOTwN5AAxPz1JcrmsBxO/XDMc4CUeZi00VFtS54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786652489; c=relaxed/simple;
	bh=/EUsxCA39+lm4qZz/MBCSURD/yQCFJ9Pw3mnXV58pWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6zaZ/SugMpU8a9Zwk57NlPQtIckMWlLBHiOo5rEkBKQnkolS2YpjQozDwMBVMfxrcUClApfUTYEhFT8mPnOiFRuUEsorlRQl4sv3/Wo7tvdFLjVGC+cVW51gbqcfbWzN0a01LSCSPKMbcIC84IY0n4v1/QihmmRm68wdMs676A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8vZqrJm; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8vZqrJm"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66b2c08803cso367149d50.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 13:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786652486; cv=none;
        d=google.com; s=arc-20260327;
        b=knHMf3tMpg02OPc8aSbLBUUmQX0IRsbcehaJ6cDvBCd0ptsoyp6Ghn6hFm2fyb3cD2
         fKJPPUhD1PDYdoEjpICcGOdvhgYzs+SIPp6SO1vn6fguqXCzzfu0Py7q3DRiYlzZYskF
         yftbcoPVc3jO2s7Ks9CFtpXTDKvKaO2rNo25aEg8YvFNHU7nm5r7aAHQRuTInyAXZ4D1
         ONlcHOH9UigNjy0U2jLJRa56FPd4TpCic97oFbIuBTzCdcRQIichuvbuRBtJyTdvZpsF
         +VrIDmg9egzZfDCCgAsL+NZfN/mkBEqpw19eXLAmbXjU1jbtTsq8+qE6+mp5MUKsDvGE
         aqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9LYBk4sPgx1JAH4KgQ0V1nTggAqg7YV53F/Ftprz+uc=;
        fh=E8PfGUyZlL109joTh+8pUOw3twZuzRtoIOwben2+lIQ=;
        b=VUyQ1Jbodg068WHMk1NMqkMsbnU0WtJv4UngpGtqJwQ3R2EMTEe0NMOdXzvYb4i5vw
         nwzSf8OnMQUK4za9XAFJEIOYV6SO4eIoCSN7w3d6dgI4qVwKMhqbZr6mpvVvSDPhAg9O
         jkvD2CGl1KHBc7jPJpbIn1JoFfIutyWWPG6IqvMWUDVDrlsImB5K82ttao/E+LSfzDd2
         qH3WaA20KV9nuRIq352T8D6uG812OZhcnZqdQxQD9BPadJkWITMNlJRcJsvUX8MESNwh
         25TRVafwg+l+qHizC/gAfVABPHmK3vsr+Xtm185GLHM6NQ3JbMRztkW6INYaTs6PADA5
         5baA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786652486; x=1787257286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9LYBk4sPgx1JAH4KgQ0V1nTggAqg7YV53F/Ftprz+uc=;
        b=g8vZqrJmlMFRhMlHeNxnO56l4ZPv+ulgO1tohZKeDeSoscygiHdAe2Aavyip3AbApq
         7gCs9wb1pDaE4rEe5OwqlIxD0mHvG2na4tg27N6sAgXDiFoaG5lS2q8Ut4wjxLoLsxnj
         qXDEa2g8UFB04Fosy4zYYVnHIt9WFqmJRTolVAlJlmvOvkQJKvHV3hXoMiJe65wOn7Z8
         2cL/2/4PpjO7tivoRHIguKnRY3gx5j+mtCn6G6Wv34kU887fJ5P5ZIS/vazS/b4awmND
         qVlv6UddQcyCczKXwoMlBljkOc+NxpYx3ca7Owd+ptZViMlcbxIaHT1VJLiOkTL1fa8d
         AFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786652486; x=1787257286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LYBk4sPgx1JAH4KgQ0V1nTggAqg7YV53F/Ftprz+uc=;
        b=D4Yk0o77kjrFHsDLZUK6hwoKEBfsozzfmli2gb7AN/LnubhAQUFbxA2s5VTXDOkenh
         rR2ph6c4tZweI4WGf7yH3vU8bCAwuzrnSfIfxd3ogfjt6I8+VoyRlWXhbk1D/AjZkGhk
         wjxFz7kOmEhBZTtTGC5Qs4p0IbN5YUS63Z6GUlSkEKaaJbhZYkM3uEi/1HOBERA9WTXv
         +Nu+cC9nGN3Pagole3VS3F50uK/eo51S4KXAlYz+kkhc6Km4SXt5qqPK0GhngNgbNKGZ
         M8DSrRAkhIquQrE9qD36pGa23Z0d46fZw7G0kjEnrpDxL8qYzOSUPCi6AXrZEIqIbhX/
         cqPg==
X-Forwarded-Encrypted: i=1; AHgh+RrtrIJ7VCnsEPjGpg0VvogQS/eRKgRkNi27FWQwylGMSZ3Vwtt//M+zcK8/zCSYBxtbRF7mswVnFWfNp086@lists.linux.dev
X-Gm-Message-State: AOJu0YxlToGmljThmbRJB/N5HVjKp93CEopkieShSQa0VNQvT8/XgRrb
	LXcgfA1TZP0W938YF+CIv6AnbGc1v7ynpdaOzobJDyY6/MFFXPflndOMPLnkefZQXbqv5Ygf4Iy
	00eDZq4f26gu6oRzj6lVTUSjrikw+rAw=
X-Gm-Gg: AR+sD10XbsUC7Cd5uWGNf10i8T6mBsmUesG/WnVA7fOVU86j8Ved8ji5bmSwmQjSZWt
	BPFbMxPwmusJDR4uI/TPYsvdigECyvZtJrEHCNrn0KbPRQ1gzNe52/B0Gr9rqeNI0X8tnPEbdHm
	SAF8K8SZrFnOae81IZ8bE9Wo58eRhLyH2x1YI7JyPEbmz8I609gDLg/JhHHWoF1qPN+CjW5DM03
	PDzWhrtYbY+jndA4rib7jgCdO1KF3bpg2/BraRexSNQPQ22z8f1CaVzLMHPgIozIVazzVR4jpUR
	cXwbVljGewxLPUO/xmtOdJj760vt9UC21/XkA32N9E67AYG0vlvznTGBBC+COUhRiwH0088+WKG
	mFcE=
X-Received: by 2002:a05:690e:43c7:b0:669:8d7d:a5c8 with SMTP id
 956f58d0204a3-66c72ebeedbmr297462d50.54.1786652486534; Thu, 13 Aug 2026
 13:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202608140244.f2Omwf4y-lkp@intel.com>
In-Reply-To: <202608140244.f2Omwf4y-lkp@intel.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Thu, 13 Aug 2026 16:21:15 -0400
X-Gm-Features: AUfX_mwUH8rppqOLlLKZe5EqV-Qv_xkpyD0Cl5wZIq7dIz9NFmE9CN4eGxZAk4E
Message-ID: <CAJJ9bXy7KXcumxRVg0MzcYMt5Dw2txzzUKJryDE08cLfBfnr6A@mail.gmail.com>
Subject: Re: net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks() warn:
 potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 3:05=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
> It doesn't really cause a problem these days because copy_to_user()
> doesn't accept sizes more than INT_MAX but it would trigger a warning.

Thanks, good catch.

Claude noted that sctp_getsockopt_local_auth_chunks might also be
worth fixing.  If no one objects, I'll address both sides in a set.

Thanks,
Mike
