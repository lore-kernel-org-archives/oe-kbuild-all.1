Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4F1FDA9F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736764771; cv=none; b=Y8R1vWhI6j8AMmfxF2pMbyVuOzHRYVTaMa+mjHPMxEUjxx8/X4saoBlPzb/bP4L9nAAXygsbvNF4k+Wm29gOgH+w+covTSgKyRDp9d0/XyoKN/wMQ1FzfV4xIXCrCVbKxE2FT/WvACIUcuyFcN2j2+p7+s0gD9xHcNSS0TIn5Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736764771; c=relaxed/simple;
	bh=N8UmKGuiJt0FPnPt+cTQDKNv9hrJrygBSVuePsMIvAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzlbH/+9Me3VjyOi2OEZKeO4YtJpOOeLLjzzqq9vty5KZTwAiNpS/YiTio9kQSs75I3lhEoL4DecPk+ev4z4scDU8ZRn1arRcrR2x4RD02I6rBR99yS4LC/Sv2HWgkIne5XjumE/veWLaVI6eFRV6s2rk+uh4H/ak8qEHbcmNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdpE1D/V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdpE1D/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FDCC4CEDD;
	Mon, 13 Jan 2025 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736764770;
	bh=N8UmKGuiJt0FPnPt+cTQDKNv9hrJrygBSVuePsMIvAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdpE1D/V+3oQaW5f9iuzz+bjHH4fhAIMa0IdZU3XjaSFsWGFbl63ZzL0+Q9mjAvTS
	 DytJ/1O+MPliwmX3HHmaFwJjqfoZn6NlWbUGfQwMc3Zt1v8CmwzkA/FDQXsrjfkYJB
	 AXxfbDBZc9tWJpJps4YAWe8xjBXZATSczNwcA6R4a16JZsAjQ30R9y1aD7O04THDzA
	 qA30Sozfh9Zebq632EEV6LfS6WlICTD5ujIArcSwspmFcXpLohMJD0ZMeZz/A0gcy5
	 XLhZKp380u2Wmi6+2cl44PMh2y5Cy9/QFvw2rFpezu9khLszr4Yq9JnMOWz6nVgNgI
	 9bzt5eOKHbLnQ==
Date: Mon, 13 Jan 2025 11:39:27 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 171/173] kernel/kthread.c:913:
 warning: expecting prototype for kthread_create_worker_on_node(). Prototype
 was for kthread_create_worker() instead
Message-ID: <Z4TtX8GzLk-82u5Y@pavilion.home>
References: <202501122249.upmy4970-lkp@intel.com>
 <c883110c-6baf-410e-8a77-4c2501060375@infradead.org>
 <20250112183338.0ac4e721a48829afffd16073@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250112183338.0ac4e721a48829afffd16073@linux-foundation.org>

Le Sun, Jan 12, 2025 at 06:33:38PM -0800, Andrew Morton a écrit :
> On Sun, 12 Jan 2025 10:21:40 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> > > 
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  901  
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  902  /**
> > > 1bc3c5db9becd0 Randy Dunlap 2025-01-10  903   * kthread_create_worker_on_node - create a kthread worker
> > > dbf52682cb0286 Petr Mladek  2016-10-11  904   * @flags: flags modifying the default behavior of the worker
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  905   * @namefmt: printf-style name for the kthread worker (task).
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  906   *
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  907   * Returns a pointer to the allocated worker on success, ERR_PTR(-ENOMEM)
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  908   * when the needed structures could not get allocated, and ERR_PTR(-EINTR)
> > > d25c83c6606ffc Petr Mladek  2022-03-15  909   * when the caller was killed by a fatal signal.
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  910   */
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11  911  struct kthread_worker *
> > > dbf52682cb0286 Petr Mladek  2016-10-11  912  kthread_create_worker(unsigned int flags, const char namefmt[], ...)
> > > fbae2d44aa1df7 Petr Mladek  2016-10-11 @913  {
> > 
> > @Andrew: I don't know how to handle this. My patch applies correctly to linux-next
> > where this function name has been changed. It looks like 0day is applying it
> > to mainline linux + your tree(s?) for testing.
> 
> It appears to be a fix against Frederic's b1e125dcbcea ("kthread: Unify
> kthread_create_on_cpu() and kthread_create_worker_on_cpu() automatic
> format") so it would best be carried in whatever tree holds
> b1e125dcbcea.

Exactly! I have queued it to my tree (with an update to the Fixes: reference),
which should appear in -next soon..

Thanks.
