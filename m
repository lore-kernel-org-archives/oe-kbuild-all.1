Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A88535DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738438053; cv=none; b=YPx4abGmeC5Jzz3sha9LkAFkYIfoaXyqk1hceYrghrl19TisU6p5QbytZYc5zd5CmQHIZdo5zH/hPW3YumJdrGjlq+cqT5LdMgEyl0tgu8QFSok860/im80FxcycH+BiZmrsIK3J7Bq9ln9SJHsf2mc1IRXKPLI7UcdWIE1JZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738438053; c=relaxed/simple;
	bh=eymA08TVmttHtuMxWqShj7bR9WF0e0M7QHesKiCh9NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tU2DHDo7GlpwWCTytF5xFTGf5yC41u6A0zn5EBNhKxPEXdjUChGApru7pTrByf7vNQNk+hOb81QrvuX2S/4ZkccmSEcQHi9LBKDUxdp1sWySDafl5tGsCUfioRwf34qqKheKKB9lnnHseOtRcd2JUJ68806/ZC+9ihcufmcAIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f8ouIYPb; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f8ouIYPb"
Date: Sat, 1 Feb 2025 14:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738438033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSHuoeSCWYWDMrU9YLhoP5a3ZUn6qwlD8/eMeyymnrA=;
	b=f8ouIYPbx1ko+gcS5f3MrsvzbpceA3Ve1jIv6bcFGFZB7Ku4cN3F0SqbW8AHkgjYmB5fag
	v8yOjqUszJ3SZKIpkmpqYMT3slg8OVnJzF9Asn9mhBVw7MpRj27cRtygY813ltMR8fHvFC
	RDoosUOBG7mJVfuc4tOkne/YttqvO4w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Kees Cook <keescook@chromium.org>
Subject: Re: drivers/auxdisplay/panel.c:1454:2: error: call to
 __compiletime_assert_309 declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
Message-ID: <qbmazoiryyqygjk2x6bc7puqvmik7gyitzo3xnryzsodnrrjek@tahia33lvpli>
References: <202501310832.kiAeOt2z-lkp@intel.com>
 <CAJuCfpGrtTK=reeVPrS+GQngs=WS-cZvy_YU9-JGyRgVFdofAw@mail.gmail.com>
 <CAJuCfpF56btBuHKn6j2SzY8KRUbjQ_oHCYtj5oqP88HBBBQ_3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpF56btBuHKn6j2SzY8KRUbjQ_oHCYtj5oqP88HBBBQ_3A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jan 31, 2025 at 02:51:26PM -0800, Suren Baghdasaryan wrote:
> On Fri, Jan 31, 2025 at 8:55 AM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Thu, Jan 30, 2025 at 4:06 PM kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
> > > commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
> > > date:   5 days ago
> > > config: hexagon-randconfig-r133-20250131 (https://download.01.org/0day-ci/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/config)
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce: (https://download.01.org/0day-ci/archive/20250131/202501310832.kiAeOt2z-lkp@intel.com/reproduce)
> >
> > Just saw this report (was on vacation). Will try to figure out what's going on.
> 
> I confirmed that my change at
> https://lore.kernel.org/all/20241226211639.1357704-1-surenb@google.com
> indeed causes this.
> Looks like due to the additional mem_alloc_profiling_enabled() check,
> the compiler considers allocation size as unknown at compile time
> (__builtin_object_size(obj) returns -1) even though both branches of
> that condition make the same exact allocation.
> I tried changing it to:
> 
> #define alloc_hooks_tag(_tag, _do_alloc) \
> ({ \
>         typeof(_do_alloc) _res; \
>         struct alloc_tag * __maybe_unused _old; \
>          if (mem_alloc_profiling_enabled()) \
>                 _old = alloc_tag_save(_tag); \
>         _res = _do_alloc; \
>          if (mem_alloc_profiling_enabled()) \
>                  alloc_tag_restore(_tag, _old); \
>         _res; \
> })
> 
> and that fixes the problem, however this would require two static key
> checks... I wonder if there is a way to tell the compiler that both
> branches cause the same result. Let me dig around.

strtomem_pad() looks pretty suspect to me.

I'm not seeing any reason for it to be using __builtin_object_size(),
(and __builtin_object_size() failing looks like perhaps a bizarre
compiler bug?).

It looks to me like ARRAY_SIZE() would be better here, and also there
really should be some actual typechecking on the source and dest
arguments - like strcpy(), they should be char *.
