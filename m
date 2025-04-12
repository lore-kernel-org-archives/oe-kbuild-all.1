Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4EA1E5B90
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744472568; cv=none; b=XiutI/lmQStQpc0fCqjkPReDvbGNYJPb2J3pKbRfTE7i1OQEoH/32MoZnj0uu1Ic1BCOkcJtK2wZjHBlc/3Hl+/9c3wk4RnCNd7u2MxLjlsse3rvi/oBIrRE3DGI/BAgwDqPocB7GxpsL0JNyJVZg7uoSUcOdKqeikeKTgPXtL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744472568; c=relaxed/simple;
	bh=9r1fCvprHI/Fwu+b6naHK+J3XuBrRL5vqfNT9fO7irU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzsKoF1DFFpYHaX9pLUNo+4zzQjBwiHWiPOJSDvRDiIE2bm40ieGMC4/lS+OlJGpTcoHIRTygnFRrlKJa0P0bnuHtf4OOpBlZ+ZcrdRz/TWZBWy3hn65k5NKlUW7CXqWFMbg8y4cZJ78DHXeya2XIZg4q4hfYrlHWeITDxoM8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=IeBkSgfB; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="IeBkSgfB"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e589c258663so2771445276.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744472565; x=1745077365; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N72gVGwL6LDwo9WXyFANW+3dFDibp9BPtFifdmz3IsU=;
        b=IeBkSgfBgBD+CCiwT5Pw/PMK9NhKtRDoSKwpyf/rcm5o2TkpzDIKm+UY3mp6p2CqBM
         Dg3Q4yIXidBHkKj2sL+kEfBiZBDBC2FtoSymEqRIY0EuJVQzMXYzBSWLLxx89+e1Nw13
         mpK5kWb99FI3nvAQHxX0De+ZDADQ0fo3q6WYY50fQYSVp3xGVEN+9a7idiyUGygMpL2H
         8mmY77q8FsuXPTyDRXlbr87y03oWAZi1dw+Yrccw32c0JweK1TKH5ZBybKWj4imf31xb
         34GOsySKWpCI/7SoOsYyVTSwzLhLGu6hFDgNfQ4MUGHlnhqM+gAW+C3D06bcGkrjCklo
         Gsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744472565; x=1745077365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N72gVGwL6LDwo9WXyFANW+3dFDibp9BPtFifdmz3IsU=;
        b=np4mv4OeBZuzTt3lVIDBASn2fDT8ulR4NgMOA74LWkhCFJ1MK61aNU3FkIzMQC7hpW
         zSuzebD/O5ro4IakfmxoSAMEeOsl3EhJWy0OlwKdzKGx3i1dqiy1+5RcD6XLG4JBsGJc
         iAwb9nP8C3aX+qDwnLzNtquub7zNdPyv88hR1gAZoy414RV1dETlV02nBsJJnmQ4c2gB
         KgXAWM0hNiIQDrRxEFNMZTLig+xPeT66cjuTSWpReQlgxwEbXpO6TJDb6ULT1zMk7iOI
         p4+Y4c4+9i+IkjMnQAIN1Y8dQhi/T7uTjmer5Mv92/+bEVEjYZQZ60ph9ptuRp8dU2vJ
         qxGA==
X-Forwarded-Encrypted: i=1; AJvYcCW2F+sZoRDnQwbaVWbEFYQpqCkwCyJNqMlu0UGHrHCchEvRSiBp3AwRoTSc2V9hfn5CO6OsjRcUl/P7KZve@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzw/QXGabeRAR9HTgkRSKpz06v0jOHoB/56BMMYsYb77Q9X8a7
	K+TOepnE3fbR4Eo/4wNWjtGkVOQmXEAcFDyDnUGB6q1ptJc0B/4iQOJI1lzK/wMTKeA5UBpxPPS
	SpPBYC2/3vi6YucCZbMVUlcIAkJjJuU4jsx+b
X-Gm-Gg: ASbGncvxebkUI3z6yS8aSIG6WECjTJ9T3b8PECT4RuLbNpItODbgniOnu6P2ckhJ0Mg
	eL7Lsdv/loeZW7CZtU1NCSNK6TCLovwn0P8ZlJG4AjMdBo0XGIWITQQib+febtglZ9B/fTGjDSA
	NE1Eb/yzwfw5WPasSgde1/3QmLg+cPTaO5
X-Google-Smtp-Source: AGHT+IEyX+uhMl0JZHDFv+c6SdZXSaFV9mqencBlf8FeI70qT4AIQ+9THKDkeM0kMLYyPNSUMNymDepiUiIBXaBasMo=
X-Received: by 2002:a05:690c:39a:b0:6f9:a062:2a06 with SMTP id
 00721157ae682-7055998e8a7mr97270327b3.8.1744472565465; Sat, 12 Apr 2025
 08:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504122308.Ch8PzJdD-lkp@intel.com>
In-Reply-To: <202504122308.Ch8PzJdD-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 12 Apr 2025 11:42:34 -0400
X-Gm-Features: ATxdqUFEhb3li6yFyUwRXthyrUsNY5fOY0806sl6qpbGcyvNOZ9-5k0-LPnNYVk
Message-ID: <CAHC9VhQG8OMFUo7onZ9nKzeHAMkFmnNHUm+Oy35sh5FzPjQciA@mail.gmail.com>
Subject: Re: [pcmoore-selinux:next 7/7] security/selinux/hooks.c:3173:
 warning: Function parameter or struct member 'avd' not described in 'task_avdcache_update'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 11:21=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.g=
it next
> head:   5d7ddc59b3d89b724a5aa8f30d0db94ff8d2d93f
> commit: 5d7ddc59b3d89b724a5aa8f30d0db94ff8d2d93f [7/7] selinux: reduce pa=
th walk overhead
> config: i386-buildonly-randconfig-003-20250412 (https://download.01.org/0=
day-ci/archive/20250412/202504122308.Ch8PzJdD-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250412/202504122308.Ch8PzJdD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504122308.Ch8PzJdD-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> security/selinux/hooks.c:3173: warning: Function parameter or struct m=
ember 'avd' not described in 'task_avdcache_update'
> >> security/selinux/hooks.c:3173: warning: Excess function parameter 'avd=
c' description in 'task_avdcache_update'
>
>
> vim +3173 security/selinux/hooks.c
>
>   3158
>   3159  /**
>   3160   * task_avdcache_update - Update the task's AVD cache
>   3161   * @tsec: the task's security state
>   3162   * @isec: the inode associated with the cache entry
>   3163   * @avdc: the AVD info to cache
>   3164   * @audited: the permission audit bitmask to cache
>   3165   *
>   3166   * Update the AVD cache in @tsec with the @avdc and @audited info=
 associated
>   3167   * with @isec.
>   3168   */
>   3169  static inline void task_avdcache_update(struct task_security_stru=
ct *tsec,
>   3170                                          struct inode_security_str=
uct *isec,
>   3171                                          struct av_decision *avd,
>   3172                                          u32 audited)
> > 3173  {
>   3174          int spot;
>   3175
>   3176          /* focused on path walk optimization, only cache director=
ies */
>   3177          if (isec->sclass !=3D SECCLASS_DIR)
>   3178                  return;
>   3179
>   3180          /* update cache */
>   3181          spot =3D (tsec->avdcache.dir_spot + 1) & (TSEC_AVDC_DIR_S=
IZE - 1);
>   3182          tsec->avdcache.dir_spot =3D spot;
>   3183          tsec->avdcache.dir[spot].isid =3D isec->sid;
>   3184          tsec->avdcache.dir[spot].audited =3D audited;
>   3185          tsec->avdcache.dir[spot].allowed =3D avd->allowed;
>   3186          tsec->avdcache.dir[spot].permissive =3D avd->flags & AVD_=
FLAGS_PERMISSIVE;
>   3187  }
>   3188
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Fixed.

https://lore.kernel.org/selinux/20250412153736.27881-2-paul@paul-moore.com/

--=20
paul-moore.com
