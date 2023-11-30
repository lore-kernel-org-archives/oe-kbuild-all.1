Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3C736AE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OUOfwylN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d05199f34dso1221955ad.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 14:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701382316; x=1701987116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2FXLPRPiS6Mdb77R0ffuo1PuZkNG018RX2vgY/WJ7uk=;
        b=OUOfwylNdRQf6kXpgGOBmAcbG2yMArfh9SWKK3z50j2yiWufcp/uhnGTPOQeXa7wVi
         aHh5h5TAeVP6etayyTHUjvmg3ZREn7I2UZskV9hBVngr2tvSjuoWoSa/Ho+tY5HgehX8
         wWsI3b0mJQLZNKonB7B5kYJ7tw7Tb1UIFpNuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701382316; x=1701987116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FXLPRPiS6Mdb77R0ffuo1PuZkNG018RX2vgY/WJ7uk=;
        b=IDDNyq8PpPq3NOsSQQb+FS9Y6eyMQmjXuPMCy3pzoNotBhYSJo28DLke8z6A5vRDli
         v9EXmDY0eFF31vdL4OZXgeIp3FjguvPRw9IlniqRG2BmWkJPRCjeZyKbmsoaP4GK4Mnu
         b6T1dM4uuxLftsJcRe3sbU7+wODYHVSuL3Si+3ETdy1aRkRFE6SIVEcpPeiBOpoKYGbe
         sOFgV5xSZNOTZDtK7yDkcFfSczgQFO5Iq6r+SQ3lRr7EMIQAI9xDEHw0NkT4KvkGPiKq
         HdaYXDg1ay5GeYckVnkbo2n3gv0PKr8Te0afR6Ph8+SFvFy+c3RsPsJF2JbzdxidHAhi
         hGDg==
X-Gm-Message-State: AOJu0Yyg/I8RnN2eVx5HNuJ+KXhT2o8jXdYfsFTAXlVlcnSNCLUFZe4W
	0xRlPzIrJuIXfTn1/KZ9EFl8sw==
X-Google-Smtp-Source: AGHT+IH4tWRlUmskQclyK5FkszhjF8DT/WshIkLupA/qFqfEahEkWVLTEwfG04uaDmt3JTd8zTHaxA==
X-Received: by 2002:a17:902:ce84:b0:1cf:c4d3:6db1 with SMTP id f4-20020a170902ce8400b001cfc4d36db1mr18661789plg.8.1701382316117;
        Thu, 30 Nov 2023 14:11:56 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001cf66056a1bsm1900106plg.97.2023.11.30.14.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:11:55 -0800 (PST)
Date: Thu, 30 Nov 2023 14:11:54 -0800
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: include/linux/fortify-string.h:52:29: warning:
 '__builtin_strcpy' source argument is the same as destination
Message-ID: <202311301409.F2AFF5DA1@keescook>
References: <202311301039.7i51bZCz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311301039.7i51bZCz-lkp@intel.com>

On Thu, Nov 30, 2023 at 12:02:50PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
> commit: ba38961a069b0d8d03b53218a6c29d737577d448 um: Enable FORTIFY_SOURCE
> date:   1 year, 3 months ago
> config: um-randconfig-r034-20230830 (https://download.01.org/0day-ci/archive/20231130/202311301039.7i51bZCz-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301039.7i51bZCz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311301039.7i51bZCz-lkp@intel.com/
> 
> [...]
>    kernel/kallsyms.c: In function '__sprint_symbol.isra.0':
> >> include/linux/fortify-string.h:52:29: warning: '__builtin_strcpy' source argument is the same as destination [-Wrestrict]
>       52 | #define __underlying_strcpy __builtin_strcpy
>          |                             ^
>    include/linux/fortify-string.h:567:10: note: in expansion of macro '__underlying_strcpy'
>      567 |   return __underlying_strcpy(p, q);
>          |          ^~~~~~~~~~~~~~~~~~~

The only strcpy() in __sprint_symbol() is:

	if (name != buffer)
		strcpy(buffer, name);

Which is explicitly not the same address...

This appears to be a GCC 9 false positive, maybe?

-- 
Kees Cook
