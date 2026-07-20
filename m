Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410E8383992;
	Mon, 20 Jul 2026 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561647; cv=none; b=IQokxAFfRz/MMY0GuQ5nFyOahH3G75hAENiuVuzphmCcvzPgJkOkvlwDyjIy0+m0tguqQaxY5TSPe8cZwm6nDuoQMPZSrSCIu0dilAnQGENOWMqXEPS1lasdH+aQqyvInq9/gJGIVS/sKTrnl9WUJaBPnO9pAaq8HcJffz+9YRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561647; c=relaxed/simple;
	bh=siHTwugi9/cLbPbf7I8n6tfAk7xOa6uJAVhdb7yBy90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eT5BK8VZHWUytUzRei1DOy0/bxKDU1dHrCwhVMG2HelV6gCjiqyjY1E9Adr2rQf+I+CVEXTNsEB77YZhHqUCotdjE3Abhl0wj1W/TZ6HmsRc2HNXpjmzPjhFCShA/xOWUH/4iOMyCt+ImodTFd+2VlIG4agMi8Rp5VEqTY82iJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/J5ulW6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/J5ulW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427D61F00A3A;
	Mon, 20 Jul 2026 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561645;
	bh=oGpMjtTWCaywHeT1w3l0ltHCrOKDvwJoEC0wuWUw9D8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N/J5ulW6kH6xMz76YPM5WKoDnR36eQvoVYaJoTnBct89KSZhNHRtwN0dON+OnQX7F
	 s+Grmk/APZ99YbIAPmb1LtX/4x/qK1jwkbDD480FUuLK+6aVlDx3hePQEdsNy9F3WT
	 pfLW6hmkR8eEm5BIKu8S1HEduKbKojOMjg8VGwAblPv9BE7kVUABvgYd94BT05v9TG
	 fmHyQJ3e4DND2lTQvDdo5X6TAXUim8JUe7GXrgmRw/5kqxkltDTAa4SmqRQIBl9bZl
	 +S8BrlX3NiUdrS5IbPsV8/hx1u59WytICjfXEDaam1VweowfEFlPhQFQ/B2cU7EKhu
	 pzWzQz5rmhD0w==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peterz@infradead.org,
 luto@kernel.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Sven
 Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH] entry: Provide stub for syscall_enter_audit() when
 auditing is disabled
In-Reply-To: <20260720094921.537716-1-ruanjinjie@huawei.com>
References: <20260720094921.537716-1-ruanjinjie@huawei.com>
Date: Mon, 20 Jul 2026 17:34:01 +0200
Message-ID: <87cxwhn09i.ffs@fw13>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jul 20 2026 at 17:49, Jinjie Ruan wrote:
> When CONFIG_AUDITSYSCALL is not set, syscall_enter_audit() is not
> defined, causing following undefined reference warning.  So add an empty
> inline stub to resolve the missing symbol.
>
> 	include/linux/entry-common.h:109:(.noinstr.text+0x2e6): undefined reference to `syscall_enter_audit'
>
> Fixes: ff2b9a905930 ("entry: Rework syscall_audit_enter()")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607181530.2nx8zb3J-lkp@intel.com/

This does not make any sense at all.

The call site is:

    if (audit_context())
    	syscall_enter_audit(....);

audit.h has:

#ifdef CONFIG_AUDITSYSCALL
...
#else
static inline struct audit_context *audit_context(void) { return NULL; }
#endif

which means the call to syscall_enter_audit() should not ever end up in
the linker phase due to dead code elimination.

Such constructs which rely on dead code elimination are not unique. The
kernel is full of them.

The .config in the report builds without problems with s390-linux-gcc
15.2.0 (I verified that before merging), but fails with the version used
by the robot:

   compiler: s390-linux-gcc (GCC) 13.4.0

So that's a broken compiler and without understanding the actual root
cause we are not going to paper over it.

When I disable CONFIG_KASAN in that config the problem goes away....

I have no idea how that's related especially as the code in question is
non instrumentable to begin with.

Looking at the disassembly:

        if (unlikely(audit_context()))
 2da:   c0 e5 00 00 00 00       brasl   %r14,2da <__do_syscall+0x2da>
                  2dc: R_390_PLT32DBL     audit_context+0x2

So dead code elimination does not work because the compiler puts the
stub return NULL inline out of line....

The proper fix is below. The fixes tag wants to be:

Fixes: s390 cross GCC 13.4.0 brainfart

Thanks,

        tglx
---
 include/linux/audit.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -343,7 +343,7 @@ static inline void audit_set_context(str
 	task->audit_context = ctx;
 }
 
-static inline struct audit_context *audit_context(void)
+static __always_inline struct audit_context *audit_context(void)
 {
 	return current->audit_context;
 }
@@ -623,7 +623,7 @@ static inline bool audit_dummy_context(v
 }
 static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
 { }
-static inline struct audit_context *audit_context(void)
+static __always_inline struct audit_context *audit_context(void)
 {
 	return NULL;
 }

