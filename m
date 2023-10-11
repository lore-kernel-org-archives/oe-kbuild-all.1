Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B886D505
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a1mSJL2H"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-692c70bc440so5555929b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697039210; x=1697644010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbxtmhDXkXiJ4sJU2TYoCaOq9zTlJWtWH+ZOZQvS1JU=;
        b=a1mSJL2HcJSpugMRJ3/hxOWamfEHfsUpucTqwD4XsgnLnYggh/I4KyXy66SPesqeAe
         yajnTqGAQahGcJHyygb/RceAvCtoEn8B1DslYSU0rHbOOGBC9ndrWirIrSlElWKbcnKg
         QmWz/iqrwS5hYG5kb1/tg1qV+U7GrRHpgiO2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697039210; x=1697644010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbxtmhDXkXiJ4sJU2TYoCaOq9zTlJWtWH+ZOZQvS1JU=;
        b=IDFGLpm9K3n3A3hvmKdYVFaWpWU2WQUWkdnzBAhrTsAS99Ts8SCkprpprMQxUdQAp7
         wS1nb4JTuW2bH6s611OaqkY/tysJ44Yr+nRpllcZTohVDpbGnKKyza5ffaiGIGXc3pBv
         v7G8oBxa1G8wEhg85a9GG1laRixWtdZDgoOOBD2O+LLfD3wAxZZLij4qkHMvbTrXBjOH
         3th7czqPSZ1YEpeNTLGwSBZSnN4OFFBpdeLQCQ2CXPjw/n/xN4KoKbMq6aWLyLqPQujc
         nOkd4d47D0ukSVsah7C/eFjTHSQCCJoZFnlUB7g0bZE7f8x/N0mvChdbsIJKGrcd8Vp/
         70IQ==
X-Gm-Message-State: AOJu0YzzkpLgZUb8A0Vhzs2NofV+/3Axdmxz8E2tKOyYlsP1/nn5hjBS
	/fMYhvgx667lwGg7HsYpOj0yCg==
X-Google-Smtp-Source: AGHT+IH+ZLM0BJMK+wYTr9dlhQtylXth0hkut/5yzq5PnuwEBb9jpsTx7WEWWwtdKSPzm6VCzJd6Ug==
X-Received: by 2002:a17:90b:4c12:b0:274:8363:c679 with SMTP id na18-20020a17090b4c1200b002748363c679mr18919577pjb.19.1697039210345;
        Wed, 11 Oct 2023 08:46:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l7-20020a17090a850700b0027d0ebf7466sm59411pjn.21.2023.10.11.08.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 08:46:49 -0700 (PDT)
Date: Wed, 11 Oct 2023 08:46:46 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Christian Brauner <christian.brauner@ubuntu.com>,
	oe-kbuild-all@lists.linux.dev, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [kees:for-next/execve 10/10] fs/binfmt_misc.c:91: warning:
 Function parameter or member 'misc' not described in 'search_binfmt_handler'
Message-ID: <202310110846.8A1CB98@keescook>
References: <202310111341.87eYXHRy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310111341.87eYXHRy-lkp@intel.com>

On Wed, Oct 11, 2023 at 01:18:08PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
> head:   6f88724a1901ebcc039851aa2e001d11e33e841e
> commit: 6f88724a1901ebcc039851aa2e001d11e33e841e [10/10] binfmt_misc: enable sandboxed mounts
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231011/202310111341.87eYXHRy-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111341.87eYXHRy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310111341.87eYXHRy-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/binfmt_misc.c:91: warning: Function parameter or member 'misc' not described in 'search_binfmt_handler'
> >> fs/binfmt_misc.c:140: warning: Function parameter or member 'misc' not described in 'get_binfmt_handler'
> >> fs/binfmt_misc.c:725: warning: Function parameter or member 'misc' not described in 'remove_binfmt_handler'

Thanks! I've squashed a fix for these into the first patch that does the
"misc" refactoring.

-Kees

-- 
Kees Cook
