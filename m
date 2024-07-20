Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C501487DC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721500129; cv=none; b=JoFz2NQPYVAErWC/cBf366APctXEl032R/uy+7i+JUJtE5Li2RWggLO4e3LUQcDOt5mcRoU9ihU8h7RUcFHJYsCnBtp8+aOMsBN8xUOprzb0A3S9lbGJ/hN2u/VQS5x3SRjsansH2YHPv45BdkawnVVm5C9ZFEebCrw9OQ3OIyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721500129; c=relaxed/simple;
	bh=thGu0zUBfnpaG3Jqv3xOFDaiSxZwLxvJDFXh5ED0b8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tTz/1utw8QITd2B5fQLTA5KNOUV96dRZus/KqQlzdpdUeTWqfFfzlLxFBMgzZhGkomk2IwxHgWq2Hwjhrh88ZSePimredNlIdgvwZjcFBHxhgfQaEcQJ+YEHJy9M/bTEXYB4SGxqX2gh4yYnNhR2+KVkVLuH3vrgR9mGs4pGWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inrLS/rT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inrLS/rT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65137C2BD10;
	Sat, 20 Jul 2024 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721500128;
	bh=thGu0zUBfnpaG3Jqv3xOFDaiSxZwLxvJDFXh5ED0b8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=inrLS/rTduDIzUblhrpB+wW7Yk3+Lcpo57rKUbPQP4ClNCc1zSHTOS23OU83ylQ31
	 d2Xe1EEM0yzlxKnoIUkkvShMIUfetqggL85dPcDpMAn/YLmLZNO9HP0hax/8l6Mpdw
	 5p+goB1HDDgjLJn1WRLSALBx0gGelrSJtkW0+pcfrVhbNZKfQYudGlo5IQ/1ilrSrq
	 h5Pvx6QDSaGrcNH2FD7B7vVEGFDMe8Z+UA+FwRGdi19ZwWjZLaipzspplfEvjmK+Zi
	 1aSH6kwv0Rz0AnKcrZwWzn6I51vNh9/qE4vJgTJibsJYjiMdlcVKxOtUCE6+tXmous
	 PAEzOU3ZHMlzQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 53/55] mm/damon/tests/core-kunit.h:394:undefined reference to `kunit_binary_assert_format'
Date: Sat, 20 Jul 2024 11:28:45 -0700
Message-Id: <20240720182846.338785-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407202132.JxTrdrIU-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Sat, 20 Jul 2024 21:40:37 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   8fc85b06e0de8c68ae3886178818c03d6eced514
> commit: dfbce92b00bf8691cb86026352354792271c39f5 [53/55] mm/damon/tests: Rename test files to have _kunit suffix
> config: i386-randconfig-015-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202132.JxTrdrIU-lkp@intel.com/config)
> compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202132.JxTrdrIU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407202132.JxTrdrIU-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: mm/damon/core.o: in function `damon_test_moving_sum':
> >> mm/damon/tests/core-kunit.h:394:(.text+0x9c5): undefined reference to `kunit_binary_assert_format'
> >> ld: mm/damon/tests/core-kunit.h:394:(.text+0x9d3): undefined reference to `__kunit_do_failed_assertion'
[...]

Thank you for this report!

The commit that you found actually introduces the errors, but that's just
renaming the files, which changed the error texts.  Seems the real root cause
of the errors are commit 06463781fa14 ("mm/damon/Kconfig: select DAMON modules
to test when test config is set").

Pushed the fix with more detailed root causes description.
- damon/next tree: https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=c3004f235d68aa890660b532b04714a40abafd78
- damon/next patches queue: https://git.kernel.org/pub/scm/linux/kernel/git/sj/damon-hack.git/commit/?id=63b91243a4c3e57262ce92e82d964f4dde26cbc6


Thanks,
SJ
