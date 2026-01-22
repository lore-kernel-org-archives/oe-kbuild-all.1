Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201653A0E9A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074131; cv=none; b=j1haZ2O7EIDS44FhQyrs67PmwMkBRUVAjn2HROngFirnEdEuOay3Dzk4T+Ox5oXY+4UMUiANCXYV1ElDMcrAP4QdN8PuLPK6xlLEsfMM0t0O8zcJLm5sYZ/euhPyL7aEMMJxX9ALIygJF1BfR5q4q3JA0ffcX5NykC5Xn54ZpMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074131; c=relaxed/simple;
	bh=e3J5I3JidBEe20xMq3LDqy2ycsvs3FRycSCidlMcqk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBlJkllOYqLKyfffgqHBx0sL0cEwHH8AAv8GzFGmqnndkMVfGceSAQ5Dq+q2DT50ofaXqkkN6uqXI/dKZWzw+QoxSvziRsHbdO+Idg6t572lOGGRNSPYNx6McPJDZgULNn7eXkg9Zveg2OpFMYC6VZV2T1nImfBcUm5MxlaFidg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HvWkcE2m; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HvWkcE2m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P8Rc5KHb05lQg9gsJPJwqDZF6vBRDcHLLd4eldmljDw=; b=HvWkcE2muZsnyI4x6dXLso7vEJ
	G9obR5mb4ocQpT3jzdSz1WnQfNjZYTHCjw0iBeCDWM/wiUbr9b/9lggEVgIwM0FdW7SxxUowbrsiG
	m3zXPgwlIPamXpWg7P+fS33J6K55L9CR0xSNidNhrio9XrNyEYUWTsgML0+FZ6Bq1DrWu6x/XLYBH
	a1rgehz/8i6iBQ5uXeVHLK4rd1jHA2O8zadFB1h8y0VOXd1Ni8P5VlUpRqEw4FbOnBAXW21OOxYvJ
	FUbzgZ3TJDKZ6T5KxPpwS8XGZRC1S+1+1mmmtIJmscv3QvtShLJuZswOyfLEfdLW3kvLUKWttdoFJ
	OzCuEOUQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqze-000000006qu-1NZY;
	Thu, 22 Jan 2026 09:28:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 411723007E1; Thu, 22 Jan 2026 10:28:45 +0100 (CET)
Date: Thu, 22 Jan 2026 10:28:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 26/31] slice_test.c:70:20: warning:
 overflow in expression; result is 705'032'704 with type 'long'
Message-ID: <20260122092845.GQ166857@noisy.programming.kicks-ass.net>
References: <202601220246.iRqmV1p7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601220246.iRqmV1p7-lkp@intel.com>

On Thu, Jan 22, 2026 at 02:41:11AM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> head:   81b74125144d2db6f40a345b875f085addbcd230
> commit: 50ec9f1ddac81e9b447b98db2da519728735aa79 [26/31] selftests/rseq: Implement time slice extension test
> config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601220246.iRqmV1p7-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220246.iRqmV1p7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601220246.iRqmV1p7-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> slice_test.c:70:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
>       70 |         .total_nsecs    =  5 * NSEC_PER_SEC,
>          |                            ~~^~~~~~~~~~~~~~
>    slice_test.c:78:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
>       78 |         .total_nsecs    =  5 * NSEC_PER_SEC,
>          |                            ~~^~~~~~~~~~~~~~
>    slice_test.c:86:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
>       86 |         .total_nsecs    =  5 * NSEC_PER_SEC,
>          |                            ~~^~~~~~~~~~~~~~
>    3 warnings generated.

Stupid thing.. I'll just slap some LL on or something.
