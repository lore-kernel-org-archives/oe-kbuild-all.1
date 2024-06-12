Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3240180A69
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718209232; cv=none; b=rYLL/xRccg8rodKfK3cgtAjpUJv7rO/eYeOvaDagDqEbMyXyp5qLLpv/KCaf4j52FTGAYl89LbtMtY5s5d/z+2cLK2J9HSrVxFZD6bmbk9jv3zXqaCYsvmpdpDUgAOC3VuV3aQ2m05X05I76SyZQlbzQDlkuHq37gewb26WNECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718209232; c=relaxed/simple;
	bh=eCpCcyXxF85MiWiKNsNveWWu4mx4wB3s4o1kNG0PEy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aVT+HOl5tH6QlDXscCdPAhQo6E7fJWHI0VFydFYY3oJ2H312bsmyQ/ChqPjfq3HXqXbiwA0oDH7OgyVDe7CZ+c1VU2p9m99NjWWvGesiWntpWfNX/5NRta1mmQkBfFZvMpy16r8QyRJ6EQZ7JHbYQTz0TylSpNJ1oEa4/RKGhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0A9C116B1;
	Wed, 12 Jun 2024 16:20:30 +0000 (UTC)
Date: Wed, 12 Jun 2024 12:20:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:ring-buffer/core 6/13] kernel/trace/ring_buffer.c:1704
 rb_range_meta_init() warn: unsigned 'cpu' is never less than zero.
Message-ID: <20240612122029.5de68891@rorschach.local.home>
In-Reply-To: <202406122331.NhG72Fh4-lkp@intel.com>
References: <202406122331.NhG72Fh4-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Jun 2024 23:56:32 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/core
> head:   640e052ba42d577a7f57052dbee714cf470dd145
> commit: 9018304b705f32d24fda1a88702ef22c9a436ef4 [6/13] ring-buffer: Add test if range of boot buffer is valid
> config: i386-randconfig-141-20240612 (https://download.01.org/0day-ci/archive/20240612/202406122331.NhG72Fh4-lkp@intel.com/config)
> compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406122331.NhG72Fh4-lkp@intel.com/
> 
> smatch warnings:
> kernel/trace/ring_buffer.c:1704 rb_range_meta_init() warn: unsigned 'cpu' is never less than zero.
> 
> vim +/cpu +1704 kernel/trace/ring_buffer.c
> 
>   1680	
>   1681	static void rb_range_meta_init(struct trace_buffer *buffer, int nr_pages)
>   1682	{
>   1683		struct ring_buffer_meta *meta;
>   1684		unsigned long delta;
>   1685		void *subbuf;
>   1686		int cpu;
>   1687		int i;
>   1688	
>   1689		for (cpu = 0; cpu < nr_cpu_ids; cpu++) {
>   1690			void *next_meta;
>   1691	
>   1692			meta = rb_range_meta(buffer, nr_pages, cpu);
>   1693	
>   1694			if (rb_meta_valid(meta, cpu, buffer, nr_pages)) {
>   1695				/* Make the mappings match the current address */
>   1696				subbuf = rb_subbufs_from_meta(meta);
>   1697				delta = (unsigned long)subbuf - meta->first_buffer;
>   1698				meta->first_buffer += delta;
>   1699				meta->head_buffer += delta;
>   1700				meta->commit_buffer += delta;
>   1701				continue;
>   1702			}
>   1703	
> > 1704			if (cpu < nr_cpu_ids - 1)  

So this warning only happens in the unique case we build for a UP machine?

I don't think this is worth it, as in most cases nr_cpu_ids is greater
than 1, and I'm not going to monkey up this code just because it gives
a warning when you build with nr_cpu_ids == 1. Because, yes in such
cases, this should turn into "if (0)".

Can you please remove this from reporting an error. Thanks,

-- Steve




>   1705				next_meta = rb_range_meta(buffer, nr_pages, cpu + 1);
>   1706			else
>   1707				next_meta = (void *)buffer->range_addr_end;
>   1708	
>   1709			memset(meta, 0, next_meta - (void *)meta);
>   1710	
>   1711			meta->nr_subbufs = nr_pages + 1;
>   1712			meta->subbuf_size = PAGE_SIZE;
>   1713	
>   1714			subbuf = rb_subbufs_from_meta(meta);
>   1715	
>   1716			meta->first_buffer = (unsigned long)subbuf;
>   1717	
>   1718			/*
>   1719			 * The buffers[] array holds the order of the sub-buffers
>   1720			 * that are after the meta data. The sub-buffers may
>   1721			 * be swapped out when read and inserted into a different
>   1722			 * location of the ring buffer. Although their addresses
>   1723			 * remain the same, the buffers[] array contains the
>   1724			 * index into the sub-buffers holding their actual order.
>   1725			 */
>   1726			for (i = 0; i < meta->nr_subbufs; i++) {
>   1727				meta->buffers[i] = i;
>   1728				rb_init_page(subbuf);
>   1729				subbuf += meta->subbuf_size;
>   1730			}
>   1731		}
>   1732	}
>   1733	
> 

