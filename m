Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA338C42B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 05:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779601231; cv=pass; b=pNu6MlzOsg2+Dri8H9KPriLHHYlI7Rs7EPCy2LWhTtsx68b41EmGM5tCYMOT6Gsi5jwg0qPCoefu/TIr0br8+EJz5czYEsXLafDK1jNt+2qQav9ohgjStOkCAVOxRpPKAm2A+S1q3JNXmcguELfhj7FbfkKfM+EqtR4vioIaFDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779601231; c=relaxed/simple;
	bh=FFyU0Agp3duT3812ugXRwk1O62+C0JSc7BoLG3Q5SKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSppCN9SoxBXfTeQjGYzjGiLYd5pXVsGkYoKPixcrgp0qmwUTP8KwE2WEh8xgFrMq6WAiFrieZmigvL0E6hOsUN0N4jYR4c3HuGqS3V0Lh+Ya+so7FGivb3kZBW5bpE+jKx4DNaSunZV4KjV9MiSnE+FAG8RNy45EDHBL+q7EXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVPc0ADE; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVPc0ADE"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65dead17c24so8056319d50.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 22:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779601229; cv=none;
        d=google.com; s=arc-20240605;
        b=TdkKWJTwnFqKjbzIJpv8MFOkfw8P/1c4bywJyKBNeOPni4JIghWzb8lzkVyvssZN72
         wp+GcRy4OULpPKKa2nFti3N6GC6eJH1Pe5zYKJMZpfK1lX1AENODC6EFeNHvJLxearwq
         zErt1wo5jZ6DAnMTBKoB0lkH5wum2kE59uVTIrqUQ0M1YXYX71/eN06X+Uy6KEpDZoMm
         K7sgHlNzUGN7ZKHMxUtNnabLZGJTcvCXHDQQhrKwaooE5bSIPE99OU403tuR3UzfWeE9
         Aw2OUC7if9IR7bPZ5mT8kVhVTJ04zXh46BsXiJsqoytw+qG4G7j6S0Y3gqjQbdRKeLBA
         LgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        fh=gaikEUSPzd2fcXK80aQLajm8eQAsM4EXAbFtJaSsRVU=;
        b=ZgMqlu3zl1MHKlZD/HjV3IlzxEyRnNlONnBCTVcYGnsYOYGkKszuaDyV5VeShzJIte
         UV8VZFvnfXYCdT6sd7RxYm3HGVrBBProPY3aw8n9vUkFwNP1u5sRKB7lBtVtQOxrINDt
         HplgL+0ZBTbq2Zlbb/gdVeby89pq5QGTxLV3sZAROM2YXpsqhAHVGHs4c3NRMZeA5rmX
         QpSe42uXLkkC6bQAcd2H2AoylG5hT9Xbtdl0jd2X2gU5iDQmI98tdMYQmJIZxwEp5ban
         uf9OdLcvBkeUCEyM8K0a7WaK8S/V1uks1GC2AGodpAxdDlm1NTNp6UNQj1uhti90gHf9
         joiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779601229; x=1780206029; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        b=ZVPc0ADEUdlx4GbEknh/WiI8I+Ywegi9JdQpUDsRjsMda21tBMhydng/wYKgTpanwa
         dyCNg06Xb4yODD5f2rT7qrE9HSPVZnxcUR2a2M2i38JMBreJG8CAqIhVnvtSiOOYWaVB
         eaeHmnnu5VVmtFVw6Agr0BsR3kbrIRzyvi/Gf4sjenH+KM/Q5i+tN6h5l205lqmy4PuP
         Nkv5pS/3Uj528bWGufXfejC2X9PcIYG5KxJfAQIRtUkl1uRMGiWcTJr05Zz4zfFwLWHI
         TuDtrdcEVhj1hTFgHkA0XhTkgzQlCFLWrEPzavu2PLoahTg3KZTT6a+9zvIYH9WeBpcw
         y2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779601229; x=1780206029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB3ioTsenX/7iD7ox1ZYbQDoqdQdKnSJARyszLFCgQc=;
        b=NDElZiC906H6M84RjWLz4+S+PsT5XiroCyFAG8+yPyixwQLaZOh75I1O3JdIBmyFFA
         NEiSDiNaQJxWtf8WXSLAq+U+idTcTcLY6T7NDlTWVV7/rTaawrXBuVez5ZHnYmEwLTuh
         Mo58VIBxWDVp6wKk05W1PS8L+DAfgbWjIwVgOtVRSisyHgUPPeqJlvOgdFDGmmhcpwZ3
         OfNMLJQ3j5iNosHgIT0CfACTZkvlOciaojLrcHpkjcz/wFJjLWew6CiZo4nDe85+Y0EL
         EvfRuCHDeLa4czBd0y1xiIWxg9vAP88BWfmk60dCCWN22+Lzny/O/Q3A4R/xjjlaeA++
         x+Uw==
X-Forwarded-Encrypted: i=1; AFNElJ9Jwv60cWqXHbxwtgHtDfeeq5emkVwLBSxXrdzxbmIo3KRtXjOVAx2EDPnz5ZvFvREBP9UAtl/cpXgWQU5/@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg3ONj9C4J8hMLCfZc09l+gyVz/M0qXbqfxw1IGZS/eOB65LAv
	KUvKlWC/dqMSiYvJcFt0SpQxHZTLFYRrC2N703SpVNTTFtaAgZN00wBmANMjtSL3zputFf22Icd
	pjH7fMs/eIscTo4JTzJ6WjhychQHjcXw=
X-Gm-Gg: Acq92OHM33MT6mfP80cRvABLSO2qepYUvehv1BPiWxVXN8wOAIJZZaeQd97msNGTL5t
	oCuSUurK5HfoHo+mMDpzW/Ln/gUmiadSuC6xK0yAcBWUnhIKc+OsrHYt/GIXBa8va5FDvYRBLSo
	0nahMRcePvvepZmw94nv1Wq32WQnaYcSueYZLLpgd39nHDzBG5ROKHKPCpIPpj50cSq3n8Ecr19
	c+GjQPYvh110nrSSdL/TpiG/82ktPwhALh6UMH1+01iC1/juqQWTh+x95ikw/4M+WzPV68SmJSK
	t7l4m6juutkddyLgdFEnM89+3hzXajX5lwR3JGx6DhV3DYC6dX9d+4n891qGidfJfOWPZKlF29p
	hU5TKcjWT1m457P6z+ANTt19fNvU5DLtJCu5TLSGhYDedy8/vum3o8PsQv5s=
X-Received: by 2002:a05:690e:d02:b0:64e:f106:60ea with SMTP id
 956f58d0204a3-65ec9938bb6mr10304651d50.44.1779601229184; Sat, 23 May 2026
 22:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523174440.9629-2-hardikprakash.official@gmail.com> <202605240959.Kcf1lIg4-lkp@intel.com>
In-Reply-To: <202605240959.Kcf1lIg4-lkp@intel.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Sun, 24 May 2026 11:10:17 +0530
X-Gm-Features: AVHnY4KFGm1FRMDp57VE89vJQfBy8s3Xij_f6JIE9wMxIq8ViEfXwrWfjlI0icU
Message-ID: <CANTFpSWd3ysA7qNurHFuCPmEah1dGSfDTiFJRteU08A3kHE3=w@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: kernel test robot <lkp@intel.com>
Cc: linux-i2c@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, May 23, 2026 at 23:27, Mario Limonciello wrote:
> Is patch 1 still needed with this approach?

No. Tested v6 alone (without patch 1) on a tree based on
63d2059cd665 (the commit immediately before patch 1 in Walleij's
fixes branch). Touchscreen and stylus fully functional, no arbitration
errors.

This confirms your original concern was correct -- the existing
amd_gpio_irq_enable() flow works fine once probe ordering is fixed.
Patch 1's manual IRQ restoration was only necessary because the race
prevented amd_gpio_irq_enable() from ever being called.

v6 is sufficient as a standalone fix. Patch 1 in Linus Walleij's tree
can be reverted if desired.

Also noting that the kernel test robot flagged an unused 'ret' variable
in check_child_gpioint() -- I have a fix ready and will send v7 once
the question of patch 1 is settled.

Thanks,
Hardik

On Sun, 24 May 2026 at 07:18, kernel test robot <lkp@intel.com> wrote:
>
> Hi Hardik,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 3812a9e84265a5cdd90d29fe8d97a023e91fb945]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Hardik-Prakash/i2c-designware-defer-probe-if-child-GpioInt-controllers-are-not-bound/20260524-014648
> base:   3812a9e84265a5cdd90d29fe8d97a023e91fb945
> patch link:    https://lore.kernel.org/r/20260523174440.9629-2-hardikprakash.official%40gmail.com
> patch subject: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt controllers are not bound
> config: x86_64-randconfig-001-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240959.Kcf1lIg4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240959.Kcf1lIg4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/i2c/busses/i2c-designware-platdrv.c:192:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>      192 |         int ret;
>          |             ^
>    1 warning generated.
>
>
> vim +/ret +192 drivers/i2c/busses/i2c-designware-platdrv.c
>
>    187
>    188  static int check_child_gpioint(struct acpi_device *adev, void *data)
>    189  {
>    190          struct gpio_dep_ctx *ctx = data;
>    191          struct list_head res_list;
>  > 192          int ret;
>    193
>    194          INIT_LIST_HEAD(&res_list);
>    195
>    196          ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
>    197          acpi_dev_free_resource_list(&res_list);
>    198
>    199          if (ctx->ret < 0)
>    200                  return ctx->ret;
>    201
>    202          return 0;
>    203  }
>    204
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
