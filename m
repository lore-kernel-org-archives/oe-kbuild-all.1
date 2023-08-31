Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B46F15A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 03:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D24C433C7;
	Thu, 31 Aug 2023 03:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693452924;
	bh=VFzpEwMePRoX19ea0aOpQ7xXCJsz/LiXMAAueEikNpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bYzaRTKuzqNGfaJlO16OMwmuIvitmXF+XQX1CcS7i8fD1UsJ4Qk0IiUzU9loID0WS
	 eCCNo6bhP2WR5F+MnaRleLs7W3+u1ZYfz/z21eOX12UlfUTEGb8Q6aee0+4C/N9ZUr
	 dcDILQSuZmAzf4ZwcyS2iMWQCo4kS0+CbYbwVPNMD+n+OxNZzFR9n1aQb+9ynptVc0
	 134uJ2kEPWknUrrmm+xIZxq61oClB9/wjbOZnEwSs3KJVYiYF8OWOqr96Ug+zKmuvS
	 I38HFnj7JxVXYjqzjDPBhs+XGV206aC2agon2kAQuVEdH/G0GoonvVMYzfO372ZXJM
	 bouTcTaymI5OQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 34/46] mm/damon/core.c:1622:14: warning: no previous prototype for 'damon_moving_average'
Date: Thu, 31 Aug 2023 03:35:22 +0000
Message-Id: <20230831033522.5408-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202308301445.rW2NJlWP-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robot,

On Wed, 30 Aug 2023 14:36:08 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   15d82784a3f9e2e8a4c635de097a86ddc744845d
> commit: 567e50270a93eccf0faaef76ec6e5443d7adb4b0 [34/46] mm/damon/core: implement a pseudo-moving average calculation function
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308301445.rW2NJlWP-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301445.rW2NJlWP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308301445.rW2NJlWP-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/core.c:1622:14: warning: no previous prototype for 'damon_moving_average' [-Wmissing-prototypes]
>     1622 | unsigned int damon_moving_average(unsigned int mvavg, unsigned int new_value,
>          |              ^~~~~~~~~~~~~~~~~~~~

Thank you, I will amend-commit the fix and push.


Thanks,
SJ

[...]
