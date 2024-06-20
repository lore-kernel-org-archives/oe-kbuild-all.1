Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B8822EED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718911411; cv=none; b=jKwiDUGyCvC0yi1qXkgE0Pf3PTKPSl800j1Vuypl/6q5CErVK+GOKLrM7d0nSl3qEN3pFYcS+K5zCO3Eyotsljn9DUyCWvN8cxVkZO6B8jLvK3TbGOVldK2Udl6UVY9xrsqJJXCbJAZVKof3cxADf3+hd4BRCSM7glBFq+gxZ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718911411; c=relaxed/simple;
	bh=ZXrRnfC6Sf1jfkjzU8LbDZNNxsJaUJWD3WnM0/77Gxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fn0AhJaG1+le4A9QNaaC6i5Iwb8f1VH9h4ZJm+sSq/v9XCfQIXGvfhOIAaV1ka7vk3r5mDfOnDVuzNpHf/leevvFvrdTbR+Goho1uwsEF0oM6cKvlxv1rDsHZkunDTRjSS2/Zz5tSq2td5XgMFe9ktTyAcUHdjJgQerUKB4PyHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dn4nAwZ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dn4nAwZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD5EC32781;
	Thu, 20 Jun 2024 19:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718911411;
	bh=ZXrRnfC6Sf1jfkjzU8LbDZNNxsJaUJWD3WnM0/77Gxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dn4nAwZ2YVf0mUnjj0sDTFxAZAXyEytG+VeTYEOYzR0HFP5YHfZHQvHfiSDJ7kh+m
	 R8Q+6zOabmCqNiNnaQxCv37lxmGGSrTV4t5k8VimnRkGMHT9ssXPWz1KEDcS7y6b64
	 dwT88cszRGhI8ht3pO+Juxkf5zgEqSuBghTuukRZ6idYLS81A+QPfwKh31HqtGHIKl
	 aBl4jIh4OLu4NPOFgO9JZLTYjSpQgUpPIeDkiuamN3eHVPjVECks12roAJOeHoPZER
	 vFQsEUkLQ08pddcyUQVxUQ7//Hux3K7KodTw8hSMIK8vd1J88qBTImzHSVmqxLxDD5
	 dSKfTwe6SlEow==
Date: Thu, 20 Jun 2024 12:23:30 -0700
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [kees:dev/next-20240618/kmem_buckets-v5 1/6]
 include/linux/slab.h:662:78: error: subscripted value is neither array nor
 pointer nor vector
Message-ID: <202406201222.BC51BD41@keescook>
References: <202406201723.BsMQJXcF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406201723.BsMQJXcF-lkp@intel.com>

On Thu, Jun 20, 2024 at 05:21:23PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20240618/kmem_buckets-v5
> head:   c823e15736071e9b694fc62be0c80cbda6a4e344
> commit: ac6eb1f5df288a356e73ab40d393a52cc2ec3ed1 [1/6] mm/slab: Introduce kmem_buckets typedef
> config: m68k-alldefconfig (https://download.01.org/0day-ci/archive/20240620/202406201723.BsMQJXcF-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201723.BsMQJXcF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406201723.BsMQJXcF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT' undeclared here (not in a function); did you mean 'CONFIG_LOG_BUF_SHIFT'?
>       10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
>          |                         ^~~~~~~~~~~~~~~~~

This appears to be broken (-next?) build unrelated to the
kmem_buckets-v5 tree (when I revert all the changes the build still
fails).

-- 
Kees Cook
