Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AEB13D25E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715071435; cv=none; b=nVlEmhjACUFNruz8C1UOlj/4/R3HvlOok31fz9wLyCeSHp4X38qf+AFCAQ5Lxv1khCxCr3/PQBxJrxOkcgBqKYS22vmwqOR5wv6y5eR9Ig1pO5e7lzdVp55yP1MyqqqEzkaQ0xfXrItm/QQKSFKudDEnqJXdXuA+egrWdb5QXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715071435; c=relaxed/simple;
	bh=jG+THjCeGW3zi8tCrAye5vr5GHkdWZme1tB+kqii8dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqoNGaiRH+itxXlW++QC4vlpT5sgpoyslOxTESMbqR/rN+6fbsGWYMJuAsmLxcj91OxLnTbV04vGHzvSLkX/N15QCX9XOaDg7FVoOF5Dk5p1qTVW0MhsQqHXMdIYnllb0w/yVzkD/BGoBFviT/Q2k5glcIKpxqmhZ2egs5PX22g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9zoiPTZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9zoiPTZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a9d66a51so627460466b.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 May 2024 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715071432; x=1715676232; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5grxZOrhBPyt4V3AJI3sb+Y61ObnxWKs5SwjjhtWck=;
        b=k9zoiPTZQUAU1xAK9+iNscbi+lxCij/4ZQo5OJ3r6A34GiUF0s8mGlPIUIl2vBxn5Q
         Y9+wOWdstF2l1JSNb/dcPYnzbscKwwFzoxTijZLv25PdFk3CikwQ18GgMLIoxwbr9rg8
         kwTtr86PK93WWhHAeDxU3wLUoXeZxMwfqvB+sV3g5uTf+uIsOGQX0LlsRXMIwwnDNb7O
         BxRUUlDN4clE9mOiIWEaCW6M0a8aogvv6FfTDDtYuB5TnW/MRd6+Ku1nqmlO9DI1VWo6
         tDSGvSAspr7xpGj8V+bwDl4kUPs2UalgSM94H9sghKS7IMLOEKDb6Hez8mf34c50JGTX
         SN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715071432; x=1715676232;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5grxZOrhBPyt4V3AJI3sb+Y61ObnxWKs5SwjjhtWck=;
        b=vXoWYo7AYAFSzyBgPLC6AYX7ge+GmO3ERRQ+QSGDVtyIiXlWCwgKQw36Awnas2Los3
         soiRBKikxNnpAMaCnd4vWrtGnx5Ocx646RRZe4hNu14/0OcEf5kYHh6JH/EriOijHIoI
         jLliNjfFCmF3YjqoJIiR5xo07BBFRy2Y0rOVL7BMfjX9b1csWhILcTPNRlfYWR12lueR
         g22Z39O0ooRjiplYy6/tBpOaVK/XT3Ex6TQwNctPuAyJB8D6+GJz4sEdkqSN6KuB/LT7
         I93nBv2iXHRieYRTJj5UY8ATx+nMS0+NmsB7WNDIDQpD5xTxTRCyYJ3AwXt4XDOwZpHt
         A5FA==
X-Forwarded-Encrypted: i=1; AJvYcCUCNJknfwC1JY4ltG9pkfq+jkuQ9KS+tCCBuqoc5TuP6CrOH1OAhHzsL4Nvz4BZJLc6vEzJxTgM4gZZdPh8Ft7dfvaxwPBbsRwv+htbGQ==
X-Gm-Message-State: AOJu0Yxc2msusbTkKTeR9v9qqZUyYduNxgGeRp84mbjv4924OeQ9o0XT
	GLKn4GDEYSRPwOEB34AF9kXLLJjIphFn+0w7fWi8GEBDgst6Lrkb
X-Google-Smtp-Source: AGHT+IGLgCI7he3kJp9TCd8g/C08i2amvg2QPJVDnTHoYk8pb2Bt8vfiWtniWWbfFNp2eQjqmWrExQ==
X-Received: by 2002:a50:aad1:0:b0:572:a76e:645a with SMTP id r17-20020a50aad1000000b00572a76e645amr7816340edc.12.1715071431748;
        Tue, 07 May 2024 01:43:51 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7ce19000000b00572a7127cb0sm6120455edv.50.2024.05.07.01.43.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 01:43:51 -0700 (PDT)
Date: Tue, 7 May 2024 08:43:50 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, arnd@arndb.de, rppt@kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/memblock: discard .text/.data if
 CONFIG_ARCH_KEEP_MEMBLOCK not set
Message-ID: <20240507084350.mc6e46gecyzaqnhb@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240506012104.10864-1-richard.weiyang@gmail.com>
 <202405071200.YgYuuCBu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405071200.YgYuuCBu-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, May 07, 2024 at 01:13:05PM +0800, kernel test robot wrote:
>Hi Wei,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on akpm-mm/mm-everything]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-memblock-discard-text-data-if-CONFIG_ARCH_KEEP_MEMBLOCK-not-set/20240506-092345
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>patch link:    https://lore.kernel.org/r/20240506012104.10864-1-richard.weiyang%40gmail.com
>patch subject: [PATCH] mm/memblock: discard .text/.data if CONFIG_ARCH_KEEP_MEMBLOCK not set
>config: powerpc-allnoconfig
>compiler: powerpc-linux-gcc (GCC) 13.2.0
>reproduce (this is a W=1 build):
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202405071200.YgYuuCBu-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>>> powerpc-linux-ld: warning: orphan section `.mbinit.text' from `mm/memblock.o' being placed in section `.mbinit.text'
>>> powerpc-linux-ld: warning: orphan section `.mbinit.text' from `mm/memblock.o' being placed in section `.mbinit.text'
>>> powerpc-linux-ld: warning: orphan section `.mbinit.text' from `mm/memblock.o' being placed in section `.mbinit.text'
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

>reproduce (this is a W=1 build):
>        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
>        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>        git fetch akpm-mm mm-everything
>        git checkout akpm-mm/mm-everything
>        b4 shazam https://lore.kernel.org/r/20240506012104.10864-1-richard.weiyang@gmail.com
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-13.2.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-13.2.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

Can I reproduce this on x86? I don't have a powerpc machine.

-- 
Wei Yang
Help you, Help me
