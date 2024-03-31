Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386FE290A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711914585; cv=none; b=FHjs0SD9TG9iiIbHlpQBFoyP2gU22Oa6YEfa2OvrFgSWY65s+ioqhOCol25dYCe7w1/Rf3mm6GmJcbUIb+8dzgeLLWOKsOW3g0cyb5zI2D5EcVOeFG1hpYxUS9ybSg7M53/H1w9416YvP4L0oblu4LcbQN8FtbeLl1ylV6bhuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711914585; c=relaxed/simple;
	bh=DqoZ7l380fRg1aIQUg//KhvRQp0sC6rQUMzdUAOGu4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKSe6fb5M8CvG5V9BV4EO6mePgaftk+qBpYtbdQk6dPry1MORQXCDOIRM44T7/p2FUgc1Ks3oCC9MYx7u23F07oaY+kN+VEDiVSB4EUNItPJIkpMnXSm/wZ9kPVVmzxKIUMszn3ILBnnhLjA5HKEB3DQoaoJPKb60/ob+Dr9sps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0mx16C4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0mx16C4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67159C433F1;
	Sun, 31 Mar 2024 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711914584;
	bh=DqoZ7l380fRg1aIQUg//KhvRQp0sC6rQUMzdUAOGu4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0mx16C49i2yf5lxCX+cvrZvaWjbCpdtBQGi0vz/2E87M6gNp5QBNegeG42Spj+DO
	 xO/svwjwW12sWn0v3NbclN5cFTs/MDWYzguhoubueI52pA1xEVsiOQOohPNsKH9ZhK
	 lY4RJwxSiOpS8ks94i67oLO6dxP3BA//ivTRfW315vOjWlZbFlRaPu1IrOs/8ZT+NC
	 rZq//7lJ3syfsJQkbBrWNWtdkVnBylpIe6pLw7tTzIDso9T3PQOQli6fjtWfrSzB8K
	 cMFbNePMvFi6SSJyx3vIQEGkQURCvwq1cPdyGng1YYJE9/DLGtrrnPVarSqsxb9uT7
	 pE+kTkJEJg1Qg==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 3/32] .meta_changes/M9DezupS: warning: ignored by one of the .gitignore files
Date: Sun, 31 Mar 2024 12:49:42 -0700
Message-Id: <20240331194942.239760-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202403310657.0az9Pf4T-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Robot,

On Sun, 31 Mar 2024 06:12:57 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   694c5d0b7f0af673991cf9d6c834acd9819cc41b
> commit: c775b94618c181ff6ba088361cfdc5cd64c7407c [3/32] === temporal fixes ===
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240331/202403310657.0az9Pf4T-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310657.0az9Pf4T-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403310657.0az9Pf4T-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> .meta_changes/M9DezupS: warning: ignored by one of the .gitignore files
>    .meta_changes/README: warning: ignored by one of the .gitignore files

Thank you for this report.  I fixed this by renaming the directory[1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sj/damon-hack.git/commit/?id=a4846efd0832aab6972a8703b2531648e6403b1d


Thanks,
SJ

>    tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
>    tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
>    tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
>    tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
>    tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
>    tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
>    tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
>    tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
