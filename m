Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D582797B1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753370423; cv=none; b=VS71ojFUIxf8+RGlAXyRwa9O2hA8VH4iBMBi+1Xym037z/OJkfV/kQF2WjaTejHxSYWQeZgLj8r/lAZDY5GilN04TQfQcpVOLoQ17c4T9m6SqoggW6h8rFqpDE8EEmifXcP5pyuy510Z2Gwykfr7UFWxwQSxYAzmC1Bws+Ap1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753370423; c=relaxed/simple;
	bh=XUwEGUR+Skvul7f5TQjOGAt3PIXLSpzysS0q/D/UE4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnQjCNFpoe/rgcrDpHUkdv8k+l6/FGc9mirr8gooc5HCD42Bc1lE0dSD7imEAREH7djhByghM7u+cXfgMDRUpjatSTQfKEgTChvJ7p26rtGYcmmvWvOYdCO1R+XEGHbWOsqaODYzrUONNVxeepvl835bzLYKEiZ5FBGpt4Cpk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lV0RNaG9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lV0RNaG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9F3C4CEED;
	Thu, 24 Jul 2025 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753370422;
	bh=XUwEGUR+Skvul7f5TQjOGAt3PIXLSpzysS0q/D/UE4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lV0RNaG9Y6W+WkZB/W6CSe2pS55gvZAfPXF5jTBH5d2N5wT01wtnORnTeYL/rVOz5
	 m7myJBximU8L3nN/0mD33MbXcCTm6SXxe5N9XKxu1mGQwc3vA1k7n3ti5o1B9lVc+5
	 v7OHMFISCcl7iUZFOEwiKdtbeVmY8kBTN/jnFrgvVfF2M3Q145GkJXR8359Sg7+268
	 uDP6v2RGeLP1+KtIS/xKA+DrLdYb3w9zHgSACKOR91Pli10dwXnz90ua3OvYVTdMMZ
	 vwji0vfCCzz2jcLLwSrjNSlMvsgudXRhwO1E0WZxJ+wpuJ+mnFQDNSZPRK60e6rvEQ
	 +NKnivkA5CAzQ==
Date: Thu, 24 Jul 2025 17:20:18 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel test robot <lkp@intel.com>, 
	Steven Rostedt <rostedt@goodmis.org>, oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>, 
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [linux-next:master 11803/12139] fs/xfs/xfs_qm.c:506:17: error:
 implicit declaration of function 'trace_xfs_dqreclaim_dirty'; did you mean
 'trace_xfs_dqreclaim_done'?
Message-ID: <puo7tygla3sr5d2brmjeal33lmvnzq7cmcm2flvestsbgm7m2g@q67blr74tcbo>
References: <Nk-H2GdoynYmAv3_b2PyJSULw3sGMOU6eBOzBYWOfHMmIJXl_FrPPUp6oLSDTOBeJA6xZDe8i5EISmnsCwgohA==@protonmail.internalid>
 <202507241747.dwTWz8Ig-lkp@intel.com>
 <bwmvu3t3uw7qo5kcv7uwrrcvkhyhyb7ys57qcgsgpal7r3hixy@qjxiqn2ef4ni>
 <uncwpbkjp5ymdrk76augrq3bxjvqsciyjcg47dvp5fo4px5o4w@vt6psvbnoqa3>
 <4q6XjaFW-KWtsBKnTX_ocW9kn9vdTNCLqycadIBcyl-uSP8vkNiUnKr0-Ygo8NlzyogQpnnKOHJbJ0GfUnfqKA==@protonmail.internalid>
 <20250725001445.552b09ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725001445.552b09ee@canb.auug.org.au>

On Fri, Jul 25, 2025 at 12:14:45AM +1000, Stephen Rothwell wrote:
> Hi Carlos,
> 
> On Thu, 24 Jul 2025 13:58:02 +0200 Carlos Maiolino <cem@kernel.org> wrote:
> >
> > So yesterday I made sure xfs-linux/for-next had all dependencies before pushing
> > it  and make it available for linux-next. I'm not exactly sure how this
> > build failed. If the patches were applied out-of-order, then it sure
> > would fail.
> > 
> > Does the bot make builds out of order? Because the HEAD mentioned above
> > points to the same commit described belo at linux-next/master, which the
> > bot says it correctly built.
> > 
> > I'm not exactly sure what the bot did here.
> > 
> > Stephen, perhaps you might know what the bot did here?
> 
> So, I don't know how this bot actually works, but it looks like to
> tries to build after checking out each commit, so (as you say) if the
> patches were applied in the wrong order, then you might get a failure
> part pay through the tree that you don't get for the tree as a whole.
> 
> In this case if you checkout that commit (1edc170bb240), you end up
> with a tree that has the call to trace_xfs_dqreclaim_dirty() still
> present.
> 
> The commit that removes the trace_xfs_dqreclaim_dirty() call is in
> v6.16-rc5, but commit 1edc170bb240 is based on v6.16-rc2 ... so you
> probably want to rebase the patch seires from Steven Rostedt
> <rostedt@goodmis.org> (1edc170bb240^..10a957e43f28) on v6.16-rc5 and
> then merge it.  And, in fact, commit 1edc170bb240 has this:
> 
> Fixes: d62016b1a2df ("xfs: avoid dquot buffer pin deadlock")
> 
> So needed to be applied to a descendant of d62016b1a2df.

Thanks for looking into it Stephen. Yes, they are dependent. Those
patches from Rosted are planned for the merge window, I didn't want to
actually rebase them on top of current code to not change their hashes,
but well. Seems like it will be better to do that than face some of
those spurious failures in the future, I'll do it today.

Thanks again for looking closer into it.

Carlos

> -- 
> Cheers,
> Stephen Rothwell


