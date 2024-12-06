Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D341C3F36
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 22:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733525222; cv=none; b=lbjUN+OdaDRTD2x0QNYNkZdRmrX4Xz3vTujFWq/w1adF8id2mMbcdsielpMQ3SwhUtadjNtYQSliRRUxVfA0FwHNwa4l6PR4WF6ljWE1MTT12r3gpie6rflGyYcS/j0RTjDlGUi4tW3GlgVQhzG5OciN4o5T2wjstU4CLASqz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733525222; c=relaxed/simple;
	bh=iITAE1Ks58yzjB7pv45kbC7F7m3AmF+RtaX7q902Uf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jbVBz++S2S67ADxTzfxXCoHhTPUvLxG3dMArDp5CeCeu9qJc1lPtxbXpXa6bRQJWM18HbNz3hdBBQ2klZD0B4RORhluLCPYYU/ZlWfUsgtk0lYngzvGEfubCyg7GYG3JdZ9qh/98po4vXPoLc6EvQfjO0zjteSCpF3LjymlCvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QnjpZpni; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QnjpZpni"
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-51610d5f436so171490e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Dec 2024 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733525219; x=1734130019; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xOebWP/M8X2cP/fdZF9vXfDo8byCjFk2C5X5FbCC10=;
        b=QnjpZpnitJxAEwPD17aWWQecGZRnKwXEkOkFvjSapL4z8NbNdscXYxaQerkg0A6AHB
         +aL1YzxEsmMuHV5a9u1vv2jXxqjfPW0IMaNQQmPjReRKbULhLUp6LIqK1YpEe4l67ZPC
         D52SpEKdEF9aYb6hMtJ+wmTfESA83OIUVkS9ponmN0q4xo+8c44LokocKKzdRd507Lv0
         i6zRDSiWiOaE2JFOkthTpGl4LFd9C0Uy2MNxhw5L/FG4GJhuEiiYa/1jkWyJrYMaxTuD
         ouxcpKD3ueJEf5syrRkHqMgKvBNJYGr1fS6jlHKH63pv/zgpY0bxDt5ffv9nBS10abUJ
         bAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733525219; x=1734130019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xOebWP/M8X2cP/fdZF9vXfDo8byCjFk2C5X5FbCC10=;
        b=cmugeltSSYwHCz+VhWNiUi42HZDo0362DK6j/s6cjL3qNaw8TLZLi96X+h2Yh2g9uF
         KxGr/veXgzY3zghvNQY1lU1BfFE15OKewyHhJF6UCVBDJGw7jtH9IA/VPzt38G2RYgIm
         AWAQxBgMqAr1wINj5g0TBS41v8f8Oz5+n5Z1BT40PspZ1d6VGque1z/OplWyjC5UsubM
         qxndSGIEsoZDLgv3etReGNToyjSglZeqnqOA/YW3DsnaQO4b8U0llci6vWU2rcVj2oOH
         pK+nqjeZgaHHNKoTup0Ms5V+3UULBbjH9B6ZOvn0EbgIkRe06yYjskhuLv9p0Gl6TJY6
         ueOw==
X-Forwarded-Encrypted: i=1; AJvYcCX8A9EvzvlyOpLvTeDpiPOaMtZduRbXbc9R9O/Sn7bm13RPj3ld1kiyAJeGtZ7qnup7qurTxKi0bu6okEIl@lists.linux.dev
X-Gm-Message-State: AOJu0YyloU+buZg9eyR/8jJLCV+moZx7Ieh9q/1sQJbTE537RkJap1n4
	3dvnJMG1hEyVqh/c28WO3CtPtkjG+4mUlS/gb4lVF9arnffgDhkt6BEp7i9czSSOt6nX/7eC37c
	aU/zoJyM7a5Qunr1Y0w==
X-Google-Smtp-Source: AGHT+IFWYRH0ZDfG1SCEobsGl/BiWTfQRI31egCmHBP1UIFLmQh8g16wMoeT9PBzM1Kkhhw9DuLZq6uIHa5tY1W0
X-Received: from vkbes1.prod.google.com ([2002:a05:6122:1b81:b0:50d:806e:dfd0])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:1da1:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-515fcae70a3mr5700023e0c.9.1733525219486;
 Fri, 06 Dec 2024 14:46:59 -0800 (PST)
Date: Fri,  6 Dec 2024 22:46:58 +0000
In-Reply-To: <202412052133.pTg3UAQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202412052133.pTg3UAQm-lkp@intel.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206224658.2833655-1-jthoughton@google.com>
Subject: Re: [PATCH v1 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: James Houghton <jthoughton@google.com>
To: lkp@intel.com
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org, 
	oe-kbuild-all@lists.linux.dev, oliver.upton@linux.dev, pbonzini@redhat.com, 
	peterx@redhat.com, pgonda@google.com, seanjc@google.com, wei.w.wang@intel.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

>    arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function '__kvm_set_memory_region':
> >> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2049:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     2049 |                 new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
>          |                                         ^

I realize that, not only have I done this cast slightly wrong, I'm
missing a few checks on userfault_bitmap that I should have. Applying
this diff, or at least something like it, to fix it:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b552cdef2850..30f09141df64 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1977,6 +1977,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if ((mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_USERFAULT &&
+	    ((mem->userfault_bitmap != untagged_addr(mem->userfault_bitmap)) ||
+	     !access_ok((void __user *)(unsigned long)mem->userfault_bitmap,
+			DIV_ROUND_UP(mem->memory_size >> PAGE_SHIFT, BITS_PER_LONG)
+			 * sizeof(long))))
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -2053,7 +2059,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			goto out;
 	}
 	if (mem->flags & KVM_MEM_USERFAULT)
-		new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
+		new->userfault_bitmap =
+		  (unsigned long __user *)(unsigned long)mem->userfault_bitmap;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
