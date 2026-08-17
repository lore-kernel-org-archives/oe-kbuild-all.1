Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657443BB13B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958613; cv=none; b=kMWRFeU4UzgSn6NkLeJByE++sAgYN0BHRGspUkEOHy6DvzwIXiuj80rbm40KumV4Bwe/laZP8QDBchjwLeQSaUjx5VAkwvJ7mYNBeym0YfNf31Ntqk7WaRJXrZJLi8wvthoUANglGoRFCwglICC8nq6ohk3pbt8JtYSR12v0Dcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958613; c=relaxed/simple;
	bh=AreqCOhMaxWIwJn0Mp4GFkoAzARRrhQImIH9f9PL7wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB9EtoZ3mn9kRNyjdr1zcfaPKGmrI04dI4JVuUO6ODnV920oQOQiFJLX0Q1SgNGAE9pNTi7QTtMYB6H9LHg33+RRyB7dQTZYPu62+g/JzrK3rofPhh3BPEDSNQbjtHZvx8/xF1WlUyB+0Kt4eBS+DdraaH5riQrBGcHd9dw2NLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyPw1qjV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyPw1qjV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49557167508so32089185e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786958610; x=1787563410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+Nom0s7oNpI/XIll9PoJtnSLrDCfPy9TDBZPzwXnlY=;
        b=oyPw1qjVkunmIxm9PGUzn+blu7dQ3CQolVFKXUcsD9MNDigWko4CRoVa/E8Rg1eBI/
         KJWeX6ctal/mdrcZ0pQ4EbvbkecSTLBG4gSXUOEVSIYrwV3f9udNchY6pEx2hZdOWGv7
         lLwRaA80awo5s1lP2QdBYMV+kMJ0YH/bvkkschrPh3K92ywx4IJPEakRMpxXUFcQpHKg
         Pwj4D6Ma0SgnRCqCKvHkkla9P/bewl0Aznp8AKl0CP0j5O9Tz9zPWccA6IrSDe5WQlAE
         3c6xDzlxQx4sQgicAtRG9REQ1KKhNV8ilf4uh0fJODdEgCVR8YyzIV4d1wN8VmOC2r1q
         MxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958610; x=1787563410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+Nom0s7oNpI/XIll9PoJtnSLrDCfPy9TDBZPzwXnlY=;
        b=H4PcLAWC/VDOkv38bPQLHo2k5yrguxgMQHIukgJwvf1cosRrnMKnmakkqELnZEcSKF
         t/Ir8l52/OTarchE7vKl3naZe92Yw1cSx84CjtCcqHhv6j86anN/VYiJH7+oAXaJvLb5
         u9A5Qp/CHTCHjjE0xDSY3gD+4Uvct45+8p0PP19oaFOuovKQBHL6rGiHyWmv+eCPfArB
         QNTXS46ivsT/ZWpNOI3O89qIcnl2QvjlVvDDuokLqHO3y7RLHZvLJedf1tsDwFOE1/mU
         y3im8iaiOxqu1zXUpr8mbrRoQCvx5AuOBHQutMq65Ta9DuZaDd4OXaiWzdv4acftfWzX
         mgog==
X-Gm-Message-State: AOJu0Yyonm1zi1sfnv8fxflzIx4w7Nd/UyPI7XqUvMnft1XoFQj0PFkW
	VlJFVT5wCFj7g1p4k4VTWdGBQKql4D7L0QoHrnWchrPdLG3T8kBvxcDc
X-Gm-Gg: AR+sD12XQyEsNc253NxzA4qIgKxkxkNfQDRm48fGvOHOIqHb457GL+gaGX+jxL7KAqd
	2E8Ys3jQ3EKmiMHexIWaiU7G6GuLS5qyy/qO4jWhNmpne8GHsNNcFyWOLMKc76uIUfpLKSUAla4
	GThGCnp1iRUinB7v6PJGJRpXPsvBtN39mv950u3Wk7gYyCnlAj0J1wVeRv6Aeh7HAVUR7CPZR1o
	9nNQi42J0v/2DjmGxrI0Lw8JszEqJgcFjHJf1sxphDvNd4JMHl7iLhHIbQHCWmnwkGLxHwtZnka
	Mr5EeQZvaCaznFAVDWO4TTmAFA7CM5BautRSNj0SyUMZkdKBYH9EcRJHosc6hwVWLbz0HLB9Oac
	DNAeS/NaFB4h4MFfidd+o+SdJvNUy0TmVkHnWJPj5crDsxWvOYpssuwv2FOHqdmlBZ6eqTljD2/
	hy450HdGpkMAx0LMPqx5PVLb+9hUKJvPRj860wGo8xps8b4Y6wY3SmzRcvSv4V596MKpqfzE/Nn
	B4ZZXjt13BS6AvNpAeN
X-Received: by 2002:a05:600c:1d0e:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-49987941a4amr303250995e9.1.1786958610438;
        Mon, 17 Aug 2026 02:23:30 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499877d7974sm181552305e9.1.2026.08.17.02.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:23:30 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:23:28 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: Re: [bpf-next:master 2/5] net/core/bpf_ksock.c:221:18: sparse:
 sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be
 static?
Message-ID: <aoLTELXtjRC_SEcg@gmail.com>
References: <202608171256.McaD8rfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608171256.McaD8rfl-lkp@intel.com>

On Mon, Aug 17, 2026 at 12:36:48PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> head:   c93cbdb13f995f87b5356329b3fe551c80bb482d
> commit: 7ae4eb14c5f9d9bf0e0feabeab206151b1280512 [2/5] bpf: Add ksock kfuncs
> config: nios2-randconfig-r112-20260817 (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608171256.McaD8rfl-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> net/core/bpf_ksock.c:221:18: sparse: sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be static?

I'll add the 'static', it seems to make sense. I mostly copied this from
all the others examples with release_dtor functions which don't have
them but it seems for no good reason.

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
