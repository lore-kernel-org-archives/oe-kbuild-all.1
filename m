Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3562D350293
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763039852; cv=none; b=pmMF3KtQkjHznEZ97mLUXE1u1YuYVOuF3zkJbVjCsPg3Ttz6BDnKCGFMemZ4ot6LLg2K+QvhTPSgboLCJKPbNEipOqQNPJGc8nnZroe2vmMu7tpSlCNCeFuCSiKDr7qGWLxtxwAywIxMHld9j1DYCByL9yl2YCGJh0NHs3lV2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763039852; c=relaxed/simple;
	bh=qevxKG5CiOTkiXWDTKsz8tLT6M20acSj7pUk8B1nO04=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Du2osN2Tha2JSFnyqC8GRdsUCcpFxIXlzS70tqoxtF3IfUnjqGZy1xKdIDF5v9GDAIwFnkCW4sBwDdOXIbc+90TIY8LoRmqi4hHxgCyj5oUvEbdQDDejT8fBDWG2h1nz4yl1b5Rs5HfFCslu0nGEgOuKqbVA9a1VKDFG/doGm1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GJTI7h4X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GJTI7h4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763039850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qevxKG5CiOTkiXWDTKsz8tLT6M20acSj7pUk8B1nO04=;
	b=GJTI7h4XFiM+GT+zSvvbPM0M8mai7lvoiASqhH2URPvW8mIeamiQAf0oypu0j3vWZ3oE5K
	57jlnT6ovXoLei/lrGZpewJhcbjcBZXxJFQ4+YMBA8FhQrfno8Z8MiJMa80uiBZxkfwnNa
	Dqd+8OciKACFx7rtHKdEYDfLTTbTvDM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-Od5Fu3UeOhKGXV_yhDIGRQ-1; Thu, 13 Nov 2025 08:17:29 -0500
X-MC-Unique: Od5Fu3UeOhKGXV_yhDIGRQ-1
X-Mimecast-MFC-AGG-ID: Od5Fu3UeOhKGXV_yhDIGRQ_1763039848
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso6793415e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 05:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039848; x=1763644648;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qevxKG5CiOTkiXWDTKsz8tLT6M20acSj7pUk8B1nO04=;
        b=MUu592uZlRnhQ0VUiNrOv9lrcXtCH7TssFkrRWYERwVYWfW2Cevzorncf7UFnpmL+A
         pHXCOUWGWSgmO8x+Y4ZqmAEdZVGAyKtVCq/aSqvwabmdIhLn8vokLN//kuTRzoBwI+6B
         AW9jS9Txn8NqDAV1urqrs2CTmLnsRogds8CsfoSUZ/bKdz82dYIB4AG+1A8KrnhAWXZh
         2rxj56MqmNR0sbkJkT5HeE/aBGhk18ApUbO5ecqdOX9UcjopdZ0Ve0vgK9ddmQnu8b9W
         Y4EuB5UGhTHcEDBT94R55olseSgLFG5bjZfAR+xCS6gqEmHuFosWzqtzjo8KoCROGTY1
         KzAg==
X-Forwarded-Encrypted: i=1; AJvYcCVr+Pkq7F2ZBd/U2cFPphoFrVFK8fRbkzPhOq5qJdJlfnVvYkcLb1M3NZRISMemVykEoIkkVAGLCuE/kbNy@lists.linux.dev
X-Gm-Message-State: AOJu0YzspbaYI3c58ZzlDQ9X/Vg0RRB+sVHhoGIDz8xpBF49tTh4bcEh
	srfPO+AD6gzr5f2gLs64XzuciXmVg9tXc+J7pVzxp/b6cef2UjQ5Ipe4bazytWiNxk41OfppXar
	0JM+49Wc4T47VDqs0QNpKQEBVxN0s/CxD2GTu+MiCaiA8Fo+HF0J5I0eRLjzjBmo04Kc=
X-Gm-Gg: ASbGncsb4O5Y3440r0OyDRm3s4VI7WBRZVrYSQAAzC4Kg2LCeEZkhAskHP6WFOSOmLg
	xrAuK3eIyD8aa4ShMpLDhjWWV6dFzERX2zO4r5p886GOZw/m3stM8LqDClo7PEZKyK4YvUEmYFG
	H64obOZTnHWwE9GLt4L5CPwIb9QRW17N9P6/gZFdf/w9+ovbGXQWGds/KGJ3D8Kn2TzR6N/Oo2a
	ol+eZqKii+rwKP/6EWKwSI2o0if3PH/hu5TXNQu/Bib+nnjfRZUgFCYSOCkM0SGcuO0TyjpckD2
	nPEehoiUSHZwBBYWRQh4ZjSxCtg+5BrrKagUszO3E8DClq9B6Zmvx4Xfh2i7l8elq8P66czsfIW
	x5cMuAwuEWsGJ8oZEtm8XXSNiz44=
X-Received: by 2002:a05:600c:3153:b0:477:79a0:51e with SMTP id 5b1f17b1804b1-477871e8411mr54404745e9.40.1763039847871;
        Thu, 13 Nov 2025 05:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHOQ539u8DXltIYAuT5a2CteB1MT2o+TSWryPB2beeV97E36xvC+7NTzD7kK292d+kwJkefw==
X-Received: by 2002:a05:600c:3153:b0:477:79a0:51e with SMTP id 5b1f17b1804b1-477871e8411mr54404495e9.40.1763039847449;
        Thu, 13 Nov 2025 05:17:27 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e953e3sm89018465e9.14.2025.11.13.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:17:27 -0800 (PST)
Message-ID: <c4bb3aa4a73c0ec815bdc30c104b6f90fae5ed39.camel@redhat.com>
Subject: Re: [trace:latency/for-next 3/5]
 kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of
 'rv_sleep' follows non-static declaration
From: Gabriele Monaco <gmonaco@redhat.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 Steven Rostedt <rostedt@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Date: Thu, 13 Nov 2025 14:17:25 +0100
In-Reply-To: <20251113130659-27597fbf-a991-4cfb-aaf5-de69100ed34d@linutronix.de>
References: <202511131948.vxi5mdjU-lkp@intel.com>
	 <20251113130659-27597fbf-a991-4cfb-aaf5-de69100ed34d@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xT-ACjwsRYe96LI6ARiapKukd3UqDLbIK6cXatgvQs4_1763039848
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-11-13 at 13:13 +0100, Thomas Wei=C3=9Fschuh wrote:
> That 'extern' declaration if !CONFIG_RV_REACTORS doesn't make sense.
> The whole conditional should go away and just always declare:
>=20
> static struct rv_monitor RV_MONITOR_NAME;
>=20
> Want me to send a new revision or will you fix it up directly?

The commit is already on linux-next, I guess the easiest thing is to send a=
 fix
commit on top of that and Steven can decide whether to squash it before sen=
ding
it to Linus or leave it as it is.

I can handle this.

Thanks,
Gabriele

