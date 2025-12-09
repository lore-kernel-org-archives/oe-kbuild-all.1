Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FC182B7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765268893; cv=none; b=F+ATqJAf6hp7bQDWRZDs7y3v1aLjp6kFMNFDCuqiMF28d9eidN1bGjg5szCYO68DHfRYh/7fu8oH8Bwh9qtj29Dwvwg1RvnOnErKRew0n4AEtDBvlaBGoD1ShtzDzsBW5BQvzJbfM4NwvKkAELWYDmVq9jdjgdUBvokt4WHGCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765268893; c=relaxed/simple;
	bh=xXY0q2sX3a3Uf67CM1E6b93NwqzKfT8oXLLmfDeYtpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0WtnHPvnE3AuKU8OaAe+KJybxZiIrR9RiLtSJTK4eLN9xtMDfRKETKKIGQnUC34xbtB7AXRoJ6sFn2pGsN5G04tApkE/JvymzCBqijSsRQl9pw6PCmKgbNckzMM6YjW4fwX6TE/WvIfgEzWbr26oTs79XC5yHyepZwEbZQtSGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOog7Sbe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOog7Sbe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD099C4CEF5;
	Tue,  9 Dec 2025 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765268892;
	bh=xXY0q2sX3a3Uf67CM1E6b93NwqzKfT8oXLLmfDeYtpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOog7Sbe0cEGKhwlmmkvhHljRndj2AXaoBtQ5jYxaIm/or/1QAZOqG9weEESk2kT3
	 czV6vQ3Ah/3CUvqL2GcZrXuMweYDHk7HT6sEWCLoSNevbN4E8+ZbWBtnGTnEvaeJbt
	 4HKNScAMI4kRBQ7ODnA6x7pJIgOxVsWDwslt5DWb84GsuX/y/W9ZMSMsDBs34dqXeM
	 qjor/FP9fYVr2ibltG3PQLZq9VD9WwhJ1GVeO7jU+yZNkSNU03FecTk76AtjLpUkB1
	 dXSmHLH/PIsGDPQzhFAtWp9RyOupyLq7c0m2dZY1U1s5AkMrey5o2jddW8WL1dk9t0
	 NpZYDFBAwuR+w==
Date: Tue, 9 Dec 2025 17:28:07 +0900
From: Daniel Gomez <da.gomez@kernel.org>
To: kernel test robot <lkp@intel.com>, Oliver Sang <oliver.sang@intel.com>, 
	Philip Li <philip.li@intel.com>
Cc: Eric Biggers <ebiggers@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [ebiggers:wip-nh-lib 14/20] lib/crypto/nh.c:82:1: sparse:
 sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded
 NUL byte"
Message-ID: <gszvkjbpxa5ny7c4vtpmklgibxxrqkf2xkfwum5vrg4ooipxl5@uqvhrmvtzfsw>
References: <202512090359.7BkUaiC9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512090359.7BkUaiC9-lkp@intel.com>

On Tue, Dec 09, 2025 at 03:33:11AM +0900, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-nh-lib
> head:   d471b579f29c765ebaeba7a3b653052f029dc550
> commit: 7f1c9dc7e0f3540a978f65f4d2d48ea1cd475a3e [14/20] crypto: adiantum - Convert to use NH library
> config: i386-randconfig-r134-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512090359.7BkUaiC9-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    lib/crypto/nh.c:81:1: sparse: sparse: bad integer constant expression
>    lib/crypto/nh.c:81:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
>    lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
> >> lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>    lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
>    lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

Can you check which version of sparse this test was run against? The patch below
is required to avoid the issues described above:

  fbdde312 (HEAD -> master, origin/master) builtin: implement __builtin_strlen() for constants

https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121

Note: this is required after the following patch series was merged into Linus'
tree:
https://lore.kernel.org/linux-modules/20251008033844.work.801-kees@kernel.org/T/#m320036927843f7b372765ddf2b7b47b32c9a81e8
