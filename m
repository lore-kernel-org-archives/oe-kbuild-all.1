Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793121426;
	b=Gd+ZzIaVA2hJsCjFinKeMUWXTZJfSvrjFMw6c+OYNit9XQFa1vdFRI2s16boyi5JvaT2
	 vhCp/iRy8gKYI33WPJ88BXngzrIhb/BxdBS69nBkVVRuJwEZIRANNJyBpkhEw8iZuIvCk
	 KNL/iCA6OBjVJBaXtGmP/XMQB950KpLDk8AdoFxF8Awd4ZMwF77NUU7IEg4hDAZc2ZYD0
	 9w11P3bP1B3s3eoSzqv9EKFzDJD8ca5vI3cXEVhR7Y8g0V59MSLOgpta+g04atAa2MFvK
	 eILpUk7bGoTqy96buH9xoGPDMm+YTuL2E4a9cr/l6GbwIQad7oYOCZpNikt013z6EEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iblJiMWnPdBHDjKTq/8J7cpk5hZRzHhNlWjpa0Z4c5s=;
	b=0o1U6x4+wsItsW1o9508Zb+0k6qdLyM+7UWYXkIj2xI+lt8HEtp2QnDHpMk5MlwOAwCh
	 A/IZDpGiwDZe8iukoqXpev8ZzUgygeBDP6h67tdXxTX+edWoQEKh1i79k3xTeQX8qERPA
	 Fe5khXtgOw7fXA3qk7pcpTjd82MqPwHO+C7Cd1/9qtCb5EYWyYlVZbQXyrW/uZE2hnFxn
	 zRNYt5IcSI3AlnbT1hfp4geHrzldz29VyLqJCG8wiKnKXGly7lIsrFKEsWhH9q+phaJvJ
	 5m9g/BmuBHG6GjHT3/9s9stPRINNsR8xrZzkVDEFBnv56IslHNE3/jXmxRP9vClizkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsg9O0nK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2713F606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 17:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2713F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsg9O0nK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso539055e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 10:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793121424; cv=none;
        d=google.com; s=arc-20260327;
        b=XLsKk5dFXdtzPBjac+twJ5Ns46M2wryb0fN3vamyFpK1ea+/pbhDOtY1vZQJf4UIIE
         cRUdjZleLBVUhZGluh/x+re/8p/BnXGcQN24QTFZ5UKB4rZHqMmniWLiPNqyUkiQJDPo
         ML+YZrjStqZ/SnEk6R4UNFes/JfQN/A/B+qbYAbdjGVrRaf12HGYaYu25bj+gRQ16R+B
         OIdumFOM3XLcAayyfvqH18JQjsB04NoPX4674bwZuy6VkvgX022kMCYzbwf7FBFNc/Tt
         mxByyoaiQW7IHEKJKB0vIRJy1gdjbo0klL0FadpJQM20kYEuRTEGLmAQzfyQpfBOPjCB
         wFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iblJiMWnPdBHDjKTq/8J7cpk5hZRzHhNlWjpa0Z4c5s=;
        fh=WfJV/ODyPOw/7fX3NtCeKmciyojD8HorOciXasldNsU=;
        b=Xxd3MBnfVWvbIez+gc77eRUCiNdHrvUXYBPd8YYBMdxZI2bAGGuJ3LEZWIClVJOKQH
         Zp8ri6qqZMjTBNzHrltY+g0R9e8G925aD+SnY7reOZdwfNXa/Kl0p2QMwCvaonBlwPw8
         Rd/VLPsGh/jN12H/EhmJuWk81/L+/olyRsHl07MbMiRoZdonBGbEnWe2UXApVJzMaUsq
         7jb9m1tZRwiQeRn0LEdK3PqpBM5GeFztJpM4xQRcXWvDUfqh1gxhPEaoBZmDAL9ZwTVP
         Rpytta7f1p45LVvwRG/oJy6RclOKrGTMAmGVqlmL2IYEYotM0+qa2z8QV16SFYCSxYH5
         2k/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793121424; x=1793726224; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iblJiMWnPdBHDjKTq/8J7cpk5hZRzHhNlWjpa0Z4c5s=;
        b=Qsg9O0nKFuPpFKWDrrMOgPyT+kzotrzmfrLHgAxwyCVWg9CXwYmryb0PG5JpRjNmqF
         18HrXqxIXfNZ1S3Nyu46B0TMjvJrT5affzNuEphCoxgSI0XgpKt9HX1xPyfb3y+uJL34
         HU9EuTePlDxVUgcac5jTKS3MndPN7aOtZIrpT9jyVSkD2RRNLCtaX49JkGFEwXcuiocm
         lICNPXoSgIK0/y+AV5hcqWC6MNMNWk8QzD7v+Y+oBdKR2bfgLcwYm0NUFvxisK6R4eQf
         MENlA+l/RPMYbUT1LuFamzgapuh8XvHq3VjAJyZuxClZLIzKUmpAM8xGux4xiLM4if8M
         RSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121424; x=1793726224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iblJiMWnPdBHDjKTq/8J7cpk5hZRzHhNlWjpa0Z4c5s=;
        b=VKDqfD75SG6Md3MAsRf2tPxbbJ+R7wmCdoy5wfcKC3DvxmvRFK2puGCWdEORUEYZaI
         YH1LK7b872OVspIMuZvTYrLg7eiZCoHQ3P5jYzHbNBajOMQItG9qk4abRb8G4VHAptQP
         sGlCFmPkrCeBe9Pg3SVuycdGrAPEMRNGH0WdBUdWAllqPr4jmBO60a3m0IYP0wKLQlAd
         XknI6zmkRhwKsKL95ZRymb8lEaJ5WwexXKdzndmcpwrN/g1sviiuyLHuWKq3LwtzS+qY
         wrBNuy58zk87UPvHDeMSZUVDfkHZpA4/lO9ZaOpPGHIDfDGwT0bQpUmA2p4kl1hExjTo
         PgjA==
X-Forwarded-Encrypted: i=1; AKwUvBwjbpliHI0SOOBO5xtjepVxRoAROut84TsXMONIRX13yesOUUMnxB3tYcd3HwkBJ2WUvan7ictRQEscFtI4@lists.linux.dev
X-Gm-Message-State: AFq9FYIIUwRjn086NSf1peiNNo8mFWsXyNHBR9jh4ZnM2FyZaLreOK1t
	6oCK5ql6zyYX7WfRlJSZu6dPIC6LcOn5RF0n8pNlWMQWD2CIPd5ifznjWmTGzAzqiCBntQHN/JK
	hEDyWUjCElb+mTlhYsUt7p3Vq7XjpS3w=
X-Gm-Gg: AYBFou3NyddpgMGD7Tm3lYv9DlDGjDdgXcgqdEAarsAEz42leN0SX5n+TxN0TAUJCkg
	GZ1jcwH8a0kEEq8fWukej6e3XiGX+jM/SzHoyghs7bQmXyx+grcIoBNA2WBhqo7cnzA8wCE5nfh
	47PtqDIkfJSnyJ6t8wE/8/kgc+85jx8g1YQjcn/xkCeNwNDxSBs0XvPY6ZnbZ90QoxpdAON5TGy
	VC4j92PmneX3Z+038h7bszE2bJlvgChf2kPO/51t25m3t/fi7h4FVxCQXBbIAGHKaEXm0aQobqY
	HMN0rUnMqs3v20o76j1NUW7Hy908foL6HKOL//WLG0ScUCzXhH8RypGQ6l64PvcE6Dr3nvohmGZ
	71lEbmdx8bhOgEzLLGKhuBAX942j4MfCjEPVC/KdEOgcqfwqW3PRyr3fFGD2sY27PQcEFMp7SlG
	BjM8Est4okvBtEd79w7dxHtARgk+BwcpifNvxEvghFT99AdJL9i/wW
X-Received: by 2002:a05:600c:3b2a:b0:4a1:71e5:9420 with SMTP id
 5b1f17b1804b1-4a35aca4e4emr201223965e9.13.1793121424293; Tue, 27 Oct 2026
 10:17:04 -0700 (PDT)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021060323.553433-5-nphamcs@gmail.com> <202610252143.VHe95EJ2-lkp@intel.com>
In-Reply-To: <202610252143.VHe95EJ2-lkp@intel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 27 Oct 2026 10:16:52 -0700
X-Gm-Features: AclHuK_GYh22kYzzreGUYEjOs1aNdMyJmSBQ2LFiLtGHu053ctUFbYTdpv3zDcE
Message-ID: <CAKEwX=Pqr0v2ok-c2URz2wN86aujNSPmPRaJH2XU-48n+ozQdQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/12] mm, swap: support physical swap as a vswap backend
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, oe-kbuild-all@lists.linux.dev, 
	chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, yosry@kernel.org, 
	david@kernel.org, muchun.song@linux.dev, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, baohua@kernel.org, youngjun.park@lge.com, 
	chengming.zhou@linux.dev, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, qi.zheng@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	riel@surriel.com, gourry@gourry.net, haowenchao22@gmail.com, corbet@lwn.net, 
	hughd@google.com, baolin.wang@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 6:29=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Nhat,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 4dbe24720eb3811563cd56b35d87ddf3f9beed2a]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/mm-swap-=
add-virtual-swap-device-infrastructure/20261020-230312
> base:   4dbe24720eb3811563cd56b35d87ddf3f9beed2a
> patch link:    https://lore.kernel.org/r/20261021060323.553433-5-nphamcs%=
40gmail.com
> patch subject: [PATCH v6 04/12] mm, swap: support physical swap as a vswa=
p backend
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/2026102=
5/202610252143.VHe95EJ2-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261025/202610252143.VHe95EJ2-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610252143.VHe95EJ2-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/workingset.c:19:
>    mm/swap_table.h: In function 'swp_entry_to_swp_tb_vswap':
> >> mm/swap_table.h:418:17: error: implicit declaration of function 'swp_o=
ffset'; did you mean 'pud_offset'? [-Wimplicit-function-declaration]
>      418 |         return (swp_offset(entry) << SWP_TB_VSWAP_MARK_BITS) |=
 SWP_TB_VSWAP_MARK;
>          |                 ^~~~~~~~~~
>          |                 pud_offset
>    mm/swap_table.h: In function 'swp_tb_vswap_to_swp_entry':
> >> mm/swap_table.h:427:16: error: implicit declaration of function 'swp_e=
ntry'; did you mean 'seq_dentry'? [-Wimplicit-function-declaration]
>      427 |         return swp_entry(vswap_si->type, offset);
>          |                ^~~~~~~~~
>          |                seq_dentry
> >> mm/swap_table.h:427:16: error: incompatible types when returning type =
'int' but 'swp_entry_t' was expected
>      427 |         return swp_entry(vswap_si->type, offset);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +418 mm/swap_table.h
>
>    415
>    416  static inline unsigned long swp_entry_to_swp_tb_vswap(swp_entry_t=
 entry)
>    417  {
>  > 418          return (swp_offset(entry) << SWP_TB_VSWAP_MARK_BITS) | SW=
P_TB_VSWAP_MARK;
>    419  }
>    420
>    421  static inline swp_entry_t swp_tb_vswap_to_swp_entry(unsigned long=
 swp_tb)
>    422  {
>    423          unsigned long offset;
>    424
>    425          VM_WARN_ON(!swp_tb_is_vswap(swp_tb));
>    426          offset =3D (swp_tb & SWP_RMAP_ENTRY_MASK) >> SWP_TB_VSWAP=
_MARK_BITS;
>  > 427          return swp_entry(vswap_si->type, offset);
>    428  }
>    429
>

I think swp_tb_vswap_to_swp_entry() should be gated behind CONFIG_SWAP here=
 :)

Checking swapops.h, seems like "swp_entry" etc. are only defined in
CONFIG_MMU (makes sense).

Same with the other report.

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
