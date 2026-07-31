Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3292F7EE0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526506; cv=none; b=Torzw+rsVHyhdRvC+Mvu8fJnQIhtdtFc9G8z9v1cRv1Eh5d51zfNqmACSYbMYTBSgmgnXoZ02+LUcWSSIq+fNVeRePhkPRCTIzo3ilAR2tOCATWyKdfIN3xZmEUi2ydAziKxqNbUE/ksUhi4AzVqA7uH9LeUx+hTifU2DhpLsB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526506; c=relaxed/simple;
	bh=vY+Hv9AR/IO1itcmTOLGZYji7LrYKAxD4sP1MsxHyeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOLOR8E/x2eeDuvKT8TUVrs6unw/5zX7/68wXydOBednELPoo+H0Ozo/V4+nfvXcvHDWhTj8Y3u8pr9FuoeT+gpzUbIwjLQ6kUh7Hjyz2MHAsKwLAz1dVxAAEVEF9MTog7pQSNRs9yHHWQKXt7f9uf9gBxbNCERZhks459VgfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMa7trea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMa7trea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311B91F00AC4;
	Fri, 31 Jul 2026 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785526505;
	bh=LzkhwayHTTh5Nyd/H92DjatXM/FS6NrHSu7zfBpvMdw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=nMa7treaXQYelXU7T3jbiDQ2EAq05pIblFVgHjAycNCd89nX3s7QB4fOmYE+H0iSV
	 rkBUacPqFmUaxSmqC7JbouGpHQA/oxLMP6AseiZ2ys902SzzGY7Nu5pynmiVg8UryL
	 ZJ112m5JY/aY2bYDwz/SFvfKDh1ZKkLyvzgzs/tEi7pp+TP9fIdcAoqqnVmDFpFbKo
	 fkSy75S5cTz5EI8VPgNhwZLPBRlEkpietFaQMv75wlJvrUPhjkoU5aqA/riAdxSk0/
	 WxhDHKYJIaR/fAXvo9HSZGDNW8z1kfRffNebI/Gs3E0E7QRt38MjMmVUK4Uqty3mxV
	 l06g+mOUaJ9/g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 030F6CE11BE; Fri, 31 Jul 2026 12:35:05 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:35:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 36/44] arch/x86/kernel/nmi.c:88:15: sparse:
 sparse: symbol 'toolong_nmi_panic' was not declared. Should it be static?
Message-ID: <0dbcaf7f-ac67-43cc-9216-1f021b3ab5bb@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202607310118.XAgMp4qi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607310118.XAgMp4qi-lkp@intel.com>

On Fri, Jul 31, 2026 at 01:44:25AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   9df1c10e4ddffa50d054112facefa25376c7a219
> commit: 2203ef58a5e3cd2a8b4879488d25a52afebaf64f [36/44] x86/nmi: Enable panic() when NMI handler runs too long
> config: i386-randconfig-r131-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310118.XAgMp4qi-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310118.XAgMp4qi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607310118.XAgMp4qi-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> arch/x86/kernel/nmi.c:88:15: sparse: sparse: symbol 'toolong_nmi_panic' was not declared. Should it be static?
> 
> vim +/toolong_nmi_panic +88 arch/x86/kernel/nmi.c
> 
>     86	
>     87	int unknown_nmi_panic;
>   > 88	unsigned long toolong_nmi_panic = 0;
>     89	int panic_on_unrecovered_nmi;
>     90	int panic_on_io_nmi;
>     91	

Good catch, and I will fix on my next rebase.

							Thanx, Paul
