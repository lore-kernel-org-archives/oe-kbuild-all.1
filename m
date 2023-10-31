Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C591D289
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUiHrSqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CD2C433C7;
	Tue, 31 Oct 2023 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698765793;
	bh=DNS7Led7XteASI8BJ9J6/kZQu8gsY1vHkII4+CuQzAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LUiHrSqRR/a+NNV64ofMXSwqTZ2smdatebIhMLVF1O9nu2jvxbqt/rFrIcwT34Rsj
	 xCZhKJWLikiMqRWmceLSEavy487xDVK+Wn+AuOwtjYbgR6eB2RrBQAOmPDFhp1xZA7
	 C6p3R+YsDJ+yTPwJowzZzG31NLxRbEGhbaXkj1SQcf75MJVv0jqUE5reGvd222vyLa
	 iLdvvBVU5Dk8aOBiLzmdETwqt4wLOT/Rrfw0vwtrJdJMpknbucc/6BMp7Nk4In+CUT
	 n38DrtDASTYzvjC7aiEJE68UJ16nhk+iDyXUxw9c101SRix7qy07k/v6MwrDhZsfzs
	 J1bRdpH/qVAHA==
Date: Tue, 31 Oct 2023 10:23:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: D Scott Phillips <scott@os.amperecomputing.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 14769/15220]
 drivers/pci/hotplug/acpiphp_ampere_altra.c:63:75: warning: suggest
 parentheses around arithmetic in operand of '|'
Message-ID: <20231031152311.GA10429@bhelgaas>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310270037.19V5rqDL-lkp@intel.com>

On Fri, Oct 27, 2023 at 12:51:23AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
> commit: 13ba8a09c4f6fd87b4919ed2dc5e0dbf27c3de7e [14769/15220] PCI: hotplug: Add Ampere Altra Attention Indicator extension driver
> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270037.19V5rqDL-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270037.19V5rqDL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310270037.19V5rqDL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/psci.h:10,
>                     from arch/arm64/include/asm/acpi.h:14,
>                     from include/acpi/acpi_io.h:7,
>                     from include/linux/acpi.h:37,
>                     from include/linux/pci_hotplug.h:92,
>                     from drivers/pci/hotplug/acpiphp_ampere_altra.c:14:
>    drivers/pci/hotplug/acpiphp_ampere_altra.c: In function 'set_attention_status':
> >> drivers/pci/hotplug/acpiphp_ampere_altra.c:63:75: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
>       63 |                      PCI_SLOT(root_port->devfn) << 4 | pci_domain_nr(bus) & 0xf,
>          |                                                        ~~~~~~~~~~~~~~~~~~~^~~~~
>    include/linux/arm-smccc.h:380:44: note: in definition of macro 'arm_smccc_smc'
>      380 | #define arm_smccc_smc(...) __arm_smccc_smc(__VA_ARGS__, NULL)
>          |                                            ^~~~~~~~~~~

Just for the record, this should be resolved by
https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=820f59ed9680,
which is in the current PCI -next branch.

> vim +63 drivers/pci/hotplug/acpiphp_ampere_altra.c
> 
>     38	
>     39	static int set_attention_status(struct hotplug_slot *slot, u8 status)
>     40	{
>     41		struct arm_smccc_res res;
>     42		struct pci_bus *bus;
>     43		struct pci_dev *root_port;
>     44		unsigned long flags;
>     45		u32 handle;
>     46		int ret = 0;
>     47	
>     48		bus = slot->pci_slot->bus;
>     49		root_port = pcie_find_root_port(bus->self);
>     50		if (!root_port)
>     51			return -ENODEV;
>     52	
>     53		local_irq_save(flags);
>     54		arm_smccc_smc(HANDLE_OPEN, led_service_id[0], led_service_id[1],
>     55			      led_service_id[2], led_service_id[3], 0, 0, 0, &res);
>     56		if (res.a0) {
>     57			ret = -ENODEV;
>     58			goto out;
>     59		}
>     60		handle = res.a1 & 0xffff0000;
>     61	
>     62		arm_smccc_smc(REQUEST, LED_CMD, led_status(status), LED_ATTENTION,
>   > 63			     PCI_SLOT(root_port->devfn) << 4 | pci_domain_nr(bus) & 0xf,
>     64			     0, 0, handle, &res);
>     65		if (res.a0)
>     66			ret = -ENODEV;
>     67	
>     68		arm_smccc_smc(HANDLE_CLOSE, handle, 0, 0, 0, 0, 0, 0, &res);
>     69	
>     70	 out:
>     71		local_irq_restore(flags);
>     72		return ret;
>     73	}
>     74	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
