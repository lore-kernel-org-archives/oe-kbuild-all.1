Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3019CCF5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 19:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382886; cv=none; b=BXiS74Gylkk/O6itLjQAQLf4M8MJSFCpkTaf8jQ2aQ8c6dumoCyoITNXp1RR9l8nIWsiajGnzJWe47jES5uGaqDLEpEKg/WLZYasILvj3aqnr1HKU5ch2WRYDzSgnoHVJrmJ2ty88iYWOeaukTFfOlGXiIM/Z3IkiHtr+JJS/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382886; c=relaxed/simple;
	bh=n5rwf0WQdBC6QwlSIg9/3sdZ162ExJ0C6WDKkPAkRfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDq0w8ycGp6dbUb7xFnhbiErHsOQux8c7rHxwl194SNXlDq3XIHrBRcMOqpeWESodAZo4UGoQWZgaKrkM9xk6HMuvNnF/cPhCP/seHZVQCs4ZcY/jGie5EiMRGp0Ni0HIyXG4myxAibwAbKTRbctW2ygpXdRGwPYreDJcUuQY1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=plcQFish; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="plcQFish"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=igE6g6u2NZD/HmmqlAKvt99GSVG3bL4BP1cMLQsOyQs=; b=plcQFishrn5RGYCCvgGv7bZsPB
	iu5Kpk9YnPuqqB+7rD9KNM7LCtfj9v+Ad14Ks4G91szdciE6ocBsiBtMR6tRbUSMmLXXTn7ahzVEf
	zRvMtixezI4Xfzt+mHrhK1R6IDVkQ70It6SvtOqlXktyHYHWrrBUvshYzU2QbGWDaAEvP2NPFOhdP
	eSEb53cBidvahLM89/dvkEr48WssmG2DJ2AZ0/Vo0kQjVy+AVJ2NcnE0MgOtoA8gJL1fSn+l4J3Bz
	8j0F3ajyUy76F2wSLrI3rlrSc4neDoINy51pA9KShg4BIAo5onPX4G+dm7bupKWQGrNCqTBJN/y7d
	EjV7+n3Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8O08-00000004a6Z-2X5j;
	Mon, 13 Oct 2025 19:14:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E8F44300212; Mon, 13 Oct 2025 21:14:31 +0200 (CEST)
Date: Mon, 13 Oct 2025 21:14:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Oleg Nesterov <oleg@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 5/6] include/linux/seqlock.h:1243:
 undefined reference to `__scoped_seqlock_bug'
Message-ID: <20251013191431.GB2734756@noisy.programming.kicks-ass.net>
References: <202510140115.NW5RohLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510140115.NW5RohLv-lkp@intel.com>

On Tue, Oct 14, 2025 at 01:56:20AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> head:   bc46a565798322686d367c09b790a43a5b6fd847
> commit: 5259948079562bd66aecfbc7f799bca42899bae2 [5/6] seqlock: Change do_task_stat() to use scoped_seqlock_read()
> config: nios2-randconfig-001-20251013 (https://download.01.org/0day-ci/archive/20251014/202510140115.NW5RohLv-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140115.NW5RohLv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510140115.NW5RohLv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    nios2-linux-ld: fs/proc/array.o: in function `do_task_stat':
> >> include/linux/seqlock.h:1243: undefined reference to `__scoped_seqlock_bug'
> >> include/linux/seqlock.h:1243:(.text+0x704): relocation truncated to fit: R_NIOS2_CALL26 against `__scoped_seqlock_bug'

This shows a failure to optimize. I've not managed to reproduce on
x86_64 with gcc-8.4.

Lets see what else pops on this branch.
