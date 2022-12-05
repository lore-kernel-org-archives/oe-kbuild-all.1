Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34617CD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 04:18:25 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id k79so10185410pfd.7
        for <oe-kbuild-all@lists.linux.dev>; Sun, 04 Dec 2022 20:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzqPnNGw36VuLWg2EJymliVOhlDxnG0AxreG33VazHA=;
        b=eOYTzni4Zhxcuma9RSPCd3F+Rm4mgIKw+gjVm89TaRE/6nagK5CD3EEmMuxU1t8dNF
         /oHeAqXqsis+006sHvarL8N+Oqlv1Wm+SJUZ2wyVxfiR2CflKveeChlyHOOwTnKXjL8X
         NdAb5LfP+LkItT6teaTIb3p2E5ZJScfixILY3Zq7ro34j8d/XKEq8jFqq06bxvl8wFUW
         AXCxTlzk8XsRpg+3nr9SQlHRUeCLf52Dr2uef7lS6vwLvARM+qkcQ4t3RHuykZf3HRd0
         QaY9wmAxY2bJ9iBwBZ/c3/bZ0/3A3vDpBIfkDP9Oq6xryHFPGnQonH44BZzjU3LdU1p1
         OgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzqPnNGw36VuLWg2EJymliVOhlDxnG0AxreG33VazHA=;
        b=XxNUxk0qTFF6kox2dofYfWErwm8pvCuv0oeco6lOrkURhl9MS/ANFb9o6uVJ5b5iQG
         cY74+l7LtsHIIBASrIXkJQ9YRUFM3zlNU6aVEmFA7vCh7LW3kYA+mt5xqITImvwsm1vi
         SuAzIApUHxRqYKr/qUZkqAfuSvs9RQ5gIyhmm/cizl9bZOYuf3eZ8HbmUNOmkrTlmdXj
         XfUnZlcTOhbyqnWP+rHkFe/smMiB2RD9AtBb5mw4+BELS3NED+ofmQixow0mYgiD1GOA
         oeiOh5qC8DTQn6QK5sMx1uFlexBS6aTv4PMDU8MivJorQu57yoWqUiwyn1VHqizk4QEN
         Y0fA==
X-Gm-Message-State: ANoB5pmHtoYu8uQoT5mJH1rN9Oit+GQKyx0Gp1I+gX2R8pBSNgh1pKOJ
	hP09yhWAEoeg/lFyQe9hQ3M=
X-Google-Smtp-Source: AA0mqf69N2768Mi9R5BJR1VStSEofSrc28CRlgLRmWW3L0zE/FHXe6N50KF0o2S/nAYmFZijtFnVJQ==
X-Received: by 2002:a63:e510:0:b0:470:60a5:146d with SMTP id r16-20020a63e510000000b0047060a5146dmr61600765pgh.156.1670213904544;
        Sun, 04 Dec 2022 20:18:24 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-22.three.co.id. [180.214.232.22])
        by smtp.gmail.com with ESMTPSA id m17-20020a656a11000000b00478a3079b7esm2489764pgu.19.2022.12.04.20.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 20:18:24 -0800 (PST)
Message-ID: <97e37f71-7748-114f-ab96-7d29d81a4155@gmail.com>
Date: Mon, 5 Dec 2022 11:18:20 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [linux-next:master 10545/12617] htmldocs:
 Documentation/output/frontend.h.rst:6: WARNING: undefined label: fec-1-3 (if
 the link has no caption the label must precede a section header)
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Robert Schlabbach <robert_s@gmx.net>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <202212041959.Y2fRgy9r-lkp@intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <202212041959.Y2fRgy9r-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/4/22 18:52, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   5be860bfc73408bc1a8af9167955e480ecebba84
> commit: 6508a50fe84f9858e8b59b53dce3847aaeeab744 [10545/12617] media: dvb: add DVB-C2 and DVB-S2X parameter values
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6508a50fe84f9858e8b59b53dce3847aaeeab744
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 6508a50fe84f9858e8b59b53dce3847aaeeab744
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: fec-1-3 (if the link has no caption the label must precede a section header)
>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: apsk-8-l (if the link has no caption the label must precede a section header)
>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: apsk-64 (if the link has no caption the label must precede a section header)
>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: qam-1024 (if the link has no caption the label must precede a section header)
>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: guard-interval-1-64 (if the link has no caption the label must precede a section header)
>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: rolloff-15 (if the link has no caption the label must precede a section header)
>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: sys-dvbc2 (if the link has no caption the label must precede a section header)
> 
> vim +6 Documentation/output/frontend.h.rst
> 

My htmldocs build doesn't catch these warnings above, yet it says there
are 62 warnings...

Looking at the resulting frontend.h.rst, I didn't see any of these new
labels.

Cc'ing Akira and Randy to help sorting out.

Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

