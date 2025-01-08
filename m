Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1031A071C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327860; cv=none; b=hs8LVQXCTZWhExsD+kVpKg8WC/ptrw987WrVEUNZZ+gOCY8nI38csZQN2mN3Xzd4ZjmMq66ence7ynHPwMCpjf2CbacV1kN/NbS3r6ThZrHWOjEvmUMxIPJB8S/AGG5amNyDCkC0FVnL5zOjH7onVLiBjDCctRg4wC2cGmkRjw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327860; c=relaxed/simple;
	bh=YRFzkzP1f02Y3xno9dl7exjCnC+zB1oWQ8Zvtas2mjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXILQ8sgOMueMDHeptOeTe57DIWqxbbFV+6wpmY1PgzfFx2EhySOYvzlCmX36N3UjxXWYGeOZGK+r/FeLzSkzpkPcIkupF4PuN/mJQXBjCDhx9/UYRYds9UTvZwdp2ujCygaa8AV+xPB87b++28orn7wpiQsbJNfblnFshx5n4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JnDcUfZI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JnDcUfZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736327858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JNZS5mFbp5S3CClb5D4PG6lED+njEgaDVZSNHelIDGg=;
	b=JnDcUfZItx5Ai6Tw17UjSP28+zrOv3Aa3ADWrWwdqUj+DrzDfolwmSU9rPGFljRUnKaNUo
	kz9znsI/dldFohDeFXiMA5mHw1KtsTRUlNKPQ8Sa1wM6oGUIuxRYQvGXpf95rW4AB6pBX4
	u9ZMv4pjg9QcLS0M8d1cQ00sCQwbQqE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-gkejzoN8MtqPEQNdTU6R3w-1; Wed, 08 Jan 2025 04:17:34 -0500
X-MC-Unique: gkejzoN8MtqPEQNdTU6R3w-1
X-Mimecast-MFC-AGG-ID: gkejzoN8MtqPEQNdTU6R3w
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so38278886a91.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Jan 2025 01:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327853; x=1736932653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNZS5mFbp5S3CClb5D4PG6lED+njEgaDVZSNHelIDGg=;
        b=GTvBfWFOEJx2fnMz0o2P6iPmhxsyyHfid/l5hbPjI7j06j1Os3BP1GDhBtYhi1ytf/
         XxvpnN96dZnbD46fWVj9rVoGLN8fmxsJX0Tka4lNReGSBGCKKOFhOKQRFc9c733sQZgg
         iW8ckiLRrgJ9+RxD1Bla8o6s/fc7Zmo6GJAIKvIFyPsbguKwztBxCKgtywzqcLiBA5oK
         8Wn1IwBRLKQYJg+BhTUp78kXIj0sR/lN5Fd6MydziCqkU/YTisvt5NZzhgYk/OB3vJld
         J8qj9LWDQi25f5PxxZXxFg+Q2SXBxCyNiTB2O0j0x+u5mC/cD3GZqxN072LTENzi7Vy4
         JPzQ==
X-Gm-Message-State: AOJu0YwPPKFW7ovc7IYrh695zgibEss2YiIaHlHQWFCe+hoZDFyTvxw7
	JhjD+rhH+7eFNdYbZx8DN2+OqI1ljLhuAUKiAEOdUw2ZAizozLGTz0jojoZJXnpSjVP8cI2ve4W
	xziM5tPhunDKBSWM6b5IJLdaaFrcFtZJJTGAB3niu+kitq96gnQnpQgonAKHrYBsW0ybSdBR0CQ
	h3tbUVmN6vUK5jZ8KxHmZSU2L6ZUdDgPqEch8MlQ==
X-Gm-Gg: ASbGncv+LKonQlbIeIWPXLsDEnJA6h3NXV4EXH45eHHJJSEtLk/hpbPdQV/bCMm8E7N
	W9nSHMMGWLyMDLgFJ+NmolW9p/ibgfwweFZ4wGnKZYl+Yil4t1YfCTjGjFK2o1WRkt8cwxZzl
X-Received: by 2002:a17:90b:3d09:b0:2ee:cddd:2454 with SMTP id 98e67ed59e1d1-2f548f39a8amr3341733a91.15.1736327853351;
        Wed, 08 Jan 2025 01:17:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4yAnMZeu1NCYWY4oRZL4Lrt+XnBiCPRNJi6h1dEMjLWxakx20Sa4Kv1xfAYZiZTMH1sP+wa3wZD1yX5UrKSc=
X-Received: by 2002:a17:90b:3d09:b0:2ee:cddd:2454 with SMTP id
 98e67ed59e1d1-2f548f39a8amr3341707a91.15.1736327853037; Wed, 08 Jan 2025
 01:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z34YDLM4zmg4cMpU@rli9-mobl>
In-Reply-To: <Z34YDLM4zmg4cMpU@rli9-mobl>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Wed, 8 Jan 2025 10:17:22 +0100
X-Gm-Features: AbW1kvas3iAq-2aoTp1bi2dPKjXN8q_4SX83etecqmE5TIqBwsYRmCGRJ9zsVEY
Message-ID: <CAOc5a3PbjRPHjT06D_Ssf_V7VvA4UWE_tP63jLG83VT6xWn77A@mail.gmail.com>
Subject: Re: [staging:staging-linus 11/11] (.text+0x4e8): multiple definition
 of `mite_dma_disarm'; drivers/comedi/drivers/mite.o:(.text+0x1c4): first
 defined here
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UnDZEbl8PAdl8Z5au90B92d2oB8HoEYWj4rNk2cYaJM_1736327853
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, hi Dave,

I have seen this kernel test robot report
(https://lore.kernel.org/all/Z34YDLM4zmg4cMpU@rli9-mobl/), as well as
the second report (see
https://lore.kernel.org/all/202501081213.5vHUhT8P-lkp@intel.com/).

I looked at the code and I am certain that the commit I submitted is
not the actual root cause. The change I made has enabled the driver to
be properly included in the build and hence, this is the first time
the driver is actually properly compiled, showing these linker errors
and warnings.

I assume Dave Penkler is going to fix these issues as he submitted the
driver and knows best how to address the issues before the next merge
window opens. If you think I should take care, I would probably just
submit a patch to mark this driver as broken.

In my humble opinion, reverting the patch I submitted is not a good
idea, but the forward path here is fixing the build issues or marking
it as broken, and with that, have it parked in a state where it is
clear that it is currently not being built and cannot be used.


Best regards,

Lukas


Lukas


On Wed, Jan 8, 2025 at 7:17=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.gi=
t staging-linus
> head:   84b172cea4a23016dc80a44eaa7ff8b7c97b04b3
> commit: 84b172cea4a23016dc80a44eaa7ff8b7c97b04b3 [11/11] staging: gpib: r=
efer to correct config symbol in tnt4882 Makefile
> :::::: branch date: 14 hours ago
> :::::: commit date: 14 hours ago
> config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/2025=
0108/202501081239.BAPhfAHJ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250108/202501081239.BAPhfAHJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202501081239.BAPhfAHJ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    hppa-linux-ld: drivers/staging/gpib/tnt4882/mite.o: in function `mite_=
dma_disarm':
> >> (.text+0x4e8): multiple definition of `mite_dma_disarm'; drivers/comed=
i/drivers/mite.o:(.text+0x1c4): first defined here
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

