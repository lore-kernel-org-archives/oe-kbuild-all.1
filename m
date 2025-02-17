Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC244223711
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802638; cv=none; b=UQJtLFfSITf9xauIcBsARMqoRxsrNujhkw38CykWBXtzlTJoF9UqT0ryb8SQsSFcTbwFc3+qPMPAb7hJJD5RKWJ8xRXP/RNCX5unv5SzIsdxbhOXSCVkZdrGTMGAxPZLMZfrk1TuPCZ6M9gnZLhNyfMipUcV6gx44wZMfNqGAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802638; c=relaxed/simple;
	bh=sY+CA8clNRQT+8d3rmvYViciBC154ua4aCipVJOVrQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kO/BJf8ZOoYfXGYuRR1hcsYUDHgIwTok4UvmET8evK3wqvnxrlCgLFN4wSdYBlzadkfkkj6tEiYXTIb0RzPmJdI715C03/LDAYZTQjOpNXLjB5vmP7t6dx6tv8VKvAz4zVeXdfNmEJP93pyXYCdqlu3de1wub0rmvaZ5A2X1sBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZh48VXa; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZh48VXa"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e49a10f5so4713727e87.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739802635; x=1740407435; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY+CA8clNRQT+8d3rmvYViciBC154ua4aCipVJOVrQ8=;
        b=QZh48VXabPrFRMnrsqnmGCuKz3HA+pSnY7fVJylQcCuHU7VfG7CsPC05a/qXvQNRuU
         WAzeCnRGeHZDnvVaE23FNLsN0k+b0+ZzGZVnd9fUsaR0pmkgn+LuXQGTOrF/cQJejt9c
         g8Zuq8LLSFmlE8zLm3/kZye4I8MudRPmOn2b62X7eUU1j7epP7pQ9VvbK5nGEJVzoTcI
         JK4xatzvdCPPFKtf28YBS0uJRpLTAJCI+zOvgWbE4ytPXvHm2E/dxdkhQxIt7LDQJCVT
         5n3NRPICGM00wuCclNxQ2vc1mfl8zowVlZJS7fnr7aau74RROv6PI970tXaD+2bwKKdF
         63Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802635; x=1740407435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY+CA8clNRQT+8d3rmvYViciBC154ua4aCipVJOVrQ8=;
        b=KH92oaBt5TtsVUEhSQczxDjA7qn7doQpdtwEbYiL4irNoDaStbApjKLpHlghPTE9Sr
         4ULvwnnQmQPUEGQBpIdpr6apUvI/1tayYGxT1F9T9kgVdJICPWrTcMvWicmgyGhAnJzs
         3ix0b8HXCbGEJ2VuNJfP7ZUvVHxmJsex2jt5P+sa4IbS4e2AZYF6EdUSGakeMarQ8gr9
         H5LcOIAREh9MvLRuL7UouPWhcxJmIMsZQ3AAujKrJxifk3eGCT9hd4BTGaWYWcTyPf0k
         gbmAoUm0W5ZOcOWaPh5VaUWWicy47/D34Np5/LfBQD/Yt8somFjhhkFUdI0Bde3t9tPu
         xVUw==
X-Forwarded-Encrypted: i=1; AJvYcCXoveRFRdksUreBb76j9FBWfJrPWGlxxw5akGwYPPaLukqPPs0cc+I/0yxbYBflDFOg34QEJfawnoysVsQx@lists.linux.dev
X-Gm-Message-State: AOJu0YyidESiI48L6riOJLvxr5xK+rhvDwRpFLE51lm4uAmbv026/4jY
	m8UKk5DpjmU6NI2y1FDYZHscQlxcrdqKM2jkN10JyrAS/N1GmXUW5FAWRxM2qcVjUzU27DrZJTQ
	dwv4XBZ09l6jvOu/I3M446+w2Wc0=
X-Gm-Gg: ASbGnct24IpNfUReWRzjaNAaJYW4hr0Wop5WqLnePcXd0G81MmmFtY33HwWergzpyCZ
	yhQwuk1xNqNZY4PMpiJzL0/MJWtRxQX44O7HC0ZicMpG02CcVbK+iQrKbsR2lv5zqef8c4UTMSe
	suspdK6CLTG1Fb8gDpdVVcVRVD2pCopPw=
X-Google-Smtp-Source: AGHT+IFO026JFAoJlQESSwcdgxRJMbNRj6JcB1YuS4pFIcRjR6IQAVsiaDlUlmG8KabgDlbneF72bHJSl1+962Y2SQg=
X-Received: by 2002:a05:6512:10c5:b0:545:576:cbd2 with SMTP id
 2adb3069b0e04-5452fe27304mr2917774e87.10.1739802634481; Mon, 17 Feb 2025
 06:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214-scanf-kunit-convert-v8-3-5ea50f95f83c@gmail.com>
 <202502160245.KUrryBJR-lkp@intel.com> <CAJ-ks9kkigKG=Nf_mZrA5CA=SUV2sSyY51_rLef42T+ZxCmk1Q@mail.gmail.com>
 <Z7JI-YtgZzmOtMDK@smile.fi.intel.com>
In-Reply-To: <Z7JI-YtgZzmOtMDK@smile.fi.intel.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 17 Feb 2025 09:29:58 -0500
X-Gm-Features: AWEUYZkuvaFnvabs_GywBbkuo44d94Kql-DWL2E60D-MWBZySmrPMuLFMaMbzos
Message-ID: <CAJ-ks9mjWOCjMOK+ktLdN0XJmRgT57CoHf_aCDLMOX6-mnKVwA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] scanf: convert self-test to KUnit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, David Gow <davidgow@google.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 3:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Please, when reply, remove boielrplate stuff!
> I have just wasted a couple of minutes to understand what's going on in t=
he
> message that is 2700 lines of text as the reply to the bot message which =
was
> ~700 lines.

My apologies. I forgot what a mess a mobile email client makes.
