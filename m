Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47657366057
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 05:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147312; cv=none; b=pGoT0uG9qloFTs0+Yd7zCzetLvK/alpcANBppWvUV1qNR19S0feUS9GJ3nYxdIp0Nps46GxK0dJfSj0Ogh60rrB249bMcZymCg1HUbD8XqLMPs4IOyMXMlt8GQX/gfzzeRRIkW41WQf4Wu/DHNbWuNHsY6TvtyHT9BIYsFGvS2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147312; c=relaxed/simple;
	bh=9BqPdiUaBinXj8KihWhBSNqDvkFF7IZ4/tdTM4VyUn8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KbS8RZDYu4EcAzdghNzAdMxGSqNi2yKZz3UiIrog68y7pDLZ3yxxoG5EHzYqV0C+VRNihDdpHDER82yQ4Nmk5WBJroh6l9Ko2XhODn4NIAMgbmpBr/qZUaoXaKFhRZ2YSBecquW5Xf4stIEEWE8UcTAls+nrz2hDe0TkVVurnBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lKt6TnaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lKt6TnaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7FEC4CEF1;
	Fri, 23 Jan 2026 05:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769147311;
	bh=9BqPdiUaBinXj8KihWhBSNqDvkFF7IZ4/tdTM4VyUn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lKt6TnaSyGwqxWF/xjp3KOhijH2o9Y+6/8tF9qzkJs10CGqnh3Qv8Qa9GPsYEUfHM
	 ZVU0D3Gv0Epd3yoyC9MnLOKwVkSzVdcvZcARvgSK5Gy98qzg7udaRUytd3IJ0m6p+H
	 ELCpCNBF76DpwoH7OR6zWXbznYpHUNgy6PX/RVTE=
Date: Thu, 22 Jan 2026 21:48:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, <oe-kbuild-all@lists.linux.dev>,
 "David Hildenbrand" <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 420/429] fs/romfs/mmap-nommu.c:66:42: sparse:
 sparse: dereference of noderef expression
Message-Id: <20260122214830.50c0bfbf2142a61d370be2e1@linux-foundation.org>
In-Reply-To: <aXL27/BZ/xIwNfT3@rli9-mobl>
References: <202601221505.RxftadLx-lkp@intel.com>
	<20260122132335.5f3160dd20dfdb68c57ede35@linux-foundation.org>
	<aXL27/BZ/xIwNfT3@rli9-mobl>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Jan 2026 12:19:59 +0800 Philip Li <philip.li@intel.com> wrote:

> On Thu, Jan 22, 2026 at 01:23:35PM -0800, Andrew Morton wrote:
> > On Thu, 22 Jan 2026 16:04:37 +0800 kernel test robot <lkp@intel.com> wrote:
> > 
> > > Hi Lorenzo,
> > > 
> > > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > > head:   dc4fe40a11269aead253fa0beb098b00417b8694
> > > commit: 57a654376d4bb67119d436edc8c3c4c0ecb3c369 [420/429] mm: update all remaining mmap_prepare users to use vma_flags_t
> > > config: sh-randconfig-r122-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/config)
> > 
> > Has CONFIG_NOMMU=y
> > 
> > > compiler: sh4-linux-gcc (GCC) 13.4.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221505.RxftadLx-lkp@intel.com/
> > > 
> > > sparse warnings: (new ones prefixed by >>)
> > > >> fs/romfs/mmap-nommu.c:66:42: sparse: sparse: dereference of noderef expression
> > 
> > fs/romfs/Makefile has
> > 
> > ifneq ($(CONFIG_MMU),y)
> > romfs-$(CONFIG_ROMFS_ON_MTD) += mmap-nommu.o
> > endif
> > 
> > so why is mmap-nommu.o being compiled in this testing??
> 
> Hi Andrew, the related configs are set as below, and this is guarded
> with CONFIG_MMU, thus the build is triggered for mmap-nommu.o.
> 
> # CONFIG_MMU is not set
> CONFIG_NOMMU=y

Oh, OK, thanks, sorry, my brain ran out of multiple negation capacity.

The code which this report quoted had

 > 66		return is_nommu_shared_vma_flags(desc->vma_flags) ? 0 : -ENOSYS;

whereas Lorenzo's v2 patchset has

        return is_nommu_shared_vma_flags(&desc->vma_flags) ? 0 : -ENOSYS;

so I expect that the new `&' fixed this issue.
