Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2A51C2A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJTJzYgb"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5e75005bd0cso34265387b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 09:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703524761; x=1704129561; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQXGoJGduCNQaaCxL5SGHVEkpQm1zRD1YbygRI8w1Io=;
        b=HJTJzYgbhWu0eOdAFKP+0eD+2dE7tk1lmyYYRZR1giYu9JuSQjpdBCehvPha8lyLxZ
         +4qbmpnqnTvDbs4+pWIxwaQlmFIjgC/qDWnGpiTpN1E92dnfB9bF3JzCHNQpBqn7iPTK
         UT9lSeGr8uTB+FmyXmt7REqXfBzREunuT/VJVt/c3jRv7tB7RLoASmIRgmHhs/3kKkOt
         DZVNwT7mEh3tkTWREzhnr636kEMHU0fxmdmibhx9aHz+9gclkLxikisZBUWU3R4GCvaP
         BQNM0PcD4APbzG3IgEDRgmi6DLQFUqdEcz+JeYzojDPorfeY2dhA76BrvnXKiShynnJN
         aOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703524761; x=1704129561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQXGoJGduCNQaaCxL5SGHVEkpQm1zRD1YbygRI8w1Io=;
        b=sxF80HWFG7+XB9lbQhsANVMBTBPFc2oANlwMQoW88fT9c9juYgrZxasZD5zBwJnXnR
         pfVp13/YBOnffUfvYa2a6JcrdHaBGxOcfHqZwhVCgZuClSfITk4mL7K6nMsEIzd0rkOs
         eQTxfp85NCxg5A3EExTBJq6Jn9B7mG5MQ1UNmJm5ChB2KG/4XjmOB3Xsh4DAB1jtv7qe
         vlkFC47v81XoH/TAm33SkWsr4HFx/QBc8i6ssYZ/scW9O+IPy3tqbkK+VfU0/JE0ER5i
         SRK4E+0Oy7OKrMyxD2RwOQAR+2s+knTKrRjvbE+9RXwYVWNMFreHqbQqcHUWT5l512Z9
         HGJw==
X-Gm-Message-State: AOJu0YyGqoWHiMFsD3JidBe3Ety27wqBWwknlykCIJRFwyTdOTAUKY47
	CADVDee3TAzWAdKryJ5t/5I=
X-Google-Smtp-Source: AGHT+IG7eGDlrjxo43y4KWEtZC6zDNFq1aordpgHAVvYq5ZTKDkDdhRZfIDsnUgHvHdAwVUzMvw1qw==
X-Received: by 2002:a0d:d4c1:0:b0:5e7:c181:e66d with SMTP id w184-20020a0dd4c1000000b005e7c181e66dmr3139699ywd.20.1703524761454;
        Mon, 25 Dec 2023 09:19:21 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:3e97:6886:45bb:11c4])
        by smtp.gmail.com with ESMTPSA id c67-20020a814e46000000b005e4d89b4520sm4744697ywb.47.2023.12.25.09.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 09:19:21 -0800 (PST)
Date: Mon, 25 Dec 2023 09:19:19 -0800
From: Yury Norov <yury.norov@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Changbin Du <changbin.du@huawei.com>
Subject: Re: [linux-next:master 9918/9925] powerpc64-linux-ld: warning:
 orphan section `.bss..Lubsan_data794' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data794'
Message-ID: <ZYm5l6AIMVMs69RC@yury-ThinkPad>
References: <202312230642.EBF6kiYY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312230642.EBF6kiYY-lkp@intel.com>

On Sat, Dec 23, 2023 at 06:15:23AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   39676dfe52331dba909c617f213fdb21015c8d10
> commit: c6aa10bc7b8bfcfaca4311ac5f39b4d6eb5b1ccf [9918/9925] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
> config: powerpc64-randconfig-r035-20211208 (https://download.01.org/0day-ci/archive/20231223/202312230642.EBF6kiYY-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230642.EBF6kiYY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312230642.EBF6kiYY-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data794' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data794'
>    powerpc64-linux-ld: warning: discarding dynamic section .glink
>    powerpc64-linux-ld: warning: discarding dynamic section .plt
>    powerpc64-linux-ld: linkage table error against `flush_module_init_free_work'
>    powerpc64-linux-ld: stubs don't match calculated size
>    powerpc64-linux-ld: can not build stubs: bad value
>    powerpc64-linux-ld: init/main.o: in function `kernel_init':
>    main.c:(.ref.text+0x224): undefined reference to `flush_module_init_free_work'

+ Stephen Rothwell, Changbin Du

So, it looks misattributed, and already fixed in 9a63d5058dd3545?

Thanks,
Yury
