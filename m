Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43F36C9E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490560; cv=pass; b=oO932eZ/eT503DKkckqWNiUuNUqCYEEMq8Vwd1qjdrS1bOfd9S9sHorA7geMsr5FuBUcgfO5pmuVT3ljvIDVSmzBZnUu50hjdjfx4wttvo9GQTADRcnJGgy9MLb5HheLBXTywEg9fu/d6HfRfSmxHI5kNShAy1+aSn/y2Vp4C34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490560; c=relaxed/simple;
	bh=Pvooo0toAf+o/Qcwj7a8zZhwZgmx2F/ehYpG24Yc1jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvgT7ls2Rzl4I9V9woYXSOWTDF4X5RIHvJJ1HBEslvgbI7VVg7CFoAdaV2RHwiUZ4y2MoVv1GQ0Q2hNMp2F9UiVT/qX06iL5ZS5MEpGPMv4+BNlaf8BFLqiO0p9FQSi5f/QHv8aCT4uFY4L6c8x6zik15sWgNENMSblG1Rp7iEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M2KljJU7; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M2KljJU7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903893a0f3so3635e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 15:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779490558; cv=none;
        d=google.com; s=arc-20240605;
        b=UyAI3oLHFlNE4MSFoiRxzuhbBWZahhqb6GTwso+AJg4J4ghq3NVkoYuYk6L5A9C33Q
         k7EhBReU3SNFsCoMtQVcpw3qVn1dkYPdvEYs3/BPIj5TwOLOoVIAPvaNpE2t63AS2zSe
         OizmjwD5cYqQ9rDMcphThnAgAsiZzhZSNC5DcwJK3DZmwG4SO7WgMXRCzzAC4OF0p9ds
         B6edSV//joJoHzdMmRFRUsXd16eDRUS7B9TwoFznvNVTl5gu3QaFZRSiK1eeW0akBRxt
         HSdrxq+1UpaBhgGW6w345RSaM116mCC8gfuLIJCgJNlV0IA7UeM0Uy8dnfLFaCwe2ciQ
         cxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9hi3/f+NGybxN1LHccHwI9VWUUIzgq30Mx5RJBwStVc=;
        fh=4Yk1KwHmuKe7Er34B1rNOnMlmzNpNPRPWutG/crrPlI=;
        b=dzK504Fztk22Gxpe0vLN8WKrOpg6sgQLQK9iAIqEM/AkwG9KShnZ+Y1nIbzi7Jd8hf
         XocNARb10r40Yw5fG2JJdbDCCXOFvcPxLSItZ51OH3KqnG02ZB2A+rs7RN2OCAsKOtUR
         5kG4+OlSktkaF+VZsX74h8oNEU7FF4NmbTnGSM+RP6L6eOWY7RV9eEaEoCIgZgIipRAO
         TvFaQlX2dIDzdEAlpS04QWpcU8u3emD95ijiJwD8dtXbov6i2FWVFxmWSsp2yzKO6VO+
         jod2CA2K7XelN8WjwfLl5Ayo9YHHZMe2WKuosVt6bswL0BKXfY3fg7pHFozDesdtz+nK
         7uXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779490558; x=1780095358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hi3/f+NGybxN1LHccHwI9VWUUIzgq30Mx5RJBwStVc=;
        b=M2KljJU7dUwfEv4QlDTzT+7FC88gqfOuCrxRuG/BD108cbHSmSwyNz7pEshHAJYufW
         67Ft6QE8h4h9638rtob3mKVzaj08YcJmMGvNABGRI55KEPGqXJusCTBYw35pNInhrp+u
         HqbQakUEt3+XtIqASHFO0pKOUblQfeZExkRTm2lA1iWSekyjgnGOjTBGliQo2iluM2fS
         jC/zDstImQ7yUsxMigulSLllIICgejcHsamteAfo7gDkYhWLIunpbI8ARTEr/KoMfpBv
         IKDuEs0yi/zIUPjfofTqEN910BEsu+AaPBFHcNqrjGGNz/soi+MXvN4+fjRmYX7d1cGr
         upxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490558; x=1780095358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9hi3/f+NGybxN1LHccHwI9VWUUIzgq30Mx5RJBwStVc=;
        b=kdi6NesjQ8KFDTlqafUwtjWiJACpAn7e+XZdusExQG0D8l3waA2z0V6N/josofhGCQ
         TWQWBBHjkK4IVEFGLIlFinSTtt4ok4rt7mJ+T+NzCQZMekR+uCkMtDcaDXTdNo8ObWpY
         Sylfd4x5uNWhOkEhikGiIjef4Nj0TAdi5Wtq5XTA1MCtIb3qIbmGF64GaN0Q27ZnoI+G
         le4WYxFBhazkDR//CWmVKLqnoBh05Rdy7RXF3QO+jKePJMEaHmrH16BiTGtXLMq8gERV
         e2eQkurhom2s+XURhC0KAHSQ+0zNvx11brLnpBfFwMTIggANcEuGm5aeaEZDtmbvkntS
         K2WA==
X-Forwarded-Encrypted: i=1; AFNElJ9Sd2nJ4R68zJbJUJjvlUV+b5G/Z0f1h/kfdKMEKQEtyzet1/zL0YbxIug8GG88XAzKut3gioL9oUKTyOBI@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl5syr8IRTVVrOLPR4acADOL8h3UoJ4MevWB7Qm42w7eCyz7pj
	TKrLuj0ZaXJ7TPRuCz5BKM4mx14H6acYU4JMpiPXfzqONKO9uvzKHsWf7FQpou7EGTJv4OpiA/U
	iYIyJAN9oJNM7RYpIP6aq/ysFCXPWhdT9xBLqvG4w
X-Gm-Gg: Acq92OEyW1PIkM0bDOERhVx5PLIpk0zz7jLV749A0IbBWSG9nBuVLfic/t9hMcfJxXm
	HqJBW0JnsaLkXha6PcYaYPeNaAXEbSjxwBGAFLxOm5ektW7nHLES3+dU0uUMsY1+XwrnAXEFcku
	pVwNShOOHA+xvTrD/MdhOqiaNRQnRfSjh4nDeX9MdLXNzRiSo0yr/fn54CxWip6Ox5RZMdFVoC7
	C3FWY/4MlV718LKl8Fk13vSkHTpVs/+PN1fg7F7SioBYIHLJfh6zzBPJJG7Yi/f0F/Aq/rsollc
	J6jVMRAdrLY6LeRzLLjqsWwLNffL/GgrTSU4drnqg009zCpe
X-Received: by 2002:a05:600c:e489:10b0:490:3bcf:11ce with SMTP id
 5b1f17b1804b1-4904f68edd9mr253535e9.4.1779490557387; Fri, 22 May 2026
 15:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605230046.E9uhmQXM-lkp@intel.com>
In-Reply-To: <202605230046.E9uhmQXM-lkp@intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 22 May 2026 15:55:45 -0700
X-Gm-Features: AVHnY4IwqhRvkr02BBybh2ka5VliyYStKiXs47dfF_tw-sHPx3XI7LNwBsa9i-U
Message-ID: <CABdmKX0Y6qiyBFJWNtGQzYrqiF9QsaoRyQvN7N2K+ZJETMeuhw@mail.gmail.com>
Subject: Re: [linux-next:master 7127/8157] ERROR: modpost: "set_memory_decrypted"
 [drivers/dma-buf/heaps/system_heap.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 9:49=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   c1ecb239fa3456529a32255359fc78b69eb9d847
> commit: fd55edff8a0abe1b198af9a4280bfb208b9d2ab7 [7127/8157] dma-buf: hea=
ps: system: Turn the heap into a module
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/202=
60523/202605230046.E9uhmQXM-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260523/202605230046.E9uhmQXM-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605230046.E9uhmQXM-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "set_memory_decrypted" [drivers/dma-buf/heaps/system_h=
eap.ko] undefined!
> >> ERROR: modpost: "set_memory_encrypted" [drivers/dma-buf/heaps/system_h=
eap.ko] undefined!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

arm64 and x86 have these exported, but powerpc and s390 don't. I'll
send a patch.
