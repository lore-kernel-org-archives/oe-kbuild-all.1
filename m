Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252332DF156;
	Tue, 13 Jan 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768333168; cv=none; b=myjoKyty8Dopi9KtQLN6Cn6MItGYkbII8tzyjs8Yrs2r7W9xnbr6hVMRJC1sYnQW2fU9jRspHpsr7DTer6rB38pExpq9U+sKFWbHv8ODiN3FyctqMFHBTb/vXEBOPT93vEi+dzFRt0hyh1VcQ3eHa6wc/qeXjUiDJRm0Y2xoF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768333168; c=relaxed/simple;
	bh=Md+tTAcL4MNreo3sgLPso3ZupOMsNLWpXXyYAJeUp4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+eeufqDGw6oPsmandsxFa5Wq31eEQ1LWjdsuMfvueHz5ocYGq9Eu9Yo4sY2oZUVnSTp/rcuUVlIJBSZsCio7TPN66CWqxcCjM2JVvJScflk9YGBxy9nYwtIPznddKbpdCroInJCg9z7kVcALA9ZH1xdMIvBQ/AXsxLL7Gtwdbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XiglkeLN; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XiglkeLN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eIf3mSs3dQmWXMxFRhOXa/OGUJruNGhIb42r2V5Ta2c=; b=XiglkeLNhBkHiCh4DXSmLrEDJ3
	J8fF6SfASIdRnRMclFidwlGfgRAYxohtottdTyp60YLNZNsrykT1r3n476UvW0TJzfIx2hZoJZI89
	q+Eu2mdpDxDv33BkDHmR91f6SxUGXBo4i3kys0iliGC7XdXR9BctykLN4DuYSowy9VXlDqp7Q2cL2
	bxeuiBbDHfOr/5rUb3QRKh9zJ8xKRSq6duBAOPLo8pGv/loWfPP7kmVifQJLPT7xBGeQL3DcCQHm9
	u7ndy25Ave1aQq/KVVIIF2CqMcUQMfKU8y5T1kHiT5f0ClR5ltyDrqqh8rg6JKDsdKbgZxugBpKns
	thvnegoQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkEb-00000003WQW-19Pz;
	Tue, 13 Jan 2026 19:39:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3313B300606; Tue, 13 Jan 2026 20:39:20 +0100 (CET)
Date: Tue, 13 Jan 2026 20:39:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260113193919.GA810197@noisy.programming.kicks-ass.net>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
 <20260113115946.L49jwJMx@linutronix.de>
 <20260113121040.GC831050@noisy.programming.kicks-ass.net>
 <20260113173708.HMfBY0wF@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113173708.HMfBY0wF@linutronix.de>

On Tue, Jan 13, 2026 at 06:37:08PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-01-13 13:10:40 [+0100], Peter Zijlstra wrote:
> > Its here and a few lines down with the same thing I think. The cast is
> > to get byte pointer math, instead of u32 sized pointer math. Both the
> > original uaddr and naddr have the __user thing on, but that intermediate
> > cast trips it up.
> > 
> > Does this work?
> 
> Yes. It removes the __user thing warning which leaves us with
> | kernel/futex/requeue.c:692:9: warning: context imbalance in 'futex_requeue' - different lock contexts for basic block
> | kernel/futex/requeue.c:841:25: warning: context imbalance in 'futex_wait_requeue_pi' - unexpected unlock
> | kernel/futex/pi.c:663:9: warning: context imbalance in 'wake_futex_pi' - unexpected unlock
> | kernel/futex/pi.c:791:9: warning: context imbalance in '__fixup_pi_state_owner' - unexpected unlock
> | kernel/futex/pi.c:1093:17: warning: context imbalance in 'futex_lock_pi' - unexpected unlock
> | kernel/futex/pi.c:1132:5: warning: context imbalance in 'futex_unlock_pi' - different lock contexts for basic block
> | kernel/futex/waitwake.c:275:41: warning: context imbalance in 'futex_wake_op' - different lock contexts for basic block
> | kernel/futex/waitwake.c:460:44: warning: context imbalance in 'futex_wait_multiple_setup' - unexpected unlock
> | kernel/futex/waitwake.c:660:28: warning: context imbalance in 'futex_wait_setup' - unexpected unlock
> | kernel/futex/core.c:979:9: warning: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit
> 

tip/locking/core removes all the sparse lock annotations in favour of
clang-22 tcsan.
