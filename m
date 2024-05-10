Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2F213B7A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 01:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715306075; cv=none; b=oD0Gq+ddVZG4RaOQp0vipbXktacXgkGEeHbTGPKk42maQucDIo9veStM/HDuCB3iZ2VJHQJP/zkM+rH3vJmGCA/GeB9f2yDwz5EU25NnfUc5/iKHJYlKhHtGRIlrXFR2ES+VfA1+kFzeRNytaqxPSt98CuPre5qMN9R0lwmJ/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715306075; c=relaxed/simple;
	bh=mMkYUl68yZLTzGlW7UIXIbIlr64TygSr5Pw7nD57FbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9Dnoq56KGCwTucHtrxnnlmisj0g8oTBVTngF58FUCA/jUn4m1t3ORjQHQHLW6oLebGoLA87nJSKyOxWzKNDEydXxddXN4mEfGZ5XX4gnoSlqpQkTGggy2dK79jHcksMi0EzUFx7mvBI9cl8qPIgtIXwjvKSNIYr1Uaoy61MJ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCLWBVCH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCLWBVCH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5a1192c664so398309866b.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 May 2024 18:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715306072; x=1715910872; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXTf1Spaxf38XUied9hUFPIkMdQ4wUBR6hmvOHQ103w=;
        b=TCLWBVCHhefpLL3kr8AI8sW+r9F1yUiKvoxdAKeh0XYnvh02K8+h2lbYURiNRbQZ4u
         Ff8Gl+vLSgZ1fXOgkv+QKA+FvcvnlKABfRNQxCKZdYBmlKVNsQ5L0/zRtopyuEe+ccXz
         RSejI/BhNtH307dmFH/HLAYEg/aive9HxcSVDKw1NwAbdXRitwjVah7o4xyj4fQzQ98O
         Iqvq2QEheo/QVgSpcrhtf3zRSm4hGTbIe6nxD/Ml3GGrig43FEyBR7VE4g6Y8fgnGmNL
         iq4FpVGdtqSj+AGJSel5yjAPR1vHlx2G2ZRE+w2Zoqs9zl+dRwIDgDBCO8d3jzZPue2J
         uWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715306072; x=1715910872;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aXTf1Spaxf38XUied9hUFPIkMdQ4wUBR6hmvOHQ103w=;
        b=NMdaN/ABSWk2ZihsFCB3o62FxOHoIVWHNCe8IFob1L4sjcLhmirabxevDs98UBby6B
         h2JhABziCxgVAouyDgAytgScQzfwKrfZXVZG8kyBXrpVIC4VFIJniSi/uRSJTmi0LnlE
         PhBHXwlR6u/hyzPLA/7CcDHoudp0E9na0HIIBd0BxM4btfaHL1AvRs0qxCUxFElOUacr
         g/xJQjwQyPGgMCBqEjR2SgACweoOvQSGfFZvWEBVhhg2nT6sokTSm7Bi9WDIwOrAAj30
         sqzPoGkZCFfV1bUS1/oAJ180WnD9T8MRp2mZL5jODZwuPFo68j7Ou2j76zn2uPQQwaV5
         JIZg==
X-Forwarded-Encrypted: i=1; AJvYcCUWn+FVoh1JvkjSUGPk/zoNNDz3bvZy0zpB7GmRfCel0DTIX6Jqit50l53Qem7kVxorp1MgSy6hHumDNitMk2wpqcp3iDoHAGuaj6q9UQ==
X-Gm-Message-State: AOJu0YxGYmm49HmKd6AOkahAsfcnx1iAeaMdCHrI4B1CvCInc1TUv3Bq
	DAxsb4oCae6pBx9vhaj/Ewdp8mtRhEuG9Tumbye3DgLH5RtyPwfq
X-Google-Smtp-Source: AGHT+IFxjdKrr+AKIROCEwpZ+jZhaAJNBjXLnX+atHD9nS7kVMvzgP93kC4YAp2RFOhq++HSXzsgAA==
X-Received: by 2002:a17:907:36cd:b0:a5a:1a:b0e6 with SMTP id a640c23a62f3a-a5a2d53b98dmr135177966b.9.1715306072358;
        Thu, 09 May 2024 18:54:32 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7f27sm132954566b.127.2024.05.09.18.54.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2024 18:54:31 -0700 (PDT)
Date: Fri, 10 May 2024 01:54:30 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Yujie Liu <yujie.liu@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, kernel test robot <lkp@intel.com>,
	arnd@arndb.de, rppt@kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memblock: discard .text/.data if
 CONFIG_ARCH_KEEP_MEMBLOCK not set
Message-ID: <20240510015203.bige6ddog5o22zvr@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240506012104.10864-1-richard.weiyang@gmail.com>
 <202405071200.YgYuuCBu-lkp@intel.com>
 <20240507084350.mc6e46gecyzaqnhb@master>
 <ZjrsRSryTFOZpT8o@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjrsRSryTFOZpT8o@yujie-X299>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, May 08, 2024 at 11:06:45AM +0800, Yujie Liu wrote:
>On Tue, May 07, 2024 at 08:43:50AM +0000, Wei Yang wrote:
>> On Tue, May 07, 2024 at 01:13:05PM +0800, kernel test robot wrote:
>> >Hi Wei,
>> >
>> >kernel test robot noticed the following build warnings:
>> >
>> >[auto build test WARNING on akpm-mm/mm-everything]
>> >
>> >url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-memblock-discard-text-data-if-CONFIG_ARCH_KEEP_MEMBLOCK-not-set/20240506-092345
>> >base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>> >patch link:    https://lore.kernel.org/r/20240506012104.10864-1-richard.weiyang%40gmail.com
>> >patch subject: [PATCH] mm/memblock: discard .text/.data if CONFIG_ARCH_KEEP_MEMBLOCK not set
>> >config: powerpc-allnoconfig
>> >compiler: powerpc-linux-gcc (GCC) 13.2.0
>> >reproduce (this is a W=1 build):
>> >
>> >If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> >the same patch/commit), kindly add following tags
>> >| Reported-by: kernel test robot <lkp@intel.com>
>> >| Closes: https://lore.kernel.org/oe-kbuild-all/202405071200.YgYuuCBu-lkp@intel.com/
>> >
>> >All warnings (new ones prefixed by >>):
>> >
>> >>> powerpc-linux-ld: warning: orphan section `.mbinit.text' from `mm/memblock.o' being placed in section `.mbinit.text'
>> >>> powerpc-linux-ld: warning: orphan section `.mbinit.text' from `mm/memblock.o' being placed in section `.mbinit.text'
>> >>> powerpc-linux-ld: warning: orphan section `.mbinit.text' from `mm/memblock.o' being placed in section `.mbinit.text'
>> >
>> >-- 
>> >0-DAY CI Kernel Test Service
>> >https://github.com/intel/lkp-tests/wiki
>> 
>> >reproduce (this is a W=1 build):
>> >        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
>> >        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>> >        git fetch akpm-mm mm-everything
>> >        git checkout akpm-mm/mm-everything
>> >        b4 shazam https://lore.kernel.org/r/20240506012104.10864-1-richard.weiyang@gmail.com
>> >        # save the config file
>> >        mkdir build_dir && cp config build_dir/.config
>> >        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-13.2.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>> >        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-13.2.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
>> 
>> Can I reproduce this on x86? I don't have a powerpc machine.
>
>The above steps are cross compiling for powerpc target on x86
>machine, so you can just follow the steps to reproduce on x86.
>

Thanks, this one is helpful.

>Thanks,
>Yujie

-- 
Wei Yang
Help you, Help me
