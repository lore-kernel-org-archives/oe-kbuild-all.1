Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4319B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 23:34:16 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w5so7350100plg.8
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Feb 2023 15:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UyGodDrgVbW0z9vHbO6dRS1h5TgV34tLPKV1nOObYPE=;
        b=eyDR2QFCECgTVpU6uBT0rgxpJkwoETu4DtvRB4vzaVFyRBSXdvc2nAkwl4ardBete4
         1jjkX8UJ/zCN3xq/1mTTeryi2J/N3f+aJkduSxSASkpHpt7KA9vmAxYqZrOswzs1xw+Q
         y4OorlG2BJJ41HQVl/8eSpwQudZ4d7wD56Qk8YcRUoSqI8s7GmJT3bV/8PehDH5ieD0M
         3zl6TR2PxOSuquqTCmn2gN3YYfI208/mCG+fVwApw7XOSakrt6pe5e+Kg2qo5F9bz02g
         tofyVABcUz6g1RfL27w2if3IOlBdbNPAuTQRyDZfHkFX/o/oS9BoZZNCk3nxvUKHr3FP
         FzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyGodDrgVbW0z9vHbO6dRS1h5TgV34tLPKV1nOObYPE=;
        b=8O+b9SlGls0fwCOiFL5dkO8pJwpr8YcMfApnT5XAZrcIJa4ikfCsUOyy+y6pWNq7p4
         4EgNd0wNRQqtp5joF46C7NwVZ24gdwAmYKY9hH4o0rAyvqlVDQ6Z7pQmXT7npYDeB8UF
         iA7Ay+mfqQJkh3cNyY0ltSPAG15pI3rrHtrC2r7Xt5NNEs8Rv3Jjc/mFbz8Gu7OxudHd
         WitkJmID9fW2sj/eM4NsiEFD66M0/F3ltiDuD0l4X9cCEwH4AsIcngZmlaOk4+ahRWJf
         t16DvUiBZVRSEJ4P1OAkjoyQjpbkJxGJsLLiB1mlaaZcmLwhGN7lxMlah240BupuYfhJ
         bPNg==
X-Gm-Message-State: AO0yUKXNCWxeXTs9u/10tPCQPz5xv8e8ZyztH51wM/v3wnrG5EvaXmNX
	94ShrIs64T8IzEf1YUM6Sqp/dw==
X-Google-Smtp-Source: AK7set/YVwxb1mXwzCS5mGYWzZJA9CeM/GgF0TebmxygOCWPdcLln7kuV0tn96ZC9SaW8voyRbgmfA==
X-Received: by 2002:a17:902:d502:b0:198:af50:e4de with SMTP id b2-20020a170902d50200b00198af50e4demr84917plg.4.1675812855533;
        Tue, 07 Feb 2023 15:34:15 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id c6-20020a17090a1d0600b00229b17bb1e8sm83823pjd.34.2023.02.07.15.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 15:34:15 -0800 (PST)
Date: Tue, 7 Feb 2023 23:34:11 +0000
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast
 truncates bits from constant value (ffffffffff000 becomes fffff000)
Message-ID: <Y+Lf8w9h29cRmcJG@google.com>
References: <202302070638.iEBPQ4gL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302070638.iEBPQ4gL-lkp@intel.com>

On Tue, Feb 07, 2023, kernel test robot wrote:
> Hi Sean,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

Is there a way to mark this as "working as intended"?  The truncation is intentional.
I've been ignoring the reports, but they just keep coming :-)

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d2d11f342b179f1894a901f143ec7c008caba43e
> commit: 70e41c31bc7776b262cd9f524df3dfc2b5869a0a KVM: x86/mmu: Use common logic for computing the 32/64-bit base PA mask
> date:   8 months ago
> config: x86_64-randconfig-s023-20230206 (https://download.01.org/0day-ci/archive/20230207/202302070638.iEBPQ4gL-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70e41c31bc7776b262cd9f524df3dfc2b5869a0a
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 70e41c31bc7776b262cd9f524df3dfc2b5869a0a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> sparse warnings: (new ones prefixed by >>)
>    arch/x86/kvm/mmu/mmu.c:610:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_begin' - different lock contexts for basic block
>    arch/x86/kvm/mmu/mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, arch/x86/kvm/irq.h):
>    include/linux/rcupdate.h:726:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_end' - unexpected unlock
>    arch/x86/kvm/mmu/mmu.c:2550:9: sparse: sparse: context imbalance in 'mmu_try_to_unsync_pages' - different lock contexts for basic block
>    arch/x86/kvm/mmu/mmu.c: note: in included file:
> >> arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
>    arch/x86/kvm/mmu/paging_tmpl.h:426:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
>    arch/x86/kvm/mmu/mmu.c:4618:57: sparse: sparse: cast truncates bits from constant value (ffffff33 becomes 33)
>    arch/x86/kvm/mmu/mmu.c:4620:56: sparse: sparse: cast truncates bits from constant value (ffffff0f becomes f)
>    arch/x86/kvm/mmu/mmu.c:4622:57: sparse: sparse: cast truncates bits from constant value (ffffff55 becomes 55)
> 
> vim +106 arch/x86/kvm/mmu/paging_tmpl.h
> 
> b3fcdb04a98035 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-06-14  103  
> e04da980c35d75 arch/x86/kvm/paging_tmpl.h     Joerg Roedel        2009-07-27  104  static gfn_t gpte_to_gfn_lvl(pt_element_t gpte, int lvl)
> 5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-21  105  {
> e04da980c35d75 arch/x86/kvm/paging_tmpl.h     Joerg Roedel        2009-07-27 @106  	return (gpte & PT_LVL_ADDR_MASK(lvl)) >> PAGE_SHIFT;
> 5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-21  107  }
> 5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-21  108  
> 
> :::::: The code at line 106 was first introduced by commit
> :::::: e04da980c35d75fa050ba4009ad99025432d8d7d KVM: MMU: make page walker aware of mapping levels
> 
> :::::: TO: Joerg Roedel <joerg.roedel@amd.com>
> :::::: CC: Avi Kivity <avi@redhat.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
