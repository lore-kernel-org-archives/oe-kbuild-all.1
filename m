Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933093F44C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021766; cv=none; b=mKJHsaUM9SBhw/DKeJNZ5lJYXuk5aAO+3bt4BtyUTiH3ymf2qBKNJP4BhnAapxKFhE8unXbOfkkmTDysR24bViCZkU1r3JB0HR03gjaJ/8hEItrC8nSiYWvLX8ukByoP9uhxA9qYcMO7hEW35tblIU3X9YVDpMn/qItgw3TxKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021766; c=relaxed/simple;
	bh=UF53KwwF+oAUSilICLt0Nu5fjrF/uLjngnHZ091+a2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IucV26NzQsT0Rv+KZRjvnnFBvpjFFb4ZWPFCmOMcYoXc16p7vbgfrkJWaES7mrlPunvA0MXef1rc0tsgqLDkGqHdWZqhZD6n41ozCKHUgXy0QyHgMrwvgi3pRAJsvvaAGTzGDIYgEZKwFPgYbW47NnDA0XrMjX66WwF0C4InsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FXTpHvSf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FXTpHvSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784021763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TBrhCMaLeefe3xIZ3hlRm/zq3XAKTj0MtjlETtKb8Pw=;
	b=FXTpHvSfDeP6R6ViKYzT5t23/8bHGXKIO0+kfnYcpf4dy9KmFJqWniKThFByV/2MiHtfAH
	BXytpHTdVr+UMaCdEUKj+sv4JL/sepddM2Xvaw3/45F8ME21FUvqs+UokHsOfkiNayNckr
	gTd3bKKSIolJeW3yw927Bh21LLzI3MA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Xyuk-qGRPEuuNKbG3Z3mbA-1; Tue, 14 Jul 2026 05:36:01 -0400
X-MC-Unique: Xyuk-qGRPEuuNKbG3Z3mbA-1
X-Mimecast-MFC-AGG-ID: Xyuk-qGRPEuuNKbG3Z3mbA_1784021761
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493fa6e28a7so20042885e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 02:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021761; x=1784626561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBrhCMaLeefe3xIZ3hlRm/zq3XAKTj0MtjlETtKb8Pw=;
        b=PLlJtS5k2b0/1cECv7c89fmFTZ4KDHa9UjmYBZNskxwEPIvDmielro1dHEPsiV8NWY
         pkrWYhgnvIHugzjivNdJWy+W07orva8uQT39ZBB5tdWMcNuIWDnzLKDf2jrsllwNQToE
         Jdu8eLVKMfihW2IKRh9B8Gwe/sZ34x58IJ40ybHkElPPyDLpFvsZSf3fb0pQov8qrrS9
         X67GPyZDF5yU2R9uRwAPoQVjZDLxb1N0mzhVo+AAPX3UFnTLHGpXxE6V0W024GDGrzhU
         Cj9Oa2rcZ512VAgz65i0vFzKKXPaWl7wPNjxxIIgf5aLakAaRlQF+tHjZoA0wlUy69AD
         U56Q==
X-Forwarded-Encrypted: i=1; AHgh+RpD3z1S9eEUAG7mSueicT0RNQB8MvlBSzAlulyd5pDeaCu30D7LJQ/IkCXkIJtWO8lK/Atkpp5I2yXt7vqz@lists.linux.dev
X-Gm-Message-State: AOJu0YwUg98gvQX9mroX6xJyQ7oDipusj3hyqmhi0nOQmGZxaF/LjVLR
	C+lDPx4ZAQ8CW427ob10XA0OGPtvevPlzPYZH2WRf1dZEMXGqb/TBmA7aTi8Q/C43ee8M4hq5pm
	taDgVHmYabDyXsHP0y+U1RPaqBlHkBOoH1z7C9YVry2AF5kl4T2k6LLFsUipXSRqY0Ao=
X-Gm-Gg: AfdE7cl9J/ucDNVPTJENjCKivT4eWZ98e2VwFDwSg7zxNTd9uejiwj1jHE7so34z8Sq
	J4B/nDnPn9kKw6TwN8XEkIPVsdLlfiaHd472eUIO/EPoxBKROhD/A0WsdXyQTg+3Y181MZkV9eH
	EZCCyJKCIu6lq6FpBxe8l8RejEkP37dG8Pb9u1y6hHb9elhADugO+yS+mrGPXDBxh8Ph5wk0Zxj
	YJ0BVeU0fy1Ub5TYmBD3q30O9cvonUE8im00uIFYcoSeVzjqP9j0xyKReuR0KNY1bWrjfeiaNcB
	zziW/lZX80O+HvxpYXiCHdArqhWokluBz660BvoLUcZwLQPZE7sSfvIduoStCm3jixikQnXjPZv
	UAlLqDsTU+UcL7nRJN7DEZK8Xt9rhXtY34vtYY6T0rdbsx0BS9gnqZT1J74vk
X-Received: by 2002:a05:600c:a4d:b0:493:e4b2:5290 with SMTP id 5b1f17b1804b1-493f87e5a62mr129201955e9.12.1784021760731;
        Tue, 14 Jul 2026 02:36:00 -0700 (PDT)
X-Received: by 2002:a05:600c:a4d:b0:493:e4b2:5290 with SMTP id 5b1f17b1804b1-493f87e5a62mr129201545e9.12.1784021760325;
        Tue, 14 Jul 2026 02:36:00 -0700 (PDT)
Received: from sgarzare-redhat (host-79-34-22-35.business.telecomitalia.it. [79.34.22.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32c65asm61563095e9.14.2026.07.14.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:35:59 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:35:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline
 asm>:5:8: unpredictable STXR instruction, status is also a source
Message-ID: <alYCoW08UPIGV9np@sgarzare-redhat>
References: <202607061644.jD93AjWc-lkp@intel.com>
 <CAGxU2F5KvtLSgT9pzhv8YxcP_j9L7usXqKY+W446XxLAovdbog@mail.gmail.com>
 <20260710155428.GA3149665@ax162>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260710155428.GA3149665@ax162>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DuNmTdng74SCo5K5t5tvTXYDyWEYcv5nW5ev_7Ms0eE_1784021761
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Jul 10, 2026 at 08:54:28AM -0700, Nathan Chancellor wrote:
>On Fri, Jul 10, 2026 at 04:22:20PM +0200, Stefano Garzarella wrote:
>> On Mon, 6 Jul 2026 at 10:44, kernel test robot <lkp@intel.com> wrote:
>> >
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> > head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
>> > commit: 102eab95f025b4d3f3a6c0a858400aca2af2fe52 vsock: lock down child_ns_mode as write-once
>> > date:   4 months ago
>> > config: arm64-randconfig-001-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/config)
>> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
>> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/reproduce)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > the same patch/commit), kindly add following tags
>> > | Fixes: 102eab95f025 ("vsock: lock down child_ns_mode as write-once")
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607061644.jD93AjWc-lkp@intel.com/
>> >
>> > All errors (new ones prefixed by >>):
>> >
>> > >> ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline asm>:5:8: unpredictable STXR instruction, status is also a source
>> >    stlxr   w8, w8, [x21]
>> >    ^
>> >
>>
>> Could this be related to https://github.com/llvm/llvm-project/issues/106380 ?
>> That issue seems fixed in llvm >= 20
>
>Indeed, this is resolved by
>
>  https://github.com/llvm/llvm-project/commit/7183771834d9035ffbedd8f1ff9233b16722b986
>
>in LLVM 20.1.0, I confirmed with a reverse bisect. It looks like

Thanks for checking!

>this issue triggers on undefined values being passed to inline asm but I
>don't see where there is an undefined value in the blamed commit but I
>did not look too hard. Presumably this is around the try_cmpxchg() in

Yeah, I suspected the same.

>vsock_net_set_child_mode(). I am not sure this will be easily to
>workaround so we might just have to leave it broken.

I think so, I can't see any simple workaround :-(

Thanks,
Stefano

