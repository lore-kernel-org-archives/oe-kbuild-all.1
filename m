Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9F2582
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 10:41:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i3so4541098pfc.11
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4Q8nIu0Rsw6KgcnS20mi7JEaEDHzrkWYM8DMs+/BzY=;
        b=II2sHQmmRtu+0dGDRmQU81xg03Y8pOisWMEDM7d7pco05ssgb2rZ9NsSOTO1uqORav
         8pLLJIxqwPdJOZf/Ot8L4gk1EwyxfWUMkLA9lTEpzXI+SWwOrQD/Eq/V8i9BwY+JKzwN
         +rI8Sp8nmxqI1S0Nt4krJQHV+sKkTzbE/3DaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4Q8nIu0Rsw6KgcnS20mi7JEaEDHzrkWYM8DMs+/BzY=;
        b=4NdlSrFjtBihYzU9ImSS81BGX8HmXp3+mX7yzefccVWK2R+k7TSmzHyegQUYJrWaJC
         WAQhfv593Tzq+RXs9E0HBkGANXk3l3oy8X88AdHrFHsevDx3VlcFKhYqGKcis0ZfpktF
         KmuOmL/UH2RUXmjJBtejkhVkYXsxMADnnTXigkTdSFAsRbPUS5CiBDqfobYcRtR7r72k
         1j+lC38x3hCIm6Od/nBLtOFGeyeX9znPkNVYSGCKCEbmKH6wfTdZCoaiKn6z3v0Pp6py
         QksvTHhk7eFhUw8hd4R8OYTOws/+bthIefZTck3ocsULmw25Xwm/gMYiR4c/2QhB/88J
         Hp+g==
X-Gm-Message-State: ANoB5pkCEXHXSGlpnBH/38EntIvqLY0RC995+I1VnBdUkMOXcUtJsPTX
	yOnXKQN7JRz94f+L363laO+hzQ==
X-Google-Smtp-Source: AA0mqf5xrGosc5iI3cYWq4qcl/ehI2sTRTCHPCdWFJRh2x4nw/ET0QEtXz4u0pBkuQ6+hXsg3WiADQ==
X-Received: by 2002:a05:6a00:440b:b0:56d:9eed:61eb with SMTP id br11-20020a056a00440b00b0056d9eed61ebmr2149086pfb.4.1668163270303;
        Fri, 11 Nov 2022 02:41:10 -0800 (PST)
Received: from google.com ([240f:75:7537:3187:8d55:c60d:579d:741c])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902784600b001869ba04c83sm1344658pln.245.2022.11.11.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 02:41:09 -0800 (PST)
Date: Fri, 11 Nov 2022 19:41:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6603/7443]
 drivers/block/zram/zram_drv.c:1857:7: warning: variable 'err' is used
 uninitialized whenever 'if' condition is true
Message-ID: <Y24mwWWnRMw+KwmU@google.com>
References: <202211111624.1XZTuzHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211111624.1XZTuzHJ-lkp@intel.com>

On (22/11/11 16:27), kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f8f60f322f0640c8edda2942ca5f84b7a27c417a
> commit: 03e6c729aa640eed324de05dc588c05cc00d88d2 [6603/7443] zram: introduce recompress sysfs knob
> config: hexagon-randconfig-r001-20221111
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 463da45892e2d2a262277b91b96f5f8c05dc25d0)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=03e6c729aa640eed324de05dc588c05cc00d88d2
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 03e6c729aa640eed324de05dc588c05cc00d88d2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/block/zram/

Thanks. This was reported last night and we have a tiny "fixup"
patch for it.
