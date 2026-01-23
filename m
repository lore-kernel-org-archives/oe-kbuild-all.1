Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15137AA75
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769163346; cv=none; b=OkFmEirZiPbXfFlJftWVWnLmDosnNVzmVysI8TWC2oBFqLZlXNTDOMxRscoXMNUNFT2DO6MjnMJoKDx3flkGAAA4k9+xbgMD64NkvIXVvmtfsYJ+88JJctKxrzF/z1F3KD1fDERfM2+fs48TSnYQCyAi1Q7RpVVPB0lJ4ju4ZA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769163346; c=relaxed/simple;
	bh=R+e6A7tPkjDHhxR9eWaj6+CSmqcqbZ8D32/Z0VeFx/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDG6BFLX5vZBWq+USNBvXWBmGu0EPYs7QjN5bFUtf2S/PYYVohaaoTZBqQMQDNkBH8aFasASsvpJLa6YqC9SebKHvrUcMhsxZNdupy8wdSS8TjMGhdI0jfRbdH70OijX7dLg0KTquNW88fs7syCDyQdFwxnL8zcab2NTdkNQuAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=N+Qn6pLj; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="N+Qn6pLj"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dyDMt2N5fz9sym;
	Fri, 23 Jan 2026 11:15:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769163338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOyHW70dEjhMXjswDotu1VnxfIvperpShMa8sRWJ6Rs=;
	b=N+Qn6pLjoJ7rZfPjAiaGMdzfU9zM26/zBSlBR1E196BX6cTyWGwUI8EkbvY3Yfb35YKDRk
	Mo6Fhz6FxgcrQE7FQzgzMQQBsA62rLHO9nmBnc8FYVLJrF1lYAXiGV0EnjmGBvvtdHQTk4
	mGX05Mk6+LGUOwuvj0O9xAx8hvfLd+WrltscTuegaQO5K9uwP/rI3sgtn40CcKiXJX9EMa
	uvxjeBOEWsNCuctkgMJNoeGdLNNXfvTMO9r6huTPXX7HVIT/cY/lrpTc8AOgLhJbu1qb9t
	i9itB5/0aZ6GySWRZ8blh1jE2NILpIgvv0zB8sVD9JzkGkjM8R416cXiLYEn/g==
Message-ID: <c2f6eb5f-0eb6-47c4-9627-d2a5dfd6abd4@mailbox.org>
Date: Fri, 23 Jan 2026 11:15:35 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_495' declared with attribute error: FIELD_PREP: value
 too large for the field
To: kernel test robot <lkp@intel.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <202601230809.FBjF6OrH-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202601230809.FBjF6OrH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9rz7s1t85d5drttgxgmmprwjqxei4jab
X-MBO-RS-ID: 594f4710a43bb244bd7

On 1/23/26 1:58 AM, kernel test robot wrote:
> Hi Marek,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a66191c590b3b58eaff05d2277971f854772bd5b
> commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> date:   3 months ago
> config: arc-randconfig-r053-20260123 (https://download.01.org/0day-ci/archive/20260123/202601230809.FBjF6OrH-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230809.FBjF6OrH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601230809.FBjF6OrH-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from <command-line>:
>     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.6':
>>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_495' declared with attribute error: FIELD_PREP: value too large for the field
>       _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                           ^
>     include/linux/compiler_types.h:578:4: note: in definition of macro '__compiletime_assert'
>         prefix ## suffix();    \
>         ^~~~~~
>     include/linux/compiler_types.h:597:2: note: in expansion of macro '_compiletime_assert'
>       _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       ^~~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>      #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                          ^~~~~~~~~~~~~~~~~~
>     include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>        BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
>        ^~~~~~~~~~~~~~~~
>     include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
>        __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
>        ^~~~~~~~~~~~~~~~
>     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h:259:29: note: in expansion of macro 'FIELD_PREP'
>      #define VCLKSET_DIV_V4H(n)  FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
>                                  ^~~~~~~~~~
>     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
>        vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
>                   ^~~~~~~~~~~~~~~

Hello Tomi, Laurent,

maybe it would be good to pick:

drm/rcar-du: dsi: Clean up VCLK divider calculation

that was posted about a month ago and fixes this exact warning ?
