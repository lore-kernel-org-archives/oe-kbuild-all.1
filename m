Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2BE3CF74
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036076; cv=none; b=XIG2GQcL13AcMzbFdQmFFGqKCVmtxGl7VPSgZnOlpduJAHpL/U1G9FTmFdQ7IVqVjhgYw6xB6JjZq9R8fGCHRaxMK0vQPBJlaim7fVjx7Rd29l8e2tRF9ZHiGmnnYYM0aNvb8amMFz1sftDyjl01L7rV+ztIFgv4STWQxlPq2IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036076; c=relaxed/simple;
	bh=9E4MbKYp6Q8JJm0zr71ue0hNHq7zmEMWafAvmOL+Y3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2y4bo6VqSe5dEglasGDK5crf6HqIjEp8UC0G6sLdPBLEnO+sJfqTzweFrKt6BfLIa1TDYJBha5E46lYhcnEzUYMBZoZ5ftSw048YP6lXSgwtPysDsMwhLV+KJyZamWvE4p3itT/38dcicV7ffBmrjxSSwzPGpupYr8CWGVTMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FokBC2Ji; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FokBC2Ji"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B6eiW4sOnHB1E9/f7mcSZ8zC63KRt+0ip0VEoH22bEE=; b=FokBC2JiCnLvMdjuG6m7ZEciIi
	6e94Tz5iX1kY66QDh17NLzeImVePVS4srbIK0+1aATBYtk+wF+mEl1LTUmQa3rGj/dgTCWMk4iLA/
	8iL3BRFS6x7EIceHJIkqqurz4aQruBn7adOvgTTgTFuTpYraK3EOQx7120vhzlbLBKtxW/It6eqds
	YC2RZDGH95pxVJeLelk9iWTQDGfXA36CwUenr1KcWTbTGNAZfOvgS/cuymHSq2kszMBHhFKIsh9a+
	88Vq7BBEWDhfpxhOYPO4kUnlHkOg+zpgVfTPrqehgIpjDmIy5y1O0nz+LHUJgomVIFOJzZ8i9Egqe
	MvfA14Pw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swf7Y-00000003od9-1g71;
	Fri, 04 Oct 2024 10:01:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0AC4530026E; Fri,  4 Oct 2024 12:01:12 +0200 (CEST)
Date: Fri, 4 Oct 2024 12:01:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: NeilBrown <neilb@suse.de>
Cc: kernel test robot <lkp@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
Message-ID: <20241004100111.GM18071@noisy.programming.kicks-ass.net>
References: <202410041649.HreQEkk8-lkp@intel.com>
 <172803410635.1692160.3184328102300453899@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172803410635.1692160.3184328102300453899@noble.neil.brown.name>

On Fri, Oct 04, 2024 at 07:28:26PM +1000, NeilBrown wrote:
> 
> The compile error mentioned below is caused by my patch, but only
> because the code is wrong - so the patch causes wrong code to be
> highlighted - which is good.
> 
> Commit: 112d21fd1a12 ("bcachefs: switch to rhashtable for vfs inodes hash")
> 
> introduced a use for bit_waitqueue for inode->i_state and __I_NEW, and 
> 
> Commit: 0fe340a98b58 ("inode: port __I_NEW to var event")
> 
> change inode->i_state to require the new inode_bit_waitqueue().
> 
> These were in independant devel branches and this would have been caught
> in -next if my patch had already been present.  Sorry I didn't do this
> earlier :-)

So what do I do? Wait for the bug to get fixed?
