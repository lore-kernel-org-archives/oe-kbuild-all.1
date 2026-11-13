Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557484;
	b=1kOI8DyhQoXV0FMXExfmf0iE45p73TZJjzmoi+PV46CGuBcun9b+54UIKzLawe8qWNq3
	 EIQKmibQo0Qo8u2DYM835YmJPe7qWyEszvsb+xWSSU746LRmzAmSFV712Cquyz6M0oxRE
	 DrXiAgGA0RTDDRsN1UyduR52404aEZGc4tiQ6uxY8eRb/3CCL0lYRANhBnCy+e885GYrW
	 EQEDrdE0CuahuRi4KB7xnV+JFDQ6hj+DqQmqa1cyyVEhKAV+lhTMrY+j0DAjnUm4Kau9A
	 tiPc7784nVywu09GXegQFIQTkcr7W1GyGaK+34dZ7KGART+XuH6weF8+ccCdMmDtTyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
	b=fijG5qtUaU0P1dtHkMvNnyMh87iDHtsXDDC5ctQWDRz+AhNRfdZq6ZYRtYNwH6r6hCkf
	 YFqzmqfIkA5FEK3qoP9h2uhFITgjvhNdPzZswsPnPCXyntWpEoR2+yF463MOEAUOdx6qw
	 ftpb1hZPbckrk82pRrg+6ZcZVZuv957epfqFp8tfRLedUDH7fjIKDtpqsoIm4/pi6KYcx
	 NT17nke291DipqQQl0GgYHGQtynal2VCkqvHunAaSpL+8JC97xKCTEQT9PeDiMDJI+Vzk
	 wqMBCFsWCxgwKH8lfUYcpTG1wEYtdODTtkFA38boT/y+s8Fcqfv7Qhck273wnNnUU5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=J2FIxeiQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC0606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 08:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAC0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=J2FIxeiQ
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50737c64c8so11002066b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 00:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557482; cv=none;
        d=google.com; s=arc-20260327;
        b=dq0Or/rNCgoRqH9HI/7AjyUhQjmOAn7D3a0Ici6S02Kxrj2vyzt+E75O/kBbSoqXuF
         iLMxww2lXyi+dcUOqnciRgb6uNy8UuKcTttMX8BETaJZH7w/807vHVZ6YzLMFbewGm/2
         kwcAj/i7OMohKwI9suBHbuePjSzRGuFyYalaBjOk6C/totKJ5m+wfIrdJjC4bYQIJTOQ
         ZM9reN+G+BWEERcEhScoHF2GqKkznr7JKij0f4Owig6oSs6rUTCiNz3eIHCZZOlJUPKE
         FXrLl0flR8tSlZlNDR+hYAsjpJuLtSpLhV/8Ga3D3bZjapjcMTv78Jz9CJOj5W69OmQz
         jeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        fh=2eaYTsZ8lUGMLdUFBVzmL4PqdGOsnyJnVSM6/XdFyAI=;
        b=MFPfzkYUvxEbAe+TmBlPlakdw+CvJ+cfbHur0R3Hxcxr8FugmTpmXavIBZjmSQDwwS
         lnDveuDdQcGHd3fgQ6EoCk6Pajj/XHIqm/+i3OiGmzP02SpujgAltBpR9DZ0PyjilFeN
         9IR+B+Og/rj21kwB0bQ2X/Vbrj0gG/AzSBID2agUOc9oXL3d1otfdV7owswefponSuUg
         hjhdPMwCCdCxIfT6JBIIvesVN57y6CduV7dWAt227nwBLQAJzwi30qgeYWjdYrsBC0Ad
         r7dP2Wi2xU2rPk3hqpRF2PRoz0MH89OgdZ25AFtcr0Zs6X0Ap9Xd6Spb1RQB6U1CqwZi
         lygA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794557482; x=1795162282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=J2FIxeiQOVoY1mUnkbQsJzd5VX+sWHHTlUL/HtH+fwxDOW+MXpZCP3aNjrJdq2zQGM
         E999O08vhoaWHk/e0uEwXJc8MscNWi3zca19F7L8FwgtPRHX3CX/3FZXLepQM/sVU39u
         a1eI3mK4gVEwscEJloxh83YeCgSRwPNeqUTgkkMV+2g16dg7Gg0s4YBdq55O9wdrlLKj
         Y2xOIavYfHLIh+jYhBKx4b0XaRVBhHFNCLue+uXJV8eoGTZoIkV9qoa7B9KKIW+RNgtA
         ZBTs1u7eiEC1SZ0RAr6AVGAJGne7A+7rgW1Uvy9GbAghdlWBxyGhlTUn8IrMMJTL+JIe
         nvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557482; x=1795162282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=iqtCtlPMzm0ccRziBu2hifR9v7+CrkwkrmrneCE7fhBxfqjr4hBlQPEC3B4OxDoJWS
         f3zpdG7F2EP89mojmW2plIQs30EC8npY0vgv4HJTxeCLOCRJAwhwJE+DSD9YJGGjGt5q
         7rl2j46PtZcJ0D3PhhkToBpwXNU/YJ8GN/KOdSRW6sHynBKlH/4x5kAHq0ko4+Y4AsOc
         LspzWBw/5DA4rTkZOOgn33ekANJ93ZaoISRWkx8K854HjLAlDAqElwuFTWco6+OhHeUI
         kqqks3ZGsx2IXALEDuZNQI7FfUqeh9w52ZlT8V+h/0pg4mXSGd0hhnMBu+kd+u9Coksx
         J9ZA==
X-Forwarded-Encrypted: i=1; AL+hErG8llLLj3GTD1YE/cbbUuUpxMXR5AcFYHglPX+c3WRT/PYUfNsLMUOH4IEzuFG7l+gssSJ7kJuMTaTH6keC@lists.linux.dev
X-Gm-Message-State: APuU4Z95to3iTHdP1/vHR7fdw2aRc8+U6RN2NXrh/Wh1JKKPoVPe0n24
	rrI/3reVe8Oy+F+9oebyKSrfXeg6o+8XHofRgKsowvmFbe41rqG5PR7lO/kZUX9f4NDr+nYeTt8
	xvB+G8gLnzXIMw60W7aG4WQD+5k9UX7oanIKBDgxRqA==
X-Gm-Gg: AYBFou0e0RR8FynHHfXbaub2fAGXZ3PurhUM/x9LdTB90B+C2u/h8CVwY04xo2DHuoE
	cLJe5Xw2vfZMzZCnvhgRZ8hV+uImz2qmdJY81osqCfYveRhHEzOmNvc4Rc2FDAOYB4DeoB/Hkgp
	5MeIFk1+YnaXeFqa+G+wNmGT32zVDmljHzk5uN1IfFSL2Dy9i0e+NguAmWhA/mZdXIkoZfqT/hu
	wDcT/RjK2YpWu4s4Fwxudw2VjC5zJCxP/tkhoYffoVIq3bV3mMdn8sDuLQYyWrkiw9kid2OrMFG
	BKqpLnEKrk6ss2s838Q/DCRRfC+AaD8JJeHdAcRfzwcp+G7o13UCdGOzfHwJIqVqV4YIEgqWa/a
	4mNkAj76fgqDFy5Okv69X+GlUkHWH8d7Wv8l5TTTCmlG7yyCmTcg5mA9eGySylpKjMqs66g==
X-Received: by 2002:a17:906:f183:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c509642ceeamr126451666b.4.1794557481497; Fri, 13 Nov 2026
 00:11:21 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112134700.372702-2-jinpu.wang@cloud.ionos.com> <202611130354.oOiDWpa1-lkp@intel.com>
In-Reply-To: <202611130354.oOiDWpa1-lkp@intel.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 13 Nov 2026 09:11:10 +0100
X-Gm-Features: AclHuK_ijeVtZl53-Nr24xIboJn-g0mWRkSzGcLkYkpL9J_f9DfqfuDTwKSOTUg
Message-ID: <CAMGffE=bCVxcuDzUdGk=btfu-bdHhwofHQ6qkgx7UmQTpvSyhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] block: suspend bio based disks around queue limits updates
To: kernel test robot <lkp@intel.com>, sashiko-reviews@lists.linux.dev
Cc: Yu Kuai <yukuai@fygo.io>, Song Liu <song@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all

I will fix the __releases(&disk->queue->limits_lock) annotation in
next version, will wait a bit if any other comments.

Thanks!


On Thu, Nov 12, 2026 at 8:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jack,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Wang/block-su=
spend-bio-based-disks-around-queue-limits-updates/20261112-144659
> base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> patch link:    https://lore.kernel.org/r/20261112134700.372702-2-jinpu.wa=
ng%40cloud.ionos.com
> patch subject: [PATCH v4 1/2] block: suspend bio based disks around queue=
 limits updates
> config: arm-randconfig-1002-20261112 (https://download.01.org/0day-ci/arc=
hive/20261113/202611130354.oOiDWpa1-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
b1fed44d3dcca649a9877915d57c3357a98124e)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261113/202611130354.oOiDWpa1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611130354.oOiDWpa1-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from block/blk-map.c:12:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
>    2 warnings generated.
> --
>    In file included from block/blk-sysfs.c:14:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
> >> block/blk-sysfs.c:909:3: warning: mutex '(kobj - #undefined)->queue->l=
imits_lock' is not held on every path through here [-Wthread-safety-analysi=
s]
>      909 |                 blk_disk_resume(disk);
>          |                 ^
>    block/blk-sysfs.c:897:9: note: mutex acquired here
>      897 |                 lim =3D queue_limits_start_update(q);
>          |                       ^
>    3 warnings generated.
>
>
> vim +680 block/blk.h
>
>    675
>    676  static inline int blk_disk_commit_limits(struct gendisk *disk,
>    677                                           struct queue_limits *lim=
)
>    678  {
>    679          if (disk->fops->suspend)
>  > 680                  return queue_limits_commit_update(disk->queue, li=
m);
>    681          return queue_limits_commit_update_frozen(disk->queue, lim=
);
>    682  }
>    683
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
