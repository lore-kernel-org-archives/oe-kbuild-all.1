Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0901741E0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285316; cv=none; b=UvCACoT5XGgycY9aToTgDgWqU3Ej5UDUFq6FBCB7cEVOaHPWEaHsz529qP5nRdpfKdB8bzP/jNLMHJwCY1usFOuaaZl5DbnVfONUtszY/KKcPOWdd1pkb+x+pY+rlyvrVooLza6twSwx12go8/ZPzWAlhu6pwYlJu6+zYLmro/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285316; c=relaxed/simple;
	bh=6wL21uqFLw8FsJWLPasWX76n1pAQnVz5wGMBjfg6rgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLOnFT+UGK/3Fn0tkqoDDH8BQjrFXkD+zncguULPOm3PDcfJJmYxWWengYOSrYFG2xKyefCksiPpEHjph2Hgf+r8qO6nUuPbMtTcJlUTE5phc81QwdjEgzGjYOlU+haSKySkFp6ZOdGhmS1VBYN5KS+TgjNZ/qfc60FiX460W3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EWQwiDZ4; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EWQwiDZ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YN76IPGI5jr4sHxmevWAsKWUPPLKanm1/lSsUhfjqnY=; b=EWQwiDZ44ztfjMngTYC/Cfyq41
	ceqK27AhfnkMhkWtLGGKMuBGdG2Vi81PfmygWWmJ/CuSYzM9oEkUz3DBzmrNOwcFwXu3+Cd2qgfvK
	YEw+3aAk/yv5SkvmTy4cg/EDry90pWMrm1943m9rA5kBSttbO6j3aH1yiYV7AZ3IcCEaFVTFRkt7H
	Dr+P114tOdyC8H7svbEjcK/CNZ5nxV8FHeAkzbQPdWCxjQcK8dMTLeiw00SuR3Y0m1vl9ZfOMhCXG
	fyM0NVuIWjGlTF/4Iey2K95BTRk52A3vKJ2Y2NLvthJxnq/vLT/fhMfEkrI16Hod3BG2q+d05SYHZ
	gzcrq8rg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhxP-0000000Gs7m-0jXa;
	Mon, 07 Oct 2024 07:15:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 969A730088D; Mon,  7 Oct 2024 09:15:02 +0200 (CEST)
Date: Mon, 7 Oct 2024 09:15:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: NeilBrown <neilb@suse.de>
Cc: kernel test robot <lkp@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
Message-ID: <20241007071502.GD18071@noisy.programming.kicks-ass.net>
References: <>
 <20241004100111.GM18071@noisy.programming.kicks-ass.net>
 <172825831037.1692160.12644305359648113303@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172825831037.1692160.12644305359648113303@noble.neil.brown.name>

On Mon, Oct 07, 2024 at 10:45:10AM +1100, NeilBrown wrote:
> On Fri, 04 Oct 2024, Peter Zijlstra wrote:
> > On Fri, Oct 04, 2024 at 07:28:26PM +1000, NeilBrown wrote:
> > > 
> > > The compile error mentioned below is caused by my patch, but only
> > > because the code is wrong - so the patch causes wrong code to be
> > > highlighted - which is good.
> > > 
> > > Commit: 112d21fd1a12 ("bcachefs: switch to rhashtable for vfs inodes hash")
> > > 
> > > introduced a use for bit_waitqueue for inode->i_state and __I_NEW, and 
> > > 
> > > Commit: 0fe340a98b58 ("inode: port __I_NEW to var event")
> > > 
> > > change inode->i_state to require the new inode_bit_waitqueue().
> > > 
> > > These were in independant devel branches and this would have been caught
> > > in -next if my patch had already been present.  Sorry I didn't do this
> > > earlier :-)
> > 
> > So what do I do? Wait for the bug to get fixed?
> > 
> 
> The relevant bcachefs code has been rewritten for -rc2, so were should
> not be an compile errors introduced by my patch now.
> 
> Commit: 6b63a948a73b ("bcachefs: Add missing wakeup to bch2_inode_hash_remove()")

Thanks, I'll rebase my queue, and assuming the robot isn't again
offended get this into tip/sched.
