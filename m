Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743EC944
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 21:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AD7C433D2;
	Tue, 18 Apr 2023 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1681851924;
	bh=h9gzm3Iu+4gVK6lfsOc7zgyrd9VEqA3nkuNosN8Sr6o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UblHObk9LfeHgYGVatepqsKKGV0dfxBADp+8zqML/bRvFsTvYtN0YV6AVc5rbs31u
	 XQfMjxv2C2zcBJRJd1nYP8LvYXj7F0jpvU5ugg/ccUBI+W097JL+7aAeY9+/+1zjUv
	 n7KEB66TOjLMjH5fFXUYpuF6gqwWJEhBsKh+JOY8=
Date: Tue, 18 Apr 2023 14:05:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 12115/12616] mm/page_alloc.c:6244:9: error:
 too many arguments to function 'cpu_vm_stats_fold'
Message-Id: <20230418140523.1f4f34f1e30c4ce938a462e9@linux-foundation.org>
In-Reply-To: <202304190402.keC5huSY-lkp@intel.com>
References: <202304190402.keC5huSY-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Apr 2023 04:55:24 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4aa1da8d99724f6c0b762b58a71cee7c5e2e109b
> commit: 938b4fea29fd04e2e7dc7fbb15bacedeafaa765d [12115/12616] vmstat: add pcp remote node draining via cpu_vm_stats_fold
> config: i386-randconfig-a016-20211118 (https://download.01.org/0day-ci/archive/20230419/202304190402.keC5huSY-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=938b4fea29fd04e2e7dc7fbb15bacedeafaa765d
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 938b4fea29fd04e2e7dc7fbb15bacedeafaa765d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304190402.keC5huSY-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 4aa1da8d99724f6c0b762b58a71cee7c5e2e109b builds fine.
>       It may have been fixed somewhere.

Indeed, it's fixed in the very next patch,
"vmstat-add-pcp-remote-node-draining-via-cpu_vm_stats_fold-fix".
