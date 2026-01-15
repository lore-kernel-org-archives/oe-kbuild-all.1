Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF31253B73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 02:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768445105; cv=none; b=DMTxLVATEOlWZwxzbVZ2/W/CCAoE9AyU00jnp+zaqLUXEbEEEP+opfyL/JWfrzZt+RppQEhAm5gT5hl8VABeWPqp2i/YoJF/2Q4pQC/JSHaB04JLka9Cvl0LOUMc80HsI2EIQmUqAfbgceAJjoUPU+DhqQRy0oR7+YyxNjUjoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768445105; c=relaxed/simple;
	bh=EbKfkObvFITDuJqXS218LcpddCLrRivjyoZZtU8h7wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=njYbKb7x5yvxSmV7XcyaAN7stfi7XORfRZRPsNB6W8Keb3/dJ6dQj54GvDH8gUGcZgXgBtzKGsKc16sZGB31qTEgz2/IZat0okvmMoM84QeItZgdofi0JybOgsRsCzls8/zlW4J5pwbj2hgMGHqW9Fj3mDK8W549XrhVzWBrjv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TFYyYYtB; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TFYyYYtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vA
	4sG2LcbrHKYOPfRfHsAEkNum7WWXZhFvlb2/tyyv4=; b=TFYyYYtBiwIdA4AhIj
	OI27ipBY6bTZD7fnjgVPi2lLbHb5s5LAbNlh1yZ8qn0eM/7IndXz+ZTHkYpdx9SO
	LAvSyAD/Bo6RoWlqNsgVC+BkvqA7VJkqqhjbFtcG0XGQgz/HGxoTq4aaRyEiQmac
	/XClkkUEObqhczSmcbuRDDb2k=
Received: from X13.domain.sensetime.com (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHirCJVGhp+fTaLA--.16632S2;
	Thu, 15 Jan 2026 10:44:28 +0800 (CST)
From: junan <junan76@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	junan76@163.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
Date: Thu, 15 Jan 2026 10:34:18 +0800
Message-ID: <20260115023456.621586-2-junan76@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBHirCJVGhp+fTaLA--.16632S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrW8uFW3JF17JF18Zr4UXFb_yoW8CrW7pw
	n3uwnrJFW7Grn3JaykK3y3uF45Zan5Jay3WFW5C34jyrnrA34DuF9YvwnIvFWDX34Uu3yf
	ua4Sv3W2qw18XwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRVyxZUUUUU=
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1A2sXmloVI0FzgAA34

Make "STRICT_KERNEL_RWX" visable to menuconfig on arm64 platform.

Breakpoints can not be set when using kgdb/kdb if "STRICT_KERNEL_RWX"
equals to "y", but it has a default value "y" and is not visable in
menuconfig on arm64.

Link to kgdb/kdb doc: https://docs.kernel.org/process/debugging/kgdb.html

Changes in v2:
	- Fix link error of "rodata_enabled" when allnoconfig is set
	- link to v1: https://lore.kernel.org/linux-arm-kernel/20260114013859.498148-2-junan76@163.com/

Signed-off-by: junan <junan76@163.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601141630.sCPCgSYw-lkp@intel.com/
---
 arch/arm64/Kconfig  | 2 ++
 arch/arm64/mm/mmu.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..cc3aaffa1e12 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -52,6 +52,8 @@ config ARM64
 	select ARCH_STACKWALK
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_STRICT_MODULE_RWX
+	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
+	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYSCALL_WRAPPER
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8e1d80a7033e..4770204d9e22 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1314,7 +1314,11 @@ void __init kpti_install_ng_mappings(void)
 
 static pgprot_t __init kernel_exec_prot(void)
 {
+#if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_STRICT_MODULE_RWX)
 	return rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
+#else
+	return PAGE_KERNEL_EXEC;
+#endif
 }
 
 static int __init map_entry_trampoline(void)
-- 
2.43.0

