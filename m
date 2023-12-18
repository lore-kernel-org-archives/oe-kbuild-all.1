Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801C3A1C1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ptW0IANb"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbce98f7d44so3194305276.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 07:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702912014; x=1703516814; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpb3qTCtU41SCDZT9/3OWHtKjaIrEH6OAOcVPIukllk=;
        b=ptW0IANbRty3miAc1ksnxNzVbdkgTssMg9a5dCY1LccWVlFVfkZzUeoH6KVbdmmiMz
         PJNptS2SUqEgDN5HUbtyBV+HvBUQApBk2IQm5PkKTyMaZeHYehHabQ0H/7nXLdapDNnf
         RXeeEmCd7A2fH2WywXclxPR6xBVPiJ5W9PnmXGkcDBvKGDpD86yZ03oVT7Ly3DG8nnQ6
         nlcYdefOTKqHN3vxsXn2+JsFhqabuSWk8DThtXiEMDlJMGm4oWfuMIheHDV4jNGNDgKy
         Q16YFIkJEXg+p7tWXImXdKxhaInq8LljBaBNh6YMwuEf4B09hmDHk0LM3blpXMU/cPTs
         lgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702912014; x=1703516814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpb3qTCtU41SCDZT9/3OWHtKjaIrEH6OAOcVPIukllk=;
        b=mp0qOCb/OSEduvpZGYbaFg7D4MFr5fWfZIfs08c4HTK9pkH1nkOLcJrQPKURO5V30b
         EflKorpszxKmvpb5FJ6kalSRyhkiu1YZCmC57t9Hq3W29ciIKd0xk+8UMka9pF/qlZ/N
         rwcZ773XdSODXgw8FcSb9InxVhiENCO2SVpjiCaYbD4kYmWJcBb7eVIWC2ZZLkau0Cbk
         mMqI5fFlT1OV3pEEV2z/G6AoZxJah+hDZTsDcHsgiyGDmpSoknLxI1kj2Rw+1el9DXQm
         +IO4YsFNteooDVZctPwEeUTvTkMS5KcgqdTS7dGMgFTiK2fuzfURmTmgfhswyp6ENtMe
         2Wmw==
X-Gm-Message-State: AOJu0YxH3bLif0PCpqriJq87NPg6T0xt9uB7ZOgKL2oAunl/DrI0s+RA
	IgcCo8eVOaD5tO18Zq2DP9X74BBmCPo=
X-Google-Smtp-Source: AGHT+IHk1/DwMDksrDwizyfWaHAFZlnng/u9qBHzGBPlJAT+ozlgAPspe7cc4kz8FFegRtOAmeFSegX6P4E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b907:0:b0:d9a:4421:6ec5 with SMTP id
 x7-20020a25b907000000b00d9a44216ec5mr1598976ybj.3.1702912014701; Mon, 18 Dec
 2023 07:06:54 -0800 (PST)
Date: Mon, 18 Dec 2023 07:06:53 -0800
In-Reply-To: <202312171230.oCaBKFUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202312171230.oCaBKFUr-lkp@intel.com>
Message-ID: <ZYBgDTkt_tZVbfnx@google.com>
Subject: Re: [linux-next:master 5175/8213] arch/x86/kvm/vmx/hyperv_evmcs.h:133:30:
 sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Dec 17, 2023, kernel test robot wrote:
> Hi Vitaly,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
> commit: e7ad84db4d718e18c7a133e941ba4c7d4c6d4cbf [5175/8213] KVM: VMX: Split off hyperv_evmcs.{ch}
> config: i386-randconfig-061-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171230.oCaBKFUr-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171230.oCaBKFUr-lkp@intel.com/reproduce)

Known shortcoming, just ignore it.

https://lore.kernel.org/all/87v89jmc3q.fsf@redhat.com
