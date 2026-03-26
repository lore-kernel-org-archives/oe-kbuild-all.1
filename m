Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78CE50276
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774530637; cv=none; b=TGIotg/PeouknFwvY0m9f3kVUUP5H7fr0RRA+bs5kiFlEwrytXXwqBmHM9N2/njml2h0bqUQN5NV/liWr2QvAPORU77sKKN5Ph0HCjeqbRy2q05/S7pucaXlu0xOmfMz7lscjJX1IwiHhiY6XHzFQIurTqLV/HmKLgyOa1VtF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774530637; c=relaxed/simple;
	bh=0CR20ofdN14Xriy1osguvdFPMVR5SvBt00eel497LBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqBLJCWLbXovObqyT3uXC2oH/PosEQWiNMX0Ba/ZEeB0XgqR3PeYq+ErO5ogYER9OJPza4C48DHztAd6YuM2TLJFWGv+1oYA0+Abp2soBdH/gXELt4/PzxkQSIcEqg0pBEfOsbnkqHyZ8EhhyfRr6L8/et55CV15kI6+wbXPfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KFLfhMAz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KFLfhMAz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so8375875e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 06:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774530634; x=1775135434; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7DXD+hPkzLT/JkKvA59t+Tu0o4YIwychG/Bmk2dUEM=;
        b=KFLfhMAzqbIF8VA+RhyrTX7dhFTFiuTdRfOIv/JyDQUz1FmiotpMZcO+nCaHbjitQZ
         l6Gb2oZqXb15axqE3eUEH0UaNJBIwGgDnm9R08UfXxEkjWIcsrQUZF0xZBh1CsEZfuWr
         ZQ8Q4t76eBUpgsbgbOEepgGW8WBaFNAHa2681jtN3hTOSULybxcw1W957JoByRU6Oom0
         /fFadgUiNcKJ8KMVV8duojUgAtmrGrSEJkDSs8uFaqUHp8t1rA/tc5HLWqle0S2+MfXk
         DKYIX6Az2lJ6iGpKCW3et8vAauEfBioW1dZ8VKHb6H1ZEgcpwy1t1pCdsc9po9SldvL/
         otwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530634; x=1775135434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7DXD+hPkzLT/JkKvA59t+Tu0o4YIwychG/Bmk2dUEM=;
        b=QT+AVsJfU73nwxz7C9Cg4j+zNu9xW4fUuxZpKxfeDrI2BLyLTJPan3dbcB/c767290
         9M4u8bpG5t5HpZDK0KuZeP1RSiQlQGQLUzTVILmNCf+HGL1/Z5+YR6eR8M8Y6ekc1orD
         NQdSDzp/KlWPT06dFrUIbqwiZIjKEt5IcXlhZIakVZLaZ2nnyzPXvD8+3G+sAskBHZnh
         DpVfVoOUbRN1VP+1KQYxtrg+RZ0r38d/XXdA5fqLNT9801cKL+ENDwBOq1r5cSF1X+0M
         vb2GP51HXtnjQ/TRnJdavnlqNVDBMawpmEyG7VHIqo5MSW7lXYcsSWZttJh4l0HvTc3M
         A51g==
X-Forwarded-Encrypted: i=1; AJvYcCVzprnuOMqIWzZ7EcZ/CsXnblLFjbXCLrNEGh1jehHVBLb6CZuGlY6SHjwK7o7Wv+E/pn7JNd0Id+3WfVjb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7VWENyttcrBcq3V2Nfvh8yMscszdrCdFGUhRNC78+tIDvZf5E
	GN1OjXz73KwOtPkNHl8ntG5E8lktI6UHGgdNAY79hQSDKJEgc3XIYeSzD6/yLBgBp3l10pwoRv4
	rOpijBP0K
X-Gm-Gg: ATEYQzyfszLZ9p+sP9nSkTDhzjnsyh0ALHYETT+TPfh+EoHsZC5Ks7fszxAoW2Lbeso
	6yy5cBdzXt+NzpHloQyn9GCkl23zc2bd3KHYNSfsfyT1UhGqprF5SiuX33aHcgG68RB5ILNQwTv
	XsYEcCPdF4NVXmKDIQqRFVVeOrkYwzmiVsQ5n9t/gK5zNJt99mxZjpheLb0WnFW7uItUgt+qEj+
	HWq9LtAWe9zWY1q0JFki8eJrLdgjv6wtEPjuKxyiKgPCGSBChlmNRBQvqX4NhXeLwQJt5893cPE
	7r8vagi2ShWI1OVxb1f72T/88I6Wq74LtF6MsV8ecahTpXqQJa336jyHo9p6n+awHgo0HLltu8L
	h6ikWracnojeivaSoX/dOMu55EjXuCghWrbfND5q97fJPoXD0jpxeKpzHRbq5q8ER70rWdSKnpd
	UkIT0t9vy6Zm1WPjJ+vDrDxRcu5RBfo2+dLz0GFzB9zxAbvKdNKPNdRw==
X-Received: by 2002:a05:600c:3ba1:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48722bdfeebmr26820265e9.11.1774530633518;
        Thu, 26 Mar 2026 06:10:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:3224:f466:7352:9572])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487208b206dsm48271535e9.1.2026.03.26.06.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:10:32 -0700 (PDT)
Date: Thu, 26 Mar 2026 14:10:27 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: kernel test robot <lkp@intel.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Subject: Re: [mic:next 16/24] include/linux/build_bug.h:78:41: error: static
 assertion failed: "sizeof(typeof_member(union access_masks_all, masks)) ==
 sizeof(typeof_member(union access_masks_all, all))"
Message-ID: <acUwQ1AMUjwaHL7G@google.com>
References: <202603261438.jBx2DGNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202603261438.jBx2DGNe-lkp@intel.com>

On Thu, Mar 26, 2026 at 02:42:56PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
> head:   42d105958e98c6ae8fd6d62b38727444d25e735d
> commit: 8dcfb7e52f844e73413d7f743945e135747a1048 [16/24] landlock: Control pathname UNIX domain socket resolution by path
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603261438.jBx2DGNe-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261438.jBx2DGNe-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603261438.jBx2DGNe-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/bits.h:30,
>                     from security/landlock/setup.c:9:
> >> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(typeof_member(union access_masks_all, masks)) == sizeof(typeof_member(union access_masks_all, all))"
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>          |                                         ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    security/landlock/access.h:61:1: note: in expansion of macro 'static_assert'
>       61 | static_assert(sizeof(typeof_member(union access_masks_all, masks)) ==
>          | ^~~~~~~~~~~~~
> 
> 
> vim +78 include/linux/build_bug.h
> 
> bc6245e5efd70c Ian Abbott       2017-07-10  60  
> 6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
> 6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
> 6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
> 6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
> 6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
> 6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
> 6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
> 6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
> 6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
> 6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
> 6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
> 6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
> 6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
> 6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
> 6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
> 6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
> 6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> 6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
> 6bab69c65013be Rasmus Villemoes 2019-03-07  79  
> 07a368b3f55a79 Maxim Levitsky   2022-10-25  80  
> 
> :::::: The code at line 78 was first introduced by commit
> :::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert
> 
> :::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Hmm, intuitively, it might have been introduced by the Unix Connect
Control patch set which was recently added to mic-next:

https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git/commit/?h=next&id=8dcfb7e52f844e73413d7f743945e135747a1048

m68k is a 32-bit architecture.

We are introducing the 17th filesystem access bit, and changing the
size of access_mask_t from u16 to u32 there,

The relevant code is:

```
/* Ruleset access masks. */
struct access_masks {
	access_mask_t fs : LANDLOCK_NUM_ACCESS_FS;    /* 17 */
	access_mask_t net : LANDLOCK_NUM_ACCESS_NET;  /*  2 */
	access_mask_t scope : LANDLOCK_NUM_SCOPE;     /*  2 */
};

union access_masks_all {
	struct access_masks masks;
	u32 all;
};

/* Makes sure all fields are covered. */
static_assert(sizeof(typeof_member(union access_masks_all, masks)) ==
	      sizeof(typeof_member(union access_masks_all, all)));
```

Intuitively, it is not clear why that static assertion suddenly fails;
17+2+2 is still well below 32.  I see that the C standard does not
give strong guarantees about the memory layout of this, though.

I'll need to have a closer look later. I can imagine that there is an
attribute or such that will hint the compiler to pack these bits
tighter.

—Günther
