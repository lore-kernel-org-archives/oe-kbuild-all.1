Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3713D8A3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138478; cv=none; b=tEwWEzfio/bxKMcqyaQchbkdLrDUW5AOYwmSRanaEzIr8L+pUoZhblclUgygr/6UZsYdfYIFro/4/kXSDz6aKHMOdC46S6plU3lkKiltDgA4ViISs5fRMDXhRg/160yT+EYE284fcu6y1QD8K1kMpubGav9NN868OzWXYJdiHsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138478; c=relaxed/simple;
	bh=ZIBG3DIZ09sxLywnVqDjwXs+je9fyRasHVL2N8pKXxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nT4EZUM+zv/zBELcfCIaGptVhHg6iJO4l6x/FTT7OeROYSDl11epaYqAIfSm6xv8RCyPFky5wbwSqwH8H91PsXDxcaIyvGQCiqXG49Uvn+SGs3E5aCAHmiQENa/pMe4lWfvXfVGIxr+o520tSUhCO//f078HsT2bZNfPgBptgQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=DvyaWYlt; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="DvyaWYlt"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44ff50affc5so7236561cf.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Aug 2024 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1723138475; x=1723743275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3kS/2kBV0cJmMxOZu7JY8gdWK1JL40ra4DA+MZeIO8=;
        b=DvyaWYlt5Wvc+ZKnaPZUvxKrTe5xb1A/5Yj5zrhGd5TAmP+RS9yjOyuhjl5az7Lu88
         ccD40hKJFLk/+hMSo8cxGvyqXiFHP34fXgLaqPZbsybM9veJqbWSPXYnnu/1pGgXFKGK
         WxIXDMSm19LH0mDAHZeUkvh0ZwNGwsxx9AsEc0kxqvtWgVTlBfs0NpnN1aOa11oDkSwN
         8QSMmM9jsmUyoTKsw5xuLbbvAw807/3jQkLgE/FYWFNQRfbBVgGaRokcZBVlr8dxdyH6
         A/q70B6Wn7EPVorKI3j/prOweoPkz31gqAUGhW+5/rWIILUMrNvc/1a0lhZzIvbIbO2S
         JpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138475; x=1723743275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3kS/2kBV0cJmMxOZu7JY8gdWK1JL40ra4DA+MZeIO8=;
        b=TUot1Fo5WAA3N/PbLBrIWTwlQWXOvBTQFf04so6pJcgklbTIilbm3qdVTmmxoOGTwL
         w1vRQfVdv8XaLwq5OqKp04ITaPYpR/3KodzLNnphA5oofO5L0xgpwKMDlWrFB1ahRfZj
         LNa0gHj4JuMTKWwJc3Crgtvj7OcXCAwj6SZL46PVIwOe2l4QmGo0c40LgY47jJZBqXNA
         6OQIPfCgpzE8ne1Y5efrLUiO4iFTqkWeQ6BrFYv2FXvLHJwidA+bNg8xJ/8rrc6a21YD
         NvFblwOp4N8MTHTGP4QKTKuQKVy+GT9bycRKJlTLE00cRGJuRqZ5cE3n4KKxy2zs7z1C
         q52A==
X-Gm-Message-State: AOJu0YzZiQJ24B10PIbqPDPuSO4XEWS7E7Rthqtd36g8pkD1vMIJ7HDW
	HirerammA77VD6xn4vpzA7owjX1mRcHA1tOtv2SjJzquYUB2jhmIQy8MGrNZijKd5LymN5MaIqJ
	FiGxZ/dNRShhaEntNKz5iDNpQnAFlmYu+X+zt4g==
X-Google-Smtp-Source: AGHT+IEu4dhvrahqQhtTv73/0AxNQT4DXfssGSTVqKbrU+qE/md4Pxv+X/00NDAjbZlSFPoNIWS9HpJfGjUbF9bnvNA=
X-Received: by 2002:a05:622a:1919:b0:446:5ee0:d2a with SMTP id
 d75a77b69052e-451d4277a97mr32908221cf.36.1723138475366; Thu, 08 Aug 2024
 10:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408090125.PxGk56zJ-lkp@intel.com>
In-Reply-To: <202408090125.PxGk56zJ-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 8 Aug 2024 13:33:58 -0400
Message-ID: <CA+CK2bCgfBbkm7nfgNVkhYpqiaheJe0ag5bM2nAtfg0WK-1khw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 23/225] mm/page_ext.c:323:29: warning:
 variable 'pgdat' set but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 1:22=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   275d686abcb590d862b74e2670533d93fd10e58c
> commit: 129bae385a761c7fd88874ad46e27d7eb739bd80 [23/225] mm: don't accou=
nt memmap per node
> config: i386-randconfig-141-20240808 (https://download.01.org/0day-ci/arc=
hive/20240809/202408090125.PxGk56zJ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240809/202408090125.PxGk56zJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408090125.PxGk56zJ-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/page_ext.c: In function 'free_page_ext':
> >> mm/page_ext.c:323:29: warning: variable 'pgdat' set but not used [-Wun=
used-but-set-variable]
>      323 |         struct pglist_data *pgdat;
>          |                             ^~~~~

Indeed pgdat is not used anymore, I will remove it in my patch.

Pasha
