Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085163D994
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748216493; cv=none; b=oMzJfbIvgxmFjUJDi6WK/yNNXtO1TxnObezMfBW0GFx14TFtRon4/n44dfhEeljfDv7zoQRlh0h88xCuAmMOeBqeLptRnN8r7ecAdMB2NWOMe8VVcQfi4upvilpnIx/6exSN1E1jdynYR4HgH4ZPQgPL/Kz15b/sBMWkI5Z2EbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748216493; c=relaxed/simple;
	bh=/1OCZWXakaQXrysrUfKAapFkFMlgyy6i+ftHfIyYiWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mDic/AZn8i2qudzdvuTMaUmLgjwcgB/3ji5T21PuPH/1LxsZ/pxyFVXTwFkBS8M/wXxy+KgNezt/Y1pK2tPsWzFlDVeORSct14hc1p9BYD860ABFT5GjnBcdb6lX84BuM1SRpIRonnAf9IXX6HoIOsIPsPspI70oQkX7imRqGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkZqPRDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkZqPRDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCF8C4CEEA;
	Sun, 25 May 2025 23:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748216492;
	bh=/1OCZWXakaQXrysrUfKAapFkFMlgyy6i+ftHfIyYiWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkZqPRDXyBRoshN7YPZlLccK+0rL7rpDg8MC5B4LYjek8+Ig10wS3X2H+i62Nzp6I
	 HylvP4S2cN337nG7gnL7M9qyBgQ0La1V6vwzG32cS466D/hlqNcYoBJdbrgiCemG9i
	 WhhV1Kr2YYNmZqQq71s2zSXRVWWuYmPujIp4MwTqC+PLvtTN5yvPnVLCAOyDqh43o7
	 JJc5aQTbh6E4Z3xtReD7PmpnLw+ESWF/CY8PMrh/kb2GEHOVWGZJekOcG4iDeb3fjZ
	 iCc2bF6CPyqhAEQvOrm5Gp38ixN1IdnRmVcFROj9NJc/hagS3Nuf0Orb915bc9Lkpy
	 05hEP0LFHUJaw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 47/47] mm/damon/core.c:2879: warning: expecting prototype for damos_search(). Prototype was for damon_search() instead
Date: Sun, 25 May 2025 16:41:30 -0700
Message-Id: <20250525234130.38293-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202505260758.TBfbD1ZO-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 26 May 2025 07:32:00 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   ff796229bc1b623eff338946ff601056f56cd1d7
> commit: c8e4f18c4ecc01bebf1f805ac58943ed9cfdd06d [47/47] mm/damon/core: add an hacking idea concept interface prototype
> config: arc-randconfig-002-20250526 (https://download.01.org/0day-ci/archive/20250526/202505260758.TBfbD1ZO-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260758.TBfbD1ZO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505260758.TBfbD1ZO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/core.c:2879: warning: expecting prototype for damos_search(). Prototype was for damon_search() instead

Thank you for finding this!  Just pushed a fix:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=07b431e86bb18454f1f56368fb2b6aca0b1f1bfc


Thanks,
SJ

[...]
