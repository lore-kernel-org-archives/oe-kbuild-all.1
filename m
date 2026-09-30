Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94C5403E9D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763532; cv=none; b=ccp+tQCQCz3HwpIhq9saldjfmOP//GksmnxJW4njjwrN937KTq1wuUMhNQfKhVdesVCn8BcFwZafipLzZ6e219OxldmyYKTbeMuDaAwHn4o79y6nrVvVib7hFSPIvRxsNX1D2W+AYpj6zduHilwqoBI0vlk9CHq7sfuEsuQpSEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763532; c=relaxed/simple;
	bh=OL9Xt91YEZT97FPgkw+t8D3Mt5WSSxDa03LelsQtgn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lV94WAUQdOr23U2RjFcozFSsgM5YZrfopIKwfUxGfCrwWUrgSs3FjGX0Kb6nyUtzUVGneCFHZuPAvrd/3xfDJNY5mA6gjJVf0TVP2utOWAgaUBt/hl/J+FAFgPMxT9qYTcJ9iTWIeNtRp+8M6sdUQhHTqWltPQbCxHFWR6eZEWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbTGXULK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbTGXULK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588DF1F000FF;
	Wed, 30 Sep 2026 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763531;
	bh=BLyFUhCo2PTU10+M87inUaEOdmrhHrRtLAoZBpJQWSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbTGXULKPkMIbLByJ7DC/3NMJvdN6WFcc22DS7Fw3HJk9Y4rVOOByg3vu9uUlVZ3u
	 OQXwxoERM8v0DSGvXeapZkZ6IFlKt3C0CbnOtS46T6w0XeyNABltFvw80ykHM1nn4k
	 2qVapBrdimLSlhDt4SXGe0G/d8JBKyUcilQes1kEzBgI1nXxz1ASC4/3MS1/M7fKsl
	 mEI1D/LUNIWTU1ShRp0pFC1hAEEHeZcij676ZxOrd7RDVUgSYc04wYjyKn8MnsmX15
	 V5erIjW5T/xsjqsKMcjwx2Eg7m3xkBgYrBcKVLLzQg4Gg9+9634MWCHPrX/A3Mzj8g
	 sf/hvoIwup2Tg==
Date: Wed, 30 Sep 2026 11:18:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: arch/x86/Kconfig:2368: syntax error
Message-ID: <arzh5K2jsUmN1pWt@gremlin>
References: <202609291906.GAlpG7h2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609291906.GAlpG7h2-lkp@intel.com>

On Tue, Sep 29, 2026 at 07:34:56PM +0200, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes-ARM/kbuild-do-not-allocate-modinfo-in-vmlinux/20260923-181750
> head:   7037b569f2880edc0732da253bce262da253ac12
> commit: 7a5e3a047b46532027b586ea704af1fc8677ef19 kbuild: avoid re-running compiler and linker probes
> date:   6 days ago
> config: x86_64-rhel-9.4-ltp (attached as .config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291906.GAlpG7h2-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609291906.GAlpG7h2-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    scripts/Kconfig.toolchain:148: syntax error
>    scripts/Kconfig.toolchain:148: unknown statement "def_string"

Similar to the other robot report, this is just the dependencies not being
applied (as stated in cover letter).

--
Cheers, Lorenzo
