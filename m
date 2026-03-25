Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294734503B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412819; cv=none; b=NCpH5QC3WVTl/Ao/MzBRLcA8WgEKaMFZ5Dd73JK8tllV08OxnmkXnQFG2lcxhY/I6K592U+qcxK+1xffttNUe3S8whnxf2I6mTOA2LPpOw4n1uAfS9271mbQh2vBv7TrWRbpTKHM6sN8zsfAzW/gOs27PMxxjM2KWjDgMh/qA50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412819; c=relaxed/simple;
	bh=IPwqk6SASt6Y5QcfetNCYxTed8oJqjxL9aGx5lCMFkc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ajwghRd7LG0zRAZro1SBoEqVholvedKs9IwcC+Lu4blK+fEyDVCePYwsOwTknDoknJgCePUKzhLXbOllhfYb+2e6GkmrBYezqHRAc1TvzlbAmdO+lVUR28PSWg42IV6X2tt61rR85UDdG6GT0L+G5oBw14MI9nvi+n8mPqMq14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IPnaDLGJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IPnaDLGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9272CC2BC9E;
	Wed, 25 Mar 2026 04:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774412818;
	bh=IPwqk6SASt6Y5QcfetNCYxTed8oJqjxL9aGx5lCMFkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IPnaDLGJBoRuY/7WP63Me3fhrJm3K3ZTRwJrVzU2h8UR6rOtzHi5Ey9gkH6edlseW
	 tcv0W1ZF3AWpwnB5Wmd/1nMbXiHHi4U07znOzHdJ0DqV/iX5Y0AJQB+XyOqVxhXn2Q
	 LzH4zNAu9aiWqC2A4WbQBX4o0x7dnK9vu9NDe7QY=
Date: Tue, 24 Mar 2026 21:26:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Chengkaitao <chengkaitao@kylinos.cn>,
 <oe-kbuild-all@lists.linux.dev>, David Hildenbrand <david@kernel.org>,
 "Linux Memory Management List" <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-stable 72/140] arch/sparc/mm/init_64.c:2582:16:
 error: implicit declaration of function 'vmemmap_pgd_populate'; did you
 mean 'vmemmap_populate'?
Message-Id: <20260324212658.a267bb861af1dcbf119a1901@linux-foundation.org>
In-Reply-To: <acNdJ/q5tNB0nNjp@rli9-mobl>
References: <202603251147.CtgepAeH-lkp@intel.com>
	<20260324202754.6f29c4f6530ec7ea9d1f753d@linux-foundation.org>
	<acNdJ/q5tNB0nNjp@rli9-mobl>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Mar 2026 11:57:27 +0800 Philip Li <philip.li@intel.com> wrote:

> > The coincidence is too great.  I assume Kernel Test Robot is somehow
> > treating the mm-stable differently from other branches?  Can we please
> > not do that?
> 
> Sorry for this "coincidence", the bot does treat all branches equally and
> there's no special handling of mm-stable. One possibility is the randconfig
> is just generated on 20260325 "sparc-randconfig-001-20260325", which is able
> to expose this issue for sparc arch.

huh, OK, thanks.  I was able to reproduce it with sparc64 defconfig.


