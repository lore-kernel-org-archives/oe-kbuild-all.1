Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298A12FF98
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 19:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294169; cv=none; b=I8vBsSprDUsMhJFRYz3ogXmenP0NC5J/kBfiMbDcx15SbEl9FAMqTqPmJP6a+cKsCwnvaPIHrOev+S/OC4OvQ6S8/JQyRFJFUUIktRgO+YBvXQJ58LkQSdtHIGuO2U1gKHc1IRl/oz8oIMkRVllwMfUvkb2Cg9g+zDIQp+rgsf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294169; c=relaxed/simple;
	bh=0F1xP+x3OHpmjK9w8oDOcCx/3NpPQZRN7mTKPdoau3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mu+9llI820kKnVnD2ePEu2gsmYVs+4igq4UYcpYTY6N28LdMxGUdiMKz3vLx5s9NQopZ3eD49y1oacI82kC+IuG5vrbcXeFOaDqimLUHpJQTtOEOsFSAcOvzqvzteQxEStxPCE04SOg2+0wLwcsAWut9Bnciqvu1Q6xJCdNKG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EiC/V9/B; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EiC/V9/B"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e5174ffc2so2633a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 12:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713294166; x=1713898966; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oDUW4EeE2y3eu+7hg+U3G0Qvv1xPh4qHLJznsNFoiQ=;
        b=EiC/V9/B2e3EXezQS6ntSmvgGWYbZtuGC0qd0/TCxIuQg3OS2FENQj4+lBktK7oVhm
         wVaeqttD9bD0CWT3U4WORAAuPI8blf6Ay8I4+YKSrLhEptsilILIy8NIn4jfp6xv2e6a
         QUnbZlSQtM4A4iFiEXNI72JdaM5fwiRo1Xk5RoiGb4VDay5TYed48pplwJai8rjtJgNi
         bkM5z1PRtac/hLNRJ9oG17lZsIP6ecTTKObW7q2NEE+fJlOPKHCMiuuNEyjChrf8JFa6
         fjADv7YVMXT+0A/92yGWMuztOmdAkgz9KxehqjZAiyiI6+zTLi5MqrME7EeoP70yNjcg
         ICOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294166; x=1713898966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oDUW4EeE2y3eu+7hg+U3G0Qvv1xPh4qHLJznsNFoiQ=;
        b=PxNDIOecdbwhuvhlB6Wf1VDK57aqFJJvgXcMlOY2zQ9OK4A57GfWEweVLrmn8YEq0B
         jnbs1bgA2zf8o0p4wRYQIksKgzqiHmbtszZB/KfKThG825089asPEEeD5/L9APyaHC2o
         PCENf83hcKEKDfQqF8LelpmumlLdU8CZn0lZ9ILv7XoYroNIa5aRiJKSTDGv5yU3wxTh
         AUKuUm+VcPCGbnRb8jW/TsT2PM7tIlB/SDmdSltNH2w2Hn822AbU0YRlGCVR3ukWAqJD
         LO1a0/l5f9qCBe0bX8w3yxJX3+BioIcxo4ICuN0nil+PWTfLLcJbPeS87n3S7NXyo8FP
         VlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZAPzeoiRZE/Bb5V8UBDhUftqYxoXOL60OeVit0vhn6vKqrs2IQwnw9JQ94RraokgMiIl0kdlAyS+iozomXo4GzXjlhqOBGcBmJGp+NA==
X-Gm-Message-State: AOJu0YxPkOnwGFw0fJfUhiGqamGOehvQ9BiLHfGAbbIMV+YCwJMSNlLS
	9qoFu1Msg2zLdA9Aqzy4kTWNcwtEj6UOkaiaFulAJ9kx3+U7v/X68Q5HRKrYwW5oxWJQLQpaArd
	UafJ8aVceaW//BBJZr1Y2lnK6fvprf7303lWFZ4WFRYEj7C6v32mq
X-Google-Smtp-Source: AGHT+IHYMcrDT1eTfVxvHodCk6Yora72MtXDdoyo6Y6bPBcREeOXinjXeyprZ5qUX8cVpwMb1MCbnFNg/FZgdvirOGY=
X-Received: by 2002:a05:6402:352:b0:570:fa4:97d6 with SMTP id
 r18-20020a056402035200b005700fa497d6mr38389edw.0.1713294166126; Tue, 16 Apr
 2024 12:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404161023.K0EsnDmF-lkp@intel.com> <20240416114439.038054b9c33986a13f4757c7@linux-foundation.org>
In-Reply-To: <20240416114439.038054b9c33986a13f4757c7@linux-foundation.org>
From: Edward Liaw <edliaw@google.com>
Date: Tue, 16 Apr 2024 12:02:18 -0700
Message-ID: <CAG4es9VxQSH=fUVSz0Op--sJhQbCJ_fLYyZB-tYuoCeYEoyxMA@mail.gmail.com>
Subject: Re: [linux-next:master 5507/6266] ../kselftest_harness.h:1167:9:
 warning: ignoring return value of 'asprintf' declared with attribute 'warn_unused_result'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <yujie.liu@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 11:44=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> Thanks.  How does this look?
>
> --- a/tools/testing/selftests/kselftest_harness.h~selftests-harness-remov=
e-use-of-line_max-fix-fix
> +++ a/tools/testing/selftests/kselftest_harness.h
> @@ -1163,8 +1163,12 @@ void __run_test(struct __fixture_metadat
>         t->trigger =3D 0;
>         memset(t->results->reason, 0, sizeof(t->results->reason));
>
> -       asprintf(&test_name, "%s%s%s.%s", f->name,
> -                variant->name[0] ? "." : "", variant->name, t->name);
> +       if (asprintf(&test_name, "%s%s%s.%s", f->name,
> +               variant->name[0] ? "." : "", variant->name, t->name) =3D=
=3D -1) {
> +               ksft_print_msg("ERROR ALLOCATING MEMORY\n");
> +               t->exit_code =3D KSFT_FAIL;
> +               _exit(t->exit_code);
> +       }
>
>         ksft_print_msg(" RUN           %s ...\n", test_name);
>
> _
>

Thanks for fixing this, that looks good to me.

Reviewed-by: Edward Liaw <edliaw@google.com>
