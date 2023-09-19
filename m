Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DC38814
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36585C433C8;
	Tue, 19 Sep 2023 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1695141721;
	bh=y+0HL2408rXuAWIiNdyb8f+aOlsE9EsNrIMlfo6YXzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UzU0qq8TexCNx6DUcl5GhDQFJiEvtJg65zNnPTVK7TdW5c9TUOOjtzB10OqyXP/hB
	 RTXlO4NF95ri9OvaEZ6e+g7Y82c9bl5KW28jKRIbWr/t3zkuDR4AlxXaawZ+rX26aw
	 qazlyDjAxdyyQ4nWS4IBFM27mBVwBc05jzUt1xs4=
Date: Tue, 19 Sep 2023 09:42:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Baoquan He <bhe@redhat.com>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [linux-next:master 5741/5912] kernel/crash_core.c:214:13:
 warning: argument 2 null where non-null expected
Message-Id: <20230919094200.0f6495393a8eef3dc398e8ac@linux-foundation.org>
In-Reply-To: <202309191144.B0MToaPG-lkp@intel.com>
References: <202309191144.B0MToaPG-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Sep 2023 12:02:17 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7fc7222d9680366edeecc219c21ca96310bdbc10
> commit: 5c322f6aad10f0920f842a4ccf82e9b9f351c0a5 [5741/5912] crash_core.c: remove unneeded functions
> config: s390-buildonly-randconfig-r006-20220512 (https://download.01.org/0day-ci/archive/20230919/202309191144.B0MToaPG-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191144.B0MToaPG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309191144.B0MToaPG-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/s390/include/asm/atomic.h:12,
>                     from include/linux/atomic.h:7,
>                     from include/linux/mm_types_task.h:13,
>                     from include/linux/mm_types.h:5,
>                     from include/linux/buildid.h:5,
>                     from kernel/crash_core.c:7:
>    kernel/crash_core.c: In function 'parse_crashkernel_suffix.constprop':
> >> kernel/crash_core.c:214:13: warning: argument 2 null where non-null expected [-Wnonnull]
>      214 |         if (strncmp(cur, suffix, strlen(suffix))) {
>    include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
>       68 |         (cond) ?                                        \
>          |          ^~~~
>    include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
>       55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>          |                            ^~~~~~~~~~~~~~

Looks legit?  parse_crashkernel() does

	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
				crash_base, NULL);

and that suffix==NULL gets passed through to the strncmp()?
