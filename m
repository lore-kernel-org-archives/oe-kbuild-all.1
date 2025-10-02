Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED99327E048
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444771; cv=none; b=oIvhDT6y26NkVtB5kPAXk/6+u2H1GxfB2lzkuhIeUS6SKFa4gbUk0TVcSjTZY6xIADAmzLG7TyHbKDEUClccIQ7nVRNN/LFQDjQlChFeyOYOpA0jdQJJKj7z3B7J1jsQbupqPi7usCjJfKJ8twhZcSnudArW9bW7N+cMUohK9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444771; c=relaxed/simple;
	bh=MPv+Iwkd7lH6O3lPVcnYm0HoR2osP0+61xnq0XTVgYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kB0nTphKAcXy7sDTAQ44ORjujvoI/Ar0Oalutve/rrU6b9dAfDxtb4OM5N6+v3FdGjC/Y9YBOvbH0Q6Ul/vPYfDhUXNttHkrEANjdnE9PcywageECuAvrp+lkpcKxWI7TEDcxxY5nIbPXBopzI7WVTuckHjwByIQYfLz8VMOjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQaYzzJu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQaYzzJu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-26987b80720so2139355ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Oct 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759444769; x=1760049569; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8E52QWTGIfO2NrRkEaHfqTdphgmYcegsGjZ94/TNcc=;
        b=DQaYzzJuKf3z6g5IG6d6hO23g6bHqHMuqjbPT5+mkSa2pr4hp0x1oNcnHBKuBtEUf2
         FB7g0TyX6lGDfoLW/upNA+6/sy9hDc0RPN9QHJYK5hfi6z0oaoGT8om69B6cL1aXa8eW
         meKArpdQlyQuUgV/BwRJ2kc6VRV0yK3zP/U2dzxjP6EBgjFV9foqkAUQF8u7oelckj9t
         hd3X9qe5XPRWWgr6MGYbNeipSJFnuV1OedpNWTJ49txkRqmhJV3FDi2b5f/mP0B8zuGo
         DDcMkEY7FS8lnDskIpAqoYlspHEiIKRwCp3g1xl/ZV2SUrf7iUHMkXimNffYVg/8YooY
         78mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444769; x=1760049569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8E52QWTGIfO2NrRkEaHfqTdphgmYcegsGjZ94/TNcc=;
        b=dxW1x9AZ7AGLfmAhi2JXREpDgxm4EUhkUImEGyNu8nyrMTe0QUQU4wiaDAoNX6IHQJ
         +jfZc9qukugBcR4+Ow+u6pIDsZBLRLo/NprHrZM0nMsoJq9xL4L9lh+OwE/ftESqcsI/
         QbS5RR4q58oYGYwof+7a1n9yVIIOzhFsn/fijffymTk7p9vEii1eyebs+rACwgLREI5p
         qNy7lv9uyN+nygRk2/eYw2j8D1emXs/dtehC9AX26cQg6RnpLPEzJY4uhQO+NeiB8XnI
         R7SoMQBrI7rwLS0HrmDSYVeSJbuFqroxMVsPQ4NMcfDLypIidlfHZ/RNeQ7YilxCtNN7
         IKMw==
X-Forwarded-Encrypted: i=1; AJvYcCWfBmUIQdGEu1zxwjDUQy9RcXtGfjhpxB6847nJwXMgleekMJ4dhtmTRP8mb4QtPduahHbc7kbQ1l1FunR3@lists.linux.dev
X-Gm-Message-State: AOJu0YwFwwWS0Q2fTnbF/cG78hTwHZOru4RauH/9tNY69sYowf++cJ+9
	0YxwAmFPA4smzPwZsaEAEomjOmpVISwWFEK6M5F6XIVqtIM+nDBh6/VEbGuBruGciHv0d2613ur
	RKgv4swPNE1Nu/rdw40zJdeQnICCMpmE=
X-Gm-Gg: ASbGncuPgqPRn+5nsYY56GP8VeplZzukREyeMAgaMKjWApwCV6kF5DXnApSK8Ltiwz4
	PCdP9+QXCmNCW1wNtnrZPNjx5kO2TVXdZct+du1nOvAT7dj1xNtcLtWTgQs/Mi8/MwxvJTs3F8i
	Ykv4T87Tp+CA3aXsKDGa26hQ6zLAjeLYbHd5wBr1JMcQybjKpZ4KLmvMhFr2u6fS8YAfTkr4B6w
	9s0f/JTsI5EcqYxdi6RrE3Ogzz6cXdibKV6Hq0FirUim/lIVZgVLdBhzf9lz4lmiJ2Acezcc1yK
	yQsYypN30UnIST+sce/SMaaBuE8a265mBGeTu8CJVWr+GCT6ZeLS/YAURtkk
X-Google-Smtp-Source: AGHT+IEhRGnzB5EzFTBg5gYLUAKsYTD4tHz/84QxOuxiDXRxtdiTFAC2E75ntDwFb3VNaRgQPk1/fDRQR6NQmcoUJ5o=
X-Received: by 2002:a17:903:2f8c:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-28e9a35324amr5544725ad.0.1759444769254; Thu, 02 Oct 2025
 15:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
In-Reply-To: <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:39:16 +0200
X-Gm-Features: AS18NWCqd29-UpjX1TL5yAY8ycRR0RhMhqsgiRqYfPBpAGaRn5i7wZcx5PXFDe4
Message-ID: <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:27=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> Sorry, this is rather annoying.  Rust is breaking the build for a very
> simple patch.  Many developers aren't rust-enabled and probably aren't
> even able to test a fix - my attempt to get a rust build setup working
> didn't end happily.
>
> Jakub's patch fixes a kernel crash and needs to be merged into mainline
> and -stable reasonably soon.  But that is now blocked until someone who
> knows how to fix this error and how to test it gets down and does those
> things.
>
> Jakub's patch is present in current linux-next.  Can someone please
> send us a fix?

I am not sure I follow -- the diff I gave you should work.

If you have a branch you want me to test and/or give you a formal
patch on top of that or similar, I can do that.

Cheers,
Miguel
