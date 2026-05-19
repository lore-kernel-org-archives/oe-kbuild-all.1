Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C187623EAAD;
	Tue, 19 May 2026 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779150968; cv=none; b=fV8Ghr2CqX43ogIMbTy0WnUB9WE/qzI53cfMbdxc7Uik0yp2XVvyHsKebVb3rT5Lc1IwZUtjcMSfVw1X138JlPizPmKZ2cVsAV4sn6ctJexcQAbBKOZTvSX+zKjBwyiV8v2FLO5bCuzh7Y+zpefo+B7ShbOS4/chy07nPJyeVfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779150968; c=relaxed/simple;
	bh=owBd0P0lMA93py2CTXoS7sE422LrV+LBEo2KaUK1wvU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EEL5gKIdpExg5jwObIJdiT3+xxDOeM1UpZSpqdtSvN3flZX5x33234lssHO91Uw4foarx11mAdVM/xWhPfYLlbxZAFFxn1A8/gCf1tTTGpIvzyUi6MjOWMqwm1zKr+/ZJ7FUUM3jyEkjU/YQtkXEeZOVXOw2KTnH1lq8imr+PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Wd84Ncl1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Wd84Ncl1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2731FC2BCB7;
	Tue, 19 May 2026 00:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779150968;
	bh=owBd0P0lMA93py2CTXoS7sE422LrV+LBEo2KaUK1wvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wd84Ncl1cKfRDwH/wi6QfTzzmChXx52Wgx8SMIiE3jURiN3qUVIWT066jjas+BOqa
	 tkp502xzXuiZ7hClg2eXZiBop5bFw9/Wthm/tc29S268FiI0sgVLbtmbsdnns7ByB2
	 y+YWrLEM8TWv1ZGqyPgKfyRR8KaFSpEqUA0Ug5DI=
Date: Mon, 18 May 2026 17:36:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: wangxuewen <18810879172@163.com>, david@fromorbit.com,
 qi.zheng@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/shrinker: simplify shrinker_memcg_alloc() using
 guard()
Message-Id: <20260518173607.c250f771be2baf92fa471b2d@linux-foundation.org>
In-Reply-To: <202605151100.lH0pRo2I-lkp@intel.com>
References: <20260512085546.368911-1-18810879172@163.com>
	<202605151100.lH0pRo2I-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 11:15:40 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi wangxuewen,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on v7.1-rc3]
> [also build test WARNING on linus/master next-20260508]
> [cannot apply to akpm-mm/mm-everything]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/wangxuewen/mm-shrinker-simplify-shrinker_memcg_alloc-using-guard/20260515-014803
> base:   v7.1-rc3
> patch link:    https://lore.kernel.org/r/20260512085546.368911-1-18810879172%40163.com
> patch subject: [PATCH v1] mm/shrinker: simplify shrinker_memcg_alloc() using guard()
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605151100.lH0pRo2I-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151100.lH0pRo2I-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605151100.lH0pRo2I-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/shrinker.c: In function 'shrinker_memcg_alloc':
> >> mm/shrinker.c:218:17: warning: unused variable 'ret' [-Wunused-variable]
>      218 |         int id, ret = -ENOMEM;
>          |                 ^~~

Something went wrong here - that patch *removes* this definition of
`ret'.

https://lore.kernel.org/20260513075214.2655710-1-18810879172@163.com
