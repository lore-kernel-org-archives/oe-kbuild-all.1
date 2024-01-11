Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3555C24
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPMw5Pk4"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cd1ca52f31so66123191fa.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 11:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705001080; x=1705605880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzIm89+64rKxBrdfNPLHSCda2tOtgVjZMCHyNnYxZDY=;
        b=XPMw5Pk4uPp0kzzSteEDJEZGM5p7VT/aLP//T+5Cm4qrOFil0RRPi4TO1TgGbn4V2Z
         PgjX+LWD6i1aUZBdHKG5cDXZGw8nWg+GuEjvNbUpmNVJ7Q5ABFbkPbHwFZDs8W+brwY3
         HycAc2QeUzBZpbyLNPK/4IXR0x6E0R1qLQRSo7sla0AINnwp00uKqt+xdNQK1iHaWJhx
         YZGk+aiayMSuxDTK5l3ymQ2wZFzBQHZq+MnDuiiyY+5IKab6PnAv/QLQil7OzOAYzV7t
         72TbTpZX9X8quzQ0os0/G8xAT9TtBO8IGE6S4u9oLsI+vvTmodkevnpgWBdPgf/zdbfJ
         JuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705001080; x=1705605880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzIm89+64rKxBrdfNPLHSCda2tOtgVjZMCHyNnYxZDY=;
        b=sHGew51Uxn+Xfag/MvV5g0sFG0fF49OokJCqExmpyxC7tTGYPw8Sr6z7fSjRIHf9qq
         dFj7585/EjHH22k+UGAPQrZxPmkksHIjo/KxVCI+7enZkSx7D6ynOroDzpEkorldzg8Q
         yfv9TPJrxmNZBBV+pre7d4hzK46H6nI8QJf5BQXMjvSzBMuiTVQdf5Ba6FL1sD+6bAFx
         rTmBiCDbvu3A5eTQ7KoTDbWAtssON73vL0S3bGx/43kChOX4Bhn4zPhK3LJZXieS4oXZ
         8VwnfD5oczlwcYDnIsIuyBJBGO6SkTd3a7TQdOUR4UCY7yIx1M82FZfEURTFPd6nMyaN
         dlBg==
X-Gm-Message-State: AOJu0YwklJhHgRvfNIHYp+bzzXPmW9RUy5k2quomnHvEGVWLTTFPwjDp
	hDQw48ggR1/o/q2glYpNrgnm1WMe4JU=
X-Google-Smtp-Source: AGHT+IGujZPTUz2TBHpLR3JYOTExT/RqQwtjjz25hvdde9NsJlhPhKJ4H/0Zoy4xYKi75WsXNBezbQ==
X-Received: by 2002:a05:651c:226:b0:2cc:3666:46ff with SMTP id z6-20020a05651c022600b002cc366646ffmr91804ljn.96.1705001080045;
        Thu, 11 Jan 2024 11:24:40 -0800 (PST)
Received: from pc638.lan (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id l15-20020a2e908f000000b002ccd39eeae4sm214520ljg.100.2024.01.11.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 11:24:39 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Thu, 11 Jan 2024 20:24:38 +0100
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: Re: [linux-next:master 12997/13245] kernel/crash_core.c:751:58:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 2 has type 'int'
Message-ID: <ZaBAdgjnWg2Ek6Ha@pc638.lan>
References: <202401120218.y469Puyf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401120218.y469Puyf-lkp@intel.com>

On Fri, Jan 12, 2024 at 02:22:16AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
> commit: 9bdb180b2db685e42841d138600491fbea20ae0f [12997/13245] mm/vmalloc: remove vmap_area_list
> config: m68k-sun3_defconfig (https://download.01.org/0day-ci/archive/20240112/202401120218.y469Puyf-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120218.y469Puyf-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401120218.y469Puyf-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/crash_core.c: In function 'crash_save_vmcoreinfo_init':
> >> kernel/crash_core.c:751:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
>      751 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>          |                                                        ~~^
>          |                                                          |
>          |                                                          long unsigned int
>          |                                                        %x
> 
> 
> vim +751 kernel/crash_core.c
> 
>    722	
>    723	static int __init crash_save_vmcoreinfo_init(void)
>    724	{
>    725		vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);
>    726		if (!vmcoreinfo_data) {
>    727			pr_warn("Memory allocation for vmcoreinfo_data failed\n");
>    728			return -ENOMEM;
>    729		}
>    730	
>    731		vmcoreinfo_note = alloc_pages_exact(VMCOREINFO_NOTE_SIZE,
>    732							GFP_KERNEL | __GFP_ZERO);
>    733		if (!vmcoreinfo_note) {
>    734			free_page((unsigned long)vmcoreinfo_data);
>    735			vmcoreinfo_data = NULL;
>    736			pr_warn("Memory allocation for vmcoreinfo_note failed\n");
>    737			return -ENOMEM;
>    738		}
>    739	
>    740		VMCOREINFO_OSRELEASE(init_uts_ns.name.release);
>    741		VMCOREINFO_BUILD_ID();
>    742		VMCOREINFO_PAGESIZE(PAGE_SIZE);
>    743	
>    744		VMCOREINFO_SYMBOL(init_uts_ns);
>    745		VMCOREINFO_OFFSET(uts_namespace, name);
>    746		VMCOREINFO_SYMBOL(node_online_map);
>    747	#ifdef CONFIG_MMU
>    748		VMCOREINFO_SYMBOL_ARRAY(swapper_pg_dir);
>    749	#endif
>    750		VMCOREINFO_SYMBOL(_stext);
>  > 751		vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>    752	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Sent a fix: [PATCH 1/1] mm: vmalloc: Fix a warning in the crash_save_vmcoreinfo_init()

--
Uladzislau Rezki
