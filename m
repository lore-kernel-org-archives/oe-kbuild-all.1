Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6D20FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 16:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AD3C433D2;
	Fri, 20 Jan 2023 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674232327;
	bh=RQK1S2kSb5uqtRBO1VzOtPTVmv2Wz9JnV81CiXqpYA8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rnnAYdm5f8knPI5ADEDMHod4dePUQXi/wJZKjB9kr1DbD2FULcNtRY1vLKO4YbeWg
	 8zwIeZNvemEzKdUv+H1ccdvSeXilqDzbyNLn8iNYgVRIunPU+TfZwis1AiMXNoS/e8
	 dHJnwrAtA1MvhQuXV9Ll/Xpz2ZLQPWHrEWZd6lNZstCXNp3L6WU/C32dlR5VGGbLLH
	 n8qrCbHeeBG3Lu27NzJ80wjfdCVskYMwxyZWQwOOYq0x3HX4a37EYsBX7MwV7w7JRU
	 Ry3TefNRDSrjYoF30o7fTts3g+DQ+/X83uT0AuU8eKgNdg3VluKdtN5TcABUTupZGB
	 RM6jP/cnrep/g==
Date: Fri, 20 Jan 2023 10:32:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [djiang:cxl-emulate-hdm 1/9] arch/x86/pci/mmconfig-shared.c:451:
 undefined reference to `efi'
Message-ID: <20230120163205.GA642679@bhelgaas>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301200823.art1eu2t-lkp@intel.com>

On Fri, Jan 20, 2023 at 08:53:56AM +0800, kernel test robot wrote:
> Hi Bjorn,
> 
> FYI, the error/warning still remains.

Possibly the cxl-emulate-hdm branch should be updated?  The current
file in Linus' tree does not have this problem:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/pci/mmconfig-shared.c?id=v6.2-rc4#n446

The commit that was merged is:

  https://git.kernel.org/linus/fd3a8cff4d4a

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-emulate-hdm
> head:   6c7fe26eb2f67816411bb41a976a6c50056aa574
> commit: b2b6d47f1b29b36472a90db110c9d2d421f04627 [1/9] x86/pci: Treat EfiMemoryMappedIO as reservation of ECAM space
> config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230120/202301200823.art1eu2t-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=b2b6d47f1b29b36472a90db110c9d2d421f04627
>         git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
>         git fetch --no-tags djiang cxl-emulate-hdm
>         git checkout b2b6d47f1b29b36472a90db110c9d2d421f04627
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: arch/x86/pci/mmconfig-shared.o: in function `is_efi_reserved':
> >> arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
> >> ld: arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
> >> ld: arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
> 
> 
> vim +451 arch/x86/pci/mmconfig-shared.c
> 
>    445	
>    446	static bool is_efi_reserved(u64 start, u64 end, enum e820_type not_used)
>    447	{
>    448		efi_memory_desc_t *md;
>    449		u64 size, mmio_start, mmio_end;
>    450	
>  > 451		for_each_efi_memory_desc(md) {
>    452			if (md->type == EFI_MEMORY_MAPPED_IO) {
>    453				size = md->num_pages << EFI_PAGE_SHIFT;
>    454				mmio_start = md->phys_addr;
>    455				mmio_end = mmio_start + size - 1;
>    456	
>    457				if (mmio_start <= start && end <= mmio_end)
>    458					return true;
>    459			}
>    460		}
>    461	
>    462		return false;
>    463	}
>    464	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
