Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE210F7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBzXFTJz"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1fab887fab8so1617194fac.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 Dec 2023 22:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701584600; x=1702189400; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gFZVSy/mDE5jVuc8vRPPNuE4Bl9VhCOmG3KA5XneZoA=;
        b=SBzXFTJz5O17QnG8WxQ2n7+LoOJeoKyNKxclxMZ4bfSdQpU3AUW9WaxO/324IF9Boj
         M6bGjFCWyGtj+3/8P3+bYuRaCu4MOs19wUgFuQrUyl9tdO/EvaTa4nuG51+uBuTPndLv
         kfAJhQ/JJ0CHOK2Lps+ZJyudwVtL8dlE1k/JJJkUySLtvvvAftu8gYP7Cf7mxB026O2U
         vRmQxbUmsebETx0Ojd2Ro8VDwiHUn69U93uyunCzhYatbW3qIea4rhE4BYbMjiCVKWCy
         zTfRBQaz6dB4sY369/PXKq3IiCM5ZWR4g1IQCFm1gWn2ehLHhS0y3zkG80Tqp2hSwEDh
         DpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701584600; x=1702189400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFZVSy/mDE5jVuc8vRPPNuE4Bl9VhCOmG3KA5XneZoA=;
        b=dJZC535R2w6Znd6V9iq3+NW5mfMFJqCcwwbBsKO6r2FZK7+AxmyyMlK9t7jo1DrLrA
         LhXvm2ZOFfuW7rpagT19hE7nXKQ8oQRa/h1NePoRbM1yhqGS0TL+FpT/QcUgHmVLgvsr
         apHp/BnYy70VD0G3HP7FFEsFcgZsOC+Rf56YuKjAX/v6bRzfTuszgt5vFlddwg5wTPmh
         P+LDctZNyNGdT8OK33fVpx+/LrFInWAGz1HsKIrIYG7/n8M6q2ld3HdA9xchxvcGj2nV
         q4Hg0oDMPI5MFH2j4apLK67rtf7VMvQ/XSJDmUbgtjsnctCPfRlmTYscUzSGDZIMYkXn
         OxJQ==
X-Gm-Message-State: AOJu0Yzjjuf1/yZQs7HYB3PLvxO4EySFl/2NeqFzTCcuwmNpNacsaXOx
	G7k85tT8YUWvpstrnI6zRhk=
X-Google-Smtp-Source: AGHT+IFVAjUvehoCGg+BRJsQoJfSWyjs9qnxcnOt0ZbDSr7QOtaVFqlBA26ydggUnhjUw8Gqg/1lJg==
X-Received: by 2002:a05:6871:5a8a:b0:1fb:75c:3ffd with SMTP id oo10-20020a0568715a8a00b001fb075c3ffdmr3435970oac.93.1701584599755;
        Sat, 02 Dec 2023 22:23:19 -0800 (PST)
Received: from google.com ([2601:647:5e00:4acd:998a:3f6b:ae8:65b5])
        by smtp.gmail.com with ESMTPSA id c22-20020a63da16000000b005b92d3cb4c2sm5799328pgh.58.2023.12.02.22.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 22:23:19 -0800 (PST)
Date: Sun, 3 Dec 2023 06:23:16 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszormenyi@sicom.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/input/touchscreen/egalax_ts_serial.c:116:21: warning:
 '/input0' directive output may be truncated writing 7 bytes into a region of
 size between 1 and 32
Message-ID: <ZWwe1DJ7gBdOUHwY@google.com>
References: <202312021646.cwwvptuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202312021646.cwwvptuB-lkp@intel.com>

On Sun, Dec 03, 2023 at 02:07:07PM +0800, kernel test robot wrote:
> Hi Böszörményi,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
> commit: 6b0f8f9c52efe24d6dac06ab963b7bd91c723751 Input: add eGalaxTouch serial touchscreen driver
> date:   8 years ago
> config: x86_64-randconfig-r032-20230515 (https://download.01.org/0day-ci/archive/20231202/202312021646.cwwvptuB-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312021646.cwwvptuB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312021646.cwwvptuB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/kobject.h:21,
>                     from include/linux/module.h:17,
>                     from drivers/input/touchscreen/egalax_ts_serial.c:19:
>    include/linux/sysfs.h: In function 'sysfs_get_dirent':
>    include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
>      517 |         return kernfs_find_and_get(parent, name);
>          |                                            ^~~~
>          |                                            |
>          |                                            const unsigned char *
>    In file included from include/linux/sysfs.h:15:
>    include/linux/kernfs.h:428:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
>      428 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
>          |                                             ~~~~~~~~~~~~^~~~
>    drivers/input/touchscreen/egalax_ts_serial.c: In function 'egalax_connect':
> >> drivers/input/touchscreen/egalax_ts_serial.c:116:21: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
>      116 |                  "%s/input0", serio->phys);

Please stop using -Wformat-truncation and report warnings as errors.
This particular warning is disabled in normal builds and the truncation
is desired outcome here.

Thanks.

-- 
Dmitry
