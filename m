Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322402F29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 11:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA66BC433D2;
	Tue, 11 Apr 2023 11:13:58 +0000 (UTC)
Date: Tue, 11 Apr 2023 12:13:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: drivers/acpi/acpica/tbfind.c:60:9: error: 'strncpy' specified
 bound 6 equals destination size
Message-ID: <ZDVA8ykiKaXSzJdM@arm.com>
References: <202304071552.CeeIBr5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304071552.CeeIBr5P-lkp@intel.com>

On Fri, Apr 07, 2023 at 03:02:15PM +0800, kernel test robot wrote:
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f2afccfefe7be1f7346564fe619277110d341f9b
> commit: 8f9e0a52810dd83406c768972d022c37e7a18f1f ACPI: Don't build ACPICA with '-Os'
> date:   2 months ago
> config: x86_64-sof-customedconfig-fuzz-defconfig (https://download.01.org/0day-ci/archive/20230407/202304071552.CeeIBr5P-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f9e0a52810dd83406c768972d022c37e7a18f1f
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 8f9e0a52810dd83406c768972d022c37e7a18f1f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304071552.CeeIBr5P-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
> >> drivers/acpi/acpica/tbfind.c:60:9: error: 'strncpy' specified bound 6 equals destination size [-Werror=stringop-truncation]
>       60 |         strncpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/acpi/acpica/tbfind.c:61:9: error: 'strncpy' specified bound 8 equals destination size [-Werror=stringop-truncation]
>       61 |         strncpy(header.oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors

I think the kernel test robot should filter out any reports related to
this commit. The warning has nothing to do with the -O2 vs -Os change.
It's simply that the compiler now warns if strncpy() has the destination
size equal to the bound parameter (for some reason it doesn't do this
with -Os). I mentioned it on a different report here:

https://lore.kernel.org/all/Y%2FdM77YdzDKRDdj1@arm.com/

A potential solution to silence the compiler is to go through the ACPI
code and change those strncpy() instances to memcpy(). I don't think
those strings are even null-terminated in the APCI spec, so using
strncpy() doesn't make sense.

-- 
Catalin
