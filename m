Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4158010FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Oct 2022 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pxqSMTRY4w+HddVujax8HRNtRoruwKPH7GEyjoWBt2Y=; b=E3ZRc0S1dAhiCdo7aO/couRybp
	2QMU30qbrpEESSelXuEK3qVt2m4yvlaeGDvOKnUpfec6gOW4FUxeIro0kML9mR6/ikJU35eN1RLsn
	x3Vk9Z25CHbR458x8JwatDf+33N5Bg6vaxoggsghTbOh259V9puFB1SIJTlsdimshS+P3UqSanR6k
	LNSPQBua2R5NI1L4xevI/Fb1PH8QeHDfC/G5oigH06q6fTuQI3gxhD6gkGxpub9095Oz8VOm/BKeU
	W/CwbsiHUASmp1kf1D0kLOE49NXkrKcACZrM72l2+Z/28u147Xc/aDGZlmqg/rjh6kWL553MDJdRL
	TUxZ9I6Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncpD-00GuNK-Bg; Wed, 26 Oct 2022 09:35:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D3CBC3000DD;
	Wed, 26 Oct 2022 11:35:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id AB7EF203C30D3; Wed, 26 Oct 2022 11:35:45 +0200 (CEST)
Date: Wed, 26 Oct 2022 11:35:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core] BUILD SUCCESS
 7005e3c43be6b6297440e85cb7d8c12a94540b49
Message-ID: <Y1j/casy3VGtu3yJ@hirez.programming.kicks-ass.net>
References: <6358f03b.p+cE2UomHFwpKwmv%lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6358f03b.p+cE2UomHFwpKwmv%lkp@intel.com>

On Wed, Oct 26, 2022 at 04:30:51PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> branch HEAD: 7005e3c43be6b6297440e85cb7d8c12a94540b49  psi: Fix possible missing or delayed pending event
> 

Robot guys; this is wrong...

See:

 https://lkml.kernel.org/r/202210260945.cCKjgJe3-lkp@intel.com

WTF are you reporting this branch as 'SUCCESS'. You cannot, must not,
report a branch with build errors as SUCCESS, ever.
