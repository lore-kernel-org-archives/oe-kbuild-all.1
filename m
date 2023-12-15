Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4824F3011D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LY4W8cRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80249C433C7;
	Fri, 15 Dec 2023 19:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702666999;
	bh=nuDRhjJy9zTCAhIsOlINGh8JJffPPk0v7X3D86F0oP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LY4W8cRaZV/UdvS4+o0zZ8w0ds/3xoaLHnfFWZUyKU4+XaH6dWJ7t6oE2OlN7+917
	 ozykOFECoiEm+qOh0iiuVuO9npab/dPmS11aauerQmXeYi+24O/9x1IgVauzWQLhIi
	 notznpqVXAfyuLdkvAXf+zWtRhhpe+Digea2AQx0=
Date: Fri, 15 Dec 2023 11:03:18 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 315/342] mm/slub.c:1038:17: error:
 implicit declaration of function '__memset'; did you mean 'memset'?
Message-Id: <20231215110318.547feca5775b9b15bd823c5d@linux-foundation.org>
In-Reply-To: <202312151925.c1R7UpLE-lkp@intel.com>
References: <202312151925.c1R7UpLE-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 Dec 2023 19:23:07 +0800 kernel test robot <lkp@intel.com> wrote:

> ree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   3271cacfede84a7e27d318fdf12fbeb7cab7b305
> commit: 082b07014f97afe25e73493a58f21b45c2742cd7 [315/342] kmsan: support SLAB_POISON
> config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20231215/202312151925.c1R7UpLE-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151925.c1R7UpLE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312151925.c1R7UpLE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/slub.c: In function 'init_object':
> >> mm/slub.c:1038:17: error: implicit declaration of function '__memset'; did you mean 'memset'? [-Werror=implicit-function-declaration]
>     1038 |                 __memset(p - s->red_left_pad, val, s->red_left_pad);
>          |                 ^~~~~~~~
>          |                 memset
>    cc1: some warnings being treated as errors

Not all architectures implement __memset().

I'll disable the series for now, thanks.
