Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35D2564
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 11:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F64C433EF;
	Thu, 23 Feb 2023 11:24:34 +0000 (UTC)
Date: Thu, 23 Feb 2023 11:24:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>
Subject: Re: include/acpi/actypes.h:525:42: warning: 'strncpy' specified
 bound 4 equals destination size
Message-ID: <Y/dM77YdzDKRDdj1@arm.com>
References: <202302230414.sQbDHtiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302230414.sQbDHtiC-lkp@intel.com>

On Thu, Feb 23, 2023 at 04:32:41AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   70756b49be4ea8bf36a664322df6e7e89895fa60
> commit: 8f9e0a52810dd83406c768972d022c37e7a18f1f ACPI: Don't build ACPICA with '-Os'
> date:   4 weeks ago
> config: ia64-defconfig (https://download.01.org/0day-ci/archive/20230223/202302230414.sQbDHtiC-lkp@intel.com/config)
> compiler: ia64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f9e0a52810dd83406c768972d022c37e7a18f1f
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 8f9e0a52810dd83406c768972d022c37e7a18f1f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/acpica/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302230414.sQbDHtiC-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/acpi/acpi.h:24,
>                     from drivers/acpi/acpica/tbfind.c:10:
>    drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
> >> include/acpi/actypes.h:525:42: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
>      525 | #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
>          |                                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I don't see how this is related to the reported commit (which only
removed the -Os option for gcc). I think ACPI_COPY_NAMESEG() should just
use memcpy() on ia64 but this strncpy() has been around for over 10
years.

-- 
Catalin
