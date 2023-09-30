Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D132B66C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 20:40:18 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68c576d35feso13522408b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 13:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696106418; x=1696711218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/fXBByQPl8KY7eiFEi5g6L19V9juEXVrdMizugwt5T4=;
        b=cyQqY0IZtIdtcUCtIbXcCodg1xb/80LmEc3CSL66/t1xBsizvjmycxjpyI7gLUGSv9
         L1a4UXrOCRjCiWTeB4SZVvt1rJjaBwOdbz7ep25QtG3vja+JiZjF8IXx9PuUR8nlrRAM
         xFCUdukfdfEgrAw4AQIo+w4JKMNXSfWUsVSxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696106418; x=1696711218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fXBByQPl8KY7eiFEi5g6L19V9juEXVrdMizugwt5T4=;
        b=vQahLx9TEn6CeuPvXxN8zNTZu3qrfqCqkquHQIf2mh5ckji1dOeDC8wmKM1b8fWN9Z
         Feyj3TPo0yM7ZZy7dO9I89UbBk4az2gPeEvd1lU0XiAYpDfyO4t7KPy8AUdEGGm7kGyo
         hgSR0GUs4pQs4v37QVu8vPstRTAotrc3Z6+rTFu+Md5uz3kmUPGnNSpFe6SBfz3NjX17
         SoUBBHVVrZ5g6z7freFplqduPDBXOWPUoPsAojxFm9S02t3EJAt6mbofMWiTonB7/Mzf
         3V8WN9KuELu7qXdo7DqVA39BtRyh9rhAI1tsNf4EBLnMNdrgrqUVESsIzxDYa4tiEhyN
         1waA==
X-Gm-Message-State: AOJu0YwmalrX3+KGqMMmRW13wxLjSJv4ntomUKcM65YI7CEEKl0HowOQ
	pDRO469ds+IZTbg7ccD2cil1Dw==
X-Google-Smtp-Source: AGHT+IHkTbEpe8NOY7N2PNQrvQoHeBby2OJO5lF43caE809j96ZmiK/fEidsdab5v6MBMYeNGYv2cg==
X-Received: by 2002:a05:6a20:3d85:b0:133:f0b9:856d with SMTP id s5-20020a056a203d8500b00133f0b9856dmr9963086pzi.17.1696106417880;
        Sat, 30 Sep 2023 13:40:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e24-20020a62aa18000000b0068ff6d21563sm17490177pff.148.2023.09.30.13.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 13:40:17 -0700 (PDT)
Date: Sat, 30 Sep 2023 13:40:14 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: KP Singh <kpsingh@kernel.org>, linux-security-module@vger.kernel.org,
	bpf@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	paul@paul-moore.com, casey@schaufler-ca.com, song@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, renauld@google.com
Subject: Re: [PATCH v5 3/5] security: Replace indirect LSM hook calls with
 static calls
Message-ID: <202309301339.8196ECC78@keescook>
References: <20230928202410.3765062-4-kpsingh@kernel.org>
 <202309302332.1mxVwb0U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309302332.1mxVwb0U-lkp@intel.com>

On Sun, Oct 01, 2023 at 12:13:06AM +0800, kernel test robot wrote:
> Hi KP,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on bpf-next/master]
> [also build test ERROR on bpf/master pcmoore-selinux/next linus/master v6.6-rc3 next-20230929]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/KP-Singh/kernel-Add-helper-macros-for-loop-unrolling/20230929-042610
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20230928202410.3765062-4-kpsingh%40kernel.org
> patch subject: [PATCH v5 3/5] security: Replace indirect LSM hook calls with static calls
> config: i386-randconfig-001-20230930 (https://download.01.org/0day-ci/archive/20230930/202309302332.1mxVwb0U-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309302332.1mxVwb0U-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309302332.1mxVwb0U-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> security/security.c:139:1: error: Only string constants are supported as initializers for randomized structures with flexible arrays
>      139 | };
>          | ^

Uuh, where is there a flexible array here?

> vim +139 security/security.c
> 
>    118	
>    119	/*
>    120	 * Initialise a table of static calls for each LSM hook.
>    121	 * DEFINE_STATIC_CALL_NULL invocation above generates a key (STATIC_CALL_KEY)
>    122	 * and a trampoline (STATIC_CALL_TRAMP) which are used to call
>    123	 * __static_call_update when updating the static call.
>    124	 */
>    125	struct lsm_static_calls_table static_calls_table __ro_after_init = {
>    126	#define INIT_LSM_STATIC_CALL(NUM, NAME)					\
>    127		(struct lsm_static_call) {					\
>    128			.key = &STATIC_CALL_KEY(LSM_STATIC_CALL(NAME, NUM)),	\
>    129			.trampoline = LSM_HOOK_TRAMP(NAME, NUM),		\
>    130			.active = &SECURITY_HOOK_ACTIVE_KEY(NAME, NUM),		\
>    131		},
>    132	#define LSM_HOOK(RET, DEFAULT, NAME, ...)				\
>    133		.NAME = {							\
>    134			LSM_DEFINE_UNROLL(INIT_LSM_STATIC_CALL, NAME)		\
>    135		},
>    136	#include <linux/lsm_hook_defs.h>
>    137	#undef LSM_HOOK
>    138	#undef INIT_LSM_STATIC_CALL
>  > 139	};
>    140	

*confused*

-Kees

-- 
Kees Cook
