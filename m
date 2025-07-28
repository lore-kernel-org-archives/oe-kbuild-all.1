Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1656219F40A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 06:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682653; cv=none; b=sEboUYr6Ii2QnahhxgNUZN7A24OZGvQj+1KQnuWPq3CVBRnA0KGApwDl/oxHqprzfqpkCAnnaFEccW6/Loh7kB82F2dT2pFYsmQCZufvu1HReyYuHCGpuWy1KGQKKiTOzq8BYBihecrhOLaoml9vh/rC05BtsuGfQLZB6AvGLVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682653; c=relaxed/simple;
	bh=+ulns0s/bpAdIFecdyr5mmbCt4ova4eNpbdc5rUXdjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6ErnNwCsibvDGk/9RvM+PNjB+HUiM5DexCBI0IsntZBIC9+XqSft5z56UoMTcR9GPaZUYvoejPNZp+1nYdn70aJx74pEY/nTH3tA8QbA1tIHlTN5iOHr5OtSRZU5acG66ZzbX6v9saxumZ5Ge7VB52V6jcItISB9Oo95KWlt1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwt1NJd/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwt1NJd/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B17C4CEE7;
	Mon, 28 Jul 2025 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753682652;
	bh=+ulns0s/bpAdIFecdyr5mmbCt4ova4eNpbdc5rUXdjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwt1NJd/K7JmdLcdB1qcKbEgAt+Cg4A4oVhanzFdRUR5oan0PfmZjAxyfFNCFg8Ly
	 +94Rh2YXSpuvg0VHo+fnt64O+iZlNLqvV2bMpaqd8cT+dtHdycMCMav8oJLdMA5QPV
	 Z+JYQgswwA4Gu0Qjjjy/GCzLgwH8e0bt4aeVYK0G3/x2ztJj6YzO2R5qd+vhZjB73a
	 yDNuJX88irytx36/oj8bMi2M/1gKQ3XBld0YzvahEQIuj+etv8sbkiQiKuH/m5OSXm
	 0YGY4qxQBhcpxqvOeEYJQej1ctpHKzeJyjGdowUw3PLjxzpum2p0Bsx/QT2aOutCul
	 HJnN06HipY5uQ==
Date: Sun, 27 Jul 2025 23:04:12 -0700
From: Kees Cook <kees@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 12136/12319] drivers/firmware/dmi_scan.c:692:
 undefined reference to `efi'
Message-ID: <202507272255.50254C0C@keescook>
References: <202507270258.neWuiXLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507270258.neWuiXLd-lkp@intel.com>

On Sun, Jul 27, 2025 at 03:04:55AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d7af19298454ed155f5cf67201a70f5cf836c842
> commit: 1ad483981776ff67e2b37bb6951412e608c55adb [12136/12319] init.h: Disable sanitizer coverage for __init and __head
> config: x86_64-randconfig-077-20250726 (https://download.01.org/0day-ci/archive/20250727/202507270258.neWuiXLd-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270258.neWuiXLd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507270258.neWuiXLd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: vmlinux.o: in function `setup_arch':
>    arch/x86/kernel/setup.c:987: undefined reference to `efi_init'
>    ld: arch/x86/kernel/setup.c:971: undefined reference to `efi_memblock_x86_reserve_range'
>    ld: vmlinux.o: in function `ms_hyperv_init_platform':
>    arch/x86/kernel/cpu/mshyperv.c:496: undefined reference to `isolation_type_tdx'
>    ld: arch/x86/kernel/cpu/mshyperv.c:494: undefined reference to `isolation_type_snp'
>    ld: vmlinux.o: in function `acpi_os_get_root_pointer':
>    drivers/acpi/osl.c:210: undefined reference to `efi'
>    ld: drivers/acpi/osl.c:210: undefined reference to `efi'
>    ld: drivers/acpi/osl.c:212: undefined reference to `efi'
>    ld: drivers/acpi/osl.c:212: undefined reference to `efi'
>    ld: vmlinux.o: in function `dmi_scan_machine':
> >> drivers/firmware/dmi_scan.c:692: undefined reference to `efi'
>    ld: vmlinux.o:drivers/firmware/dmi_scan.c:692: more undefined references to `efi' follow

This looks like a GCC bug that was fixed after GCC 12.

All the efi references are present even though CONFIG_EFI is not set in
the .config (all the checks are already wrapped in efi_enabled() calls,
which _should_ get DCEd by the compiler and leave no references to "efi"
nor "efi_init" behind.

i.e., with gcc 12:

$ nm gcc-bug/drivers/firmware/dmi_scan.o |grep efi
                 U efi

with gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0:

$ nm gcc-bug/drivers/firmware/dmi_scan.o |grep efi | wc -l
0


-- 
Kees Cook
