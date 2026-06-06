Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED542E736D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779035; cv=pass; b=ZM8JL+cAQkR5Yw/OW6WKssQv1k+tAEWXkbejJW9k2kb7pJckd6ZvvdmF5qwsi1Bvt5Hphi+yfOuV8foIQVm0YNkf1VCbI3bJanIp1QgFxsL/UtPy5lJx3NRd8wH3MUqoLsZOg8/glN2TUau1TvJJ4WLKJh9mCKR/pqaGdVF1U0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779035; c=relaxed/simple;
	bh=y4hoeiC3aiBjcHuCFz3vWzDpKS1x/IhmXPYHGGdYl5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0Z/27LHhraepgCzXF8Uvaw1aYaspKaCVnDcniPz6b450KWx2PawXZcYkkisKu1R6YOOKb9HUpuhR+DCipREGQla39uaSdjkaOp3lcfkqAn1M6Zm6vY/StQW4G8X6RX+xDMGHssmJ4/TZQVUD4sWKZ13L62R+cnPIEvXs9IiXqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RV+C9mLb; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RV+C9mLb"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-137bd9ed2b1so1518664c88.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Jun 2026 13:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780779033; cv=none;
        d=google.com; s=arc-20240605;
        b=UA1GcwXjUPKwJXfLwVXOaRBvcUf+Efi+hmuYam7uc9X7rJNx738uHWoqpX4xA4muh2
         EGr6J9yqEMyTUqrPndmAtkqCfXzSlcfQ2hGZ2tjttNK48YxcLWHX+ByvdKin85jJLax1
         4KNiLRJTdipopA6QG4XKuHMCX3FAE5k7p1WopSJE77PuhaTHymJMn6FzG27aFVwlxCfe
         maSBqU1kwyRcmoF3lkaO7JZe8Yz3Ng8oWlolu8mZ54cqpjwXb7CzpL+UEw220QJhdKrL
         +wnRk8yZOtUdRjPZHJuhHWmovaPkMA82A1k1XTPUQLzZh/kyEmMmD9b0fE82WtIKrNr/
         NeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l6KNI83Gkn2cNA7zkcJPFtGn/pTseYG2KRO5jfoDb9Q=;
        fh=ZaOaTrU93nMuquCNPCIINI9UOOGAkxYk9uhKQlDQUdE=;
        b=QDzlJvf10GgKx1xb8WCNQmUblwhTKm4nv75XCugcX+I76G4GN47FEb8H+Z9YJ4BfIg
         T8Blzgy3CEVfBtuajiGgVq4PbCIRPaWP/zp1oJz6Vn9CJ0NCGaMDDDrxIwHZt0PvOXFR
         nBogJSibrZvjEZcfyJLORsvxZH1owxelmMYrzsujlfXm7Mwh8AcUtE0Vk8wid8hBIO+c
         9yXwRDZVmYo2qyyfO3cKp9lU/fFjplSA/ebZUyQlJggG3kpYpwyhofWSIeZAWzoldtRL
         wcQXghQT1EC/zrGKMLYFDSFQq2JfPn7dJGtx9AJ60F7ZnAGZQFCnZM4+oNo6j8+K+y0p
         ZTOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780779033; x=1781383833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6KNI83Gkn2cNA7zkcJPFtGn/pTseYG2KRO5jfoDb9Q=;
        b=RV+C9mLbpmQoKV9RW2MrjX3Vvb+kxdvzj8fc5HJw362kdOvERVgOsHOuDQzQqpej7T
         J93VRxs1m4VRxK5Iox5oayykNVWNuhzwN/ke6ZZ/zMYW9yGHKHWQBf+KDu73gVbE1mnU
         93N+Xgk474l7SHTbesyEisrik5QplyEHk2fIAtS2NJzt69UFa1Fdy0g5cpN4hcq4eqRX
         jE6yRjWKwPDeKdUcgeqWvvf/lyBXdTHxNxy2fif4RaHi7zwDldb4lhvcK42/9UmcPchE
         gpgWmXdBbg3UPutbIc9KuqXiJERS5F8WvnxuOPRtVZwHf+KGoONJrK8h72KyaE/GVkwe
         Ur1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779033; x=1781383833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6KNI83Gkn2cNA7zkcJPFtGn/pTseYG2KRO5jfoDb9Q=;
        b=k1YWpS1qBfxEJQB3BD3rdwzvK7H6Acm48jqJQ5yhexPiNVAkJZ+Ec5m5d2mKmEtNVn
         YMzs9AleaCaqnzJ2kzoiWLNFzTvEqSygJIKivbVPiGdsjEnJkNMWuCz/DN2R5w6csGdP
         31FYPzYwlArgY2Q3ZITr42YbHh7lgBgOptr6ktHHO/cLyo6vsvy4e2SgQrwfiF9Zerqv
         nxkgkWHXk7QIbgen3aeVBakZklVyVr5UAA+wdMN66NLl68aB8Ukggkc1a1Ccp5TZsxG6
         Yv62hzrD+8JU63GJLvN7KjkLQNjqupiCgs4AWdX2pzbhfpG64nBYRlMiV1nrikndhCQG
         n6mQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qgtXKhhmim8v1XVUjYHfS/LzrsuFNURcFp7gJbqS+KcfICat4S1itaQPtVoUewajrKtcd+xFk7gvbyO/P@lists.linux.dev
X-Gm-Message-State: AOJu0YwACNLfWIXB2d5wnZmwGPahprBt7sJzEcMj/smmHSBtxNo0DU4M
	sVPvqEHXNVffhRI7xajHny7vuQUNE40bA1AblVVZNXVukWvjS+A3plaaOIwJRjy4wVmnJkbKP74
	U8d+hAThfLpQorzmRtOCcxLUNRIXdKrv8g65W7SCJ
X-Gm-Gg: Acq92OGDbMSFmawo+CGKDwev2ncWGirj2Q/s8XgbVk4GYg5CsBAYqbB6hD9tMICVB9z
	4Q1zcO6i/9hcjc/E2ArqJs3ZHVYakXvUwSqSwHPFuwSz3Ht11ssOuh0iLWhCLS9cjWviXTGM9eq
	cp2z7HVnNkfD7i8awD50iJI1HlumU0C8qhWeuZEFT8Wb8yXuJtHDquHzJIgUn556UgFTM/GpU63
	06Pg3v6U7NGGQBkKWksFzublofQVgdqhvA0tadsJK0odlst5BMdqSNyB7hmgLcLxbxF0AQZxFeE
	zSFM76xLWjIdSZvUDz7PJHBDqpQex4kR2GqIUg3fahiOsdhMFmUh94uUU8wMm3J2c/Iwn0qsgd7
	8cBnGbKVRhp1udzSh7JTJffz+kUHRYFaqrF0QKJKO+O+UUo6ancxGmok+tPuiCLs=
X-Received: by 2002:a05:7022:1005:b0:134:df7f:910d with SMTP id
 a92af1059eb24-138066bad62mr5040556c88.7.1780779032244; Sat, 06 Jun 2026
 13:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606070019.yx2LhZPU-lkp@intel.com>
In-Reply-To: <202606070019.yx2LhZPU-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 6 Jun 2026 13:50:21 -0700
X-Gm-Features: AVVi8CfwL0bUdm6wKFmYKk6rFVapxyQHb1MebnOiIlJS36ggr2MFTiRAuTgikxA
Message-ID: <CAAVpQUDU8Ej2Aa0kLLgU=r=gyESa43s5YAVQOqYehzxn-85adw@mail.gmail.com>
Subject: Re: [linux-next:master 10754/11755] drivers/net/geneve.c:778:12:
 error: no member named 'local_ip6' in 'struct udp_port_cfg'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 9:05=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
> commit: afabbb56a7262979a75259e2710019aa8ced3e8a [10754/11755] geneve: In=
troduce IFLA_GENEVE_LOCAL and IFLA_GENEVE_LOCAL6.
> config: hexagon-randconfig-001-20260606 (https://download.01.org/0day-ci/=
archive/20260607/202606070019.yx2LhZPU-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260607/202606070019.yx2LhZPU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606070019.yx2LhZPU-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/net/geneve.c:778:12: error: no member named 'local_ip6' in 'st=
ruct udp_port_cfg'
>      778 |                 udp_conf.local_ip6 =3D info->key.u.ipv6.src;
>          |                 ~~~~~~~~ ^
>    1 error generated.

My bad, posted the fix.
https://lore.kernel.org/netdev/20260606204848.1987046-1-kuniyu@google.com/T=
/#u

Thanks
