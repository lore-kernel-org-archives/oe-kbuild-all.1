Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D715B5687
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3FAC433C8;
	Mon, 14 Aug 2023 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1692043584;
	bh=SGd6rsU1ozwuRdeiHp4tDvQ9xMbGTRBmmJ8q/wVsdAo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mcMmqRa+RINtwzONmzFj0Dcx001xuW2Krgceu2DWWtjCh1LQQgM1tbAAbuc8N4i7y
	 tuCI+F8VvLu7colFVBDalsjChlmtzYg1BIB5fvk6lo/LAe7mQoVbgbDgTaPeywIgzq
	 etMOZZCRU+gDWXfT9QceAdE2G48USZ79lSIq8JCg=
Date: Mon, 14 Aug 2023 13:06:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:41: error:
 implicit declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'?
Message-Id: <20230814130623.90cf2bc8c625087ea616dd3c@linux-foundation.org>
In-Reply-To: <202308131610.jF4ncWp6-lkp@intel.com>
References: <202308131610.jF4ncWp6-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Aug 2023 16:17:21 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
> head:   5fb2ea3111f4ecc6dc4891ce5b00f0217aae9a04
> commit: 4aaa60dad4d1c96151dec51098aed866bb6e867d [219/240] mm: allow per-VMA locks on file-backed VMAs
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230813/202308131610.jF4ncWp6-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131610.jF4ncWp6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308131610.jF4ncWp6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/build_bug.h:5,
>                     from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/smp.h:12,
>                     from include/linux/kernel_stat.h:5,
>                     from mm/memory.c:42:
>    mm/memory.c: In function 'lock_vma_under_rcu':
> >> mm/memory.c:5410:41: error: implicit declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'? [-Werror=implicit-function-declaration]
>     5410 |         if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
>          |                                         ^~~~~~~~~~
>    include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>          |                                             ^
>    cc1: some warnings being treated as errors
> 

This later gets accidentally fixed by Suren's "mm: handle userfaults
under VMA lock".

If Matthew can suggest a fix for this I can queue it close to "mm:
allow per-VMA locks on file-backed VMAs" to minimize the size of the
bisection hole?
