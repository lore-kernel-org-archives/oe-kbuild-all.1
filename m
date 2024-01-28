Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C583C490
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 22:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706481596; cv=none; b=GfJTFAqj6VKRTm66FaUT8081VCu9yKWVCAz4r30SSIFkolh6r/rZ88oKwLRxcLvLjsVOkXycoAcqKXOnyGFZYSEUQauu2zmGbbmO65Gkw0ffU5ucXjSoPvKyn8ubjxmJm5jGiJvJnSkyTVpoy1EUeAzQGzfwAzvmrybGk0MooHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706481596; c=relaxed/simple;
	bh=0bngCnVE1UVaB8Z16F7RhEvHk/Mk62Xo1gIMpFRyOoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gblGwmZpRzdCcRMsnzMC+l1CIplpgW4e4NHqTwOsk0ZhjnUpv1oxGD+OdL4J26fn3CbjNzWwQ9qvoc69fBFj9iXbWYZ+EDye2I6hs8sqj50w9LAblyBnbnbcz6+lfu+QViXK5ojLtUcyMUDukcL+IGrD7qCGFF6s5lOF5mDgkOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LCNjxLcg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LCNjxLcg"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3542a3374bso161966566b.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 14:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706481593; x=1707086393; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iplMPbX9nfLmdwf9iuaiDoK2OJZv8fxfr2mQwn9osC8=;
        b=LCNjxLcgg0vGKk+FdQEZx/IGtLzwMnWaNlDmp3052wcnVXgGFhJrFPujn7GLgTmtqe
         NxSI/bzin2pmSx4paNBsYNc/2QM4B/SKZElWu8DpnDzE7idvhbLwnc6xALYuFMJlFfjW
         skQ3/B9ZLrqdf6WBHhW12UhyzzBaDOhcyhPXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706481593; x=1707086393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iplMPbX9nfLmdwf9iuaiDoK2OJZv8fxfr2mQwn9osC8=;
        b=sdMFHiDtV0cJu403Mf1QTaQQHry4oIOkFVVJ57ElsWltTa3SWugoh9iLoegvodAWzV
         YUyxXzExBQDfbed2PbcpYFyqCySsqQ5LJzXzX1FOch2/lzvKoggbLcypINcfqdDQ6dNz
         PReKmLCDWdefPBI7Q8R7Mv9IVFLYgmB/8bTgSYo+Ao6/aHgSsjjqRHLu/3RIRCHieUD2
         /qUJg4dSddVJj1Qgm2GFf2R1jOlt/343kqDHI4WBAgqOC4E4JmGhbUocbs8kuF97zr3U
         gSych0/h8VTs0VqUsh3iQ5fELCW2baX3umbrHo35jPeNKvLDJPotymvuET1+Ag/NIzf7
         T5Ag==
X-Gm-Message-State: AOJu0YzwPS/A2Q7n4BnML4Qvj4E1MudYw5xF/RkZo1jZkeFTF3myy4cf
	SVLKleIdf8/SMEKdYBskwCFX/u7/ks1gT979iZ1icPjJDsYXBqAZYFRwFz0swWTmc+daAXSV0U6
	7K8K7uw==
X-Google-Smtp-Source: AGHT+IGaKiFxyG5SsfklzS9j9z5wEAlYeThWYZXBAD2/fXrz6oHKRkH4z8vJ8wUQ4xTaolj2BOSZTA==
X-Received: by 2002:a17:906:6810:b0:a31:4cf0:cf81 with SMTP id k16-20020a170906681000b00a314cf0cf81mr2887262ejr.37.1706481592826;
        Sun, 28 Jan 2024 14:39:52 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906660c00b00a35b06fa7d0sm583028ejp.18.2024.01.28.14.39.52
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 14:39:52 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55ef011e934so589764a12.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 14:39:52 -0800 (PST)
X-Received: by 2002:a05:6402:74d:b0:55c:57bd:c780 with SMTP id
 p13-20020a056402074d00b0055c57bdc780mr2626730edy.27.1706481591957; Sun, 28
 Jan 2024 14:39:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401280650.Us2Lrkgl-lkp@intel.com> <20240128211544.GD2087318@ZenIV>
 <CAHk-=wj8LUAX_rwM4=N9kNGeg=E+KoxY6uQfyqf=k7MOrb4+aA@mail.gmail.com> <20240128220904.GF2087318@ZenIV>
In-Reply-To: <20240128220904.GF2087318@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Jan 2024 14:39:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wih5PvaVpdgjLrAof6cX0SP9kM-z-pWczDk8EaHscDGzg@mail.gmail.com>
Message-ID: <CAHk-=wih5PvaVpdgjLrAof6cX0SP9kM-z-pWczDk8EaHscDGzg@mail.gmail.com>
Subject: Re: [viro-vfs:work.alpha 5/8] arch/alpha/kernel/io.c:655:1: error:
 redefinition of 'scr_memcpyw'
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 14:09, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Do we ever use that thing on iomem in non-VGA setups?

On iomem? No. But I think several of the routines just work on either
VGA screen memory directly (c->vc_origin = vga_vram_base), or normal
RAM (vc_allocate)

But who knows.. I *used* to know all this code, but happily no longer.

                Linus
