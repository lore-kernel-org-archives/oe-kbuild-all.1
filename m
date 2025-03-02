Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC17EEC8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 01:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740877959; cv=none; b=pV++FOhhC88HLLQA8ulWV0Lg46mviQFJM7zf+wsN++c1KijnEJ3dToHZdzLIf2zLIBXafYSfNHN2hfvY2YSB68vCD+qh8yY7J4YlNrqjENn4sKEFAIsgJY+LIEcXWJwHDSTOotZfmuvkm16MRe5PQuvST++cSlRjO1QIz4gjy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740877959; c=relaxed/simple;
	bh=aVx2loBUNf2ComRdrhJLPSjK5wr4/lMc9xmmvBjHxu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJSUoj00JVf7fD/29Pr7XdmyaDe6U2mFO3j73wK2+5NTcPXN2FOAEN9Pugy9U4xWdJeVBXOLp5hJPGS6inuSOlg+geQFu7+tt0pS1oUBT9zJ1cT6k2n7C/UmOCWmKqq+msHyVO03POijw6hj/1D5BmhexD3xaEPcAO+BXkVbqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3CyokAh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3CyokAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740877958; x=1772413958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVx2loBUNf2ComRdrhJLPSjK5wr4/lMc9xmmvBjHxu8=;
  b=A3CyokAhDazE4SMQg9Y5fK9s717ZcLx/k25XvsrLZgOnwuVcVoyQIHsD
   OOEY+OuIKO93jrKmIItpMqll8Z1wT9zbIlg74+YN0tBl6/pxXnZwF4HGU
   9znPWxtfI3JtjLAlfduEAn7HUkPmW9voYpglf2UgJcf7SL1/yI5BajDbE
   5joCrPohYpro4j7+rQT+z80QrkOXKYAd8sJ04zDjvF9/nctz8c6DfNPVa
   ifpgKdsdCbctEgoiSo/caHMxp8blqUcUtPcRBJo30NCm3wfJE5bZl2J8G
   D07TbFSJHYf68j9fRVxG6yTdCkI4JCMGfbC+9LJwBxjz3Q8vFF7nj0JSZ
   Q==;
X-CSE-ConnectionGUID: oGgkdAQYQNG6S+nRzW9xgg==
X-CSE-MsgGUID: svkIEgTLSK+73cdt0Coc8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41475827"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41475827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 17:12:36 -0800
X-CSE-ConnectionGUID: XExDBhaWRxmaGYPy4JIckQ==
X-CSE-MsgGUID: TnSuplBQSOSxUV1wBVnj6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122278013"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2025 17:12:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toXsc-000GvE-1z;
	Sun, 02 Mar 2025 01:12:30 +0000
Date: Sun, 2 Mar 2025 09:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, manivannan.sadhasivam@linaro.org,
	kw@linux.com, kwilczynski@kernel.org, bhelgaas@google.com,
	Frank.Li@nxp.com, cassel@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Zhang <18255117159@163.com>
Subject: Re: [v2] genirq/msi: Add the address and data that show MSI/MSIX
Message-ID: <202503020807.c3MhmbJh-lkp@intel.com>
References: <20250301123953.291675-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301123953.291675-1-18255117159@163.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on 76544811c850a1f4c055aa182b513b7a843868ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/genirq-msi-Add-the-address-and-data-that-show-MSI-MSIX/20250301-204332
base:   76544811c850a1f4c055aa182b513b7a843868ea
patch link:    https://lore.kernel.org/r/20250301123953.291675-1-18255117159%40163.com
patch subject: [v2] genirq/msi: Add the address and data that show MSI/MSIX
config: x86_64-buildonly-randconfig-003-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020807.c3MhmbJh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020807.c3MhmbJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020807.c3MhmbJh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/msi.c: In function 'msi_domain_debug_show':
>> kernel/irq/msi.c:770:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
     770 |         seq_printf(m, "%*s%s:", ind, "", is_msix ? "msix" : "msi");
         |         ^~~~~~~~~~
         |         bstr_printf
   kernel/irq/msi.c: At top level:
>> kernel/irq/msi.c:782:10: error: 'const struct irq_domain_ops' has no member named 'debug_show'
     782 |         .debug_show     = msi_domain_debug_show,
         |          ^~~~~~~~~~
>> kernel/irq/msi.c:782:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     782 |         .debug_show     = msi_domain_debug_show,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/irq/msi.c:782:27: note: (near initialization for 'msi_domain_ops')
   kernel/irq/msi.c:782:27: error: initialization of 'int (*)(struct irq_domain *, unsigned int,  unsigned int,  void *)' from incompatible pointer type 'void (*)(struct seq_file *, struct irq_domain *, struct irq_data *, int)' [-Werror=incompatible-pointer-types]
   kernel/irq/msi.c:782:27: note: (near initialization for 'msi_domain_ops.alloc')
   kernel/irq/msi.c:782:27: warning: initialized field overwritten [-Woverride-init]
   kernel/irq/msi.c:782:27: note: (near initialization for 'msi_domain_ops.alloc')
   cc1: some warnings being treated as errors


vim +770 kernel/irq/msi.c

   758	
   759	static void msi_domain_debug_show(struct seq_file *m, struct irq_domain *d,
   760					  struct irq_data *irqd, int ind)
   761	{
   762		struct msi_desc *desc;
   763		bool is_msix;
   764	
   765		desc = irq_get_msi_desc(irqd->irq);
   766		if (!desc)
   767			return;
   768	
   769		is_msix = desc->pci.msi_attrib.is_msix;
 > 770		seq_printf(m, "%*s%s:", ind, "", is_msix ? "msix" : "msi");
   771		seq_printf(m, "\n%*saddress_hi: 0x%08x", ind + 1, "", desc->msg.address_hi);
   772		seq_printf(m, "\n%*saddress_lo: 0x%08x", ind + 1, "", desc->msg.address_lo);
   773		seq_printf(m, "\n%*smsg_data:   0x%08x\n", ind + 1, "", desc->msg.data);
   774	}
   775	
   776	static const struct irq_domain_ops msi_domain_ops = {
   777		.alloc		= msi_domain_alloc,
   778		.free		= msi_domain_free,
   779		.activate	= msi_domain_activate,
   780		.deactivate	= msi_domain_deactivate,
   781		.translate	= msi_domain_translate,
 > 782		.debug_show     = msi_domain_debug_show,
   783	};
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
