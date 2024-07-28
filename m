Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C4238FB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 20:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722197920; cv=none; b=KJHCe6Tepjpr/AmFrPdXqykmX/HoVloikESZLUruArLup5hZ8ARtdU8T6KLxlG+Ehh6J77w1fQuakMbbwrAPIuT6d2nzYbVnlbsubLSbOvJhUT8VDS99JNHSY1I1sYsUf80sDuqLCHGlvGm+NJHycCpJpSqhhCaZV1eeuvU0PoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722197920; c=relaxed/simple;
	bh=JZzwHpfdAu4qXKTVrGa36jaK8WvRMHKNC1pGUppTZAQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oGsmx87zJ85nhROtu7oaAl/+EXRyr6jcAfW+cwAuvHzjI9bWBu/genxQ8MCsjbbWWF2q7dYvf/Fl5SiPtkLkxDz3zpXn8clqhl0/OwsXVW1qq7MJprxT2uIavRt2SqXje0MNVHzDx37FIqm9zk+Phz8Npj7LTIYJez7VvA0Twgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JEB6qm/7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JEB6qm/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9789C4AF09;
	Sun, 28 Jul 2024 20:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1722197920;
	bh=JZzwHpfdAu4qXKTVrGa36jaK8WvRMHKNC1pGUppTZAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JEB6qm/7tvcfHJGc5zM36ccvSMDc26M6/Nz4CErrnGWZfUfMdLoTemILXxbwRM7Fa
	 AYEeWl36+uDPdfWN1q+ngnyco8QekZCTku00RC8FytOj2ZXj/AIT+1pwawSlfip01U
	 TyxZdxbq+RKBussy6eLIylmX6Jbvo9vDnbQN8puc=
Date: Sun, 28 Jul 2024 13:18:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: David Finkel <davidf@vimeo.com>, <oe-kbuild-all@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 36/78] test_memcontrol.c:201:6: warning:
 variable 'fd4_closed' is used uninitialized whenever 'if' condition is true
Message-Id: <20240728131824.51628ab73f6318fe62e85742@linux-foundation.org>
In-Reply-To: <ZqXB99KGKrzyePeL@rli9-mobl>
References: <ZqXB99KGKrzyePeL@rli9-mobl>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Jul 2024 11:58:47 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   b39b3892d20a337489c55806f91af581474f3943
> commit: f2db5cca8182337f4ad485ebfd532b1a2d1c223a [36/78] mm, memcg: cg2 memory{.swap,}.peak write tests
> :::::: branch date: 2 days ago
> :::::: commit date: 3 days ago
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272301.bBC2CidR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202407272301.bBC2CidR-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> test_memcontrol.c:201:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

um,

	bool fd2_closed = false, fd3_closed = false, fd4_closed = false;

fd4_closed cannot possibly be used uninitialized?
