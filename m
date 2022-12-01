Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39336746B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Dec 2022 16:22:13 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 136so2100594pga.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Dec 2022 08:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4HNDBdmTrGofYM60NHSdVhVdD7Mrvdw/n8LElEwsyw=;
        b=eoA7Xcdl9qu0EHCg/x/dBG+U3Gi4R+vUOt4FTrWWod8uB7txNeOcpQda6D45mhamFT
         6YZA1Uz+iZFRqgCi6ccuNlqZNpZk/ZqlCGmDBcctk4vCbKla9cM6VhWaaQrOx5/NteQR
         zOn0p+k6lKkH2lA3lNQoo9wfBK32jHU6GMimg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4HNDBdmTrGofYM60NHSdVhVdD7Mrvdw/n8LElEwsyw=;
        b=wND57k6GBLxKpU37oBfHf1YI3MU20Yo3TDqA39nQ/iOpb4Zn06cXVD7MT1mCFk2X0R
         gU5pC/V0xbKamrQn6mvhIAl0DwwCfrn/IE8Wj1zoWL9VwETdjcWU0XWGQQTUkFM5bRDR
         vyW9kBjjgpcvcQO5kh0dOxjHwewvN15+gA2vnjRTsuMsYF+xeCtbjc2HZHWugapXF2Wj
         4Ez55ToajRFpm8/Or/LVjIRo8idUOEy+uTVotLa8g2J2synzYjYqNUQ+IyCw/RfRYOSR
         XYHU4QT87IjOuWZL7wWB4MwoPzEOipY/KBc4UqyvESuDFgX2v6Qeys5g98jXwhUqIG2l
         kKSA==
X-Gm-Message-State: ANoB5pkv5Z3K24IHd+udPnkzl2Wn7kaUCpW/9Op65nC2ZyMuz+BdCF29
	+WNC+GUmVrJCvLcm2MHLbHSilw==
X-Google-Smtp-Source: AA0mqf4Vw1Sn/Lli3Q943UpYBfPYtMYYYpUlLKrRV7Y04RB4YJ/uhwL+rztSrBCgou03Pu7231VOvQ==
X-Received: by 2002:a63:1d62:0:b0:477:d018:ef31 with SMTP id d34-20020a631d62000000b00477d018ef31mr31914169pgm.287.1669911732696;
        Thu, 01 Dec 2022 08:22:12 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902778800b00189758e2b99sm3809013pll.92.2022.12.01.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:22:11 -0800 (PST)
Date: Thu, 1 Dec 2022 08:22:10 -0800
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Jann Horn <jannh@google.com>, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [kees:for-next/kspp 26/30] kernel/exit.c:82:5: warning:
 "CONFIG_SYSCTL" is not defined, evaluates to 0
Message-ID: <202212010821.998D2F2@keescook>
References: <202212012338.0sDIWedC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212012338.0sDIWedC-lkp@intel.com>

On Thu, Dec 01, 2022 at 11:10:19PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
> head:   6fdc3fd27aec644a77f4bffffe7b0698eb217cc2
> commit: 345ff0411f9733e95a39b9ae01668762e4a4b632 [26/30] exit: Put an upper limit on how often we can oops
> config: arc-randconfig-r043-20221128
> compiler: arc-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=345ff0411f9733e95a39b9ae01668762e4a4b632
>         git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
>         git fetch --no-tags kees for-next/kspp
>         git checkout 345ff0411f9733e95a39b9ae01668762e4a4b632
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/exit.c:82:5: warning: "CONFIG_SYSCTL" is not defined, evaluates to 0 [-Wundef]
>       82 | #if CONFIG_SYSCTL
>          |     ^~~~~~~~~~~~~

Whoops. Thank you! Fixed and pushed out.

-- 
Kees Cook
