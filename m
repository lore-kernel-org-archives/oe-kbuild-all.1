Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244551F2380
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 07:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785567924; cv=none; b=Y5JF4MLE+Zq4qSPYyHd9kL2aa7SqdOqATxwREGENoZ5wKShQP79Sxb/rQJx+DX//1J9TxckdJd3KN7YMM4bqk/NQ/PgFOWSj07vYWEZdcSP+u27lcg82o4XHVnfMxNkj8V3hOUtO4CJYnn+4aF7zMmdWcVzC1zO2d48dh6OyM8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785567924; c=relaxed/simple;
	bh=am0riPfODqIMDM9hZdy3pArjS3vkrd3tLbS2fFJ40vk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P5dhNJWjm+Mss8Ybl2geedd2UCij0GVJnQEAzIfRtWs158/PdnPoeZaGOc3+5wHkEMWNtW7EsEiO2ZRIuCzgB9NoFUPUt040B1x8Kcx5zCAxvq2mz1H4TjR5CFnybTssyYMC9wZlKG84TFxv2+VwwU7kyBPvVNkRumTTSQTQKc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=D6f70+zf; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="D6f70+zf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=w3RkLM/0yGEu4E0MjM4IaQHj7fllD0s7FzKqdYdMCyA=;
  b=D6f70+zfnKH1qO5VALUoaJ/pXq3Bn+p1W7oBLiRSgZDwqsbRG/pjCgMD
   JxyEIVqCF7cLy0H3DClyFqLfIHeXmUeUw8p/r1fkp2x5OVJTLcBD2CS6l
   Eu48bALS2IN06wndd8R1OwpnmuqKDicp0FdZ0q0tSqi/a3yS4vCmW7boa
   Q=;
X-CSE-ConnectionGUID: bCUquvU1SleLuiF8DhBLzA==
X-CSE-MsgGUID: MP6jftIiQ2K5gfxdhkI3zg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="153416252"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 09:05:10 +0200
Date: Sat, 1 Aug 2026 09:05:10 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Steven Rostedt <rostedt@goodmis.org>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/ring_buffer.c:412:29-47: WARNING: casting value
 returned by memory allocation function to (struct buffer_page *) is
 useless.
In-Reply-To: <20260731202804.06a4056f@robin>
Message-ID: <8395acdb-9a3-cb8c-853-43f238ffc15@inria.fr>
References: <202608010824.vc7vATf0-lkp@intel.com> <20260731202804.06a4056f@robin>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 31 Jul 2026, Steven Rostedt wrote:

> On Sat, 01 Aug 2026 08:10:14 +0800
> kernel test robot <lkp@intel.com> wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
> > commit: b1e7a590a0133606d3efd41aee38cdeac630b52f ring-buffer: Add helper functions for allocations
> > date:   8 months ago
> > config: openrisc-randconfig-r062-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010824.vc7vATf0-lkp@intel.com/config)
> > compiler: or1k-linux-gcc (GCC) 9.5.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: b1e7a590a013 ("ring-buffer: Add helper functions for allocations")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202608010824.vc7vATf0-lkp@intel.com/
> >
> > cocci warnings: (new ones prefixed by >>)
> > >> kernel/trace/ring_buffer.c:412:29-47: WARNING: casting value returned by memory allocation function to (struct buffer_page *) is useless.
> > >> kernel/trace/ring_buffer.c:408:31-57: WARNING: casting value returned by memory allocation function to (struct ring_buffer_per_cpu *) is useless.
>
> No, whatever Coccinelle script that reported this is broken.
>
> The typecast is in a macro. The macro is adding the typecast to make
> sure that what it is being assigned to is of the proper type.
>
> Hence, it is very *useful*!

Thanks for the report.  I will remove the warning in the case of a macro
body.

Is there some reason why it is not an inline function?

julia

>
> -- Steve
>
>
> >
> > vim +412 kernel/trace/ring_buffer.c
> >
> >    403
> >    404	/*
> >    405	 * For best performance, allocate cpu buffer data cache line sized
> >    406	 * and per CPU.
> >    407	 */
> >  > 408	#define alloc_cpu_buffer(cpu) (struct ring_buffer_per_cpu *)		\
> >    409		kzalloc_node(ALIGN(sizeof(struct ring_buffer_per_cpu),		\
> >    410				   cache_line_size()), GFP_KERNEL, cpu_to_node(cpu));
> >    411
> >  > 412	#define alloc_cpu_page(cpu) (struct buffer_page *)			\
> >    413		kzalloc_node(ALIGN(sizeof(struct buffer_page),			\
> >    414				   cache_line_size()), GFP_KERNEL, cpu_to_node(cpu));
> >    415
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
>
