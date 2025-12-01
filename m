Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF311A9FB0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764614793; cv=none; b=c8RWLydrXdikD/6EoBm/fwDjJ3GqDtp+x+No5GRgnM2aVr7xHtm7In6Axl2KnRbHsiXh3/QlCgX8n2VMbaJFH0/cJZs9OWyLRzlv9qz7iX7P/JAGijfN1/xByswjwvM821WV4n3qhP4J9BUnvO5sV6YmMWimXKPHOgu3g7ZpM74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764614793; c=relaxed/simple;
	bh=c5qLjH1BLd14SQ/mAN7qo+K+7bE5oa2ra/PdlYh8F8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijNIC3oklSqB03vr8/42nCuAQCrHa3qwl/bJQFO6muAQjPd8jER2U8lHqaJDEPX7uiKwyMyLNGIvFJrzlSivdJcQ+uftaVzmSot9Qfc4JfMJsAvXi1kz8NozrIXf2r9pmSMyItCxBRRZMl//xHBN3917brLI4OvGPidb8j6BB84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=WS2SWbCA; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=DrLXrUfG; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="WS2SWbCA";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="DrLXrUfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1764614781; bh=c5qLjH1BLd14SQ/mAN7qo+K+7bE5oa2ra/PdlYh8F8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WS2SWbCAWc7pidvvwECHznjNP7LBHP7P5B8xtegTpaUiEqNhlXxz2FpczdTVlua8L
	 viAj71Fl8pC6v/bIi1jmlHMseu1mbOfuSdehLm3H185AnbaebZpkrXQAjA7SpitYQV
	 dwoFKGp14Y+/r4e6iXn+361X02mggh59sPv3AHQobjnKzImWrYm19R9tiNmOdiysQC
	 nET6lR6wVauUF/pCzBkmyFlQoaKDfKAsYS4YX7VfY2TvtpQcd3VsE3EHygaIwfL8Xy
	 GBmO1OYp6lgFzqDjix/PpRi5I6FvvtjLiHOSGTKRtv0d8q/raJJCMF4SzMcYS2thqa
	 j78Fe58jUKfRg==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 060DEFB03;
	Mon,  1 Dec 2025 19:46:21 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1bsd7JN0JoC; Mon,  1 Dec 2025 19:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1764614778; bh=c5qLjH1BLd14SQ/mAN7qo+K+7bE5oa2ra/PdlYh8F8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrLXrUfG2HAhIMdA8sSdueXHfJdhVYMgxc/p/U83pCTfxAcfc29EPfRjNF5dhW2Es
	 khb+dI1tZEeP9sZyg1j0bUAjRxBecTxLClnFyomiW+tYUKBxyY66hFcVjE+Z1U1Vh7
	 avIjmAMV1jDoS5vdsUWIJWgyGmBxWLBXTdV2BVSBCfYXZfn22EPa2IjJfIAFJjBybV
	 xNi7+YMSNJsy3M0OU28e/QszaxAJtngUAidzJHZh4r0/RiyeD9CWVigdMBX3kgO26R
	 69U0HU9Ubo20H5oe3/OJuT2iVO5cH7IFWM/tO/mY8of9Sr7aSWEN8ZB7XMD3kKNEPa
	 OVqRh0Rg1GA1A==
Date: Mon, 1 Dec 2025 19:46:16 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [linux-next:master 373/13171]
 panel-visionox-rm69299.c:(.text+0x48c): relocation truncated to fit:
 R_OR1K_INSN_REL_26 against undefined symbol `devm_backlight_device_register'
Message-ID: <aS3ieI7Ea1IBnjnC@quark2.heme.sigxcpu.org>
References: <202512020154.xVlxrCXE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512020154.xVlxrCXE-lkp@intel.com>

Hi,
On Tue, Dec 02, 2025 at 01:20:07AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> commit: 7911d8cab55453b6bf59cd1f806503c3dbf0e990 [373/13171] drm/panel: visionox-rm69299: Add backlight support
> config: openrisc-randconfig-r052-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020154.xVlxrCXE-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020154.xVlxrCXE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512020154.xVlxrCXE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    or1k-linux-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_probe':
>    panel-visionox-rm69299.c:(.text+0x48c): undefined reference to `devm_backlight_device_register'
> >> panel-visionox-rm69299.c:(.text+0x48c): relocation truncated to
>    fit: R_OR1K_INSN_REL_26 against undefined symbol
>    `devm_backlight_device_register'

A patch for this was submitted here a while back (including a `Fixes:` line):

   https://lore.kernel.org/phone-devel/20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org/

Is there anything I need to do to have it applied to next?

Cheers,
 -- Guido
