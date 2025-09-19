Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6942FFDDB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758279643; cv=none; b=LWqtXQTKQ5bkZdZ3FQB+h4q4Hvi9xbF/crbVf30FZtAswzfNryQyqblcVY/RlIF+/sEAzh5ydD2ZvLjQjo5dretHsYU0r36QW39F8TyrgYCUsx033r3FQg3X68G1tdl4YU5oCilN9pYlggYxbjfadla9Yq6/nTYQj0p0lpJrQaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758279643; c=relaxed/simple;
	bh=803O1q3nJmNwEnJ0eVOOfvB5A5ny0SBSloh+zkYI6Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pC1F2i6mOKo1JvbCFLLKqhpL9y3khwlbSx5r4yWekL26QxikbzAxndbNrbx+uYIYVLC5MuTHVwnZj0G+lt7lUoO085afhqWQZNhysdzczrmq4HrlXXtvidH5Q+I7jerE18PCbCJnyL58c4vpZgIRZQMJ46Xu4n1pi6XHKsBMaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iicfRyye; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iicfRyye"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b7a8ceaad3so18304441cf.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758279641; x=1758884441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxSNVg4jPXGA+Rdup/zzB+BaOlzldW8RsQCH8Thuqv0=;
        b=iicfRyyelxdbz9df+lkZKf7wPSlfs/RFz3fLWEc1zT+KKVEzVVMFZGOaYJkeWl194N
         sQTnDcC7OSrsw1GM5Yg4hXviR4IJ69yV6ci7szjo6IfYMjy0NrnbdXF3E/2Dhl2nvKXA
         55Ml4fegcrQAMlrLDMJW2U8XIq5z8ShwhAPh7mcDzlZKUnDVoNRcc7dfEedtgdEmUJC3
         lWbfxIcp/sKIor3GW8OwM+0B6GEwwiDvp1AV/r/VRaqI2yUpiwvT6Vg91Mv9Bfog6r5i
         K/QWuTa1G2+a9R1RskaJu6fquJB4WXilmseq3/rVDOttbF6lGHJaODPOsvpNL1bk1psv
         EJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758279641; x=1758884441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxSNVg4jPXGA+Rdup/zzB+BaOlzldW8RsQCH8Thuqv0=;
        b=thAprJo0GAkcf/gzoYcOKtvd+MV5mECGM/jNJwzVotqxNTL8FybvhEIeGysZ0t+gBd
         vBkzptERmWU5p21YDwMWSN/1AxJxCvls7K6yCvf0Ge6JX4AUw59lFuWPpD5/0IxT7qOT
         V6wRXL0sSpv7JWk4VMMMO8z1KVJxJL78r5oLy+zwM3FQ4gOI5KhCJlN/vP4hExD5GqFn
         TY4CZ3BLJVr3p4q30CnbAhWwRaQX7BBGbsgb03JUnnPpYMDG0AhQQX3VyxeEMZdnL8Il
         He9IMVwBPLgmS1EPH9nPjXydTGGPxZRq3cZUivGs3nRHJv9Lu/kA6WipGmr6ejHUAnCU
         wwSw==
X-Forwarded-Encrypted: i=1; AJvYcCXAvqUC1VChOzVNJBDjmJxTh4RB868TosetN+9bOj8wv7wJ8K7sebY948pYfE0bPClokQ3rJXsXiUm1okiW@lists.linux.dev
X-Gm-Message-State: AOJu0YwiARIV18AELD3NxqGBYPIk9keL3U1nhWfhTkexQAuim4f2frEi
	YSMztwLl5MPiHouVTHZvFwFgdaK+iMvjPpu3osZtKotn0cRd+69upytTH4LoCAHu/zmFwmUyjf2
	VKBBBOnbcVW4NqG1Eqt+z0CSIm53ozitjbMFh2dpz
X-Gm-Gg: ASbGnctBg89pWKoh7Yn5D4nzRFnz3GoTGwDXD39VijFO+g7/lNKJtU83U06/Yyc6dFy
	DceZGdr4LvJpUHzvPNaN23xtalHqlwIAPeOFtM6u/XPZhwg5NqVK+q9TC7cjb1ARfnZ5FMUep5d
	RT3zzOtrkl+9QcsrBAh/f6lEZGhKOIkwLpJOsLPn6SjW95DS4f6qlbEQPy3NtNTcjJKSFTB3URJ
	TO2dA==
X-Google-Smtp-Source: AGHT+IF2reMFk++hNVQtYtc0bIdPcfWiXwD0EU0fwgyj3cejB40NBcLz41GyRKMkii9zzss3WeJEtKrOQx2MX/Cji4k=
X-Received: by 2002:ac8:570f:0:b0:4b5:e6a7:304a with SMTP id
 d75a77b69052e-4c06e7cde40mr29850201cf.22.1758279640369; Fri, 19 Sep 2025
 04:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918155532.751173-4-edumazet@google.com> <202509191711.gDaSokkJ-lkp@intel.com>
In-Reply-To: <202509191711.gDaSokkJ-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 19 Sep 2025 04:00:29 -0700
X-Gm-Features: AS18NWCWjUkb5moSf9QpEIxwAisqsl5A0nzCKgyJNySSI2fgU4h2hVLwa-WEP4A
Message-ID: <CANn89iLGOppxi1JqVXdjpXpMB44akvVU7fj-CTP5e4RPABzt0Q@mail.gmail.com>
Subject: Re: [PATCH net-next 3/7] tcp: move tcp->rcv_tstamp to
 tcp_sock_write_txrx group
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 3:10=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-m=
ove-sk_uid-and-sk_protocol-to-sock_read_tx/20250919-000602
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250918155532.751173-4-edumazet=
%40google.com
> patch subject: [PATCH net-next 3/7] tcp: move tcp->rcv_tstamp to tcp_sock=
_write_txrx group
> config: powerpc-ge_imp3a_defconfig (https://download.01.org/0day-ci/archi=
ve/20250919/202509191711.gDaSokkJ-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250919/202509191711.gDaSokkJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509191711.gDaSokkJ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):

Yeah, I think I will remove these CACHELINE_ASSERT_GROUP_SIZE() which
are hard to maintain and bring little value.
