Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2A23F431
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 05:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526331; cv=pass; b=a2NhGgo2zO8F6j1aex2R66HwK2u/uG4W2hNN6/F1Wy9jHazTji/q30MA9dACIuVlv2lSBPGOPibozK3QHgePzA+OEEird2ICGZwPVY/XmTu1c+TiTwASB+UHp0FBzg0wnRWO+U+g5HrM8aHM/r6aIZyrAtz3Z0F1hIBz0QoIBCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526331; c=relaxed/simple;
	bh=P1sfo+Q5kI12SwY4byNjcRdmuNM0osuq3r/DXEeSUyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snidPdkw+5O2D0IZz5nQP8w0mZR5WT/UffhmVgHrpd8nleXl84Ess5aBzM+Wdsef3TFMuhsrGcrZsXwR40SndsbAfUNNz9VwRN/0AYmk5Lh+Ey2VlV7BgkgkABgEQZAWFy5CjNmAwLJ2twlytZkM5kiCkeAWchSdCRRlaZ+kzuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiAW9FLV; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiAW9FLV"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6501418152cso422096d50.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 22:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777526328; cv=none;
        d=google.com; s=arc-20240605;
        b=LDiae4tN3JM8M6rv4kscEKlXiA+/T6WVBOQFmmDPcxU6Jgi0mzg5hVI+uTP4rKf67Y
         lpb7VtRVGv/AUE+dv/WnTySVZkbOGwaFUjVSJDR3+ZhTaEnsu3mEu8op5gHvulRZn1Sa
         ACgtpfH6Xp1flRG7I8JzEtBOVsjvCbyXnbrYP6zsBLYYk4tGd3yVaXDuRCSUh1/tKHDs
         kyQMaB/vYSIk6X5U7oJUNKUJnMNZLbL/MLAIFdEeoEwAMYZncr+gqYuhQubrrGMipY8P
         e9+PAbJOBRwicg7UkUii1hBqw+8i8dpkwydaQ5sRukAw+glFSmKLeXIzG7Dk1TcJBHEO
         iGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ai9guCpibXPXFjFZdk1+jpyO2wT0iDbSyZIBVstbTwg=;
        fh=lC15QTtXMQEy+W9VdATLC1ceXPia8xe/Tfet0rqtjmI=;
        b=bpH9vmjrjwWQ4cT0h8PnGwyeuX0Ftf0pu+HD/WI+9tupcEXK/3ATEyiuGD9nKWkENp
         rq+S/IY4HMwRLLZHnk9HUjx+fTQgWbeVF9U0HFQkK4HwJM/WqhhfvwlxCxNr3DjhBHch
         trYxD+1kbXe8I3sU7uqEdFIaeqoCcPZLB2S92zjFIPz/0lyDaDrEcbLZ6otnvF+vwjRx
         DWprzanBeW6EK5O2ZBvvCbYOVMZTFYrwLwpihd/T69iyvymbvcUUahxV0Lv/cHa+hQsr
         crYmw+yZWqYYIZiBSSxOJQRQa3P5YAtXfj5pZvkx5Gqkimt5jB6/AAKUAnxlLFrY0Jyd
         bf4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777526328; x=1778131128; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai9guCpibXPXFjFZdk1+jpyO2wT0iDbSyZIBVstbTwg=;
        b=aiAW9FLV0vuuamfmUsNTQUc91AId/ntCLdVuz321tgajXerFnQYIMcsaiZ8FGtZ+Yn
         K6ViI0IbOHAnLBaPQZgcnfVsqrBIrxkkfhlaT3bN7XMiAEKgglaB84Cvkuymkrs4VVyE
         eZuyHkNeCztyXNY9XPb5/sukrnCvwq41Ck4rOHEBTZTrAcfvPm35Qdr6iyOnsyc6r1Fn
         GtY8b7D5mX7wxNczdi92RpiEKQYr+zdOM8oBCMIo3U+NHV0oddcAK3JOzesYdaROGOxv
         DMCgMBvEO6s7Y4DG2JP4o9z+KxmXyhRFS4i8YVCTcZA6scobnX+Vw0PWe29Qahp9+sFq
         xJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777526328; x=1778131128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai9guCpibXPXFjFZdk1+jpyO2wT0iDbSyZIBVstbTwg=;
        b=ZbkIHpfc16nLYvswGUB2PLvjtBWoYbpmrA70nueph1Tjc8jcUBkbWXfQPuJBcoG+Be
         Rs9I8emywUkyFkUn1ZKCjf24XOK8c+U+dCm1FdxhwNj+VivtLbBh2lAATloa97tr1jKJ
         fzqQvMCk54clhfK6Lp6MoCxj4AdzGcGdemnro2l0JRJMaGtSXKLSfuYqxWGwJ5gMnHSP
         rHxxCzmy4Up2Lb3yCc3i91oAtWNMvwi7wYX4TBwdzcn4gryM/VM6l8m8WIgZqeZkp6Ig
         YipuuYrWQRbDWiyE5PEVNH017ZvcEPpTijhBIbV26SUp38SmSDY6Ec6JcOoKk7fuUgp4
         OPQA==
X-Forwarded-Encrypted: i=1; AFNElJ9hvTbobewo1/ajshJdMsizM8AovAv7nkZTCNj9Zt72o1aKk6647jfozc4wUpfFg/rSJ0YBPz+Tn5mUbpB+@lists.linux.dev
X-Gm-Message-State: AOJu0YwmIWM2RX7zy7vCPys1kUc15CaSLjtIFT5kbdNpBnFRzKf/J0JT
	7Eb1tfvcpmR5ZXpBRcJaAAmUW+wkHnP1r1iuT44RBGBS5bFiZW/xMLUxlap/G8k5uc7ueKjjows
	nmsqoWjyvlO1qbct6C/QcZ86yW9XFAaA=
X-Gm-Gg: AeBDieuNOmkh2eDonPCpiE6iJW0shDhiEzmA3XeDu+lpaTPOi2yZiG6iDb//vB2FJeW
	PcX32CmJJqxO58QNl2qdffbvu77DumzBOXQNVG9uzHCg1ENWnTGl9p8V0GryXdAF5eh9eyTMl9Z
	7y0lJGbDFxSkolZ63HGB8cqSRDySLORjU7Tal+HzcIE2aWuz70Gr0A2huXeltJLsooyUk8/bgn9
	maS9oIizxQsN1h9aYxibUCk4gp2ikTQbj3HJMoJ6bZWosAVIwzJrGwYikj3AIxxiSLR2ny94LSf
	/MdibiYbP7XxzSyxopI=
X-Received: by 2002:a53:ca02:0:b0:650:2257:e085 with SMTP id
 956f58d0204a3-65c18ddff59mr682510d50.30.1777526328567; Wed, 29 Apr 2026
 22:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415193455.3869807-1-lgs201920130244@gmail.com> <202604300638.5ysk7jy1-lkp@intel.com>
In-Reply-To: <202604300638.5ysk7jy1-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 30 Apr 2026 13:18:39 +0800
X-Gm-Features: AVHnY4KTWVjqmwRu5uzb2FBcih9ICZ6wwRPGHbQW1XPPHW286ml2iZ9APHrv-3Y
Message-ID: <CANUHTR90BbRGDwpK398AAW5V_ZqoCcuWbmuwk7P2-HuZE3M5uQ@mail.gmail.com>
Subject: Re: [PATCH] x86/rtc: fix failed fallback RTC device registration handling
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Stas Sergeev <stsp@aknet.ru>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Please drop this patch.

On Thu, 30 Apr 2026 at 06:41, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/master]
> [also build test ERROR on linus/master v7.1-rc1 next-20260429]
> [cannot apply to tip/auto-latest tip/x86/core bp/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/x86-rtc-fix-failed-fallback-RTC-device-registration-handling/20260416-130623
> base:   tip/master
> patch link:    https://lore.kernel.org/r/20260415193455.3869807-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] x86/rtc: fix failed fallback RTC device registration handling
> config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300638.5ysk7jy1-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300638.5ysk7jy1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604300638.5ysk7jy1-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arch/x86/kernel/rtc.c: In function 'add_rtc_cmos':
> >> arch/x86/kernel/rtc.c:142:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
>      142 |         ret = platform_device_register(&rtc_device);
>          |         ^~~
>          |         net
>    arch/x86/kernel/rtc.c:142:9: note: each undeclared identifier is reported only once for each function it appears in
>
>
> vim +142 arch/x86/kernel/rtc.c
>
>    133
>    134  static __init int add_rtc_cmos(void)
>    135  {
>    136          if (cmos_rtc_platform_device_present)
>    137                  return 0;
>    138
>    139          if (!x86_platform.legacy.rtc)
>    140                  return -ENODEV;
>    141
>  > 142          ret = platform_device_register(&rtc_device);
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

After re-checking the code, rtc_device is a static platform_device and it
does not provide a dev.release callback. Therefore calling
platform_device_put() on the platform_device_register() failure path is
not appropriate here and can trigger the missing release callback warning.

The build failure reported by the kernel test robot is only due to the
missing ret declaration, but the patch itself is not correct because of
the static platform_device lifetime issue.

Sorry for the noise.

Thanks,
Guangshuo
