Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BD153BED
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 22:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749335446; cv=none; b=RIDfwCcSpX3VSNlj+ZrLezKzcyXLYuGTIEhv7fwA/fi8OqQ5WPcaWGGPZlITckVA63mmpDwCVuQ5LGp7ZuMJaUy0dOzt6HHKkNJShbrEHkueAQkaxaL839Infsgi9GLRaAfIem95nqe99H5uaBLui3FF9ZkuAOk5WUHlFeogk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749335446; c=relaxed/simple;
	bh=qcloExUfsY7aY8d5UHyxw1OU1O8AuVB0ZXCQRZyssQE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PdPybm9PzZouhSr0g9a5VaUi9b42d4dWHgvyHpIpWD1jTryvjIndrVK37mTbWdrO4PHcLvMmvV9honOfn1H00yb2SXegMa0Ir/dCU+wjZttJS/tM3rQFRpfalsUkYqRp0CZM4RZ2VjlPAsYZigvElKE6fwG4XQw7zran9TdFb9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EUf/s7bN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EUf/s7bN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1917AC4CEE4;
	Sat,  7 Jun 2025 22:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749335445;
	bh=qcloExUfsY7aY8d5UHyxw1OU1O8AuVB0ZXCQRZyssQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EUf/s7bN1tgf8SfUZhdpQST6yBiYjIi1298ew3t0gh69xXK/nBsQbzDQ9z5IiSV3x
	 R35icygV7p1MY37ezpLgm+T0hJbgca1NDd5BF8ar/1s7/NTnGNTqeHHPYTJ+/Y2M0m
	 KpVza48mdN3dG5/Q+rsISkM0lVvbZgjaWuRj80nw=
Date: Sat, 7 Jun 2025 15:30:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Oscar Salvador <osalvador@suse.de>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Harry
 Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [akpm-mm:mm-new 61/87] drivers/cxl/core/region.c:2437:22:
 error: invalid use of undefined type 'struct node_notify'
Message-Id: <20250607153044.679f7bf380bf1d0d1a373c38@linux-foundation.org>
In-Reply-To: <20250606192345.3440658-1-joshua.hahnjy@gmail.com>
References: <202506070030.otNokpsc-lkp@intel.com>
	<20250606192345.3440658-1-joshua.hahnjy@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  6 Jun 2025 12:23:45 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> On Sat, 7 Jun 2025 00:19:17 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Oscar,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > head:   b9f05ab60cb240a64e898221de50a037553840c7
> > commit: 7bd79eaa2076cde601d828532a09ea50e20a976f [61/87] drivers,cxl: use node-notifier instead of memory-notifier
> > config: loongarch-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070030.otNokpsc-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 15.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070030.otNokpsc-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506070030.otNokpsc-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    drivers/cxl/core/region.c: In function 'cxl_region_perf_attrs_callback':
> > >> drivers/cxl/core/region.c:2437:22: error: invalid use of undefined type 'struct node_notify'
> >     2437 |         int nid = mnb->nid;
> >          |                      ^~
> >    drivers/cxl/core/region.c:2440:46: error: 'NODE_ADDED_FIRST_MEMORY' undeclared (first use in this function)
> >     2440 |         if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)
> >          |                                              ^~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/cxl/core/region.c:2440:46: note: each undeclared identifier is reported only once for each function it appears in
> >    drivers/cxl/core/region.c: In function 'shutdown_notifiers':
> >    drivers/cxl/core/region.c:3487:9: error: implicit declaration of function 'unregister_node_notifier'; did you mean 'unregister_module_notifier'? [-Wimplicit-function-declaration]
> >     3487 |         unregister_node_notifier(&cxlr->node_notifier);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~
> >          |         unregister_module_notifier
> >    drivers/cxl/core/region.c: In function 'cxl_region_probe':
> >    drivers/cxl/core/region.c:3528:9: error: implicit declaration of function 'register_node_notifier'; did you mean 'register_module_notifier'? [-Wimplicit-function-declaration]
> >     3528 |         register_node_notifier(&cxlr->node_notifier);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~
> >          |         register_module_notifier
> 
> >From what I can see, it seems like struct node_notify is conditionally
> defined under #ifdef CONFIG_MEMORY_HOTPLUG, but the callsite unconditionally
> declares struct node_notify *mnb = arg.

Yup.  Also,

-	struct memory_notify *mnb = arg;
+	struct node_notify *mnb = arg;

`mnb' is no longer an appropriate identifier!  Maybe nnb?
