Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462052C11EE;
	Wed,  7 Jan 2026 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767775139; cv=none; b=XMXy6tQgtGGEjngZibaFxHwkTlqcPWCAyeQqIfGMbC+z1zXKClB1dMdm+cmMIq4YSPBZKg0xOSkhq9IpaGAYrCOm9AKZfRyXZuyFCsCTG0SnzOElNZosNSGKKPLFjZd8Bo8BZoumD4aLqTU33KS8HPYp8z6JRcfC6V5dLg62rZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767775139; c=relaxed/simple;
	bh=zI9NvW+Chi/NqcOnZO2f4rvHFuHVtmoe/6GjcEeeLbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezO/lFV4MZ1iTtpnCOMuqePf84TO85K+V16y7mfHo5kcO4E8nxALsmURDVDTu9o79E1MVl9igtGI6U7bE/i4FCTzYg+icnW7yf9KWj0op3RcOF9Z7X0/FMMYUXV0eMtd3BFQDmGSUfMZB9fbUY8LSIRRmdfC4pjqTLITyiS5OVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tytTq0KE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tytTq0KE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02FEC19421;
	Wed,  7 Jan 2026 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767775138;
	bh=zI9NvW+Chi/NqcOnZO2f4rvHFuHVtmoe/6GjcEeeLbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tytTq0KE5g9qGvkv7sGYG54J2g00p3+cT++aX5HrUHCOhb2qVlAW08w6xeFmG918M
	 8qbwZLzdIFgxqbDSKtAWpJV5xz34s8ExZ6N5sRubhM9LrjV5lCMhlrVzNw2YSwUCPZ
	 pk4EvKdUjZ+0zFcMJK+oSl4yZVhOjf46RTn0CDhKDQWs8jqW/KRfD7vzYiKvDHYRou
	 DVNBDyj5FCp3ta5mHaZUUVNeD+ycW4dnPVxY0cu6oYfhjzpLeGLFjB6y302xpKb4aZ
	 G41MA099ytUg78FT4wIYH4zoIEtvp4GxV64DVbe2QB+YgSDSYj5HQfTxerAB5YJy/q
	 B9Oqytu0iQ+Pw==
Date: Wed, 7 Jan 2026 10:38:52 +0200
From: Mike Rapoport <rppt@kernel.org>
To: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: Re: [akpm-mm:mm-nonmm-unstable 102/107] htmldocs: Warning:
 kernel/liveupdate/luo_core.c references a file that doesn't exist:
 Documentation/core-api/kho/concepts.rst
Message-ID: <aV4bnHlBXGpT_FMc@kernel.org>
References: <202601061635.i4VQmlUw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601061635.i4VQmlUw-lkp@intel.com>

On Tue, Jan 06, 2026 at 04:52:06PM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   bf64790fd7f2a71c84dada79a573d37cb08adbe6
> commit: eee99407da66f5f657ba0599b4d6157b59be3721 [102/107] kho: docs: combine concepts and FDT documentation
> reproduce: (https://download.01.org/0day-ci/archive/20260106/202601061635.i4VQmlUw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601061635.i4VQmlUw-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>    Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>    Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
>    Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
>    Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
> >> Warning: kernel/liveupdate/luo_core.c references a file that doesn't exist: Documentation/core-api/kho/concepts.rst
>    Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
>    Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
>    Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
>    Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
>    Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
> --
>    ERROR: Cannot find file ./include/linux/mutex.h
>    ERROR: Cannot find file ./include/linux/mutex.h
>    WARNING: No kernel-doc for file ./include/linux/mutex.h
>    ERROR: Cannot find file ./include/linux/fwctl.h
>    WARNING: No kernel-doc for file ./include/linux/fwctl.h
> >> Documentation/admin-guide/mm/kho.rst:10: WARNING: undefined label: 'kho-concepts' [ref.ref]
> >> Documentation/admin-guide/mm/kho.rst:31: WARNING: undefined label: 'kho-finalization-phase' [ref.ref]

Andrew, can you please fold this into "kho: docs: combine concepts and FDT
documentation"?

diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
index f56579b5c351..dcc6a36cc134 100644
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0-or-later
 
+.. _kho-concepts:
+
 ========================
 Kexec Handover Subsystem
 ========================
@@ -69,6 +71,8 @@ for boot memory allocations and as target memory for kexec blobs, some parts
 of that memory region may be reserved. These reservations are irrelevant for
 the next KHO, because kexec can overwrite even the original kernel.
 
+.. _kho-finalization-phase:
+
 KHO finalization phase
 ======================
 
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 944663d99dd9..a26c093eb8eb 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -35,8 +35,7 @@
  * iommu, interrupts, vfio, participating filesystems, and memory management.
  *
  * LUO uses Kexec Handover to transfer memory state from the current kernel to
- * the next kernel. For more details see
- * Documentation/core-api/kho/concepts.rst.
+ * the next kernel. For more details see Documentation/core-api/kho/index.rst.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Sincerely yours,
Mike.
