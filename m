Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1938B1F95E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725122003; cv=none; b=SO85Ek1Y7s3+pHHneiwDyX+UHNtHO/+7W00nxrm66ccCC9LPWktRfapc4WbGOk+0jqtDi4mIJY4DWcxwvCTi2qgVOa9X0pz26jy8/N5W2q+FKwxdy203YWnKxU9KfTuiYcx50ncDkW8ESM3p0WhmJYmwFYKqzR4HRKriaMadrD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725122003; c=relaxed/simple;
	bh=wDgt590Te46EjOi9qSGqwufzTUGksG92fulc4PPZMhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRZ4FiSVg58xoOrDAN54o+cmRTRbgVEJY9L+U/5XUrqo6VrSf5Acqzg6WrFN5CniziSILEcq4OngG/wVtOldYOPIBlBLrcA3Rld9cTuStdYqpIKGGAeerwgJf4qQe1yh+/meoARBkpC9AKbQ3KWZqq5duIYTXWhwQvkZBAXzen8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gG9QGZ3U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gG9QGZ3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725122000; x=1756658000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wDgt590Te46EjOi9qSGqwufzTUGksG92fulc4PPZMhs=;
  b=gG9QGZ3UZW3ufyY3c2EizDj2NDHoeWEUm4J74MaWekabLqM4qWJV4u0h
   rSVgUUqhb3BcwUDBolO+13mQSy91bG4ui7nwc3WpPLnNzVg6TA12OdWGJ
   ZMoqaD1arJ0TrEYTK5PRBE7UIaZl9X/q7vFYM3aeWP15sdKtbBeM7Z+7q
   PcO05nTQ/ItmqZeMM7W+ytBXLMt/HfqvphuckqTqhCe4E9fz2UzzeXoYD
   NMa8ZIAGX9+/xY5ZcHBJw8RHcBGvl1Kd6N1H70u6DY2r2hFidc/rsXpLw
   1QyHvRrDfO+aAXJwDSa70VAYcfAVGjQW+gfqAVMM2850YEj9nKm82aDB9
   Q==;
X-CSE-ConnectionGUID: nxzJVwGpT0OivQlfEULiow==
X-CSE-MsgGUID: yCxL6URJSIS4EtqeM//EQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34912736"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34912736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 09:33:20 -0700
X-CSE-ConnectionGUID: 2Txx0GxZT8yv4m1E3QP/lQ==
X-CSE-MsgGUID: tsV617zHSoOipwpSkfw7UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64009498"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2024 09:33:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skR2E-0002vq-28;
	Sat, 31 Aug 2024 16:33:10 +0000
Date: Sun, 1 Sep 2024 00:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jens Axboe <axboe@kernel.dk>, Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>, leit@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Xiongwei Song <xiongwei.song@windriver.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH] docs: Move fault injection section to dev-tools
Message-ID: <202408312350.DEf53QzI-lkp@intel.com>
References: <20240830174502.3732959-1-leitao@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830174502.3732959-1-leitao@debian.org>

Hi Breno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on axboe-block/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus mkp-scsi/for-next jejb-scsi/for-next arnd-asm-generic/master akpm-mm/mm-nonmm-unstable linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/docs-Move-fault-injection-section-to-dev-tools/20240831-014654
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20240830174502.3732959-1-leitao%40debian.org
patch subject: [PATCH] docs: Move fault injection section to dev-tools
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408312350.DEf53QzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312350.DEf53QzI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/fault-injection/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
