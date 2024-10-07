Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AE320F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333236; cv=none; b=LgWIxkZHPhGscqOwFTT5yHFDhGAFqMFhrBGBN6jyQ3ch+nX2SAWWYpWdsl28JlhoF5G5HQENK8DaRCKO7seEbAp/iNdO+b3qqA+DZxOcTFUZ59UZ6edeYjTbWA0+/YK6xdz7L2AAkSGs0hXvELLN45OLxKEnro4tjSvuEnM/QXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333236; c=relaxed/simple;
	bh=eX6E+Lt7zr4uM7ggXFiYrNL8RMcAmyLi0uGdWihoK/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rc1N/I3r9PAmZQuwsrsaR5OYX0L4kUNuOxwvudLyTXF9SYL0O1ILAUmIWcG9vIeJffUqnEQIidIY2ne7TF6z9p0krdKZAyDg2p8xKk2y6HRQA0uQa8xj5b9tmQcoCnqCe1pfhRNLqQXKYPNXaezSGPVvWdzAqsIIsVKmDFzFWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y3xZ1Dvc; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y3xZ1Dvc"
Date: Mon, 7 Oct 2024 16:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728333232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GC/ep86lkfH65/h7M4ff0lHF0I/w+eOfMeOFU30fpxE=;
	b=Y3xZ1Dvcc3bhrtXj105khvveJZ7jveHuuI+aEFaoYHgSR81jY8OuyOk6A7D0ZgW0Edrf+6
	eqVMwf1XY1wbU4/ed9rebkWD7yiDPQbmV3FFHb/R1BBwxvWqiQngpsKTWzy6NCV8Hq+kD4
	RaX4STNq+Bko3tLrVssonm9/0B24ahU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christian Brauner <brauner@kernel.org>
Cc: NeilBrown <neilb@suse.de>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, djwong@kernel.org
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
Message-ID: <7bu6wtyhb3vnzr6sgb52kgvtqkb3g7vpgncettwfaoes6fpj4g@4k2xhwown6sv>
References: <202410041649.HreQEkk8-lkp@intel.com>
 <172803410635.1692160.3184328102300453899@noble.neil.brown.name>
 <20241004-parkverbot-beilhieb-f2db98232ac5@brauner>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-parkverbot-beilhieb-f2db98232ac5@brauner>
X-Migadu-Flow: FLOW_OUT

On Fri, Oct 04, 2024 at 11:35:57AM GMT, Christian Brauner wrote:
> On Fri, Oct 04, 2024 at 07:28:26PM GMT, NeilBrown wrote:
> > 
> > The compile error mentioned below is caused by my patch, but only
> > because the code is wrong - so the patch causes wrong code to be
> > highlighted - which is good.
> > 
> > Commit: 112d21fd1a12 ("bcachefs: switch to rhashtable for vfs inodes hash")
> > 
> > introduced a use for bit_waitqueue for inode->i_state and __I_NEW, and 
> > 
> > Commit: 0fe340a98b58 ("inode: port __I_NEW to var event")
> > 
> > change inode->i_state to require the new inode_bit_waitqueue().
> > 
> > These were in independant devel branches and this would have been caught
> > in -next if my patch had already been present.  Sorry I didn't do this
> > earlier :-)
> 
> No worries, that code wasn't present when I added inode_bit_waitqueue().
> It only made it in for v6.12-rc1 afaict.

Christian, I've just added fs-next to my CI, here:
https://evilpiepirate.org/~testdashboard/ci?user=fs-next&branch=master

Right now it's just running the bcachefs tests, but if it would be
useful to you (or anyone else) we can add all the other filesystems as
well - I should have the capacity for that, provided we have a way to
flip off Darrick's crazy fuzz tests for now (heh, those are cool, but I
don't have the intelligent scheduling for them yet).

bcachefs still has a ton of failing tests (failing in boring ways) so
I'll have to keep an eye on it - I won't expect anyone else to dig
through all that red. But it's there now, at least.
