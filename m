Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61AE34D3B9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762136160; cv=none; b=VKbEFiYz8LmRMzfKO9oEYxFy/AEsbFZNMJpvFpVO4qsm4pG9Dl84TiVPu5TG9/z74PGp9FQrhkKz3t6G4z5FJbnlIJJqQF0cY8lCv07bPWUODHtfGTXTXkVztOwK9eMUxbMhPpStazP0UJEeB0Dd49CDx50YkrMRAxW3/1ms3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762136160; c=relaxed/simple;
	bh=cwA4iXiVm51/SJQsvtz9wAsCZQ0/zFO1Vu0rjXiQaxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM/upXOXQJjyJcAsGh45BDO8jFTwxlFnnsWQR4lI+r5ora1U7qZybAkYb2gs6V3PSoBBPSSJ2neWrsMGViQqvhBCMpDqILbvjC0+Oqs5htOquO/MoBS8WsaRytmYoeYNP9ddks3jrp50cGrHtdsIKqK/pWQO/gczovRrD14K9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=dik8aVZu; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="dik8aVZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762136104;
	bh=g9p1hY2y0/W1bj5fFacHNx41Ri+n4HF9n/0XNnJLyYM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=dik8aVZuRM1mwFkkIJ/zdvAsnoeYWKlnQucqBnhW1yz7MGCxWxx/bkalbPl83p5Y9
	 hppNbGU3UDbHnCdursXIsO454JsNoZXCP5Xd/uHw28VZ424e3QfilttWeIRWIDfcP1
	 LOX2v+xox+DGA2iEN+PcBZ8MvCkw/bpGix5RGMkQ=
X-QQ-mid: esmtpgz11t1762136098td67e2136
X-QQ-Originating-IP: pvwYgVsnJvzSvyW4JzhMyOIdTyB+R3rcmMnrVNPiPCQ=
Received: from = ( [183.48.244.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Nov 2025 10:14:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16500212621162204577
EX-QQ-RecipientCnt: 5
Date: Mon, 3 Nov 2025 10:14:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: kernel test robot <lkp@intel.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [linux-next:master 2080/5383] mm/page_alloc.c:6985:23: error:
 implicit declaration of function 'find_large_buddy'; did you mean
 'split_large_buddy'?
Message-ID: <995A6E8EE16DA1CA+aQgQISLd2etLuGT9@kernel.org>
References: <202511012349.OBGxzv72-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202511012349.OBGxzv72-lkp@intel.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MCg5+ArSTX6cQewonlsZ5R44b4eV/n+HMN0JQUypc2RKo+OC1mEQV84O
	wBzbYdbKLe7QVd08n1icdTdyI2wNuVx0sH+Kr2QItNvnPOzWMD3aDuCl9WnFOjEZu/nXa9u
	pCznraJxRihPbnGz8H5BBKAoLmLHEg/KCQbdw3KP/ggJSv21f6DhTOt8caDq6li9FN2OvIL
	SCCqRPE1PKJNgeK0g4ogS5UxJpnitbtpcfMoQf4ZTwe9yRAG2nzxEHwc3Fbh+TwYzMN15C6
	OzZ4ReExt8nj37wjSMqo+BTrCDDUdW9bX2PNFsdPh4MI/8FLrGU90DUexgqyAp9XCYZ141X
	zBOgdiLU8JB8oFMIVDV36XJEINMCITkbb48zBjPg9L141GXCFEazoJzdP3hVe9mMO0NWw7+
	TLLhyj6CX3sNEC8yvTIeK56LTsWPSLLghCf6mcQYTBpXdmMnTOKdmllnrWTKSUkFvt5fKT5
	WhC3bc1YaqzEDZTSYhTV6fvib4CPFi4PrLurRxatkuhyVF++ZCmeQJjmB7+/PGmkqkBirjB
	8udWt67NYkCPCb99VEFwPwF2coIIV0f9ldZqwXtROfDNi/sFsMSeLy0B+K3sdIMh4jzSnj8
	D/5nccm0l6/ZD2B0+W4VB1FIDa7EGmbni83KS3R83VFDQfVaG4400k+aUWvTCbi3n9vvSgi
	l5TkljbqKM/wqTo+ag5m2ppfYTxqA1CyN49DC3m2XNATOhFNoJYd7glNjnhqchJ5rhVwB2A
	tvptukBdnE7oOpFVLHQ6nwVUY7D8NovvzLOIhv5TkjUd3IGwlKxYR4xdLRfkkZgZgNKAyjs
	bEG3spRlTm1zg8UCHREdU08frKyd24ReMPxuZ9XtxaElCfOoJYZsSqZesjfkNauG++kPrTg
	yy6oAnHpGYf8XCJzvylJmRIEdDi3z+9jQZDtnQNOmTXtAIkCxi+OZjWYHWM50lqB5JqGoUZ
	G8jrbseFrfd08m+q5AzMwrj7da5ZjX7nvhTz5Z1WzeWU6HcT/HwgOX5jiMxjBV9KpyGSBHk
	BvF08PhNpbUqzKD/qyJaqfp3W8hAQfEj5kodwrm+oPWpDOV7bB7QQ71GS4YVI=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Hi Mark,

On Sat, Nov 01, 2025 at 11:08:34PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
> commit: fce217449075d59b29052b8cdac567f0f3e22641 [2080/5383] ASoC: spacemit: add i2s support for K1 SoC
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251101/202511012349.OBGxzv72-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511012349.OBGxzv72-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511012349.OBGxzv72-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    mm/page_alloc.c: In function 'alloc_contig_range_noprof':
> >> mm/page_alloc.c:6985:23: error: implicit declaration of function 'find_large_buddy'; did you mean 'split_large_buddy'? [-Wimplicit-function-declaration]
>     6985 |         outer_start = find_large_buddy(start);
>          |                       ^~~~~~~~~~~~~~~~
>          |                       split_large_buddy
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for CMA
>    Depends on [n]: MMU [=n]
>    Selected by [y]:
>    - SND_SOC_K1_I2S [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]
>    WARNING: unmet direct dependencies detected for DMA_CMA
>    Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
>    Selected by [y]:
>    - SND_SOC_K1_I2S [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]
This error is based on the code before my fix [1],
so I don’t think it’s something we need to worry about.

Link:
https://lore.kernel.org/all/20251028-fix-k1-i2s-v2-0-a547c15ed5c3@linux.spacemit.com/ [1]
