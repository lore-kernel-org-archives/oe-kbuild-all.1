Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E5320396
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520056; cv=none; b=rouWwjJeEsoH6ySMDZBfy6efKGWxXhhwEEoYuLZyKT9xD4Js1biY7vtCi7JwcLM7MLYPB9D9KYFovF9hSXcORtxIk/9P2XWobavzM02Z+xTTCC6CssyroYH2E8PNeUC7CzH34h06LeTmrJTeOiIVFPeLs4v7g/6z6025QaE1vaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520056; c=relaxed/simple;
	bh=m7SIqKydxnTIbpy9FFDLAnaR3/ZeDTiM3ujLW7g9YTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdUBoRypCbiabYH9mU+fUBzDDP/tpXIn8fF/vC+kuvY6x7dImoiqEumenPAbrzVl2dXMtFcY44XQxxLc9rFpIt0Bg/fnyrZuLg5f4Z8T28faTteHbG1BggW8cVZMT/WBYRY1TjcX7nZZ/RYuJo4ZFRqvWDHXVehR3gh8H8GEQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=De1O0nfy; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="De1O0nfy"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e94cfaa274fso742451276.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755520053; x=1756124853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgCsV8AiRnmTJZZ3lbAOsw5kSBDJj5OV7xzAVtn6XEE=;
        b=De1O0nfytvlCungeKPCbMdsw4GXWXuaY+wJgq918T5X+aC1KnC3xDC3OGjZqcoFEit
         fVidRRKQuJ9KQaEeG9A+m3tTp5Luyx9gS8nf3FJuUKaTGMG+0fjYowiY9XG5HoQgwOwU
         GPQQCZv2oHXVXMCbtE0BMBW510Oev4M83KJkzQOKztQNiWG4oPQpQOorjTjSknnVIACJ
         ECr/mGX1MWsVT2FOsPTVdMM+ckuRPdX4lv/LtqpK2+Li3J/+qW2NogHY3xT14MaFm9iB
         ZjpoSWeGxy8FHBLaZEZT5XkpBeZr9+UQFH/5Gk33ZzlbrN7e44s6b5ZFJo0BtCvrJX3f
         MOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520053; x=1756124853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgCsV8AiRnmTJZZ3lbAOsw5kSBDJj5OV7xzAVtn6XEE=;
        b=byAhuEQNi+W5c6F7UMKmTIRZFB7qrh15T8+s60f+xWBbcGiGTcmPc/NcNNEgjlcQVC
         ZYZVpA/b5D6yGvEP82uYvesjOC+VeDfh928ccGy0UNFDCmb7GC03r4X762PsWc/SPhvC
         xkPVT0bIOjBCdr0R/FBokT+k1Z1kvG2wOEeL9IrQBmUTMx5mmNCkcLy4gZcWIr57LfjM
         sEDMJVxFZrAs+1VGViT0BO/xm1Aglod+HGIsodPlsXQIVaiNNLl/kpoOK52ooxmK5m7w
         sas2POM/6cYMQvVneciBqAi1l6FmI5UMFrN0UodFd/9TxhSz0nhcPHxeySib/KRXrMpM
         n5Og==
X-Forwarded-Encrypted: i=1; AJvYcCWmXXvfxv0W3cd4sjnSXkcf92qsUy6hjuOwgG+0RgnFaoWz0uvLcpHqBxzJHZyi8lb3xICZSYZ2rOwxKWlI@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5P8E/eROnJWmvEGe71YbROPje03L9iAb4IoHjQX7HKAvw52dJ
	gqZnA4tBtG3eqkHrOVzotD6A4/jzJPjr16+KhsH2Kqg+B8S2WgoxKegbvxYlmhOk+N98vh0yWb8
	oT/yd6HgeffRRUNDPwVY/yRkxk6zHVDkpG1K9PFJnng==
X-Gm-Gg: ASbGncsz1zJHS/wySlMgyXQe7J1aPw9Ic/3U6fwuA3aeMnAf09Y+9RYDeS3Cmt4i9RJ
	ZdPzZFPHMiKMHyrf4RaqH/1qgueRaefcCyNaE4J1AX9FC+njRBwR0+Vrrynqgeikwn5s+o5AHRo
	u8LmbKFIOy2M3pmGFLDkMSRMmB6o20OLfSLi9CBII3iIDeH20AJt0QVOFdCO7eI6U01S9dP/0gs
	BPc2SQ7CSFS0TL9
X-Google-Smtp-Source: AGHT+IGCtbq8dlv5BhifYFkVWdTwGtpLB8eowifqW63WzaF5/IhaKxhO1X64809zHqLAyXxFQFUUSP32SfpMEfRRzUc=
X-Received: by 2002:a05:6902:1504:b0:e93:47d9:1c53 with SMTP id
 3f1490d57ef6-e9347d91fb8mr7212638276.6.1755520052617; Mon, 18 Aug 2025
 05:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-working_dma_0701_v2-v4-4-62145ab6ea30@riscstar.com> <202508181040.az8RxLrG-lkp@intel.com>
In-Reply-To: <202508181040.az8RxLrG-lkp@intel.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 18 Aug 2025 20:27:21 +0800
X-Gm-Features: Ac12FXyzzS7pnhFgkGl7FiEJKtmHr8DR-5NfS3QvImTcTotkj7TrVuAH6gqFsEk
Message-ID: <CAH1PCMZL-AGJE6PXrpyShYEMFkvoi-Ajzd_Az0ma75QWZFaROQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for
 controller abstraction
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Dan

On Mon, Aug 18, 2025 at 3:17=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi Guodong,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guodong-Xu/dt-bind=
ings-dma-Add-SpacemiT-K1-PDMA-controller/20250815-132049
> base:   062b3e4a1f880f104a8d4b90b767788786aa7b78
> patch link:    https://lore.kernel.org/r/20250815-working_dma_0701_v2-v4-=
4-62145ab6ea30%40riscstar.com
> patch subject: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structu=
re for controller abstraction
> config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/=
archive/20250818/202508181040.az8RxLrG-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 8.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508181040.az8RxLrG-lkp@intel.com/
>
> smatch warnings:
> drivers/dma/mmp_pdma.c:546 mmp_pdma_prep_memcpy() warn: variable derefere=
nced before check 'dchan' (see line 542)
> drivers/dma/mmp_pdma.c:712 mmp_pdma_prep_dma_cyclic() warn: variable dere=
ferenced before check 'dchan' (see line 708)
>
> vim +/dchan +546 drivers/dma/mmp_pdma.c
>
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  536  static struct dma_async_=
tx_descriptor *
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  537  mmp_pdma_prep_memcpy(str=
uct dma_chan *dchan,
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  538                      dma_=
addr_t dma_dst, dma_addr_t dma_src,
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  539                      size=
_t len, unsigned long flags)
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  540  {
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  541         struct mmp_pdma_c=
han *chan;
> 918da7ee50b22b Guodong Xu       2025-08-15 @542         struct mmp_pdma_d=
evice *pdev =3D to_mmp_pdma_dev(dchan->device);
>                                                                          =
                              ^^^^^^^^^^^^^
> The patch adds a new dereference
>
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  543         struct mmp_pdma_d=
esc_sw *first =3D NULL, *prev =3D NULL, *new;
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  544         size_t copy =3D 0=
;
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  545
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03 @546         if (!dchan)
>                                                             ^^^^^^
> But the old existing code assumed dchan could be NULL
>

Thank you for the report and findings.
This and the next one, they are bugs, and I will
fix them in the next version.

BR,
Guodong

> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  547                 return NU=
LL;
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  548
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  549         if (!len)
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  550                 return NU=
LL;
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  551
> c8acd6aa6bed3c Zhangfei Gao     2012-09-03  552         chan =3D to_mmp_p=
dma_chan(dchan);
>
> [ snip ]
>
> 2b7f65b11d87f9 Joe Perches      2013-11-17  701  static struct dma_async_=
tx_descriptor *
> 2b7f65b11d87f9 Joe Perches      2013-11-17  702  mmp_pdma_prep_dma_cyclic=
(struct dma_chan *dchan,
> 2b7f65b11d87f9 Joe Perches      2013-11-17  703                          =
dma_addr_t buf_addr, size_t len, size_t period_len,
> 2b7f65b11d87f9 Joe Perches      2013-11-17  704                          =
enum dma_transfer_direction direction,
> 31c1e5a1350ae8 Laurent Pinchart 2014-08-01  705                          =
unsigned long flags)
> 50440d74aae318 Daniel Mack      2013-08-21  706  {
> 50440d74aae318 Daniel Mack      2013-08-21  707         struct mmp_pdma_c=
han *chan;
> 918da7ee50b22b Guodong Xu       2025-08-15 @708         struct mmp_pdma_d=
evice *pdev =3D to_mmp_pdma_dev(dchan->device);
>                                                                          =
                              ^^^^^^^^^^^^^
>
>
> 50440d74aae318 Daniel Mack      2013-08-21  709         struct mmp_pdma_d=
esc_sw *first =3D NULL, *prev =3D NULL, *new;
> 50440d74aae318 Daniel Mack      2013-08-21  710         dma_addr_t dma_sr=
c, dma_dst;
> 50440d74aae318 Daniel Mack      2013-08-21  711
> 50440d74aae318 Daniel Mack      2013-08-21 @712         if (!dchan || !le=
n || !period_len)
>                                                             ^^^^^^
> Same.
>
>
> 50440d74aae318 Daniel Mack      2013-08-21  713                 return NU=
LL;
> 50440d74aae318 Daniel Mack      2013-08-21  714
> 50440d74aae318 Daniel Mack      2013-08-21  715         /* the buffer len=
gth must be a multiple of period_len */
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
