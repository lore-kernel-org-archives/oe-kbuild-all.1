Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E32877CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760432561; cv=none; b=m/jPcb1ka1NEy9aDSts1Ju+Woi2e7NgVSQW7pqDiN9tycXkUxfYEJvTwVKCJIs28MCAIrtF/Ku+ub/RaKQ5+sw6ihcLfx/CLcmj/XHrOYS62P9Sjx+It4ns7p9ftoO7uihpHfBLB4wrzkf8w0SD3sNHo3BlKJNFvTbjhmZNLprU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760432561; c=relaxed/simple;
	bh=3DxPdjB8O0rEb9x+9kTSM/qDo37eqb9cY6rmjgwvPBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KbOnLHv7hywDboY9UMM013GEVDBRxo9H6t5PZKBjhhx3DjrWoqwA8zUJAxa2eMmesnflQgfaFBFa3WY/z6r+UJyYeZRaeLfPLI6EcHoJWKyoMA7aPfSlNGcd9The6U7LY4r1dfyg9ih5k+VnWFTTAL+M4Pi59zOIDc0Q3AXDEPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0LbR032a; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0LbR032a"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3f384f10762so4385874f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760432558; x=1761037358; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WFy/F3Efn7AI8ZrVeO392LWuUGHpTkVCPmtJlwniUuA=;
        b=0LbR032a+iRKyqATZfCXphUvBWSMENwsrBW9gMefVzNSsT/l68oOnm8dlLCNdcCD6N
         5jq4gN8nPTxYLbDrHpZny2NmNOPJA6UcxGDbIMfGyCpMrMm667+/tGJ2SwfaOa5AhIuk
         3JYYcBZlifpAkr/lrsfPdHSabCx0Q2X6u2h66k7QGqFTtJMCn8tC/GKl4icwc72TYYwx
         ltmHEbU7Xo09vH4XGUBitREQQpU8mZrwZtTgqD3DWzMZkXMlqvvoBCNxZ+MT/MFV7z4Y
         u9/Ri9WQQAdYCj4Dhe2WGUiRhWwei5EmJMkfGEx9e+//S6L/h8OB8C5jxg3QLAQh1LqU
         Pm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760432558; x=1761037358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFy/F3Efn7AI8ZrVeO392LWuUGHpTkVCPmtJlwniUuA=;
        b=s6aFvHHZi8DpK6AByxHYQDSsYwr3LQTF9D3OkzLIZHk2/Vc/Wb4KqZn8aoWUCnjKMo
         hwvoEBNnXSx1fDQ6e8hPhGY74miMd7zXdEt1LQN28/goxK9c7L2P0Th5fpXYCYHWHcVk
         9otUqQO7DjdNOUiU99YkMRaFS9SOoKEx4u1AJoJ2LVtKaha3u2/IfyOi/eVFq8EvoaLd
         lD4IN2goAn9jK4kICcRYTqAuOQyfKcAsaE3xkJx34dcxDNMfp3hNKXx6SxcPmtEsmEYT
         ZQyvEatTqtdoG45gGusvLAMaY5oGY3OBaJtWjPoE84JK94l3JxlWRG14LIoQRJi42A1t
         deuw==
X-Gm-Message-State: AOJu0YwbYEQ1fZm1JCCPDBCu8wwpcQxe9jmMrGLXsKm2q6HgDRo3o5uw
	Bz+WNlk4o7CXAWjaFLSCwNcOuND9d+2BVOs5cfkd/+5ucSMkSctNC/qpRC5TmLQAF0u+loeF4ds
	w1lfOoBKyypzbeQ==
X-Google-Smtp-Source: AGHT+IHXHqt3lzNbZ1Z+WmgocqXfHPbEfJ0BjUewzHFNlW7fihzTRZHXdjzVwfd8KIAJC4Tk2tsQ6+sU+2+Wvw==
X-Received: from wrpi10.prod.google.com ([2002:adf:efca:0:b0:3eb:a52a:8d03])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5c8a:0:b0:425:8125:ac79 with SMTP id ffacd0b85a97d-42666ab97f0mr15284902f8f.25.1760432557738;
 Tue, 14 Oct 2025 02:02:37 -0700 (PDT)
Date: Tue, 14 Oct 2025 09:02:37 +0000
In-Reply-To: <202510141438.OMSBOz6R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251013-b4-l1tf-percpu-v1-1-d65c5366ea1a@google.com> <202510141438.OMSBOz6R-lkp@intel.com>
X-Mailer: aerc 0.21.0
Message-ID: <DDHX9C20UWUQ.2U72TLVPB31EQ@google.com>
Subject: Re: [PATCH] KVM: x86: Unify L1TF flushing under per-CPU variable
From: Brendan Jackman <jackmanb@google.com>
To: kernel test robot <lkp@intel.com>, Brendan Jackman <jackmanb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue Oct 14, 2025 at 7:24 AM UTC, kernel test robot wrote:
> Hi Brendan,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 6b36119b94d0b2bb8cea9d512017efafd461d6ac]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/KVM-x86-Unify-L1TF-flushing-under-per-CPU-variable/20251013-235118
> base:   6b36119b94d0b2bb8cea9d512017efafd461d6ac
> patch link:    https://lore.kernel.org/r/20251013-b4-l1tf-percpu-v1-1-d65c5366ea1a%40google.com
> patch subject: [PATCH] KVM: x86: Unify L1TF flushing under per-CPU variable
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251014/202510141438.OMSBOz6R-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141438.OMSBOz6R-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510141438.OMSBOz6R-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> arch/x86/coco/tdx/tdx.c:471:12: error: conflicting types for 'read_msr'; have 'int(struct pt_regs *, struct ve_info *)'
>      471 | static int read_msr(struct pt_regs *regs, struct ve_info *ve)
>          |            ^~~~~~~~
>    In file included from arch/x86/include/asm/idtentry.h:15,
>                     from arch/x86/include/asm/traps.h:9,
>                     from arch/x86/coco/tdx/tdx.c:20:
>    arch/x86/include/asm/kvm_host.h:2320:29: note: previous definition of 'read_msr' with type 'long unsigned int(long unsigned int)'
>     2320 | static inline unsigned long read_msr(unsigned long msr)
>          |                             ^~~~~~~~

Yeah this is essentially just another symptom of the kvm_host.h abuse Sean
pointed out.
