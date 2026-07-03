Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77756371893
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065230; cv=none; b=HFVVeb4t+BKNs6TwkMkqmSfs8JfXmR5teyLv7drwGnr0p+LS1aWLtT7KdANAxjyQSnmb/DPIBOCS3fn/lhdL5IM853N+85UucP1pBOOwX9e0IJo0DAKurLMGpL8F7XpSc8862hNDWvrXOriQ2c0kruSlNNarN0PjbRCi2l3CS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065230; c=relaxed/simple;
	bh=e8f4eK2XIAXtmv0D3DJUStmAvt+/9psaO5ICbE3bd7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ox1f3XunMzv2fF0a9O1TiO3MjZ2AEsDMC9NtSxHHbnSz5dy0wzA8GbCbY1HUFl2GEGrCW24C4Aq8NdNowkhfcUBduIIWxQaxq4ltYtsdWnY6MUCUcdB3wka6PRTUdW8ce4ynFx6sBmj/nxxhaMDTxIwLy/GzcgxmJ54HPi8ibrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+b5WAhw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+b5WAhw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493be1b9682so1866165e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jul 2026 00:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065227; x=1783670027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwNG2xgIYbHo79fkvwrrCIA18FniF81xGtg9vLZ2YD4=;
        b=o+b5WAhwQfUmNgTK/p17fLBnXr7MvR34+PJVHCydY36tPk9zycw3i278KGYGlraflA
         LSDi2hPyIaEb5EbcIkatd1hIbl37b0HF0A7KkGWFlF3IWoME6amk6sHLcu/unTcTKek4
         HQFlpN/Mc2uRVhPkASSh73prXTVw6o7ISePyYhEiTEPW/vkXD/Xq+2/fien6qR78baVI
         7uJfSMS9iwDAFRzqxnTSNVgwuTWYd4qDipxz5E+WhaGs3o/coWLmYc8W3fI/3ibDkUT6
         eRUEng9oRC4FApyWT+HLJulsrPDj4cVzvEPQv7V7k6PxUByJPRKetJJFbsMNfuPBppTk
         UAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065227; x=1783670027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwNG2xgIYbHo79fkvwrrCIA18FniF81xGtg9vLZ2YD4=;
        b=ENiKrTHnlHDhCH5PraC5AZKX7fFSXzpkv+ML7DiS9JhKqjS+9i3oVo04evNcjvOUfH
         QlKczgl+m5037a4DC4o/zD7liwKWVa6BhdBLq55LfYNhqtnGUTKZkGXnW0YuA3Zd+5N9
         g86DyoVYsELouM7N3LgQENgZEJO7heikhIy06IOT09viAG2BSm7If81hfHL2SqmCBH2Q
         WeK0vnKwUb2jxO6F630IB4KtxvMehZDHKiFK43AXstD1b/NOMO76aCXC26xUTNN0RrhV
         shulhDKuqdwjQuQlppYXWujLWHFf+R75TrQXe8pp6a5fN8MC7rqUWYecBZyr5ydr0SRf
         hjrA==
X-Forwarded-Encrypted: i=1; AFNElJ9maisx8yzZwhk6Ubiw3uDLjioYZt6MXyCyrXkOaECQPF7s03nUxZZaFWJNX1q+1+xddkEwIw52aNvCaQGb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1Xm3Nqpop7RG/7bJusSyZ/I4O6pMQvkI1KOBUTXTll+62n5TR
	DgJ+GXgn1e+aItYXS2pL3KTYivRl+2m3moOE9y5Ib5Xt+3x35wAi48JNR6dLxQQy
X-Gm-Gg: AfdE7cn7Ihdwxex+fTdPq3lHIyIUWFxAl4AR21vvqED7Lj06o9c22sdz+wRt+p92kC/
	5i51jxfvFoIhQVa71rz7CjheDst5acj4Zun8YY7oROcaSOjIYcA/ZZ0NXtMPvHlWr2M5vDy13+p
	q2IJtQ8WMJyVB6pRbwaqaA9J0adECTbU1k5XGabpgmfBfXhyvRb5zCZRBkW9f7I4JGZUEjwOq95
	bwROyA0XCQVXp67SzsPLqYPvCFLr5GILN3SuqqBKrcddbn6GqtzncPcO31FhnYbfPn/M0RQQVHR
	hD1Wxg7YvioovpMNraL+Zt8tq5HDzvDnYn0a/UfBty9lkN8hhfK6w9wdxq0uK3RgtSUzBwb/FiA
	BPiVxQYZ49k0Xu8FT6jbSHzdhHZHHEoivgWoa2K1PZ+OW5QF8+TuZ1XGAAukD4U0h/EgzU9j1pD
	OW1zGJzZSHx+NtyKfrK8bSmvplVpAUU+G6KzzmnAglqRKInMFIFGTQNTsu
X-Received: by 2002:a05:600c:5010:b0:493:72d3:4a81 with SMTP id 5b1f17b1804b1-493c2b5161emr122442615e9.16.1783065226523;
        Fri, 03 Jul 2026 00:53:46 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ea60sm103089575e9.3.2026.07.03.00.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:53:45 -0700 (PDT)
Date: Fri, 3 Jul 2026 08:53:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 matthieu.baerts@tessares.net, Jakub Kicinski <kuba@kernel.org>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>
Subject: Re: include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_881' declared with attribute error: BUILD_BUG_ON
 failed: sizeof_field(struct mptcp_ext, flags) != sizeof(u16)
Message-ID: <20260703085342.1b915f66@pumpkin>
In-Reply-To: <202607031100.upQfRZTM-lkp@intel.com>
References: <202607031100.upQfRZTM-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 03 Jul 2026 11:51:39 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   51512e22efe813d8223de27f6fd02a8a48ea2323
> commit: 5e939544f9d2b4d5c052a07cfcde97de44263946 mptcp: fix uninit-value in mptcp_established_options
> date:   4 weeks ago
> config: arm-randconfig-r051-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031100.upQfRZTM-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031100.upQfRZTM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 5e939544f9d2 ("mptcp: fix uninit-value in mptcp_established_options")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607031100.upQfRZTM-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    In function 'mptcp_established_options_dss',
>        inlined from 'mptcp_established_options' at net/mptcp/options.c:881:11:
> >> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_881' declared with attribute error: BUILD_BUG_ON failed: sizeof_field(struct mptcp_ext, flags) != sizeof(u16)  
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
>      680 |                         prefix ## suffix();                             \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>       40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>       51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>          |         ^~~~~~~~~~~~~~~~
>    net/mptcp/options.c:576:9: note: in expansion of macro 'BUILD_BUG_ON'
>      576 |         BUILD_BUG_ON(sizeof_field(struct mptcp_ext, flags) != sizeof(u16));
>          |         ^~~~~~~~~~~~

This is probably the old 32bit arm abi that aligns all structures to 32 bits.

	David

> 
> 
> vim +/__compiletime_assert_881 +699 include/linux/compiler_types.h
> 
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  
> 
> :::::: The code at line 699 was first introduced by commit
> :::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h
> 
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

