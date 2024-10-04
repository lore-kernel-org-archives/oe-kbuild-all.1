Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425B132106
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034561; cv=none; b=QKjDl4TvE18101q3DCEdlopFlhFJ+w2SahKdEX5GcJl/5c5QK0vAngf3u8X5ll9qrY1ZgQ9zFjST8q2TQ2t6FaS/AivEKOh3QqTc7uwWLvxP0hFvR0OFrBhg1z1SVxmB4KlXC9Cz0j4FYqzI9pZLQ0nO6w7jDkh/d4cw/3Ar+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034561; c=relaxed/simple;
	bh=7NxylzQ4CunXJ47BVZKnqxaw49CijARuNxCYZVdRaTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tsc+PVyPf9AmdX4gaACK5mgQMOE3SODX7pNKC2HYodXKWZkUFEWycs5jlHLw1pwDN3++7lUzNeMXbL3HTKNQFPOGEyhYYpCT/VskmrrzfHmVjjkCPosWcU9YC87QdEvYenyNjoQERfmwf9wyAqpCAfYozZnVJstZOeK3yWMQ7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPZdoNGP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPZdoNGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A855DC4CEC6;
	Fri,  4 Oct 2024 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728034561;
	bh=7NxylzQ4CunXJ47BVZKnqxaw49CijARuNxCYZVdRaTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPZdoNGPGfavFviVYOTP+iREaSXsNnoDHu0n/gn2OfA7RpMYDcXmLghJu3PfKJMmM
	 3YtsnCC/No5Afmm/eadZu3cJN1hbdgJd3+qHGCA1yCibG3qO0NGsFrh5CO997ekC71
	 u1zTXGiOD+T09kUExulPqcn9TiFfLN7eYK7kE1shDTPN1YM5i6etcSnbiXZzgVvtQo
	 DITaYzOO2ijrSGh7sde1h5PUVo+bu72zG5uMqaBMfol8HdPNNh2Om56ljQESYdaFLt
	 NdeE0C8HVRt1EXVUdWB1P7cxB7EnDF4rLKmNKsqhhNW4Qo3W8TxMADugBgaw/WTZX9
	 aQbr/1P+ZQlXA==
Date: Fri, 4 Oct 2024 11:35:57 +0200
From: Christian Brauner <brauner@kernel.org>
To: NeilBrown <neilb@suse.de>
Cc: kernel test robot <lkp@intel.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
Message-ID: <20241004-parkverbot-beilhieb-f2db98232ac5@brauner>
References: <202410041649.HreQEkk8-lkp@intel.com>
 <172803410635.1692160.3184328102300453899@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172803410635.1692160.3184328102300453899@noble.neil.brown.name>

On Fri, Oct 04, 2024 at 07:28:26PM GMT, NeilBrown wrote:
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

No worries, that code wasn't present when I added inode_bit_waitqueue().
It only made it in for v6.12-rc1 afaict.
