Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C935DA43
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316670; cv=none; b=Orq2w99kl+1VLUtaAgycDlzdwj6U1PEciW++UT6cyyCUJ+gIBGtT9IwXWMl8UKcHsR6V1ox0iGZrCK6Hmtp25QCMnur4tgI85FY2EPmsyrWo9MB5J+O5DvjQL2A8XsCPANuS3+YyPKHYa2iXE5Nt0fheU0N05pHkAagwDFyvuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316670; c=relaxed/simple;
	bh=pKwKNslmnB3tpu487yPVrj4xXoxt5VLD//nuwlqnwyI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ICUA+HsmJKiXRJQ38/mkGu1EUXPUub9Bmnm8rOGPFl0M86BfwlTVEVVh9OpACy/yBxAYYW7wVigKqeGN59anilyFiw72L3w++LsUErpHGMWuT2GfYKytOlZIwIkHI5altHAeUrW1Obx4bSpNTDQ6LeMvsPQPnuMLVYc3SjyUtZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rfX6vrHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rfX6vrHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D301F000E9;
	Sat, 13 Jun 2026 02:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1781316668;
	bh=s/9t8fsXFPOklpJdOhD/xZDi2Gw/WymQ3bhv4WPhUKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rfX6vrHzTv+YsNe1AIALPyBHd5pPdk8v0fyy27KjifVpM5sefNdRQQXk6f+Yya8B6
	 ytZ4RjGQgzbnxobh4J2/wpb2tO6CzeDbBPNUd338/izDwKzpVE3vPOQTI7AgVAwWb/
	 I0ArYHzZdO/m8dfYqP2XtVTSzs6I8I39OD6CoSfg=
Date: Fri, 12 Jun 2026 19:11:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>,
 <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 12966/13336]
 ../../../lib/interval_tree_test.c:315:17: error: implicit declaration of
 function 'pr_warn'
Message-Id: <20260612191107.c6cecc7003eece597f66a1b3@linux-foundation.org>
In-Reply-To: <aiyvdAugnSzVlm+6@rli9-mobl>
References: <aiyvdAugnSzVlm+6@rli9-mobl>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 13 Jun 2026 09:16:36 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> commit: da58d4edb02fe347b676a3be230fd16da68c4fc8 [12966/13336] lib: interval_tree_test: validate benchmark parameters
> :::::: branch date: 2 hours ago
> :::::: commit date: 2 days ago
> config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260612/202606122249.neYsYssG-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122249.neYsYssG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202606122249.neYsYssG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from interval_tree_test.c:11:
>    ../../../lib/interval_tree_test.c: In function 'interval_tree_test_init':
> >> ../../../lib/interval_tree_test.c:315:17: error: implicit declaration of function 'pr_warn' [-Wimplicit-function-declaration]
>      315 |                 pr_warn("nnodes must be positive\n");
>          |                 ^~~~~~~
>    ../../../lib/interval_tree_test.c:335:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
>      335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
>          |                 ^~~~~~~~~~~~
>          |                 kzalloc_obj
>    ../../../lib/interval_tree_test.c:335:30: error: expected expression before 'struct'
>      335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
>          |                              ^~~~~~

Thanks.  I can't reproduce this.

lib/interval_tree_test.c already includes slab.h.  I'll add a fix to
include printk.h.
