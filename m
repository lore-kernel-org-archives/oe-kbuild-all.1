Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B133C8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 17:25:38 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id p10so17052882vsu.5
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Feb 2023 09:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D/BcHWrx4Kj+87bqftvm+l0WaUTrm7SbGz6u55o5gw8=;
        b=AxYpztFQNf6RBscWYrn/sCD0VhszWHIlsJsbTqrvMarIYaLDYoH60g20D7cMtj0Gmm
         vh6yK+EL8yG1Ter9R6PbEvcPJi0KdnS9ZTS9Z+kvx2xkuQBJii6P2T3tbXEk6dLDITvu
         m8rWpKy4SSReADrHx/lLtnqS6YedF64/eXunjuNYCqm6GIW/O4Obfn58AqbIfo8oiyBM
         i9Ihocd2hwCcHDOht+BUou08jozfCKH4fyiYd/wo2bAUjvP4MIDiG0Ee9t8Df9eMcEXb
         EdfgaCLsNKVDmce4rsUPY7+YPFmMr2WK6iBOv/D2zC7+m1sx9tWRag7TYe+B9X0+BJwZ
         zq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/BcHWrx4Kj+87bqftvm+l0WaUTrm7SbGz6u55o5gw8=;
        b=M3EDrOVwUwft4Sw33dQc6wIPSNQgGirBfUUWdGqXMY8YMQupCLnaLCN/e85+g4lbx0
         2aSwJ5d67+SnL354OPWwxJo5dMYA9egTSCgI6g1hPE2nnuZfKBI7ilR7xJ8R549cT0ao
         0cdxRWW+QT1FwZh3YxbE4tss8Py6bKpM+hwCXrVtwyapuHUsU5q5VP53Et1w54+LsN7z
         y/klfwxVyJ6H3ao86DuBc7+EGIfNaPiMXcojrN0OY+y9v+WpOSg8bcLy92/NjxukIN26
         8kKSfBw68frguKz9hgBJ8KmMhv7FoPbufzFVo71mXayVA4dRPS/5ogyzsz+TIpMFjEX+
         CkAw==
X-Gm-Message-State: AO0yUKXu4jiQLxUi4p/4TK6rxo8O61v+JQqtdn/OGnyNMtPxEwm6rG6T
	MyhjmcvZuZR2tU0S7LgWVPyH0Ouyf9+aCEVvwNo+F+pLQrTVRcmD
X-Google-Smtp-Source: AK7set9bNSt5xjr6xHdtjJgru9nyPfJ0WS5zOVzwgAyjK0IennvJ1JX+5l/AqqHqkA0zrKFDEQSzFcaKF7Ps8YDqhdE=
X-Received: by 2002:a67:15c2:0:b0:3e9:e5ce:b491 with SMTP id
 185-20020a6715c2000000b003e9e5ceb491mr875595vsv.13.1675790736991; Tue, 07 Feb
 2023 09:25:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302072055.odjDVd5V-lkp@intel.com>
In-Reply-To: <202302072055.odjDVd5V-lkp@intel.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 7 Feb 2023 09:25:10 -0800
Message-ID: <CALzav=dGuJDdr6s8XoaW8r2U-Fyi1VWoVxe5dOKLam1mJ7k7hg@mail.gmail.com>
Subject: Re: [linux-next:master 911/10933] arch/x86/kvm/mmu/mmu.c:102:22:
 sparse: sparse: symbol 'tdp_mmu_allowed' was not declared. Should it be static?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kai Huang <kai.huang@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 4:51 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   49a8133221c71b935f36a7c340c0271c2a9ee2db
> commit: 3af15ff47c4df3af7b36ea8315f43c6b0af49253 [911/10933] KVM: x86/mmu: Change tdp_mmu to a read-only parameter
> config: x86_64-randconfig-s023-20230206 (https://download.01.org/0day-ci/archive/20230207/202302072055.odjDVd5V-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3af15ff47c4df3af7b36ea8315f43c6b0af49253
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 3af15ff47c4df3af7b36ea8315f43c6b0af49253
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> sparse warnings: (new ones prefixed by >>)
> >> arch/x86/kvm/mmu/mmu.c:102:22: sparse: sparse: symbol 'tdp_mmu_allowed' was not declared. Should it be static?

Yes it should be static. I'll send a patch.
