Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A923D4D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 21:00:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso4810324f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jun 2023 14:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685998836; x=1688590836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pVSAxrH9j0zMAxCcVD1uREShGRZVw8zvUmuzoRaB9w=;
        b=R7vtWVsEQYEbJe9fL3n/lrW3JiIasBhZaq4GdpIDRO3Wlqh2RKzuDHmcVuaHCLV8rw
         DY+B1ls0H9EerWaiCZOarpv2+JTOMDfm25M0vCQe4AkZP1IHAx5DQ3UFLNpIN6pBd5rK
         RuqJnbEkk49YA2SXovCj3yauMtIMta5a9Kk8ZD7eNsNwwcKaOZYgSyIrzD6QeIxOz0ou
         /pbisStRz/SvZY/ie3vcsrAQkepJq95U0tRu0L/6PrL3fycoutA/v5ZyfE7FYamC9Vit
         AXk5we7v0zvXOv5ZwnspHm4ljNZzU0mSiF1cP1e5hqlbf3VamhoXcFbNwBCQZZO/IrS1
         PiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685998836; x=1688590836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pVSAxrH9j0zMAxCcVD1uREShGRZVw8zvUmuzoRaB9w=;
        b=hsMt6Vr58nDPJWJCgaT3wLcNm0mBf91sdT8RoFzZsEN+CKLeUmPAp1W9WCf5tCs2gH
         fy8dGCsZXZRda3oUyZC2PAOoc+uQABqJuO1HNfB0TtzixVzbUPrG5ns6BfwABMZxhAZJ
         cyWPL02/XuUJHQUHCsrGPrpmwPKQESbaFdAp3F481j+y5yOuv8UtAF5P/+xtnqfkJalt
         bX1D5di0CW+LnBLoTfgBdmKbOls6ET/eqnYlKC1mCHDd+eYyy4K1zjYHr50B7uh00gvm
         HtqgSwCj2569hE0KuyOVHBoKNEmYpmvQH7jYsO/gKERPKhw/ZIx6OV3rekvjpW0R++ov
         iYVA==
X-Gm-Message-State: AC+VfDxJdoAis9W4nFJ408w9OGKbeK0c14MaU/YQEmut4pyFGE2BsKoJ
	DG3VOQRcvL83n+AnPSDuL2I=
X-Google-Smtp-Source: ACHHUZ7Ud/zQRc9qQtDy2rUkRQNkeAwMUItJcLTb6zfPNy2nqm2JxQkqywy/ag1jdZCGSk5e5hl8VA==
X-Received: by 2002:adf:f5cf:0:b0:30a:e63b:950 with SMTP id k15-20020adff5cf000000b0030ae63b0950mr6167047wrp.31.1685998835441;
        Mon, 05 Jun 2023 14:00:35 -0700 (PDT)
Received: from krava ([80.149.170.9])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d4e0a000000b0030aed4223e0sm10605497wrt.105.2023.06.05.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 14:00:35 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 5 Jun 2023 23:00:20 +0200
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [linux-next:master 2368/6966]
 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:330:18: warning: no
 previous prototype for 'bpf_kfunc_call_test_offset'
Message-ID: <ZH5M5HZSi0bTdzaj@krava>
References: <202306051319.EihCQZPs-lkp@intel.com>
 <ZH2I8W2aUkJyPliD@krava>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH2I8W2aUkJyPliD@krava>

On Mon, Jun 05, 2023 at 09:04:21AM +0200, Jiri Olsa wrote:
> On Mon, Jun 05, 2023 at 01:50:10PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
> > commit: 65eb006d85a2ac0b23464808099726bd826e9877 [2368/6966] bpf: Move kernel test kfuncs to bpf_testmod
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce:
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=65eb006d85a2ac0b23464808099726bd826e9877
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 65eb006d85a2ac0b23464808099726bd826e9877
> >         make O=/tmp/kselftest headers
> >         make O=/tmp/kselftest -C tools/testing/selftests
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306051319.EihCQZPs-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:199:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
> >      199 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> >          | ^~~~~~~~~~~~~~~~~~~~~
> >    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:259:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
> >      259 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
> >          | ^~~~~~~~~~~~~~~~~~~~~~
> > >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:330:18: warning: no previous prototype for 'bpf_kfunc_call_test_offset' [-Wmissing-prototypes]
> >      330 | __bpf_kfunc void bpf_kfunc_call_test_offset(struct prog_test_ref_kfunc *p)
> >          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:336:1: warning: no previous prototype for 'bpf_kfunc_call_memb_acquire' [-Wmissing-prototypes]
> >      336 | bpf_kfunc_call_memb_acquire(void)
> >          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:342:18: warning: no previous prototype for 'bpf_kfunc_call_memb1_release' [-Wmissing-prototypes]
> >      342 | __bpf_kfunc void bpf_kfunc_call_memb1_release(struct prog_test_member1 *p)
> >          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:394:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail1' [-Wmissing-prototypes]
> >      394 | __bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
> >          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:398:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail2' [-Wmissing-prototypes]
> >      398 | __bpf_kfunc void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
> >          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:402:18: warning: no previous prototype for 'bpf_kfunc_call_test_fail3' [-Wmissing-prototypes]
> >      402 | __bpf_kfunc void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
> >          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:410:18: warning: no previous prototype for 'bpf_kfunc_call_test_mem_len_fail1' [-Wmissing-prototypes]
> >      410 | __bpf_kfunc void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
> >          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:465:14: warning: no previous prototype for 'bpf_fentry_shadow_test' [-Wmissing-prototypes]
> >      465 | noinline int bpf_fentry_shadow_test(int a)
> >          |              ^~~~~~~~~~~~~~~~~~~~~~
> 
> hi,
> I can't reprduce, not event the old warnings..
> is there perhaps specific .config you use for the kernel?

ah ok, just make W=1 will do that

I think we can add most of them to bpf_testmod_kfunc.h
will send patch

jirka
