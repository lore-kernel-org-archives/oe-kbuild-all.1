Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F456182A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 May 2023 21:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684962068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dODs5ZTn+ErGWbdibvZPgi03pCRB3lhisq+Guk0Aefs=;
	b=QCfb8KwLrgMgQrXtuEAXRBuPRHG0M8Iz+46fLCyfk3Lci4UH3xBUp3xzUkx3JtCIKedYf4
	S2XsGKD3/lbWwWKSWVsFQCLG8qu4rpfKwwAdrhQ8Uk/TDg3yf0FVye/k8+yYWcndDhj7mf
	NZM4SVi/rDIVijTwSm2bpT+n6W30ZZM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-vDMcVrU4PrOLYw4agLgjoA-1; Wed, 24 May 2023 17:01:06 -0400
X-MC-Unique: vDMcVrU4PrOLYw4agLgjoA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-625af7de7daso4410876d6.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 May 2023 14:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684962066; x=1687554066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dODs5ZTn+ErGWbdibvZPgi03pCRB3lhisq+Guk0Aefs=;
        b=e22vrGBmTC8i0QRdIovIDY736JfluuvlyyQZ0sOVvX+rUQBNUVJY9+Ezc/jn8e0i9E
         BI0AowSXTxDrLsqQyFFFogbWA5JRy+425us8zc5D96MfSmu2LL0lwXFQcxiETGXzNPFo
         9upOEnBnHMyMzt324jzhspIKYZGEpthR5fXHlsngGUP9wawG1dbvKXkCNJDoAniXPm5L
         zH9ztvUajslnZ/ZR+d+k9Qo+pddzMPHVGw5FXNsRs22icFyMTlyu7cEnaLyY6hRQCqc5
         rs3ffIkEjevM6lH1ynonz3kw+wG8TlVJrOsBmxPE0Qo9ov/a1VfUU699+x7bWk7YMMmB
         n3XQ==
X-Gm-Message-State: AC+VfDymxFVgkvrOs0CIxEoRXx04ZfAl/FJYnaeAtc7xio29lMeXZ6ls
	F+8c71JCqhqovHl5IhpTp8UDfVlTaeKzXEG4goFq/BpehjezC7STidKnPZmHKjqeF2oyBa4SvHC
	/MRxgNtdshUKPoVR5tPlhN98iNA==
X-Received: by 2002:ad4:5f0f:0:b0:5f1:6892:7440 with SMTP id fo15-20020ad45f0f000000b005f168927440mr33130476qvb.23.1684962066218;
        Wed, 24 May 2023 14:01:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7O/5uTpY0b5HdIavkAWDeSIAxBpa10qbCz5cuioocwwPtQwVYPGqqlIFOfsx4TYmU37r8V5A==
X-Received: by 2002:ad4:5f0f:0:b0:5f1:6892:7440 with SMTP id fo15-20020ad45f0f000000b005f168927440mr33130452qvb.23.1684962065941;
        Wed, 24 May 2023 14:01:05 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::3e])
        by smtp.gmail.com with ESMTPSA id bt8-20020ad455c8000000b005e750d07153sm3841558qvb.135.2023.05.24.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 14:01:05 -0700 (PDT)
Date: Wed, 24 May 2023 14:01:02 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: vmlinux.o: warning: objtool: xen_sched_clock+0x4a: call to
 ftrace_likely_update() leaves .noinstr.text section
Message-ID: <20230524210102.h2bbhlvujcg77wuw@treble>
References: <202305242215.M2ZKRxS0-lkp@intel.com>
 <20230524142954.GN4253@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230524142954.GN4253@hirez.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 24, 2023 at 04:29:54PM +0200, Peter Zijlstra wrote:
> >    vmlinux.o: warning: objtool: acpi_idle_enter+0x65: call to ftrace_likely_update() leaves .noinstr.text section
> >    vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame
> 
> Robot folks; could you please discard all:
> 
>  ftrace_likey_update.*noinstr
> 
> warnings, they're -EWONTFIX.

Could we just make CONFIG_TRACE_BRANCH_PROFILING incompatible with
CONFIG_NOINSTR_VALIDATION?

-- 
Josh

