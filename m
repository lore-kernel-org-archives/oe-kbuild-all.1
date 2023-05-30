Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E02A927
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 23:40:23 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b034ca1195so21637055ad.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 16:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685490022; x=1688082022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4NZTnB3HOnHtoHzo7ahpVbK7T9rabz3LAeBB2m5AVg=;
        b=fmr7bTHb9dPBgzswN3RMWRcPe2e5CocBmP5VO5eZ99drQrCDkv1ydS46lrp+4oqHoz
         accbzkX7lFaNSPJfJFAqZsEGpp/cdjctuf4exBahHwQe4pGGlyzssVRf6hBKFohCxgkC
         x7aL7gsYAEQM2hnDAKBqMjdHuN/0mnWsbh+R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685490022; x=1688082022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4NZTnB3HOnHtoHzo7ahpVbK7T9rabz3LAeBB2m5AVg=;
        b=lUGWFbY+zphXqXgpdEYw53muNwDIKGNMsMeOJUVDFk721/cynxB5s+nQS64dFgdLpb
         Gj+DlpAhQGFkqoMwWVmWTnMIcJ1w3BmWFPTHwTDrP/RwQSKu9urnjIv/XTgrahmYmEmB
         iSk7k8/YCTyP4zM9+d6eLQkAUtu0rnCGbHx+lyVm4akqVj9ZYuksvNkmPBzPub3tCMGV
         2xgJTZKTNUTWqCCILZ2qasNmHJiNThOp0R80Uv6HV1JnuapwqUb9mTvImqbr0vCq9cdD
         Kjqqc3Nk1iHDluxAAovJ3yKkg+dFY4ceUxhVeqM1WZWXNCGI+ZRvgiHczGARLvmIQfEc
         bUJA==
X-Gm-Message-State: AC+VfDyHepRBWPcGATP8hLoD+yP+1Jckp8ikQPdauIVNi1KQsLLFKPSL
	WsLVTuJVBhqERZsBxxXtn9oNAQ==
X-Google-Smtp-Source: ACHHUZ7PSq91ujI8SrrGb0C2VID+a14xW0uYQ/wXdiq76eaw9ogxMHKC9mQG+F+/rr4CXZ/DaHJefg==
X-Received: by 2002:a17:902:ec8a:b0:1b0:36ad:fe13 with SMTP id x10-20020a170902ec8a00b001b036adfe13mr4316905plg.16.1685490022547;
        Tue, 30 May 2023 16:40:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090341c900b001ac7af58b66sm10826031ple.224.2023.05.30.16.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 16:40:22 -0700 (PDT)
Date: Tue, 30 May 2023 16:40:21 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: undefined reference to `ftrace_likely_update'
Message-ID: <202305301639.C19C2BE38@keescook>
References: <202305221244.L4XDdQ1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305221244.L4XDdQ1Q-lkp@intel.com>

On Mon, May 22, 2023 at 01:01:30PM +0800, kernel test robot wrote:
> Hi Kees,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   44c026a73be8038f03dbdeef028b642880cf1511
> commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()

The warning below does not seem to be due to this commit.

> date:   9 months ago
> config: s390-randconfig-r025-20230521
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=54d9469bc515dc5fcbc20eecbe19cea868b70d68
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 54d9469bc515dc5fcbc20eecbe19cea868b70d68
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305221244.L4XDdQ1Q-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    s390-linux-ld: arch/s390/purgatory/purgatory: in function `sha256_update':
> >> (.text+0x248c): undefined reference to `ftrace_likely_update'
> >> s390-linux-ld: (.text+0x2984): undefined reference to `ftrace_likely_update'

-Kees

-- 
Kees Cook
