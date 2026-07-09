Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444C83AFB1B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592587; cv=none; b=XneB74S6Xn/rLk2k99hABWGjao0X4uKsZYt3obHrkEuIFdYFPWMUSRURuq/a+7EebAoJq54oZoacKM9ZnB+4ydXqD1l/+1H1NkSuHVl2DQlucC1P+NmmNTHNbrK8uHIr9+QV7YyazPT2cd8gPaht7nFMSFXiBecfvJH0cwJk2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592587; c=relaxed/simple;
	bh=WYNTEgnJZwQAA8yAJX3TJyj9tqgzjTPJEooScHqtokU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRkOwbY7KRQHGGKA5At7c/JWWhonHi57/EMIh1kUu9aczTJd4j99aKjLzeSPt4p5ndvghIzxEb6R06nP7Fmf15QP8qoLMECexpFzTNhK5Jm4psarKRmfrGruJTKUCKSTY3DWuDhJqvMPwBPngFZLd79JJ6ZMDsm7OZsuiws3CyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YX/gx2h+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YX/gx2h+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4B93567;
	Thu,  9 Jul 2026 03:23:01 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D529B3FDC6;
	Thu,  9 Jul 2026 03:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783592585; bh=WYNTEgnJZwQAA8yAJX3TJyj9tqgzjTPJEooScHqtokU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YX/gx2h+2qTreTwoWc+WOtqOtnvqVBEzQkH/501Z8O0Mx/nadT+LyDUMDnVFF1F/Q
	 HdgkmPQtNbs9SIkUT/HsJxyw43LFkK4FXZtuZwRmy57+ILj6AMB/Qvy5tlryJ2XIeo
	 vrf7YG4cRBPz+RQalzUulnEyiw680A9APkwsLAjY=
Date: Thu, 9 Jul 2026 11:23:02 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [davidhildenbrand:folded_pgtable 14/32]
 arch/csky/mm/fault.c:139:9: error: 'pgdp_k' undeclared; did you mean
 'pmdp_k'?
Message-ID: <ak92hpQjfNXaQcgn@e129823.arm.com>
References: <202607091707.RCUR8gr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607091707.RCUR8gr5-lkp@intel.com>

> tree:   https://github.com/davidhildenbrand/linux folded_pgtable
> head:   0551ca68b7552b7d71f1d2882635809a573d6c79
> commit: 0763dc8f9d1187b3697780a0773456af1522e2fa [14/32] csky: mm: use proper set_pXd() for folded patable in vmalloc_fault()
> config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607091707.RCUR8gr5-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091707.RCUR8gr5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607091707.RCUR8gr5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/csky/mm/fault.c: In function 'vmalloc_fault':
> >> arch/csky/mm/fault.c:139:9: error: 'pgdp_k' undeclared (first use in this function); did you mean 'pmdp_k'?
>      139 |         pgdp_k = (pmd_t *)(init_mm.pgd + offset);
>          |         ^~~~~~
>          |         pmdp_k
>    arch/csky/mm/fault.c:139:9: note: each undeclared identifier is reported only once for each function it appears in

Grr. I missed it. I'll fix in next version.

Thanks for report!

[...]

-- 
Sincerely,
Yeoreum Yun
