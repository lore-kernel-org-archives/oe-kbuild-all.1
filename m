Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C9168CF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 11:03:40 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6af86627460so4501966a34.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jun 2023 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685963020; x=1688555020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KHEPHKWtlXKmaLalKRQJ9cxD2Ra6A/SIGC/nTsrV4vk=;
        b=zG0F/696ccocD1TBL2kOIAKOYFmvAZHCO5d8sda/KNOReAAGP+O2qWDrMTSghPuRP9
         ON27KwoFle2jFnvMNSPuQ8enrgb+a+bohyYpQcBsWLIfJMYtUWmKUFQxnAZsMjxo48B+
         fadp/jXnLVfnWvuarOtHnbSBFKZ7o1GVjhz0sQx02Qv4Y8HIgs0H3WyxImH9+NxplvZr
         R0NDikaLfgRaUrOQwaDuQewkDmgxHO//vbRAKc3moRSmh64nYhG4Wn1ofmD8HSLGjxk8
         plYBJg2/698qW8ETCopK4H8Vq3qKggAg7jQXyFw98ihsF/WtByPfzXsMzNt2A6RZqr0C
         Eghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685963020; x=1688555020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHEPHKWtlXKmaLalKRQJ9cxD2Ra6A/SIGC/nTsrV4vk=;
        b=Z3rNhTSl9VwiVgj3vhHQvcVGeV13qOpjGnmo5C2LzJscIeA1ByvcIj++lrD2w80UIA
         V6OdPwLUKglqt4gfRi4sQCKjO2wtQ/FfQcyT4ZZkAdyUNVQXOLaCNV071KbMlPo1mn7N
         Y5RVbSrru9WeXCL89ZHSrl4HFQ0Cnt4ZqMSyUzv2Uo9E+yUNEKKhnS+8QoP/g+acZckO
         mbxeDJNrOo4LJyJx0LdwkF7DcOHd4Psoigh8JhsCxLxy0rZfuny1YsQj23ixKFCRMUfx
         rrhvifBoFh0x/bA8nz3IWaEk9Jl13R8acKbY8QQn7+RVGbr6nWcHQRTnpOwqdl2WJ5eZ
         OCDw==
X-Gm-Message-State: AC+VfDyEay6EsJkgN18pnxiGj22CEIibIAKuJ+mnNqtSU+r1dUSFzvFs
	PlmkLuEKBT5uCyd0rrDi1kWIBw==
X-Google-Smtp-Source: ACHHUZ4W+2WhoulSQTbOXR8ao9o3cj1xUkLnXtQc6yNt6d86j53c9o9ZTwBBd8QSn33R9cFvXVsjsA==
X-Received: by 2002:a05:6359:2e9d:b0:129:cade:3cfd with SMTP id rp29-20020a0563592e9d00b00129cade3cfdmr1359157rwb.8.1685963019725;
        Mon, 05 Jun 2023 04:03:39 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id fu1-20020a17090ad18100b0024e33c69ee5sm5640839pjb.5.2023.06.05.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 04:03:39 -0700 (PDT)
Date: Mon, 5 Jun 2023 16:33:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 6053/6966]
 drivers/cpufreq/cpufreq-dt-platdev.c:104:34: warning: 'blocklist' defined
 but not used
Message-ID: <20230605110336.apirr37xwbn5sk4i@vireshk-i7>
References: <202306051812.1YdWyZca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306051812.1YdWyZca-lkp@intel.com>

On 05-06-23, 18:07, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9ca10bfb8aa8fbf19ee22e702c8cf9b66ea73a54
> commit: 2cb3ddc87094854f6aef49690ba2c25565208fe6 [6053/6966] cpufreq: dt-platdev: Support building as module
> config: i386-randconfig-s042-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051812.1YdWyZca-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2cb3ddc87094854f6aef49690ba2c25565208fe6
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 2cb3ddc87094854f6aef49690ba2c25565208fe6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpufreq/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306051812.1YdWyZca-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/cpufreq/cpufreq-dt-platdev.c:104:34: warning: 'blocklist' defined but not used [-Wunused-const-variable=]
>      104 | static const struct of_device_id blocklist[] __initconst = {
>          |                                  ^~~~~~~~~
> >> drivers/cpufreq/cpufreq-dt-platdev.c:17:34: warning: 'allowlist' defined but not used [-Wunused-const-variable=]
>       17 | static const struct of_device_id allowlist[] __initconst = {

Updated to include module.h as well.

-- 
viresh
