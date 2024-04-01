Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1F24F207
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711995853; cv=none; b=GTkuDHk5UVerw3puDrcmZTlImTFFDssn4MWrt2w1ZmF8uMQ1SVS0Xx8idVXJm4lfiTo96ly/R/dIg68UDJ927VUFDIEZ8J1fxUZYLdniEz2h5JuWAiln23qBUWTXPR4jthP3p7/c8U3r4n/+QZ2dNWCi6I01KxGm/1g+OXYqLiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711995853; c=relaxed/simple;
	bh=VlOlr81PXeLDUuYg/G88XkYojAiaYYqtMkK7kS6gypI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOjNW35EebKsTvdEluDz+gJ/vZObv2s1uj0kNdEJ0GuimzYocPkSheomLW0/HwlFe1kQhsqP50mcbGNF4GhR+ehqFv72uO6iu4hRtxW4kAeiFBZxVDth5HZMaGUlMEKQCAJA+vVme4vX8pPXcgdssMNv0CqVNnFalsCD3wd2VfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=A9hiBuRQ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="A9hiBuRQ"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6145a4c79cfso30200967b3.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Apr 2024 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711995850; x=1712600650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggC3VfRcH4Dh7rRxfcIwltySqVw8/D59HTGGDhYunJ0=;
        b=A9hiBuRQIMbAl/lg+Q19Zx6aEHK/X7GJhR+YtYCNLgdfm/49Yuj9tMHvp0f6ECajlH
         m8LYiEHy+d2/UnqkiuQ1JfJ7uUZnfEEMq88XNdrpXyITP0FsHVSZ70kmA0a4iuxJmvPs
         oaqhXalJLQITHo4w5L/scWMzDMWDIMOGRYFBB5xRLGRSj/WHcPJTdoo5Fu1vIu1UowZS
         KWSJPdpXXDhksFylc7BKS5U+I9q7XdD1NTh4wxv/MypT6EppLmJd+W4NY++moz+YvHFn
         x+pFEbGXwI4AbQW36JqzeFqXKxxa2ja80q0WEbUKcvH9Qc8qRUy3k71HuO8nyPAgijNF
         c3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711995850; x=1712600650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggC3VfRcH4Dh7rRxfcIwltySqVw8/D59HTGGDhYunJ0=;
        b=ZH63IAeIwKxPibXHX2+UanADb5q0zNT6FZMMObkg7u++dhMoUq88Vnis81mPw07sxv
         23191N9Xml94YEQ8onpLEjUz3mEl3FHQBcGUM5fGKovDLcUMlIGscVa4GakOg1uxwsHC
         bV7ZY2mJaxmw6HXgX0dLm6vvS3Lp+1ZXdOMtffPdmbDko8+9TPFUy8PPipAWZpofkpEQ
         79c5yX6BkIfJM9GBnR6DEahR7nntGgYMo9tyctrRUd8lqKtJyiq0YVqIcF/Mwqv8x9OV
         qK5fNzQx/cKHYhDjgpoZtQsffdiLIKvDS7bjD8QKjgxtxyjCdTP4HOblwxP6zLjpYTrO
         UIdA==
X-Forwarded-Encrypted: i=1; AJvYcCUSxTbZoU6xOGtgOzSfgWIMiHoqOJJFskAXFRW6aKkNvA/BJrXt/0JsdGkl91Na6v74wwBYLdIVOowvU14yPdjeooxQWpNWTF1QNRrSjA==
X-Gm-Message-State: AOJu0Yw66oXvWVB0svo0A/KZUFXI0U2a+mc/R+9uutHkcqPANUesHS+D
	PVtW4DQMBryy9OckXJjqP86QxpE9pNy90TeEGAwh4Hy5JIdK6PSj2E75lDcAwmWKsWTosJdsRKm
	G+RybDBJWOFSoj6slYbLyYp/GSEQJUlvmcl6MHw==
X-Google-Smtp-Source: AGHT+IFJ/RfIGjv3hy1+rwmas1mR0661PENKvwhF636/Bvx/OtPbjglGmNa/guajVvuU2mVb2p8dDyyIfpJKumt8MHA=
X-Received: by 2002:a5b:589:0:b0:dcf:9019:a2fe with SMTP id
 l9-20020a5b0589000000b00dcf9019a2femr7450581ybp.64.1711995850038; Mon, 01 Apr
 2024 11:24:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403311952.oxw8fSed-lkp@intel.com> <20240401112012.58634114b0e76e062fad7bc0@linux-foundation.org>
In-Reply-To: <20240401112012.58634114b0e76e062fad7bc0@linux-foundation.org>
From: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Date: Mon, 1 Apr 2024 11:23:59 -0700
Message-ID: <CAKPbEqqpXc7K11u087wYFux1ij5PnEhwNYk+EpMyUWFMUSKpCQ@mail.gmail.com>
Subject: Re: [External] Re: [akpm-mm:mm-unstable 262/270] vmscan.c:(.text+0x2c90):
 multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:fair.c:(.text+0x1db4):
 first defined here
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, "Huang, Ying" <ying.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you. I'm trying to figure out the problem. Will send a V10 to fix thi=
s.

On Mon, Apr 1, 2024 at 11:20=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> OK, thanks.  I'll drop
>
>         Patch series "Improved Memory Tier Creation for CPUless NUMA Node=
s", v9.
>
> and shall await a v10.
>


--=20
Best regards,
Ho-Ren (Jack) Chuang
=E8=8E=8A=E8=B3=80=E4=BB=BB
