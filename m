Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390C173
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729350436; cv=none; b=IfY5uwGrMEmPBPJlyQLTXxHlvE++0C25tI0f4t0ZfKvRQyyr9k1F4ck9rdCkWGP0q9GApVuGK50Am9IHUPtdQJpLdq69ys2q8ysC1MbX3D421v09JznVeC1BEiy3qGnO9q7BraV5xICLzva9N3pFgYthoeJ9Ev8GE87P3mSU/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729350436; c=relaxed/simple;
	bh=c2Vl6s1rd9MnxosrYhzNWhGzbafPXCQ71o7AnXpMg2M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJHeXfP4gMdZi+XyM9cFgXdbHz8C72a8Xxn9O8HP2DdF0EAKnRnY+o1B0NiOUa1Iove0BGhHVeetSOYzoIQU7+JKh8X5fiou/pu8ENGPMCVoUjD6EWs+oyg25djMFi/YiHcBDZLzfqUl5dWneMmfHK9RR8N2t69LtNSvqTgVrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BDBC4CEC5;
	Sat, 19 Oct 2024 15:07:15 +0000 (UTC)
Date: Sat, 19 Oct 2024 11:07:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:ring-buffer/for-next 2/4]
 kernel/trace/ring_buffer.c:1540 rb_check_pages() warn: inconsistent
 indenting
Message-ID: <20241019110743.72fa5f29@gandalf.local.home>
In-Reply-To: <202410192201.oCwXfxZf-lkp@intel.com>
References: <202410192201.oCwXfxZf-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Oct 2024 22:43:44 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/for-next
> head:   70c765743423ea51af71865aeb4530bcdf892300
> commit: 1f1c2bc9d0753afb466ad6f0c2cd9dc08ed637fa [2/4] ring-buffer: Limit time with disabled interrupts in rb_check_pages()
> config: i386-randconfig-141-20241019 (https://download.01.org/0day-ci/archive/20241019/202410192201.oCwXfxZf-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410192201.oCwXfxZf-lkp@intel.com/
> 
> smatch warnings:
> kernel/trace/ring_buffer.c:1540 rb_check_pages() warn: inconsistent indenting
> 
> vim +1540 kernel/trace/ring_buffer.c
> 
>   1493	
>   1494	/**
>   1495	 * rb_check_pages - integrity check of buffer pages
>   1496	 * @cpu_buffer: CPU buffer with pages to test
>   1497	 *
>   1498	 * As a safety measure we check to make sure the data pages have not
>   1499	 * been corrupted.
>   1500	 */
>   1501	static void rb_check_pages(struct ring_buffer_per_cpu *cpu_buffer)
>   1502	{
>   1503		struct list_head *head, *tmp;
>   1504		unsigned long buffer_cnt;
>   1505		unsigned long flags;
>   1506		int nr_loops = 0;
>   1507	
>   1508		/*
>   1509		 * Walk the linked list underpinning the ring buffer and validate all
>   1510		 * its next and prev links.
>   1511		 *
>   1512		 * The check acquires the reader_lock to avoid concurrent processing
>   1513		 * with code that could be modifying the list. However, the lock cannot
>   1514		 * be held for the entire duration of the walk, as this would make the
>   1515		 * time when interrupts are disabled non-deterministic, dependent on the
>   1516		 * ring buffer size. Therefore, the code releases and re-acquires the
>   1517		 * lock after checking each page. The ring_buffer_per_cpu.cnt variable
>   1518		 * is then used to detect if the list was modified while the lock was
>   1519		 * not held, in which case the check needs to be restarted.
>   1520		 *
>   1521		 * The code attempts to perform the check at most three times before
>   1522		 * giving up. This is acceptable because this is only a self-validation
>   1523		 * to detect problems early on. In practice, the list modification
>   1524		 * operations are fairly spaced, and so this check typically succeeds at
>   1525		 * most on the second try.
>   1526		 */
>   1527	again:
>   1528		if (++nr_loops > 3)
>   1529			return;
>   1530	
>   1531		raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
>   1532		head = rb_list_head(cpu_buffer->pages);
>   1533		if (!rb_check_links(cpu_buffer, head))
>   1534			goto out_locked;
>   1535		buffer_cnt = cpu_buffer->cnt;
>   1536		tmp = head;
>   1537		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
>   1538			return;

Bah, an extra "return" was added due to me rebasing the patch incorrectly.

I'll fix and will need to rebase my for-next branch.

-- Steve


>   1539	
> > 1540		while (true) {  
>   1541			raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
>   1542	
>   1543			if (buffer_cnt != cpu_buffer->cnt) {
>   1544				/* The list was updated, try again. */
>   1545				raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
>   1546				goto again;
>   1547			}
>   1548	
>   1549			tmp = rb_list_head(tmp->next);
>   1550			if (tmp == head)
>   1551				/* The iteration circled back, all is done. */
>   1552				goto out_locked;
>   1553	
>   1554			if (!rb_check_links(cpu_buffer, tmp))
>   1555				goto out_locked;
>   1556	
>   1557			raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
>   1558		}
>   1559	
>   1560	out_locked:
>   1561		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
>   1562	}
>   1563	
> 

