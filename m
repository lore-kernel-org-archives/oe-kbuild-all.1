Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7EC5CAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 21:21:48 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68becf931bfso1131869b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 14:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692998508; x=1693603308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4OY3QMtQlW2A8shzjZaxk5Of7hJ4fmFNlBUbsxtkxQ=;
        b=fei7i0uyzl9ptkYyenDgvKj7vBA/GDCxWwYRfjKiD1l8g9jTZv1V5AE1sf3PGmsjVJ
         DymKAFHmwRkvAHeKJEEozluqczr53bD73KTvLcmtPBG/yjUMT1ks9d4gD3X5AOEbStzd
         u4RYm67sqIEtn3WiHIdt0LlfYQhAlx687Tcx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692998508; x=1693603308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4OY3QMtQlW2A8shzjZaxk5Of7hJ4fmFNlBUbsxtkxQ=;
        b=KKr8mtjjFEQo8w1OGE08LIcCADys83fXLOY0yxhaZpotE6fUGY9Bm1i6udFkrtqV1y
         CM5oIkzbFbWsKMpZMDchrUzDNPv5JGBT7lUo3kfc5cefqpBCATO+f5FcEHnl3E9OSoZP
         77ByqXCejRBra7b59IIz4JXjQBzv6HL3EkoES3zGJ+w18vfCAl0uQdIjPQEBgBnBJErT
         pVWG1vp9RNoHVui9XHoyeiN43jbnk5W1J2bPSjvJdA3cApLGeIMFr/0q48Q3G8Qulb9l
         SD/GC0VUv5Pn8OThgcQs6nhg9p4gM5LkhmIwygdTSOzirRO67oWSaD8H8C72oej3ro/1
         B8OQ==
X-Gm-Message-State: AOJu0YwyslEKK6F7hCmO3En3ACqLzMCBG9C6W52PGehxZz/z95IQzw8W
	EaPKU2hy5x49/lGqfQQTV62qBw==
X-Google-Smtp-Source: AGHT+IGAd0eL6EeVbMYxqriAmnLzeAiz+RO+l1tdF9fEaU4IwWXUrBlVotMXRKCSDJwtaCSW7sT05A==
X-Received: by 2002:a05:6a21:3e14:b0:14c:5f8:fb3e with SMTP id bk20-20020a056a213e1400b0014c05f8fb3emr5693501pzc.38.1692998507874;
        Fri, 25 Aug 2023 14:21:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e5d200b001b9d95945afsm2199984plf.155.2023.08.25.14.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:21:47 -0700 (PDT)
Date: Fri, 25 Aug 2023 14:21:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: lkp@intel.com, bp@alien8.de, dave.hansen@linux.intel.com,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	x86@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH] x86/shstk: Change order of __user in type
Message-ID: <202308251419.0EB21A4A@keescook>
References: <202308222312.Jt4Tog5T-lkp@intel.com>
 <20230825014554.1769194-1-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825014554.1769194-1-rick.p.edgecombe@intel.com>

On Thu, Aug 24, 2023 at 06:45:54PM -0700, Rick Edgecombe wrote:
> 0day reports a sparse warning:
> arch/x86/kernel/shstk.c:295:55: sparse: sparse: cast removes address space
> '__user' of expression
> 
> The __user is in the wrong spot. Move it to right spot and make sparse
> happy.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308222312.Jt4Tog5T-lkp@intel.com/
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Ah yeah, a good find. I with we could sanely use "address spaces" in GCC
and Clang so we didn't need to depend on sparse for these checks. I
tried to get Clang doing it[1] a few years ago, but the wall of warnings
was huge.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=clang/address_space&id=beff911c13390a71b3f7921fd82ec6a71ca75c02

-- 
Kees Cook
