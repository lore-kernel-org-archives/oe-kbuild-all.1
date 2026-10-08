Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4421721A42D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468658; cv=none; b=CnFxwqja4JetfTSXpZ+R60ZbG7L0lCoaxWfZkyuEi7S6iDv3ZyEP+qhevu1csgj9zTThP4WV84WvwAyD1vHfzgG6Gz0aP1g7QOmuSkEKayy7sC/ly4Eiaz1CsoeZbZvyslZCkxMZVqWaLwU0D6LtqdxLNqtI5nlYexY3X8YLnKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468658; c=relaxed/simple;
	bh=11YN47fiRQVc32YOlWJvrtgT31daIufFsibyeggGjOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJn+acroaWln7KFj1oZXbbGyHIkfhEVkuEeBgoXJ53S1D3sXHtmQVD7OjVaJLs8C6HBG3dhcGzpab0ROZKqcf4TqghFQ8jR7di6OEFFEnyycQyTS2IORFGhVWRyBq4imUSvNXw4pkOKM4RBWj1W7tiraa4docniU5csZasloH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpGGGu9y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpGGGu9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE531F000FF;
	Thu,  8 Oct 2026 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468657;
	bh=c0a9LZzwbIiUx8PZ3d/oKlJpxaZSzXDoCUdMpfXwAzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EpGGGu9y/bCinzqQsaLplmqnj9OCwfosNU8mRw9YD5cXFVwLKMsxTL8GZMG09ycbv
	 ntKT2+KjoqG5eXXjz8OogSWmKtuqd3IxTAodI+ERrLIFgD5W2BQx/Ducw0fOI5I/pv
	 yOG96iWYQcCb5yz5AF8iNCTf/p9ydQfkl5T9/dgKzIc8wU1HEkqNJc99nGjcklncwN
	 BwIdvdL7c/SH3ofgp4pviD9aa67aKXV0Z4vmyINyin2ldSuFXSeJxLnsUh9eGkmzcE
	 rjpjvvsx8JWPm7jndrf9eT2u2rbX3t2Pb376JCxGG11c6RxiBIBPsI768BbfERLiTg
	 RwQHuanAnHyCw==
Date: Thu, 8 Oct 2026 21:50:56 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [pjw-riscv:temp-testing 22/25]
 arch/riscv/kernel/cpufeature.c:943:7: error: '_pgtable_l4_enabled'
 undeclared; did you mean 'pgtable_l4_enabled'?
Message-ID: <asefwIv5ek2mFPdX@xhacker>
References: <202610072042.NzBrZDn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202610072042.NzBrZDn5-lkp@intel.com>

On Wed, Oct 07, 2026 at 08:52:03PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git temp-testing
> head:   2bb0a02401f8949ca3f8c12cf1b6cf01bf41eb9e
> commit: 016fdf4cebe05b68f13128f1eb12537b10a89d66 [22/25] riscv: support early isa ext and use it to optimize pgtable_l4|l5_enabled
> config: riscv-randconfig-2000-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072042.NzBrZDn5-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072042.NzBrZDn5-lkp@intel.com/reproduce)

oops, I missed riscv32. Let me fix it and send out a new version.

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610072042.NzBrZDn5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/riscv/kernel/cpufeature.c: In function 'riscv_fill_hwcap_from_isa_string':
> >> arch/riscv/kernel/cpufeature.c:943:7: error: '_pgtable_l4_enabled' undeclared (first use in this function); did you mean 'pgtable_l4_enabled'?
>       if (_pgtable_l4_enabled)
>           ^~~~~~~~~~~~~~~~~~~
>           pgtable_l4_enabled
>    arch/riscv/kernel/cpufeature.c:943:7: note: each undeclared identifier is reported only once for each function it appears in
> >> arch/riscv/kernel/cpufeature.c:945:7: error: '_pgtable_l5_enabled' undeclared (first use in this function); did you mean 'pgtable_l5_enabled'?
>       if (_pgtable_l5_enabled)
>           ^~~~~~~~~~~~~~~~~~~
>           pgtable_l5_enabled
>    arch/riscv/kernel/cpufeature.c: In function 'riscv_fill_hwcap_from_ext_list':
>    arch/riscv/kernel/cpufeature.c:1108:7: error: '_pgtable_l4_enabled' undeclared (first use in this function); did you mean 'pgtable_l4_enabled'?
>       if (_pgtable_l4_enabled)
>           ^~~~~~~~~~~~~~~~~~~
>           pgtable_l4_enabled
>    arch/riscv/kernel/cpufeature.c:1110:7: error: '_pgtable_l5_enabled' undeclared (first use in this function); did you mean 'pgtable_l5_enabled'?
>       if (_pgtable_l5_enabled)
>           ^~~~~~~~~~~~~~~~~~~
>           pgtable_l5_enabled
> 
> 
> vim +943 arch/riscv/kernel/cpufeature.c
> 
>    882	
>    883	static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>    884	{
>    885		struct device_node *node;
>    886		const char *isa;
>    887		int rc;
>    888		struct acpi_table_header *rhct;
>    889		acpi_status status;
>    890		unsigned int cpu;
>    891		u64 boot_vendorid;
>    892		u64 boot_archid;
>    893	
>    894		if (!acpi_disabled) {
>    895			status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
>    896			if (ACPI_FAILURE(status))
>    897				return;
>    898		}
>    899	
>    900		boot_vendorid = riscv_get_mvendorid();
>    901		boot_archid = riscv_get_marchid();
>    902	
>    903		for_each_possible_cpu(cpu) {
>    904			struct riscv_isainfo *isainfo = &hart_isa[cpu];
>    905			unsigned long this_hwcap = 0;
>    906			DECLARE_BITMAP(source_isa, RISCV_ISA_EXT_MAX) = { 0 };
>    907	
>    908			if (acpi_disabled) {
>    909				node = of_cpu_device_node_get(cpu);
>    910				if (!node) {
>    911					pr_warn("Unable to find cpu node\n");
>    912					continue;
>    913				}
>    914	
>    915				rc = of_property_read_string(node, "riscv,isa", &isa);
>    916				of_node_put(node);
>    917				if (rc) {
>    918					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>    919					continue;
>    920				}
>    921			} else {
>    922				rc = acpi_get_riscv_isa(rhct, cpu, &isa);
>    923				if (rc < 0) {
>    924					pr_warn("Unable to get ISA for the hart - %d\n", cpu);
>    925					continue;
>    926				}
>    927			}
>    928	
>    929			riscv_parse_isa_string(isa, source_isa);
>    930	
>    931			/*
>    932			 * These ones were as they were part of the base ISA when the
>    933			 * port & dt-bindings were upstreamed, and so can be set
>    934			 * unconditionally where `i` is in riscv,isa on DT systems.
>    935			 */
>    936			if (acpi_disabled) {
>    937				set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
>    938				set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);
>    939				set_bit(RISCV_ISA_EXT_ZICNTR, source_isa);
>    940				set_bit(RISCV_ISA_EXT_ZIHPM, source_isa);
>    941			}
>    942	
>  > 943			if (_pgtable_l4_enabled)
>    944				set_bit(RISCV_ISA_EXT_SV48, source_isa);
>  > 945			if (_pgtable_l5_enabled)
>    946				set_bit(RISCV_ISA_EXT_SV57, source_isa);
>    947	
>    948			/*
>    949			 * "V" in ISA strings is ambiguous in practice: it should mean
>    950			 * just the standard V-1.0 but vendors aren't well behaved.
>    951			 * Many vendors with T-Head CPU cores which implement the 0.7.1
>    952			 * version of the vector specification put "v" into their DTs.
>    953			 * CPU cores with the ratified spec will contain non-zero
>    954			 * marchid.
>    955			 */
>    956			if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0)
>    957				clear_bit(RISCV_ISA_EXT_V, source_isa);
>    958	
>    959			riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
>    960	
>    961			/*
>    962			 * All "okay" hart should have same isa. Set HWCAP based on
>    963			 * common capabilities of every "okay" hart, in case they don't
>    964			 * have.
>    965			 */
>    966			if (elf_hwcap)
>    967				elf_hwcap &= this_hwcap;
>    968			else
>    969				elf_hwcap = this_hwcap;
>    970	
>    971			if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
>    972				bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
>    973			else
>    974				bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
>    975		}
>    976	
>    977		if (!acpi_disabled && rhct)
>    978			acpi_put_table((struct acpi_table_header *)rhct);
>    979	}
>    980	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
