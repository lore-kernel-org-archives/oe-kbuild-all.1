Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B02EA8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 03:31:30 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id g65so10327308pgc.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 20:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681615890; x=1684207890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjeEy5ULGrDULBX1ItXV0d2QcNX0rRG2/eteK+KuAoI=;
        b=M/nWmTVdu0YxzmSJntss1YOmDxAjmE/GtrRuumB4MpBtw51xAKy8bdcd+T3m4oSLqB
         esNmYz8hBF+hT58WQw9JuJJzR5Eqa9oTLSr2UGtuzhLyycUVtJsHUmgG1+DbumXJu0Rl
         NfkC2mzQUqglCB1WLrNH/r/rNEfr+51L1A0ErR8zAdMDTlZn3O8LeNOxFVWHum9hf9dw
         fxcQ84MKljG6za7M0utyEqT/r3GsrljZl7rDO7V2z2+qXwfKBayMEo1sy5a4/WChYJGF
         RQwBCEKpWgya6ymMPxbwwrkIWbR0HISzNNS+IwOyhDdO7ZwdAMHgBqb6OYJiNY3yWa1v
         BwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681615890; x=1684207890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjeEy5ULGrDULBX1ItXV0d2QcNX0rRG2/eteK+KuAoI=;
        b=fcq67+h9UWZf3bgRVbWoHqukzdcw0OfOV1AJyRXBvG1ioqaBZxeRWjKdUeBwyGNokP
         ufaSpe4w+1vc2WdfXzcA+Shh54jAiXjflM9h5Pi7Qb8w0L1OyBEnI0top1oGxaWmf1iW
         7VRYwLA7/uwamOiFzWqj0QnSuZUaFRWCqHpealQ7biW+aq8yZDA5+wloM+ST9LaqyfPc
         pMleOT/N1+ipkrCRi+DDDEwLnPs+8IbrYtzSlr4ji/viUc/kLHnKsLCJLGirb0heAlMl
         La1qB8+GI9IvJnToOKcUfkB9TW1ejkdrjhwo4njtjbtZKPjyhw5O/MZmfji31hPCT4MF
         I50Q==
X-Gm-Message-State: AAQBX9ch9RPOiQIiRv0B+/0Bdwj/7WG7TSmC2qbahQinxRFyP7d5MTld
	fuwYzPsQ8RcfzTxiTQrQL2UbBhKsPkBIrshuX3d09w==
X-Google-Smtp-Source: AKy350ZKe14U8RcoJ0rqKV44dc6s9km1gogrAzuwrrkg9jPwdTmhuq6/Rs1+82DYNXnDmzh0v7CW6bXhoMUzguC6a8E=
X-Received: by 2002:a63:1a0f:0:b0:513:9350:c5bd with SMTP id
 a15-20020a631a0f000000b005139350c5bdmr1910375pga.4.1681615889591; Sat, 15 Apr
 2023 20:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230415164029.526895-3-reijiw@google.com> <202304160658.Oqr1xZbi-lkp@intel.com>
In-Reply-To: <202304160658.Oqr1xZbi-lkp@intel.com>
From: Reiji Watanabe <reijiw@google.com>
Date: Sat, 15 Apr 2023 20:31:13 -0700
Message-ID: <CAAeT=Fy1gvJSDt7J2+NZN=PWdQ_r18vNGkVT+EbSrE5ZkNCzCA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] KVM: arm64: PMU: Don't overwrite PMUSERENR with
 vcpu loaded
To: kernel test robot <lkp@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, kvmarm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, Shaoqin Huang <shahuang@redhat.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15, 2023 at 3:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Reiji,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Reiji-Watanabe/KVM=
-arm64-PMU-Restore-the-host-s-PMUSERENR_EL0/20230416-004142
> base:   09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
> patch link:    https://lore.kernel.org/r/20230415164029.526895-3-reijiw%4=
0google.com
> patch subject: [PATCH v3 2/2] KVM: arm64: PMU: Don't overwrite PMUSERENR =
with vcpu loaded
> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230=
416/202304160658.Oqr1xZbi-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/276e15e5db0900394=
4d194da2b2577cff5192884
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Reiji-Watanabe/KVM-arm64-PMU-Res=
tore-the-host-s-PMUSERENR_EL0/20230416-004142
>         git checkout 276e15e5db09003944d194da2b2577cff5192884
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Darm64 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304160658.Oqr1xZbi-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>    aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__k=
vm_nvhe___activate_traps_common':
> >> __kvm_nvhe_switch.c:(.hyp.text+0x14b4): undefined reference to `__kvm_=
nvhe_warn_bogus_irq_restore'
>    aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__k=
vm_nvhe___deactivate_traps_common':
>    __kvm_nvhe_switch.c:(.hyp.text+0x1f6c): undefined reference to `__kvm_=
nvhe_warn_bogus_irq_restore'

It looks like this happens when CONFIG_DEBUG_IRQFLAGS is enabled.
I am going to introduce another flag to disable this as well.

Thanks,
Reiji
