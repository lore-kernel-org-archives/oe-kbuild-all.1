Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E615B57F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635195; cv=none; b=gPY4XvceEnrg1GYTShY2xgX73vESUdK5c4sFPw3bk6z6/qgNR3dyXFhI/gRHYv+mHvxyh+yh7TKbjQ/wdl5tN1fOb3CTQGbs8FLaptsIAjT/fPDC02J72n8/ce7Ldna29UPR3buI2bA0o9UoNqJEVPyZ47AFxxmLhCBYrCIYGtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635195; c=relaxed/simple;
	bh=P80Zpu9tv1bMMBDh+ONi23eSh4o+SJsPhThAatrGgAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Btl2BnH4r3KC/6juinfyd+j3wiUSg7HWBow/V/AlFcp3NUENAFMW+s/bxKmi9Dr30pavAs7gzZpGTX8b5iPTjpWBF/+hZvZwqJZ4eTBomZYWep2I2hR1kAyycN7EcSYBq5c5/j8ZNJ6KB5raMxLZHm6DbT+jEPouQHJT94HEzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vgotBcXr; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vgotBcXr"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-632b6ff93e4so54412487b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718635193; x=1719239993; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vHyuZMITfnIkev2GvBkEnYE0p556d103ol755fiJd7Q=;
        b=vgotBcXrI2oY6ZYKGniDKP0LlneArGHGPBcRzWNP9aZbNour4czbP+bdJp2d4DsE0a
         JjrFZfKB/keNz1aUYg02utZDLAdfkpfe4gYCssMFgUlosMOUCyud/oaN32SwUxQiuR4+
         Kg52fyJjwhp8lmTcxgzFtYOBitUSvchqd8j6zojFThOD0/fHbNAao6zPtBJhSdfodk1s
         iGn8s62B9ofTYLFs3Vk4Q7hLJbjOEkrsPl5PELyEYWToYdYlPBuoOcMPgQQ+1eb7LKXg
         RVTfHptf6aU7YyL0FEeREV+J3jUlUvzqF7wx1+tBG8naP+F0nEVToORHlEKK8psg5C5w
         vB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635193; x=1719239993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHyuZMITfnIkev2GvBkEnYE0p556d103ol755fiJd7Q=;
        b=bWUIJiuzPf6SXIEABlxkUhPKDAHSUnBqCpy/cZYLFg9sY06mNbYNXhDho5dPhDm5cX
         sVUUPDToAQMIbUUWWc5VKwev57x7vxm/4BIfPSnmPmDPa6d5Qw93SAjKzgbHTeYwDdSw
         8O4K2rSVO8InyFdhY6FzLe42ZPRSyawKWvUKWafGQ/SaGh9/oP3DhNdyBy8gg+kGu02i
         f5prQS8y9SEWDQMUAm4C6NSUpAipiDadEO4ptaNxFExAuf9Xc4QCYsC6s56t4jziuX30
         pHuR1ZfAmnIUGQnDmo65+GfeUFcJQTVegVSGT2JN8lUSPxPgNNgJuP+J7Hl43Sx1ZfPD
         3cyg==
X-Forwarded-Encrypted: i=1; AJvYcCXCcevI/XYQKHinWmi14DL1+rDxvU4TZLFP/7u0wnUrfDjxOCKHLoyQVs/nYktOSEOz7qWB5ObVv/MLooJSciOc8zlypTGz23bavoBRFw==
X-Gm-Message-State: AOJu0Yz+QiSQB7GYO0cedfkYLAmQ2/CqJUHlAkuptbTGRbSEMTN6/Lfj
	/6BQXx5dWyu/9nlTme4M3rTN59XiX0aSWN5fk+Gl9pc+eDbu6FpI/rcxZ/6UmXp2scPtTQHFuA3
	kMA==
X-Google-Smtp-Source: AGHT+IGRkKuEbgZAbZlwQNI71faOZATSKDWCbKCMCbXhO0niCQ7K0aLbEl6u7tzApvz62D/KMq/FQjTcEF4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:f88:b0:dfb:1c1c:abf9 with SMTP id
 3f1490d57ef6-dff1534bb30mr3070719276.2.1718635193015; Mon, 17 Jun 2024
 07:39:53 -0700 (PDT)
Date: Mon, 17 Jun 2024 07:39:51 -0700
In-Reply-To: <20240615080902.GAZm1MHvXQ30rm1Nnk@fat_crate.local>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202406141648.jO9qNGLa-lkp@intel.com> <20240614152228.GAZmxgNPmozj7UzRdV@fat_crate.local>
 <ZmxjOxhPy67QOh5Q@google.com> <20240615080902.GAZm1MHvXQ30rm1Nnk@fat_crate.local>
Message-ID: <ZnBKtwvvKXXK2b2u@google.com>
Subject: Re: [tip:x86/alternatives 14/14] arch/x86/kvm/kvm.o: warning:
 objtool: .altinstr_replacement+0xc5: call without frame pointer save/setup
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Jun 15, 2024, Borislav Petkov wrote:
> On Fri, Jun 14, 2024 at 08:35:23AM -0700, Sean Christopherson wrote:
> > > I know Sean had a patchset to cleanup that gunk. Sean?
> > 
> > That series was just for the actual VM-Enter/VM-Exit path. 
> 
> Right, about that. I still see:
> 
> vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0xb0: call to sev_es_host_save_area() leaves .noinstr.text section
> vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0xbf: call to sev_es_host_save_area.isra.0() leaves .noinstr.text section
> 
> in allyesconfig builds....

Gah, sev_es_host_save_area() needs to be tagged __always_inline.
