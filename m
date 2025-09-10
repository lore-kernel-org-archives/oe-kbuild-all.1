Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF132CF84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516121; cv=none; b=Hu/QhJ0XNa5CEeeyU2Sehe7w72eG9vEYwn3JXO7k5MK8TGEv5zkTeSJ6RA4jqfmd3eXRTTzA6UGEYdtB7WxTAwPnNG9eAOtU4jZX/aS9wfQELW/TJNuOTbo5xhtinRR48F5jn0Y3zk7HpXAho58pwy3WB1M0eK7ieqp5xC9p+No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516121; c=relaxed/simple;
	bh=5af/AwT6KfNTGqSpQuQ6FbWKuFRwcE7GyNykJbk1tqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QphENvEQjQit3JiN/D84jrbjQ0hHDGOTmzfM2KVh8jgD2oqTp79T/bhC4W+VlY7RHrGN+KAXXHQXabaSeWel7PMzuYTa/F95FgcyyPOk9GjGok96XueFa9Gokoe8yLXBVb7Z2liNyLGxgCMfqIJ1Zh1UEMDXU43WCqjFUhd67J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544aeeb296aso4343869e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 07:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516118; x=1758120918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//DRGGSnwpkitx6kcZgkAF5a1sMaJ0M51j+GALAjlxM=;
        b=wzcaW/WrOoRTSPYvqYXFhdCDkculJhU9Kz41cYVD8Va6v5Qq80HHfl7/6mLaeDEkGc
         DTW6tNziwkxj9PAQJnNgtOPWfRB0ruRXIi6vo7fBVs1aSa6xrMRU9o9hzn27yor2T20Q
         aEtPvG4LuB9ERowxICaFvBCTAPSDhyl+jb4vd+9P20Y5ttlOY+3Qajh/mrXecDn3WOVW
         6Nh37V04e37bMnPVXyeOjo0ge/IWgDRoPN9gKcK5eU/JhZ6pjPegQcXaX1dVP45fzCRj
         rk+lY0cXSQOVmfAXs6ggCmYxxUE6bjvcC7PZNttrX1PtAtIzaO9rjSd7sJ0iSQLaWtHt
         iv1g==
X-Forwarded-Encrypted: i=1; AJvYcCUhRALW6hafxm72TzGO5IYPbv3kOa+hc2rcijN9P85HplpCDt0hP03aHpEGV/hQv0lRABb/c1o6xR8ehoMk@lists.linux.dev
X-Gm-Message-State: AOJu0YxXRbFHvBZmEGJ+BvobbHySIgrPwd/AF9FoxHOqpjN1KtuvsoLN
	hT7zzp277lxgZn8WE2D6qjew9ASjW88vOgMnyzNmX3XUaGlcUvcYimfANswzO24L
X-Gm-Gg: ASbGncuSXJ9bYkpH+EMr3jTQHk/qeXwJrcP2xrTzB7Wn3MIoC6ZvDLSNUuf+6NyewyJ
	0Nx5WJaeGVTSsY0+yrsCkFCjTlusY7IDGIvuNy0Te1u/Zw4xWlGJ9qY3KYgmBVk5jFg+JFPraQX
	uCs4OQ4vGkJWlYbJkX71CHFcdVbTrC78s1HXFactT38EGYFPbDyBp9FlmYzc0e5frHNGrnzWfqQ
	Q2DoWHchZiH0HdCIRn9OgN/VFoQ2FFvFIJX3hVld9KY8zLgB9HgzeUneQeZy4ghb210u507aYtG
	S5Dh7Lv75ysV6lH6/wdjp3g3wT37F533wpmL+4ldPbLJ7tHz+i0SbRGmFBw1P8KRC6CNes3Rw9Z
	P99gH3aX3rXxG6Zh51t9cfPpL1EacdynBr3amxEGyOFuLMfIDHWCOIJOOWbU9bSotC81ZprI=
X-Google-Smtp-Source: AGHT+IG7aIQtlqoU5TMWeqPtsAn5VW9sFzjh6psL/fK3SppjsC1MxIhQSymrQrVvSGhmC8kleiflxA==
X-Received: by 2002:a05:6122:920:b0:543:8c04:43f4 with SMTP id 71dfb90a1353d-5472cdb06abmr5415363e0c.14.1757516117621;
        Wed, 10 Sep 2025 07:55:17 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912c7cbcsm14250097e0c.2.2025.09.10.07.55.16
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 07:55:17 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5357f3e2520so5576129137.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 07:55:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgNeEanMjgJxRurCgccZXHIwVR/sjVA4Ov6SJccN2sFstIk74HP7ujpn/VXsgJ767+3MD7rrBlbTYQ9e7k@lists.linux.dev
X-Received: by 2002:a05:6102:2923:b0:523:d0d7:b963 with SMTP id
 ada2fe7eead31-53d218dd0fcmr5047036137.22.1757516116296; Wed, 10 Sep 2025
 07:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu> <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
In-Reply-To: <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 16:55:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>
X-Gm-Features: AS18NWCYkdXAqeWrylTZ9OIziMkwB6Yb1TrV7psXDt0AcVru0xgJTTJ049UgE2Y
Message-ID: <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mary,

On Wed, 10 Sept 2025 at 15:24, Mary Strodl <mstrodl@csh.rit.edu> wrote:
> On Tue, Sep 09, 2025 at 09:32:09PM +0800, kernel test robot wrote:
> >    drivers/gpio/gpio-mpsse.c: In function 'mpsse_ensure_supported':
> > >> drivers/gpio/gpio-mpsse.c:211:25: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
> >      211 |                         "mpsse: GPIO %ld doesn't support %s\n",
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Oops. Turns out this is m68k-specific weirdness. v2 will convert the
> result to an int and use %d.
>
> I'll hold off on posting it because I'm anticipating there will be some feedback
> on the actual code changes that will need a revision anyways ;)

Please don't.  The m68k version is wrong.  I will send a patch to fix it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
