Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39A333E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 12:53:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E48D2C14;
	Mon, 27 Feb 2023 04:54:24 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.17.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE3D53F67D;
	Mon, 27 Feb 2023 04:53:40 -0800 (PST)
Date: Mon, 27 Feb 2023 12:53:38 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>
Subject: Re: include/acpi/actypes.h:525:42: warning: 'strncpy' specified
 bound 4 equals destination size
Message-ID: <Y/yn0oSpUop8UPon@FVFF77S0Q05N>
References: <202302230414.sQbDHtiC-lkp@intel.com>
 <Y/dM77YdzDKRDdj1@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/dM77YdzDKRDdj1@arm.com>

On Thu, Feb 23, 2023 at 11:24:31AM +0000, Catalin Marinas wrote:
> On Thu, Feb 23, 2023 at 04:32:41AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   70756b49be4ea8bf36a664322df6e7e89895fa60
> > commit: 8f9e0a52810dd83406c768972d022c37e7a18f1f ACPI: Don't build ACPICA with '-Os'
> > date:   4 weeks ago
> > config: ia64-defconfig (https://download.01.org/0day-ci/archive/20230223/202302230414.sQbDHtiC-lkp@intel.com/config)
> > compiler: ia64-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f9e0a52810dd83406c768972d022c37e7a18f1f
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 8f9e0a52810dd83406c768972d022c37e7a18f1f
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/acpica/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202302230414.sQbDHtiC-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from include/acpi/acpi.h:24,
> >                     from drivers/acpi/acpica/tbfind.c:10:
> >    drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
> > >> include/acpi/actypes.h:525:42: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
> >      525 | #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
> >          |                                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I don't see how this is related to the reported commit (which only
> removed the -Os option for gcc).

I looks like `-Os` disables the warning for some reason. I suspect that's down
to compiler passes not propagating the constants when using `-Os`.

The actual issue has nothing to do with this patch; this patch just happens to
have unearthed it.

> I think ACPI_COPY_NAMESEG() should just use memcpy() on ia64 but this
> strncpy() has been around for over 10 years.

Agreed.

IIUC ia64 is likely to disappear soon, so maybe we don't need to touch this...

Thanks,
Mark.
