Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FE4C6D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728259357; cv=none; b=VcBcVKtTEUl2piHu//uugdx6Ffmdv3CGl5QARWJ0++Enhf1yaEAq3Oe1M//ZTyyEfldLO2eMSLR/Jlz2KZn3NcGlqNbMoTvAlJ1LZFgIUYOIXez6Qxfsf7sp/XHLS/V+e4Xr+32w3yRmctblbsQQ+9jKlVKt3fl3iSy3zL3p9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728259357; c=relaxed/simple;
	bh=rY5rckWHOEMry+oJxdj2s08HQxeL3LDPzxuXbkZ/dkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sV6JvlShIQaKXcPuRFiah2qvQoSVqff+DfhritQT++hQ2EqnxgppGwAyhFCDDa8U8LAJdITkJdNLoYvd/wsNwzHhqU1NECmBPj1uDPWIdCDqW5OwERiBOiI/VSdns4BdV6i+PGWLXz+Iz9EQCF6qffVXNQlcpSSwK+DewRL1Ua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QlQkM3DH; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QlQkM3DH"
Date: Sun, 6 Oct 2024 20:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728259353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sf2CQV3Z9IENxLf8EimqpONhWLn5A4qNZw8gZIzZKeQ=;
	b=QlQkM3DHCdcjOH9yaiVRYd87XupTH6JJol0+VKGj/gMv6suHBchZ/WZ8KZor0hlGyQScGc
	A3U9EDIgist1Elvi0GOrnf3+tGCgj4ntGxT3ov0zkGeM2xVH9iqg5X0b8YxyiKvq679/Uv
	sy1vIVGVg7RFHHfM3cWUjwPLi/5Xoz4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: NeilBrown <neilb@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	kernel test robot <lkp@intel.com>, Christian Brauner <brauner@kernel.org>, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
Message-ID: <hwwxnu4j5ypn7dgafpue2df4u7ec7kg4k4vu4gipeda7raefru@cyttqcthsfrs>
References: <>
 <20241004100111.GM18071@noisy.programming.kicks-ass.net>
 <172803826240.1692160.2514028201460838195@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172803826240.1692160.2514028201460838195@noble.neil.brown.name>
X-Migadu-Flow: FLOW_OUT

On Fri, Oct 04, 2024 at 08:37:42PM GMT, NeilBrown wrote:
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
> Do you need to wait?  Is a compile error worse than an actual bug?
> I guess it will cause more complaints, and that is something you can do
> without.
> 
> Kent: how soon can you comfortably get this code updated and a pull
> request sent to Linus?

Fix is in Linus's tree as of last night
