Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C8A390209
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724162; cv=none; b=DsKvUyUqRToCbCsDFNoKtTdKGLxT3Zyxgk1E/5BpdQ2QSIAf6eCIgtx/VEYb72U1uMbMnYm8z/oUeLG+UF9tGsjtcPAjvx+uBeItk9/WipvtWlWsi34KiPUJX3/2uVLtRdyIEMs+VXXr6vUzEp5UiWQq49MkIEMHSV47YvP8wEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724162; c=relaxed/simple;
	bh=0SiqnGEHfV8QnYsdfobUysNm1KMhEbaxP7IVdhYF+nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lodjJLm08u1/vi7E7mNVMw8Z0FhwGaJ7NU+e1G3OSkVtydpvCg6MzvqeBiWsMQQ2hP4nU7WudGsRanLU2e+WDHJNkkrrdnHTEt1pNRLIFnAJV7JCHXHlL0m7KR3lJCCM+fO6fFaW6LqocB4QkU6ILY/wEjvhSjY6WEZFwvSOMGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYKCEqB5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYKCEqB5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso3735085e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789724159; x=1790328959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qmipB2sS5GuYStzHQ237S1oca/1nec0HMtyjA0gSIjU=;
        b=HYKCEqB5/1/y4IQFT543mR2TBMarTEB3N2QLPgVjbZf2CVFPfpyZ5tkPJg2NJjjJs1
         9CApKwyaUxFjJb590mY5YCQBd3OVKptN7zjOIM5XaxJJXxBM2vGvRXDT3QXVgPPFu0nU
         eXRnFlPUdgrpxpxK8+ftINOxWSDGBL5rvLDe2XL/aIcLZbVbsKyP5xexOUlWSwMM96O7
         119EisAakhGMnuA7okZuU0E+MPfm0/WPHDs0cAncKZTSh+Z9tWpleCplBUAK+Tt5Bnk4
         LK++Qat+Qk7nJPNe/lhSl2dlQPURAPRqj2fg+s4d6cCLPTILgvXFh4mErBxeXTPjwc4h
         O7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724159; x=1790328959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmipB2sS5GuYStzHQ237S1oca/1nec0HMtyjA0gSIjU=;
        b=uV8JYbRME7ASuXXdEGbTZk3/LU2DsyJr05Np2o9Adt5fFay7eOy5M4hYc+4/SQGxC2
         T48Z8RM5rvffEQ5bomG069EZEmZZeTnsqBuPJtwH1j2DEYasjH6qKM3aTA/dX0PYW353
         3Y4mDtevj912vdE9aQoB8Atly0IWL8W6dp/suPTElpWf7PROMLZTYg+E0Y+7zGg/TH5e
         tXbrXkUaUJGty092Ep8qol4eh6pTHWfISNU6xYSXaSFXEfVNVLz6/8EohNCeIfhtOSUF
         HwvtMaE1dX+GoDzURT2FvVwIuiYxHvgLFk41Z561KwFOF8FKP8v3gzL8AxmRiYb5t1uw
         PY6A==
X-Gm-Message-State: AFuF++mTZVcluse1LC3tejpPie2vQZQ2YSh+PIN5H6De5EqIV6FljlJk
	W6ct6y3G0pKcIWWxOu5k06xgMO4KEn2PSIB7fTtmYXde4US4/zLBNRc2
X-Gm-Gg: AYBFou0NL4QKibADYl3QhA/O6Jk05OhQPy7/N2KYfz/w/9TmiS4DXSBaICKbs+ETMGN
	N4mwuRA/yxmgWW+gV056vHaO/Y64Mfu0og3BFWyugwQt1Q7qoe5sscnsuCPSqwUqwFZZRJsfoXS
	5r/Z1KgyMyZC3U3zeoplSrrcji1Hi8B9Moj+tcbgsaCjHEE3UEvWqljJF66+r3F3UE+Y6M1ZKhu
	G15pTeXdo8AezZ0NBXl7zNjCWs196b4FN4pc+SUhN7FpBzQuTdEEfEiEYOiZ6fYHUbOyUATrE/j
	KNVHsrpk3IpMPqCVkBi+xOsaJDz2QsGFlZNG4n4O3laC1p493gDDrCrHAarpzUSEnSKbQ2XrUSK
	kKHNdCCT2/uh/tO+vxLv7RUBy7wDqNpc3V/WJoILWqsVmeXKy2sfnBJRe37khL96xQDdq5jS6/Y
	7pM5z/5bPbZl+w7+LE48GaDdaKrER6IctSLj5tg5vR1oSrjhnm/fixIZ2UW7G37QhInZMyPX8KV
	+y6/mZ7X+gkmU36lhSmmgtFZn6IjvCIRrz2
X-Received: by 2002:a05:600c:4695:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fc55ac96emr25375345e9.0.1789724159291;
        Fri, 18 Sep 2026 02:35:59 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7ce03dcsm41256665e9.5.2026.09.18.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:35:58 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:35:56 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: Re: net/core/bpf_ksock.c:221:18: sparse: sparse: symbol
 'bpf_ksock_release_dtor' was not declared. Should it be static?
Message-ID: <aq0F_C4nRM6glHI-@gmail.com>
References: <202609180339.0L7nLqNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609180339.0L7nLqNo-lkp@intel.com>

On Fri, Sep 18, 2026 at 01:34:41AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> commit: 7ae4eb14c5f9d9bf0e0feabeab206151b1280512 bpf: Add ksock kfuncs
> date:   5 weeks ago
> config: i386-randconfig-1302-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180339.0L7nLqNo-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180339.0L7nLqNo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 7ae4eb14c5f9 ("bpf: Add ksock kfuncs")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609180339.0L7nLqNo-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> net/core/bpf_ksock.c:221:18: sparse: sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be static?

This looks like a duplicate notification of:
https://lore.kernel.org/oe-kbuild-all/202608171256.McaD8rfl-lkp@intel.com/

And we concluded in the other thread that this should not be fixed and
is as intended.

> 
> vim +/bpf_ksock_release_dtor +221 net/core/bpf_ksock.c
> 
>    220	
>  > 221	__bpf_kfunc void bpf_ksock_release_dtor(void *ks)
>    222	{
>    223		bpf_ksock_release(ks);
>    224	}
>    225	CFI_NOSEAL(bpf_ksock_release_dtor);
>    226	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
