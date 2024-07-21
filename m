Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52DB944E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721577996; cv=none; b=q5YdCTIpkuwJXWhoOM0u1t+yeBo/zGI78gmJETmFy7hSiobbgeDNu3P4sPCj/cOtSdA/MwkvcFmU2BSctGJjBIjXpCZv8H0snkVKP8pOHxOyiKDc5FlvGf8GxP69xKC50mC9smAIoSb4DmYR8+gzZykW71JdX+adJ2FOzHiXr8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721577996; c=relaxed/simple;
	bh=3iELKO4MF12yRRE7BNoUJWpgNNO6yzZjTNuBT7Gw+N4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qQbff1yRQtzg9lF3kS0tB+UBxyt8/qw+Dhaiopk1dNYt2eCe1f2WnVM63Uqf8yjlK3Dbd8oHi/4PHu8q7Yjv9SKs9ROzbHzSbkaLzwm15zrK+lpYznzuw3CznJFTB/rUOWnniZRhfKr4GHC3XkHaQv94q0X/QXdLSEqc6B6N0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0WzIery; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0WzIery"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061CBC116B1;
	Sun, 21 Jul 2024 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721577996;
	bh=3iELKO4MF12yRRE7BNoUJWpgNNO6yzZjTNuBT7Gw+N4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0WzIeryh3i0U8apixpH4PQfgc9glRgziQ1tl/WgDq+1IAj+lC8zfFuoXh3CV6YfZ
	 90WDkHWtuROs6vTrKf2UvB0zf5GAkpFIGQCbCSzt/d7/Y6yFnbhG3wOCFzgdqs6bii
	 N3k4SBeDZXDuAtEWBJkRiVwviqZzU0q/+Snfu9KVUjv4PCF5P8Rgh2bjBkPuX8nnb2
	 LZP1jLqcObxhMg9x0Jpu30QnitafKntVf7lXYRd3pVsgaX9ijU32bSOReagNVySaRY
	 O2xDigVzBRdGVrYOOlElUCnToqpOlsGXWxDyeaM5mOuefgUy+2DwL6nzfWDN0Q5QUu
	 DCISBMYr8gsSQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 53/56] mm/damon/tests/vaddr-kunit.h:82:undefined reference to `kunit_try_catch_throw'
Date: Sun, 21 Jul 2024 09:06:33 -0700
Message-Id: <20240721160633.357449-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407212029.0FGR4ymI-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Sun, 21 Jul 2024 21:09:06 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   c3004f235d68aa890660b532b04714a40abafd78
> commit: dfbce92b00bf8691cb86026352354792271c39f5 [53/56] mm/damon/tests: Rename test files to have _kunit suffix
> config: i386-randconfig-016-20240720 (https://download.01.org/0day-ci/archive/20240721/202407212029.0FGR4ymI-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407212029.0FGR4ymI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407212029.0FGR4ymI-lkp@intel.com/
> 
> Note: the sj/damon/next HEAD c3004f235d68aa890660b532b04714a40abafd78 builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
[...]
>    ld: mm/damon/vaddr.o: in function `damon_test_three_regions_in_vmas':
> >> mm/damon/tests/vaddr-kunit.h:82:(.text+0x106c): undefined reference to `kunit_try_catch_throw'
>    ld: mm/damon/tests/vaddr-kunit.h:86:(.text+0x11b7): undefined reference to `kunit_binary_assert_format'
[...]

Thank you for this report!  I think this is same to your previous report[1]
which I added a fix for that to the tree and replied the link to the fix?  So,
I guess there's no action item from my side.  Please let me know if I'm missing
something.

[1] https://lore.kernel.org/202407202132.JxTrdrIU-lkp@intel.com


Thanks,
SJ
