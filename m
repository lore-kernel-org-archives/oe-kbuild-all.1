Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FAF45BE9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 19:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L2/BwgV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554D7C433C8;
	Fri, 15 Dec 2023 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702667411;
	bh=gUddlMDUrOPi6452K2wJ0MataWUUcsAuOcXv+HdHn2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L2/BwgV8mtL55lTS6eQn/bV1FCuarH0TxoVXjzJEpBEJqfSUWYf+NGkvV6CcakJz9
	 5s0kKWMVD4dJRs1lXtbA5jrjhVv1xVidUcisBz8LG1mczdftR0JvVD2/GTjQLAcTXq
	 aF18cmTcZj/4Ccxkzt+eKBFRQU/lkCO9XmJEUcpc=
Date: Fri, 15 Dec 2023 11:10:10 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Stefan Roesch <shr@devkernel.io>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7414/8213] mm/ksm.c:344:13: warning:
 'set_advisor_defaults' defined but not used
Message-Id: <20231215111010.bbab9d6e80f43302d60c7e42@linux-foundation.org>
In-Reply-To: <202312151854.4k8dhWf6-lkp@intel.com>
References: <202312151854.4k8dhWf6-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 Dec 2023 18:36:51 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
> commit: 5898c0939406116f8ab33dc5a50d36f3b5d44863 [7414/8213] mm/ksm: add sysfs knobs for advisor
> config: openrisc-randconfig-r016-20230621 (https://download.01.org/0day-ci/archive/20231215/202312151854.4k8dhWf6-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151854.4k8dhWf6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312151854.4k8dhWf6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/ksm.c:344:13: warning: 'set_advisor_defaults' defined but not used [-Wunused-function]
>      344 | static void set_advisor_defaults(void)

Thanks.  It looks like there's a bunch of advisor code and storage
which can go away if CONFIG_SYSFS=n?
