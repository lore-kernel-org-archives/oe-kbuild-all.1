Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950C7481
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 14:35:16 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so2006952pji.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 03 Nov 2022 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XS5HY1qfVgPGBSCEvtrILQuPyjwIbVWvvdtLCE+QZb8=;
        b=fVvojiGFj1F60Uhyp9tm0SgPb/u6SkwEkY3IydXdAR3HwpDfPgesAqcgO5VQ/dkokx
         ey7yZ/uTqnyEqNVfWmm6PTYMEa9rSPLU4d0PtKu67Nmd4HFgLRJCrlzJ8hFPqzKWqjmr
         zjx02vVHkGTlu1LlovYuFaD/mLjHbSwSc0V6F/4SM8x7LuKC+OlPYsOZKTiremVtx8Pt
         Iu8Alb9812XeciNUXIURqJVF+E0Dflq9JLL3jjN6ICMWIpJ6ahknNAHmNY59L1YOlCS9
         OEqvURyXuVPrIhKGDjIylR5ONYyWT8sKSqNCLOOGimLBmeKPToiN1w9ZE50En5J2f1RF
         aR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS5HY1qfVgPGBSCEvtrILQuPyjwIbVWvvdtLCE+QZb8=;
        b=jZvfnKr3f9DJBQjSw38A6Dpd4d/uWU+PqJuAKOQYnqWEj8HM+0pxvCwE7Nrqsf2llw
         uonlByY5uUuSnC92AE8ZFyRugG4mh0DUxMAiFfo5Og4nmeEUillQN3APnJLmh/qj/v2F
         d3ONzjqCqMz4wixPEoHYM4pVfwdUoWx/48Mx0l+LZZ2fN7k3UfqJBw6dsaAQC13A7tqQ
         x2eUIc6RwKNt9XGB8HgNIDpDCv0tIcugApPw4AVX0qKw8oCIWcTQHrdO9cCXocxUj+T5
         nHPDQ59dD+fEntBC54eQfI3Sh06hMc1KV2J8cF3koIJfqKDvAWZXHd6Xdj+GM4GmMk5N
         BdFw==
X-Gm-Message-State: ACrzQf0jQ7w+I4bU/jdm3ifddGWTOAhUWPtb/vfhhBH357IO6tZyxIpq
	F5f6ysdbPFZxs8uvZPHKf4yg3A==
X-Google-Smtp-Source: AMsMyM5w0DXrQ+5b0Dr2Z1FMuMyOv8pf3Ny7uqe9sbXAM4mpFFAfcxeKR3dcynMgqwoKNBhQcWHiKQ==
X-Received: by 2002:a17:90b:3690:b0:213:c985:b5ee with SMTP id mj16-20020a17090b369000b00213c985b5eemr26188219pjb.192.1667486116041;
        Thu, 03 Nov 2022 07:35:16 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902e80900b001868d4600b8sm739611plg.158.2022.11.03.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:35:15 -0700 (PDT)
Date: Thu, 3 Nov 2022 20:05:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk-pm:opp/linux-next 6/7] drivers/opp/of.c:692:21:
 warning: variable 'ret' is used uninitialized whenever 'for' loop exits
 because its condition is false
Message-ID: <20221103143513.7yh3odcwhmh3rqfx@vireshk-i7>
References: <202211032146.8lAi6hQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211032146.8lAi6hQi-lkp@intel.com>

On 03-11-22, 21:29, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
> head:   5acd93462bff6c108d65802fd39f6002dfadd1a0
> commit: bf7e6e072ed166c11c687200df53aec8d7446182 [6/7] OPP: Simplify opp_parse_supplies() by restructuring it
> config: arm-randconfig-r023-20221102
> compiler: clang version 15.0.4 (https://github.com/llvm/llvm-project 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?id=bf7e6e072ed166c11c687200df53aec8d7446182
>         git remote add vireshk-pm https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git
>         git fetch --no-tags vireshk-pm opp/linux-next
>         git checkout bf7e6e072ed166c11c687200df53aec8d7446182
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/opp/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

Fixed, thanks.

-- 
viresh
