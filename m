Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EE3496D36
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942945; cv=pass; b=kPlEWHj1nV8eNEUjXKSPcyCLgV6ltbfQl0rn1APIbCrK3cyzRu1ou2A/R64GCN91F7bv0dhQ48Osg2z1vaHhHJJuldMsrWrLPQDh0aOiYMqrxWA0f1ibAPGxFdSV87/oZ+Z4GcMy/+pUy0j25p+lur16s/MUSfkrI08tuv1HloA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942945; c=relaxed/simple;
	bh=qsmqwU9VBoQfhQUrtDHIv6hsyfSZ2fJf/aXvCsmyhvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rh7HL+utkOJZku0A5XbQuLBH4bohtNAyRKJi8ieJogs7Osvp6ie9gQaqsNZq0eucurURvSHSMWgHYu8vmLfRGICtUjl2hvrq8PkonvEWcb4eCZ+dns9Qr5OVhNSxa1FbxH7vAKoSvau7CVvBZR9gw/CPiRKBkb9emFZ4q7SpTDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QJgEDfar; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QJgEDfar"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db33db4de9so52305ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 02 Oct 2026 05:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790942943; cv=none;
        d=google.com; s=arc-20260327;
        b=qKVfDxrrA/zJTg9lr1wuRSvFYm0wqC/tXa/jjxXetBKImqvX7vYbS7Zj4xriwQa3O+
         I+t5wmXLimUMic8olnTjJizWQouOy4Es+4GPAZrjxXmhuK7sBbr8qynv+rudBTaisXm/
         7LyOnKC8gXQfCxbikja5BVeMWNpWPVJGacBFRIIEXHYzVZ398eb3JT2+xYbDPo45rvLT
         xadKw8LLHUjZQQSqLqFmArXHZ6XgxTyCRQlLc+Rx2mJw/kGzdDI4AcdM+PFZp+eDoysh
         T812RwHMG1VMCdoie8ian6IJ5lx3TrX2OBB3Fe42CMfTkos+fWMW0qO9v9CWoIKBuBV5
         EOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7vZaEXouwlQhve+1E94mjnYCYQ6hHUa/jAWbN6cjkew=;
        fh=7Y1h4Co9vAjHlVg5PcOXpE7Ez6TAlY3eILBGnbAbnEo=;
        b=fECF/CIM20gbM+SGJdZP9M1GxJvplifjRSsPJKSOqTNhsYN8Rb84eSJOlyHkGolX7m
         1AdUnQbGAC7/5OuTSLIOzffdbcFx0CDc97rCzby8gK3n2lABxng1c92vwyOUGvWkQdum
         FUel7EiTcDW6Qnw49Zaq/hR8EBii1RPdUOAfkT1XV9PWNjHQTn+mAmA0Pb3h0cgZTaW9
         XppaGX6JU9oHNt9l/TFsZyq+bW2snLPIlDV3viv5dMswRzr8FmoidP7SxpjycwEbgoiF
         YrmRcxz1vARDzRVAISfYb/oQzjqFY9DfUYm5TQnD51lD1vDwFox5XU74BDme5NgyqiWS
         QzSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790942943; x=1791547743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vZaEXouwlQhve+1E94mjnYCYQ6hHUa/jAWbN6cjkew=;
        b=QJgEDfar/fhnSSN1RC8CCcwz9vjrSjTyMnf4k/XaRsadJsvmFAH8xsmTnEoUT5CA2K
         BN8o2GASyN230fC9tOtu1McP8qLdqJhAowBC1adAzwow2s2MBmKKuGbjckfCBrQNOrw3
         iLP56zqg7U9eKfHDVYLhOXpFvcQjvyw9kWvAOniTyN71bKNJRfBwfAlse3CzkdFnNkk8
         ohrGxmk1XmFg193ZmeD+wTw0v7hNaPG+nMqiOoNCXmU1zx6BgUYVPz++JHRvswHRGvXx
         irouuVXVhp7MQjZt1Td4G2+CXviAo7SK1UkGnmaJkQSUet9SRU1aJsivLtJ/z05pDbMo
         cVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942943; x=1791547743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vZaEXouwlQhve+1E94mjnYCYQ6hHUa/jAWbN6cjkew=;
        b=KRCKeh0Yd7NUHGOZVGIRT2HrrG3Z8hxcLbPZO+InF6dFRrdAgGcpoCiCw7WV4GeCrA
         JMZpOqutSiKs4WMZP7f8o2Mv4VcXkZfSQSULFGoCxPBSK/uKQlIe0gfFZsa1qextGKiM
         QTaGu3SR8nrVfo/pIkHPp84f70WlbIf6iiHNCgOjGLA4AX95PqClZEEQvA53mDzGKoAs
         Kos9ViqDzYXO9OyoKnCkOp86T+bdg2UlxfwoxodIRgAtSAvNGDtFktmyvtUEBTka6eAp
         WZTq0PqFuTegPmDZy/4766cmcTKESmZZS6eKOD1fyEG7HeNXp/k+PvwL1RN9i7efrXei
         9yEQ==
X-Gm-Message-State: AFq9FYLlL933IenzpvKZ77Qi+uL1+EscaIOhPOu4Q5FDyYO7SrMIzpQy
	a4BopOl4ddkgqU/heGn8XAbt+0DiJQz61mvPPfJt/leRYQUCahRkakqWue3LxjEyNt7BUcGFoug
	Zg5KZjMhQRwDEn9UrUJ8PRgxSbX50zz8YsOOcsM2r
X-Gm-Gg: AYBFou1ssAD2GeOaCtQn3qFreqLsnLTSdKVa3v5sn8VPerVuuBuCDhNtT4+mnLgM7dP
	WqbmI+LnpWsVocttGp4XebISqyi6pJ0QWSc6DrgyBmbbx2SNAwF7mCh6hQmxaGBbpLcSZfzROSx
	/Q55YA6EZsSQkv3u3NaWW+pjDVQfDRKCoqGCJFkQ/Quy/nf+BAxNvSTzOPzGN3UQx0+imGCi0Is
	8o5c3N9v8doqUCxV2O5ISWeXV8ZloAn64BNlVmU5aiQOAqs2Bq5WdA2ctYPj5iTWLbgq/Giyu/o
	wPq4nAZvADezawfnp7VYEs4A2MPboTaZgNnd+lLForDDG0lz0wtzAnO4074KXM+t3U3jIcPqW8v
	W4j6ptImteIH50fi6ZpKqBA1DRMd/7DMFEpkxxqaHc9Q=
X-Received: by 2002:a17:903:40d1:b0:2d5:db3d:1a42 with SMTP id
 d9443c01a7336-2e4a138d7efmr3101295ad.15.1790942942272; Fri, 02 Oct 2026
 05:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202610020501.bKHR1IPb-lkp@intel.com>
In-Reply-To: <202610020501.bKHR1IPb-lkp@intel.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 Oct 2026 14:08:25 +0200
X-Gm-Features: AclHuK8u1AeZYzkcec06N434sbd_EeGgQm42eKnzFZC5smDqJkLCRMOVhIx5T2Q
Message-ID: <CAG48ez2h4FgP9iDrtB1uSJ3zkfavGdO8SfcLNNLUncDB5bDb7w@mail.gmail.com>
Subject: Re: [peterz-queue:locking/urgent 1/1] undefined reference to `futex_mm_init'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 11:19=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git =
locking/urgent
> head:   fcbe4307bda074abc8132bfe746eeb0e502d74ab
> commit: fcbe4307bda074abc8132bfe746eeb0e502d74ab [1/1] futex: Fix mm reus=
e handling for FUT_OFF_MMSHARED
> config: parisc-randconfig-1000-20261002 (https://download.01.org/0day-ci/=
archive/20261002/202610020501.bKHR1IPb-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261002/202610020501.bKHR1IPb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610020501.bKHR1IPb-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    hppa-linux-ld: kernel/fork.o: in function `mm_init.isra.0':
> >> (.text+0x2964): undefined reference to `futex_mm_init'

Oops, I broke the !CONFIG_FUTEX build... I've sent a fixup
http://lore.kernel.org/r/20261002120446.2313940-2-jannh@google.com
now.
