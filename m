Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D135A84F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ztmJ/W+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FDCC433C8;
	Mon, 18 Dec 2023 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702918150;
	bh=Fuf7OksDzlVrjdvFGEB5ysqrci7ErK2u+RpIK5FwzyI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ztmJ/W+zekxrYCFbr7AUApunsT9nO2u/H6SvOaDwtw27qrxDjf35RM1jDsP5Oryhs
	 HjoancJCl5xUzd72Gzj2UXutIvJqDVDZ8hD9VV+ExgIEQpfVapG4jJjYuCIaw2wlnM
	 pPJnAT9gz5zrEA4TVYImvyNIpGaUi7iTKRplvjWo=
Date: Mon, 18 Dec 2023 08:49:09 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8322/9113] mm/zswap.c:644:9: error: too few
 arguments to function 'mem_cgroup_flush_stats'
Message-Id: <20231218084909.f39cb461825acde8a221b3cb@linux-foundation.org>
In-Reply-To: <202312182206.dlCV0jBv-lkp@intel.com>
References: <202312182206.dlCV0jBv-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Dec 2023 22:45:00 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
> commit: 3e66d585be0b60d7cbf5cdb391dfeb5452040b5a [8322/9113] mm: memcg: restore subtree stats flushing
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231218/202312182206.dlCV0jBv-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312182206.dlCV0jBv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312182206.dlCV0jBv-lkp@intel.com/
> 
> Note: the linux-next/master HEAD ceb2fe0d438644e1de06b9a6468a1fb8e2199c70 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    mm/zswap.c: In function 'zswap_shrinker_count':
> >> mm/zswap.c:644:9: error: too few arguments to function 'mem_cgroup_flush_stats'
>      644 |         mem_cgroup_flush_stats();
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/swap.h:9,
>                     from mm/zswap.c:24:
>    include/linux/memcontrol.h:1054:6: note: declared here
>     1054 | void mem_cgroup_flush_stats(struct mem_cgroup *memcg);
>          |      ^~~~~~~~~~~~~~~~~~~~~~
> 

This was fixed in the next patch,
"mm-memcg-restore-subtree-stats-flushing-fix".

