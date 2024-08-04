Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731471171D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Aug 2024 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722797990; cv=none; b=q8EGFI+cFkAUpXEm4xolqCrd2xr+vc0iwHLASnMoxAjHqw7Ws7dadIoNsc5LxjaRM05GTh7fC3SmzgZIXVwmIZEgct+MbqMAbHWIIBqVjyjuhrrPBvZSxrNiKlBWxh59XEWb+vTkI8EO1zZ2AzhrnvApj0Xdz53ihpa42x6gtQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722797990; c=relaxed/simple;
	bh=aMl99WseHh0IM3ViRQsXKyLmSZDNx2oH8bCyoiD1tF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NPwk7GMPwM/+mjd0735vws1biaLiuAjmeqMtgIDDkNCfc6yGWnRET/+acfOs1uoZk79kh75SmWT7JKtVogaLz8cKJM7PxHixAXEe1tHo6NZ+VqTtIsb8elXGUjWHoxe8558U2ILU45w7UdILdBHEBI7nteHnO69d18QWv8iDdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXC4ceyO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXC4ceyO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA19C32786;
	Sun,  4 Aug 2024 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722797989;
	bh=aMl99WseHh0IM3ViRQsXKyLmSZDNx2oH8bCyoiD1tF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LXC4ceyOgLHdGQB8zpSB86atAZIvdyX3iRej9ztSe127/VOetvr3rGwLQPOwslmEh
	 kDlzV52c2R3Oezp3mMUOp0rwtsiTWE4YtON7J/VIwwvNoPik7xb6M3uifso8Ra6CFe
	 5BCrG+OO7v7WMwqXt1qzv6GePbRnWFH2jF3qNVjTed/FDXmossd4N6gBD7Glq0B6ez
	 RSllh8NVerMHFJY2bC5+l4tmsIEU/x2vPTGoir3gIaezV3omWG7HR5Uoms9C6tijKN
	 bq9DjqW6BjfsXbmpfHa0vNXexCe6jA3iQvEUsA8TMvLYJ3jGcZfziz1K1lxReTB9Br
	 3IlVPWANL8v2w==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 36/44] mm/damon/vaddr.c:311:22: error: implicit declaration of function 'pmd_present'; did you mean 'p4d_present'?
Date: Sun,  4 Aug 2024 11:59:44 -0700
Message-Id: <20240804185944.92344-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202408040440.Oe31R40L-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi robot,

On Sun, 4 Aug 2024 04:54:56 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi SeongJae,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   fec73193b080d068291509554d3e4b21622ede2d
> commit: 069dc62c4181e3c1a10fa833c176b52765c05564 [36/44] mm/damon/Kconfig: select DAMON modules to test when test config is set
> config: arm-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240804/202408040440.Oe31R40L-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040440.Oe31R40L-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408040440.Oe31R40L-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/damon/vaddr.c: In function 'damon_mkold_pmd_entry':
>    mm/damon/vaddr.c:307:13: error: implicit declaration of function 'pmd_trans_huge'; did you mean 'pmd_trans_huge_lock'? [-Wimplicit-function-declaration]
>      307 |         if (pmd_trans_huge(pmdp_get(pmd))) {
>          |             ^~~~~~~~~~~~~~
>          |             pmd_trans_huge_lock

Thank you for this report.  This specific issue can be fixed by making
DAMON_VADDR_KUNIT_TEST depends on MMU, or select MMU.  However, I think this
might be abusing the 'select' too much.

I'll revert[1] the commit and consider adding '.kunitconfig' file for DAMON kunit
tests, like others.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sj/damon-hack.git/commit/?id=ef79e03b2a6355bd234cf611e5ad55f4f379fbc9


Thanks,
SJ

[...]
