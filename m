Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7439D515
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 00:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756339453; cv=none; b=g9wzLP69HIl++eRG2nMVwPQWrv0LDV/5i7D4CtaegpL1mntn02sbcSHaMJID17b3KUQX1FZ27ELW8VMMiYjdR5o9eXjmCH9nauGGmuLhiihlY3u1j1fhZ9Y8d0S37MBr5KkGtSnwyD/Lnq35cPRMz0PNNuxL5GmbvpfFMJy2JNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756339453; c=relaxed/simple;
	bh=dcEBNFHS14PdSeqiLv5RQBde4ahKGZJ3ZnkzOVrFJ3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxSLMhSCVqOiaJhhRR0r3pURhakwZ3Jz16L4TwgvUwFczxHL5TOxCuxfHMQeuza12f/U8euZvT6Cop2SLMYOgB9S4bL1ayRKXOpoAb8lrzN80DDJn4OBylDP9/qZFKFvDtmtJ7Siy9sseoLFoL2yU5BIrq0uG7UVlq9UR5rXPqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KDv+U6jQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KDv+U6jQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-248681b5892so82485ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 17:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339451; x=1756944251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8rvowLC2NdnxO8N/1wChHWBJD18UvdLbbo6qBnx/qY=;
        b=KDv+U6jQPnIgfEjSjQC3EZRPmnyZpb2W/9IYlbAHcpmJNbwykf9F4EhdXEdYHgczEv
         ExMPLf1T+fc8lJiWWiulxEA9Ltn/7dTzXZIJlS5nKm+bZa2TgU/GnGhe2ScrpDA2tmUu
         nW9agCHoA/Wbx6YkwUdec9lXjMDkBN7gVoC1MqXnsrVsQ0GuyRl6VRbTzbUpfcbFnmdv
         YPaYkor57c/po/ZI5ck0FPkCZZs4qQ8t8/duVhuK20ugHqfTNiinmpQ5JbROWvxvImUu
         kIsyIno4yRN/4KLPRvXfaSPSbYqeZUSdJcVSJur3NR9/4NaFYAuKSnG3iBOKqnlZHz6O
         IaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339451; x=1756944251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8rvowLC2NdnxO8N/1wChHWBJD18UvdLbbo6qBnx/qY=;
        b=YN492j14eQbvM+42Whd5pDSXlArgfVpdSAYSLvDwTI4casmD+i0NKnM04iGompYiM6
         SuInxKhkHYSL1ajuDSNV52cFYpHIlDlFXTL5dzBG5SW6yXG8F/fMRtKamk1//QCRkdX/
         pcpGzxpPNjNPJXRyE+7wztXpZZnMHW1G52UWc27pQznPmqSc63OLzfvDKZjQUhr74KyF
         fnApp4kLEqKkFngwF4mPrKL4JoIIhEbodw28PzVMMGYHesOtE1qI6gJAsmLJ1S80YYtp
         XvMR//ueviRL2tmCd7yA2H2s9DVvrKFPfQpDnZ4VAtpBsKuQmbxa522Qo/xuCVB3h9oZ
         w0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCURC2ngQ5dlvBAnmpbEA9yxncDXsZ6IbdpOtWWKOWeX28QAxmn4XiCS9g1+rdxT2Rr385suCY5DZDsBKxaN@lists.linux.dev
X-Gm-Message-State: AOJu0YyYLht6+anAj4kGIhncsaiZrx5fE6/iBxlE1ppLp+9Pt48Jav1g
	jXWUbD1fIeFc/h55aUUdCSlpHhGP+GmsDRtTxOlz8nAm7iacJsSEp+s2wrPmWeyfUOqCVByrjVJ
	gztJX6Za/DyqcbB6ihDNlSx1xlX6CXpTlB0dQmvdc
X-Gm-Gg: ASbGncsz+kSx4ICFUDi0k69y/YbtT187F5k50BtLSTNvi8YQ/h74z5AoVlxN+wyt7pl
	aY0JyyfdJXBoluASOV1ydt5LcGbyTG8/Yf/3XbUsBWA1PEjrl+EjAdpQ+ewPiMX2TknPhZz7FQ+
	LDGzd6QcyLOlN4cRV+iIcML8NB1XRzsbF4CMjZn6Vf1hp7zfHUgr4SqdoGeJnocELbYZZyFbwd5
	kfRuxnQBVWR0y38UhJS1g==
X-Google-Smtp-Source: AGHT+IEDmmobwWkSmCQRrX764i0x7N+NyNi2pxKbtMS5DtBtN2eqD9ubZnSkhhZ5P4pDvFK2mC59yDZNjv7rIAe5OOA=
X-Received: by 2002:a17:903:2348:b0:248:a039:b6e3 with SMTP id
 d9443c01a7336-248a039be4emr4509515ad.10.1756339450767; Wed, 27 Aug 2025
 17:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508261620.orOkZR9F-lkp@intel.com> <20250827223247.GA414199@ax162>
In-Reply-To: <20250827223247.GA414199@ax162>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 27 Aug 2025 17:03:33 -0700
X-Gm-Features: Ac12FXzPtRVLknCbAbwNYNo2CZUi1eOl-HMyl2Vu698XcFA1aeb-rlHJWZuTALg
Message-ID: <CABCJKue1wCB6jBLYUc-fAEzpyQWHXwbk8R5GBaZCkCao0EQZPA@mail.gmail.com>
Subject: Re: [linux-next:master 4166/4221] vmlinux.o: warning: objtool:
 dev_pm_opp_find_level_exact+0x47: no-cfi indirect call!
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Aug 27, 2025 at 3:32=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> > >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_exact+0x47: no-cf=
i indirect call!
> > >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_ceil+0x75: no-cfi=
 indirect call!
> > >> vmlinux.o: warning: objtool: dev_pm_opp_find_level_floor+0x66: no-cf=
i indirect call!
>
> Not sure if this is a clang, objtool, or source code issue but I figured
> I would brain dump what I have so far when looking into this.
>
[..]
> Looking at the source and the diff, the removal of 'assert &&' in the if
> condition before calling assert() in _opp_table_find_key() is suspicious
> because the three flagged functions pass NULL as the assert parameter. I
> guess this might be another instance of "clang destroying codegen when
> encountering UB"... :/ this diff resolves the warnings:

Looking at the IR generated for dev_pm_opp_find_level_exact(), LLVM
seems to have simply inlined _opp_table_find_key() here, and since it
knows we're calling a null pointer, it has dropped the kcfi operand
bundle from the call instruction, which results in the objtool
warnings:

$ make -skj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 drivers/opp/core.ll
$ rg -A20 'define.*@dev_pm_opp_find_level_exact' drivers/opp/core.ll
[..]
1670-if.end.i.i:                                       ; preds =3D %entry
1671-  %call1.i.i =3D tail call zeroext i1 null(ptr noundef %call.i.i,
i32 noundef 0) #13

I'm not sure if this counts as destroying codegen, but getting a
compiler warning about this would be nice.

Sami
