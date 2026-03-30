Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3F3C062D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869362; cv=none; b=MDstgP1qRjIzPXihmVfsj0wcIAff6QlbMoqs5SH95FSHsOVUwU501i1WwY7I948+nkcQKkzSV0sIPwKLAE+i9E+1jz5IW56ELnlzXvDEPRJA/AM0HQT2LZ6IUSO5rg7Mmu2i0UF491DEIzCv9HdKbuDBPVQ7frzjyynxrXaGGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869362; c=relaxed/simple;
	bh=QZdCBbLrSupxH3yQW3rELbqJcCJ9U5qbiSbJhPIBhC4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HgENu9Qs5x0LpGJwiiaPZrbxYVpXv853PohCqs3VAzceaEd1MISk69yRLP+qoBs0ijO2pHQAFn/uU3MAnLkT8G4t4m5NWoXQs5eJIcxpd/pVTunemqMPny2T0/IMjpmX2YKGlgxsXnQhrruREc7kMDbicRFfHajpE4n4boPv+W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkO/fL0L; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkO/fL0L"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso17747525ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774869358; x=1775474158; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwbMmOxnhNPJFKX0tFv66f1BEnM4IowI567cylvFxpY=;
        b=gkO/fL0LsOIbbsILU8yKkTVYvAgucWSOPKQtOrw7aG9mKyWq5JagXUgKFdZmJLL9JD
         xv01llFXIZ/htJ1EtVoYLv5xQoUuHedMuG0K0XjPe0eGbmSifeH/7QTWXaipPwlnoVdT
         smmjNgaZBND5F3PM8jDaamcXLPfZesRXqV16XG8P/xqxCmyiLG5H2r5ss+Od4yuPjfgm
         ksXYP9g3678b+Uy1a+L4ki2r8vVKOrNeQLYWF0GBrwqV5GCRh0AiKVz5YKGVzUJXCZv7
         NNHITNqkCj86XH1YXbeQHTphMNDRtVnlWvUEcySt6NAJtUCUTfyrO4JoyH9TLvCcY2KH
         KK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869358; x=1775474158;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwbMmOxnhNPJFKX0tFv66f1BEnM4IowI567cylvFxpY=;
        b=EkqDvCMFo48SdiMG/LRJMUaT891Yc37w7jSNMzm6Qr6fMnsHtx00Wm4m739SIeNBuy
         mevZ70QoJwJvFX3GK4Z/uu73CAHGBORLzl/ZEMdhD/Yv4r9XfQqcXg+C1xpDT/W10gwZ
         PbLLxTQt6610fbYfUlR+jEFS4LkI3REQ74tu8QSzZNLtTuExOGRpugbZFDxdViTNuQPd
         bjVcLeshwFyIAzYXbkKON4zTdun9WUELzt4ljwqoGVn01EjdB5mDz3j02S9gs3OAd3sa
         /eRW60T0nZyUDWS7Y2fe2kjVoQKfwvNZSAYGAtl6/Dpt2d2wQFYlR7xmEvH8EtdmBjpY
         K7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSPvFoHmXa+Deip1UIQP8bnqjrHdTupKSv6KRfF/ggJRVwCX9Zu7LJXq1IPqEKWk7IonWlUO1ZB0Ka8scw@lists.linux.dev
X-Gm-Message-State: AOJu0YxdnTwoiBoPg/4m3Bq+P/quP2oC3r0Ksh83s0ZRe3BqUjSWUU3E
	qxO6zVRKEYT9KqyLNkfuzB3FawIOxFPMgjXEJlySUjJu1itZeTRGKPJe
X-Gm-Gg: ATEYQzweaV/FndNFMotcglJ+jhqcpJB3kqAXctNkmqowFMchsoJINoA+5fwflsgC6P8
	2iIHAMYML5McUk26dph7MTrkc4HYby9AHU3e487NyLIJl+vGnzyf819Bxt3+4QWS1roRzXNZb12
	PdPcjzjt3LEgAwcW0gF9LB7KcESnKGf9SoB86pYFWa6fhgqv9vnRWrMopY2jFnIiqODCd2FL2gc
	xaq9xQxBqXhbQmRThfOWinqVdhk7hbWef9ogYL1P9qsmsDXgyV+eALrXrTGS4cFGRT9+l6sTysQ
	yX/+fvD4y6Wp0Dn/9H/qDWGseKm45/E2X5rdF3cPCgywPXxsLq1o9nl7XEKlPN4vfgJzZwLbkOB
	ge5CA5qzX8oENQtTgU544LYHBRMWadBS/dGiV4e0y2cd7V9H1SlFlB18EftQCMgFkxLfgT0sN7D
	+IwK9LR6K0S1NK6JQ=
X-Received: by 2002:a17:903:1392:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b0cdcdc34emr86397435ad.29.1774869358504;
        Mon, 30 Mar 2026 04:15:58 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642b59sm78870575ad.16.2026.03.30.04.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 20:15:55 +0900
Message-Id: <DHG2ODK6STM0.25M7U46EBUSZB@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <oe-kbuild-all@lists.linux.dev>, "John Hubbard" <jhubbard@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "kernel test robot" <lkp@intel.com>, "Gary Guo" <gary@garyguo.net>
References: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>
 <202603281331.1ESuqgfz-lkp@intel.com>
In-Reply-To: <202603281331.1ESuqgfz-lkp@intel.com>

On Sat Mar 28, 2026 at 2:53 PM JST, kernel test robot wrote:
> Hi Alexandre,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on dff8302ca1d0e773c90dbeeb05e759f995c95482]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/=
gpu-nova-core-gsp-fix-undefined-behavior-in-command-queue-code/20260327-003=
216
> base:   dff8302ca1d0e773c90dbeeb05e759f995c95482
> patch link:    https://lore.kernel.org/r/20260326-cmdq-ub-fix-v3-1-96af21=
48ca5c%40nvidia.com
> patch subject: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in =
command queue code
> config: x86_64-randconfig-102-20260327 (https://download.01.org/0day-ci/a=
rchive/20260328/202603281331.1ESuqgfz-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260328/202603281331.1ESuqgfz-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603281331.1ESuqgfz-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> ld.lld: error: undefined symbol: rust_build_error
>    >>> referenced by build_assert.rs:28 (rust/kernel/build_assert.rs:28)
>    >>>               vmlinux.o:(<nova_core::gsp::cmdq::DmaGspMem>::alloca=
te_command)

Been able to reproduce this, but only if I use the 0day compiler (i.e.
just taking the `.config` is not enough).

Bisected all the pointer projections, and the one that triggers this
failure is this line of `driver_write_area`:

    ptr::project!(mut data, [tx..rx - 1]),

... more precisely, the `rx - 1` bit (no problem if I just use `rx`).

This really shouldn't happen because the conditional block we are in has
already determined that `rx !=3D 0 ` and `tx > rx`, so the expression
should be perfectly safe.

I'll keep turning the knobs until I find something that works.
