Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476B22EF3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714027006; cv=none; b=o6e/JeKtIzdPIzzIOo5MiVBF2NhFrQAQAwP4h4ymOSWC3XKeSxel+7UTweHQMf+9j8FHdns6EWCvGPpWmk/66WPckMbS8+5qPvndYiXGdmUcuAKRoUBYhiyYkGlIVucD6JAHELUY6eGchuGSY16g8euNMnK2rXg369n2ybV9o7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714027006; c=relaxed/simple;
	bh=fXX7PNIq+eqUBp26vAao/Ry5cR8n5yzz3VEhOgtDbKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhcBmmzWQmFM4EnpcVzkx5+bLS4yEiOsTyc1HBu2jjYYttACTJV01hNV4NK8Nbdeaw7WMZXfC4nuL/iiuduNt3rXD/4fs45gfWQpSPnKg6rYS8sXXaZYPU2brDvvRvkQSKbHi+1gK12hFfDJLL+girepGFyb3NhmTx8mCSjGgwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hJneGBPw; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hJneGBPw"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so511703a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714027003; x=1714631803; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8/CVMgQfWxFUq1jS+amCjYb3SFmeSwZaVXuqq9MhTDg=;
        b=hJneGBPw+ne6uHhGth/ObAoDzA3rd18txRXbvt78L7CyoHZpv4An43E0I5neK1VBEi
         MBzUV1VYEAKnNQ8naGDZGae5SIOrSzPagtAA7CAZKe1/nJ4GljW4kkT4BQOjqM0sNw74
         isPD65IzC5xmbSiECqtJ2wqINxGTqH1uBfs0a4sdsRuNFIKBJZGWs/ID99UI/f0iSkSi
         tnHzV09WUpJX2nMvHAWs0oCSb74ASlg/+qycX7+d/VsJpZEi/5ND682Sfjrkw2vhVx34
         X6Y0Fxq632eANGiyloMrKF7jYgbPs5MwSzXPEZFJmLFkbTwmxOaA3eEFw2patXfzXd8/
         67tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714027003; x=1714631803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/CVMgQfWxFUq1jS+amCjYb3SFmeSwZaVXuqq9MhTDg=;
        b=Lk+4SUwB2rnWSZfc4BpCUlhfQS7BWBMITeLB14I3BAehE1CbMM5J7U+1mX3jbE/ARy
         GRdzXnZABdlVGmoy/DAxGNIIHMytEFd1whqPmXL6cDRlwDYiyJFWYI0U3D+2Qk2dAZfk
         xDGGLG4EpiWgInf2lEcSgQd6M2fBF82zAeC9oVqK9tidQlzVNSsY3N6m7qIpJELWZ10I
         0KDDX17lCMZ3getehapZOEJWq2RHpjiqfCHkSj4gCt/G+JR2Tu/C3LZBoBW9vI85Icb6
         LwBqbdgh7pFX8kUTMAkFqczE0/C2DUnJw2T9ADZhptxfxUXdCnxphIjB96Jk81dok7/G
         JX0Q==
X-Gm-Message-State: AOJu0YyGRkCZHI8e/8zBwPA8tS+Yj8Ai3mWwxfuyqUD19vJPhLMHyu5I
	nEZfjYWkhZo8E7OEXDmGSZpgTMKz557dCKlEfQOlORF6OXqs/hFIgjc7msfk/0JN8iRd3ugxLx5
	c4kIPaQ9o88N/O+DqlKeShgjHNO79jN3aaSvzSw==
X-Google-Smtp-Source: AGHT+IHyqZEcfsfPUmwPYTICqPTYsja7jffEAzz+Mo8AnWurcRqCd7FU3lPpsWSsWQ9HOzxVDXNmlkUL/ok4odKJ8/s=
X-Received: by 2002:a17:90a:fa06:b0:2ac:d9f:de9b with SMTP id
 cm6-20020a17090afa0600b002ac0d9fde9bmr5162954pjb.45.1714027003235; Wed, 24
 Apr 2024 23:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404250740.VhQQoD7N-lkp@intel.com>
In-Reply-To: <202404250740.VhQQoD7N-lkp@intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 25 Apr 2024 08:36:31 +0200
Message-ID: <CAKfTPtBmhCFWmeb7oaM3t3WMb0_RUwY32gzgVzyruYaP9VpfUA@mail.gmail.com>
Subject: Re: [tip:sched/core 26/27] drivers/base/arch_topology.c:204:17:
 sparse: sparse: incorrect type in initializer (different address spaces)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>, Qais Yousef <qyousef@layalina.io>, 
	Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 25 Apr 2024 at 01:22, kernel test robot <lkp@intel.com> wrote:
>
> Hi Vincent,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> head:   97450eb909658573dcacc1063b06d3d08642c0c1
> commit: d4dbc991714eefcbd8d54a3204bd77a0a52bd32d [26/27] sched/cpufreq: Rename arch_update_thermal_pressure() => arch_update_hw_pressure()

I'm going to look at this more deeply but this patch only rename
"thermal_pressure" by "hw_pressure" so unless I miss a renaming, this
should not trigger anything new.

> config: arm64-randconfig-r132-20240425 (https://download.01.org/0day-ci/archive/20240425/202404250740.VhQQoD7N-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240425/202404250740.VhQQoD7N-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404250740.VhQQoD7N-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
>    drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
> >> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
>    drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
> >> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
>    drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
> >> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
>    drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
> >> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
>    drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
> >> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
>    drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
> >> drivers/base/arch_topology.c:204:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long * @@
>    drivers/base/arch_topology.c:204:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    drivers/base/arch_topology.c:204:17: sparse:     got unsigned long *
>
> vim +204 drivers/base/arch_topology.c
>
>    164
>    165  /**
>    166   * topology_update_hw_pressure() - Update HW pressure for CPUs
>    167   * @cpus        : The related CPUs for which capacity has been reduced
>    168   * @capped_freq : The maximum allowed frequency that CPUs can run at
>    169   *
>    170   * Update the value of HW pressure for all @cpus in the mask. The
>    171   * cpumask should include all (online+offline) affected CPUs, to avoid
>    172   * operating on stale data when hot-plug is used for some CPUs. The
>    173   * @capped_freq reflects the currently allowed max CPUs frequency due to
>    174   * HW capping. It might be also a boost frequency value, which is bigger
>    175   * than the internal 'capacity_freq_ref' max frequency. In such case the
>    176   * pressure value should simply be removed, since this is an indication that
>    177   * there is no HW throttling. The @capped_freq must be provided in kHz.
>    178   */
>    179  void topology_update_hw_pressure(const struct cpumask *cpus,
>    180                                        unsigned long capped_freq)
>    181  {
>    182          unsigned long max_capacity, capacity, hw_pressure;
>    183          u32 max_freq;
>    184          int cpu;
>    185
>    186          cpu = cpumask_first(cpus);
>    187          max_capacity = arch_scale_cpu_capacity(cpu);
>    188          max_freq = arch_scale_freq_ref(cpu);
>    189
>    190          /*
>    191           * Handle properly the boost frequencies, which should simply clean
>    192           * the HW pressure value.
>    193           */
>    194          if (max_freq <= capped_freq)
>    195                  capacity = max_capacity;
>    196          else
>    197                  capacity = mult_frac(max_capacity, capped_freq, max_freq);
>    198
>    199          hw_pressure = max_capacity - capacity;
>    200
>    201          trace_hw_pressure_update(cpu, hw_pressure);
>    202
>    203          for_each_cpu(cpu, cpus)
>  > 204                  WRITE_ONCE(per_cpu(hw_pressure, cpu), hw_pressure);
>    205  }
>    206  EXPORT_SYMBOL_GPL(topology_update_hw_pressure);
>    207
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
