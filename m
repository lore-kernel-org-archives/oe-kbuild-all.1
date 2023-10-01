Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5B51946A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 19:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E55C433C8;
	Sun,  1 Oct 2023 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1696189627;
	bh=ASL2HVYpCGArKlOcF0BcvJYG44kko42fZtUPyQkG76A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Qb6caNfzzUtT+oUaeGK3lpnDZRPzZ6oHlZDk2eVhvP3kI7OergoEjMtLQWBxecao1
	 2v2BINy9/eaqJYQRyXLOheWyw1vw4Q/MuYRahFEbFylooCXUprAAwxGkIwwskMlX2T
	 RV5pHoWvlUo2L9PsClzkhvEFLmjCxDDFaqt1YqgI=
Date: Sun, 1 Oct 2023 12:47:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [linux-next:master 8148/8790] fs/proc/task_mmu.c:2105:17:
 error: implicit declaration of function 'pagemap_scan_backout_range'; did
 you mean 'pagemap_scan_push_range'?
Message-Id: <20231001124706.85ae33038ed93000ec8a8871@linux-foundation.org>
In-Reply-To: <202310011545.iHTT4Y7S-lkp@intel.com>
References: <202310011545.iHTT4Y7S-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 1 Oct 2023 15:50:38 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
> commit: 588d06cd90cfb015926def2469ab99f3c72a205d [8148/8790] fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-2
> config: x86_64-randconfig-005-20231001 (https://download.01.org/0day-ci/archive/20231001/202310011545.iHTT4Y7S-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011545.iHTT4Y7S-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310011545.iHTT4Y7S-lkp@intel.com/
> 
> Note: the linux-next/master HEAD df964ce9ef9fea10cf131bf6bad8658fde7956f6 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    fs/proc/task_mmu.c: In function 'pagemap_scan_thp_entry':
> >> fs/proc/task_mmu.c:2105:17: error: implicit declaration of function 'pagemap_scan_backout_range'; did you mean 'pagemap_scan_push_range'? [-Werror=implicit-function-declaration]
>     2105 |                 pagemap_scan_backout_range(p, start, end);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                 pagemap_scan_push_range

Thanks.  Seems this was fixed in a later fix.

                fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes.patch
                fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix.patch
                fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-fix.patch
you are here -> fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-2.patch
                fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-3.patch
                fs-proc-task_mmu-implement-ioctl-to-get-and-optionally-clear-info-about-ptes-fix-3-fix.patch

