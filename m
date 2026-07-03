Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB98372B3D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062868; cv=pass; b=F1Z6RU5xqdAop77cy+SNo2d6CQHU2feXhM9JmecyBYTH77F4m2uDjxO15zkH+Da4we/9TrPlxXw2amTgimSR4uNvveZR2t8V8GdaUXYY5hPsxZAVI1azqNEVvwZggDovY7moaSGXMvT9nkHNkw2maiLpkIsxd3inQV10hGkfmd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062868; c=relaxed/simple;
	bh=9OIdgG/QLk1AsNScsqZ2S77XJKuNofSjx1FL/k7NmvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQXtHoUxvO4ZhozqvIbTPajNrgrB40ioBDKeaBnJwHiaNvA2NQYOv52gZ6KV63PiJM0eBc2+kNN8vgTJM4q6oO34J1z4vFqoUznFFxV9VCKCp8cLx4IUBx3ZSCD+ditimD01fFID5mJpJ/VVYvNhn/jZYujuEYLpOP1lOB7Hp2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byihN9aG; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byihN9aG"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so205527a34.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jul 2026 00:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783062866; cv=none;
        d=google.com; s=arc-20260327;
        b=hNxYO4mP+Vow9Fz4p+VZiqLmrKna3j4y22b8NE2g3KZ1PpxCZPYDsGn8Pa+oxbiLC/
         76GXY0CAlSjYgJJsZ9imtdu+kEkaIiCC/1Doxj5jcka2bn4alNnCi/Uvygnx0+OrfIAI
         H86cSR/73aoAaRdzwNgTbg8KuZfcPup9p1vTQNJFpMh4LSFln/V8NeGBgthtcHP7X0KH
         dISNadQAnQBj0oz0JqEsdKI9suLLL7jZ9OsnAxrs0QEP3eEtTswF2+qeHwKKiCfrwr6K
         aYo+t4HjQg+j6ue20iayoFa9YEGByiFUkQ1ASoAFhx3zX3Q+5WdVl5Iy5tDYd5HKjHuW
         uVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+uwtjBZCQXRUfQ7snl4P8LJ9P/GD1fT+arGhlD0aEE=;
        fh=Nxh79cTZxuZc10Gb+3cD+CV3JEDyHLGVkAm1PvSjTtw=;
        b=FvOxC6qV2JMzsvWPtRZ1C5Mwbxsnks5Po9a9V3oy6+zN/IS90eXTEigbAN50V0N3PV
         cE5mBngOjzU4s186JCq8tLHAZuIiFisOjPKsFN+C6uX7+EAXPaqww0XdXooNQpuuEIUr
         WGf0v7uFcoaK53uuL0E89YaCY1wPNn2S/wErex5pG81A9mgeiX9WplQ19LVSgxS7RQcC
         xeFpPLfZbjDdKFtUAK9EoAhM1tlp9l6BG74wcaaDHyh/HyF0nmmYNw7ZMJjtztzBdQRy
         lZ6ZGYd+gPIlSTDAS1kK+Bl7U7S6ILuntYMOtkyLGkJJVfHYtMnjgfRHu4Jwx02Kqy9t
         xxqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783062866; x=1783667666; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+uwtjBZCQXRUfQ7snl4P8LJ9P/GD1fT+arGhlD0aEE=;
        b=byihN9aGzmv6MybH9L31TZIGsnxrsWtR2iTF4heLVh1gDoXfOJXaYcsttf6UaUKF06
         +qS3pJasub3v5xxtpq7FLFM8NlYE53XuoLN4gM4rtiB/B1QJoq2Nyrjg7FCjMk4whxt8
         8OSP2GAYQA1AOFia96ruSRrB/KGzm03m6ZmAL4kwqADa8Kwp3KlpK1Ob4UpdJFU7YUEp
         Zu7euIgKrXv7Tj334dZW6SUNDEdpCYo2oSXfs7d5286w5JExwYUBRtQbzO048abKbqm5
         qYz6Hj6EKDIZZtZRC2yAmnGqPJ0QY8miL7uzumvKDlVAuYfSZ38TBeoCKJuiymZExsr6
         QQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062866; x=1783667666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+uwtjBZCQXRUfQ7snl4P8LJ9P/GD1fT+arGhlD0aEE=;
        b=icjUc+m+/bgm2vc/CwzgHN9HzrbCckw2IT7VeO+2mSNdZ+VpmfDqq1zKLer2kFUWsQ
         dCoypgrogjZuYc+C8u+N05RfUHmURIbAmzm6acMBRU/AGKfteqI2kJEao9PCK3ALPTD4
         LkDReLGcN6BD6D12MGKL/fstPjvE4jxEkMLO3pnBxg/9SQ5ybUTvt5kHykjFgb6CiEfA
         gVnCxJ/gOgzOTblvYgbTqBrGIKKf4SSHmz3OPBViWmUwmgvQMtPFP6yFwtHvbOSqriYX
         2KbDbT4n/B3ZYeP81QJVyLYB0vhOA8O3TKHbG3hWEWO102khmS1Zn+OA3oJirSo5r4E1
         WG1g==
X-Gm-Message-State: AOJu0YyiBdIhPJvOcZlEAjzObjti7BourIeSnFxk3QR46S281YwvaMLb
	4Cel7aNdBu0d/aY4wgCwtOIkoklTwzXCco312w476lr9PLP/wnCeI7olvkcWdTFBSryRV7UCobT
	P3Fy8LU/6UZDyDoksQzBm4jEqAcUiCfk=
X-Gm-Gg: AfdE7ckbwXKw9/NWNpwX65QqptUUeJRp66CjoXJbjSvANTb5M8tnkj/IWm+ydWb0w5k
	Xlp/HFSph3z9BeIgkTpXYzUVahlAh7C3pOoR4tE9/xyZ8gGnDDpVuEnE4nEPE594Dca/dueK688
	4Lwa0E8q3GIA8vDWb6KX9Bh2mMEZ3fpHvF/yZR4G681APnqgZo/AdhesCJ6fagUDs+/n+kXUYON
	9bL+XxaXki3pjGOcvZegZmLKN6gNkwM1m8XBP44socQ53uPel4SsCMR+3hoUF6Q5Nk7qcMfqrg=
X-Received: by 2002:a05:6830:3911:b0:7e9:cca5:df58 with SMTP id
 46e09a7af769-7eb503e319dmr5433191a34.14.1783062866472; Fri, 03 Jul 2026
 00:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607031446.1PWG18mN-lkp@intel.com>
In-Reply-To: <202607031446.1PWG18mN-lkp@intel.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 3 Jul 2026 12:14:15 +0500
X-Gm-Features: AVVi8Ceq4GEztOiRHTf5i2S_gTQRhO9l2BI_3wOAhN9fEZAqVEZTfd0WGpd_fbk
Message-ID: <CABXGCsOy3PLS266wt02z85-EEauYPdEQu=GQuRK1ePbcUZVLhQ@mail.gmail.com>
Subject: Re: [agd5f:amd-staging-drm-next 3123/3402] drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o:
 error: objtool: amdgpu_vm_handle_fault+0x169: sibling call from callable
 instruction with modified stack frame
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Infrastructure <z1.linuxinfra@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 11:11=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Mikhail,
>
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>
> tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-ne=
xt
> head:   e3cc8c108f9a91728f9ff6e24cbf3b41c58b8f8b
> commit: 5eef847e04879ec59e4e04fa17a0758fb364f440 [3123/3402] drm/amdgpu: =
convert amdgpu_vm_lock_by_pasid() to drm_exec
> config: x86_64-randconfig-006-20260702 (https://download.01.org/0day-ci/a=
rchive/20260703/202607031446.1PWG18mN-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260703/202607031446.1PWG18mN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607031446.1PWG18mN-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: error: objtool: amdgpu_vm_hand=
le_fault+0x169: sibling call from callable instruction with modified stack =
frame
>

Same root cause as the clang/linux-next report, this is the compiler-
independent side of it. +0x1be here is:

  15918: mov    $0x0,%r15
         R_X86_64_32S  .text+0x158ca
  1592e: jmp    *%r15

%r15 is the address of an in-function label (loaded via R_X86_64_32S),
and that label is the head of a drm_exec_until_all_locked() loop, so
this is the drm_exec_retry_on_contention() computed goto, exactly like
the clang case, just emitted by gcc. Not a tail call into another
function; objtool can't resolve the indirect target to an in-function
jump so it treats it as an indirect sibling call.

So the drm_exec computed-goto pattern lowers to an indirect jmp on both
compilers. clang does it at plain -O2; gcc does it here because KASAN
and KCOV are both on (shadow-offset load in the prologue plus the
__sanitizer_cov_trace_pc calls). On a reduced test case gcc folds the
computed goto to a direct jmp, but with -fsanitize=3Daddress and
-fsanitize-coverage=3Dtrace-pc together it emits the indirect jmp too.

This is already under discussion here, where the drm_exec macros are
being reworked to avoid the computed goto:
  https://lore.kernel.org/oe-kbuild-all/20260624092806.GX48970@noisy.progra=
mming.kicks-ass.net/
and the clang side is tracked as a missed optimization:
  https://github.com/llvm/llvm-project/issues/205544

The macro rework will fix both compilers. Not respinning the series for
this, the page-fault conversion is a pure refactor with no manual stack
work; happy to test the drm_exec.h change on this config once it lands.

--=20
Best Regards,
Mikhail Gavrilov.
