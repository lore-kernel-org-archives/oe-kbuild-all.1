Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD2F224CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726207790; cv=none; b=JW+TyrxcR1w8TSligHxPwQrg7LENSSWb/Bjp8ZMjXZv3KHMV3y6+ZAqeoopVf9CfrVAniFb24qK/xRKI1iSr0UWfrZdebuw55hbYF7Y+QbQq2FnZ7KkEFWdWPVC8lZAtzWr6syaza4C6g2jzIjGYMJL9rjabuCL+N7rm/yUz2AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726207790; c=relaxed/simple;
	bh=D3mjYOPYg9G6FvfqNH1yKiq1tXB3MotNloTN2WqXmkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JfgFKg9so08fKBkCJ4D7QSdBPO5aLZYVeXzbumwgFiwiTtt886mA4rjWn4ilZNxNMs/YZHPK0aP0WKp71afz5FUiYQpI9bOtWiT7paqbx51GEChlFOGT1FfZ112EYdYxl7fS4D/jowqEpHgs6S/nPTvP7jvN4Mq/r2jyAq4kTL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ti6wbHOu; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ti6wbHOu"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4582fa01090so155951cf.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726207788; x=1726812588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXLI/ffPv38/BhXuNSfoBEpFgaOlU7G5XQ83n1RAdl4=;
        b=Ti6wbHOu9hh6ell8SeiJ26jxtpjm/NzZoscf3ECoaB4a2SDU6wg8qNLR0djvR0Kmbx
         RbVI98K4FdbRH9F+rTGACmjd/y2ZeCAfUg3ShJ6orPFvE3FOMopqVKzQRX1krYOVDV1y
         G487h9IZL+ai74d57/RJzNs+VffEnW6Hoqv1c5cCaObhQAgDceirg55uO4zxY2oipCa7
         xD8M3OTmDnCSuHlKKlilkuMucx3rMpw43zqg8CV8tNXrTSk/v2dLf3jpCiHbzFJ3/yJa
         quftOBe3ZWoEyrCXFAYTBoyI+YjpTkcb4U9xnsLycUpWTOMZ8mwMDDGA0ZFBZj5hAq0j
         w4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726207788; x=1726812588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXLI/ffPv38/BhXuNSfoBEpFgaOlU7G5XQ83n1RAdl4=;
        b=f+XYZhSNJLW3foqSr4sm2PA7ZFzsX0Lt1Emp2WSIAsZZtXvaa+Ld7naXoqzci8KwXo
         nzrlCaiwyEEUHEVwaM5iA0x/iuGPXlWDYZA2H8Mo8rpVRdb6d2VQtQF/eCgG3G4vppoP
         yUd1FeqXaDkTgu9GUJrIuZCidrt+OBT7oy7SOW6TU/FyN7JeM/1Rg8s19rRprZKlXXqw
         iBiCTFXL1NrGQ7kBdjXkKVOIS2qaKU/sA/lFzxz/iRAVE/4UUiXZnnVo5ycbjisE7hQG
         1yh5Y8c/8be2+9/N/v90LKMeWil8GoEAnfL+UFsWAtyIgiDs/O3D5ONXZXcuThYUxugn
         pkiA==
X-Gm-Message-State: AOJu0Yzev7IJdkJuTtcE3xZffcqSr++C0ejjVTNN30H2vNhuep2RO7DN
	j6wYp6HdmbmoNOXbIuVuNaPnxlaQSD0OwMpXRynXwllyA5Zlz4YjOBIiC/MMkyoD8N8MYBGwbUf
	t8bFUTIojonNFngJ6DLO9GIomkFU4OhvM0YkXYSIwcaf4hvE+mYJ5dQTqIg==
X-Google-Smtp-Source: AGHT+IFCsoVOIJ6stEGzrVnnDVsrD3E0P5mJLf5/hAAPw02kwEdOeRO+bQj3aEC7cRipyYg6K1scKyrHJsNsqcRWo5Y=
X-Received: by 2002:ac8:5782:0:b0:453:58b6:e022 with SMTP id
 d75a77b69052e-458608844demr7257971cf.28.1726207787113; Thu, 12 Sep 2024
 23:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409131239.ysHQh4Tv-lkp@intel.com>
In-Reply-To: <202409131239.ysHQh4Tv-lkp@intel.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Sep 2024 23:09:33 -0700
Message-ID: <CAHS8izPhp2PRJKpa75tai5JqpEx82vgk-kTbnaLMO7eEKFB=xg@mail.gmail.com>
Subject: Re: [wpan-next:staging 20/43] undefined reference to `__tracepoint_page_pool_state_hold'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 9:48=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next.gi=
t staging
> head:   3cfb5aa10cb78571e214e48a3a6e42c11d5288a1
> commit: 0f921404689398943257793f7240db239a23b609 [20/43] memory-provider:=
 dmabuf devmem memory provider
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/2024091=
3/202409131239.ysHQh4Tv-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240913/202409131239.ysHQh4Tv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409131239.ysHQh4Tv-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: vmlinux.o: in function `mp_dmabuf_devmem_alloc_netmems':
> >> (.text+0xc37286): undefined reference to `__tracepoint_page_pool_state=
_hold'
> >> ld: (.text+0xc3729a): undefined reference to `__SCT__tp_func_page_pool=
_state_hold'
> >> ld: vmlinux.o:(__jump_table+0x10c48): undefined reference to `__tracep=
oint_page_pool_state_hold'
> >> ld: vmlinux.o:(.static_call_sites+0xb824): undefined reference to `__S=
CK__tp_func_page_pool_state_hold'
>

I'm able to reproduce this, and it is fixed by:
https://lore.kernel.org/netdev/20240913060746.2574191-1-almasrymina@google.=
com/

--=20
Thanks,
Mina
