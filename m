Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADFB34E74B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770163146; cv=none; b=aD2NsBdxH1TJ7rzkL/zzCfY3+Wx3DMcdjiwarVn1zUPpdXbAD28REGdDhPST7AZkETv8q1Vu6bWFb/xxGSi5luKmxARMbXqwKH/224zBCAUZzF+fM0TnlpNinXkofjMvVPC9wB+VCufddXw2eYa87nyN6eeZJEyVYuWyK7fvmmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770163146; c=relaxed/simple;
	bh=c/X2XJ/CyW+pJEphZsV9Marg9EA/Tmbv0iSdpPMCTmw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cFrCgSHUN0fOFodWzi8TuQbiN6vokA1V/JsKOk9LpM0zEjjAqKFW1ufoRxlUE8OzoBmf2Hp7jEqgx9KAh5V7i7qW8Tc/AXV0YrndVok4hjzOxXZiNP1YniHWNpwqsfc+JkXzz7O0SVwWTLOiSuj2aBSbSTbHsvetLExTAaUOTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D17PoiLq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D17PoiLq"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fb535b73so57591741fa.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Feb 2026 15:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770163143; x=1770767943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hblut01cg4liiCBRWjvcMFZ79KDKqattRzEpdMr9QyI=;
        b=D17PoiLqfm8YY2SSPkNRutZI8GF3Dfn0FSDxpCZq++Wup0QTLJ8mA6+/LfgfLqxFpz
         JxQIGSCSKMiviB6SqIjTPX9YgO9LdkMeDqxTK1+56CS1dRNhH+nQe8IFYaRkFh0uLnw/
         CqXazbEQLIGB71GcY+QKQehWsNSj8adr4TVQit1K22jAIU2jvOkMobiUY+4sVbnsZ1cz
         ZPxNfqH58hZjSdLkrpRuXuoDx8EyYsHxBP2hChc3DirTZllOUYpd92LreB+b+U2rFZ3y
         BVp45bYQtvXDVHoXLn974YGHBpTe3iQg9SWjTAOJK1pWveVAtLeIALxKsQMAyZcutP5e
         D6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770163143; x=1770767943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hblut01cg4liiCBRWjvcMFZ79KDKqattRzEpdMr9QyI=;
        b=AvLlOjyNSV2ysev7xUlRcSrBn484agp0Dttpyf7RiS9rPw8P8px2LPsyRYS5Huvu+N
         DYMl49D8yBe3Ks+JZ3PjPh+zyMBW7Cg1uUMQi745Wchd397KF0GdE+6+EE6m8bdsk15w
         XS6CMt5RFWuzkzUzijLWtaMPT1O36qn8FAM0NLmi6Ig9xhXhela1zCvoW3IOx7vrWITK
         ggYUHMJS53RJreSUra5avE6wlHxtSmTLTuhg/mBSQ1r59WIIESq5tMCBeO6/pwuN2oHg
         euOZbFGG42CMfsjNW/n1fNk1+GDBPNRC9WGIGaxqOZHjL1qfroCWVPzBLPkMWnEU+dUA
         o5VA==
X-Forwarded-Encrypted: i=1; AJvYcCV0RruJ60fdPW1ziy/fPTUakt+AwDEIGiT8RZ1AsmIt79eLhY/zCg+MdubqHrAI7yOAN5BcAKH//j8OMxDQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu1ONxY2S0xn8rNO6zLFmPjGO6jtZW0PC5v1lYNR9x3r4df5VI
	MPDXMe0y8au4GS4PfC8m5VratmxOBpKf3F9okMOkkBHO3tgC3H894Q+iq4p6Uw==
X-Gm-Gg: AZuq6aLin8f1FC6cCLOkm4BkY1b0rtT5zQU2HBTnhD7RtRayTTjCH2tijle6j53FZK2
	b9WA9S/E0nptUTcDjYx1ZXsrs4Af7ENQhDIk+oXXYG1adsDleTJXWSuAgQh6nK0/E2+iJjCIUkR
	x5Rk0x8gicvkvks/63Gk1RJ8QLyd2m7Xh4yubssu2vgV5Q7szlnaFQ1y27QrGvm//Nm7kz9M8KN
	P7dTMBXmZLgiF7pslIfbNw5CzEud6ETleXeGGmsTyC8EFzS8qLMvQiyMJmZPitbOrzyEXBOGwsw
	3XTIrgmJITQZj+PJBrJRDAU10TE0GFtsF+0HbMusPUI7qL98K2dV8IoKrPRI/QIjvm2rEpQtgYN
	f9ZIdQBeexkidVFGLf9Bt0TZk4IAlCNDixeywxPrrR6qz4Uui6KsnFzptYwpVUyisaO3l13XpVq
	zonvs2bBdWPxnho74iehR6dDFFlRXRYkBd4wormuxlIaXHqjKzYRBe
X-Received: by 2002:a5d:5f85:0:b0:435:e57a:9082 with SMTP id ffacd0b85a97d-4361805836fmr1231517f8f.46.1770156314379;
        Tue, 03 Feb 2026 14:05:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e250bdsm1637638f8f.2.2026.02.03.14.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 14:05:14 -0800 (PST)
Date: Tue, 3 Feb 2026 22:05:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Willy Tarreau <w@1wt.eu>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, linux-kernel@vger.kernel.org, Cheng Li
 <lechain@gmail.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 11/12] selftests/nolibc: Increase coverage of printf
 format tests
Message-ID: <20260203220512.56d71f75@pumpkin>
In-Reply-To: <202602031944.7j98nfRE-lkp@intel.com>
References: <20260203103000.20206-12-david.laight.linux@gmail.com>
	<202602031944.7j98nfRE-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Feb 2026 19:22:28 +0100
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20260202]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/tools-nolibc-printf-Move-length-check-to-snprintf-callback/20260203-183919
> base:   next-20260202
> patch link:    https://lore.kernel.org/r/20260203103000.20206-12-david.laight.linux%40gmail.com
> patch subject: [PATCH 11/12] selftests/nolibc: Increase coverage of printf format tests
> config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260203/202602031944.7j98nfRE-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031944.7j98nfRE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602031944.7j98nfRE-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    nolibc-test.c: In function 'test_dirent':
>    nolibc-test.c:784:17: warning: 'readdir_r' is deprecated [-Wdeprecated-declarations]
>      784 |                 ret = readdir_r(dir, &dirent, &result);
>          |                 ^~~
>    In file included from nolibc-test.c:32:
>    /usr/include/dirent.h:185:12: note: declared here
>      185 | extern int readdir_r (DIR *__restrict __dirp,
>          |            ^~~~~~~~~
>    nolibc-test.c: At top level:
> >> nolibc-test.c:1654:1: warning: 'mat' attribute directive ignored [-Wattributes]  
>     1654 | {
>          | ^
> --
> >> nolibc-test.c:1654:1: warning: 'mat' attribute directive ignored [-Wattributes]  
>     1654 | {
>          | ^
> 

Ah, a line I spotted reading the patches that shouldn't have been there.
Changed it expecting an error when I test-built the next 'round'.
For some reason it didn't fail for me (maybe it needs W=1?).
The line is just before expect_vfprintf() and I was looking into why the
tests weren't getting printf format errors and then thinking I could stop
gcc bleating about a missing format attribute - but that doesn't work
because the code is testing invalid formats.

	David
