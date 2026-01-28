Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93382144D7;
	Wed, 28 Jan 2026 04:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769576035; cv=none; b=tMu6SBfCbfZnqe8ngA6TQq+AkBiahYtMmnakyT/kHqeF3hx1hYfGKLzsecca3/LeG265fy4XUq4dcCkeIrC6pvP6yCjEUbPpp6LDCFa9D3AOwKfgF4zebIiVKm55joMYjzaOwnhEiCK66VsCyxgjy9hbLCU7zbevlvBXyDlyTP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769576035; c=relaxed/simple;
	bh=Dk04+QnD3PNJQz/r+cQ+/iSuYEqm7MaRHJf9e5fXHyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1bBxjLDl72mNJBMO16XN6PfZDrI9kRFehIoyO1Qh3KQAQw2LhYEPYIqIKPJYEsmv0m2ac1Pprqp41BM0my9ZSlXKuFHrZr5faO7qkloBDtXV1GcsE5eetngosbVsefgZfzgEFusFzHVi1CTpBIaymH/Y8Fn4w647GPHH/cuiz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=MOG148m4; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="MOG148m4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ILKM3xjKcR7xtwHiOur0gunnfLBeNsLHEzt9XHBY6us=; b=MOG148m4K2AUbpq9DxyOYxsDga
	pCNsS6mhTm0QjqBUofjYonU2a4iqNy68Ci70J5Bf2JRt+T+tEtaAJVFztd780DPxe3jtVd9zKZOEa
	OdDYwIaL5bEUwcTNtEMVF64GhQB3fEW5AINGFX63zrD1iJT2/AU2hyzI/aq39O3Ib9H16JTcX9g/Y
	+/EA/71PIbwyesazoxWXE6MlWRkj/GJM7b0QxQcrIpb9CaQtuK2r4qf0qaCrPOaZSjDNjB+B741WU
	4xLp8Q6AZer0e6BjL6flRO1MxkRShkxM3k2+oXyAOYPhu5dPnnviG8XC4aBZTQ8EuAaM4Y+c46pYt
	vAEe02rg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1vkxae-00000007XUR-0OXH;
	Wed, 28 Jan 2026 04:55:40 +0000
Date: Wed, 28 Jan 2026 04:55:40 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: fs/dcache.c:2788:24-43: WARNING: atomic_dec_and_test variation
 before object free at line 2789.
Message-ID: <20260128045540.GR3183987@ZenIV>
References: <202601280811.uLPBZWvT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601280811.uLPBZWvT-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Jan 28, 2026 at 08:19:52AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   1f97d9dcf53649c41c33227b345a36902cbb08ad
> commit: 95a4ccbbe596b45264af5e3a019cb920c05ccffd dissolve external_name.u into separate members
> date:   1 year ago
> config: m68k-randconfig-r064-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280811.uLPBZWvT-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601280811.uLPBZWvT-lkp@intel.com/

> > 2788		if (old_name && likely(atomic_dec_and_test(&old_name->count)))
> > 2789			kfree_rcu(old_name, head);

Warning (along with the identical warnings regarding other places where
we do the same thing to the same object) is a false positive.

Each live dentry with an external name is holding a reference to
that external name; that reference is stabilized by ->d_lock of
that dentry.  All changes are surrounded by bumping ->d_seq of
the same dentry.  Freeing is always RCU-delayed.

There are two places where increments can happen: copy_name() and
take_dentry_name_snapshot().  In both cases dentry in question
is live - the caller must hold a reference to it.  Increment of
external name's refcount can't go from 0 to 1 in either case;
the former is is under target->d_lock, which stabilizes
target->d_name.name and guarantees that refcount is at least 1.
The latter is atomic_inc_not_zero(), within the same RCU read-side
critical area as sampling ->d_seq and fetching the external name;
since freeing is RCU-delayed, the external name in question can't
get freed until we leave that scope, so memory access by
atomic_inc_not_zero() is safe.
