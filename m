Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B863002DF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582327; cv=none; b=YDpDn9SNMn9MCu21UQgW4FIBhKL0mP7cd37hkS2ne0JIX8DB5MHLLOavVWpUnt5DEqfWu+180dfX/+K2y71Zap4cN1yG7D3Uy/ATVVvPAfqXPbv0pU86xuTRlAZLa3T4NqrQTEoI/U48+Sr+eTZPaiFFWdR90kzbOao4aY3DTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582327; c=relaxed/simple;
	bh=7cWxuwA3g3kkC6PCG9PUpeAG1qSspeVfjc5KJijrK9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1UsIJnWuhRmK3dvY5C0/TXhPf1f1yjZWtYTQ5UozVDcoXI+vcLdjqLVuxpA40z9LLc957kE9WWSbmtUWhdsGKCXaFVnMOo5b+mhZhj1DW7XvB//o2Uh6iKrjZISaHYPZUnYl0r/8qKlxV7ROtgQYmMIBmbGBqEqQTAA73Qes3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dd6fbe50c0so1587644137.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 01:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764582324; x=1765187124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdwACx3aANiYv31fXK3GGXksEWZOCLq7BSM3f+D5Dvk=;
        b=Mbv+fU6NnGwG9QoNnQDRP0GGbBiDZ9BbTpf5yQUwB4ctuB8svaBL0UK4zVFTkfeIXA
         yt+AOeN2seriCRoAbc58w9vq7f48CDJr3F+XNVpLdvmso5vv4eHNa6uyaMg/88bulyb9
         c3EZ7cBFiWKB/ih+7MCSU4fc0gnfC3ncn9bhso1dD6LYFg+3cCvZdId7Ax1y1w2QWEdb
         RzwG8sC5wrdHnS2c/kedcko/eKHHagVvSOd4NfJhD/qEYR7vFeubUSo9jx8bRgj6Zg64
         TNADRP/vul838KA6z+BhhPxeuZL8AB7fqEBX6hzFakP+gB2Y7NdN+nGNXKFsjFkLQhjK
         mVvw==
X-Forwarded-Encrypted: i=1; AJvYcCW7OPRgUzGqKk1nQJDprAi5FwpheNh4d6re6MiH55UwjNFWRtk6Lo4PHbssY2shsZPhuwjef70V4ChBgwVz@lists.linux.dev
X-Gm-Message-State: AOJu0YzutZhwtu++xTVucfzKyxgRbBLCPVoQGJYqQtuFmoB5J03N3PeT
	0H4lXgCmGzLfbNB6f0QcbVe870BD0AO0WqXFEXXEw+cL6zlm4T3epa3OceGRnrRr
X-Gm-Gg: ASbGnctGN/+8mQiN/mcWOAZWa6bqnY64YC5ecX+JV5Vi4nGCIH1E7HI5WEgSXL1oqFD
	WOkkQOjifnnW98D05PohtguGUMDKl4u+Lle5il59UNSnZj/OH96QkEA77RgSndFggvGz/wxs1kp
	nIJlZG/PFB7x/0kWPWCnKuAIF/4ilTFyU668nOBu/APdNqrTSQVlv+oEf1qbb+NKN2Tku7J8DuE
	y0yGZ7p6jpG0smsD7WiMBLYdRwFPMyycQ1LepZUxna4ENREedTj4LFS/pOFBKUm8L8V74/JsKC3
	/u7Ed/cIHQHcT9NtqFg9NmKZNJ8x3/hzY8poWuh/Pv89qFZbXZ4zv4g5KhVnm7V3kLhqd2OFsva
	1D1vXhwsEnWmQOxIAgNhWljR6Fi5b6cu0giHjlq1A8JVNOfATVZCwl2yrJ0WTYTwcy5yhG+nCNc
	SDjAL9v3pClAN9KhcdFkdKg4QUyNg2p73SJ7OZJ2RDpyeYd41P
X-Google-Smtp-Source: AGHT+IEKKGGz+8JUu542GKnqi23Lv1WG6+lsbyWdLhysu9xpThA+YdTXecig33D4Q7GWo0IdwHppzg==
X-Received: by 2002:a05:6102:80a8:b0:5d6:155c:33aa with SMTP id ada2fe7eead31-5e1de163f70mr12217085137.16.1764582323959;
        Mon, 01 Dec 2025 01:45:23 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d94ee4esm4725016137.7.2025.12.01.01.45.23
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 01:45:23 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93a9f6efe8bso861951241.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 01:45:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWURpoKOD12QcuGCnHk2bK35umggYb+bD6n2/FNjLzVzhjCimHstm0rcngvCD+giX1jwtIUpV3C+tX0pfAL@lists.linux.dev
X-Received: by 2002:a05:6102:3e1a:b0:5db:cf38:f4f3 with SMTP id
 ada2fe7eead31-5e1de3444bbmr13752723137.28.1764582323075; Mon, 01 Dec 2025
 01:45:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511301553.eaEz1nEW-lkp@intel.com>
In-Reply-To: <202511301553.eaEz1nEW-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Dec 2025 10:45:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkYNxsuwdFPW7+Dc-y-awamu4j8P4g2JxGEO3FreQ2pg@mail.gmail.com>
X-Gm-Features: AWmQ_bkKzKHJkWsM8Qf1SwByW9FEo-7HxSHv6xqf0Tc1QdHLd9jHd7orv8b2lho
Message-ID: <CAMuHMdVkYNxsuwdFPW7+Dc-y-awamu4j8P4g2JxGEO3FreQ2pg@mail.gmail.com>
Subject: Re: m68k-linux-ld: drivers/net/phy/air_en8811h.o:(.debug_addr+0x38):
 undefined reference to `clk_save_context'
To: kernel test robot <lkp@intel.com>
Cc: "Lucien.Jheng" <lucienzx159@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

Hi Robot,

On Sun, 30 Nov 2025 at 09:00, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6bda50f4333fa61c07f04f790fdd4e2c9f4ca610
> commit: 6b9c9def95cb402374730d51a1f44927f467b774 net: phy: air_en8811h: Introduce resume/suspend and clk_restore_context to ensure correct CKO settings after network interface reinitialization.
> date:   5 months ago
> config: m68k-randconfig-r061-20251130 (https://download.01.org/0day-ci/archive/20251130/202511301553.eaEz1nEW-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301553.eaEz1nEW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511301553.eaEz1nEW-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    m68k-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_resume':
>    drivers/net/phy/air_en8811h.c:1175: undefined reference to `clk_restore_context'
>    m68k-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_suspend':
>    drivers/net/phy/air_en8811h.c:1182: undefined reference to `clk_save_context'
> >> m68k-linux-ld: drivers/net/phy/air_en8811h.o:(.debug_addr+0x38): undefined reference to `clk_save_context'
> >> m68k-linux-ld: drivers/net/phy/air_en8811h.o:(.debug_addr+0x760): undefined reference to `clk_restore_context'

This is a bug in the clock subsystem. I have sent a patch:
https://lore.kernel.org/8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
