Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5E23C4E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 08:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084391; cv=none; b=hUMfZAm1Lu69UW+kbzmQ1F9vqKPKHO0I1uVdC8q/Q180F7iY0SBTz5H4m4qpJHD0uT/SqpR1NH2t/1XBQ22Sp0KC2m2YDkYkWV+yW+Nt+T9kSTB6Y6xr97yo7yQdqgnpOqDV685V7sm8PwpwrhYfvfTR1m8NekDtiiDt7Ks5Sak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084391; c=relaxed/simple;
	bh=Cq5sJ7aSsShFxc17IH78w46REgBf/R4daQQ88MHxHWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGmz6tt1Staw8QVbO/VkHSUXLi0FLxpO1iHPTJA+R9OjuN0cOCPHI8Swzfcy1MgTS/03mr00LN4GDbn6gk59mAXhwrOhGgI5SRSo8SHlUo//YtGWTHiZ1b3ZpLEg5hd6dAjWkq8q3ri37YMhXMK6BbUZoZwUScYAXfzKYvN8PoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAQASiMm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAQASiMm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-280fc0e9f50so3136275ad.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 01:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760084389; x=1760689189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq5sJ7aSsShFxc17IH78w46REgBf/R4daQQ88MHxHWQ=;
        b=JAQASiMmzndZRplvCMenaEIybktdxfW1NZPZ1cL3Tb9z/aOKTO2mTCPC6ime1MF8Zr
         63dMo6oOIHwCVxp+bu3yhWK3u7ckauP9wyyzshhmAWEu0v5ApbZwzFKazlQg3vQs2a28
         5AWPt+bEq8E8JkJ4PHyE+uP/Vf4pGeKMiMQi4siJ8QxByqCU1gqu3qbXCx9ApmQr35nj
         oL28m6gaFPrRmsV8+ayraXdmrfy2CKCP0o8a30cTjqV/R40G4dyax1wqbVxwtoREOHaW
         Qp67gOEsOnXNp2croC2LBTxDqVqsm4un5yxEnh3utEVhSUdUTCBpay+itHxr4dDUBnWs
         BTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084389; x=1760689189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq5sJ7aSsShFxc17IH78w46REgBf/R4daQQ88MHxHWQ=;
        b=P0PVyAE+bktYUB39WRpy+0dXaKgvNW/+DKPrwxZ3TSRX8CgZfOK2YY4iDYhcakazJe
         JzGSZgYuXiOCdNEa8LKh1TpY/LoFLtLmaetERxPkCpkQ1SxKyE6Kl9A0zbb9WC6tpHai
         BRxS8/zaKyWhte8RNS6aTRKT30jAt8uno0HW8VHRDLceHK24Xs3DK4st9zdTGY0KVEsf
         iYJYiwwnKnsg5Zdbe8SDQKJVy3xel8u48L31AtYHd5p+9vfth87A1tbotX/2hIUScWzO
         RsY6V1i7y/l7Z6zkaRyXFGY1LifekzrL3zsNnrXiim3gWUjEIyv+WFJw00pAOOFpHGxk
         Gbhg==
X-Forwarded-Encrypted: i=1; AJvYcCU89bDdT0MC9PigdoE3dlcZna+5UhFvMXDpafnYzyGiFJya8hK5fj6PQabQ2NdU+P3r4A5RwCQdisTcBFJh@lists.linux.dev
X-Gm-Message-State: AOJu0YyU5f6HDNh6a+qhEQDGeYALBp/+0EbGG0K813VucghMniRpugGX
	RZK5WJ/m0hMxmStOpuxhgplc8DMGUXfxM3QpS71Lyi16B8zd7T4V2LFjyAx2t63F5AYdpFXBBoD
	2YbABRpZxqV8cYX5RAWFQpEAyLPKy+jg=
X-Gm-Gg: ASbGncsH89Zl63KyJBI+kg+fqyab7bs8j+rAMXxUnGTgcH/XI91WBbJX2pEerx9d6wE
	nmRUNGn0PYwIzm5symrYar406eFCRT/RrjupxLpjq2GvnYSMLIqxc/dvN6F9uThWsksmVWI6m/a
	Jl9Jjse7/Xz7duRDKjzKfl7Agl/nq3MlcVRcuYfA2NZLQ2hSFKhVb3jqCHyfLMRJnFdctPyePs2
	FX9rwI+rQ4PsSIIELA18f3nkZ6KMgpD4UO3+n25Ei81n/PMPgBzGEZqRSUaJMS+gRJEeiITO2yM
	J/HrwsebgYDNQRESuolbRDM86D7nGQz8ObrN/Bohlfzo
X-Google-Smtp-Source: AGHT+IHsGqk0VxZVnRC6qblIgP8WmMkDMtg7G1rQix4D/f/fNxV3LDfDLnO6Fj2/zAlwLN0dYCpWL+UWmTlPxiqHxts=
X-Received: by 2002:a17:903:18c:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-290273040acmr83793555ad.9.1760084389280; Fri, 10 Oct 2025
 01:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
 <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
 <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
 <20251010074458.GA91144@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com> <CANiq72mzrJNTe6aw5zJ_vyhXO1jDR96hmvQEXPkqFj=dnwSnSA@mail.gmail.com>
In-Reply-To: <CANiq72mzrJNTe6aw5zJ_vyhXO1jDR96hmvQEXPkqFj=dnwSnSA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 10:19:37 +0200
X-Gm-Features: AS18NWCOn0jUQlOTDgY6ZmGAYLoWjP7H_Q3V1N2lr7McmrZCKjd0e-TiKap1ODw
Message-ID: <CANiq72nkvd0UApjCYUcYu19nv+Ow2irz8WEPahiAf=6N5RZiyg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 10:13=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Otherwise, for the moment we can go with [1]. It is just a single `#ifdef=
`.

And if this becomes a bigger deal before we can start applying
`bindgen`'s feature for this, we can always look into imitating
`bindgen` to fetch the values on our own, i.e. with an extra step in
the build or similar. It wouldn't be the first time we do things like
that...

Cheers,
Miguel
