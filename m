Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E033689B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 18:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782115; cv=pass; b=G27b88i5ewRHfx6Q6N4CBV0RWEKFaWLZv3ggzOftMt3ebm9dI2NXz2Isy751rQC+s87HI5XNBr/yZfyeJck82mHj9M7D+qKSX2yHTeeslF2Qq8lXCc0CKrJMfA9x3Cr3Cf9TOUl0ncO1kh3/Kh7BP3NLxWUB3aHYFWvgw2oe1wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782115; c=relaxed/simple;
	bh=LjE7qeMCgcDiHrTgkkXI+vUlESi4btRzeoBwJKeXI2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvlbZuGe8UmVLx8vws2KfgPIhkUhUM9RISpY6Wgos4p6eEpaECfz6Wt+Unc36chwiBPJM0onCXU3tFXW4rxWtPmtvsUUUlpc8XIv0ZrU7VLA/W4ga/fdIjIP8Cgl1pre65XD3OZoht2aupnpGtcfOOZJ/Yk/Ez/xyQym96oysWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EwUCqEUh; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EwUCqEUh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so6275774a91.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 11:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778782113; cv=none;
        d=google.com; s=arc-20240605;
        b=hkKP8dPehaFITklHcftsFn0VOpIArfbZ6nWvpG6JsaNlb4bsw0azXwXg1XPAkimoTJ
         M7H7yGDJpBgvnQsWJ5Z7h6j+okMnVLlnov1FedAldWYpgLXaxSaPOgk3peLG4ztREJNE
         FW5uqJXH5p8q9aGMOEXgmGXcZ3RPXgdvL+aA7lFPCct/I4O23tadYEaQIBjnApSwYpyY
         eae8OBRTT94qsOb0Thdo1vy8ziHgfU8ToybVEZgrLtD5lLzW3GX+3ZWhnn4kliSOKobK
         f3wVZJdhfOwTl575AMXA/BYZeor9M10du6eG+4Y2qMA3KPZxlcDB2yoZBBMpUXqZVoaK
         4Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ipAF57KDWUADxFOxvCNY81maaSBNvMS0BVaI1m1gIGI=;
        fh=HfQjCqYKq2EwQUVaa/YX4pGjxeHyzFryQ6Cb49UwMsU=;
        b=hPqfh5bBkhpVBZ8NcF20EXxQ2dpfcC/vAn+MnXvEZFQ0uosIF1CZ8V1Bwzb/eC2Qj5
         IlWJV9pnwwCQxXvNLPPYhIJ3wRHBCpuTmZ6LUUgtdtO+XfB9yyOIM86BUXed4umok6QI
         raOJiT5b3q1Zw5pkRzWPy55OxUy2y0X41udh7Rnd0wddzayKNOxR2S9F+2vRhLuW6lEm
         WLhkubFzzOzuIQAt9H0bSk9COUyvh4B7oeHclMiRZD1ZkYDhmLfQbtIBvBOA7F5Tq2kL
         7/I/xCh0QKR8iN7+xTlaLNP9QApWNwBCojEuFMk+A1mVOSz8YdzeGeu2hm9ajpJ47x0F
         vQCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778782113; x=1779386913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipAF57KDWUADxFOxvCNY81maaSBNvMS0BVaI1m1gIGI=;
        b=EwUCqEUhMrReNqr3sEApEXKlpESJInKvfAHj5XRGVW2zEkT9xnWhpMUSEoo470giCL
         7k16LYzq0HBRSgx/0YlxR8oRQqsHgSpNgfFAYbANZ4qdeKzOqIZI0DV23Q/W1IU6frhF
         E/u4S1cwDA/c5JKCLHPv2GrAWf/YdLAtvPcktslledUK7VFvG3UgqYNNytOTSLzKOgAq
         jKGkGtrtJnK3e/iI6mjzY5I6ydEKioP8RsrWhwc4OvX0mzucM9Z4CUZbJwBH+TQWnkmt
         x1i74oANKrBrId2UoCVL+f4FKLvcJNldSp48OIbulK8w4UEMwz3gnc9oA7DT+zb3q5CR
         2Tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778782113; x=1779386913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ipAF57KDWUADxFOxvCNY81maaSBNvMS0BVaI1m1gIGI=;
        b=ssuTIlDa/ymUU2FTm5N6DKmt0u/Jh0eXtECcyh1ksghBRQr4Nb8RArpmqyhPJ3GFlM
         y8J6SN0+Rd0OXdYjGAPnkipk1bUeuf5vo3ZkhfXKjh/2ExxeubAeYaOOg4prHgFTWnr5
         K6iDnF9iqGjchDNJRPvHp0oFlAkDMvnE9klWIFp9YlX3lvdu56naFkjXWkFFBtWV1HLs
         lFEbrnlcxAzDIlddrMplMSwvcBvkrwOHo45WbqQ9njoLOEkSDNqjFhTahJyVumC2oaNx
         vxHDnwkCpPv8X2AqhxbqaYOwUNyjv0K2GkIVZKaEUkhj7jwruuGr0dt3VRnz76aKWuJI
         VpsQ==
X-Forwarded-Encrypted: i=1; AFNElJ85k5r19S39A8uWm/FJ3ItKGKZjiTstMSHxMNWGM83ROh+Ay3WxDTwEisqwlV/2Rv4+HEByljPYZ3duaBHy@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0bHgzv6sRrdH2wmpI/SpUiXMrFspDoP7i93Q7AYw4+YkZghQE
	s2aXgquZTfrENp9HHSghpwL/cQsDStBt0hBKH/szaBzckQKOYxpfZzLkilk9ykMyL/4xWVFnOgZ
	TU94gothqs+Dm4yxcTLoAI1BbGGvmufoFp+fV53D+
X-Gm-Gg: Acq92OFj7zPJbl0XIyvCZ8RUnpUGIjGn+sENwiBcQz8hS3dbOVyUGuiZ5RblvJDgnwx
	9wGuLaJGJXEX0rIWOXKLSYp3lDqlQZN2Juy674aw/r68h43tl1ViVzK1zsSXLPrkiCruHAYCAT0
	42VbkDarDWDiaxX+vU2/PPve0tvkR+SpQ6npy2do+QL/gyRLS5Xs1xOLcD4xUho39m6b3l5QC3E
	t70Sn+eKuUDwszC/++z+x2eYM5mrWAmcD7+8tQRMFvlKbFHKrtMYwN4DjULNtClACmYslultC6t
	WULVDz4=
X-Received: by 2002:a17:903:1b4f:b0:2b0:6f21:8289 with SMTP id
 d9443c01a7336-2bd7e8d0d1emr6010515ad.25.1778782113132; Thu, 14 May 2026
 11:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605141142.p1dckBny-lkp@intel.com>
In-Reply-To: <202605141142.p1dckBny-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 14 May 2026 14:08:21 -0400
X-Gm-Features: AVHnY4Lm7ep4zDxgkK3ePlP-DN88ZlXT8kLAVIjn0gozg6cNV8HA2oNyXQWVIGc
Message-ID: <CAHC9VhT8yseZf-gXoFUyweQEx83MdOkMzvBJhyojENMHv0Frjg@mail.gmail.com>
Subject: Re: [linuxsecuritymodule:next 7/11] security/hornet/hornet_lsm.c:78:33:
 warning: comparison of distinct pointer types ('const struct file_operations
 *' and 'void (*)(struct bpf_map *)')
To: kernel test robot <lkp@intel.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:34=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://github.com/LinuxSecurityModule/kernel next
> head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
> commit: c62310df81899f7e14d632271aba08d0a55e2318 [7/11] lsm: introduce th=
e Hornet LSM
> config: riscv-randconfig-r133-20260514 (https://download.01.org/0day-ci/a=
rchive/20260514/202605141142.p1dckBny-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5=
bac06718f502014fade905512f1d26d578a18f3)
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260514/202605141142.p1dckBny-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605141142.p1dckBny-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    security/hornet/hornet_lsm.c:78:37: error: use of undeclared identifie=
r 'bpf_map_fops'; did you mean 'bpf_map_put'?
>       78 |                 if (unlikely(fd_file(f)->f_op !=3D &bpf_map_fo=
ps))
>          |                                                   ^~~~~~~~~~~~
>          |                                                   bpf_map_put

This should be resolved by making hornet dependent on
CONFIG_BPF_SYSCALL, which should be addressed by the lsm/{dev,next}
branches as of a few hours ago.

--=20
paul-moore.com
