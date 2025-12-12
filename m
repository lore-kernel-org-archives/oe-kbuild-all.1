Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D930DD00
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571272; cv=none; b=n5a+U5OFN2/I9vWzUEXTx/2yV4XuRRREPCM1NoeUo1dt42ZKQ2cymPFGlflHtkvOtV+PfU+IhE50696WnczskwFfm3TisvjvOdWBhXP8QtGa1tMUE3DkNr227cr1GK0aJ466TfUWddQtBYKAbp0rbP5APn+Ywtrxh9NCg4mucWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571272; c=relaxed/simple;
	bh=xi7nKKP19jWf1tsN8ro67KKFXkP+49bDKSOt9hT+rz0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Nzum8hBozoYGCEwLkQrWfwkHtLwszrB1SL2hbscw+bfJdDgAXuVN5ApVWbnUOtXn0MSJjYyLPjGr8j8uYaMis8XZ0N6UREJ65Hivi3uYd+Xo/Q2lU01LZpK3KzcGn3f4oXIF8telQsZM8i0YGx1LksVbhHnu4s3ox+kukpdr2gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEJV3R9n; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEJV3R9n"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-450be8a012cso2112709b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 12:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765571268; x=1766176068; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzm/tsqAvW56TDo978ZmdNBfUInnyBjt6fplMac4YIM=;
        b=oEJV3R9nE7Vdz0C/ACXwBskulKG7MFBmC1x+4qfq/qxw90ifFE/zmGAdGUI5IFltdr
         4yE7MQbSaVki3ArIK50fIa3bGdcPKKM2Aj0YSesevrEpeiZu/3rUohME5QLcEklmfWfU
         ZGSTlS0NSlizK4XWu/zp22Q4NWmdCpnerDT0pcWJ2ACNfGtditp98qNTXFmb4HOTh3Lq
         Q6KULlsTLMnf6pFs7zqKjwfFUynBOVSQN4dyvSCrfALOWvLchSEtqIa3Hrg+g24H1eWh
         x0nhn38alCNwCtDPZ2z0C/yIzX1elKuJyHzOslP9iSZLw8B61bye+/jbvuFcYhvAvBvP
         /jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765571268; x=1766176068;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fzm/tsqAvW56TDo978ZmdNBfUInnyBjt6fplMac4YIM=;
        b=OUyxp8O4yXixhI0ZClBcocwe8B5AmOvTBGmbgm+mE/ejAtCI4TpMKSNmjUZD0YArTY
         QIyeDb1rWSaoxg5QPKuluiaqwd5HXYGCA4TIQuTzGu6pNi0r5Ko3IpwhAFAPpx1k+apN
         Sx2gutXRHM82g8haiOhOZ9j76HRznfkle+nVWqLRCeQmDyIfEgtTgFoIWJ/i5JmhlE/F
         6ePFodCyDWhWtkYbziIuIAzgo+MYZWJUhtaWzy8DWalYpIjali5CrsemCv2mb1nWgAXS
         xaTwcxfuUoWvkXQ9feAtmEoKYVFm3LaCPWiUA+Flw9RcmP2RlxkT4gjfRDpK77IAdewt
         MdpA==
X-Forwarded-Encrypted: i=1; AJvYcCWDlS32rbNG8dQdED082eYgm+o1XOWzL9/etYa5cYMkwrL2l51HXFwvHvuyKibsyESBkuL0kwAwrsIg1zAC@lists.linux.dev
X-Gm-Message-State: AOJu0YyzfhzglXvj1mOGjK3MleXMHLGrITxLidyl5/hHyNI3VquNcbV0
	/4XxO9nIdGptJ9Eb9vGI3gxPNV2TnstbwqItAWbG1+uONsj926jvIx2bp9RnF8q1h+p4ho+CX93
	IPRUMnduoFiLgj5c/0wyx8DBkmg==
X-Google-Smtp-Source: AGHT+IHtS4CSArf4CIQyXaQ3gTcwhHkWk1+dzcc15H4XApucHfZc+0GcjKfr0Sr/upH3+2NzDR6Jy4cUsIgV3mtOEg==
X-Received: from oiks6-n2.prod.google.com ([2002:a05:6808:a606:20b0:450:c024:a4f7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4fd0:b0:44d:a0ec:d9a5 with SMTP id 5614622812f47-455ac822609mr1365623b6e.1.1765571268278;
 Fri, 12 Dec 2025 12:27:48 -0800 (PST)
Date: Fri, 12 Dec 2025 20:27:47 +0000
In-Reply-To: <202512110209.GjVZa9ti-lkp@intel.com> (message from kernel test
 robot on Thu, 11 Dec 2025 02:31:00 +0800)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <gsnt4ipv4f98.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 11/24] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: kernel test robot <lkp@intel.com>
Cc: kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, skhan@linuxfoundation.org, 
	gankulkarni@os.amperecomputing.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

kernel test robot <lkp@intel.com> writes:

> Hi Colton,

> kernel test robot noticed the following build errors:

> [auto build test ERROR on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]

> url:     
> https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20251210-055309
> base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> patch link:     
> https://lore.kernel.org/r/20251209205121.1871534-12-coltonlewis%40google.com
> patch subject: [PATCH v5 11/24] KVM: arm64: Writethrough trapped  
> PMEVTYPER register
> config: arm64-randconfig-001-20251210  
> (https://download.01.org/0day-ci/archive/20251211/202512110209.GjVZa9ti-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.3.0
> reproduce (this is a W=1 build):  
> (https://download.01.org/0day-ci/archive/20251211/202512110209.GjVZa9ti-lkp@intel.com/reproduce)

> If you fix the issue in a separate patch/commit (i.e. not just a new  
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:  
> https://lore.kernel.org/oe-kbuild-all/202512110209.GjVZa9ti-lkp@intel.com/

> All errors (new ones prefixed by >>):

>     arch/arm64/kvm/sys_regs.c: In function 'writethrough_pmevtyper':
>>> arch/arm64/kvm/sys_regs.c:1183:34: error: implicit declaration of  
>>> function 'kvm_pmu_event_mask'; did you mean 'kvm_pmu_evtyper_mask'?  
>>> [-Wimplicit-function-declaration]
>      1183 |                 eventsel = val & kvm_pmu_event_mask(vcpu->kvm);
>           |                                  ^~~~~~~~~~~~~~~~~~
>           |                                  kvm_pmu_evtyper_mask


Caused by missing a stub definition for kvm_pmu_event_mask when
reorganizing headers in patch 6: Reorganize PMU functions

Fixed

> vim +1183 arch/arm64/kvm/sys_regs.c

>    1168
>    1169	static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct  
> sys_reg_params *p,
>    1170					   u64 reg, u64 idx)
>    1171	{
>    1172		u64 eventsel;
>    1173		u64 val = p->regval;
>    1174		u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
>    1175			ARMV8_PMU_EXCLUDE_EL1;
>    1176		u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
>    1177
>    1178		__vcpu_assign_sys_reg(vcpu, reg, val);
>    1179
>    1180		if (idx == ARMV8_PMU_CYCLE_IDX)
>    1181			eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
>    1182		else
>> 1183			eventsel = val & kvm_pmu_event_mask(vcpu->kvm);
>    1184
>    1185		if (vcpu->kvm->arch.pmu_filter &&
>    1186		    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
>    1187			val |= evtyper_set;
>    1188
>    1189		val &= ~evtyper_clr;
>    1190
>    1191		if (idx == ARMV8_PMU_CYCLE_IDX)
>    1192			write_pmccfiltr(val);
>    1193		else
>    1194			write_pmevtypern(idx, val);
>    1195
>    1196		return true;
>    1197	}
>    1198

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
