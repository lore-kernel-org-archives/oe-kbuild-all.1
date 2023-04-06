Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E4A5F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 10:42:09 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l12so39023493wrm.10
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Apr 2023 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680777728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8Mk2+M+U9U1xk16bRh97zwUqHu1UtyYZDh+G+w+1wM=;
        b=S9E4ffHpTrMCmTUFaoE6tY973cu3dLiVs4FDF9xvtEPlP6y883pKSM4p1hKNIINB8H
         W277mpy9cyECkz/icqew52I6QR6v0oXp9cxrY+RvvATbHh7+qSy7A1NuHU1UNScUq8GN
         f97pYwKU1i5QgJjUC/VQket7mFseXHQ3Y5gBe5k09g2WWWm7kL4SiqdILk+Ei2MmLAj+
         diYVf8yPBz6lFokScHeg7RpBekWkj/eRYOrD35bH7jJDum9N+UyUfHMeux4CqRPxeToZ
         Vudp/bfRVkm0r5zx0nZoeEDd7njEQ8COqI6Bmc4hii3jNYH2nrxkvsIg/sy1gO+KL/n4
         ZGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680777728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8Mk2+M+U9U1xk16bRh97zwUqHu1UtyYZDh+G+w+1wM=;
        b=k6jiY11i4bNjH9zNC+N26vFlPsekqtm+rH0nb2PxMapD/VADSYQap1N2+2gOzl2Igo
         MRANfixYKcYFRNHeYlaMg0SSP9BupDxE5X6IB/Y+aLthM5os6QlirX6TQt8Tdl/VZWOT
         DlQdVzfs6CIECZ+eOQZh55Tzp1Mh22gVKcXXoZGrkeHBIAKtw6eVWs7WeUwiXSRYYexs
         s1QhcNEG7aogytKo4nmFSqGWShk9OJoUUsMeWdgG/UlahhCwhxy4IEUqu/gKY8l/IzmV
         Ih8Y19PaAwCpsWGmMkmXae6S71D/H9PjJs4ZsEkRs+/iK2swfllIRd3OXBxBUKvEGTUy
         Iv5w==
X-Gm-Message-State: AAQBX9csOYTDGAbEhYjdJfC6iVZ2jOqLTOYywI2MK55XF9aBj1dQr5LO
	DVL67cRM8wWk/aXJqcSRl9M=
X-Google-Smtp-Source: AKy350aq0OJh81T/etD7LG2qv0Q1LqIijAii8+j63yC/7EHOiROcCBBivJWAFwGh4QB276iwIsbe3g==
X-Received: by 2002:adf:ef03:0:b0:2e4:ff71:1c8e with SMTP id e3-20020adfef03000000b002e4ff711c8emr5922589wro.68.1680777727577;
        Thu, 06 Apr 2023 03:42:07 -0700 (PDT)
Received: from krava (cpc137424-wilm3-2-0-cust276.1-4.cable.virginm.net. [82.23.5.21])
        by smtp.gmail.com with ESMTPSA id h7-20020a5d5487000000b002e707102a02sm1369494wrv.101.2023.04.06.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 03:42:07 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 6 Apr 2023 12:42:05 +0200
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:131:14:
 warning: no previous prototype for 'bpf_testmod_fentry_test1'
Message-ID: <ZC6h/b2N/u/d4XbT@krava>
References: <202304060622.P2hBPE4g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304060622.P2hBPE4g-lkp@intel.com>

On Thu, Apr 06, 2023 at 07:03:39AM +0800, kernel test robot wrote:
> Hi Jiri,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   99ddf2254febae9eab7fb0bcc02c5322243f5c49
> commit: fee356ede980b6c2c8db612e18b25738356d6744 selftests/bpf: Add bpf_testmod_fentry_* functions
> date:   5 months ago
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fee356ede980b6c2c8db612e18b25738356d6744
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout fee356ede980b6c2c8db612e18b25738356d6744
>         make O=/tmp/kselftest headers
>         make O=/tmp/kselftest -C tools/testing/selftests
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304060622.P2hBPE4g-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

sry I can't reproduce 

it looks like bpf_testmod is not compiled by default with -Wmissing-prototypes,
when I add it I can see those warnings, but it does not seem to be enabled by
default

jirka


> 
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:32:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_1' [-Wmissing-prototypes]
>       32 | bpf_testmod_test_struct_arg_1(struct bpf_testmod_struct_arg_2 a, int b, int c) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:38:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_2' [-Wmissing-prototypes]
>       38 | bpf_testmod_test_struct_arg_2(int a, struct bpf_testmod_struct_arg_2 b, int c) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:44:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_3' [-Wmissing-prototypes]
>       44 | bpf_testmod_test_struct_arg_3(int a, int b, struct bpf_testmod_struct_arg_2 c) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:50:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_4' [-Wmissing-prototypes]
>       50 | bpf_testmod_test_struct_arg_4(struct bpf_testmod_struct_arg_1 a, int b,
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:57:1: warning: no previous prototype for 'bpf_testmod_test_struct_arg_5' [-Wmissing-prototypes]
>       57 | bpf_testmod_test_struct_arg_5(void) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:63:1: warning: no previous prototype for 'bpf_testmod_test_mod_kfunc' [-Wmissing-prototypes]
>       63 | bpf_testmod_test_mod_kfunc(int i)
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:81:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_1' [-Wmissing-prototypes]
>       81 | bpf_testmod_test_btf_type_tag_user_1(struct bpf_testmod_btf_type_tag_1 __user *arg) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:89:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_user_2' [-Wmissing-prototypes]
>       89 | bpf_testmod_test_btf_type_tag_user_2(struct bpf_testmod_btf_type_tag_2 *arg) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:94:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_1' [-Wmissing-prototypes]
>       94 | bpf_testmod_test_btf_type_tag_percpu_1(struct bpf_testmod_btf_type_tag_1 __percpu *arg) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:99:1: warning: no previous prototype for 'bpf_testmod_test_btf_type_tag_percpu_2' [-Wmissing-prototypes]
>       99 | bpf_testmod_test_btf_type_tag_percpu_2(struct bpf_testmod_btf_type_tag_3 *arg) {
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:103:14: warning: no previous prototype for 'bpf_testmod_loop_test' [-Wmissing-prototypes]
>      103 | noinline int bpf_testmod_loop_test(int n)
>          |              ^~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:115:30: warning: no previous prototype for 'bpf_testmod_return_ptr' [-Wmissing-prototypes]
>      115 | __weak noinline struct file *bpf_testmod_return_ptr(int arg)
>          |                              ^~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:131:14: warning: no previous prototype for 'bpf_testmod_fentry_test1' [-Wmissing-prototypes]
>      131 | noinline int bpf_testmod_fentry_test1(int a)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:136:14: warning: no previous prototype for 'bpf_testmod_fentry_test2' [-Wmissing-prototypes]
>      136 | noinline int bpf_testmod_fentry_test2(int a, u64 b)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~
> >> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:141:14: warning: no previous prototype for 'bpf_testmod_fentry_test3' [-Wmissing-prototypes]
>      141 | noinline int bpf_testmod_fentry_test3(char a, int b, u64 c)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:149:1: warning: no previous prototype for 'bpf_testmod_test_read' [-Wmissing-prototypes]
>      149 | bpf_testmod_test_read(struct file *file, struct kobject *kobj,
>          | ^~~~~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:200:1: warning: no previous prototype for 'bpf_testmod_test_write' [-Wmissing-prototypes]
>      200 | bpf_testmod_test_write(struct file *file, struct kobject *kobj,
>          | ^~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/bpf_testmod_fentry_test1 +131 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> 
>    130	
>  > 131	noinline int bpf_testmod_fentry_test1(int a)
>    132	{
>    133		return a + 1;
>    134	}
>    135	
>  > 136	noinline int bpf_testmod_fentry_test2(int a, u64 b)
>    137	{
>    138		return a + b;
>    139	}
>    140	
>  > 141	noinline int bpf_testmod_fentry_test3(char a, int b, u64 c)
>    142	{
>    143		return a + b + c;
>    144	}
>    145	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
