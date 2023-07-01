Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2B73C3E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 17:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEFDC433C8;
	Sat,  1 Jul 2023 17:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688232831;
	bh=Qi5+rCo5OSESL3irx8I4QH5zyYOpnqET3mj+YVVIX6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hH2Ew9rqT0hEJWUwUYLvFvCg93MYTQOj4X3hBQKdUTQwj66azXq3lstSYLXrKPPyw
	 1p+lJh3jXaAqByaHpha4yhkoFU/j3eeRHZQDY+G8Q8sF8E1GfPxqrtynk7OAVrjPJf
	 Ciy5riJoupw6d+lFaP0R9QDN25BPNv7bO0DAwr7NyxHCgDF7Ck6Iaq/ftxED9unuTY
	 HM9mT5x3U4Pw5+KIY1v2YOCZK9Yy0nMHrA7HtKTcjqdGiaeq+RFqowbm7TCwrT7mhw
	 QgM694Rz9D2ZuwAS2zdR0/9ZPvgs+Bysp+icTExAAkO3AgVQ4Vn1d9XPU96Wm3P027
	 7Q93FxQZrBqRQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 33/35] mm/damon/core.c:290:1: error: function declaration isn't a prototype
Date: Sat,  1 Jul 2023 17:33:49 +0000
Message-Id: <20230701173349.47733-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202307020030.tSDmtlai-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello test robot,

On Sun, 2 Jul 2023 00:55:44 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   b5a2d90d9d7d15714ca1dfb7bb74043ebd2a28d0
> commit: 0389f4cef6f76094d3b2aed5bece0a4036dd859c [33/35] mm/damon/core: Implement moving_nr_accesses update function
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230702/202307020030.tSDmtlai-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230702/202307020030.tSDmtlai-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307020030.tSDmtlai-lkp@intel.com/
> 
> Note: the sj/damon/next HEAD b5a2d90d9d7d15714ca1dfb7bb74043ebd2a28d0 builds fine.
>       It only hurts bisectability.

Thank you very much for this kind report.  I indeed fixed up this but didn't
squash the fix to the buggy commit.  I just squashed the fix into, and pushed.


Thanks,
SJ

[...]
