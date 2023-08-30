Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A411B2F5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 20:42:30 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a7e68f4214so32596b6e.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693428149; x=1694032949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eR+pcB9DZ+j4/aw+gEyOHPukUBXxSsEx0gYXhxMIsQU=;
        b=VJcLakE83diKiDHipGXTHiumY1bmLMIh6WcH2BHs+x7dWv3Dh8Rvd0nCmhxR2fvk45
         blIrH19vd6cg9PQW+by83ppJfxGSrb1cK5JJTn06dmz68lDeMpB/UVFKYZ3kdZ89NZ+R
         tRZZf2wpB82bvVgzfM2m1iXVMXyu6cpJVw+V/dXKGFkXKUH7gNF70UmtZKdWoTGOA+C+
         IhHt6D7Phpwa807nLLZ/le/Uwo8gN2QKNYjNDb3h8pPaWRLbNMxwdm0LY/DuryZvVO72
         vwyvYVlf/GYNUtETnvL0+c249YankP+EJCg8XGcMxSeXA06ONpoTeORejU4e6tz0LPY8
         54bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693428149; x=1694032949;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eR+pcB9DZ+j4/aw+gEyOHPukUBXxSsEx0gYXhxMIsQU=;
        b=Y8eS2PXH7/8jj15hbDVJdkPyMNrMkDzwX7j+9/fAjyW05DfRBqZZlmCVMijAjNaedB
         IHfz/ntaLdzhX+2v5lMET7T08GyJAv04kBiIeNR36IrNjVEQJpyz1bmDx+KMn/LrqQ4L
         fMEGLMahVJL96lH4ZrfgxsXwe5wnA3pzlOpj05tYTmIZRVXx3xAxYvtc7IgXxbLtJ1pO
         mwBXPGqjFehULQHWnj7YMFaTnMy4EDha5EOI1ZDOylkr44iXQwRK/QKq+MLaEkLCRwOV
         VWrjjzoBVgomodOdtfb5E62atDnOqmXJWx+lPzrGpDy8Xw7jkJFh0AH7Wxy6ot7vj4Oh
         n3bA==
X-Gm-Message-State: AOJu0YxvWUHvYme3m3QrBgdW0yq3JPPrFk6KwrMU9BNtPev3BOS9WMI0
	ybcwGs7MJvxIA4mfI6YvLCGWCg==
X-Google-Smtp-Source: AGHT+IEdLSqSwxr0ZCqNRFh7qOZui4elggOXEnYulBX0bcQ5Rv9eOcHHZE586WDrW0/37d2KUa+RbQ==
X-Received: by 2002:a05:6808:182a:b0:3a8:1877:2d28 with SMTP id bh42-20020a056808182a00b003a818772d28mr3744377oib.50.1693428149281;
        Wed, 30 Aug 2023 13:42:29 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id k9-20020aa792c9000000b0063b96574b8bsm10422253pfa.220.2023.08.30.13.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 13:42:28 -0700 (PDT)
Date: Wed, 30 Aug 2023 13:42:28 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Aug 2023 13:38:30 PDT (-0700)
Subject:     Re: [palmer:for-next 83/84] arch/riscv/kernel/ptrace.c:123:18: warning: unused variable 'size'
In-Reply-To: <202308310306.tOrkoBmI-lkp@intel.com>
CC: andy.chiu@sifive.com, oe-kbuild-all@lists.linux.dev
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lkp@intel.com
Message-ID: <mhng-9f10d921-5a58-4519-9313-c762d00abc6c@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 30 Aug 2023 12:59:21 PDT (-0700), lkp@intel.com wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
> head:   046ba817faa2e609c3751e2ee388d427fe9dd470
> commit: dbe46b0940261301a038bbe1d699b29158b35a8d [83/84] RISC-V: Add ptrace support for vectors
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230831/202308310306.tOrkoBmI-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310306.tOrkoBmI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308310306.tOrkoBmI-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    arch/riscv/kernel/ptrace.c: In function 'riscv_vr_set':
>>> arch/riscv/kernel/ptrace.c:123:18: warning: unused variable 'size' [-Wunused-variable]
>      123 |         int ret, size;
>          |                  ^~~~
>
>
> vim +/size +123 arch/riscv/kernel/ptrace.c
>
>    117
>    118	static int riscv_vr_set(struct task_struct *target,
>    119				const struct user_regset *regset,
>    120				unsigned int pos, unsigned int count,
>    121				const void *kbuf, const void __user *ubuf)
>    122	{
>  > 123		int ret, size;
>    124		struct __riscv_v_ext_state *vstate = &target->thread.vstate;
>    125		struct __riscv_v_regset_state ptrace_vstate;
>    126
>    127		if (!riscv_v_vstate_query(task_pt_regs(target)))
>    128			return -EINVAL;
>    129
>    130		/* Copy rest of the vstate except datap */
>    131		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
>    132					 sizeof(struct __riscv_v_regset_state));
>    133		if (unlikely(ret))
>    134			return ret;
>    135
>    136		if (vstate->vlenb != ptrace_vstate.vlenb)
>    137			return -EINVAL;
>    138
>    139		vstate->vstart = ptrace_vstate.vstart;
>    140		vstate->vl = ptrace_vstate.vl;
>    141		vstate->vtype = ptrace_vstate.vtype;
>    142		vstate->vcsr = ptrace_vstate.vcsr;
>    143
>    144		/* Copy all the vector registers. */
>    145		pos = 0;
>    146		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
>    147					 0, riscv_v_vsize);
>    148		return ret;
>    149	}
>    150	#endif
>    151

Thanks, 
https://lore.kernel.org/r/20230830203754.24940-1-palmer@rivosinc.com/ 
should fix it.
