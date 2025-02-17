Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0693218DB1F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 06:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739775394; cv=none; b=Ii2ahljpNkkQsw5k7EL3e6FqGE3KFLxy2llVbDxhZYSCKVQIf4eYMRulLN3vBPEBko6n3nvQIixta85Z1Yg3wS1JlCg+MOwmxGCzWDawJIQQ9FC4Mbw1E1JyRqj+fhjasPmlspXOtzb8P4lBOj9GaSIB/1FllUMH1AacGy412yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739775394; c=relaxed/simple;
	bh=UAjwm8ZUmY9NHxBX1wqkn0W4bWD5dQPw7sKcOk9oW2U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZtmTnTUFc4PPsdLd42kz7uEgLJOFgv6jwxFcx8QoyAh6tjTjotqrVtzLhI2ywVFUm5JkJtwUiEq3YeRnzVr3rxKy4TUOcWbD2ESO9c3Ydc8BQjNYpfzqZMZtMWlj3yWLMCcXmV7zhlWaMJNTSaNBKDk9Q6FFA3WqyuaeOgm5ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FuGrcCNf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FuGrcCNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739775391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UAjwm8ZUmY9NHxBX1wqkn0W4bWD5dQPw7sKcOk9oW2U=;
	b=FuGrcCNfPVmJ75YQJf29UkBf0whRXkeWYlNZoyNQ35az2O5cpAJgSLTLuynvC7shb1wTbF
	kfRhBkroa+qMZiahA43tftpW4CCxvLzuBRjVX+tclEyav8Rw46frNaZXqbM0Ztj6wHK+Ff
	1XjgGy/UkuRnJubmgnG8ey4dq0jkcAY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-9iZCP2IGMc-ifSw2YNLYwQ-1; Mon, 17 Feb 2025 01:56:28 -0500
X-MC-Unique: 9iZCP2IGMc-ifSw2YNLYwQ-1
X-Mimecast-MFC-AGG-ID: 9iZCP2IGMc-ifSw2YNLYwQ_1739775387
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-439385b08d1so33446515e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 22:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739775387; x=1740380187;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAjwm8ZUmY9NHxBX1wqkn0W4bWD5dQPw7sKcOk9oW2U=;
        b=uXh/pFaPy2sHWWa8SCj7vQdtpnGjecNB9VWtoa0vUO1Vk4J0/skRk5lwhmkRPQg1VC
         MYlFeQjLSgZaZBr6mY9/qCAAjlzDkIINYJ0XkqlOuNw2lL86EY7mIgMQveBJ4gXVqxNu
         WA6PEl2pwIId4pg1aQI+IR5CMe/aA9+hxBTv0GNnT1Aj3osh/ZAydhdvNnze1vNG+ypN
         6E1+FMTq/vdHE2gooEbBDm4gYJbxKeXSPA8zlUfGXErFcHhkCd10U78x0Uy5gUfeTlOl
         ntHtCbpbI87FikwLVSjc4FBCCVAdqnpHQyhFpYkFWje6SUzCv9YL4ZVWn3Nf3DwGw3ZX
         O50g==
X-Gm-Message-State: AOJu0Yw9a9qn7GmKzC3sYQFkXJhRyZj7jdLmZ7moG9+qPIdxyH7ulFag
	NJwh951Rcd++uVkjjbbHncSbLcHqfNrlbjGnKP4pDhC6U2Zp/VZ/8xljrCIMkZlyDZjsfv0mptY
	LpqbONxXFiJC7y46lol7fd9GKXwwmmN9fZ5o5Ag1puWY3dQFa3XtB4f25yz8ZnA4=
X-Gm-Gg: ASbGncsdow5HV0x7Bfo5e6hm0fSB5FDo4UrtK4TgVdivigcJJkE+LddepwdXz3bk1xI
	JChVSZ3wHVKhtgpdnM1zuqENEenMhm8msVsiuEHpcqSeuFLZAeGGVA7BS12+d9ML0OLSk62TW8V
	X9LCduWpHbr2yMz+jepgFE2PWXN0C99QbzyBEl/cjnC6RWevbkbxliydjrcJd7x6qBs6pGcP86+
	X1LP7UFNmYGdleJZ8xKLwkl0sDjFql2Mz9Cp2Iu0oD+Q9IVhYeJHqCR2m/WbwHKLjMTPKAqXfc2
	JxhV7lABwMJ0hQNuxpSmJuid9cYjJtw=
X-Received: by 2002:a05:600c:4ec9:b0:439:5506:7183 with SMTP id 5b1f17b1804b1-4396e6a6e31mr75901475e9.7.1739775386963;
        Sun, 16 Feb 2025 22:56:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk3NBZALdJoBEHy/OW1hnkv7UynhyXmZFDFCyRcaZfKjwzBNYuS2O/oEr1D7pZAVFTavR1tg==
X-Received: by 2002:a05:600c:4ec9:b0:439:5506:7183 with SMTP id 5b1f17b1804b1-4396e6a6e31mr75901285e9.7.1739775386528;
        Sun, 16 Feb 2025 22:56:26 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395cf084d5sm98968555e9.1.2025.02.16.22.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:56:26 -0800 (PST)
Message-ID: <c5fe1f637a84087afb94ed3f9255810ef3975724.camel@redhat.com>
Subject: Re: [PATCH v2 04/11] rv: Add option for nested monitors and include
 sched
From: Gabriele Monaco <gmonaco@redhat.com>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, Steven
 Rostedt <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@redhat.com>, Juri
 Lelli	 <juri.lelli@redhat.com>
Date: Mon, 17 Feb 2025 07:56:23 +0100
In-Reply-To: <202502170630.xSYE4cUk-lkp@intel.com>
References: <20250213090819.419470-5-gmonaco@redhat.com>
	 <202502170630.xSYE4cUk-lkp@intel.com>
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
X-Mimecast-MFC-PROC-ID: 4nXcqtjmG8Z3CwhaxZXUjzxRt3tw9DXZKzaNjp2eGMw_1739775387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-02-17 at 06:39 +0800, kernel test robot wrote:
> Hi Gabriele,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 4dc1d1bec89864d8076e5ab314f86f46442bfb02]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/tracing-Fi=
x-DECLARE_TRACE_CONDITION/20250213-171642
> base:=C2=A0=C2=A0 4dc1d1bec89864d8076e5ab314f86f46442bfb02
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20250213090819.419470-5-gmonaco%40redhat.com
> patch subject: [PATCH v2 04/11] rv: Add option for nested monitors
> and include sched
> config: parisc-randconfig-r112-20250217
> (https://download.01.org/0day-ci/archive/20250217/202502170630.xSYE4c
> Uk-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.2.0
> reproduce:
> (https://download.01.org/0day-ci/archive/20250217/202502170630.xSYE4c
> Uk-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202502170630.xSYE4cUk-lkp@intel.c=
om/
>=20
> All warnings (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 In file included from include/trace/define_trace.h:119,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from kernel/trace/rv/rv_trace.h:=
130,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from kernel/trace/rv/rv.c:148:
> > > include/trace/trace_events.h:477:13: warning:
> > > 'print_fmt_error_da_monitor' defined but not used [-Wunused-
> > > variable]
> =C2=A0=C2=A0=C2=A0=C2=A0 477 | static char print_fmt_##call[] =3D
> print;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~
> =C2=A0=C2=A0 kernel/trace/rv/./rv_trace.h:39:1: note: in expansion of mac=
ro
> 'DECLARE_EVENT_CLASS'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39 | DECLARE_EVENT_CLASS(error_da_monitor,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~
> > > include/trace/trace_events.h:477:13: warning:
> > > 'print_fmt_event_da_monitor' defined but not used [-Wunused-
> > > variable]
> =C2=A0=C2=A0=C2=A0=C2=A0 477 | static char print_fmt_##call[] =3D
> print;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~
> =C2=A0=C2=A0 kernel/trace/rv/./rv_trace.h:12:1: note: in expansion of mac=
ro
> 'DECLARE_EVENT_CLASS'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12 | DECLARE_EVENT_CLASS(event_da_monitor,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~
> > > include/trace/trace_events.h:223:37: warning:
> > > 'trace_event_type_funcs_error_da_monitor' defined but not used [-
> > > Wunused-variable]
> =C2=A0=C2=A0=C2=A0=C2=A0 223 | static struct trace_event_functions
> trace_event_type_funcs_##call =3D {=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ^~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 kernel/trace/rv/./rv_trace.h:39:1: note: in expansion of mac=
ro
> 'DECLARE_EVENT_CLASS'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39 | DECLARE_EVENT_CLASS(error_da_monitor,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~
> > > include/trace/trace_events.h:223:37: warning:
> > > 'trace_event_type_funcs_event_da_monitor' defined but not used [-
> > > Wunused-variable]
> =C2=A0=C2=A0=C2=A0=C2=A0 223 | static struct trace_event_functions
> trace_event_type_funcs_##call =3D {=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ^~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 kernel/trace/rv/./rv_trace.h:12:1: note: in expansion of mac=
ro
> 'DECLARE_EVENT_CLASS'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12 | DECLARE_EVENT_CLASS(event_da_monitor,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~
>=20

This is something hard to trigger, but I didn't remove the select
DA_MON_EVENTS_IMPLICIT in RV_MON_SCHED . As a result if the user
enables the sched monitor without any nested monitor (which is already
a broken configuration but happens if you apply this commit without the
following ones) trace event classes would be created with no event
using them.

I will send a V2 with the fix.

