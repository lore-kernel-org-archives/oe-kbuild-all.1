Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6A194
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 07:04:23 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-97460240863so516031266b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jun 2023 00:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685948661; x=1688540661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzZedRJBAkF500kYyLnXKe/tOPsFESapJcBPtY0kEP4=;
        b=X2hpVba8KN4HxnZdPaFWGQWkRPN7sbiTKngSCnHXNFj6yANZsq2FZ5NDqMF/jlDF/q
         90+8jYzakhyGYkd1C03riNpBZqyvmQrk5V2V1eWyyUgT4pS/quBxESTkX+I4NX1Pekzu
         LDO+angk3Yy92xcEA9In1Zy9syEBDdF59uIicabFMVdzj34TNNu18asT5Ie6YgqrQL/X
         Omqc0qMVZGbpLX/hBer1GgoiDmGfOJ7P9ZCUOXXx7HsJz1B1WU+KW7bDCrVEn4pYil//
         HeUuMCsEXA6Uj3USe1kKa1+hB7Hq7bqMVxcG8m/NA+uyv8YkhWxdGb//y3U7kvULZSsR
         DWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685948661; x=1688540661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzZedRJBAkF500kYyLnXKe/tOPsFESapJcBPtY0kEP4=;
        b=Px9JodFzv1JWZMj35coSWd1nrd+536sx7wILyYlD7TX+hedU3WY2WEYxdQStPNoyD2
         QH8yEbA0WLUZ0xv2sywf7izX1zbam932eJpjyFq4fs/l8R1X3LPuH8zcwD2BvM9xZwuy
         d7Rs8kENYMGFpyMbVZpvSQCQkx375DVMG3q1YkmXC/k3SWfVMap+7jR9ePUt5j/yO5G7
         x/Lxy02FBtOS8s3q4aWs/aVMtsNEspZAFPrRUJJCmDC10rOoJaDuaQVk0ggSPcOywXWJ
         MDHmhIB3JNgF5BGKCieOjVr+Ulx5jcNlX6loTPEMUYZ5YfRPzxtQlh9znSvet1JVpB4A
         6qbw==
X-Gm-Message-State: AC+VfDw9YnnK+ZIm2LDzzCiBOPKqfoFaUGXMSbwZucBxffqSH94XdNK4
	axHsN78YYoEJVurCjJ2BtNM6ugNSF2o=
X-Google-Smtp-Source: ACHHUZ5IBgenPcMDIk5+nQG5+EYiPNuBp8SLbReQ5389nGutMro8YDiIq4nu3fCKGhj35IufytAvKg==
X-Received: by 2002:a17:907:7242:b0:94f:6218:191d with SMTP id ds2-20020a170907724200b0094f6218191dmr5972354ejc.32.1685948661205;
        Mon, 05 Jun 2023 00:04:21 -0700 (PDT)
Received: from krava ([213.235.133.41])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709066bda00b0096f6e2f4d9esm3869049ejs.83.2023.06.05.00.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 00:04:20 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 5 Jun 2023 09:04:17 +0200
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [linux-next:master 2368/6966]
 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:330:18: warning: no
 previous prototype for 'bpf_kfunc_call_test_offset'
Message-ID: <ZH2I8W2aUkJyPliD@krava>
References: <202306051319.EihCQZPs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306051319.EihCQZPs-lkp@intel.com>

On Mon, Jun 05, 2023 at 01:50:10PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
> commit: 65eb006d85a2ac0b23464808099726bd826e9877 [2368/6966] bpf: Move kernel test kfuncs to bpf_testmod
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=65eb006d85a2ac0b23464808099726bd826e9877
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 65eb006d85a2ac0b23464808099726bd826e9877
>         make O=/tmp/kselftest headers
>         make O=/tmp/kselftest -C tools/testing/selftests
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306051319.EihCQZPs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:199:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
>      199 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
>          | ^~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:259:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
>      259 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
>          | ^~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:330:18: warning: no previous prototype for 'bpf_kfunc_call_test_offset' [-Wmissing-prototypes]
>      330 | __bpf_kfunc void bpf_kfunc_call_test_offset(struct prog_test_ref_kfunc *p)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:336:1: warning: no previous prototype for 'bpf_kfunc_call_memb_acquire' [-Wmissing-prototypes]
>      336 | bpf_kfunc_call_memb_acquire(void)
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:342:18: warning: no previous prototype for 'bpf_kfunc_call_memb1_release' [-Wmissing-prototypes]
>      342 | __bpf_kfunc void bpf_kfunc_call_memb1_release(struct prog_test_member1 *p)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:394:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail1' [-Wmissing-prototypes]
>      394 | __bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:398:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail2' [-Wmissing-prototypes]
>      398 | __bpf_kfunc void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:402:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail3' [-Wmissing-prototypes]
>      402 | __bpf_kfunc void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:410:18: warning: no previous prototype for 'bpf_kfunc_call_test_mem_len_fail1' [-Wmissing-prototypes]
>      410 | __bpf_kfunc void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:465:14: warning: no previous prototype for 'bpf_fentry_shadow_test' [-Wmissing-prototypes]
>      465 | noinline int bpf_fentry_shadow_test(int a)
>          |              ^~~~~~~~~~~~~~~~~~~~~~

hi,
I can't reprduce, not event the old warnings..
is there perhaps specific .config you use for the kernel?

thanks,
jirka

> 
> 
> vim +/bpf_kfunc_call_test_offset +330 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> 
>    329	
>  > 330	__bpf_kfunc void bpf_kfunc_call_test_offset(struct prog_test_ref_kfunc *p)
>    331	{
>    332		WARN_ON_ONCE(1);
>    333	}
>    334	
>    335	__bpf_kfunc struct prog_test_member *
>  > 336	bpf_kfunc_call_memb_acquire(void)
>    337	{
>    338		WARN_ON_ONCE(1);
>    339		return NULL;
>    340	}
>    341	
>  > 342	__bpf_kfunc void bpf_kfunc_call_memb1_release(struct prog_test_member1 *p)
>    343	{
>    344		WARN_ON_ONCE(1);
>    345	}
>    346	
>    347	static int *__bpf_kfunc_call_test_get_mem(struct prog_test_ref_kfunc *p, const int size)
>    348	{
>    349		if (size > 2 * sizeof(int))
>    350			return NULL;
>    351	
>    352		return (int *)p;
>    353	}
>    354	
>    355	__bpf_kfunc int *bpf_kfunc_call_test_get_rdwr_mem(struct prog_test_ref_kfunc *p,
>    356							  const int rdwr_buf_size)
>    357	{
>    358		return __bpf_kfunc_call_test_get_mem(p, rdwr_buf_size);
>    359	}
>    360	
>    361	__bpf_kfunc int *bpf_kfunc_call_test_get_rdonly_mem(struct prog_test_ref_kfunc *p,
>    362							    const int rdonly_buf_size)
>    363	{
>    364		return __bpf_kfunc_call_test_get_mem(p, rdonly_buf_size);
>    365	}
>    366	
>    367	/* the next 2 ones can't be really used for testing expect to ensure
>    368	 * that the verifier rejects the call.
>    369	 * Acquire functions must return struct pointers, so these ones are
>    370	 * failing.
>    371	 */
>    372	__bpf_kfunc int *bpf_kfunc_call_test_acq_rdonly_mem(struct prog_test_ref_kfunc *p,
>    373							    const int rdonly_buf_size)
>    374	{
>    375		return __bpf_kfunc_call_test_get_mem(p, rdonly_buf_size);
>    376	}
>    377	
>    378	__bpf_kfunc void bpf_kfunc_call_int_mem_release(int *p)
>    379	{
>    380	}
>    381	
>    382	__bpf_kfunc void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb)
>    383	{
>    384	}
>    385	
>    386	__bpf_kfunc void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p)
>    387	{
>    388	}
>    389	
>    390	__bpf_kfunc void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p)
>    391	{
>    392	}
>    393	
>  > 394	__bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
>    395	{
>    396	}
>    397	
>  > 398	__bpf_kfunc void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
>    399	{
>    400	}
>    401	
>  > 402	__bpf_kfunc void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
>    403	{
>    404	}
>    405	
>    406	__bpf_kfunc void bpf_kfunc_call_test_mem_len_pass1(void *mem, int mem__sz)
>    407	{
>    408	}
>    409	
>  > 410	__bpf_kfunc void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
>    411	{
>    412	}
>    413	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
