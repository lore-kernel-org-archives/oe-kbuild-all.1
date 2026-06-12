Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12F1E2606
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271306; cv=none; b=ZVAc5Yk3rCypd5rCX7YdpifykD0UA7kaIiUyjws5jX4Jx5yQApUnEE3Va9VLbN05BQfTOUlwPpbGP2j7NIrBCCM5uSNj/rMhmE9VSuzoJm1Z37GkJUStyJUGwIgHA5VZWb/Lyvbz1Jg5QUCHLAH74i9IhfSIfJcH7brWk7aiUuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271306; c=relaxed/simple;
	bh=QbXQ/yT4xL45fcGUFBMGqB4aDYU9CacrzPx72FRoTzE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X4u7oLPb3nNlCHwcopGKQsljgia2izpPhduCOPmSW7YPOX8jy2UNQEY4jbe81GulEzABmIe4liOtDYJxgbBjS/pAluc4XjwiAKHSOSn4N20TyPlaXC3K8E8x8CKkwijByqwJVb25N2O061cL0HwjhRN884y2pXR3W12w2RpSGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kmje9RfC; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kmje9RfC"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c860544c077so1176408a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 06:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781271304; x=1781876104; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJkStARvkoIWY4b141tWQ1brtOFvQ4g52atjcfQh36s=;
        b=kmje9RfCDdsQ1HhA/6Ug/BgteZtFk/NQa6JAmtkUKkFrToneAPOlDwBuM2NSbU33qz
         PiEuuFp94qUcE3Iq3cBshfOZMfL7gguJuL0fDvulhZxttpaj95BbwGJ7WHWPQ5/mTNvY
         IBr2WJ0IgBkbE/sr9zYmG9jM5ouHRqS3zegZLk13WMNbAnCVyKBfpm82g2MsA4ENL/qP
         o5QpASnWAXNUEKPFxltIUPcw+fHnQYOrtnJZQxTppGDckds42Js5f0FseyqEfEZsN0w6
         QF29xH53KI39aU2Hht4azmSA9v9bxNO2ir3eMh/mlN5nSwjrecK9yoOb9S3DdAEpe0c4
         tgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271304; x=1781876104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJkStARvkoIWY4b141tWQ1brtOFvQ4g52atjcfQh36s=;
        b=RRKlbAGYoFXeXm0SKkGIdg3bner3Dyfq2zQDEl04VEVTxVvXM6fRnmt2AnleWKamNj
         j+uGZ5fiNfHOV5a1XoAPvWHs7EBx8KO3cQAkOCb333c5aIpqHpdhOP5VjVBUkjPCAjCE
         hMLBEp31ISmIf4GMF8+J+xY7E+bCcTYIkudXKANOb1dV5kFX9TGS588aHq2qUi71Tu8r
         xlurM/aOegKeWYLvzlPoNX1HpuZwuscOXFMcQvYLnobJqNUrgZGjlDwqwPxJQ4xxA/Zs
         aMewe8cJxAIltdd0iewC8EWxIiUmvJYNk/IK615ekl/AJPK8I0Jj40H8MAkVRT3dK/qV
         VI3g==
X-Forwarded-Encrypted: i=1; AFNElJ/KgGFzvHOh4MlLWZp6s+AAjmgCcrJsdHS3W5+39p+nKxp72nbBWwarfD+JFJ0/VQ8NMGSjbQD7JMuAR1eC@lists.linux.dev
X-Gm-Message-State: AOJu0YxMlDRNJPQcFQf/RZojGphxXJLoW5rgZWxMJv1BxRtgzaj2WuaS
	zsZ8+zzH/lJAmlA8WnpL9Fg6ipbXA5XPkvcRLnu6SzFevxbqxuQnyEOekVCynAIct9F7MQJMolT
	4/NNdvQ==
X-Received: from pfbft7.prod.google.com ([2002:a05:6a00:81c7:b0:835:429c:76df])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3997:b0:842:55b6:f5a1
 with SMTP id d2e1a72fcca58-8434caec14amr3070032b3a.6.1781271303898; Fri, 12
 Jun 2026 06:35:03 -0700 (PDT)
Date: Fri, 12 Jun 2026 06:35:03 -0700
In-Reply-To: <202606121943.HbEtzxip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202606121943.HbEtzxip-lkp@intel.com>
Message-ID: <aiwLB2iiGiXp5krW@google.com>
Subject: Re: [sean-jc:x86/gmem_inplace 30/59] arch/s390/kvm/../../../virt/kvm/kvm_main.c:2437:12:
 warning: 'kvm_supported_mem_attributes' defined but not used
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, oe-kbuild-all@lists.linux.dev, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 12, 2026, kernel test robot wrote:
> tree:   https://github.com/sean-jc/linux x86/gmem_inplace
> head:   ee82c791cf17377ef4b741e56d41fc1e454a1c6c
> commit: d2dd49c5f92f1ccb2f22e281942dfb7771e27bc2 [30/59] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2 ioctl
> config: s390-randconfig-002-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121943.HbEtzxip-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121943.HbEtzxip-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606121943.HbEtzxip-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/s390/kvm/../../../virt/kvm/kvm_main.c:2437:12: warning: 'kvm_supported_mem_attributes' defined but not used [-Wunused-function]
>     static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/kvm_supported_mem_attributes +2437 arch/s390/kvm/../../../virt/kvm/kvm_main.c
> 
>   2436	
> > 2437	static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>   2438	{
>   2439	#ifdef kvm_arch_has_private_mem
>   2440		if (!kvm || kvm_arch_has_private_mem(kvm))
>   2441			return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>   2442	#endif
>   2443	
>   2444		return 0;
>   2445	}
>   2446	

Drat, forgot to run this through my full suite of build tests.  We could just
tag it __maybe_unused, or wrap it in #ifdefs, but I already didn't love having
kvm_supported_mem_attributes() since PRIVATE is likely the only flag guest_memfd
will support anytime soon.

So I think maybe provide kvm_supports_private_mem() instead, and use #ifdef
shenanigans to avoid an unused function.  That would have the added bonus of
ensuring that guest_memfd is enabled if kvm_arch_has_private_mem is defined.

Ackerley, if you haven't already ingested this into your local repo, I force pushed
to x86/gmem_inplace.  Or if you've already made other changes, here's the full
thing.

Oh, and looking at this, we probably should drop Fuad's review at this point...

---
From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 23 Apr 2026 14:51:09 -0700
Subject: [PATCH] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2 ioctl

Introduce KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES to advertise the
availability of the KVM_SET_MEMORY_ATTRIBUTES2 ioctl.

KVM_SET_MEMORY_ATTRIBUTES2 is a guest_memfd-scoped version of the existing
KVM_SET_MEMORY_ATTRIBUTES VM ioctl. It allows userspace to manage memory
attributes, such as KVM_MEMORY_ATTRIBUTE_PRIVATE, directly on a guest_memfd
file descriptor.

This new version uses struct kvm_memory_attributes2, which adds an
error_offset field to the output. This allows KVM to return the specific
offset that triggered an error, which is especially useful for handling
EAGAIN results caused by transient page reference counts during attribute
conversions.

Update the KVM API documentation to define the new ioctl and its behavior,
and add the necessary UAPI definitions and capability checks.

Suggested-by: Sean Christopherson <seanjc@google.com>
Suggested-by: Michael Roth <michael.roth@amd.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 Documentation/virt/kvm/api.rst | 78 +++++++++++++++++++++++++++++++++-
 include/uapi/linux/kvm.h       |  2 +
 virt/kvm/kvm_main.c            | 23 +++++++---
 3 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 6c691fb2af5f..43f86ae3a17d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -117,7 +117,7 @@ description:
       x86 includes both i386 and x86_64.
 
   Type:
-      system, vm, or vcpu.
+      system, vm, vcpu or guest_memfd.
 
   Parameters:
       what parameters are accepted by the ioctl.
@@ -6373,6 +6373,8 @@ S390:
 Returns -EINVAL if the VM has the KVM_VM_S390_UCONTROL flag set.
 Returns -EINVAL if called on a protected VM.
 
+.. _KVM_SET_MEMORY_ATTRIBUTES:
+
 4.141 KVM_SET_MEMORY_ATTRIBUTES
 -------------------------------
 
@@ -6565,6 +6567,80 @@ KVM_S390_KEYOP_SSKE
   Sets the storage key for the guest address ``guest_addr`` to the key
   specified in ``key``, returning the previous value in ``key``.
 
+4.145 KVM_SET_MEMORY_ATTRIBUTES2
+---------------------------------
+
+:Capability: KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
+:Architectures: all
+:Type: guest_memfd ioctl
+:Parameters: struct kvm_memory_attributes2 (in/out)
+:Returns: 0 on success, <0 on error
+
+Errors:
+
+  ========== ===============================================================
+  EINVAL     The specified `offset` or `size` were invalid (e.g. not
+             page aligned, causes an overflow, or size is zero).
+  EFAULT     The parameter address was invalid.
+  EAGAIN     Some page within requested range had unexpected refcounts. The
+             offset of the page will be returned in `error_offset`.
+  ENOMEM     Ran out of memory trying to track private/shared state
+  ========== ===============================================================
+
+KVM_SET_MEMORY_ATTRIBUTES2 is an extension to
+KVM_SET_MEMORY_ATTRIBUTES that supports returning (writing) values to
+userspace.  The original (pre-extension) fields are shared with
+KVM_SET_MEMORY_ATTRIBUTES identically.
+
+Attribute values are shared with KVM_SET_MEMORY_ATTRIBUTES.
+
+::
+
+  struct kvm_memory_attributes2 {
+	/* in */
+	union {
+		__u64 address;
+		__u64 offset;
+	};
+	__u64 size;
+	__u64 attributes;
+	__u64 flags;
+	/* out */
+	__u64 error_offset;
+	__u64 reserved[11];
+  };
+
+  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
+
+Set attributes for a range of offsets within a guest_memfd to
+KVM_MEMORY_ATTRIBUTE_PRIVATE to limit the specified guest_memfd backed
+memory range for guest_use. Even if KVM_CAP_GUEST_MEMFD_MMAP is
+supported, after a successful call to set
+KVM_MEMORY_ATTRIBUTE_PRIVATE, the requested range will not be mappable
+into host userspace and will only be mappable by the guest.
+
+To allow the range to be mappable into host userspace again, call
+KVM_SET_MEMORY_ATTRIBUTES2 on the guest_memfd again with
+KVM_MEMORY_ATTRIBUTE_PRIVATE unset.
+
+KVM does not directly manipulate the memory contents of pages during
+attribute updates. However, the process of setting these attributes,
+which includes operations such as unmapping pages from the host or
+stage-2 page tables, may result in side effects on memory contents
+that vary across different trusted firmware implementations.
+
+If this ioctl returns -EAGAIN, the offset of the page with unexpected
+refcounts will be returned in `error_offset`. This can occur if there
+are transient refcounts on the pages, taken by other parts of the
+kernel.
+
+Userspace is expected to figure out how to remove all known refcounts
+on the shared pages, such as refcounts taken by get_user_pages(), and
+try the ioctl again. A possible source of these long term refcounts is
+if the guest_memfd memory was pinned in IOMMU page tables.
+
+See also: :ref: `KVM_SET_MEMORY_ATTRIBUTES`.
+
 .. _kvm_run:
 
 5. The kvm_run structure
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 0b55258573d3..f437fd0f1350 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -996,6 +996,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_S390_USER_OPEREXEC 246
 #define KVM_CAP_S390_KEYOP 247
 #define KVM_CAP_S390_VSIE_ESAMODE 248
+#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 249
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1648,6 +1649,7 @@ struct kvm_memory_attributes {
 	__u64 flags;
 };
 
+/* Available with KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES */
 #define KVM_SET_MEMORY_ATTRIBUTES2              _IOWR(KVMIO,  0xd2, struct kvm_memory_attributes2)
 
 struct kvm_memory_attributes2 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index efbcc765f3ce..dc43dee89512 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2434,18 +2434,22 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
 }
 #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
 
+#ifdef kvm_arch_has_private_mem
+static u64 kvm_supports_private_mem(struct kvm *kvm)
+{
+	return !kvm || kvm_arch_has_private_mem(kvm);
+}
+#else
+#define kvm_supports_private_mem(kvm) false
+#endif
+
 #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
 static u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
 {
-#ifdef kvm_arch_has_private_mem
-	if (gmem_in_place_conversion)
+	if (gmem_in_place_conversion || !kvm_supports_private_mem(kvm))
 		return 0;
 
-	if (!kvm || kvm_arch_has_private_mem(kvm))
-		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
-#endif
-
-	return 0;
+	return KVM_MEMORY_ATTRIBUTE_PRIVATE;
 }
 
 /*
@@ -4970,6 +4974,11 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 		return 1;
 	case KVM_CAP_GUEST_MEMFD_FLAGS:
 		return kvm_gmem_get_supported_flags(kvm);
+	case KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES:
+		if (!gmem_in_place_conversion || !kvm_supports_private_mem(kvm))
+			return 0;
+
+		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
 #endif
 	default:
 		break;

base-commit: 7e5cbd74e6f2dbe5d98d71e4286725da4179a531
--
