Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23220EEBA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 19:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423965; cv=none; b=N4Lr/nfMLLz1On1bJuQNSDxRmoIiXChp5kd/49jrYLsJ1QvRfY3lRtwLz523Iu14WjCcxokjtp9f0yvqgPUgZXjvPOuEYJaETcSZ5OlkbOB5QNCGLnWQNbwFREz+yYDUGN+2YjldmMFwQVxG+y3+WcLcZW9FUR5nmJdiPWGYgkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423965; c=relaxed/simple;
	bh=TbC/rc1Gc2waMYjSf69c7Q7O4fQXmnx3+3LZrew34CY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KXUMtopXpWa3Lc5VkiRgVAc5q+NvKxr3qqCfUv5/YmnEqIrKOIF9lggKynWNg1TnLnTwWhwMt2Xe9GdjM70nfSSsJ1VmIgh71pg/QJuWEtZu6rm2vRX99KWJQl/m/sVu1L8an/RiDmQxXxBu2jjP+U30SGFXXZt51GEUpdrApgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wd26m/Lu; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wd26m/Lu"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a20257c758so1767324f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747423961; x=1748028761; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iF5Q4RTlZRKmTG/lOha5KuRxlr9mPUE/8DV6NZ7DJq4=;
        b=Wd26m/LuSM17GNlIXMP7Z1bTdXXD2loDM+F/LbqSWypaRvYu7EvrwLHUsPJMEQEsMw
         4Oy4e/VgSCODtJ42dK8VC4rLpoK41hgfFq/kICvYY1Y8b2HcwIbLjRcoSNfBL70S+HsG
         hTKyJLasPfF4NJJg7g4HZSClR5qzuSLbwc/XxH120b1CNNVc8ixADSRinkSKscrnK01a
         H+VeF8hnFNZARfYODWB2MuVMpPo9AXHouUv9CaJB7unUI+iw8dV0wPC0GA1m94r36duj
         9Ip4ykR6UGdu1BVVJflA0klfceQDEs0h1PTP4YM9IlJEgysaKmYM6O/1uyRFySy6XgOa
         3aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747423961; x=1748028761;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iF5Q4RTlZRKmTG/lOha5KuRxlr9mPUE/8DV6NZ7DJq4=;
        b=LzTYJgeZc845XGEYAz+K1aZtqXw9Ld7YxgeQ5aJGF1O0YkTeToXXnZi5P1YPpogc4s
         r1Vef/GzRDAQzF7gAH4KdCAnAtvYZKo0vQ92coiKzFmxDx+9vK8S3FJJEwkQQSCcV7eM
         bpyf6nPiIx/FXbmaijiHLnUY4oR0OCKOzkPCCjnjs/HV773zUUR3q+cPT67pXIl8RDoi
         AXjaZIAdZ1xHYL5iUst0Eibulklv5SWCJw19n5WyUj8g/mZb/fntbRpqIDIrjbxm283P
         Zm2jlo3vbq0CfRALnuW6igutbJYd6RexohgJYBPMPGk0QgF2BB0n4/53uQ0k23Mg6Zlx
         Az4A==
X-Forwarded-Encrypted: i=1; AJvYcCWJqCKzPjvw/v+gsB2/WGQXOs41veWMGbwMKGHX28YQnyCImYZd4Iq2doZ70/Li5w/UDUKLGYhekM8u1d7x@lists.linux.dev
X-Gm-Message-State: AOJu0YzESuRTL8hKJegcIETjEOWXg15cNmMvjpQzM2+9Zws0RV6itAOj
	Uu6VDnmYXQDvsDfR+UiACoFIeFwQ57ZCkqYMJnQmAdr2UxKPLRr8SJPamd2wy/TBVRzYwxkWhIR
	dJ9VafNz1Qgab6n16hw==
X-Google-Smtp-Source: AGHT+IEsXNdM7c7UBV+9bN0MXrbsEHFUQpgGzgenbWMdXL3xT6y1P+Jz0AIdUiBBDrT9pkq0FOPYKXjizNJybJQ=
X-Received: from wmbfj9.prod.google.com ([2002:a05:600c:c89:b0:43c:fd72:aae1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2aa:b0:3a0:8a1c:ef0 with SMTP id ffacd0b85a97d-3a35c825988mr4612415f8f.24.1747423961454;
 Fri, 16 May 2025 12:32:41 -0700 (PDT)
Date: Fri, 16 May 2025 19:32:19 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6581; i=aliceryhl@google.com;
 h=from:subject; bh=TbC/rc1Gc2waMYjSf69c7Q7O4fQXmnx3+3LZrew34CY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoJ5KjFnF2Wg75uY7u7QDnfW47Z85e5fsHnuOXC
 bQTFHW1Jg+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaCeSowAKCRAEWL7uWMY5
 RvS8D/9650JlLCEcfYFOj2YVsFuEaDhwzNr5TSnXT0p8dmUeSCoL0ExebYHHTkr+pfyH4cEPGBJ
 GNbAooxe/Z/GPBjEnr9motN0aVyAq7UkJtmP51XTRpeU6O9NSWSgiLcbcHl2hYiPihCr+dcxDE6
 w1qKKr9hWH69TZho53L2+FuveBacf558aXUL2lQQwmcbWxw2nJSCuJPrxQmdGnLrCkgJ3Mr3PLL
 s2UV3e5t5XbxoWC0/RP4+qP/qo+2hwDODmA+8tX1ATwNtifKSXjUKkxyhBDYG6tr+0FGAd3u/hC
 xQK07uG8l6PTVwp6podxxjQltfBS1ta9YDvWMblxVhPgjpKd5FZOCHnJwHyZO4FxceV9mEdWi/4
 TddvMCBMKVYSDl6NbeoEqXrzSWpAhVmU0kNA12y633Pe9BEvABepxJYv4Nmr+P5vC0S3fE7gpGG
 6o3M+gnKduhSH5DqKCvsfXBlDkrjwN8KXZ2EbWlyFGfSbeQ0ZvFlL5vu2ZjBTLfXieJl6EGkLkz
 Pye1sjugbyXfhApxpe3CQUTFFi0VQKpThCJ7gRjDa2Bie7Qv365N/BXl5MetYQx417sBdK6TaZO
 MjiwmDDTmQC2gHcHVvBBA5Xas7mFr6XKGrbnCibpjm43/HXuvCBegbSl3Peibr+8ASO8Bkmi/Rn YT+8AEYbKpjoAbw==
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516193219.2987032-1-aliceryhl@google.com>
Subject: [PATCH v2] mm: rust: make CONFIG_MMU ifdefs more narrow
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Currently the entire kernel::mm module is ifdef'd out when CONFIG_MMU=n.
However, there are some downstream users of the module in
rust/kernel/task.rs and rust/kernel/miscdevice.rs. Thus, update the cfgs
so that only MmWithUserAsync is removed with CONFIG_MMU=n.

The code is moved into a new file, since the #[cfg()] annotation
otherwise has to be duplicated several times.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505071753.kldNHYVQ-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202505072116.eSYC8igT-lkp@intel.com/
Fixes: 5bb9ed6cdfeb ("mm: rust: add abstraction for struct mm_struct")
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Intended for the mm tree.

Changes in v2:
* Fix Reported-tag and Closes tags.
* Update commit hash of Fixes: annotation to commit in mm-stable.
* Pick up Boqun's Reviewed-by tag.

 rust/kernel/mm.rs             | 56 +++--------------------------
 rust/kernel/mm/mmput_async.rs | 68 +++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 52 deletions(-)
 create mode 100644 rust/kernel/mm/mmput_async.rs

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 615907a0f3b4..43f525c0d16c 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -10,7 +10,6 @@
 //! control what happens when userspace reads or writes to that region of memory.
 //!
 //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
-#![cfg(CONFIG_MMU)]
 
 use crate::{
     bindings,
@@ -21,6 +20,10 @@
 pub mod virt;
 use virt::VmaRef;
 
+#[cfg(CONFIG_MMU)]
+pub use mmput_async::MmWithUserAsync;
+mod mmput_async;
+
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
 /// This represents the address space of a userspace process, so each process has one `Mm`
@@ -111,50 +114,6 @@ fn deref(&self) -> &Mm {
     }
 }
 
-/// A wrapper for the kernel's `struct mm_struct`.
-///
-/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
-/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
-/// context.
-///
-/// # Invariants
-///
-/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
-#[repr(transparent)]
-pub struct MmWithUserAsync {
-    mm: MmWithUser,
-}
-
-// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
-unsafe impl Send for MmWithUserAsync {}
-// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
-unsafe impl Sync for MmWithUserAsync {}
-
-// SAFETY: By the type invariants, this type is always refcounted.
-unsafe impl AlwaysRefCounted for MmWithUserAsync {
-    #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmget(self.as_raw()) };
-    }
-
-    #[inline]
-    unsafe fn dec_ref(obj: NonNull<Self>) {
-        // SAFETY: The caller is giving up their refcount.
-        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
-    }
-}
-
-// Make all `MmWithUser` methods available on `MmWithUserAsync`.
-impl Deref for MmWithUserAsync {
-    type Target = MmWithUser;
-
-    #[inline]
-    fn deref(&self) -> &MmWithUser {
-        &self.mm
-    }
-}
-
 // These methods are safe to call even if `mm_users` is zero.
 impl Mm {
     /// Returns a raw pointer to the inner `mm_struct`.
@@ -206,13 +165,6 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
         unsafe { &*ptr.cast() }
     }
 
-    /// Use `mmput_async` when dropping this refcount.
-    #[inline]
-    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
-        // SAFETY: The layouts and invariants are compatible.
-        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
-    }
-
     /// Attempt to access a vma using the vma read lock.
     ///
     /// This is an optimistic trylock operation, so it may fail if there is contention. In that
diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.rs
new file mode 100644
index 000000000000..9289e05f7a67
--- /dev/null
+++ b/rust/kernel/mm/mmput_async.rs
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Version of `MmWithUser` using `mmput_async`.
+//!
+//! This is a separate file from `mm.rs` due to the dependency on `CONFIG_MMU=y`.
+#![cfg(CONFIG_MMU)]
+
+use crate::{
+    bindings,
+    mm::MmWithUser,
+    types::{ARef, AlwaysRefCounted},
+};
+use core::{ops::Deref, ptr::NonNull};
+
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
+/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
+/// context.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
+#[repr(transparent)]
+pub struct MmWithUserAsync {
+    mm: MmWithUser,
+}
+
+// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
+unsafe impl Send for MmWithUserAsync {}
+// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
+unsafe impl Sync for MmWithUserAsync {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for MmWithUserAsync {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmget(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
+    }
+}
+
+// Make all `MmWithUser` methods available on `MmWithUserAsync`.
+impl Deref for MmWithUserAsync {
+    type Target = MmWithUser;
+
+    #[inline]
+    fn deref(&self) -> &MmWithUser {
+        &self.mm
+    }
+}
+
+impl MmWithUser {
+    /// Use `mmput_async` when dropping this refcount.
+    #[inline]
+    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
+        // SAFETY: The layouts and invariants are compatible.
+        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
+    }
+}
-- 
2.49.0.1101.gccaa498523-goog

