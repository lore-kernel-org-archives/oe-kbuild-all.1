Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CDE155C82
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097068; cv=none; b=YuNKj2lsL3squ6xmCJkwJW/tc82AD6FcQF3EntmQT7wsHYmxRHR3q1qb+RI9q6JXJ/mrS/gO+9SW6iQv1/sQE/jolsbRnNsPkndVoD1qZq4VaFC4jT6N3xXt4fFDAqBNU4Vvj9hmxUqz+ABnWMg5Bhk9RtqgFthzc0x4CCttSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097068; c=relaxed/simple;
	bh=ieUrBpxnhAcHZVPIDjWg8YrjgXlXZRU0bnijma7YrcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FKK9mxTxLBQgvnFP/HuCDwnd4oRrucayx5nn3m5paBzoT5xPCbbXyvB6bYviaWRjIXGcpNDqJhBboVvGYboBYCFHuuXMDDHJtWdQ5mdaGNNEG2iFEcIkRz+jmRsMHTQ/9zdpXMHfovojs+tSk9IwunWs+6dde5j1sY1Sjrnz0zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rybmyrCk; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rybmyrCk"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7c790dc38b4so819250985a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750097064; x=1750701864; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6s05CdLcRzyi2nsOTKC32FfCxvZXUgETWtMCfMXqdTs=;
        b=rybmyrCkiX7lx9GQUqGOqYTcewfpJd5dZvWA0MNTAY5ceCc1SGezz63n+kq1bt4H+e
         T3/wKFgHwAmqjxPXBvdzsOFyWkicurRg45wvHvRXYmlFhWSteOjkZNGD58Zyw4tq+kKz
         E7v7+epmP2IvpcxpRey8tYOYkHQh7HmL03pGaWxU7Du11bGWjtlwf4WA18bkZpCVqJbm
         4OvbkF8s2jzpuwiGnflbYtkOUJKTmhf7feUyTdh1VvKBqUhw/SrzDIIry9t9A934o31r
         1z4ByUvONZuqZsCfBkmVY8gZBuwZ1lcgHeCGMZ2/9vQAnf5D93LmkvaLl7CXJMgq2HjK
         fqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097064; x=1750701864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6s05CdLcRzyi2nsOTKC32FfCxvZXUgETWtMCfMXqdTs=;
        b=U6sQC+OfclVVW+s0ykiHMHLAQPGURh6+WkEdnWrrb6rHWoG3g2HPervpD3LokBNH3j
         SIWxXJackbHN7J3lgEk993XAAaAbKtpNV49Airw6nMr0808bp9srKsPXpIzjQEkMjUgk
         e8bNrkmtrQzskszekk2CnGJdzTwxAJiRy5B8tlpKhZxatGZB+qYwZNUPY1V2lLC/NyMe
         4YLBbVW1KFQSWTKqtTHwePYIbFTQ0F5otd+EASQcmqAEDYBSYnYMk8GDyopKeMGeJSqC
         rqWS/aFNk+Sac3sXkRKXJBvURiDCM6+pBFM0brMcBIIwkGCRAf4jj83ZbQ39epG7MjeL
         6V6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1gRC9UDa5dlemDPhvq8GTojx72tLmvm3N71R3vyOfGY/M4uoeHc8qKZVN3Y1k3QkWKL6FCLA5AVH/CWt@lists.linux.dev
X-Gm-Message-State: AOJu0YwTWKceUcpM4I7DuumczD812JyNTn0OqT3klcErNlxVQH4ZamCB
	F8BlSygxY/P3/oItEUnaVL5NgpnLESMz7E2EBvTJoFSCp4OPTCFWwTmJ3UhurlqYz7zH01kVkuI
	WEn+Dt9TFvdiFUdhYhSKXPA==
X-Google-Smtp-Source: AGHT+IE18+eJ2mJb0IiEY7AbbpEu86bBMFRR0dra4DbsFH8VnDPOgkInNK1ZU3CtXj87hevrPmaWTiBTb6wKlYzP
X-Received: from uabch3.prod.google.com ([2002:a05:6130:c83:b0:87e:c20a:bcb1])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2714:b0:7ce:fc0b:d39d with SMTP id af79cd13be357-7d3c5125037mr1849533285a.6.1750097064527;
 Mon, 16 Jun 2025 11:04:24 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:04:23 +0000
In-Reply-To: <202506142050.kfDUdARX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202506142050.kfDUdARX-lkp@intel.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250616180423.2859920-1-jthoughton@google.com>
Subject: Re: [PATCH v4 1/7] KVM: x86/mmu: Track TDP MMU NX huge pages separately
From: James Houghton <jthoughton@google.com>
To: lkp@intel.com
Cc: dmatlack@google.com, jthoughton@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	pbonzini@redhat.com, seanjc@google.com, vipinsh@google.com
Content-Type: text/plain; charset="UTF-8"

> All errors (new ones prefixed by >>):
> 
>    arch/x86/kvm/mmu/mmu.c: In function 'kvm_recover_nx_huge_pages':
> >> arch/x86/kvm/mmu/mmu.c:7609:38: error: 'KVM_TDP_MMU' undeclared (first use in this function)
>     7609 |                 else if (mmu_type == KVM_TDP_MMU)
>          |                                      ^~~~~~~~~~~
>    arch/x86/kvm/mmu/mmu.c:7609:38: note: each undeclared identifier is reported only once for each function it appears in

Sorry for not trying to build on i386. :(

Fixup for this, as Sean originally had[1]:

[1]: https://lore.kernel.org/kvm/ZyJCjJx2lxnEnDwa@google.com/

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 9df15c9717771..d544a269c1920 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1358,6 +1358,10 @@ enum kvm_mmu_type {
 	KVM_NR_MMU_TYPES,
 };
 
+#ifndef CONFIG_X86_64
+#define KVM_TDP_MMU -1
+#endif
+
 struct kvm_arch {
 	unsigned long n_used_mmu_pages;
 	unsigned long n_requested_mmu_pages;
