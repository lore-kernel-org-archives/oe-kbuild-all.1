Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AF466663
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 17:49:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-690ba63891dso11420559b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 10:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696009786; x=1696614586; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tb9SgE+PjQ/TMe+HxjM4ps88fibUn7Lz2P6WDbPV8zI=;
        b=Zeew826Gkb0wdezWjnP50kqsaHebzR3J5io8Mdi7QZGzzSxk6QqhcSGE5z74+OxBH4
         NWwU6Z7obJB/TpTzsVvsThhgenTVbI49DFUn086qUh8jvXfGGPIS5ChORid0MVaT75VY
         +pCXkJGW4K9bzTcYo5DRMFgBtFTtQ9PNgS/7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696009786; x=1696614586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb9SgE+PjQ/TMe+HxjM4ps88fibUn7Lz2P6WDbPV8zI=;
        b=qNGR7LG3n5aZNZw4GZ9vBGgV03sqzJrWON+kwNOvbIiwJwt4qPnzlaJPsgwQgpV+aU
         oA3ln0dD+I808abX8bxXrqn1E0Fhk3Pr9w7MSpn+3p7nPOEg9bXioeOKgBcTYQtq+i6F
         zeyTlk62+vqnf4Md1IDHQGvRdfE16mXXcZo+UpS/4fyDAIWy2Qe7DmBRGf8zK5dRuzZK
         xz0MJtPaD1o49H+QsCGYLlH+vphQF2tj3bQtxb7ucrjMhTVz75R7o4eFvZA0BfOCyiq6
         lkOI4oEJhF4ApO9DzDzrCks10XEnriOpFei48+zVptbmsmfPoKtsr8gkRiLaTfQyQghn
         Viaw==
X-Gm-Message-State: AOJu0YykR3UxiZJtaxc5ECD8+LMdSPlT7gWlC79RXJG09AYiDI+ZjDaQ
	qsYPLmwlRbHXprXmOm/0N3h19g==
X-Google-Smtp-Source: AGHT+IGbn+3BNWCjTTuyxQLw8tWyj2VyJzXvlSaWY37xxjHAVT7ka+2tJOFCDs1ZyMD1Uu+LL3BKJg==
X-Received: by 2002:a05:6a00:2e0e:b0:690:d718:8c6d with SMTP id fc14-20020a056a002e0e00b00690d7188c6dmr4660881pfb.15.1696009786482;
        Fri, 29 Sep 2023 10:49:46 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a17-20020aa780d1000000b00690d4464b94sm4430446pfn.7.2023.09.29.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:49:45 -0700 (PDT)
Date: Fri, 29 Sep 2023 10:49:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, justinstitt@google.com
Cc: kernel test robot <lkp@intel.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: drivers/md/dm-cache-metadata.c:1705:9: warning: 'strncpy'
 specified bound 16 equals destination size
Message-ID: <202309291040.F201590997@keescook>
References: <202309280610.sLGSPkOG-lkp@intel.com>
 <CANiq72=J=bO-Q0=gMDyiRgvbF_Vre39iqbEnaEeDho4Vo2ox6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=J=bO-Q0=gMDyiRgvbF_Vre39iqbEnaEeDho4Vo2ox6A@mail.gmail.com>

On Thu, Sep 28, 2023 at 11:36:46AM +0200, Miguel Ojeda wrote:
> On Thu, Sep 28, 2023 at 12:24 AM kernel test robot <lkp@intel.com> wrote:
> >
> >    In function 'write_hints',
> >        inlined from 'dm_cache_write_hints' at drivers/md/dm-cache-metadata.c:1729:6:
> > >> drivers/md/dm-cache-metadata.c:1705:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
> >     1705 |         strncpy(cmd->policy_name, policy_name, sizeof(cmd->policy_name));
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This looks fine given the check above it. In any case, since it
> appears the code wants to terminate the string, this should use
> `strscpy*()`, right?

I agree. I can't tell if _pad is needed though. I think struct
dm_cache_metadata is only used internally? And I see at least the
initial allocation is zeroed:

        cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);

Regardless, for background,

struct has:
        char policy_name[CACHE_POLICY_NAME_SIZE];

code does:
        const char *policy_name = dm_cache_policy_get_name(policy);

        if (!policy_name[0] ||
            (strlen(policy_name) > sizeof(cmd->policy_name) - 1))
                return -EINVAL;

        strncpy(cmd->policy_name, policy_name, sizeof(cmd->policy_name));


Justin, can you add this to your queue (if it's not already there)?

-Kees

-- 
Kees Cook
