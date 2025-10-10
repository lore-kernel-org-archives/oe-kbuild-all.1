Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A926E6F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083999; cv=none; b=grr7RiHq20Yj+3sdLk3RfqvijcPMO/vnbx4Cy7zs53RFOut8mjx7jvkPlxjou420V8GWObiMG/Z6MbANqfwJCQM1ZNJNYmeI0i9z3SAWZIGQlpbeBFjC/f/bgOUpVEIIycNGRlpXpq81jdmeLu+hp5tVGDNmnYuo52ccQgvuwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083999; c=relaxed/simple;
	bh=Kibn+V5CQV02MW3VmtCIWKOR5kSgeJ6N3BdER4N5TcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFuMR09kDtq4cTQsdeHEVA2lPuTWSP8G/CiUkn+Nu8CBien8M39MGuhaOeN9PUVl0OKOtaZ5Pr4unjzyy8boIxfegUk2gk1x/npFPiN0LpUHI3hEzSi78fVAfqbeFMcuXF4IRMO+wIjWm50c04vu9T4x06W2oU1zT19wv2BV8Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwuiCskY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwuiCskY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781257bd4e2so139291b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760083997; x=1760688797; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wM+C8meSFUf89iBos4e9b9ElmXv19ZrqBcY5kPeD/U=;
        b=AwuiCskYHEdduGN1CG4HZaZrHPIuoM+WvxFX+m+dCzCSYpP3frtO60nIZoOAbU6xxV
         SdSd3FgrO6UQMNjqGikMaElQCySHH/gjIS76/x5OHVEvum9GAYumVmNDMsz7lTp+8z8i
         1fH0UMedsHoruL14b6ZujxCaKfjfo3keFLxjCARDmjsJpuO7liK5q72T7iwQD64phsNx
         F1UYJcKhhQ/Zd92D9H56CgSrJjT+OdfEAFfBUWau/mnYDMudjAiS35TqqFLJHLJHh6xy
         StjZtVH2f5ksv68VXjWvO2yxCu9zusS9piVk7dejmpD/H4LJsuU6KNh2EeerB8vwHxbF
         dR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760083997; x=1760688797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wM+C8meSFUf89iBos4e9b9ElmXv19ZrqBcY5kPeD/U=;
        b=YgNgcC3EA5jdUnikBBBFBNkDRPifQg1juGBwFmI3H3Yv95+EXcRdMZ73jM84yWVEFj
         vJZk0296hbyzAudYx9J9Z1dfH6ulj5smXaYtqsrk6IsSN0g2jtK2VjbF3Bm56/P4DSU1
         9YD0H0x8qjliKFs0FMOpVmsgbXkDsj6mjEHHOqm1Yrmr7snSCNItsRDPY9/gkWgE2rZj
         yZIUEn7Q9l6frfwodefSh8HgcUBpqEWXwlec5xlGQ5vly7COKKOpEJlStwiVKhbFb9jV
         /1GuuxRf5EZqFqvG48BXfxIWA6iK7y0JDFoDCsVhvo8U5zroDSGwdxhvs77xJt/5ZAy0
         gwCw==
X-Forwarded-Encrypted: i=1; AJvYcCVIYdlR3p6LDmO2Alb+cyTyKiDRyNrHYSSKXrdIQ4w6g04gZAMgaDkajEy6PNTmjVQlTOVAk3JFsfeaibs0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq135Gff2Y3JfCg3/TZ5F4mvh94MiWjQKNdTKB/0MhhGzvAFDC
	X5KXr1dIGuQKCvUMJnMKHfucvT42ydWW43LG0FokiU6TdTtt/uXVAPwicVzrAO4Lt32vcZZ/PGJ
	VFVrPzPJ9T3Y5keQEImj8t0x6HeJy1LA=
X-Gm-Gg: ASbGncvrqLdLFnN2K8RWmud4kx8akOQzDbwpnw4a9huGjQufzDkcDNeTKbJyPviCmPp
	pYiv7KR6CNYiPju2qx9PPV8842Wd1Edi6/vEhs5r9EkEngZwQfoxXgpbDEBiTqIGLWSeqVX1NQH
	WUPjsoLFTKjKUmCrpYpU+0zA0bnaeNvYqqcrbRCmQ5m+f3y+297f2nBQJrkat6JZw8HkTnnwHgl
	kSfmGD/ZjcG9yopmtu0KYOVQ2Q+I2cdAfs6e5ExW2ySnj32O+qCC+CJBaN3rq+zKInioaxVWxH0
	s46Q/MRUTHJUdzVEdHmAz9bgBZK1OobDNGQW3bUTN2vZ
X-Google-Smtp-Source: AGHT+IFdkga+t+zjNZdz4Z2XPhEtJNUAlFk/vUhhv9BDFlxUqeNhsotPLJ09GEKkawpw/ItDjLsilTqPl3STcyuQYOU=
X-Received: by 2002:a17:902:d4d2:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-2902745c0a2mr89160145ad.11.1760083996696; Fri, 10 Oct 2025
 01:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
 <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
 <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com> <20251010074458.GA91144@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
In-Reply-To: <20251010074458.GA91144@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 10:13:03 +0200
X-Gm-Features: AS18NWCKK8TWzVbSWJUkTcYGK_N5_ArO41xibbqihc9xfH2UWC9bF9H18mvQyqc
Message-ID: <CANiq72mzrJNTe6aw5zJ_vyhXO1jDR96hmvQEXPkqFj=dnwSnSA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 9:45=E2=80=AFAM Jakub Acs <acsjakub@amazon.de> wrot=
e:
>
> This is a tricky one - VM_MERGEABLE being `unsigned int` is only an issue
> if there are flags using any of the upper 32 bits. And if that is the
> case, CONFIG_ARCH_USES_HIGH_VMA_FLAGS has to be 'y', -> thus the enum
> will also have BIT(33), BIT(34), and so on. So from that perspective
> we're ok (checked by running a reproducer).

Ah, good, that simplifies things, yeah. A comment about the fact that
we rely on higher ones existing on the enum may make sense to add.

Or, even better, an static assert testing the type of `VM_MERGEABLE`.

> This ofc remains true, I'm not yet sure how to test that complication.

If we keep the macros, then I was thinking we can avoid replicating a
bit of conditional compilation elsewhere by blackboxing the zeros,
e.g.

    # define VM_SOFTDIRTY  BINDGEN_BLACKBOX(0)

That way we can keep dummier lists on the Rust helpers. But it does
look a bit out of place (though it is a smaller change than the whole
`enum` thing).

Otherwise, for the moment we can go with [1]. It is just a single `#ifdef`.

Cheers,
Miguel

[1]

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 2e43c66635a2..3c3a03051060 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -108,6 +108,33 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_PR=
ESENT;

 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
+
+const vm_flags_t RUST_CONST_HELPER_VM_READ =3D VM_READ;
+const vm_flags_t RUST_CONST_HELPER_VM_WRITE =3D VM_WRITE;
+const vm_flags_t RUST_CONST_HELPER_VM_EXEC =3D VM_EXEC;
+const vm_flags_t RUST_CONST_HELPER_VM_SHARED =3D VM_SHARED;
+const vm_flags_t RUST_CONST_HELPER_VM_MAYREAD =3D VM_MAYREAD;
+const vm_flags_t RUST_CONST_HELPER_VM_MAYWRITE =3D VM_MAYWRITE;
+const vm_flags_t RUST_CONST_HELPER_VM_MAYEXEC =3D VM_MAYEXEC;
+const vm_flags_t RUST_CONST_HELPER_VM_MAYSHARE =3D VM_MAYSHARE;
+const vm_flags_t RUST_CONST_HELPER_VM_PFNMAP =3D VM_PFNMAP;
+const vm_flags_t RUST_CONST_HELPER_VM_IO =3D VM_IO;
+const vm_flags_t RUST_CONST_HELPER_VM_DONTCOPY =3D VM_DONTCOPY;
+const vm_flags_t RUST_CONST_HELPER_VM_DONTEXPAND =3D VM_DONTEXPAND;
+const vm_flags_t RUST_CONST_HELPER_VM_LOCKONFAULT =3D VM_LOCKONFAULT;
+const vm_flags_t RUST_CONST_HELPER_VM_ACCOUNT =3D VM_ACCOUNT;
+const vm_flags_t RUST_CONST_HELPER_VM_NORESERVE =3D VM_NORESERVE;
+const vm_flags_t RUST_CONST_HELPER_VM_HUGETLB =3D VM_HUGETLB;
+const vm_flags_t RUST_CONST_HELPER_VM_SYNC =3D VM_SYNC;
+const vm_flags_t RUST_CONST_HELPER_VM_ARCH_1 =3D VM_ARCH_1;
+const vm_flags_t RUST_CONST_HELPER_VM_WIPEONFORK =3D VM_WIPEONFORK;
+const vm_flags_t RUST_CONST_HELPER_VM_DONTDUMP =3D VM_DONTDUMP;
+#ifdef CONFIG_MEM_SOFT_DIRTY
+const vm_flags_t RUST_CONST_HELPER_VM_SOFTDIRTY =3D VM_SOFTDIRTY;
+#endif
+const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP =3D VM_MIXEDMAP;
+const vm_flags_t RUST_CONST_HELPER_VM_HUGEPAGE =3D VM_HUGEPAGE;
+const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE =3D VM_NOHUGEPAGE;
 const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;

 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
