Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6619CC3E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759445417; cv=none; b=Vi7I+FxfVI2OIJ4kVsMUnbU45q60r94JeZN422fd7yxTZNiSWkxYEVEvBXdjXhQ/Q/Z0712wdaj4+W24mn14Ubs6ewJfNbGFHXR0tY+A/HF8nrmL5WauZf4RyTGdnhY4kCDiu4x9+ueCPA3A3RsqGhoZsaXWp85jJphV8aFdYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759445417; c=relaxed/simple;
	bh=Qmpdc6/sbik4VaieEZS+f1dvOk6Obsyso+80HFO5YuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXOB+uPukLVzClO+mZVojYmcO29cm6olW3gt/it8PDyMhfDaDQo03nvRme/VDq5e5e6tNRjDJ1Lzr4MhQI6cGVpYCRRXELYShiWBR6vumJddj4/+V6/7S/8VKDgZyqdCtM05G6aJYYyCMSf4A/8PdxdUeLeIDAQqefPqjViwHTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=olrqBeBf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="olrqBeBf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so8283415e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Oct 2025 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759445414; x=1760050214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxtPQe1b0MgbxjGfVgNQaGXQeWz7VgG8PZ8uWv1F070=;
        b=olrqBeBfxc2VaklOBR1aY+OZryxQl5tqDoxtS1/zx/1bBisHPAnq11ACGSTEpyFzxV
         GlphoRzi0dzf/iz1W3PrLS3pbd5JYXgHW2R9zfmu0hmtWpOqqTviQwcY+qCOPUoV9MID
         8RH2vwRNnu92bz7vtQ7FCNyolnKw6PvhwB31gv/on9k9wQ4eGrnVu+Ol+/+gYdsmoOuE
         EnCB0BqZ6B6jUSOxBtxGoDF0et7ytmlo2A2YBtT/v1UGOxQMdAfO7qIxyGL2qzsKSb9W
         2pXM24Werh2TNBGvnTnN3tfwZsA8IK1c2DqvtUUwDd2dIjpdchWbOl1j9mZrOWPGFYDb
         2sLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759445414; x=1760050214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxtPQe1b0MgbxjGfVgNQaGXQeWz7VgG8PZ8uWv1F070=;
        b=UUFJfSIl1SqF/d7XmB2d0iXkEHP1/wefT+gquvxj/sAbGP5dPxkLZJY9NF3F2D0Lrk
         K/6Btcggr5ENEzFvauSoFaC6c7Oh6q7sgZMC4sINFp1G+O8okDrzoseg/UBEx6fe1ezL
         wMOPL295oYv8iQqAJum7csnOpulu8fZAIw19qRud87kcSuzT3JIwTOBcEVRBSY+j8ezu
         jNfaysTjT8s7/lP6uJ6+1IDiR3DmTlEw17IbcG9efluZ6n5mLdOnnZbp5tCwmTUWdu5y
         /jd9+8iYj+33CkPluArr3M1nv6NgQM2WyjO4Y5yQhJUaRAizWETo0XjX+/vjXdJB3Lkp
         6VTw==
X-Forwarded-Encrypted: i=1; AJvYcCUmu7AMDbGOhHmIJLN70dadR/ssxODl28ov2QBG36Ua8+DxU7vY95/3wSMPcR789aHvPYBUq26B2lAimTV8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+FMkAPH1a3Et25+JOIBUm1CSLMbbbiKl8pAgrKBHNcwmeSgr0
	af9StZ5TWh0/MOsdH3zsO9baDngwxdMfP5Tsi5JFkfXwb9yj/f3PsoCllG9ZntZ/VzKQinEXuw0
	R7VqcpymQuE9vkC3tCGufxjxp5ywuriSev1+xe4Ze
X-Gm-Gg: ASbGncvpP4e4JbAXNBPwS0qY9vGS78JKEAUep3BOuy9N87f0oI/EgD4ka6n89KQaG6E
	dwxuZPBOLr64mLwSRZKcJDCdVNXSpASPQ2A07438Cei0w+ccabz24R5GDQP5HApTmP7LHrGToFD
	NBv2hvYk5ji0erjBbeB8dpG4npVOXgqTU7O8WK8gNtuVjeOAvLJ3YA3XkcsWNMi+xiSMpM93q4F
	YY1bAFEPSJVEhrTD1tLwOKyRdSN4aFuE77myYnD7jJij1z2Rw==
X-Google-Smtp-Source: AGHT+IEBz6Cy6eB61n4T9EDKMcjbX1FzickEfiY4Bp05xtOY6F9ZP0v6HQaE003SmqjEHrULNb4Tsv5CwqwTNxWL3o4=
X-Received: by 2002:a05:600c:34c7:b0:46e:5302:7751 with SMTP id
 5b1f17b1804b1-46e70c9bf2amr7897855e9.9.1759445413960; Thu, 02 Oct 2025
 15:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com> <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
In-Reply-To: <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 3 Oct 2025 00:50:01 +0200
X-Gm-Features: AS18NWD-PBkNKF8kB6hVqVgtujt3IbYom_QTRnw_XVpZ4QPMK6DidM0i44zAG74
Message-ID: <CAH5fLghjjKG6h+T2TFmtz3jPvRxL-u1szLVs8aEs5S+0bCUcLQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>, 
	Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:43=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 3 Oct 2025 00:39:16 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gma=
il.com> wrote:
>
> > On Fri, Oct 3, 2025 at 12:27=E2=80=AFAM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > Sorry, this is rather annoying.  Rust is breaking the build for a ver=
y
> > > simple patch.  Many developers aren't rust-enabled and probably aren'=
t
> > > even able to test a fix - my attempt to get a rust build setup workin=
g
> > > didn't end happily.
> > >
> > > Jakub's patch fixes a kernel crash and needs to be merged into mainli=
ne
> > > and -stable reasonably soon.  But that is now blocked until someone w=
ho
> > > knows how to fix this error and how to test it gets down and does tho=
se
> > > things.
> > >
> > > Jakub's patch is present in current linux-next.  Can someone please
> > > send us a fix?
> >
> > I am not sure I follow -- the diff I gave you should work.
>
> It would be nice if someone were to test it!
>
> > If you have a branch you want me to test and/or give you a formal
> > patch on top of that or similar, I can do that.
>
> Thanks.  As mentioned, today's linux-next is where the problem is being
> observed.
>
> I'm queueing the below as a fixup against Jakub's original.  This should
> appear in tomorrow's linux-next.  Or the day after - it's a timezone
> thing.
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise-fix
> Date: Thu Oct  2 03:37:47 PM PDT 2025
>
> Rust bindgen wasn't able to handle the BIT() macro.  Add a helper (from
> Miguel) to fix this.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510030449.VfSaAjvd-lkp@i=
ntel.com/
> Cc: Axel Rasmussen <axelrasmussen@google.com>
> Cc: Chengming Zhou <chengming.zhou@linux.dev>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Jakub Acs <acsjakub@amazon.de>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: SeongJae Park <sj@kernel.org>
> Cc: Xu Xin <xu.xin16@zte.com.cn>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  rust/bindings/bindings_helper.h |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/rust/bindings/bindings_helper.h~mm-ksm-fix-flag-dropping-behavior-i=
n-ksm_madvise-fix
> +++ a/rust/bindings/bindings_helper.h
> @@ -99,3 +99,4 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRE
>
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> +const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;

Tested-by: Alice Ryhl <aliceryhl@google.com>
