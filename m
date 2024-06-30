Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7F0382
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jun 2024 00:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719708116; cv=none; b=kODf7BTeseZvVQC6QyhNmF2xbYLBjXeL14iWdlVguZpUvVIrN5whYGEPx1nSWS+NhfXFaRJCH/yUtSFh7fLgHMp9wmX/qmlribsX9Ph2fJVNIyHlrSzMsFcE5uu/7CTkd5vEZWo9D3CrL9rrSDHYeKSd3bsspJRSImg9vRp2PIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719708116; c=relaxed/simple;
	bh=wUlyF/XRywYSrjvKTEppoFaDB+cQL2gVFDu3/lnS4hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKoobhoWJbYsbHw7o0p8ENcmQkFdGPAJFON0iiGTlYkRYbWX1GOFCE3Ass0SsXPAisaUbjaJAwia8j3FAYBU1YOSSPf+FcnkT/+9Al7HbsQFIf75NNX3Zlni7KY8pjzkLxDKyxEc7ffc8Lg7Yj8uJb5mQxZrnz0DisyAJGvEVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M75Hmlch; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M75Hmlch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719708113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEiXQ9aL7vD+ezY1kzgQ7S/bRkTtxuYxyV9lLYvM12Q=;
	b=M75HmlchpXvZfGKsfXEsQXDNt2Ot0N9MuekYac5uMyIQTOMH/Qw2msr4XRGWl8FdXRafLH
	lZtRvMriRVweLSnl140vGanF4jzk9El4S9ZdTQ6Bb1uSXhB4IUllXLwtyJRXa7Mlnx3KlM
	LDbkLdImZ+WHqXzETt3toMOhWxWvIJY=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-NWOsDyolOGavgrYqFds63g-1; Sat, 29 Jun 2024 20:41:52 -0400
X-MC-Unique: NWOsDyolOGavgrYqFds63g-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-25bfed6a3f5so2125832fac.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jun 2024 17:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719708111; x=1720312911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEiXQ9aL7vD+ezY1kzgQ7S/bRkTtxuYxyV9lLYvM12Q=;
        b=cYPfI3NrhYCMdWB4B4Q+PsS5JJWLuYykBFP7BdUXHL53PubmIKQ4RAqdGybZIIFIZk
         HpeyxOv1sD2IupVHVzhexf8IYdF4G1YNA/jo9weSKKLCLURTK18L8g0VTY4kJYVMk7oG
         +iDh3Tz3Yv0Syrsg7z3aQE4wuAuwsRnlpWhZPGV5QtnJdQkEg6F2l55KNs1/WLPImEoX
         RcpENR4I5K0E9tA5pBl1vhnAZf7ScqWUWDHfgFFuaS0S6gF+w5tyivC2CMxvMyp7c4Z4
         axUq2N/N3HuCNMcYzqAgGHWugKeOqkoYz+HUixHPqlSUc375SV/WeQqeOW0CatnrfOye
         HKiA==
X-Gm-Message-State: AOJu0Yzr0/Su1HaIKfzQPyq/yioBf2LF6WSq0f7sn+og9gyiRWxo4LH7
	460BFtgBR+5HSRPUdnIBJL8JmYlmT/MqYcXXx4W9ZwfjR5JHyIJFSZSxOwrSeSqbU3Qqkx2AGE+
	hhx8d03q+D1Z5C5b9y0bSt/UB+KUfNF/klx9CC/IpsKuFKEKknSfFL6noVx+STb8=
X-Received: by 2002:a05:6871:88f:b0:254:bc92:9b8c with SMTP id 586e51a60fabf-25db36207b1mr2059168fac.55.1719708111451;
        Sat, 29 Jun 2024 17:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAmzjPLyZjiql5kYFRIhQp4Z5y5cfzxjwligwg5cXshSAkyl/MxU+AjigmC9ZNUm1rISEP6Q==
X-Received: by 2002:a05:6871:88f:b0:254:bc92:9b8c with SMTP id 586e51a60fabf-25db36207b1mr2059158fac.55.1719708111105;
        Sat, 29 Jun 2024 17:41:51 -0700 (PDT)
Received: from [192.168.68.51] ([103.210.27.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708043b704asm3815148b3a.152.2024.06.29.17.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 17:41:50 -0700 (PDT)
Message-ID: <b028f291-e4e2-4060-ba41-810b9d718d99@redhat.com>
Date: Sun, 30 Jun 2024 10:41:46 +1000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [arm64:for-next/vcpu-hotplug 17/19]
 arch/arm64/kernel/smp.c:563:2: error: call to undeclared function
 'unregister_cpu'; ISO C99 and later do not support implicit function
 declarations
To: kernel test robot <lkp@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>
References: <202406300437.XnuW0n34-lkp@intel.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <202406300437.XnuW0n34-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/24 7:14 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/vcpu-hotplug
> head:   4e1a7df4548003fc081360b0f4edce3f7a991bfc
> commit: 9d0873892f4d4bf62a351897e91e5169b4c6f4aa [17/19] arm64: Kconfig: Enable hotplug CPU on arm64 if ACPI_PROCESSOR is enabled.
> config: arm64-randconfig-r063-20240629
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406300437.XnuW0n34-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from arch/arm64/kernel/smp.c:9:
>     In file included from include/linux/acpi.h:39:
>     In file included from include/acpi/acpi_io.h:7:
>     In file included from arch/arm64/include/asm/acpi.h:14:
>     In file included from include/linux/memblock.h:12:
>     In file included from include/linux/mm.h:2253:
>     include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>           |                               ~~~~~~~~~~~ ^ ~~~
>>> arch/arm64/kernel/smp.c:563:2: error: call to undeclared function 'unregister_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       563 |         unregister_cpu(c);
>           |         ^
>     arch/arm64/kernel/smp.c:563:2: note: did you mean 'register_cpu'?
>     include/linux/cpu.h:38:12: note: 'register_cpu' declared here
>        38 | extern int register_cpu(struct cpu *cpu, int num);
>           |            ^
>     1 warning and 1 error generated.
> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_CPU
>     Depends on [n]: ACPI [=y] && ACPI_PROCESSOR [=y] && HOTPLUG_CPU [=n]
>     Selected by [y]:
>     - ARM64 [=y] && ACPI_PROCESSOR [=y]
> 
> 
> vim +/unregister_cpu +563 arch/arm64/kernel/smp.c
> 
> eba4675008a6e4 Jonathan Cameron 2024-05-29  539
> eba4675008a6e4 Jonathan Cameron 2024-05-29  540  #ifdef CONFIG_ACPI_HOTPLUG_CPU
> eba4675008a6e4 Jonathan Cameron 2024-05-29  541  void arch_unregister_cpu(int cpu)
> eba4675008a6e4 Jonathan Cameron 2024-05-29  542  {
> eba4675008a6e4 Jonathan Cameron 2024-05-29  543  	acpi_handle acpi_handle = acpi_get_processor_handle(cpu);
> eba4675008a6e4 Jonathan Cameron 2024-05-29  544  	struct cpu *c = &per_cpu(cpu_devices, cpu);
> eba4675008a6e4 Jonathan Cameron 2024-05-29  545  	acpi_status status;
> eba4675008a6e4 Jonathan Cameron 2024-05-29  546  	unsigned long long sta;
> eba4675008a6e4 Jonathan Cameron 2024-05-29  547
> eba4675008a6e4 Jonathan Cameron 2024-05-29  548  	if (!acpi_handle) {
> eba4675008a6e4 Jonathan Cameron 2024-05-29  549  		pr_err_once("Removing a CPU without associated ACPI handle\n");
> eba4675008a6e4 Jonathan Cameron 2024-05-29  550  		return;
> eba4675008a6e4 Jonathan Cameron 2024-05-29  551  	}
> eba4675008a6e4 Jonathan Cameron 2024-05-29  552
> eba4675008a6e4 Jonathan Cameron 2024-05-29  553  	status = acpi_evaluate_integer(acpi_handle, "_STA", NULL, &sta);
> eba4675008a6e4 Jonathan Cameron 2024-05-29  554  	if (ACPI_FAILURE(status))
> eba4675008a6e4 Jonathan Cameron 2024-05-29  555  		return;
> eba4675008a6e4 Jonathan Cameron 2024-05-29  556
> eba4675008a6e4 Jonathan Cameron 2024-05-29  557  	/* For now do not allow anything that looks like physical CPU HP */
> eba4675008a6e4 Jonathan Cameron 2024-05-29  558  	if (cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
> eba4675008a6e4 Jonathan Cameron 2024-05-29  559  		pr_err_once("Changing CPU present bit is not supported\n");
> eba4675008a6e4 Jonathan Cameron 2024-05-29  560  		return;
> eba4675008a6e4 Jonathan Cameron 2024-05-29  561  	}
> eba4675008a6e4 Jonathan Cameron 2024-05-29  562
> eba4675008a6e4 Jonathan Cameron 2024-05-29 @563  	unregister_cpu(c);
> eba4675008a6e4 Jonathan Cameron 2024-05-29  564  }
> eba4675008a6e4 Jonathan Cameron 2024-05-29  565  #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> eba4675008a6e4 Jonathan Cameron 2024-05-29  566
> 

It's caused by the following patch in the series.

[PATCH v10 17/19] arm64: Kconfig: Enable hotplug CPU on arm64 if ACPI_PROCESSOR is enabled

I've replied to that specific patch where improvement is needed
in arch/arm64/Kconfig

     select ACPI_HOTPLUG_CPU if ACPI_PROCESSOR && HOTPLUG_CPU

Thanks,
Gavin

> :::::: The code at line 563 was first introduced by commit
> :::::: eba4675008a6e4cbff27b579a837bd29be2642de arm64: arch_register_cpu() variant to check if an ACPI handle is now available.
> 
> :::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> :::::: CC: Catalin Marinas <catalin.marinas@arm.com>
> 

