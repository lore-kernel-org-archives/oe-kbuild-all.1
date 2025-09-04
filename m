Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C9F9CB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 03:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756958059; cv=none; b=s3OBj5B9YIcL3rtKrohbZiZBlcKgd1qZiB0UX//Y/NHGOPEfQjmTVWxRjYlgnGZSGKoUY7Plh2UHpzSCjoIDCTg2A1Sni7ZmoFGF2FD5A/itdVPQ+ZDAxsSkJshrhnESRnuuK9BTvNjrU+7UGRVYwCFeTO5zmBm2hdeLZjBiLaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756958059; c=relaxed/simple;
	bh=bL4S3j5IpobuTXHA1ldwTe+c+EF1mQApq/pqds96ofc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fW4Md/1Zl8zi/m4Tn+OiGpDssHcpt7PDZODROZR9+t/BMIpg2htVe6F2wF0HluguFRfRogRsJNR+xWbOQuSg0HnJ40HWCojs9LR2iHAKQYjjFLZeQvu36YDsQh4ZbmgIUuqKEe6W8bF/eivyEovAErzA15id1rFS0GDCm9V5kGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTp9oaBQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTp9oaBQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D35EC4CEF1;
	Thu,  4 Sep 2025 03:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756958059;
	bh=bL4S3j5IpobuTXHA1ldwTe+c+EF1mQApq/pqds96ofc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTp9oaBQVwAzDfy07tko3su2itPvKLvwKInxr/nzOIdbq1/qtMZ1hHZotaSPxik1/
	 sIVZd5fub0Yjykqvb/i9WXmIVmUJquNqPWfmocJSEqO8QLqudw0SFIM0Vq4Ekc6ZxB
	 9iRospQtG9NDOzg472khV0MeB1KHQe8miwnSQThxXHG2rUh/BQx0ozXnxATAYD+FfI
	 yUeTbfx9BtXUcJKV0W8USLEIjBV+qRbYimP/sSlFX2vjyhoQNbB6PE1Ltaf9jKGdhM
	 6COPqaqbNOrx4VM1NVxH+Zcs88AzGx8vo45kMkc7PSoR859g6hdAsRMa/RYGydRgwt
	 Nfgqb35LJOcmw==
Date: Wed, 3 Sep 2025 20:54:18 -0700
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [kees:for-next/kspp 17/18]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_246' declared with attribute error: BUILD_BUG_ON
 failed: init___fls < 32
Message-ID: <202509032053.EDA3CC3CF5@keescook>
References: <202509011237.Hf8MjkXU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509011237.Hf8MjkXU-lkp@intel.com>

On Mon, Sep 01, 2025 at 12:49:17PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
> head:   6a38fe1a7d9c9eba3330a8ae4ece2fa5d0f628cc
> commit: 159746fccb2e000bbac46fe24034d38e7df6c6e2 [17/18] KUnit: ffs: Validate all the __attribute_const__ annotations
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250901/202509011237.Hf8MjkXU-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011237.Hf8MjkXU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509011237.Hf8MjkXU-lkp@intel.com/

This should be fixed now:
https://lore.kernel.org/all/20250831022352.it.055-kees@kernel.org/

Thanks!

-Kees

-- 
Kees Cook
