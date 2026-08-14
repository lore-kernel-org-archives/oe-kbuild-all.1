Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F635BDD5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722166; cv=none; b=D4Gixtr3m/gO96mYwLINt7aKO4kZvG0wu0tgJDnDuzwgRo/ERfgE78tAKQsYHpvJlrV0ujBkAFvWcunHTVJS+15izbZ7SEGVl/gCylwMoGyGDPhixqMJywzb6MI3Pymq6CTGv053iVNoKa6E4HAMK4Lg1969XEUL0/nwcXlDFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722166; c=relaxed/simple;
	bh=fxbnJdrTRr0um+4aluXhGRJ2r0C9VsyrarcgZbWR7PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj+MFTuPp/S85VOzZovbHTFx/QNkhgHWp8tn/3iq/OhyzRDKuv/haCHHBrSoiJFJeYJkPW5ucRfwR4ibrOpia32E6zKsifDUlruoyMtIh80LacMjZpMe56DFWYRQfJyYjgIMsr0dgSogPbqEhF7cnL/3qMUTvhIyDdWe5crP0Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1yJyI03; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1yJyI03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786722164; x=1818258164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fxbnJdrTRr0um+4aluXhGRJ2r0C9VsyrarcgZbWR7PM=;
  b=S1yJyI03p2zDFkM+pde2a2IJrvQgnlvUEpf5Ve/SNGJs6th3NWBUJWJh
   efW2cngQJPtpQEB+Zl9BFhHbU14pGnzUh9o6ZI9NXJxjqRFJoUiqYzjff
   VTBNYnko9aGrqD7Y9yhH5WlK5TznBYyl72QTVEVoUCEbshwvqatGtDr7o
   JRn1Ge5Ux8b1htvFaT1aOYtSiwDgUXdXI8HoL6HDYWR3U105nErZ3G9qq
   HPIMc2pSzLTISIJDqe/M+t7wdFqO0vz3qsW2d1ZVomKANaBt1TG6RisAj
   t0vsYf5Yl1Yp4I2zCuqUDb6ogR4WRpm628gZs4H6JQvMhkEy8+k8+feJw
   A==;
X-CSE-ConnectionGUID: 9i6Gjsi2R4eb+wNpxAuc1Q==
X-CSE-MsgGUID: 1kzR6Le6TKiu4oKNmMFb5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89820546"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="89820546"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 08:42:42 -0700
X-CSE-ConnectionGUID: IGYQR30JQT2Ruf8uvJmfew==
X-CSE-MsgGUID: uof/TsuUTduvQU8tZcs3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260468820"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2026 08:42:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuu3J-00000000ZQY-2zpm;
	Fri, 14 Aug 2026 15:42:37 +0000
Date: Fri, 14 Aug 2026 23:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"(open list:LINUX FOR POWERPC \\(32-BIT AND 64-BIT\\))" <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Connecting the SB600's i8259 controller rather in
 pasemi's pci.c than in pasemi's setup.c.
Message-ID: <202608142355.4AeDorvg-lkp@intel.com>
References: <20260701125941.906-2-chzigotzky@xenosoft.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701125941.906-2-chzigotzky@xenosoft.de>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v7.2-rc7 next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Zigotzky/Connecting-the-SB600-s-i8259-controller-rather-in-pasemi-s-pci-c-than-in-pasemi-s-setup-c/20260813-054214
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260701125941.906-2-chzigotzky%40xenosoft.de
patch subject: [PATCH] Connecting the SB600's i8259 controller rather in pasemi's pci.c than in pasemi's setup.c.
config: powerpc64-randconfig-r052-20260814 (https://download.01.org/0day-ci/archive/20260814/202608142355.4AeDorvg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142355.4AeDorvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608142355.4AeDorvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pasemi/setup.c:217:6: warning: no previous prototype for function 'nemo_init_IRQ' [-Wmissing-prototypes]
     217 | void nemo_init_IRQ(void)
         |      ^
   arch/powerpc/platforms/pasemi/setup.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     217 | void nemo_init_IRQ(void)
         | ^
         | static 
   1 warning generated.


vim +/nemo_init_IRQ +217 arch/powerpc/platforms/pasemi/setup.c

   216	
 > 217	void nemo_init_IRQ(void)
   218	{
   219		struct device_node *np;
   220		int gpio_virq;
   221	        struct mpic *mpic;
   222	
   223		/* Connect the SB600's legacy i8259 controller */
   224		np = of_find_node_by_path("/pxp@0,e0000000");
   225		i8259_init(np, 0);
   226		of_node_put(np);
   227	
   228		gpio_virq = irq_create_mapping(NULL, 3);
   229		irq_set_irq_type(gpio_virq, IRQ_TYPE_LEVEL_HIGH);
   230		irq_set_chained_handler(gpio_virq, sb600_8259_cascade);
   231		mpic_unmask_irq(irq_get_irq_data(gpio_virq));
   232	
   233		mpic = irq_get_chip_data(gpio_virq);
   234		irq_set_default_domain(mpic->irqhost);
   235	}
   236	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
