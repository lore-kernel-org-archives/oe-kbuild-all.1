Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42F290A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711914511; cv=none; b=O/jheZteSN/5qpIOv0xRxAZyg6vGMrNJMKDtoQpy84swhmotLIZlf0fhPH+f7MzXjSGol88wmrbD11wnUuJtHAoB+OS/4rrc/YzXkpuRofHx9Kxvj+AD2aV4QIYvxoHQh8jkV7vs+xwXlxBRhpzeKMTpLZU60SovN1a1t2pTrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711914511; c=relaxed/simple;
	bh=oQLCqoJkJ34/euNPhEIETAN93RLSs3JGK8hhPS8BDTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DzYQ9wzMfFiTIwsq50T3PTqtSFyrv9/3Sm/HTrmTMpJr9KmQT7WtpAfZZzJv8FZ/ZlNaAQJe3zV49TfqrjY9jB5mqJBeN2maSOAdi+/oC1v/a/ne4bTlmjmKMEIZZh3/B0bOQJIUHt9m3PSpaLIsw2tVrXHhpJtwvuRjAjajs+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrAQJMLf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrAQJMLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DF5C433F1;
	Sun, 31 Mar 2024 19:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711914511;
	bh=oQLCqoJkJ34/euNPhEIETAN93RLSs3JGK8hhPS8BDTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JrAQJMLfG2O5PG5kgSrc+fHbve7OF2q/R3vL5+ENMVy0ikElsZP+XNHU41gfj/sly
	 96CuT3dOGVFbBP8gJhRtfXMh+Ot8f+Nbv5sdAxM50bIUI7KJStis/fXUPCsvufjsOI
	 dC0T0990VpsZXJqsqtvBGDLA1YpAdmqXMk16yskkHSgIa0gQp/uApRizYPiY+mCShY
	 Q81X8h2rN8Mvcp6hboliooqf74rM/joG6wR/F+FmWo3jrKRk3EFFgdpRSBBH+jbFOP
	 US2G1wn0Uabpx2ozZiCDlQObdghPm7fkjvwT8gJCoJFMx1pJzRGuwqf9FtILp2OCjX
	 VXTxrEuHgtDIQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 1/32] .meta_changes/README: warning: ignored by one of the .gitignore files
Date: Sun, 31 Mar 2024 12:48:29 -0700
Message-Id: <20240331194829.239712-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202403310135.k9poitUB-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robot,

On Sun, 31 Mar 2024 01:22:48 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   694c5d0b7f0af673991cf9d6c834acd9819cc41b
> commit: 688645a98acf24321d0647007eff632c1b2f3356 [1/32] === mark start of DAMON hack tree ===
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240331/202403310135.k9poitUB-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310135.k9poitUB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403310135.k9poitUB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> .meta_changes/README: warning: ignored by one of the .gitignore files

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
