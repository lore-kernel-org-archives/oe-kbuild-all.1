Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4A4329C6A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 05:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770270928; cv=none; b=XnQs1r3k2eVjVT1PH05KBurY2CEpZjwXHiv3hqo72MAcNPLBRSjL/+eHwua4uNyybcxti8xBQltN6iBAb4XKtOoZfgCqdzqW+OmH5Tz2NqyootKTRPRopdFls+HP19li01MgzpACrLD5sxke7SPD0Czp0OL6Y/fUQ6F6itVVPTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770270928; c=relaxed/simple;
	bh=/WZgI+nJ4qBHtHC5cbw2kdlsM6DG22GfcVH2keFaHjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXloHBZahzEL9nlGQbg8uOKl1RVAgnX4nXmz0F1SN6H4sIu0T1kOIMDK0fR/+I8LyILOV/X62NuMHrrQbva6zkbcXM0s+m+OxRydIG2UlnrehKC7Jbib3iF/QxS7QAm24SvxZIXAbJ0Z9AJG+CzthlJ2vnByz3pyb3uVUjfxreQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nK2t4O46; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nK2t4O46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED91C4CEF7;
	Thu,  5 Feb 2026 05:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770270927;
	bh=/WZgI+nJ4qBHtHC5cbw2kdlsM6DG22GfcVH2keFaHjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nK2t4O46WodKKa0UqBichD6cK14oHK77+SlHHTGCQX+mk5+QfuS6JZGey+lz6p0Cg
	 cqXZv9RCbFNujRMVVgBnaFoMt/ODxO/kT0oBaHaE3nUu8KBj8Iu4MJqLtd0mRpAhbm
	 o7Yvv3mGULEv/Vus6CLZh1ED9Gi1wQ0UqzboqT2x0lAfhjWw6KjOhyecNfBR981DaA
	 OiBHd6UfUw1VK74e5pYMY6kKOJPpskhZZ20lz4/QqKDxNOpapZlw2kQEfQ917ISJuL
	 RSUHLcfs+jm2ZhORNi3Z3l8FBQydVSG6u5Rs/z1cCC5MsWEUNL3jRB8mKpla2Dol5l
	 9MDdYWCAqUqNA==
Date: Thu, 5 Feb 2026 05:55:24 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [driver-core:driver-core-testing 1/4]
 include/linux/rcupdate.h:510:9: error: dereferencing pointer to incomplete
 type 'struct revocable_provider'
Message-ID: <aYQwzGvucW3c8LUo@google.com>
References: <202602040048.R81E8WaK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602040048.R81E8WaK-lkp@intel.com>

On Wed, Feb 04, 2026 at 12:48:55AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
> head:   988357628c2c84e891f5992c4f5cfb31fb3bd27b
> commit: 4d7dc4d1a62dbb22b1178dddeeb7a22d0272df77 [1/4] revocable: Fix races in revocable_alloc() using RCU
> config: sparc-randconfig-001-20260203 (https://download.01.org/0day-ci/archive/20260204/202602040048.R81E8WaK-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040048.R81E8WaK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602040048.R81E8WaK-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from drivers/base/revocable_test.c:19:
>    drivers/base/revocable_test.c: In function 'revocable_test_basic':
> >> include/linux/rcupdate.h:510:9: error: dereferencing pointer to incomplete type 'struct revocable_provider'
>      typeof(*p) *local = (typeof(*p) *__force)(p);   \
>    include/kunit/test.h:839:15: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>      const typeof(left) __left = (left);           \
>                   ^~~~
>    include/kunit/test.h:1056:2: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
>      KUNIT_BINARY_PTR_ASSERTION(test,           \
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/kunit/test.h:1053:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
>      KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
>      ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/base/revocable_test.c:40:2: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
>      KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
>      ^~~~~~~~~~~~~~~~~~~
>    include/linux/rcupdate.h:521:26: note: in expansion of macro '__unrcu_pointer'
>     #define unrcu_pointer(p) __unrcu_pointer(p, __UNIQUE_ID(rcu))
>                              ^~~~~~~~~~~~~~~
>    drivers/base/revocable_test.c:40:28: note: in expansion of macro 'unrcu_pointer'
>      KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
>                                ^~~~~~~~~~~~~

This warning seems to be reproducible only with older toolchain.

`struct revocable_provider` is an opaque type.  Possible fixes: make it
a non-opaque type, or move the type definition to revocable_internal.h
and include the header in the KUnit test, or don't use unrcu_pointer()
at all.

I'll address other reported comments first, and evaluate this later.
