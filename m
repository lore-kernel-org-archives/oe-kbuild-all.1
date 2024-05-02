Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0A22F00
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714639783; cv=none; b=CI+y4fTZddyuqpmpyO+qYXQQRy7KKANldMKAWgGTq+A7+dw6Zn1oK837nPBi4PeGPiGAk41EEINRRAzSs1PR/QC4vpueKObCaZdBXemIyI5vaE04CKgzdRLEY7d7DchfJ+0rowV9ue4n8Gl1gxt43sVXttCbIgw99UyQiSL4sUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714639783; c=relaxed/simple;
	bh=RBNo7t5IGu2yThFFulb8qCfz4Zt2E7C/FOw15MNEb5o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bG7x/KDQCOB8OR8UByB9Qm8fXRMjdhITJ4JTub8BB6rlD+0QL8sk8+Bpo1EDa5eBjdwEZr9O6XVjfhDQhol9ic2rvKr7LvSL1+xXk5XFLclw5xeHN8KWerzTf+86QRt2+F/x0648nWC4X1Itgdg6x0NFoU+WTwSOb/c7XDVMpD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zq0M/7of; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zq0M/7of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714639781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+3z/p7PSnITLar6zjViIxQUZhsvkqQniW+UpUaJYwp0=;
	b=Zq0M/7of5/OP0hNH2g+d1yGXXvqySUvhJI0Jz+A9lbvjHwKXZEdOQUUGWtc5o1Jwuiv+lR
	ejxXSXDLjvo2AAjxcdJNBsqVMZVe77QyPWHYIsgJLYEBRHJeSSCtRrw8rjvdV2nqGUwS8j
	wzhdythemOjYYFbjCVVDTINQBAIP7Ig=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-n-K6lhcVPfOOUN5I1bOdoQ-1; Thu, 02 May 2024 04:49:39 -0400
X-MC-Unique: n-K6lhcVPfOOUN5I1bOdoQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34a49f5a6baso6302598f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 May 2024 01:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714639778; x=1715244578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3z/p7PSnITLar6zjViIxQUZhsvkqQniW+UpUaJYwp0=;
        b=U/ITCjpxE/KI6eeGpG42hcCseI+K6GvJw38mqgpu7wpwOS8t9qgyGxiBmiG02mDpjG
         aoaO2cFK8ixgFKuywuTEn9Fak95ug4+5ofyDzNVP+iBW/o8+grG6SDgfy0Hf75yN25Fe
         F8zacQpYWUwHO64jXTtlZ+amgleAsQAB0SXes8pTD3us/+QZtefyOVwgnsxg21xmR97N
         Q/d4RBdbbpgw9zHNfygBYq9eKVExyJhMi5vKl1MlgGUqMmOO+v5czhb9QKuPA/bxrDwI
         CvWf7Kil+/OJqdrv00OCAnpp+zTy3t6KkrWdefkXjdIudyOS33w6AtPqHPkW/WWGlJ4z
         O/VQ==
X-Gm-Message-State: AOJu0YwsSUKHmbL1QESvLkKesJNN4UdyeB0NvHgN+9uLjxh8krDnfOgI
	6cQvNe4oWcuZ5C+75Zb7qGRVzJIa0b/VMTssslrgRredjPWWgnMB9YYZ8myB33OMo4ZtDheCwbp
	BBQhxY5fhL1iuyHCbQobOqK0vIcIRl12Uy+in7Srsa1HillxwxOjZ6GVAdMZIsQM=
X-Received: by 2002:a5d:4d42:0:b0:34d:b43d:6e24 with SMTP id a2-20020a5d4d42000000b0034db43d6e24mr4206253wru.32.1714639778649;
        Thu, 02 May 2024 01:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVOHj8C2dd7Bt2GMvMzFkmfLMNHv/OiubjKl8vg1gno+Z4uyreVz7F2PF/KvPDgRwuVCzitg==
X-Received: by 2002:a5d:4d42:0:b0:34d:b43d:6e24 with SMTP id a2-20020a5d4d42000000b0034db43d6e24mr4206236wru.32.1714639778208;
        Thu, 02 May 2024 01:49:38 -0700 (PDT)
Received: from redhat.com ([84.33.125.84])
        by smtp.gmail.com with ESMTPSA id dd3-20020a0560001e8300b0034c9f060a14sm716299wrb.11.2024.05.02.01.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 01:49:37 -0700 (PDT)
From: Oleg Nesterov <onestero@redhat.com>
X-Google-Original-From: Oleg Nesterov <oleg@redhat.com>
Date: Thu, 2 May 2024 04:49:36 -0400
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Phil Auld <pauld@redhat.com>
Subject: Re: kernel/sched/isolation.c:143 housekeeping_setup() warn: always
 true condition '(first_cpu >= 0) => (0-u32max >= 0)'
Message-ID: <ZjNToL7ARe_vfJch@redhat.com>
References: <202404300915.WNvfwBz3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202404300915.WNvfwBz3-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I am on PTO till May 9 without my working laptop, can't even read the source code.
I'll return to this when I'm back. CONFIG_SMP=n I guess.

On 04/30, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   98369dccd2f8e16bf4c6621053af7aa4821dcf8e
> commit: 257bf89d84121280904800acd25cc2c444c717ae sched/isolation: Fix boot crash when maxcpus < first housekeeping CPU
> date:   2 days ago
> config: xtensa-randconfig-r081-20240429 (https://download.01.org/0day-ci/archive/20240430/202404300915.WNvfwBz3-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404300915.WNvfwBz3-lkp@intel.com/
> 
> New smatch warnings:
> kernel/sched/isolation.c:143 housekeeping_setup() warn: always true condition '(first_cpu >= 0) => (0-u32max >= 0)'
> 
> Old smatch warnings:
> arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting
> 
> vim +143 kernel/sched/isolation.c
> 
>    117	
>    118	static int __init housekeeping_setup(char *str, unsigned long flags)
>    119	{
>    120		cpumask_var_t non_housekeeping_mask, housekeeping_staging;
>    121		unsigned int first_cpu;
>    122		int err = 0;
>    123	
>    124		if ((flags & HK_FLAG_TICK) && !(housekeeping.flags & HK_FLAG_TICK)) {
>    125			if (!IS_ENABLED(CONFIG_NO_HZ_FULL)) {
>    126				pr_warn("Housekeeping: nohz unsupported."
>    127					" Build with CONFIG_NO_HZ_FULL\n");
>    128				return 0;
>    129			}
>    130		}
>    131	
>    132		alloc_bootmem_cpumask_var(&non_housekeeping_mask);
>    133		if (cpulist_parse(str, non_housekeeping_mask) < 0) {
>    134			pr_warn("Housekeeping: nohz_full= or isolcpus= incorrect CPU range\n");
>    135			goto free_non_housekeeping_mask;
>    136		}
>    137	
>    138		alloc_bootmem_cpumask_var(&housekeeping_staging);
>    139		cpumask_andnot(housekeeping_staging,
>    140			       cpu_possible_mask, non_housekeeping_mask);
>    141	
>    142		first_cpu = cpumask_first_and(cpu_present_mask, housekeeping_staging);
>  > 143		if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
>    144			__cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
>    145			__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask);
>    146			if (!housekeeping.flags) {
>    147				pr_warn("Housekeeping: must include one present CPU, "
>    148					"using boot CPU:%d\n", smp_processor_id());
>    149			}
>    150		}
>    151	
>    152		if (cpumask_empty(non_housekeeping_mask))
>    153			goto free_housekeeping_staging;
>    154	
>    155		if (!housekeeping.flags) {
>    156			/* First setup call ("nohz_full=" or "isolcpus=") */
>    157			enum hk_type type;
>    158	
>    159			for_each_set_bit(type, &flags, HK_TYPE_MAX)
>    160				housekeeping_setup_type(type, housekeeping_staging);
>    161		} else {
>    162			/* Second setup call ("nohz_full=" after "isolcpus=" or the reverse) */
>    163			enum hk_type type;
>    164			unsigned long iter_flags = flags & housekeeping.flags;
>    165	
>    166			for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
>    167				if (!cpumask_equal(housekeeping_staging,
>    168						   housekeeping.cpumasks[type])) {
>    169					pr_warn("Housekeeping: nohz_full= must match isolcpus=\n");
>    170					goto free_housekeeping_staging;
>    171				}
>    172			}
>    173	
>    174			iter_flags = flags & ~housekeeping.flags;
>    175	
>    176			for_each_set_bit(type, &iter_flags, HK_TYPE_MAX)
>    177				housekeeping_setup_type(type, housekeeping_staging);
>    178		}
>    179	
>    180		if ((flags & HK_FLAG_TICK) && !(housekeeping.flags & HK_FLAG_TICK))
>    181			tick_nohz_full_setup(non_housekeeping_mask);
>    182	
>    183		housekeeping.flags |= flags;
>    184		err = 1;
>    185	
>    186	free_housekeeping_staging:
>    187		free_bootmem_cpumask_var(housekeeping_staging);
>    188	free_non_housekeeping_mask:
>    189		free_bootmem_cpumask_var(non_housekeeping_mask);
>    190	
>    191		return err;
>    192	}
>    193	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

