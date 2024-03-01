Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17988825
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709317651; cv=none; b=CMgTQ7RwPpQd5nWBrbgpS7dXVlOxyUeZe94K5nw8dNlMnF+kWqMTYfBIfXCSZhAIKES4PXEASiXrZYLn40yVqjm2R54hYnHYdDmD3Jrw9NLCXawTuKZs7jxjhI6em3tapm9fq3kvBR0BElzFzwY3ma3apqAYD4hlp3R+f/Kk+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709317651; c=relaxed/simple;
	bh=NgTKQwV9igaGr23xHt4uGPRdYvra1AcsF6AAFaCt2xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dneOJIYdfk0MjIkD4nDV4UrGfa8dgy2PqVD5hm2eWf33cXQrUMxt8vG0oWeCkrt8GH2ZcUOZwn2gwTqeNnDXOQhWNcTQWR8l5Y+xH6Q3HkNHPaCzBa/EkbzqmFLV654wuQzdXvqTT1nmCOigS6YU5+aDRWXshcMOww+036N47Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMlc3HzI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMlc3HzI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33d9c3f36c2so1196047f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Mar 2024 10:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709317648; x=1709922448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgTKQwV9igaGr23xHt4uGPRdYvra1AcsF6AAFaCt2xQ=;
        b=CMlc3HzIbt5M7TsWvmKNEejqxv7XNnMWFD1a3w1o1+ylbaFY1Z7a+NMzQ6H4JTvClM
         VcT75zew8arrhDPuklqk14qzZJzgtqsy2eGJp017yp1Lk5KBFVmolWoXurrhs/3F23+O
         vD2Nlnu/vDG1+nDNwC/jNOPmzvabUxnPEgN/NiW1ggdsEVPJBuTsTyNw7n0rXpsZM9i2
         v+D4c49goBSxnWr+8s0Vkx5ZFwQyjhYetBTl9gpAUaXHDek8SMEn9V2d7+fZg6JwbI9M
         UES1fVDULvnq/zORf55JVBnj2JimjCyM9BFtoSRsqP43ZjJHUvKVshgXXiAEzvh4av1/
         BMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709317648; x=1709922448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgTKQwV9igaGr23xHt4uGPRdYvra1AcsF6AAFaCt2xQ=;
        b=iML8mXBrKiwZ+5bA0hRwdJJj3xyeGinDE9DM7KY9W6Xbgsz5TqBoGjwCMHfSFGt33p
         EWXL9HpBEMwhomHwzknMqYt/6wiOtatnJ28zOzyfAIMWmPqY9rY/3Q8xk9dfLrs7rQIT
         xkdO3C8XEbzoTc7rzOHJnfEjZU0k28bDXZn/QlUbTMixbhluOExCDBfxItJIU51D0iF3
         Q2JA/xE9ml+pgcLf8H1m68/xMYs8aLOEaZnKpEI5Hz4hndrD2qSaJnXgcJilGav0vh6m
         IoZxcBK9EnA3qkaVB43ELTdxyDCTXHo1MQS+5j3uSbYUVehbvEuxc2ZDu8tsNbHoR9q+
         5SGg==
X-Forwarded-Encrypted: i=1; AJvYcCUMagYjzwrJxNfglgtaMuyOWLLodBGliumWjd9ehBaIGTJu3MKcf2zpFRKBSlsqtJX/Ndje20iuN5TB1QR6532eTWAdIloBQ6ualeYxJA==
X-Gm-Message-State: AOJu0Yys92Zs5MjiObLxUelpEtEY1RawW2re0id3KzBRs0FBPpyEZa9b
	yUaIFOd0ZWWsUI4+0di4khLcjcp7Zs0uVpwX4JXmw6cm21ebWB594Nf/Vp87OeDUCnj/2FlN1fA
	EovEjIEDUiNFsegsUrtohRVnyNV8=
X-Google-Smtp-Source: AGHT+IElrYL3B862YBmWkrR61aMaMpMNEemMOliyrEzB7INMZ6iniR5pQ8gECQnNmCElwU6hNVMHS7fPDCKKUxQ+OCc=
X-Received: by 2002:adf:fc8e:0:b0:33d:2f2f:b135 with SMTP id
 g14-20020adffc8e000000b0033d2f2fb135mr1859403wrr.46.1709317648105; Fri, 01
 Mar 2024 10:27:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403010423.0vNdUDBW-lkp@intel.com> <CAFVMQ6QYvHfc_=cpOddWgoWDTRt3GHG5+LLB3NoFFRRiCMWDLw@mail.gmail.com>
 <73e0fa99-7dff-4cb9-bfed-fd3368e54542@gmail.com>
In-Reply-To: <73e0fa99-7dff-4cb9-bfed-fd3368e54542@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 1 Mar 2024 10:27:16 -0800
Message-ID: <CAADnVQJUZZXusOS3h9fnUUoFQ7=o5iJDDANaUqNBheuhHrUXeg@mail.gmail.com>
Subject: Re: [linux-next:master 5519/11156] kernel/bpf/bpf_struct_ops.c:247:16:
 warning: bitwise operation between different enumeration types ('enum
 bpf_type_flag' and 'enum bpf_reg_type')
To: Kui-Feng Lee <sinquersw@gmail.com>
Cc: Thinker Li <thinker.li@gmail.com>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Martin KaFai Lau <martin.lau@kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 10:26=E2=80=AFAM Kui-Feng Lee <sinquersw@gmail.com> =
wrote:
>
> For BPF,
>
> We have a lot of code mixing bpf_type_flag and bpf_reg_type in bpf.
> They cause the warning messages described in the message following.
> Do we want to fix them all, or keep them as they are?
>
> They can be fixed by merging two enum types or casting here and there if
> we want. Any other idea?

We probably should add -Wno-enum-enum-conversion to kernel/bpf/Makefile ins=
tead.
