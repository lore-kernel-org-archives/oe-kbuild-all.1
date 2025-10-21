Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A9627587D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077625; cv=none; b=g+5T96SSEafJ7j0ihqRzYbIUtPDXNvOhNjPEG9cr5/bHu2mq2T2ZPMcAjTciVek7itWf0fYqwwI94pGtgh6QUD0LnitysBL4Ds7q44THQIRSWYp6mpd6DVzAQBDvsxOto76mQzEKCUhTLtaqVr9J8TPqdiqERybTOZpmJ9yU/Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077625; c=relaxed/simple;
	bh=m8dulZsmOF4wEvLc1RlTO2XmXrclzS6tJ1KKfQwhMpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YE36RDQ9+xZeoeUUaNgux7supAbjRLwgq+rDOhf+lBoLfrjn6IcNaw6LO4DT+DnNDEwsrHwFepeHPXseVr6rzeSpH7SAli5t8xO5aon+pBjhYrWGdl/6Qs/fkzi80WIhZCEOpwyZqAKLFgEh9FNhDRK/NWJ6KsAMow2hWGXbpzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=llUNR/1h; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="llUNR/1h"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37777912136so58959571fa.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 13:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761077622; x=1761682422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFunx2MZpZr8MGsSovVvmXHzBeV4exhykIDoDRfAdgo=;
        b=llUNR/1hmUWv92ZGc9ViNoafbYYxugoQFI1TxJuI4BIBYAudx6176WhEmVgrYl+BrF
         sjXLtzPaCBM3NuaGSGHJ9RDmNskGEbdJfXWJpp7iXJcAmgzHcC8lHxfmwQJTrPDgHhCP
         +FxRV2PKfNtpel/SXyplmvbdi02sxIKEcG5sfXYJP7Fb+ALEGbyxqE86TPEk9avApnLD
         W0AdAVkgirEf8yQyPQK824XQ0zNw2R2LOUHZ1RGES/CTXUZVvffE9vzlFWfYdxhvIh1O
         zR07JMpc6jjkQk55REEVs/OC5KWmP4b1pmJFdoaRafpg5J78FHwvMRSRgRjPq27K0MbD
         xlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761077622; x=1761682422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFunx2MZpZr8MGsSovVvmXHzBeV4exhykIDoDRfAdgo=;
        b=M9jz3wsdfAxwof0Tef7z9axLbwCiBjTTwNYWZRmaNiWVHrzOxHSHxTUV6N2G77jxCZ
         iZiV/aMTwo8SySg0z2CZ2O15UfmM4fQbFqkcUfUvuGo3EUiF6VvRHFbMH2wXNa+VqYLd
         /oHvDu6ti4+QDy5teRmXlH7r4241WeeTfoCFdjWtfOp/CkBAFomkLIJjcV8Z4Z/vKCCs
         vaGgiRjYbHWOTAlE0pABbh8MAxxhKQGyTMifKwZsO+RqmDWuJxhgNKdTVs9uiy3X7w98
         lvr2ow/EOJhPbyY1Ru1/iLloL4a4mfsSSpoHCXH5DnlOHxEIowgZF1vTkAjK/AdzNZDa
         C84g==
X-Forwarded-Encrypted: i=1; AJvYcCWqbm4YvIzHU4dZuTm6u0YPZBP/PpE3YVagcCIPsHo7r5DRPBbvCakHt88Le2Qi4+OYs3vqLVJPzUX49PEl@lists.linux.dev
X-Gm-Message-State: AOJu0YxvczAOnUsHbQjW12jOZbLy/len2I1bjQPSFrLOIGCDv4saLHFS
	vfUooXRKctWa5zjmyZzXlHm9XTM1heNnB/DfqgzDl8IKbGfL8OHovLYsy82xhzYOI0BP+ownt0E
	YL/tbGp+bn95Etigh1yMPxrn847aIRhPo3uCwsnMU
X-Gm-Gg: ASbGncvEm74z5Fud8dTDDiM/jm+LJg0Ds5qDFAre4+bcwoOk11dahPlml96PBPRTtfc
	e4H4Cs6kWtH6IsKN7rXGmL6KAdNCQltppImv4dWog2GlPsEmuOcRsBXRWMDcmi6JWQTgcl18mB8
	js/T6Cynp4it3GEu9dtJP0WMK0RQaZ4jNd1CuPel01+eCIw5n0bcje98Hl4RqkEMkucYC5fowGb
	7PMuPZUT2bJMTmoKd2dkrllVgy9BaDUS5uf7wFLqAAvkdYn7GCbK5qP2/428A+IIzNLx1HRsWOk
	iHAx1oZMzpElbv+XJX27zEQ9HQ==
X-Google-Smtp-Source: AGHT+IGAvGEVgit/SDBbJXfglgzrCcYtyoqLzzRV1N2+0Gnz2+ROcolK3EI6Rrn4aLeI5pJYAVKljQP6z6syteJTyHg=
X-Received: by 2002:a2e:bd17:0:b0:376:3a83:428d with SMTP id
 38308e7fff4ca-37797ada3e4mr54852761fa.48.1761077621527; Tue, 21 Oct 2025
 13:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017233907.2305303-1-wusamuel@google.com> <202510190215.ppx4apvg-lkp@intel.com>
In-Reply-To: <202510190215.ppx4apvg-lkp@intel.com>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 21 Oct 2025 13:13:29 -0700
X-Gm-Features: AS18NWAbUHSxxc75oxQg0pd4M1nulX2qNGsXjQaXglcPLJv9sfuKAT6aV7qCa3A
Message-ID: <CAG2Kcto1=kQ-6eR50aA_Uj4jUSQEVLaZs1Ucp0R8y6hMxNfLvQ@mail.gmail.com>
Subject: Re: [PATCH v5] PM: Support aborting sleep during filesystem sync
To: kernel test robot <lkp@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, tuhaowen@uniontech.com, 
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 11:32=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Samuel,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on rafael-pm/linux-next]
> [also build test ERROR on rafael-pm/bleeding-edge amd-pstate/linux-next a=
md-pstate/bleeding-edge linus/master v6.18-rc1 next-20251017]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Wu/PM-Suppo=
rt-aborting-sleep-during-filesystem-sync/20251018-091422
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it linux-next
> patch link:    https://lore.kernel.org/r/20251017233907.2305303-1-wusamue=
l%40google.com
> patch subject: [PATCH v5] PM: Support aborting sleep during filesystem sy=
nc
> config: i386-randconfig-012-20251018 (https://download.01.org/0day-ci/arc=
hive/20251019/202510190215.ppx4apvg-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251019/202510190215.ppx4apvg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510190215.ppx4apvg-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kernel/asm-offsets.c:14:
> >> include/linux/suspend.h:510:15: error: type specifier missing, default=
s to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
>      510 | static inline pm_stop_waiting_for_fs_sync(void) {}
>          | ~~~~~~~~~~~~~ ^
>          | int
>    1 error generated.
>    make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.=
s] Error 1 shuffle=3D1011955029
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=3D1011955029
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D1011955029
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D1011955029
>    make: Target 'prepare' not remade because of errors.
>
>
> vim +/int +510 include/linux/suspend.h
>
>    508
>    509  static inline void ksys_sync_helper(void) {}
>  > 510  static inline pm_stop_waiting_for_fs_sync(void) {}
>    511  static inline int pm_sleep_fs_sync(void) {}
>    512
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Oversight on my part- I'll fix this in v6 along with other feedback
