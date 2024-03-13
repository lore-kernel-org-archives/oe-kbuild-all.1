Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA54225AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710356785; cv=none; b=ECKQB/M2tKngnXHiNxsZW8Dk/jAFIrBQBYOxlnlSNV3XR7fDIJTy1AnZm1mI7bV5sjhHt2IdHLC+XYNHPh3STSkYhmg4Os+Uh9dtAV2H0Z5hygQPwRZp2M4ttX4BuqD/g8wQa70BHt6rVaFRUjULDLaeD0z+eHRakXNK9O63QrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710356785; c=relaxed/simple;
	bh=ZBSkGL0BqtvcUk5oD7GHm+GtBK+TbsJwzDWxCf6xB0M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Yik42Ftx+pxaLMnWE3UPcdFUGxC4qQX6G/Xla/ZRQ6orOSLWgFBrT1deZIhbio3EVGL/AmNhsh73bbWmkrCbeWVkedGV1SRHyditF+byENpK9dvqBgIL+EG4J1xgaalLIYAlmhHYUwEfSIwgasFPQgLwLgRsYj1okCZ8sK9aY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tNsIho+r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tNsIho+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315AEC433C7;
	Wed, 13 Mar 2024 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1710356783;
	bh=ZBSkGL0BqtvcUk5oD7GHm+GtBK+TbsJwzDWxCf6xB0M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tNsIho+rxQf79Wv2+sCazXadQvpKrNpPB7Z0gJ7W0jP9vqv84qeEdYoPg7KNEVkHa
	 jgfBSDA5dOEM3e4sLHFYfNEv/3WJFcEjNO1ptJmXOFQjTum5d1pqfBvDboT4B6AGVZ
	 /Zqd28y5Tdb08OPuoPapuzs4krh7ew/qGh/AVfvo=
Date: Wed, 13 Mar 2024 12:06:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Xu <peterx@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Jason Gunthorpe
 <jgg@nvidia.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [linux-next:master 12265/12944]
 arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of
 function 'pud_leaf'; did you mean 'pmd_leaf'?
Message-Id: <20240313120622.62c76d759cc06f80f0aeb48e@linux-foundation.org>
In-Reply-To: <Ze8vFNV9YSdgC2S7@x1n>
References: <202403101607.a42gaLOS-lkp@intel.com>
	<Ze8vFNV9YSdgC2S7@x1n>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> 
> There's another possibly relevant report for riscv:
> 
> https://lore.kernel.org/r/202403090900.OwPqmRuI-lkp@intel.com
> 
> I think I messed up the nopmd use case.  Since this commit already landed
> mm-stable, I assume there's no way I provide a fixup.
> 
> I attached a formal patch below, but I don't know how to test it myself,

What I do:

Grab https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/13.2.0/x86_64-gcc-13.2.0-nolibc-aarch64-linux.tar.gz

untar that into /opt/crosstool

And my crufty old script does, partly,

	WHAT="$*"

	...
	[ $ARCH = arm64 ] &&    CT=gcc-13.2.0-nolibc && XARCH=aarch64-linux
	...

	PATH=$PATH:/opt/crosstool/$CT/$XARCH/bin export PATH
	export CROSS_COMPILE=/opt/crosstool/$CT/$XARCH/bin/$XARCH-
	export CC="/opt/crosstool/$CT/$XARCH/bin/$XARCH-gcc"
	J=$(grep "^processor" /proc/cpuinfo | wc -l)
	J=$(expr $J \* 2)
	nice -20 make -j$J CC="$CC" $WHAT 2>/tmp/log-$ARCH

setenv ARCH arm64
crufty-old-script vmlinux modules

> and I'm not 100% confident.  Before I post a formal patch, can anyone let
> me know how I can kickoff the test bot to test the patch (or help me do the
> kickoff)?

Worked for me, thanks.


