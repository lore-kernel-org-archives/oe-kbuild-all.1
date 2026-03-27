Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A9433F385
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608945; cv=none; b=PIvAjdneUw3S4iRqh4SaI+vvGlV2MVBe/vC4kGJl5jfsjqxq1YDyJp+jl8JKI9/3wkAvgVV978AaAb+k0ErQORfxyIQOyNVUOSgKR2p6+dLHvRIkfyYtbBXWXiW5wkTwkxBZn34a6gZ0FYmM0kZ6XZmFIgRrMwkfJ72e3mRD2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608945; c=relaxed/simple;
	bh=OnNZiU3/2JpKPliKEYeVbD7OBy40yJs15/jP7cJER64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FonhFTskqTeu/uNx0XoCA9+AgkZS/8UN9zZD+b2DDcGKnN3UgV2Mln0d6XSXXYkst+qRlOxMRwBMyRVD3Ej0IERK1DWh7n81XHfzzmb3bhQwNTgYb57YWRVF8GA6ueyb5FY6N4TVXB+lG33f7pwTEOOCFGiLfrWtcUABj4tw6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV0km1q7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV0km1q7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D2EC19423;
	Fri, 27 Mar 2026 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774608945;
	bh=OnNZiU3/2JpKPliKEYeVbD7OBy40yJs15/jP7cJER64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fV0km1q7L/8x60xynQ3CoZH0kgAWkgwF7yWKaD4IULVH30RF3gEnspxV31EsHRkSc
	 xNFKruMCKBR6P5YBqTaKdA+I/XrD1HtzXvs76vQglGg0GqOY0ws9cFveGJlv+eh5uq
	 cav0c91sLFKChj/bJMgRu4z4eN5zU8fQs7NjoFvYsV720rL460ckXsNw5OXh1ghcle
	 /7lKwWng2C6VCn/AoRSBzimyA2MEroigRat4FzYfxUIosr35SfL5wEUkloeiWZ0V1m
	 CMDba15ct+hJCvoI66VEqCLkugjZeV+TLxMiz5lJb4uAKKy6Nsy8nijLmX5pmINyYb
	 GGc/P8aIztC0g==
Date: Fri, 27 Mar 2026 10:55:42 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Chris Down <chris@chrisdown.name>
Subject: Re: [akpm-mm:mm-unstable 199/330] vm_util.c:127:14: error: too few
 arguments to function 'pagemap_scan_supported'
Message-ID: <ea001104-8f08-4175-90cf-f667f703b5bf@lucifer.local>
References: <202603271115.uE9vpppi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603271115.uE9vpppi-lkp@intel.com>

On Fri, Mar 27, 2026 at 11:20:28AM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   74dc4627271e6e367176b519565e901ed72d6e4c
> commit: 9652b82ca963243fb80e645319d473a7dc65ee79 [199/330] selftests-mm-add-uffdio_move-huge-zeropage-pmd-regression-test-fix
> config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260327/202603271115.uE9vpppi-lkp@intel.com/config)
> compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271115.uE9vpppi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603271115.uE9vpppi-lkp@intel.com/
>
> Note: the akpm-mm/mm-unstable HEAD 74dc4627271e6e367176b519565e901ed72d6e4c builds fine.
>       It only hurts bisectability.
>
> All errors (new ones prefixed by >>):
>
>    vm_util.c: In function 'pagemap_is_huge_zero':
> >> vm_util.c:127:14: error: too few arguments to function 'pagemap_scan_supported'
>      127 |         if (!pagemap_scan_supported(fd))
>          |              ^~~~~~~~~~~~~~~~~~~~~~
>    vm_util.c:70:13: note: declared here
>       70 | static bool pagemap_scan_supported(int fd, char *start)
>          |             ^~~~~~~~~~~~~~~~~~~~~~
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

See https://lore.kernel.org/linux-mm/815b2fc9-cee7-4bfa-8036-4b93d1b47b4e@lucifer.local/

This is because of a broken fix-patch that stuck around after something else got yanked.

Cheers, Lorenzo
