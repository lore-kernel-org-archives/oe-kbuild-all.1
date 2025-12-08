Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22121770A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765229472; cv=none; b=XFlNliqq8hdRDtYFB67qa9Ypwk4uF5YWgUd85i9GCe1iJpNXv88vX+Y+p7OcEb/G7yvb5fvp4bcdYBuRw0ebLRumMfZLBnlzLmYCg9jUmp3JbZELZSxXmFTRGuGl08vpqhSVStbuwKPb+xIwbdo4T/zu0nIaxJwbxJ1yxWXb7Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765229472; c=relaxed/simple;
	bh=HBUj1gkSo0Qyg6wTWfJbBSGVkMz49DiNNY7ezhs7MQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dfo6mH58il1iuI4U7vQ5CuR0KWDQOIT+/FbUXrP9BiWlaomesCSZGsKSwjTTEpK3DDLI0nLgpRKDQcypVNDimOe5RfvIhmJ8YhZFD1WM+XKV9zhXzQ6GEs2sl7mUys9DAA0kxjdMeQKsDlf252CrgrHiweUjGcrt537TvPpwaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kSx0X+Wr; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kSx0X+Wr"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee147baf7bso46321cf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Dec 2025 13:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765229470; x=1765834270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbkMTjdP41ZWpVnOfAvx7UHNDJQrnVEwvaxDiEcsLhk=;
        b=kSx0X+Wr/hGsQr2PPuw0rK4EHtPHQtGW1lAZNkkmTi4TX9zykWwg4pd6x7r/x7Sb1m
         5RVY6RLQlhCYXhKm7Xi9yecQaxNI4Bz/BzXoYznTqi0oGpxj2qH207kLDI0M6BQ7nlcX
         9mkWV5WYDa2JZIKMsFPgz8CfjT5nm5m/IivrcqMqTOHtFIHsy5YKhTgWQyoL5exN+cAn
         qTqP9TCAPNw0LZLHfZMZOOQRNEcP6kGDtrsChOJ/h+9+jiVYwtNX42RKPmKI4bnUoTRh
         9ntM+oQgpVU57gM9AMYrySrFEkTYZVfurWmQdix1C3ZLrf8GTq3MVe3QG7tbPGvVs44i
         L4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765229470; x=1765834270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GbkMTjdP41ZWpVnOfAvx7UHNDJQrnVEwvaxDiEcsLhk=;
        b=eUdRkndbvePTH2KwWQr21hHfHhmhzNsvqhfA65FA+N6ax0lzsjp36oCjhGvcCB+1Eg
         Q+prQh80Ne2iDbVddFLEB75FZ/qiZ7j8awihaaxx2sXgLXl9C1NM7uwPZczczQ6KWW8s
         Tn8NL/6n4J0RUzdSsZjSTYqMlMdaA0QUO5ajIQnfPLNl/8hBCwW7SM4Yd2ncYqF9vtMC
         Qk7jZSid58wwEJIWiZHnffN+EiyQRc735BEqzpB4Cx/fn1Bi/pLPAHM5zEn2VA/9XPS9
         fPXaVKdVhvn3ZXDVrXT7sncKCIZ7HXW+5YCB+cj6l5e57M3Cpe84n/u6QeHI0jjD8rqd
         iXVg==
X-Forwarded-Encrypted: i=1; AJvYcCXnY8PwiibeFTiJNktpFXfyz3PZqwAYbal9M8pKagDZFk+HylVx6EbT8VLtiCmdXUqD7VIhvQqk3my8DpQH@lists.linux.dev
X-Gm-Message-State: AOJu0YzX3eAhzHctxChTzpIK906XInMiZrRpqOC914451m+3qr7Ec5YV
	XknZ74U2hgabDYjcdVjKOKN3E2K/VjIeEBQTT1Pp7CIHxTmbIKP/n3YuFf25L2FDYsIrlLrHxst
	lD0h4i6sMdRQTW5rqbxogW/fbkEot812OHJsJE1aL
X-Gm-Gg: ASbGncucXId47kUDhyLTKGNz1TgEgo+rFhroKbHKV4NHFDZxB9eXzJiD1GRzGf8c/BB
	p8fYI/uzaO0vOGTxkI/G7aVDQ8bkL6qTxapfjOjkhCk56MEoHEZDe8mAjcKBJ+NDBa0lEaJA5DJ
	XAz1sISw6eqHNkwquCzsjZqb+uKM6DxBZRCn+styXg8e9dCH4wG1lfRTeq7On8tMHArsVpzHCGp
	ur/A57H3QcA+tIlPdrzRocOBsFHgJg9Hvh2Ve6TJyZC1hwX69+wBI8RWFCeozFyYUn2hD7+WA==
X-Google-Smtp-Source: AGHT+IG29GaBxwHWZQc2LB9NRpX+zT3/jUbD+9n9oxYqOMrPzqlyPGzUr1sjF/e6u05Vs4J0g5cc6rgCzdD1pfVFPDU=
X-Received: by 2002:ac8:5914:0:b0:4b2:ecb6:e6dd with SMTP id
 d75a77b69052e-4f1a5e7b540mr854641cf.1.1765229469904; Mon, 08 Dec 2025
 13:31:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251204220957.360838-1-surenb@google.com> <202512061207.7zufoIcC-lkp@intel.com>
In-Reply-To: <202512061207.7zufoIcC-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 9 Dec 2025 06:30:58 +0900
X-Gm-Features: AQt7F2pnkHbec3VF5ekmZv-cl7lVMbNag4cTqBp9jjapgjBroeJ40ilDtAS4xhQ
Message-ID: <CAJuCfpGkdz7QhOGuS2SSTw09FrQkQLPFpQuLtMkmFAbJhGGbKQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] alloc_tag: skip rcu barrier on module unload if
 profiling was not enabled
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, oe-kbuild-all@lists.linux.dev, 
	kent.overstreet@linux.dev, vbabka@suse.cz, harry.yoo@oracle.com, 
	da.gomez@kernel.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 2:08=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Suren,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 3f43be96f919cc611dcb2a4e38dd464831f4513e]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/alloc_tag-skip-rcu-barrier-on-module-unload-if-profiling-was-not-enabled/2=
0251205-061310
> base:   3f43be96f919cc611dcb2a4e38dd464831f4513e
> patch link:    https://lore.kernel.org/r/20251204220957.360838-1-surenb%4=
0google.com
> patch subject: [PATCH 1/1] alloc_tag: skip rcu barrier on module unload i=
f profiling was not enabled
> config: parisc-randconfig-002-20251206 (https://download.01.org/0day-ci/a=
rchive/20251206/202512061207.7zufoIcC-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251206/202512061207.7zufoIcC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512061207.7zufoIcC-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> lib/codetag.c:37:13: warning: 'flush_rcu_on_module_unload' defined but=
 not used [-Wunused-variable]
>       37 | static bool flush_rcu_on_module_unload;
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks! I'll fix it and repost after Plumbers as the original issue
seems to be resolved by Harry's patches and this optimization is not
urgent anymore.

>
>
> vim +/flush_rcu_on_module_unload +37 lib/codetag.c
>
>     34
>     35  static DEFINE_MUTEX(codetag_lock);
>     36  static LIST_HEAD(codetag_types);
>   > 37  static bool flush_rcu_on_module_unload;
>     38
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
