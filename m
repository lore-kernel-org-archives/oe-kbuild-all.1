Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0F341AAC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 22:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757628477; cv=none; b=RdqHCjhKR6syA+eJgGQnTwrJOdD+3qsVNLAzg0rbBsiIG/lmvSfj/7k19gReSeDMya2Bb/AvC1gyyWXtQtJyq5O1Uiqz/BqD7f45Ycj3uUFntuwQCW83dB10aA7QrE6UbDGvzMhE/M0XEzzmQE8jwwNrFT/FUzYRmPEPY9BTnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757628477; c=relaxed/simple;
	bh=jtcnfarZA6UzrvRtmWR0Evc6ldU/VzjjNKluiCCXV3g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=giITvBeHDmbDENU4mV/CBwkMRzR2iWnOsFW/2mY/ES5PVW5u+iFzQOtBEAJRqA5jvfJxSr81hRnuAByoQy/Tl+iGkoTA2Q93JFJHIxzFxst3XM3efWNNpxsvmsT3wRrLBl8V6EBRy74NGYpEOBa+Q9QkrE04ygwKLZcN6isZRcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr9MwOBB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr9MwOBB"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7723f0924a3so1619389b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 15:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757628475; x=1758233275; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PIzLX4YwMmt2w1/Or//9q2o4ZqfSWElSTB34sVpm3Zk=;
        b=Rr9MwOBBdyUN2A+7vikVw8c4JMi4FwxhYeIJ8Jr4Y37iXRXw2GgfKSdfGLp3yGoSwv
         ahS7lg3mStHqi88mP3xFxknQuReyyzM+HDsPtfWSJXZPuagMK8D5oUaIXn1w6x0bW/gU
         NXB2anTT4DG9TNN1pxq3GtFI/HlhjDsbztwcqNPk/P7179Zl45cZ1DLQXXcGI/+3ATQH
         q0bNnTDVtgX9t0TLVoIfOUqPfLJ+3F4fUOmoPy06kAVntAGEBHmXnZNhqQQllmrzyB7T
         FfSLBUnI4DkltYkWjCH5CjrltHRI/ro6/MMa1DM3dZ3a6WJZDOuyyQbJBucmUoN7Iigk
         zC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757628475; x=1758233275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PIzLX4YwMmt2w1/Or//9q2o4ZqfSWElSTB34sVpm3Zk=;
        b=jhwDRtR5e9qTlmBWEuckPCHHuprkTrhKKumvbm6/qNqPxWIg4j2uadrSKON3/Y6RXe
         Ox9xMP5PLV07+C+camNdWm76HKTDvQGAzApJl4h0ruySX50OQEV5MGnthePc8rTWhhOF
         bLAi0+sJkqzs84yH46M24kNu+1cmgMIaggu5tJ7IJv8V0kpgqYYS2m0N4cCJGgYNudEt
         b8ZQc8BGHfhdMRuTBYgbhRNaSLKcWHXR6LD7jmM/qcsG10Su/W9wdq0dry/vhIjOWBQY
         3Bow5W/1NtuZm8D8DHgAqPJUT+YYbKxTdolb27YxnJr0uuU5khL7pEpgQkmzd7Zei+ZL
         T7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWTLQOKGPlTKeRgz0M+FPX4nE81Iwv67bl/hdWz3iPymO9lrHoujB89MWYaUHQ3yEsE0xXvE2HrF4s2ygBF@lists.linux.dev
X-Gm-Message-State: AOJu0YxRW6xl+FpHS9l4Vtj+HeHslhdJ1HIYG8dWRK3HqiX0LrOuwkER
	+VFyEONi0/5yXmBrqdDTXtVcKxBleuc9i4vuVR1GGXo7BcUq/iXAMBL5
X-Gm-Gg: ASbGncvkETwNUyERfxLo1BzIjiRjnWw2jFs9+RzCK7cDLey9/gIhCq1EQEkL0HI4ChF
	dusFV6TdEJClMoGtZ/0s4wtKlgi2Hn1YeWJ81oHlRXY8CkGJUB+Sn/aNhPNxSwddvl1I2CZY433
	GOicoiAZRfpkpdRpUxtWqXEMBdqAV8GKJnXlT7CwTa/OVVNioWberVwkSpkHZBwXQRGzMXzcN5H
	aCcSpefTWlXyLAuPCUFAWzGALDb0p8joOKZx0ZOpSn3BOrMeTMrIglRRdmblNd5B9kfE8Idi2me
	YPyXb6kiddTZTKssyUBOetJ53OW/sI181MxI3g1LZPV/uTdLALZy2+UD/7Ure7tRJVnmHaBjjS7
	bwa9IbQ1wIN/SGwBHMJo=
X-Google-Smtp-Source: AGHT+IGfIKtuAcKICp7ZxJp8lOEaeeLF1BaJMcTC3R/RXVkYiy5e+/ccc4815OulQS5TGLefpo1+Zw==
X-Received: by 2002:a05:6a20:3c8f:b0:248:7a71:c25 with SMTP id adf61e73a8af0-2602c71ab31mr890725637.50.1757628474841;
        Thu, 11 Sep 2025 15:07:54 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a69a8csm3148324b3a.44.2025.09.11.15.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 15:07:54 -0700 (PDT)
Message-ID: <6fd0e1fdf651f0728d1daf4fad3d6e4d4c11d221.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 09/10] bpf: disable and remove registers
 chain based liveness
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>, 	oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
 <martin.lau@linux.dev>, Kernel Team <kernel-team@fb.com>, Yonghong Song	
 <yonghong.song@linux.dev>
Date: Thu, 11 Sep 2025 15:07:51 -0700
In-Reply-To: <CAADnVQKGwghC=+V8u0tSPdkJ1f4usY5LeYUpxnJno=3xW8tYGg@mail.gmail.com>
References: <20250911010437.2779173-10-eddyz87@gmail.com>
	 <202509112112.wkWw6wJW-lkp@intel.com>
	 <c846a153010e40a52e98b8abe9db69f7d4cadd58.camel@gmail.com>
	 <CAADnVQKGwghC=+V8u0tSPdkJ1f4usY5LeYUpxnJno=3xW8tYGg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-09-11 at 15:00 -0700, Alexei Starovoitov wrote:

[...]

> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -19297,9 +19297,12 @@ static int is_state_visited(struct bpf_verifie=
r_env *env, int insn_idx)
> >                          * the precision needs to be propagated back in
> >                          * the current state.
> >                          */
> > -                       if (is_jmp_point(env, env->insn_idx))
> > -                               err =3D err ? : push_jmp_history(env, c=
ur, 0, 0);
> > -                       err =3D err ? : propagate_precision(env, &sl->s=
tate, cur, NULL);
> > +                       if (is_jmp_point(env, env->insn_idx)) {
> > +                               err =3D push_jmp_history(env, cur, 0, 0=
);
> > +                               if (err)
> > +                                       return err;
> > +                       }
> > +                       err =3D propagate_precision(env, &sl->state, cu=
r, NULL);
>=20
> hmm. init err=3D0 instead and avoid explicit if (err)return err ?

Or like that, yes.
