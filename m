Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0113EEC0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760123998; cv=none; b=WFbuObyu9psXLIsYOkcSWYdnFNH84tKKNZ4E+XEzA+BvK3oQHyQnH8Vd/uBrIrHiPKO+n4HPI7V3enr8ZpydbWEFgYIUmwGwnw4bUOPbQos9Io3kX07FPC2yy7/dFqDeTuEg1p7ZZIcpD/nFq2oa++TKw/5O81fsdtTMUaZ5fJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760123998; c=relaxed/simple;
	bh=Mkb5LzcpvmQGxTJPg4k6KNWfbU1DA7RixhpKoofQnQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BmSNqkDU3gZBEKTYCYe703taa8Qq5/ygpvDUM62ekC9fbK+nobb/RzP0P5uuogp6CNh2HQ4AGPY3Qdp8hGoi3ahV4YGTN85+luWN/q/qnOVM1ma0nvy/l+YLby3fX/nXq5wq6nusXbl099pWMAZMVwJD8OPyb3Gn//rfXSHpL1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIxy5y7w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIxy5y7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F805C4CEF1;
	Fri, 10 Oct 2025 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760123998;
	bh=Mkb5LzcpvmQGxTJPg4k6KNWfbU1DA7RixhpKoofQnQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kIxy5y7wy6YNHRxZ9fVqVh9GNYuvfn6+JvUH92hQ4LcFqzbyp8Uu1lDTIITlnvEJt
	 4M3izynOi/PfqnxxCCnvy83L70Q2eCKcDs2ug5Bv8ljMWJQcmtMl2jU7RyZkLNQ+3/
	 ymR1DB9q55oJq2/uVfwLy5QjSJLeyO/ejnVENeJrE//cfSkzVcYyoitS9+tkN+3xMl
	 n2FcYZFfOird/c0CuIyJAcXAsWbP90X4sRVZd4n6N3hMYRNh3m7dglaHBrnN46MaHb
	 ei8VX9F/An7/KjwFdxzATYNQOCQ2xztfCxfgPjP7wbpt6z8j6OGC/Tr/C4RME3Nef1
	 gJgBnyR1btUuQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 110/125] include/kunit/test.h:856:20: warning: initialization of 'long long int' from 'struct pid * const' makes integer from pointer without a cast
Date: Fri, 10 Oct 2025 12:19:54 -0700
Message-Id: <20251010191954.80120-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202510110139.QxBWTjZO-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 11 Oct 2025 01:59:05 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   5a0a5c1e0bffb2e9e03585bc8dc55d9f92cae922
> commit: 5ec355855dbc2d67587b6a10fef52c6cd3b1716e [110/125] mm/damon/tests/core-kunit: check target fields one by one
> config: sparc-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110139.QxBWTjZO-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110139.QxBWTjZO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510110139.QxBWTjZO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from mm/damon/tests/core-kunit.h:15,
>                     from mm/damon/core.c:3165:
>    mm/damon/tests/core-kunit.h: In function 'damon_test_commit_ctx_ensure_target_committed':
> >> include/kunit/test.h:856:20: warning: initialization of 'long long int' from 'struct pid * const' makes integer from pointer without a cast [-Wint-conversion]

Thank you for this report!  I just pushed a fix to damon/next tree:

https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=086721e9d7d06e4ea77cc4a5706fc5ab217753bc


Thanks,
SJ

[...]
