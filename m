Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E124C08E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109988; cv=none; b=P0BUap/zO/XGEuPq0QD4LBQMNgQvUQxfVXMfqjBevwPdMfovhMTxbpel+KFTaughiNQBvHQjHePCFwwg/L3R5Wm+Vh+vP+RJsn+OjkIv0HW4Jox3+xbFtmcpfvZji4QffDqCsWdEaoArky/k6xpSt1B7OVyfXS4BdDb1RkMtSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109988; c=relaxed/simple;
	bh=HPltzDa2GXHDqvuVgVm9xSBnrTvZf6RAfKlH9pf2jdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4F83nA2ZRA817OAXi9vI4nZGQiQ+9Tyu/PPAxTj+Q7wP1Z8FTU3CYFGSGRYk65cmyU8At+994KMZ6j1jIscdtJCWK9jj7lBvhZajfDPWCpQJrFjPZXY00gTHb/4ISciU+scERP/ry5UTN8RusneVmf8gPorRe11veDUXu4Ch0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JX0I9V7s; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JX0I9V7s"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-543d8badc30so6812451e87.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Mar 2025 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741109985; x=1741714785; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq+pWO24qypOYx3s27HcE2yQSqQUHh2r7X4JhA7So/M=;
        b=JX0I9V7slCPPpEWJGiNelnFinAMJfEaafEHVH6rM+3cAJtZH0dLh4kLtREE3paVJQe
         iSsoRStpGiEopYfn9vU2vREK6bis1GeK9FY36nIpQACFQnoxNvnDUrYbWfnODGFGHniz
         MYHLhGj1tXAfpHoR+PK/bGfF4cXvEYDviPGndllMq2PIhJH7l/biGPaI8vjPiHP18k9a
         WBaparCycyBGaxHYvWr3+a/cxaotzypLnSe52+aOirN0P4GCz3ml9qwLaxOiHfN3tjoh
         E3FJyWQskOqVcfXQEa/FDy30KXctd9FaGVDw+Tskefp9k4YNLndgGML5HplY7+UX0ERx
         8KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109985; x=1741714785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq+pWO24qypOYx3s27HcE2yQSqQUHh2r7X4JhA7So/M=;
        b=U1Eu1DhIqgxzwwefUtLaAgKoCfjhLGxK/oKjPE+FHN08OHRyYiOFfHOd55x1nIcGVp
         g31H1y83w3wegw+CAmsDiqH3M+ylWLNUE1mQLLx8ZYoD0BN7HWaSRntPzz1SBnl43bT9
         U2mpo1Af20h+S8HspwIm0XPF/UfA45zmzJgqaCUDnFPdB1WJIInChiVLEsjEqVmTVx39
         jeo6ve/261lPwmcbxbgyF7xZOaA55VwH9K/fcMFvUYFvfbxI+Nq6rcgpt33lmFS3WDkV
         hoWkK43u9yG0kXW/scoxVKiUjgXAKz5pECx445guq6RFVqiLI3rB+Q/sa3ZDpDjGc7tl
         JHag==
X-Gm-Message-State: AOJu0YwF4fvVmT/RVCfoqfTvuQJsDgDwNbqbJnDWW1t2icAYTSqxjP+E
	8JFDvaxnWZvstBgXQ5/uCgTtwsFJ6jjxnynJMUmroG/itO5i2obwOBOJV/6vYgQtuAg6VRJTUMz
	cvfpvMete2rdSrtLAi78oXh5xyDM=
X-Gm-Gg: ASbGncuACEvs6hbTVgmc35ZnhaH90szMnOKdBB5bnCaIHoEyv5ukUne5MPGwd9xzbS6
	cqJN2+kpzbRPjp/bi6v3KFPtKZphjVSB4VRA47LRTjPq+XwVQCbHkycYq3G8TRUEQfR2jwKnU5A
	+lDikYTKPSBbnFpKD2Th2NhrSwPA==
X-Google-Smtp-Source: AGHT+IHSiRSxosIrQTcN2Mc1hIaWZzukXQmFcyJmjTuiPHO2xnVfENlnxs6plylMonPVUKz0fxup+tgyord8QUdHnLI=
X-Received: by 2002:a05:6512:b90:b0:545:5bd:bf42 with SMTP id
 2adb3069b0e04-5497d37aa64mr2245e87.36.1741109984608; Tue, 04 Mar 2025
 09:39:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303155446.112769-3-ubizjak@gmail.com> <202503050048.Fh0HfhoQ-lkp@intel.com>
In-Reply-To: <202503050048.Fh0HfhoQ-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 4 Mar 2025 18:39:31 +0100
X-Gm-Features: AQ5f1Joh02CgwPtHTfwpCOvGV2GTOSzP6rkMslFYtpj2RStwuiODb3Dc7-XShfE
Message-ID: <CAFULd4bnT5WN9GvdYAscX7AR+P5iu+vmSwk04doSa=3UxTj2Mw@mail.gmail.com>
Subject: Re: [PATCH -tip 3/5] x86/irq/32: Add ASM_CALL_CONSTRAINT to inline
 asm using CALL_NOSPEC
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 6:05=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Uros,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/x86/core]
> [also build test ERROR on tip/auto-latest linus/master v6.14-rc5 next-202=
50304]
> [cannot apply to tip/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-ir=
q-32-Add-missing-clobber-to-inline-asm/20250303-235755
> base:   tip/x86/core

This patch was applied to the wrong tree, where COMMA was not yet
defined. It works OK in the current -tip tree.

Uros.
