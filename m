Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26541742
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 16:49:05 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4935f2d6815so1875803e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695401344; x=1696006144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfhJ8cCD8LbiVlnmen43E6hAzTOc5umd4YIJIcbToqg=;
        b=nEJGP61togk89QDGEUpkEEeZtCEqsVulWmS0y8fQ6XTD+Z0itVmuHebGiX98Yhyoyr
         nIZT813sifhROmU1fgyl5XijMUSyyIW2U1NWWCAZlSqaD7vYHs9PTbs08fmkBSuSp0P4
         WT7aVsvceMXVLvIIuMyliaUWR00ki2NP6rKfgnEg/3aClotYQYoXu3MzFt95wkyitVBd
         sZDXBEG9agV1xmsR6+Wo2btyzHoD53a6dAF4pywxIXa1n7SSJP4jH7cauA/DdCkkqGBV
         0m2hR959+vcuO45xph4KFka8Bz9YGJLOh1/22slPux4glDvmHTMHvDJIXnOQwTazmtt5
         BmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695401344; x=1696006144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfhJ8cCD8LbiVlnmen43E6hAzTOc5umd4YIJIcbToqg=;
        b=il06fEuV1cZC62kCa2+8ur1Ht9aa9Au8AZ9wSZ6nLpZwTlKgFimo6CJKFdVHmRDNlm
         ZbQnmIJ6IhLN1EpDtpTxdT7kWjmRJby9i5Oj2VoZ9k2XfAWYYGgNmUQjaAlUeo6FjuYK
         IQrPgqh1jir2dWVPlL6+jXQVm7lgU7+qroN+G9uP5NIra2wSg8CQwDKElg6LDuGj0sY6
         34KTxnJPfac8OEoOjx7Bj1vyE+L/fxbwfpsHNnpYWd3w9apbj5+lmNxsNFxwDTuY38PC
         Tm5SBtePtWvj6hBO8ixk8uJ2Sl9NgxTelWce+Uc5bxQpT0KEXf1FNat9O2Xh2e2lJ2VJ
         i4aw==
X-Gm-Message-State: AOJu0Yx2l8FGOWVqhXR3DYWQtKtOb+YmMUTGWvIO6dlWvxaYKdNxbiI5
	lbrspQHSzBsQzWD5nHwjZhA8Ik0w03Y7xcFKVIFzjA==
X-Google-Smtp-Source: AGHT+IEeS0SBQ9GuZ6EG0hKT0SODWW/vXeCY+Skp94AbYpC4nC/UJMGEGFnylZa0tcMmEzMSzSbeULC3kwVOy3KmrMk=
X-Received: by 2002:ac5:c913:0:b0:495:c8bb:f0f8 with SMTP id
 t19-20020ac5c913000000b00495c8bbf0f8mr1715785vkl.3.1695401344498; Fri, 22 Sep
 2023 09:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309230010.Eio2q6e0-lkp@intel.com>
In-Reply-To: <202309230010.Eio2q6e0-lkp@intel.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Fri, 22 Sep 2023 09:48:53 -0700
Message-ID: <CAKH8qBvT2Rb2EHgpNfQa2LtngbH1zyZwyDAFrMPg8_d86eKUTw@mail.gmail.com>
Subject: Re: net/core/xdp.c:725:5: error: no previous declaration for 'bpf_xdp_metadata_rx_timestamp'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 9:12=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Stanislav,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
> commit: 3d76a4d3d4e591af3e789698affaad88a5a8e8ab bpf: XDP metadata RX kfu=
ncs
> date:   8 months ago
> config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/=
0day-ci/archive/20230923/202309230010.Eio2q6e0-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230923/202309230010.Eio2q6e0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309230010.Eio2q6e0-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> net/core/xdp.c:725:5: error: no previous declaration for 'bpf_xdp_meta=
data_rx_timestamp' [-Werror=3Dmissing-declarations]
>     int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *time=
stamp)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> net/core/xdp.c:737:5: error: no previous declaration for 'bpf_xdp_meta=
data_rx_hash' [-Werror=3Dmissing-declarations]
>     int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
>         ^~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors

I don't think I'm doing anything special for these kfuncs, so, in
theory, the rest of them should also have the same warning.
Should we add another __diag_ignore_all("-Wmissing-declarations", ...)
to kfuncs preamble?
I remember there was a discussion about introducing
BEGIN_KFUNC/END_KFUNC, but I don't think it went anywhere?


> vim +/bpf_xdp_metadata_rx_timestamp +725 net/core/xdp.c
>
>    713
>    714  __diag_push();
>    715  __diag_ignore_all("-Wmissing-prototypes",
>    716                    "Global functions as their definitions will be =
in vmlinux BTF");
>    717
>    718  /**
>    719   * bpf_xdp_metadata_rx_timestamp - Read XDP frame RX timestamp.
>    720   * @ctx: XDP context pointer.
>    721   * @timestamp: Return value pointer.
>    722   *
>    723   * Returns 0 on success or ``-errno`` on error.
>    724   */
>  > 725  int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *=
timestamp)
>    726  {
>    727          return -EOPNOTSUPP;
>    728  }
>    729
>    730  /**
>    731   * bpf_xdp_metadata_rx_hash - Read XDP frame RX hash.
>    732   * @ctx: XDP context pointer.
>    733   * @hash: Return value pointer.
>    734   *
>    735   * Returns 0 on success or ``-errno`` on error.
>    736   */
>  > 737  int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
>    738  {
>    739          return -EOPNOTSUPP;
>    740  }
>    741
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
