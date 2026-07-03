Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7073D953B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087030; cv=pass; b=o/0v6oU1E5KaPoBxYo81aKBTu4w9MIkYhmtaDWPVHojiLGwacDLjSINJlmzMbzaZseXGC7CNEoKsj17VK38JdGuaIcm/MeYM6EMylWuATtLTlPVMWGzIXynr2XmoIyY2FacYB79Q29ZidL23IquZB9C9ZEI+f5aUatavU2svKJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087030; c=relaxed/simple;
	bh=hVvP+u6yM5Mqcyx98ZiEMoPB/tESb1RKnQit6hmGlqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F848Io5glHAq2/QCDtV2cZ5VqS/KXujA47sFgv6qlycSB1r1IdNiJ1rRo5b6EiTtLgrG9ytoIZb1B2eIB5jdJqcdDoHoDT6gebEGwmoyJSuTigAwCduxJjog53wYmZYmIIwZjsJacAsWb2slt2Qnu6ZpQkvJKImoocbolNqYjBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scRLmCfB; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scRLmCfB"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6b554044fso421591a34.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jul 2026 06:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783087026; cv=none;
        d=google.com; s=arc-20260327;
        b=fX0zpnGEqRw+lPEU+S/5bD1Mf8025eofQDg7Fv3u8Abgqmo17KqCdvyJkdQIbpYZn6
         uuQItCm7HuTcVatgBYK2ti/I7yIbUtaFyU44AsgeqTIy+Zb+pPwcktRUaNqpcymrn6hm
         QRtNpdvG3nC+BTSWMAnJBRPR+ZU0kxK9CQlgdZBasPuViah79P1Bm/Wml3yoDlhOgXeN
         2o+PLB5d/M516XmllxflEF1bXjdlMdUTayLqkTH3mMtOI7olx5seKIh17q2p9FMxodKV
         bSZLuVhVBXs3d4Wg25q9AwBbyUHtP58BMFvHltBkiylDXN7DNUXumjG7pZM/4z066lar
         AnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nASBmgGmFajYNDw+sfEzifcL6cg7Q3JMObUhW3cut4I=;
        fh=ALTt27E5qreRd0vEUJ+Bri3vpM33D2B4pHr9zCVtZgY=;
        b=LKeFt/rzlPWEMwzdf3MS3Rd6wx1xYxksaA1UzJh1+csXaQBXdbtJGNV5WBC1cQpywV
         t2RhMuDqtcPZi0+MwFzBUiNSEMS9g7pnfFJ7FG63DXQS1sKTN8rkHcnShCyEx0WUgYAg
         JdMdYpf5U1Mg08jTRXudG7yTB2e+ihuDsjczgzTQeLnDZOETccR25uz674QUfBxQ+eQf
         gSkg/UuYD0AIrEr9Nl9Fw2L+txTWWQFQFAYCJbQyDhYCanHjwT7a++zdrByMY0oRcCFz
         8so5gxanzW+zMJSgfbDSckhZjX4lGZLhIGTOK3D7CxzLjEKRM5nucdXg+m1S1oD9lL4j
         4omQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783087026; x=1783691826; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nASBmgGmFajYNDw+sfEzifcL6cg7Q3JMObUhW3cut4I=;
        b=scRLmCfBDB0M/0vnqcrKEuGc0KLgb/ZjwBvCoTeuuoAZnuP9ESMb/r9wD0jdm1lcT4
         aPNQ3JKEuogt5tmTu5uANZgI4EDEVOrvKCIsBcW//X66S3av+mpvQk2SQ5vAr+EhrPQQ
         rycI6z611QHIZ/sbXj2IGaGxUBGsypcFidUs+8ZmTM2FqwAVsolelpU91pRQb5uXF7B0
         uR5vdXbdmRLTHjOM85CZjVIoEDXoo4OZyVfu8Rfx7nDC+PHi4NcusBSmjq8Utb+cZ+By
         erFPT5bXf1PiX8tZRvKLyAIJQ5KHLGkLBiiuRGnk1ZxUbchx+pIyGO1CFWtd2sBmzRcH
         RBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783087026; x=1783691826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nASBmgGmFajYNDw+sfEzifcL6cg7Q3JMObUhW3cut4I=;
        b=THnjJZ++TJgENoqnk92bH7uf0odNrEopVBSHJk1likYqLqUmMU6SY1kVqFuOOK/woB
         PNLOYf1jMPrQy/YpMSfk1UATczMk0fhNxUPQmHHz0+gdvLPxQb/z6Y4g/b8g/x8Xu+Vf
         YpUErPi8fsbT3h1IqXhNDDhdsUKw1Dh3GG7Ml0oqIk2HX5aFF5Qvd+72u3TAW+BI3GVQ
         eMlnjy2X1bCCL++KUBzKVkIEc3bxi6Tk/NgcPc80x+u8ptUdh9tVOjilffvv8LWQyvxK
         yrMUGjICOHshqC+SWuyR10CPVnwe1FjMOrp4qz+ii7knDiYIom8eP5Os4SlEzqsZ9sGo
         fqIw==
X-Forwarded-Encrypted: i=1; AFNElJ8SMGrrSunfie3CgZgktGLgBR5dRmbAxQogr9ZSCXtuTElCgpHmgOvOA+sHfbYtaf2YftTYrXac/Y8a4qXC@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr0LMJoUaPOgKjjQJqymGTDijLLlotJYXJnsF7moCbwDAttgH0
	PelrNKM/2BMdz83OoRBWKiIZ0yyta5v3ww8eWgLDfN3hydsuzxpHc2zHjiv0g3Jifpr6pw0eA6N
	djifmBxD3cvPc6QzPeA2PHWPCBVD1LfI=
X-Gm-Gg: AfdE7ckgIBhyCqGSf3GFquvYizEm4P/Ii7IIRhd/VJyaApuHTrBp4E3Ce+eJkqvCNiM
	KhE5h/vbkv6CSm89UD6Ct7cqAQ/1QNVKkd+Az1VqGFsJAykDfXe2+rlIEtPfqjBdlJ1fEsUoBUn
	R6/CsojcJ534fMwpsf54jzrFtURP8Jkc6jswbA7ZUzpbATtNW8n2NtFQSa809B3MDcEXinlQTnU
	e6jIlQDOSZppfmv4dU1TRio6OXigI/ABqLX5dMYXv5QnnIkq6sKho/CqnDf7eVnTwN0QP0a2Ik=
X-Received: by 2002:a05:6830:6f45:b0:7e9:b4d0:df75 with SMTP id
 46e09a7af769-7eb4cc56976mr7034576a34.29.1783087026315; Fri, 03 Jul 2026
 06:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607031837.HSmBj8pr-lkp@intel.com>
In-Reply-To: <202607031837.HSmBj8pr-lkp@intel.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 3 Jul 2026 18:56:54 +0500
X-Gm-Features: AVVi8CdHQupey23YWEsUas1M0EpNc9-M0aUb-pflQdFjPWNzAQA9rXMMh6ms9WY
Message-ID: <CABXGCsNFxBF6BJBBOK6Wzm9ELA4_o=yjkkCr7rSbmUQBK24e4w@mail.gmail.com>
Subject: Re: drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool:
 amdgpu_vm_handle_fault+0x16b: sibling call from callable instruction with
 modified stack frame
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 3:17=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d2c9a99135da931377240942d44f3dea104cedb8
> commit: 7152b248dc3c8d5fa8629e99ed5655dd41b51562 drm/amdgpu: fix recursiv=
e ww_mutex acquire in amdgpu_devcoredump_format
> date:   2 weeks ago
> config: x86_64-randconfig-004 (https://download.01.org/0day-ci/archive/20=
260703/202607031837.HSmBj8pr-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e984=
6648fd6183ee6d8cbdb4502213fcf902a211)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260703/202607031837.HSmBj8pr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 7152b248dc3c ("drm/amdgpu: fix recursive ww_mutex acquire in amd=
gpu_devcoredump_format")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607031837.HSmBj8pr-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/gpu/drm/amd/amdgpu/amdgpu.o: error: objtool: amdgpu_vm_handle_=
fault+0x16b: sibling call from callable instruction with modified stack fra=
me
>

Same drm_exec computed-goto issue as the other two reports, now on
Linus' master. +0x16b is the drm_exec_retry_on_contention() computed
goto in amdgpu_vm_handle_fault() lowered to an indirect jmp (jmp *reg
to an in-function label loaded via an R_X86_64_32S relocation), which
objtool can't resolve to an intra-function jump and so treats as an
indirect sibling call. Same mechanism analyzed here for clang and gcc:

  https://lore.kernel.org/oe-kbuild-all/20260624092806.GX48970@noisy.progra=
mming.kicks-ass.net/
  https://github.com/llvm/llvm-project/issues/205544

Note the bisect: this instance is attributed to 7152b248dc3c
("drm/amdgpu: fix recursive ww_mutex acquire in amdgpu_devcoredump_
format"), but that commit only touches amdgpu_dev_coredump.c and does
not change amdgpu_vm_handle_fault(). The drm_exec conversion that
introduced the pattern is 9920249a5288 ("drm/amdgpu: convert
amdgpu_vm_lock_by_pasid() to drm_exec"). The randconfig-004 attribution
here is a bisect artifact, so the suggested Fixes: tag points at the
wrong commit.

The drm_exec macros are being reworked to drop the computed goto, which
will fix this on both compilers. Not respinning the series; happy to
test the drm_exec.h change once it lands.

--=20
Best Regards,
Mike Gavrilov.
