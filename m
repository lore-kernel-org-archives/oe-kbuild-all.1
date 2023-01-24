Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE9F8F4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 19:24:09 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id s4so14005541qtx.6
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H02SARdJbOG9xHDyO4rUQCOtJbYpCr4eHoKUBzaYL6Q=;
        b=C85m29M5lfrN780bOuZp0hcwIYmhYNu3EpCIUC5yO+IBjLEzwdVRSVjTss3vblrmTO
         QATRwCNI055bWM2lULIfOOg1dTqsEtj7/x7T1aWQXczPgKAwNSvro1yvrqREynp/BY/P
         KCaRyB+7mmWH8uudnalwE0g3WeJObVQUlFbuEeWGqTCVSunmEBNWkBuLcYyiLF42Vtmy
         RPulL5QO653p3sT6zUEPCUTuzW7byd4bJ25Zu1OWQrd6lmUoZ5zcCDRim4IH3f+b86bn
         ouQqN8M07iSpAjiG/YPu8/E92l+z8fEj7WBhCG8QWP3Gxr0Yp1uN7SVASIBkYK1h1+2f
         wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H02SARdJbOG9xHDyO4rUQCOtJbYpCr4eHoKUBzaYL6Q=;
        b=bD16EmLVnjA3HWvGICHvlFo+swiykQ0QVwc0m50rB5nVn81zfZwvX26SuGnT5uumWI
         Rp6h4GkvsxbKRr+slYZeqWgx5Z3qjabJ3356PQx2oNPpMIcwJ16Fqtook4PoF2/mgBCH
         88mS/toA4HbNfEcXaO0WTsOCF3+yZmC/0bpdoeaaJjVxuU3MkK5+O5MECL2ehVKc1w1d
         JJtHhJQ32CeXAJzeAKTnNaIltmsFREp+sTO6W5uoF8hxA9EAPN1Bp8OIla4Qapk1HEpD
         WPiEB9WfpvTlLdxHPS16avMW8QLtiZgf/U5fRMWKU/xrW4pNWVgx8/umlJyPohhjO12z
         T70Q==
X-Gm-Message-State: AFqh2kodRkMdhq7npVvg8ZDQBz+Za2z7E4tmyMTdZAVS4h8qKmPtQvLb
	ynpwD9Qr2j/r8T4BWhyqkfLPXGkAjnR7h1OaNt0=
X-Google-Smtp-Source: AMrXdXslw37tCOS4eF39s7VAH4eqhhJOdfda7JWGinfdntqqz+u1IqaESuA5KlGI4tYZV1Y805Xd6YqiehtmiIrtbbI=
X-Received: by 2002:ac8:774d:0:b0:3b6:6669:dd20 with SMTP id
 g13-20020ac8774d000000b003b66669dd20mr850987qtu.93.1674588248442; Tue, 24 Jan
 2023 11:24:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230124021118.154078-3-nphamcs@gmail.com> <202301241402.CeUdAtDh-lkp@intel.com>
In-Reply-To: <202301241402.CeUdAtDh-lkp@intel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 24 Jan 2023 11:23:57 -0800
Message-ID: <CAKEwX=P0RvicKMEWAzb+48V2Y1Cai8tdMc8oCS0GY8qoiv0g=w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] cachestat: implement cachestat syscall
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, oe-kbuild-all@lists.linux.dev, 
	hannes@cmpxchg.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bfoster@redhat.com, willy@infradead.org, linux-api@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 10:49 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Nhat,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on 1440f576022887004f719883acb094e7e0dd4944]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230124-101311
> base:   1440f576022887004f719883acb094e7e0dd4944
> patch link:    https://lore.kernel.org/r/20230124021118.154078-3-nphamcs%40gmail.com
> patch subject: [PATCH v7 2/3] cachestat: implement cachestat syscall
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301241402.CeUdAtDh-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/f902a360bb453bd6885cd89d4f9ad4a40205fd15
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230124-101311
>         git checkout f902a360bb453bd6885cd89d4f9ad4a40205fd15
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> <stdin>:1565:2: warning: #warning syscall cachestat not implemented [-Wcpp]
> --
> >> <stdin>:1565:2: warning: #warning syscall cachestat not implemented [-Wcpp]
> --
>    scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
>    scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
>    scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>    arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
>       26 | void output_ptreg_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
>       78 | void output_task_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
>       92 | void output_thread_info_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
>      108 | void output_thread_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
>      136 | void output_thread_fpu_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
>      179 | void output_mm_defines(void)
>          |      ^~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:213:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
>      213 | void output_sc_defines(void)
>          |      ^~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
>      248 | void output_signal_defined(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:315:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
>      315 | void output_pbe_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:327:6: warning: no previous prototype for 'output_pm_defines' [-Wmissing-prototypes]
>      327 | void output_pm_defines(void)
>          |      ^~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:341:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
>      341 | void output_kvm_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~
>    arch/mips/kernel/asm-offsets.c:385:6: warning: no previous prototype for 'output_cps_defines' [-Wmissing-prototypes]
>      385 | void output_cps_defines(void)
>          |      ^~~~~~~~~~~~~~~~~~
> >> <stdin>:1565:2: warning: #warning syscall cachestat not implemented [-Wcpp]
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

I need to add the new syscall to mips' syscall table
(arch/mips/kernel/syscalls/syscall_n32.tbl etc.)
