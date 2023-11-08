Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D803457F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T9r1cHVh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xVy3jOcCUEsWS3lcdjeRauft3ZCNR7HZkUr7kyjSAP8=; b=T9r1cHVhmkwSJe/lR6OxpQ2SUB
	IfT675Dy2Xxvj65v6JbPMK/yK7f7ISndCm9EiCLID9jBMnZ78s8Yu6F/WG2MAs0iSi7Dy//U1AHeL
	CDf0mba/MfGxGgHXm/6AV953CznuNYzDGVZfGPHL9nBME9PnQKKw5toLfCGtZATfNo0qi+JkK3nrL
	XYzqCw5PdaxITdQwEEHGYXsgWmsgy9CD/9RGrrrGaQxHztr0N4bBnrsukWAgoYlApz03MafK6dBby
	D1WWA2upQjxFXQmpr2mMP0Xk0HimqUaggbl5tnPUEEpUaEfzXeWDoGqjmfZGCUfhbscxnePWXe8Dm
	FCoNTzPA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r0eod-000BE6-1D; Wed, 08 Nov 2023 09:25:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 642E730049D; Wed,  8 Nov 2023 10:25:39 +0100 (CET)
Date: Wed, 8 Nov 2023 10:25:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 18/19] kernel/sched/fair.c:3696:25:
 error: implicit declaration of function 'min_deadline_cb_propagate'; did you
 mean 'min_vruntime_cb_propagate'?
Message-ID: <20231108092539.GJ3818@noisy.programming.kicks-ass.net>
References: <202311081629.NTRLxpiC-lkp@intel.com>
 <84b3e403-56a7-4378-8421-d0c4d6da6096@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84b3e403-56a7-4378-8421-d0c4d6da6096@bytedance.com>

On Wed, Nov 08, 2023 at 05:11:39PM +0800, Abel Wu wrote:
> On 11/8/23 5:02 PM, kernel test robot Wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> > head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
> > commit: c9647eb51bfc7ada985c2798ce87067c557e2a07 [18/19] sched/eevdf: Sort the rbtree by virtual deadline
> > config: um-defconfig (https://download.01.org/0day-ci/archive/20231108/202311081629.NTRLxpiC-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081629.NTRLxpiC-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202311081629.NTRLxpiC-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     kernel/sched/fair.c: In function 'reweight_entity':
> > > > kernel/sched/fair.c:3696:25: error: implicit declaration of function 'min_deadline_cb_propagate'; did you mean 'min_vruntime_cb_propagate'? [-Werror=implicit-function-declaration]
> >      3696 |                         min_deadline_cb_propagate(&se->run_node, NULL);
> >           |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >           |                         min_vruntime_cb_propagate
> >     cc1: some warnings being treated as errors
> 
> This is deleted in the previous patch, so please apply that one first.

Ah, error in my script. I put that other patch in sched/urgent and then
forgot to merge that in sched/core before these patches.

Will fix.
