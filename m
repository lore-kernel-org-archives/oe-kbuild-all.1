Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2525A62E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531741; cv=none; b=FQIXcPfiIpp8kJmNolkbIrBy176SLOHrtM1yKqLt5P8H8FsaYcdou82oxFu/6A8Ax3/SdRA7KP+vpqIB8QeUR0HpI0XYs61MO9DTWJM1uALy4gWFQ5ERK8M6Qp1rvGUp06Yorn2uYdhOkCn1gmKHbvDidY3NKHc+P4SPPkoTyTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531741; c=relaxed/simple;
	bh=PUc3QdosbHPXkAkyz/Yvw31TFP4gs9runVGAjzZ7t80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kto+sgp9ouVdsGdtVWQWMEMfI3YzO3tpiqLLu9X5o9IBBCOq5KxvTJciuQxOUEe5eRrJ3h2dxs2XOd2nv4Xp13ahUiq5Ecg5dGmQLgMD04w5OhFHqFkafJGfwf2GMO63NHgUSohHrL//mtIQ2UHTOMjHxxA82cPda05BF/Th08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FYR2ZwGs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYR2ZwGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739531738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PUc3QdosbHPXkAkyz/Yvw31TFP4gs9runVGAjzZ7t80=;
	b=FYR2ZwGsIHJ1nHyCdhKHNmpY7FVR6cHV5kjR+lgv++eQbX+yUf87W3TH4KqVRe7+NKTnH4
	G4DcCTJ1OWo02BtKc5be5X9l+rlw2DeiFb5jy3lebVXiKBrfHhYW6AXHWLgNfp06AD10Er
	ewm4V8UCEOhd934kA2iDme7MiyM8wVE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-CrPeELR2MIKMbmbv8QRdug-1; Fri, 14 Feb 2025 06:15:37 -0500
X-MC-Unique: CrPeELR2MIKMbmbv8QRdug-1
X-Mimecast-MFC-AGG-ID: CrPeELR2MIKMbmbv8QRdug_1739531736
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4395f1c4354so14434895e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 03:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531736; x=1740136536;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1iQIbvDhgSHZ4WT/gbEt1daMYEMQVwHES/A7FJ/qNY=;
        b=Kv/IQUH1uIIR30UKfUdgG5+J0RwwBkXkBcmJFPT9QB2E4MJDMGf98mVO3PwzYWntSO
         U5PuRGqvuoTvpVkn8lnPCtsZhrwDCodv23dBZcn7lz1EkGRggDtNSIVOyFafmrTBA1t1
         /t43nY6TcsR/TgOCbc5DROQJWjyPpi0kMc7DTXfR5ipyS+bO3rpOTs+QgGa23kzbrlkW
         gu1GytJbPecPoGBTvGZuKR7pdqgePDem4C7tLqUCGhZMg6Xm0ZSVRKCBCnIRcQvO5664
         kgUN4k199W6hHseEcWy3QjPexwl/qaJTurv2bTzSZHd6i9iLTQ3GOixYVyZApij/M/d+
         uqeQ==
X-Gm-Message-State: AOJu0YyVKZO5zZazJP9EOfhObqjD+RFlgdJ2hs2kbSyJMnOzqKGM7uSA
	VlNyDinHy+aL5kUKKcaZK+pnrvDxr/od8A7gxGDPnYHf0rzZnVvskinbMj07WKcY7vPH6kyQpos
	JtoRpX8mofNQaK8hNw3qySO3OfN2owucqDW9ThNXAKXJmEQ2nlNWCPQPYGNJ4JYo=
X-Gm-Gg: ASbGncv+hyeATDvKk1HT51Hr04gnm7HxYPFBM+O6i0UM7/4FTJgdSxcF2b+zrDzdH0w
	W/hsSaYa/1bOkL3JBWKFyeRQZR4o0lT042IBnBh51d+s4LahU35rc4XY4yEq4Fzmv5hx97IwlZ2
	Dx/3b5Xc7Q2kGsodV75w+wbyvS2VB1V5DHyrtRRxWkZ0JfuaAGz7f+n/dSt43lF/2x/3l0/Paz5
	8NmlhdtdotYKLZKxbxwjFlxKVyJXm4ZWtVyiP6+xBszni5CUvgeqRinVCU1tD2u2RhcreKLruDs
	G0C1JstXOez0X8rhiEGQ6R9pMNwM89qNSQ==
X-Received: by 2002:a05:600c:19cf:b0:439:5573:9348 with SMTP id 5b1f17b1804b1-439581b88ccmr119294165e9.22.1739531736302;
        Fri, 14 Feb 2025 03:15:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkfOw2bzXtZt2kXV8bZhrLtsOBgcZjNkpTqtdBEsmjzhSmT9IDyjozv2rFlJKM3Au+7OdF3w==
X-Received: by 2002:a05:600c:19cf:b0:439:5573:9348 with SMTP id 5b1f17b1804b1-439581b88ccmr119293675e9.22.1739531735938;
        Fri, 14 Feb 2025 03:15:35 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961645422sm27024865e9.2.2025.02.14.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:15:35 -0800 (PST)
Message-ID: <789b56973c0e6419a6a44210a18d1b31d0daf8e6.camel@redhat.com>
Subject: Re: [PATCH v2 03/11] sched: Add sched tracepoints for RV task model
From: Gabriele Monaco <gmonaco@redhat.com>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, Steven
 Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 linux-trace-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Juri Lelli <juri.lelli@redhat.com>
Date: Fri, 14 Feb 2025 12:15:31 +0100
In-Reply-To: <202502141516.OkUInaxw-lkp@intel.com>
References: <20250213090819.419470-4-gmonaco@redhat.com>
	 <202502141516.OkUInaxw-lkp@intel.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GAjBBkNkXCa7JbAoxfYVJiInYmaGvuFpqvyb8Tcx51E_1739531736
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=20
On Fri, 2025-02-14 at 16:00 +0800, kernel test robot wrote:=20
=20
> =C2=A0> =C2=A0=C2=A0 kernel/sched/core.c: In function
> '__do_trace_set_current_state':=20
> =C2=A0
=20
> =C2=A0
> > =C2=A0
> > > =C2=A0> > > kernel/sched/core.c:503:9: error: implicit declaration of=
=20
> > > > > > function '__do_trace_sched_set_state_tp'; did you mean=20
> > > > > > 'trace_sched_set_state_tp'?=20
> > > > > > [-Werror=3Dimplicit-function-declaration]=20
> > > =C2=A0
> > =C2=A0
> =C2=A0
=20
> =C2=A0> =C2=A0=C2=A0=C2=A0=C2=A0 503 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 __do_trace_sched_set_state_tp(current,=20
> > current->__state, state_value);=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 trace_sched_set_state_tp=20
> > =C2=A0=C2=A0 cc1: some warnings being treated as errors=20
> >=20
> >=20
> > vim +503 kernel/sched/core.c=20
> >=20
> > =C2=A0=C2=A0 496=20
> > =C2=A0=C2=A0 497 /*=20
> > =C2=A0=C2=A0 498 * Do not call this function directly since it won't ch=
eck if
> > the tp is enabled.=20
> > =C2=A0=C2=A0 499 * Call the helper macro trace_set_current_state instea=
d.=20
> > =C2=A0=C2=A0 500 */=20
> > =C2=A0=C2=A0 501 void __do_trace_set_current_state(int state_value)=20
> > =C2=A0=C2=A0 502 {=20
> > =C2=A0> 503 __do_trace_sched_set_state_tp(current, current->__state,=20
> > state_value);=20
> > =C2=A0=C2=A0 504 }=20
> > =C2=A0=C2=A0 505 EXPORT_SYMBOL(__do_trace_set_current_state);=20
> > =C2=A0=C2=A0 506=20
> =C2=A0
=20
I honestly don't get why this build failed. The function __do_trace_
exists since cff6d93eab00ba ("tracepoint: Reduce duplication of
__DO_TRACE_CALL"), a while before that it was just a macro and not an
inline function, reason why no one so far used it directly.

Both failed builds are based on 4dc1d1bec898 (where my patchset is
based) and there __do_trace_ does exist.

Unless there's a strong opinion not to use it although the compiler
allows it, I'd consider the two kernel robot results false negatives.

Or am I missing something?

