Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1523271F2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 20:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831878; cv=none; b=loJrTfj9xk6uUUZ7I60nAfVgWcN9dymQZA4EokO/scY3JzazqqZccJVQ+4kE+HycK4IDY2xAJ3zihNVc4mLmrScSdqQo5eCLRwYq0ILP1bl9yQnv8TYVRxgkym6C3VxuOYkQoZpZa+zECQag81kDvSulCZP7eqaXoUAA9gl67Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831878; c=relaxed/simple;
	bh=zaps1TeHjaBkAE8awTJiGOXyRdvkkHFT776XDaFxrUw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XNxQ2cKtD4fqlswLlcUXog4y3THMSvtBqU1dpoTqPnCRZXeiyotx6hqPTzmhmRE0xiFws16dYPnoDpHBf7b/xkrDK/M9RAVysiNFMOEGioFIgl52yWRJhqFA2h2tqQuleR7MFLehR3onWvSCN76AFON/XSTIIzPtcDWzkqLvpw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z1akS9QG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z1akS9QG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29f177f4d02so62449235ad.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 12:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765831876; x=1766436676; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=diLa2diH1nYHO1hxApInM0+dtX2xoLqMeU634WXxrfs=;
        b=Z1akS9QG4tG6renCn0fB1UeGS8fsE74ACSB21q8DLWE/ObS2hDP8zV+AJy3B6rO+lO
         nmZ6RtQiSQlRiEIQdwHB5+LbkDBgijOAvUOSv7l3/iyK+qqr5LOXb/b0v1sJPnZTvz+O
         m2dlWlr1zpLctKg7A05EKKXamuyjRnXNmSoj0yCoTf7NTs9EF0ifyj3MYbRraABCB98K
         oiDhAdP7187lUbEbRO7YwKp5Z7iOymZupV4zsubIWa6j6QmJEKmUo8VBdlt6fB2SQynb
         CDbeCiVDNlHERj/XwqQzLfn7+bj8j/fNu9OnIYQ3CD0rXQpnyAz8DiJGgP6v6xc+oOvi
         aMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831876; x=1766436676;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diLa2diH1nYHO1hxApInM0+dtX2xoLqMeU634WXxrfs=;
        b=nYAu31zPK6enUe2dc/d3q/OPSKGmY8lGKBkjxNVIKfNU4eePCCJ918912tZ9OtDPmL
         i/z9782h0Rqbc1Uxr+DmaWnvRa9+VWntsMaKE+mfU0XvBImwTh3x/cJU6/UH7nXA9+Ba
         lcvGmZgsbWl+O7wYDDoTum1pvI7BQeWVqkrZPdvgSQPwuk/ZXG+S0TUOFSXm/kEgZwzv
         EBQSWv/95Rro+GTYPBGiIGiWOku2O17+x2mkq0qnAjBkO+/qeO+HkbnrLwAkytWZ3g8S
         DSuj+Pfyf+5XR8NWnfrGf8By5EKbYjl5S+2eXP90bk2nzbmdK/IVZ0iUPZSwm8jdzDD2
         feQw==
X-Forwarded-Encrypted: i=1; AJvYcCXzcj5ypQRH7rH7Ovjqt6GzobfnqJIesMlEw3JD+xnnqtYG16Lc2tJQxiL+yMOzITdjf3EAcS0vM+7I1eGo@lists.linux.dev
X-Gm-Message-State: AOJu0YxOPSoHbg1RXkSOnwEgB02wzLx8zMf9c79v2Fk1mB9oCmLnYXDV
	qfVgWGmZKKvIKWlMJ7i9FPUu0sgtj4s216vMqKDM2lgwlagKUVyV6M8YIWOJHz2PPP7dxdkprrS
	MQhlqsQ==
X-Google-Smtp-Source: AGHT+IFj9l0wpoQNHT8Y7M3ukghgfENrMandrLnvXCYKSwFKGmEPwaSGu/PXYX1ywSffGQdonWO6tz0DtFk=
X-Received: from plrf15.prod.google.com ([2002:a17:902:ab8f:b0:2a0:ad03:ae6a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f651:b0:2a0:fe4a:d666
 with SMTP id d9443c01a7336-2a0fe5a2147mr48345575ad.10.1765831875917; Mon, 15
 Dec 2025 12:51:15 -0800 (PST)
Date: Mon, 15 Dec 2025 12:51:14 -0800
In-Reply-To: <2df1a0c0-31a6-45c9-a92e-abdbfddbd9b6@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251212135051.2155280-1-xiaoyao.li@intel.com>
 <202512130717.aHH8rXSC-lkp@intel.com> <aTy7AG2y1OwIXfqs@google.com> <2df1a0c0-31a6-45c9-a92e-abdbfddbd9b6@intel.com>
Message-ID: <aUB0wlJKtyyJTewL@google.com>
Subject: Re: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf
 while the MMU is direct
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, farrah.chen@intel.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Dec 15, 2025, Xiaoyao Li wrote:
> On 12/13/2025 9:01 AM, Sean Christopherson wrote:
> > On Sat, Dec 13, 2025, kernel test robot wrote:
> > > Hi Xiaoyao,
> > > 
> > > kernel test robot noticed the following build warnings:
> > > 
> > > [auto build test WARNING on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoyao-Li/KVM-x86-Don-t-read-guest-CR3-when-doing-async-pf-while-the-MMU-is-direct/20251212-220612
> > > base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> > > patch link:    https://lore.kernel.org/r/20251212135051.2155280-1-xiaoyao.li%40intel.com
> > > patch subject: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf while the MMU is direct
> > > config: i386-buildonly-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130717.aHH8rXSC-lkp@intel.com/config)
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130717.aHH8rXSC-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512130717.aHH8rXSC-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >     In file included from include/linux/kvm_host.h:43,
> > >                      from arch/x86/kvm/irq.h:15,
> > >                      from arch/x86/kvm/mmu/mmu.c:19:
> > >     arch/x86/kvm/mmu/mmu.c: In function 'kvm_arch_setup_async_pf':
> > > > > include/linux/kvm_types.h:54:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
> > >        54 | #define INVALID_GPA     (~(gpa_t)0)
> > >           |                         ^
> > >     arch/x86/kvm/mmu/mmu.c:4525:28: note: in expansion of macro 'INVALID_GPA'
> > >      4525 |                 arch.cr3 = INVALID_GPA;
> > >           |                            ^~~~~~~~~~~
> > 
> > Well that's just annoying.  Can we kill 32-bit yet?  Anyways, just ignore this
> > (unless it causes my KVM_WERROR=1 builds to fail, in which case I'll just add an
> > explicit cast, but I think we can just ignore it).
> 
> If your KVM_WERROR=1 builds contain 32-bit config, I think it will fail. I
> think we do need to add the explicit cast.

Ya, you were right.

> You will handle it when applying, right? Thus no need for a v3.

Yep.
