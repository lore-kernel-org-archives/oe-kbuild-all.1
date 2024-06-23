Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6418131A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719166079; cv=none; b=kA92oSGYLbHsGeQ1DyyfKTDTMiSvtdaiUQ3ZJfLnkiW36BJUN8fFrqgHbraZM+YcoEJYjxZDAfEJ6r6lOo2DDeK8VBj5uLR7GyvX1eHJ/PLR7jc6gdTsNDl6n7DOVk+jfeGsL0o1WJB+avBfF0O4e8ELXu4DByc7rJmTrhYgX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719166079; c=relaxed/simple;
	bh=gN5gx/2bgxPc7Ha4uj6zKWoJM3HzTcGze3wrKsRZO74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UE1L+2Zc2gYpSAugZqb18r/Bi+f/rX6ICqYrtfBPtb1BXFIBcZjlgp3d2CTNBKKLuITl2rJL1zxpQHq8X3kgGZIVkcXyEGqI342sOq+evnlxo6wcyxsvmwJgaAfaa5jHy04Azj1GoGdgGdPa/va2vLeW7fVsY4JUGDsb6dM1Mnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KuhVY/3V; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KuhVY/3V"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee83so3650593a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 11:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719166075; x=1719770875; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2q/oGp1Uj11i8ttCrYoX4CQ1yZ9C29tZG3LwII1sKnc=;
        b=KuhVY/3VHmmnK3ileC/I5s/7R1WF48qxZZ5ekrgdrqkDMunE5W51HfUR6KD+MzZCl/
         Iy9HOOwWG0eDxMS5a9VToWJmMJRnWCAjBbNQ+PzAPL8MuE1ztjQ1gb5soCma106y2C4w
         CDzWrtKlKzV2LWl0hTA+A96VyuLvdtsvhggkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719166075; x=1719770875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2q/oGp1Uj11i8ttCrYoX4CQ1yZ9C29tZG3LwII1sKnc=;
        b=tzBku11F8bAq1eai+2HghSLkKrq0L0d9hT4TZwq+VrOE02nQw4wqni3hQjZY9XnfWj
         jGzckQHcrwHb20tOkQhANrutl6cdmeTnT2uNgVHpRB9VgLSX463uwVjURHD+3Z0tInjk
         emTj+E5fsBSI5JRQUVNDvugYUucKgVrcbC3LivsADittpCNg7CWPWBikifAiLkr3SPMK
         LVekr4I0IYEnTGFhjEPK43QwRxVLKFAkbxzAwoLyvmMHkZregaT/m1VRIEuMA1M+Gn9t
         gy6tr0akwNb5IVZYtjlLkELMHdyZm9yxwx3ABh2MBciFmZTyGjmTWGArjVrOFfvl/+gZ
         vQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaqgn9JH84p39k8WH4sXj5kiwMRhMS4rS4/NFg2Or6C9VFTKbIbaWg1Gepd2Gyta6Y0KY1jxtKQ8LaVfiH8JbtKv44Ay/yieELPVbvsg==
X-Gm-Message-State: AOJu0Yw5w6vKBd1m4j1/s4TE6FgAL/9R1trKfdDNytYIHiE3hYC3tgjw
	S+CxZDnLMxVJxLczk8NJAXO03hXu2xkzGqglLMnggRlpXWogUmGxCntOSMpKPPHsEuntLmljOJJ
	K0bSOMQ==
X-Google-Smtp-Source: AGHT+IFKOlAWwEwZ5HlxU1zvbhB9gyefInB2Wt8V9Cg3UVRBR8gT9fG8VyisW/YqoVR+uQ7HGiBxWw==
X-Received: by 2002:a17:907:c313:b0:a6f:4827:7966 with SMTP id a640c23a62f3a-a714d729081mr268849966b.15.1719166075599;
        Sun, 23 Jun 2024 11:07:55 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560627sm331073866b.148.2024.06.23.11.07.54
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 11:07:54 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a70c0349b64so109179166b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 11:07:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR0BY1TmFQuv46bImIAJ4x25CujmYfMrnObWFmrTCgNYzYOJ2RbWjbVJ2/SoM/LG5qcKpqJuGCaYX61xgGEUuk2GLdT5JGqkgOwvlDNw==
X-Received: by 2002:a17:906:318e:b0:a6f:5adc:6533 with SMTP id
 a640c23a62f3a-a715f9795femr222604566b.46.1719166074441; Sun, 23 Jun 2024
 11:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
 <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com> <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
In-Reply-To: <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2024 14:07:37 -0400
X-Gmail-Original-Message-ID: <CAHk-=whPqqZVSeJiQsMvsAxtAmtR9iAuB4gg_1sUK2D-uBPpLw@mail.gmail.com>
Message-ID: <CAHk-=whPqqZVSeJiQsMvsAxtAmtR9iAuB4gg_1sUK2D-uBPpLw@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jun 2024 at 13:48, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, from having looked a bit at this, I can point you to the
> differences introduced by having to have the emulation fallback.

Ahh.

Itr does all the same things *and* it has

    "S" (_ptr)

as an added register pressure, because if we take the "call
cmpxchg8b_emu", we need the address in a fixed place.

I don't see any immediately obvious workaround.

              Linus
