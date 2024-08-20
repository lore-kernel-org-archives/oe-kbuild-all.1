Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C6715534B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143792; cv=none; b=rvul+1MBRp8ZspPI7iWPK4xGIdcyV6h9TxpKzI9rNBiIkm84UJqtBD6qle/KHR7eIdAWtW4LrEFDx9Sr6qLr37ap3+teSTbAJaLOoq2be/9+HvulvLFlxIdjkLjFk10chc7+LhurWBL5uXaS1gmPgqMoiQO5v9lif3g2SNAjO9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143792; c=relaxed/simple;
	bh=ZuLJpDNd6eqRAPO6Aa71nXLB1ln53B/diFlYAIMMu6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBDd9BxmBDIAQW7ddw33uzWyLfh5JmQ8hriSBkbHfNl+XmmTELcUUKJUtJB417xJX5bsK+QD6DW+8Y49Sz9cAuMbFGnxiUHXF6ntQIqAPT5Y7eOEAYUAPDMwe0Boi+63qNs9ISMa5xrbH6cd+lJukqVFd2VRACc+stK+SDbOnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaohNU5D; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaohNU5D"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37198a6da58so2960550f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724143789; x=1724748589; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg9dJIN/hiobsnuENkgWKW4tMAbr4qvFo2moMhu7vdU=;
        b=LaohNU5Dvyr0n4ZaxAB2QuLgXV1ftbVz/tKdZVgwSZBXZQkK5qGTxu37+WHBNZQf9n
         7s0EH/v4qiRvkvho1OspmFWWPCi8XXRehpOzzqb7WGgMR5WCE5xZTvthGaky3WYx16C/
         GhfOoAwgLZyd3s+eEEhD5TQHDAnrAHE1XIVEgw3jwkRempDPLb4mUAsa43doQcGmbj85
         JsErY8L87fN9XpZwn84sUncleCi4q31BRdZx0ZZBaYKV4mAU2e4XhLyz5LQKA9YkNgiJ
         17QeHvjwpLaYhud+lTO+LHp16vyYApN3/z212IZ31pkcp+aYWHm81nnXxR/noz1C/J/A
         lwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143789; x=1724748589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lg9dJIN/hiobsnuENkgWKW4tMAbr4qvFo2moMhu7vdU=;
        b=LbwUY6/4V34ydlKtCFRqGpQGmpVx1JBV3I3g462u9vrpn5Pk/gDUBwTYCmCx7P4YWm
         IpgUa2lFEPHXdiXpzSsf5LD66nPp/tqsekZ1hq7NZZ05btQzpY5hzYsFuWkIBvcO+XGk
         D9kjXmE6a1FIuw0qhSJJSU3Z02xhOPT9O0yUyIb51zJJCcCgxiry9G0gt573GIb1S7Kf
         isPogAcJkUiPCdFFHi993sUAIkC7hO6946ByC/mf6waxF0ryAi+1EFp9YzOae9bw2/Jj
         WwINLBt2PzNFLustIlUqnv/zFsYtfblN0YbOY5uBoRezDiCkRooFBk5iyEoaKo6Q+8KK
         JjmA==
X-Forwarded-Encrypted: i=1; AJvYcCVg2lI545fPOziWgsGFKyVsslkIHMEGTNoJbOgV1TkwJ1+dT+Fg0ks2tHlu/i+rB5EL4GQAehUrc+I+ui6H@lists.linux.dev
X-Gm-Message-State: AOJu0YyHm01U0xOSsXpoNv+0FsBPfMNS0uqZ2Iz3bprH0XyhbFT7GM3h
	3Kq2lDXnjWGpRUqCuIoXyb2dc4rJCSGeJx/h6nBAZawgGdl5h8bKu/W8j3cKx3LVHq796naM9z/
	1OEKvQ6W/hWmeBHFYDy+SF7nU8oc=
X-Google-Smtp-Source: AGHT+IFl1anUYNa4FEC9klpgIUgBfM1uAYHx0Cm1xw4Sl52EjyYY0wMF0UPRDb7vLO5PAlVajoCL0hkHQ/xxsJo/UCg=
X-Received: by 2002:a5d:6751:0:b0:367:90cc:fe8b with SMTP id
 ffacd0b85a97d-37194649ca0mr9476564f8f.27.1724143788583; Tue, 20 Aug 2024
 01:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820000245.61787-1-technoboy85@gmail.com> <202408201433.eqBpp8z9-lkp@intel.com>
In-Reply-To: <202408201433.eqBpp8z9-lkp@intel.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Tue, 20 Aug 2024 10:49:12 +0200
Message-ID: <CAFnufp2zP-J7r_0zh=NYBbeMMpJkFnHvm6aZB2RP4Y1rR+7h+Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: use kfunc hooks instead of program types
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Jozsef Kadlecsik <kadlec@netfilter.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shuah Khan <skhan@linuxfoundation.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 20 ago 2024 alle ore 08:59 kernel test robot
<lkp@intel.com> ha scritto:
>
> Hi Matteo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Matteo-Croce/bpf-use-kfunc-hooks-instead-of-program-types/20240820-080354
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20240820000245.61787-1-technoboy85%40gmail.com
> patch subject: [PATCH bpf-next] bpf: use kfunc hooks instead of program types
> config: arc-randconfig-002-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201433.eqBpp8z9-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201433.eqBpp8z9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408201433.eqBpp8z9-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> net/core/filter.c:12084:38: warning: 'bpf_kfunc_set_sock_addr' defined but not used [-Wunused-const-variable=]
>    12084 | static const struct btf_kfunc_id_set bpf_kfunc_set_sock_addr = {
>          |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/bpf_kfunc_set_sock_addr +12084 net/core/filter.c
>
> 05421aecd4ed65 Joanne Koong  2023-03-01  12083
> 53e380d2144190 Daan De Meyer 2023-10-11 @12084  static const struct btf_kfunc_id_set bpf_kfunc_set_sock_addr = {
> 53e380d2144190 Daan De Meyer 2023-10-11  12085          .owner = THIS_MODULE,
> 53e380d2144190 Daan De Meyer 2023-10-11  12086          .set = &bpf_kfunc_check_set_sock_addr,
> 53e380d2144190 Daan De Meyer 2023-10-11  12087  };
> 53e380d2144190 Daan De Meyer 2023-10-11  12088
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

It seems that I removed one too many calls, the last one was using
bpf_kfunc_set_sock_addr and needs to be kept.

-- 
Matteo Croce

perl -e 'for($t=0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
