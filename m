Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1357301
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 21:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710192493; cv=none; b=pqHViIeDQVlATyN7mHrMI9pnQ9Wz93aykc7IcLp5A9sciUPe/eoPHUJE7bjTwJfankdTOej5lm+Rjoy0rqF2Al/lbwBPbu4efzWAbdB2as0d/lcNKXVB3CaJkG01UizCEQTVHCb4vMOp+X5x/+BCTeeaxMneCY73SvEQusqvfMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710192493; c=relaxed/simple;
	bh=YhTqbQHp4J2rfG2MsgMnQIDo3XPvemTa7YocXD5fcLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cNaRo+E70xXql7He7xpkb/Astq3DF188XntWoMFKIuLin1DQcKaQ74AyaerKp5Mn+m5bEqv0nfFyhytlUQ5miFVIzU71XXQieVIsqVQxuXZa0HgRX4aqo/kklnURrEIkdOsXkh68BT3zWkavw+FSIKcqS7sLHVyP0LRzYBxugkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JfFTX8n/; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JfFTX8n/"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-608e4171382so64147897b3.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710192491; x=1710797291; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvaKML3eKYTL2VtPZKWQXi4KZpd8PTk6YavEF0j6JPo=;
        b=JfFTX8n/Teot7RTKqCjkehym9nDCcTquqO/8kf+ZoV/a2nuLQ/h8beXQJGu8pPUcuh
         ho66i65c8dl9c3cls3uwYn2zTl4pbSYOgjqYU6uGb267KsE8BCZSiftD0br6+y8Gx9EH
         3ofgssCJe6DESajRK7iB1o9Q1x7y8CPtxv1zIFW77CNOkt58A6LAmFjn/WJklHrUwI61
         M4gJ+xSBmNHyJhZuuBQaZrIe+/4ar+RaJwYPxS+4b9pbTyqP5xYpqGDmOXxiBRlMtV5N
         Q2/kHdsX5okx4kFJWDMxN50t/+0hZ7rHruu+d0K1R5GU6DrhmAW5MJL9ygmM+JWc2Ho9
         bXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710192491; x=1710797291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvaKML3eKYTL2VtPZKWQXi4KZpd8PTk6YavEF0j6JPo=;
        b=NUEbGXTP8q1lFJ5SBxElwU+qB1QQRlFSzW23V+7qWGmBt67vSZekD1t8y8cjrcsQ8k
         hGwouN1CYMJP+ABThYI8ZPB+nMTQ3q6qaDLUlMrF+iKc7mlOALBVg0kWAut0A7wQNwT1
         3udMe723nww1iNQAEzT0e7S+OMQ0isrWit0Fq8O4TSF3Fnjk/s1wChUi6dMdvEqWGhQO
         glf+ymBPY8saUEH3xcema7Wdccidv1qFxsyody72xSPbqsdGXzd536Fd536oNndwVB8N
         fidaCOgTF1ai1AvOeiCRgltPgxB68dPWdaE8bQ6OAkcpVA5GQg6CtQW2dk68/7kUA6De
         OuiA==
X-Forwarded-Encrypted: i=1; AJvYcCWRLRVKnh5pBLIBXDByFRKKRjJrAt6x5GXiIvYLowCmcL03i5KuVwYeYnl97FclH6iOO0NY5XFDA8GT/TRSvfAAQtMhPv7jW+2thh06aQ==
X-Gm-Message-State: AOJu0YwVqEb6WAnHohm/P+25oztPqIHGxVquxF6goDu7vC/8xQ7TN8Wu
	e/7v2389KxJaQRztt4gNzKqOTQWqsunTHLL2Ef6czO7BwzkM4bElD2Xj4BVNXNOcS7xixEzcGOb
	agNY+Ccml+USKPfvnlg==
X-Google-Smtp-Source: AGHT+IG+MYQdwxER9uG4I9tq0d0L0sAlQzwDd3bVXqriVvbzm1SJYFoK/UCp/bqI8Dgo+pwcXu15RWMRES2+yfW8
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a81:844b:0:b0:5e6:1e40:e2e3 with SMTP
 id u72-20020a81844b000000b005e61e40e2e3mr309909ywf.5.1710192491241; Mon, 11
 Mar 2024 14:28:11 -0700 (PDT)
Date: Mon, 11 Mar 2024 21:28:09 +0000
In-Reply-To: <a04f0dc9-9f57-47fe-a417-432d5545140b@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240307133916.3782068-3-yosryahmed@google.com> <a04f0dc9-9f57-47fe-a417-432d5545140b@moroto.mountain>
Message-ID: <Ze93aZrA2t4sfaBD@google.com>
Subject: Re: [RFC PATCH 2/3] x86/mm: make sure LAM is up-to-date during
 context switching
From: Yosry Ahmed <yosryahmed@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 11, 2024 at 09:09:34AM +0300, Dan Carpenter wrote:
> Hi Yosry,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/x86-mm-fix-LAM-cr3-mask-inconsistency-during-context-switch/20240307-214052
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240307133916.3782068-3-yosryahmed%40google.com
> patch subject: [RFC PATCH 2/3] x86/mm: make sure LAM is up-to-date during context switching
> config: x86_64-randconfig-161-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101713.eM4pyFpc-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403101713.eM4pyFpc-lkp@intel.com/
> 
> smatch warnings:
> arch/x86/mm/tlb.c:655 switch_mm_irqs_off() error: uninitialized symbol 'new_asid'.

Thanks for reporting this. I think it may be a false positive, but this
code chunk will be dropped in the next version anyway.
