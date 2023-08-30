Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D252108
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ftSMG6EMiOdnvxq5TVyRzurN5ZLWXeox+LZJgoFCPZo=; b=KVIUBX2rx5s6iN3l/1Z3/oUSW8
	vn0H8jh7dMK5PpwG0A4nWIIAYUrIl6ZIOKuoWzmOH9bPWP9n7izLMrco5oR4SOhL+MPQ22fzotePe
	Mf8futihAPK3y27vP/g1OrqSJ8fAd7S2fqhWu+IhfeKf5zATxQlJ8J8CMAOKzibxd53KTacxzGRE2
	4LKG0fHfG5C3fLv2bs5mR7WSZKKEIg9JRv7fwWnR8XxjaPXEmVCOjohtLainIyzV73WK6ZBN24alR
	8xECfp2VY0lz4dweuDVF/zCBoTvsdRLbXonglYy+iPQcg+2cM70mZy+v2SsYHaBEnVHLt/nsYyd/Y
	WADnpLgw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51086)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qbIrN-0001Tt-0a;
	Wed, 30 Aug 2023 11:55:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qbIrL-0005cP-K6; Wed, 30 Aug 2023 11:55:39 +0100
Date: Wed, 30 Aug 2023 11:55:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: James Morse <james.morse@arm.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [rmk-arm:vcpu-rmk 31/33] acpi_processor.c:undefined reference to
 `arch_unregister_cpu'
Message-ID: <ZO8gKz6HK9F308tO@shell.armlinux.org.uk>
References: <202308300439.Cdlb0WA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308300439.Cdlb0WA9-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

I don't think this is a "new" issue as such, I think it's just that
the error context has changed.

Looking at the blamed commit, it's merely moving the call to
arch_unregister_cpu() from inside acpi_processor_get_info() to a new
function acpi_processor_make_enabled(), which now calls
arch_unregister_cpu() from two locations. Hence, I suppose it's one
more error that wasn't there before, but there was always one reference
to arch_unregister_cpu() that would've caused the reported error.

So, I don't think any action is required due to the changes that James'
patches make - riscv is no more broken before the patch than it is
after.

Thanks anyway.

On Wed, Aug 30, 2023 at 05:02:05AM +0800, kernel test robot wrote:
> tree:   git://git.armlinux.org.uk/~rmk/linux-arm vcpu-rmk
> head:   b74a4ba60fbf9e3f5fbcca347176c214dee19a68
> commit: 2cffbed2eaeecbf929d5c36313f2f90de5db8702 [31/33] ACPI: add support to register CPUs based on the _STA enabled bit
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230830/202308300439.Cdlb0WA9-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300439.Cdlb0WA9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308300439.Cdlb0WA9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L38':
>    acpi_processor.c:(.text+0x1a8): undefined reference to `arch_register_cpu'
>    riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L0 ':
>    acpi_processor.c:(.text+0x560): undefined reference to `arch_register_cpu'
>    riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_post_eject':
> >> acpi_processor.c:(.text+0x95c): undefined reference to `arch_unregister_cpu'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
