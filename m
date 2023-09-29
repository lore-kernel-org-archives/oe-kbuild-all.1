Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC41516E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 16:16:32 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c604a5a53eso117322715ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696004192; x=1696608992; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8ED9VoqMtCkpTtLFW76301m/H4UqXDUmHKK4VWKxuU=;
        b=Q8yXrazHr3x20PTqaeeVD6HvVkknD8rOwcZRCwrBPPbNUum9nYgiWcFB1+GDtr1Inj
         ttdY/hQeVGwo9XuWjVv+6EkI2yNF3mihP0IMN7SsakgdrLvR6fNDDeuo5sCVqovHpvKK
         0XR/uhB3/alq/UxAmn2ZbOAeuiio883quY6/7Rv7HUn/t3UIWgpdwQbz5M1+Xe6o7wj0
         9rm1bNhLpdV7AIVSpm4Trhym0Wz0FPPZINwlOCRQSlWvrttQYdzyeDi0x92GV8FBWTzl
         ZkL4G6K8m7NHj72fZPVyFnlORX15z35OJBF/Ar8ctu48QPmdyuo6UMJvNEy6AooW/JAl
         zklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696004192; x=1696608992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8ED9VoqMtCkpTtLFW76301m/H4UqXDUmHKK4VWKxuU=;
        b=BsmLsLw2AqnIChhHqZNMs7bXZedklN9+fzhVh4N+PBSGRxKWIzlCQ88oZDCZQTOd8p
         1TdzXlepbnHuLWmyT6OObSF4vigiwvO2xu8qntCglulvhJ7ojn/iHLL/Tc3aGDfn/NP8
         Rg7mNfEi34k9QoLgyI8vBqh0NY0Xg3AIaBi3s9MJa25lkQFa5IAmu3nBMtKI5MdxeWSc
         YCMXTMutz313tDI6y38Yayb0rBdXf+5e28brQWJZ6EoulAJ25f4pgqGim9+mBbaboAcA
         UTgcdNIHarVXunYKKBkMy7F438+dzQYQ0Q3itk15+KZYEbWIAiXqQ0fw28TrnsnhpWrn
         qhuA==
X-Gm-Message-State: AOJu0Yw/wLWHhlfV5t8TxaE73oLCwgDvEUtaE06d28/zkUgmhI2bc8d9
	yanLcw9ei1nqPJC7AKQX6wuB5breOo8=
X-Google-Smtp-Source: AGHT+IEcMBD7diQ2LsTM7SpHys4JB1miD267Z1vsK5Ye4CIryM3/plPRl3GXLRwP4mzyviTl1KO7x4CE6Ps=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4c9:b0:1c7:2bb4:54fb with SMTP id
 o9-20020a170902d4c900b001c72bb454fbmr63696plg.4.1696004191965; Fri, 29 Sep
 2023 09:16:31 -0700 (PDT)
Date: Fri, 29 Sep 2023 09:16:30 -0700
In-Reply-To: <202309291557.Eq3JDvT6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230928162959.1514661-4-pbonzini@redhat.com> <202309291557.Eq3JDvT6-lkp@intel.com>
Message-ID: <ZRb4Xt2ORf7gT5Cu@google.com>
Subject: Re: [PATCH 3/3] KVM: x86/mmu: always take tdp_mmu_pages_lock
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 29, 2023, kernel test robot wrote:
> Hi Paolo,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on kvm/queue]
> [also build test WARNING on linus/master v6.6-rc3 next-20230929]
> [cannot apply to mst-vhost/linux-next kvm/linux-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-x86-mmu-remove-unnecessary-bool-shared-argument-from-functions/20230929-003259
> base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> patch link:    https://lore.kernel.org/r/20230928162959.1514661-4-pbonzini%40redhat.com
> patch subject: [PATCH 3/3] KVM: x86/mmu: always take tdp_mmu_pages_lock
> config: x86_64-buildonly-randconfig-004-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291557.Eq3JDvT6-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291557.Eq3JDvT6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309291557.Eq3JDvT6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/x86/kvm/mmu/tdp_mmu.c:289: warning: Excess function parameter 'shared' description in 'tdp_mmu_unlink_sp'
> 
> 
> vim +289 arch/x86/kvm/mmu/tdp_mmu.c
> 
> 43a063cab325ee7 Yosry Ahmed         2022-08-23  278  
> a9442f594147f95 Ben Gardon          2021-02-02  279  /**
> c298a30c2821cb0 David Matlack       2022-01-19  280   * tdp_mmu_unlink_sp() - Remove a shadow page from the list of used pages
> a9442f594147f95 Ben Gardon          2021-02-02  281   *
> a9442f594147f95 Ben Gardon          2021-02-02  282   * @kvm: kvm instance
> a9442f594147f95 Ben Gardon          2021-02-02  283   * @sp: the page to be removed
> 9a77daacc87dee9 Ben Gardon          2021-02-02  284   * @shared: This operation may not be running under the exclusive use of
> 9a77daacc87dee9 Ben Gardon          2021-02-02  285   *	    the MMU lock and the operation must synchronize with other
> 9a77daacc87dee9 Ben Gardon          2021-02-02  286   *	    threads that might be adding or removing pages.
> a9442f594147f95 Ben Gardon          2021-02-02  287   */

The bot is complaining about the kernel doc, i.e. the above @shared documentation
needs to be deleted.  Took me a few seconds to understand what the complaint was
about...
