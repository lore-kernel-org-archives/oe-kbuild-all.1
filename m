Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFED53F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jan 2023 20:27:57 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4d13cb4bbffso319094497b3.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jan 2023 12:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RCGRlXj3rnH7FYaOh9oXmb3IRjz1AWlYFZn8y1kAGXU=;
        b=RFhS8ISd0LoLFRi8USTqWFTUJ4JePLzy2CiWEePDkCQ30dUvjotDQuzKJwdxP6IddS
         DiSOm/ghZnsu8gUPon8YSy6ZWmxJt/rniOsvrKcbiwjg2HcbFcdVrsW5PVAn3cPiKm3N
         0T/ZC6d7ZcJEJDZ8Fq3gAfGkg5oZFL6lUNgPIVuR4spvm+S7qNdVGESPha7Cp4yVPf+Y
         SwbG677y1bJa0Yf8/NjTm+yO/avAxWunamdGtkQyYWM9YjFWq5wMRBNsHYoptPxMiCvT
         lrc9m9qv5/XC7reruhiVJSYW+eV80gNZaCmGCB/i3arfJgia+q/XQzRpV3TTqQTStfQr
         uZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCGRlXj3rnH7FYaOh9oXmb3IRjz1AWlYFZn8y1kAGXU=;
        b=452OGpoks4CskjKto8EdBNpKnmErHaVa3MCD79k4+eSSEoG1pN+NuAg2I1FU7qYyRq
         kqGjfag5mIzY/3HdhogLrCfa0Ju5BDvsU2Pv4RwYz54gS+zT5puC0NEKD5/x2Vg9j9u9
         vSzeJ51RnrByI1k0aywf5hpfJj8UlQlO2e5fFRtYgPx2h306GkN3gw8+I7Kf95OSDkOF
         eXWUObh6jhnoOGqctuLNnnyrIVO92SkblvNB470HH5FExrMdZcO+5T6PPX64AAY84UDX
         WWOVY86+nLJ9bA4hvD6Fl/koyYlKXerpf7Tye7J4zzS+j6jHJSj5Bw1LBTvucjEckSxF
         hiwQ==
X-Gm-Message-State: AFqh2kpg25JE1XTbFgf+vuMXX67BWW0scVowvgQ+fx+sYtum7rks6lcF
	PV5QkFWlaVG/gzIixidZkNlMsA8KehAe7NbdTBQJTA==
X-Google-Smtp-Source: AMrXdXs7kBLIIzxFPr6aQX2onukGaF899HTDSBSm3P6ETAZc85MHRsZWxu7xYkHxjh+dUs/sZCAbxry62qIYtlbpMVc=
X-Received: by 2002:a0d:cc07:0:b0:4af:16a7:5334 with SMTP id
 o7-20020a0dcc07000000b004af16a75334mr530548ywd.159.1673987276173; Tue, 17 Jan
 2023 12:27:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301170752.Y9ZPytWF-lkp@intel.com>
In-Reply-To: <202301170752.Y9ZPytWF-lkp@intel.com>
From: Kyle Huey <me@kylehuey.com>
Date: Tue, 17 Jan 2023 12:27:42 -0800
Message-ID: <CAP045AomNRW3=gmfFgQ9c7roQVHE74+D5w1g-o72KmdnUntNDQ@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 9905/9999] protection_keys.c:undefined
 reference to `__cpuid_count'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 3:23 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> head:   5bcc318cb4cd6b13569afdfc6d7b5c8c1f408f06
> commit: 46aa1557581ff4cc380c3b29ef516f2b15129a4e [9905/9999] selftests/vm/pkeys: Add a regression test for setting PKRU through ptrace
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=46aa1557581ff4cc380c3b29ef516f2b15129a4e
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.15.y
>         git checkout 46aa1557581ff4cc380c3b29ef516f2b15129a4e
>         make O=/tmp/kselftest headers
>         make O=/tmp/kselftest -C tools/testing/selftests
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from pkey-helpers.h:89,
>                     from protection_keys.c:49:
>    pkey-x86.h: In function 'cpu_max_xsave_size':
> >> pkey-x86.h:130:9: warning: implicit declaration of function '__cpuid_count' [-Wimplicit-function-declaration]
>      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
>          |         ^~~~~~~~~~~~~
> >> pkey-x86.h:130:9: warning: 'eax' is used uninitialized [-Wuninitialized]
>      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> pkey-x86.h:130:9: warning: 'ebx' is used uninitialized [-Wuninitialized]
> >> pkey-x86.h:130:9: warning: 'ecx' is used uninitialized [-Wuninitialized]
> >> pkey-x86.h:130:9: warning: 'edx' is used uninitialized [-Wuninitialized]
>    /usr/bin/ld: /tmp/cc5xWC2G.o: in function `cpu_max_xsave_size':
> >> protection_keys.c:(.text+0xff9): undefined reference to `__cpuid_count'
>    collect2: error: ld returned 1 exit status
> --
>    In file included from pkey-helpers.h:89,
>                     from protection_keys.c:49:
>    pkey-x86.h: In function 'cpu_max_xsave_size':
> >> pkey-x86.h:130:9: warning: implicit declaration of function '__cpuid_count' [-Wimplicit-function-declaration]
>      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
>          |         ^~~~~~~~~~~~~
> >> pkey-x86.h:130:9: warning: 'eax' is used uninitialized [-Wuninitialized]
>      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> pkey-x86.h:130:9: warning: 'ebx' is used uninitialized [-Wuninitialized]
> >> pkey-x86.h:130:9: warning: 'ecx' is used uninitialized [-Wuninitialized]
> >> pkey-x86.h:130:9: warning: 'edx' is used uninitialized [-Wuninitialized]
>    /usr/bin/ld: /tmp/ccvfRroq.o: in function `cpu_max_xsave_size':
>    protection_keys.c:(.text+0x124e): undefined reference to `__cpuid_count'
>    collect2: error: ld returned 1 exit status
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

That can be fixed by cherry-picking

066b34aa5461 tools: fix ARRAY_SIZE defines in tools and selftests hdrs
e89908201e25 selftests/vm: remove ARRAY_SIZE define from individual tests
a23039c7306f selftests: Provide local define of __cpuid_count()

to 5.15. All three of these are small test harness changes.

My apologies, I didn't test *building* the pkeys selftest binary on
each kernel when I was backporting.

- Kyle
