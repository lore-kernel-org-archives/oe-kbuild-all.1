Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3743C7DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 22:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807560; cv=pass; b=fLxuZZODh3L74V9ZjzH7ofPop5yVwlguuGmYl/evB45ZvrEZxLpSaGs9w0yfTPfN9MyGzPYsdpJKiXhh3MR3wglSyQ49EWx3otixPUSjUASCvPnpANuBCAQEv40VqLHuMIgKI6iC86a8jsZNtzLJi/J1N/GcgCCDo56w2l5uTcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807560; c=relaxed/simple;
	bh=41zHe/K0N0YlTXyKVd4alQL08QPKvIb2rovNiRRenF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqx7azQjLLWTEqi7TmDgp/aB/ZIWbC2a4GloeT3pwgG4PwgQDO1HDw/UG5J435YDjbi3/KhwAHVAyKfyDOgq/ehHqn+0JbJNwu6GUVnIQJrfzqgDqY3Hz2NvEqRaX3ImGcpYc+B2ZEkrpxyOgjyautU5iu5y5oUV0+MhJjCzvMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6u4sChk; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6u4sChk"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so4177827a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 15:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790807556; cv=none;
        d=google.com; s=arc-20260327;
        b=eIAl6C9k8w03TtsImrVaWcGdJwz2EpXyHFdCoJAgNpSwWpA3Fnv8jjtowzOhiozjbL
         iIHZDeCzCbk0bFsbOodgrwx+peu9Jd/75mG/GcqbZM69Fxrv6UsNAkO0GbJh/FLYhN1Z
         8OU26TQTAvla3a8UHZxmtvCFXUg+KAr+PNEx2Ev7ztZazrO4ik7u2WQt6IuZuQy1Ou9a
         OhVhYZKmAY8T5eXSE0MCj2auCtWl/RczQhwSlpSYwEGZOl5dHnbMKLP8FqWdkw8UIs29
         u6ObbUWo+hX3gu89aFR8zcgNSNzVaFhK97vIpAmIxBnyBW9UinOwcuccKN6DTGgYyyvX
         4+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BKIG/76pbPLgFFPRNg72x+oOwy0I50VygoCLcB5wFPM=;
        fh=+JXCImEYfGUcZlu5UGmnLD/w3uouC81g2F7Uo3QvRII=;
        b=koeYbuaSt6BzxJQ1f1GZbCsH5oTnJ0q2pBYiD9HOyPaW79qgNwHVHBDKNiMIcEdcF0
         dA6/BHGxm7SGf6+1q9983b3XSmtkPPnO8K8Y/mP2lMLcNQ7bJRM75S/GBYaiB/so6xTf
         xgBYrKJfbHG/wgbwDxbKQsu0EUW6aCVi3LKzOzfcqDkalDKF42n6MJvnQv+itQSKS1So
         hTIeM66hXHB8gkWgdyP0KyzUFTlKitdBk7oOsidmgJIFkLG20M++8WuvaJLNM0Lv7P76
         X9OxebhH3yi69MwG0Qhzjbe7iAuwh9OOdOieN1F8reiZPtg8FOAiVsni7GdD7qlwXRJS
         OcXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790807556; x=1791412356; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKIG/76pbPLgFFPRNg72x+oOwy0I50VygoCLcB5wFPM=;
        b=G6u4sChkoJqGFPrpnkyoe7TOrVeH9pPk7xpfPOZJYoTqie0rMkoXdfNUJidEYIWIKX
         JQE9gomK05vtU4beVmU6C88+UUuqXgmw/LyxEhZ6gTW/FY5njo1ZEjgMng0Ym4fyI3P1
         vQJsMBaPsijRdpjxEVfaReDBQCcnIjm9cQtD6eLJjYaESPFyXMq89H7p0GH69EKGomzb
         upxqkAuRJplKx6uVf5dhFaeZ+pGqfzgcTsJUXcKzsk+PzgSnf2b8uE7WaN8fzUaXSZvg
         mMa3HAoQdk6zQq+P60fkXXwZAWELQWF0+kQmkGccofjDYMzRBAM9oaSf98fh6elF7MJT
         jAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807556; x=1791412356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BKIG/76pbPLgFFPRNg72x+oOwy0I50VygoCLcB5wFPM=;
        b=iEdHMvyijBbdjozn2upOlBot1dNNjeNYtEISrKBH5EHnpVvrfAmpG1cOdYDc2+rasO
         aLV4jgiVhIqbgvJcVfK2gOJ9ErGMwTtz/0IXaLxDLuscz3N//NbhDoPcyPF+G8g2KLHm
         eERxstP5WiSXsknzwQFNe43/cXPsxll771JxdMRLV4WnSz2Lc0mB7CnKO6MRFsAmOsaf
         OwBcc76Cs2XJyr7qJc1yT40lRmfG5JPDNjiMwiU7+HOJSumHCjUmQ3kKl5zqBs7V8zxZ
         VIdNEXKPCzO8+10B4WmXu+RO5z738vkTi/Bt+B8iOMtuSzBIVxhR4MBkjMwfUErRoJ4H
         z11w==
X-Gm-Message-State: AFq9FYKpuxcBPtq9ac5UFcuTjNKS/01Hu7HVThKi6wq+/92dVze4NtL6
	zismOvhoIn7OY5xb0Zd7frDLK3XjFZp0xeTdhwDX4ajrktMGv/V85jQEhMmn/SXSEO9ucw3lnZr
	unjcvO3xEtQ/yPVNi/FZEQxCjBQ1ryQaVOUQq6UJEt63V
X-Gm-Gg: AYBFou2ZKdNiDn/ZUbJEl9ZhhCyZMmS038XVmHFgi9OG4rOFl2+eejXWzPBGeSfLmxU
	01my90zPV/dt03F7q5RDqk7OBsr+x8BxLUj4jVIlhGg9Cd19rrpXShF5cjek9Obucpo7WPgjvsJ
	Vvfk+d6QE5PK+/PCYQD8qcs/jGk65Az8+eXrkLwGngI4I2hcvPDqyzcYSrxIX0HRmIZoM2gX5TQ
	tA/iTiohMBXQ/nYenNpdkxJ/8esHbp+UBB/dIC9WHDkGGZIwZo93ASrTOweRVNldftSmSmajyP0
	Zpef4OopCc1qlqcaSff1dt4uNBqB0iZA4xtCIcDd1CzWW5R5ZHUijLDksG5SalXrdG85OQwYmzw
	WtTf6VwBdONxBaWBwx0DO1es08fB9rRbob05lcD06Yg==
X-Received: by 2002:a05:6402:51d0:b0:6aa:9f53:221b with SMTP id
 4fb4d7f45d1cf-6ae1988fb77mr2014945a12.4.1790807556270; Wed, 30 Sep 2026
 15:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728122423.358416-2-simone.chifari@gmail.com>
 <202607291626.TnSyWh0f-lkp@intel.com> <arwp1oCq48PBVmNx@zenone.zhora.eu>
In-Reply-To: <arwp1oCq48PBVmNx@zenone.zhora.eu>
From: Simone Chifari <simone.chifari@gmail.com>
Date: Thu, 1 Oct 2026 00:32:25 +0200
X-Gm-Features: AclHuK_dMoVuR_HSmOdtup3JFWShsutsoR1OXuAiRbxPtcD_ducDXt7oVtB0A0E
Message-ID: <CABe7xuZeeVPHhrU77M1poZnjVmCHb_84782-wrWmo0cWdDCWiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] i2c: imc-skylake: add Intel Skylake-X iMC SMBus adapter
To: Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, 
	Stefan Schaeckeler <schaecsn@gmx.net>
Content-Type: text/plain; charset="UTF-8"

Hi Andi,

  On Tue, Sep 29, 2026 at 11:14:00PM +0200, Andi Shyti wrote:
  > Please, be aware that with a test robot failure or warning i
  > don't look at the driver, but I expect a new version coming.

  Thanks for the heads-up. The warning is fixed in v4, which I posted
  on 2026-08-08 as a new thread:

    https://lore.kernel.org/linux-i2c/20260808212414.217511-1-simone.chifari@gmail.com/

  The interference check now casts the complement to u32
  ((u32)~COMMAND_OUR_BITS), and the changelog carries the Reported-by
  and Closes tags for this report.

  If v4 no longer applies to i2c/i2c-host, let me know and I will send
  a v5 rebased on it.

  Thanks,
  Simone

Il giorno mar 29 set 2026 alle ore 23:14 Andi Shyti
<andi.shyti@kernel.org> ha scritto:
>
> Hi Simone,
>
> On Wed, Jul 29, 2026 at 04:22:57PM +0800, kernel test robot wrote:
> > Hi Simone,
> >
> > kernel test robot noticed the following build warnings:
>
> Please, be aware that with a test robot failure or warning i
> don't look at the driver, but I expect a new version coming.
>
> Thanks,
> Andi
