Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A913D246
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733340825; cv=none; b=l9RD9fphzJEq1CHOsKN7oJk9PND9m0prcUyl5jEHkgJBuYq2mX8E0J7s4ZCyJvxQ8Ap6riwlrAfj+kPArsLDxneAffI2wXmlimf2oglCX3EgxE8alqrX7LH0FqQ2DuWZY27NjmXM7IZn+yYgubxGGoB0F5LkMnSvo3gm7hWaiVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733340825; c=relaxed/simple;
	bh=b1Xpy6CD6aMD49xSm64SabOF+AaRJHNJEm1DcSmxM48=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biSqDP8F9ZFoFFgeiVqhGZYTE1hiLFjb9pu4pCfqZM9DWOVvP3Esk6ARb8rkjrkWMUnR7+HI0/Qry/vQAytJhEqBSMkzMCHYpIL2jAk4i7uY6t1PBkgYIhxBrQZcrdZn7JwN6sZGqBSOt6RRvuUTmVafHRJHmDMgRBbo3KMJ5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oVd27Seu; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oVd27Seu"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3971be41d8so107957276.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Dec 2024 11:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733340823; x=1733945623; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNJFJ6pRI65Hkx3S3msz6HnheriMpI4d7aUoNtf1ZHk=;
        b=oVd27Seu+Zu0p0mR5Fiv3YYqP3FHu1fLDnfIEhBFpvFTwFIm3Kyrt3kyft9wnBL2UK
         4DvCkgrB6yQtw/X5BP69GkvNcDx27+ta9+7YYrXLLvUVzpZizajF0B0zBHc6pgoHNnc0
         2Us29QRrqXEgm3LDzI6MMLaQaCXMDhTI39WVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733340823; x=1733945623;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNJFJ6pRI65Hkx3S3msz6HnheriMpI4d7aUoNtf1ZHk=;
        b=oU6Ag2el3DSJ40egaVMLj2+ViAEIDK/GWY9E9HEJUzeO+R29TirUcqeXhj2kOsh07k
         VVtmd1FoJVwkqkw9xRdmjJxJJ7k2FdL5f2e5Fj9sGNRG8fDK70uZGs8qcfZdtROZNAin
         3SB/YLqP78yMt6/iEOs5kkXvJh3dPGSy1gqGvcgmP/8Vy7/Du0ODeGxsc84vKU2hWqPE
         8XkmuqZ5gAMv2V+anr5+taGvt4vFYopr7b61GPj+MDMboDf4damCzrd0iChuT3ExoMBT
         P+Jk+6lpJBjrEWiYTo/h8gXmcV99nZHDvDd+4wS/cBiCIy2geoeyuvqozErxrvQQd6wn
         tQZA==
X-Gm-Message-State: AOJu0YwGHxv0haKcC2oHdaCzkiVSGb3vKzPo65l1BjBH9ma8tCa4xzDb
	KLIRKygylf00UV0OiseksR5pehWqi8r1b2B/UXSl151mKWI67iFL1ru/ahhbvXzaa1No79+Qa9v
	C9AdJurSSuUVUl5S2gOokGdejvOMb2s6Pg8Jx
X-Gm-Gg: ASbGncsRPnFeqUbY0Q3+XfKMdFKwNtUUom16RXQb72B41onLjers0PmywDVufcdlJ6E
	ToBh+06pqvTp2D0CQzmApCDgOBEZV/BrD6dEzQcJ1dCYac+MynOlRTW/iHn8=
X-Google-Smtp-Source: AGHT+IH3lQTfDvoVM5SgtnrmkWgM8tKtP2qmtpTk83iDRH4qhKbofq2v85Sk9lkW6T3GFBZuCLJYvwma2CMebDYV29Q=
X-Received: by 2002:a05:6902:726:b0:e39:8a36:5781 with SMTP id
 3f1490d57ef6-e39d39ee243mr6896832276.1.1733340823079; Wed, 04 Dec 2024
 11:33:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Dec 2024 14:33:42 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202412041839.pjv6awcS-lkp@intel.com>
References: <20241204000415.2404264-1-swboyd@chromium.org> <202412041839.pjv6awcS-lkp@intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 4 Dec 2024 14:33:42 -0500
Message-ID: <CAE-0n51ZnUnL9Ghc4VV=hH0ju+VNnq4HWj_xV5cOA-Q0B-Au5Q@mail.gmail.com>
Subject: Re: [PATCH] of: Hide of_default_bus_match_table[]
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting kernel test robot (2024-12-04 03:00:44)
> Hi Stephen,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Stephen-Boyd/of-Hide-of_default_bus_match_table/20241204-123701
> base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
> patch link:    https://lore.kernel.org/r/20241204000415.2404264-1-swboyd%40chromium.org
> patch subject: [PATCH] of: Hide of_default_bus_match_table[]
> config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20241204/202412041839.pjv6awcS-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041839.pjv6awcS-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412041839.pjv6awcS-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/of/platform.c:27:34: warning: 'of_default_bus_match_table' defined but not used [-Wunused-const-variable=]
>       27 | static const struct of_device_id of_default_bus_match_table[] = {
>          |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~

I will move the array into the function that uses it then.
