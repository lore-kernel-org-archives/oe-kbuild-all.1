Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2064586323
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457883; cv=none; b=B/R+ddLU7i5pQb0PHwzni1AsBglr3r/FSbnl6RH4GI/E+ePFt5fmiK0tukJmRu9khgBpZZxv2BoSBR01oAyM4bfM9zrA7ovYaPk1l1fT6RZXCllhDGyR7TkYhDwDP5pTYrGRigGMamwH92IYeqTkXY+rZRdkKQGx+iMwaTgyg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457883; c=relaxed/simple;
	bh=sP3VDy6sbZ9C6gDj7ZTR2vY4rl83eflQ2u95ORq5hoA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DN5pgxUC8+V0wHDiW8GlnrGTCtyudUmW63TbHh9UmrSvlngUspbF+EuVtJ3aLcaev7/C4Uq/9orCQEHpDLiq64peEUiKW3mVjM9qjlQb+19c8h7AD3LNxxN860vbfuYRwFaTBcgY09hcET6ZCe5cwPsRUUfbqsJp61mgK8NAyNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MQbTTlUz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MQbTTlUz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CA1C4CEEB;
	Wed, 28 May 2025 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748457882;
	bh=sP3VDy6sbZ9C6gDj7ZTR2vY4rl83eflQ2u95ORq5hoA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MQbTTlUzSEgQnwV7ZSVem+51bi6cTtdUn6wNbP/uGsOMC5L0nV6tKC36cUjVlc9Hu
	 58snRK4YnZEIykFhfAwjK0JXO9GaS+pT2B0RWmUSVuInuNCIt6+kxi4LAB98PkqA00
	 ml0N9T5tp7vk4jOOw4RDiyhY2Re+fdLgZNlf0F/k=
Date: Wed, 28 May 2025 11:44:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shivank Garg <shivankg@amd.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>
Subject: Re: [akpm-mm:mm-unstable 36/67] mm/khugepaged.c:2337:7: error:
 implicit declaration of function 'folio_expected_ref_count'; did you mean
 'folio_ref_count'?
Message-Id: <20250528114441.abd8980f1d66fcb3e1eaecc2@linux-foundation.org>
In-Reply-To: <d2ddc44a-19ae-4e4c-90a4-f4ec05558d74@amd.com>
References: <202505282015.F0fVmLmH-lkp@intel.com>
	<d2ddc44a-19ae-4e4c-90a4-f4ec05558d74@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 May 2025 18:04:02 +0530 Shivank Garg <shivankg@amd.com> wrote:

> On 5/28/2025 5:46 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   52ce652e7ab0f015b51fee11b2862507b2c0c25d
> > commit: 3bdddbba5f02f6d97283acb18e2a6e079324fe4b [36/67] mm/khugepaged: fix race with folio split/free using temporary reference
> > config: arm64-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 7.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505282015.F0fVmLmH-lkp@intel.com/
> > 
> > Note: the akpm-mm/mm-unstable HEAD 52ce652e7ab0f015b51fee11b2862507b2c0c25d builds fine.
> >       It only hurts bisectability.
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mm/khugepaged.c: In function 'hpage_collapse_scan_file':
> >>> mm/khugepaged.c:2337:7: error: implicit declaration of function 'folio_expected_ref_count'; did you mean 'folio_ref_count'? [-Werror=implicit-function-declaration]
> >       if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
> >           ^~~~~~~~~~~~~~~~~~~~~~~~
> >           folio_ref_count
> >    cc1: some warnings being treated as errors
> > 
> > 
> > vim +2337 mm/khugepaged.c
> 
> folio_expected_ref_count() is introduced with this commit[1] and merged into mm-* tree.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-unstable&id=86ebd50224c0734d965843260d0dc057a9431c61
> 

Well darn.  We have a patch in mm-hotfixes-unstable which is cc:stable
(mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch)
which is dependent upon a patch
(mm-add-folio_expected_ref_count-for-reference-count-calculation.patch)
which is scheduled for 6.16-rc1.

I'll move
mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch
into mm-stable, after
mm-add-folio_expected_ref_count-for-reference-count-calculation.patch
to remove the bisection hole.  This means that when the -stable
maintainers try to backport
mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch
into earlier kernels, the build will fail.  When this happens, please
work with them to come up with a version of
mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch
which is suitable for 6.15 and earlier.

