Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA99D44105E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081791; cv=pass; b=bRH3H0INMGyS/5N2vNit2VkQh1WDcBDfNf3fVQ2JM4/w6QmdLpHKyvx1+J8UNm81tJXJNpVMx6GkCUxOkNw3VydeOd06EoCktc3zSYOlFy3QyyOj6QbfJqvFbVJDjgl3IZ0mugw55f8bYIn800oDIENkeWCXab7RWVoSxIdqlJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081791; c=relaxed/simple;
	bh=WPXeToPvGOdvl3E4/r0gjYhCDTY3ajWkVoYIXpUlZog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHq5NFV9UlEPPei0QMFuTgYmuyVxZo+TnzbjB7PRYkM4mGwKviXFGD5aXaA/g8zxY9ZIVAokOxTeDE+muLhq9gzcAEmRaDQ93bO9k+wB9K/hAJ9RaqeHFoxpjG6ulfKCWAgFX963AMpuAZC/ST9EPME2zJ7FmSaRVDJVj7BP6TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L9xH+7xt; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L9xH+7xt"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso14647687c88.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 May 2026 08:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778081787; cv=none;
        d=google.com; s=arc-20240605;
        b=d686rmPwt1NCY26LzJawArG/FtN6Csk1mBhZDhXGSLqjZkI/mhAp8dbCBy1+z1Hk+3
         I0PuosAiV9eQDV8nBEiEtl+v39hXdc0d1owg2uxEbiXqSr1NNaLwVoa/A95q00D5dPxU
         tG0A6MZWEeYQo0C02FaE4J3qukFUkU3ihGied2L8d70P+AFmnjvHQKoAVXdaWyOqd7xL
         Rdmzs3EYWq+fopPks2rdRhmNg+83emZCmPC3wWvnHWseOhwHmvbBL9ooQQYqbjZEGDDX
         wy6bzoRMGSTqCeTBmOdt3lJHmXE6s9gFeNxLIGMe/8o4aCq6g4kl3KkrrdqHv39xgXy0
         3f5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRqphZiddg/bFzVWT2YTJ+EVB/SPKD5P+7tz6vlU6Vc=;
        fh=5IQLys1hMVU1yvRTg4Jzocv5oDA0ZMxUA/mxy6hP2js=;
        b=ARFKJiDc7i8rcadN/yrBGMV2Qz2avkGgb+2BxYtg7NRjTuk7/tNpTe6wxH5IaO/Rn7
         QRtrcoDWDQDFf4TYAVQKqwYf4N16wY/Kq0RWOh6AVbF6RRNDOzLaBSkhrK9KT3CPqMbA
         omn0jiKSrb61IaTSBqElYUw7/+8r/YHNJyAzWkfsJFGBrAhtb9P22IXHSBvkrlCifJwB
         8otQCocHt1LU5Fj1ifyEsDHZsXF3hGvgTjgcejSM7KQ98HDuSWOe6h0ue5uh45KYpJLq
         3DFfwVoIz/VbkNWPJKWmzG2VcHkdYHE3O+Qv2gFoedlV5W6mbak/EnsqTvm2LBRbjGU5
         KJTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778081787; x=1778686587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRqphZiddg/bFzVWT2YTJ+EVB/SPKD5P+7tz6vlU6Vc=;
        b=L9xH+7xt+/Wg1jGgZaQiE4p6+/4kbheTGWqvmcEHZKqEp4unGd8UgutUJtmIuhcxok
         TVCk+jrqxaqLYrLZWh3lQZpcffNXkDI66bavGCpVIMU9TBON62m3HLg65Vpxcpq4q26T
         NgpbfUSsf4+IcPucV9vpexanmVZC76nXVT6STpnHEY+f9CNHlmAifzKnZlsR1JxoiUB2
         wnrRG0BOVGlS2DXuPFPPxT9aAKKHlM6je73u+qs/PNJUmbLgZinPCG9gAK0hKG+C6D4D
         h4E2PRIgZzm/TV7wVultJNFtJenTcgQBNi6pRNRfw3H4lymZPlXa6eptRjHxedBWws7y
         HwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081787; x=1778686587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRqphZiddg/bFzVWT2YTJ+EVB/SPKD5P+7tz6vlU6Vc=;
        b=VmhTj6Qvdga55B3Ef0ZZNoP1ETtbf5L1XFHGI3XIlr2F9Kmxa/ZhcswXwjFFIaPQC7
         ws2ba2hc+j8zijYRqwX/KwmwnGHiQmg1pbSITdg5Sw8zC6W6OW/rl2XfFYnwh4GIcpDf
         FeH84xjMwXIwsxps5PFAxDkfrFdzXFiQxk2cA4j4QlLF0OmlfmH0fpzy289tUZ416AW+
         79FvS73IIHgu+zd4q9ZpUFI509iWpRv4JQ9g/xLfvSNbWfQzk6APRzSfLwRWwwH2rTsQ
         HvBq+YRxV7/gXX66Hbuqwzed7yvEdWM6ZI5SiVgnEZbLQvo9DMSG+O1+h9eOhOjNciQN
         LZ6A==
X-Gm-Message-State: AOJu0YyWW0bDSaxnY9IedMK9EgJtukoEIN9X850ED8Sd5+TDtz8Shjou
	Y53ZyzdQnSr8EKo/uijPZ0S8mCf/nlVkpdsZ/6KzA2PdTyW2AWBouFqSrw6/aL0pQpIglt1yiwV
	dVACywn1Q9yCYOPrFv2afgY+cKRwAhxTvR1jQYOUGWXVsOcqdoNluqywK
X-Gm-Gg: AeBDietVCFTcG/6vGCtgODNaNxALpax7a3wTsn7IRDfdn71jrWOL0P9M1SQqU6D0P57
	vmjPIl6JuMXE/1vRP+5qMgASL9Y5Pajp8+CFsGkCSMzSFmLv4cbdbGrs+HgmXYOJ/4GqTrlohhl
	vvFZAHjt+6AVvZModSC3Mhqpbi2hXvXzgoglXrrfZ6Ofpy2k0VzCHRdHzCt4urw6s7qSO6zQm8D
	Hzw+GRWZzHVkowSWnuWLfUCFfyKdaGNqtV6peae1XZJjPl+aJDOSesFjOPYvPrrgvZWbaaIHrPy
	GxdVvU/RGbyjgtD7VvWSkepoXGCWfruJEHvCDoh/sxcy6nHd8g5vFecHPNy90VTePrNLyKWbMef
	dnfR3TbD5Le/WLpLmbtuHAqR+NSe5S0CV6bRhqlBimUam2dOVuahqDcim2nbfwXO7WihlxSxNPg
	==
X-Received: by 2002:a05:7022:23a5:b0:12d:de3f:d848 with SMTP id
 a92af1059eb24-1319cf59ab9mr2120188c88.43.1778081786364; Wed, 06 May 2026
 08:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605062359.e3gOfZCr-lkp@intel.com>
In-Reply-To: <202605062359.e3gOfZCr-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 6 May 2026 08:36:13 -0700
X-Gm-Features: AVHnY4L377BUMB206YSk4P8NY88RQRfzGhLXLOCyk6MvAnhNujKTizdcitocrA0
Message-ID: <CAAVpQUDc33s0F15dAzoEvh2JSSgHpFF7NZ5nGQ1n30LcgTe2zw@mail.gmail.com>
Subject: Re: [linux-next:master 3495/3796] drivers/net/bareudp.c:288:12:
 sparse: sparse: incorrect type in assignment (different address spaces)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 8:28=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   735d2f48cadaa9a87e7c7601667878de70c771c5
> commit: bc773b15eb19ae3e27dd3a3377f2fe006ce5f382 [3495/3796] bareudp: Sto=
re struct sock in struct bareudp_dev.
> config: hexagon-randconfig-r131-20260506 (https://download.01.org/0day-ci=
/archive/20260506/202605062359.e3gOfZCr-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5=
bac06718f502014fade905512f1d26d578a18f3)
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260506/202605062359.e3gOfZCr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605062359.e3gOfZCr-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/net/bareudp.c:288:12: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct sock *sk @@     got =
struct sock [noderef] __rcu *sk @@
>    drivers/net/bareudp.c:288:12: sparse:     expected struct sock *sk
>    drivers/net/bareudp.c:288:12: sparse:     got struct sock [noderef] __=
rcu *sk
>    drivers/net/bareudp.c:623:20: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected restricted __be16 [usertype] po=
rt @@     got unsigned short @@
>    drivers/net/bareudp.c:623:20: sparse:     expected restricted __be16 [=
usertype] port
>    drivers/net/bareudp.c:623:20: sparse:     got unsigned short
>    drivers/net/bareudp.c:624:25: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected restricted __be16 [usertype] et=
hertype @@     got unsigned short @@
>    drivers/net/bareudp.c:624:25: sparse:     expected restricted __be16 [=
usertype] ethertype
>    drivers/net/bareudp.c:624:25: sparse:     got unsigned short
>
> vim +288 drivers/net/bareudp.c
>
>    283
>    284  static void bareudp_sock_release(struct bareudp_dev *bareudp)
>    285  {
>    286          struct sock *sk;
>    287
>  > 288          sk =3D bareudp->sk;

Will use rcu_dereference_protected() here.

Thanks


>    289          rcu_assign_pointer(bareudp->sk, NULL);
>    290          synchronize_net();
>    291          udp_tunnel_sock_release(sk);
>    292  }
>    293
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
