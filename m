Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6922391E7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986481; cv=none; b=Ugl8+RYNlnLGrNitDSeVD9djd/yqbGeZg5XMJltq9LxUj4l7eXjvZj4/yRQjlOmu9JH5Fr2uYqj0Nv15ZlvcI7dNftYirsBe9RRIoGaV4o2Q0tk0p4uZsAg6c5YCmrwEORmMubAsLrixRegeQ4Y1ujmmvoz19TJMZyQD2GHfa6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986481; c=relaxed/simple;
	bh=SNSu9m4HG44VQucogooWZrEum7WWEOLEKQTSsEr4hWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaLgtctJeNPLU+iLoOMoB9/Da/S+pS8tTIPqM1Skd14dS8JFxHeTMQk7yJIDwxxKWQ2M8/0AGaOfJ3/jXBKmWPiuecKfEMIzic/9j1gU8HAmiMvP1jFi0p6GiwnBV2QC3Z3JfTuvNr2CdFpfDLvl4DPktJjHgBEdQuIpC1MtUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eo4xexj7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eo4xexj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5A4C19423;
	Tue, 31 Mar 2026 19:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774986481;
	bh=SNSu9m4HG44VQucogooWZrEum7WWEOLEKQTSsEr4hWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eo4xexj7kqwkJyDjJdTL4pwxWamJyfLWe40wsDC3OLgG+hCXWm858C6j6xbetobcA
	 I41zgipyQH8vm6IvnC8H9neJvL5S2j84HrZi6lAdchfIgE7UeDDvmMPydYIhJdKCTh
	 KOohJpM2qjFqah92ezga4Sbqt189fO0LpRsrLjUM+qESlP5iyC5mUg9nX02eeAwwP3
	 eaN5BFnBqc+7vFsWhszMVZmyQY+Ql0XhOuB7HY5Qb0nPVM5qo431K8ZjFl6ULakkV4
	 qVMKXouIl8G98hgsIj97m1Qi0HfWMDwtOxsRUOTTwczn9wWugTLn2lLk5VqqFAGHUv
	 3NRYsJM+jm/Ig==
Date: Tue, 31 Mar 2026 12:48:00 -0700
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [kees:dev/v7.0-rc2/obt 6/6] drivers/misc/lkdtm/bugs.c:835:17:
 sparse: sparse: cast truncates bits from constant value (7fffffff becomes
 ff)
Message-ID: <202603311247.F1B3A67@keescook>
References: <202604010149.X24fVPZ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604010149.X24fVPZ0-lkp@intel.com>

On Wed, Apr 01, 2026 at 02:06:25AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
> head:   e5a10c0ef1457ad3c713a1bbe087da2b407d4722
> commit: e5a10c0ef1457ad3c713a1bbe087da2b407d4722 [6/6] lkdtm/bugs: Add basic Overflow Behavior Types test
> config: arc-randconfig-r121-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010149.X24fVPZ0-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010149.X24fVPZ0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604010149.X24fVPZ0-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/misc/lkdtm/bugs.c:835:17: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ff)

This is by design. What's the right way to make sparse ignore a value
like this? (It appears to be seeing through the "volatile" qualifier.)

-Kees

> 
> vim +835 drivers/misc/lkdtm/bugs.c
> 
>    819	
>    820	static void lkdtm_OBT_TRUNC_TRAP(void)
>    821	{
>    822		volatile int big = INT_MAX;
>    823		volatile int wide_low_value = 5;
>    824		u8t narrow_low_value = 0;
>    825		s32t same = 0;
>    826		u8t small = 0;
>    827	
>    828		pr_info("Performing same-width assignment\n");
>    829		same = big;
>    830	
>    831		pr_info("Performing small-value assignment\n");
>    832		narrow_low_value = wide_low_value;
>    833	
>    834		pr_info("Performing truncated assignment\n");
>  > 835		small = big;
>    836	
>    837		pr_info("FAIL: survived overflowing truncated assignment: %d -> %u (ok: %d -> %u)\n",
>    838			same, small, wide_low_value, narrow_low_value);
>    839		pr_expected_config(OVERFLOW_BEHAVIOR_TYPES_TRAP);
>    840	}
>    841	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Kees Cook
