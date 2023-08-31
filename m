Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B6210FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 02:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DBCC433C8;
	Thu, 31 Aug 2023 02:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693448122;
	bh=L0lMXUfo3BFcwZc2dE9trYeiKcYdxRq4cBHj8MEvdjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GVjWugQVBklJXsNJBNWA6MBi1cR8xiT3i61ArumufZpxj9/NTYoS97kyySkDpXDhT
	 toM+xYEq5V2lKWCqF1rfHTTK6gmVlj+gKdl1b1Iuy9xlFv5WcJXaQylJddvcT6CCCb
	 uUInxM7SQDV6IGTDE1CiNGhi6wUxSOk5JV4bFS6rIfBXfDK/477+G7LGIffAWpX9Gx
	 H+PUUZlO1l5cjOCpze4avZtp1Wm8PSOjzEXmc51u6CfIqKaw3EkZYh96UpkyOyKXMH
	 DCycbZzyiaBzpRxVsgOh4N/es42XDd/2BznFZ8aKHihct6LTv2fSPtFgcBs7V1X/Z5
	 gLlN/eRaOA/Qg==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 33/46] mm/damon/core.c:1612: warning: Function parameter or member 'r' not described in 'damon_update_region_access_rate'
Date: Thu, 31 Aug 2023 02:15:20 +0000
Message-Id: <20230831021520.35355-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202308301305.GdlrAUWM-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robot,

On Wed, 30 Aug 2023 13:31:54 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   15d82784a3f9e2e8a4c635de097a86ddc744845d
> commit: 2ca3eed468aa3862415dc3fee90bba1b46f7cc2b [33/46] mm/damon/core: define and use dedicated function for region access rate update
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308301305.GdlrAUWM-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301305.GdlrAUWM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308301305.GdlrAUWM-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/core.c:1612: warning: Function parameter or member 'r' not described in 'damon_update_region_access_rate'
> >> mm/damon/core.c:1612: warning: Excess function parameter 'region' description in 'damon_update_region_access_rate'

Thank you for finding this!  I will commit-amend the fix and push.


Thanks,
SJ

[...]
