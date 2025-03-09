Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE04690
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 04:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741493545; cv=none; b=JMGH9jbScyx+Vc0yu9N5nQ3b81RLId7Z7iik2ZMEP/jZoLrb+AYWaJl6j6bVsLa0Q5nwOLYGz8N4qygS7g4LLIbQAvX9NiSe7L9gUBlo5KrByQmLKk1/zPFNm3m17YUOWq5KC7x7bT4/AZBiDsGzbMXwn2aiwtt2xdaUT0H+/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741493545; c=relaxed/simple;
	bh=HmPHWvgmQ4b/6G06nA39wWxm/hFo6anedjn2X/FgW4g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CJCvwzmIpCAi7+torvR1qddjJoEaokLRGpvfghnZFWhIJ1y1caFWtPMPTrRcRbb71bv/bO6sHQPe/wnqNgYtE9kj+RYjEqBhjPUfXAmL6YCQucP5z9QVjyzCBp4vWQAl/8VpmpubUz99P7b5LVzNDYFd3h8Np9LEScnRJ7Qmh48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bhrHLNpV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bhrHLNpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6854DC4CED1;
	Sun,  9 Mar 2025 04:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741493544;
	bh=HmPHWvgmQ4b/6G06nA39wWxm/hFo6anedjn2X/FgW4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bhrHLNpVUTX/aD/xEp5/b3/dAfBdY/Xcv0O7ldZ5Fnqui9JO/TZeKat0Yr0dcYeBJ
	 tNuE4Hjx+QygwPdUL/nRQ1DBo4FcgTgzdiP1YkB1a0pTjQ9AKaU9lWjjBtTNprAd6A
	 33/GSuS6Iln3ekOPpFtZyBJBtngM+w1Pm5eIVhYc=
Date: Sat, 8 Mar 2025 20:12:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Zi Yan <ziy@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>
Subject: Re: [akpm-mm:mm-unstable 481/507] lib/xarray.c:1251:14: error:
 redefinition of 'xas_try_split_min_order'
Message-Id: <20250308201223.3462273207d0086da22e2044@linux-foundation.org>
In-Reply-To: <07CB0079-5D7C-4438-A9EE-03A72904CD12@nvidia.com>
References: <202503091121.RktXlKnp-lkp@intel.com>
	<07CB0079-5D7C-4438-A9EE-03A72904CD12@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 08 Mar 2025 23:00:31 -0500 Zi Yan <ziy@nvidia.com> wrote:

> On 8 Mar 2025, at 22:52, kernel test robot wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   2f0c87542d97822659e81f55ae5e5cc1994f3339
> > commit: 835714732ae42a4b4f590316b06d06826bff2483 [481/507] mm/filemap: use xas_try_split() in __filemap_add_folio()
> > config: i386-buildonly-randconfig-003-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091121.RktXlKnp-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091121.RktXlKnp-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202503091121.RktXlKnp-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> lib/xarray.c:1251:14: error: redefinition of 'xas_try_split_min_order'
> >     1251 | unsigned int xas_try_split_min_order(unsigned int order)
> >          |              ^~~~~~~~~~~~~~~~~~~~~~~
> >    In file included from lib/xarray.c:13:
> >    include/linux/xarray.h:1587:28: note: previous definition of 'xas_try_split_min_order' with type 'unsigned int(unsigned int)'
> >     1587 | static inline unsigned int xas_try_split_min_order(unsigned int order)
> >          |                            ^~~~~~~~~~~~~~~~~~~~~~~
> >
> 
> It seems that something went wrong when the patch is applied.
> xas_try_split_min_order() is not included in the CONFIG_XARRAY_MULTI guard,
> whereas the original patch does. Moving it back fixed the issue.
> See: https://lore.kernel.org/linux-mm/20250308213400.10220-1-sj@kernel.org/

This series took a lot of damage as "Buddy allocator like (or
non-uniform) folio split" was added, dropped, added, dropped...

I have just dropped the series "Minimize xa_node allocation during
xarry split".  Please leave it a few days then resend against
mm-unstable.
