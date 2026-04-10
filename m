Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B798A37FF70
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822829; cv=none; b=bisO3LIYHW7eN6XrubbgpKNyTdk5vVrXFONnhy6pVE40FRATcGPDb7Bn6+WAydshllMYpDGEfFTukGZtjyuetxUZJW3MuwLCj3c20+zHEcMKdUQK7kQFVXRDmd8uOJqZFPi1umhWKcJvbmLDjyRqTWYj1CJ/yFk77r0Um5K2YbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822829; c=relaxed/simple;
	bh=y8wq9K6wPZjK6RX2SLepbI7mZ9arq8Fh+pq616PCsak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+/uRu/vjUo6Mqn/as3AJ+Ukb8oRhtvWzRNRThWkJL7W5Ab5E34eICx4eKWYXxvuRKAcT4lgmwJ1IWuWp+IZ2q6aJf/EXt49d9MYxkjxYR2pL3JX5vDSu2SNTuozlU3+/0sQ4F4lvB/jpCYtmcNxLbKJ+rq4uucwmJ/lh8GDLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMiiQjPG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMiiQjPG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b983bb07eso1220732f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775822826; x=1776427626; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dM/PhrUnxJlxW4P6Q1HFuno0p5AY2ZlnVz0VHI4xQUg=;
        b=fMiiQjPGmkrVRdapTLdj/RyZexZDp7yfUjBJXqB3DVefG+Ei1W3Fmccw2BQhtwe5wF
         Xd99LAvhwq5swjQL2Ofbs2hkBPGTF/fMIdB1RvLMDMjNowDxy1isl+ig3DTwGHUpEAA3
         lq9SA7fzJ99MCwM343R3KzWflAmCEC0f0vbdfAyZ5FE//nv4zWZCPuoXo0XTPq1+WL09
         v/lwpfkyEC5wd9qhWiKWaxUHm/8zJ8EVq5jNasoVffKPwS3nSA2/+akTzlsFINaMhIlS
         myGi3o1UxJ967WOgNBYWrvR68gG6OZfrQWoFV8mU/+8bFoOU7+M3Z1w23S1zYL/9AHhT
         CnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775822826; x=1776427626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM/PhrUnxJlxW4P6Q1HFuno0p5AY2ZlnVz0VHI4xQUg=;
        b=Oo7aOSwhEZ0uG39XoN94xdkobC9St/WewuXbEW4gZI9EPYr6jQTeeIKDvrcQKkW1Sn
         T836KuOGp6yAXb/F4W72d15UBpSSp5DvgBuzXg6ZiSW/A2AsQlTL25HRbrqH6EnowYh+
         Bmp9x7WWtUcYMz0OysWNi2efvQIztV16FN3IBscZnyTvAbDYczpICxlOCcaKQPKU3T7y
         JPZd4mzV3Y9+Ud2SH1zrBoetJ+eBQy9k0dJbRGF53RC8pG9Fkcql1ty10OOxCPNs3eRG
         d2gHRTenYjAsG6TXi1JNwkrr12JNriWEneRiKgczN0gQMvh4jsERLhgni+PNbNQGGc3T
         WRbw==
X-Gm-Message-State: AOJu0Yx133q1UEYSt8SiLiocTtizyWy1k4luCWgQXsxRoz7yTxa805iP
	g5jNjSURER4iTLUeTOhxiIG8DrHnB2jHzvp6OTy2yxv06+knNWDfSu1FWyYcQg==
X-Gm-Gg: AeBDietf8dT/AIugL4gOkSIDVop5Fm/6NvdONbhF6iZEq+59DmjaeT1bbCRCICe4n4g
	5wInn1J+dN5bAUr4YYQ/vhswm/WLt7S3WOXySJz1MhpX2YfrLUc6bcf5tEnCWd+34u8eIlCLnNf
	kKPkvdH4hsShtGoSpXRSqgWVfABZByWZ+Iqq5DQQCE+RXc9+AeUS0zfGkDyP/BAwpQbUyAqVQaf
	li/5QSK375QmidY3NObpdDILlP82pfkZmbbG8r9Gk/dUUF4LTFG4uqV1Hly3pUqCqRT1waCJqSN
	atVbpXhV+rQJOWpMjKoHLyrKID2IAZMo3lIKZVrYH664WEdzU17J+PfS00r2OKfulw/Rtlj+DOU
	BYopv7GJVUWVJEkAxf+XvBO/X7sOwU3F/WRRzB4XrVIFWAzZOmrTVkp17wAbndlgmzgjuM4ogbF
	EN33j9LtyWFr9N7K1CNxSe0yBr584aPg==
X-Received: by 2002:a5d:5849:0:b0:43b:45a0:9df8 with SMTP id ffacd0b85a97d-43d642be552mr4605309f8f.35.1775822825860;
        Fri, 10 Apr 2026 05:07:05 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e468d0sm6945926f8f.18.2026.04.10.05.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 05:07:05 -0700 (PDT)
Message-ID: <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
Date: Fri, 10 Apr 2026 15:07:04 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>
References: <202604101721.fsv5XmCX-lkp@intel.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <202604101721.fsv5XmCX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2026 12:25, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
> commit: deb3ddeb18652118956fb581a39ac299e1ee5623 wifi: rtw88: Enable the new RTL8814AE/RTL8814AU drivers
> date:   1 year, 1 month ago
> config: arm-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: deb3ddeb1865 ("wifi: rtw88: Enable the new RTL8814AE/RTL8814AU drivers")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604101721.fsv5XmCX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/bitfield.h:10,
>                     from include/linux/fortify-string.h:5,
>                     from include/linux/string.h:389,
>                     from include/linux/uuid.h:11,
>                     from include/linux/mod_devicetable.h:14,
>                     from include/linux/usb.h:5,
>                     from drivers/net/wireless/realtek/rtw88/rtw8814a.c:5:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"

struct rtw_2g_txpwr_idx is missing __packed. Could that be the reason
for the error? I don't see what else could be causing it.

>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    drivers/net/wireless/realtek/rtw88/rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct rtw8814a_efuse) == 512);
>     ^~~~~~~~~~~~~
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw88xxa_efuse) == 512"
>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    drivers/net/wireless/realtek/rtw88/rtw88xxa.h:64:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct rtw88xxa_efuse) == 512);
>     ^~~~~~~~~~~~~
> --
>    In file included from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/module.h:12,
>                     from drivers/net/wireless/realtek/rtw88/rtw8814ae.c:5:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    drivers/net/wireless/realtek/rtw88/rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct rtw8814a_efuse) == 512);
>     ^~~~~~~~~~~~~
> --
>    In file included from include/linux/bitfield.h:10,
>                     from include/linux/fortify-string.h:5,
>                     from include/linux/string.h:389,
>                     from include/linux/uuid.h:11,
>                     from include/linux/mod_devicetable.h:14,
>                     from include/linux/usb.h:5,
>                     from rtw8814a.c:5:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct rtw8814a_efuse) == 512);
>     ^~~~~~~~~~~~~
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw88xxa_efuse) == 512"
>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    rtw88xxa.h:64:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct rtw88xxa_efuse) == 512);
>     ^~~~~~~~~~~~~
> --
>    In file included from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/module.h:12,
>                     from rtw8814ae.c:5:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct rtw8814a_efuse) == 512);
>     ^~~~~~~~~~~~~
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

