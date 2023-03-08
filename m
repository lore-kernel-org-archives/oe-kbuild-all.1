Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8935A7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 01:08:03 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id a9-20020a170902b58900b0019e2eafafddso8505824pls.7
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Mar 2023 17:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678237683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NtzlIfpk9YdNwky09HPcEQ6276tdVtHWZhXfb1xy5GE=;
        b=ime9ags+Wyv3pjLIK0fcn+N5WqR3JdATyDXWzSTdLotDDE3ci/o+5yTe9yKHSuMjAc
         cru7FeDNYTMaUQsVDmhI4quRop59dYffhWsIJi1MHArHFvFKJMv0igu7Rk80p/Dxlsui
         zKoqkbkDsGA/c4Wg+D+VFamrLovXTeWsjYa5S85F6o84I/j8ADGeIVl0WG5IuqppkH8m
         GQP55g8CWt/Jq6p8RCcAekT7mM4hTFKY6/bSppkFxb751q554Qm7sEQU3j2M9pw+m5C/
         cg8wbjUnihomOjHKoum9PuzMg8FRUBRPeYWQhsxAibmTxXUjb+/vLdg7IcbtzTi6wHco
         YL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678237683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtzlIfpk9YdNwky09HPcEQ6276tdVtHWZhXfb1xy5GE=;
        b=bR0IY4VJwDI1I4+jJpCX4nizHmQlwgIyL/VIgOWlCqlAlkyCHxHlGgxQz7xoxu9frz
         Eb2lVgm83IqYeu1W+P1SQSpsIYfBHl2eIUV6Ue1Poc205Ew6lCqjk0NYOvXRrgmjW5WU
         44/wuPf02B5f5Zo7znye/6HhNlhPpmKySSHwHgnYMk7esksbmyTH8ObUkUvqLe/14PaM
         Y4N69Pimn+LzwANHJTmnKC7ouIqnzdTGca2JHXN6hFs8XzSjaKXpBulCvk+9q77ybSCJ
         tv6U07cTrZoeANVqw2sWpYolmVIVhnPxb9HUg/CLFF/xrOz2FmJafmjElceDYt8jJPE5
         R7QQ==
X-Gm-Message-State: AO0yUKUuwYJ0swhxav1rI/hrD8AHdsXzEizOYzO6rhcLtL9jYBuVokWi
	Q5HMWfIQky6ZV7W4ZtrM6+rUOid3aMo=
X-Google-Smtp-Source: AK7set9jyf4N4HoUd9tny2NoKM+cjaI03S38wtivNHC6AdCk+Tj0xaeOWkit8U3qmrA5NiA/4ZV6s6HZ28s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:924d:0:b0:503:a26e:b4cf with SMTP id
 s13-20020a63924d000000b00503a26eb4cfmr5779022pgn.8.1678237682848; Tue, 07 Mar
 2023 17:08:02 -0800 (PST)
Date: Tue, 7 Mar 2023 17:08:01 -0800
In-Reply-To: <202303031630.ntvIuYqo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202303031630.ntvIuYqo-lkp@intel.com>
Message-ID: <ZAff8U7CmMxpY8Ig@google.com>
Subject: Re: arch/powerpc/kvm/e500mc.c:171:5: error: no previous prototype for 'kvmppc_e500mc_check_processor_compat'
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 03, 2023, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2eb29d59ddf02e39774abfb60b2030b0b7e27c1f
> commit: 7cb79f433e75b05d1635aefaa851cfcd1cb7dc4f KVM: PPC: Fix refactoring goof in kvmppc_e500mc_init()
> date:   5 weeks ago
> config: powerpc-randconfig-r001-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031630.ntvIuYqo-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7cb79f433e75b05d1635aefaa851cfcd1cb7dc4f
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7cb79f433e75b05d1635aefaa851cfcd1cb7dc4f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303031630.ntvIuYqo-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/powerpc/kvm/e500mc.c:171:5: error: no previous prototype for 'kvmppc_e500mc_check_processor_compat' [-Werror=missing-prototypes]
>      171 | int kvmppc_e500mc_check_processor_compat(void)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> 
> vim +/kvmppc_e500mc_check_processor_compat +171 arch/powerpc/kvm/e500mc.c
> 
>    170	
>  > 171	int kvmppc_e500mc_check_processor_compat(void)

Gah, should be "static".  I'll send a patch.
