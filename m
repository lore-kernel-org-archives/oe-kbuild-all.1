Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA8F8472
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729350866; cv=none; b=OcueJSa57zw0Zjb0ncMloHdBHnDCx96NI15GCDfXOXMHL45ZcWjTEGLjT1YygAsfxxPsddIYXxs6UqYsC15S63PFPXH3gMVvDuMEj6iAltXshalHdg0VgIWU75qjwTIvlzolk0WdSoEepX4+HzUJDhCOka34H2WFPOW48Xr+u6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729350866; c=relaxed/simple;
	bh=iD0ol5yBQlINx7lMk7sw6lDTPkPHYaCGGeEnfBybGWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YBEQGcL1xAIdFK3Y+DNaUPJDyBUlmzMLtlA72XgnwvsPzpeLN3hPoaQNYqITm+3OzKfwTi3DemRj8HViHtKNrQ0Xg5++ebiPBrtI4RAaHwcfCgVH6bSO7vLqO4cbbXMNmzCLk38q34+bp34JGiTLz8U75xIJpbPqJ5/EOrmyTFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8030C4CEC5;
	Sat, 19 Oct 2024 15:14:25 +0000 (UTC)
Date: Sat, 19 Oct 2024 11:14:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:ring-buffer/for-next 2/4]
 kernel/trace/ring_buffer.c:1540 rb_check_pages() warn: inconsistent
 indenting
Message-ID: <20241019111453.4a31d660@gandalf.local.home>
In-Reply-To: <20241019110743.72fa5f29@gandalf.local.home>
References: <202410192201.oCwXfxZf-lkp@intel.com>
	<20241019110743.72fa5f29@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Oct 2024 11:07:43 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> >   1527	again:
> >   1528		if (++nr_loops > 3)
> >   1529			return;
> >   1530	
> >   1531		raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
> >   1532		head = rb_list_head(cpu_buffer->pages);
> >   1533		if (!rb_check_links(cpu_buffer, head))
> >   1534			goto out_locked;
> >   1535		buffer_cnt = cpu_buffer->cnt;
> >   1536		tmp = head;
> >   1537		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
> >   1538			return;  
> 
> Bah, an extra "return" was added due to me rebasing the patch incorrectly.

And Petr even sent the proper patch, but in the between time, I was testing
my own rebase that had this bug. Somehow I picked my own rebase to push to
for-next and not the branch where I pulled in Petr's patches.

-- Steve
