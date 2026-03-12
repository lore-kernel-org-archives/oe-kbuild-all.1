Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6F34E74F;
	Thu, 12 Mar 2026 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331340; cv=none; b=kU5xEJgJXSaW8WulEMCiY06zctnL8gltWYemoNqciiC0MndW2krjz7C0pke/MkaPkowGJf40Czx39X6ry2lkYoDU59665Afy9FXSCOs2XUTA9hbn7IxIKLQvE3CVd/LUfoVMxwNzJix2azR4rcOH/QDlLkVsb8pl13XHGsxFtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331340; c=relaxed/simple;
	bh=zK+v52xRUcUxkb2cXkkaF7ysCkT56HnMQrAo0ovbj/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuY5zoAvBw3bb8Sn/0oRX+L7yLytNem6IeQHacKVroZTLMM3Wg6V5CChwVqdyeHdf0BjvR7SVz0x3yzI0GvsWgNGYj7Pp0kqAvvsXNKp4jcMSF1mbsw+zKEa3xeTBwOmEg9N+qQo6Dqv1BJ3ubjza3raSSTWAf+gUd+bcvrNeh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FjDhngNQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FjDhngNQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lKLbPPKelFzXSz5JAeQRan20167KgcNotjOwvFfU3xM=; b=FjDhngNQt5Uj1i+ZsSCSp/6pDQ
	FDLSqrxA1NkEVVNNTybVPJ8wXRJgAabNbOBFm4BMBvdNwYABTGsNgTwgztdOP3qlFS1ZSLSdWTIS6
	Q/dxPC765Oa99bc5Rz/mR81+DhWFj8FjTGbzKUFCS2lrG99kIHMQ6aUApo8oo8jdXEU5x2USAggvS
	F1d9Cwg62vb0eXuLsJ1NYvqcJPRVVJ7JK1NsqcfqI2Sf1BoOGp7wcIEs0FsuozQ9gibrF29rlIxVs
	JF6o6TKr7Ngv5FyJa+F1S5qWaeIMxVAeQTLyznsuVoR8F+CTr6Cnfj05CEwnY6m5fR8Gdw3eRES5r
	PwNUQ+lA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iUB-00000001XUR-2Zkr;
	Thu, 12 Mar 2026 16:02:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 123A5300311; Thu, 12 Mar 2026 17:02:07 +0100 (CET)
Date: Thu, 12 Mar 2026 17:02:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Chen Yu <yu.c.chen@intel.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Li Chen <chenl311@chinatelecom.cn>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>
Subject: Re: [PATCH v4 2/9] sched/topology: Extract "imb_numa_nr" calculation
 into a separate helper
Message-ID: <20260312160207.GD1282955@noisy.programming.kicks-ass.net>
References: <20260312044434.1974-3-kprateek.nayak@amd.com>
 <202603122149.xyvcIkPY-lkp@intel.com>
 <96d77b4a-7bc2-46bf-936d-3687cceb996c@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96d77b4a-7bc2-46bf-936d-3687cceb996c@amd.com>

On Thu, Mar 12, 2026 at 09:12:50PM +0530, K Prateek Nayak wrote:
> On 3/12/2026 7:07 PM, kernel test robot wrote:
> > sparse warnings: (new ones prefixed by >>)
> >    kernel/sched/build_utility.c: note: in included file:
> >    kernel/sched/debug.c:730:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
> 
> So what is out official stance on sparse in the sched bits? Because I
> can make this go away with:

I take patches for correctness :-)

I do not take patches that don't affect correctness but make the code
unreadable -- there was a submission along those lines recently.

I can be convinced to take patches in the middle provided they don't
affect readability too much.
