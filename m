Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D935F5EC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778359711; cv=none; b=W76JoXq8Vf+g9hvjkJX4t0mpWFvQBoXWyoWTEifa+H/NGSaM3OBgNNzVhOLbbgMdJPmfZaYN6n6fxmvvnpKCBu22MzbyRCC9kgOif+RBxrT9SjCmisxEnubS7DgNzsmtqBh6yOB4pUCpbk8ntIu91zqwV9vOnDQC43zjIvDCFgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778359711; c=relaxed/simple;
	bh=PUO+8Zj25woC+S5Bi4bsDRf4CPvLRluvTZmiszk0Gl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yg30Yni3e33/1phRmKknn4FFFyGSKcHn+loyZi9i1cFXWBC2LqdNVlwcwycIR8obs3AowfRFSyVrfw5muvlN7dNrLfAXJiwplPt++ZfXAVZ0QIjND1N1E+CdT5Jo73eOyH/1DlWpiHxKhiaWHdxEXCyeAqbRI77jJV0mUnNfAXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qwaeqr14; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qwaeqr14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778359709; x=1809895709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUO+8Zj25woC+S5Bi4bsDRf4CPvLRluvTZmiszk0Gl8=;
  b=Qwaeqr14bki7CZqId781vCyST80crb+kMnu7Uq7gvOP5bmRpKKdaKxfW
   HezAJjM1vhnh299XSf4+scC8MgJ62pEQXzj7gciE9Mui4eKWgP814Xr7k
   a8j/+XHd4YYh4muMOHioh/abhf5daysqNqz3TVG5mpbVBQNjcNo2Coo7r
   AL8f4EOmLWAL4svya27ZvzXBcTbIdVVFXAvR915poDYAn+KGogr6V5Ofk
   jyoMs4/2+omvpsismHI9LbHSq+/6IO4+VvDK7jdQucKvCd6Lwg3uJVaD5
   c0lktxMgTIt8xslxsgvfEAtrktnt0Tv5/Sv7cgih/6b1kn9AEJbLQAz6O
   w==;
X-CSE-ConnectionGUID: s/E+8ehCRim432sFrHoGQA==
X-CSE-MsgGUID: x/9IpKpdTnGXeiDe9WvhfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="78441167"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="78441167"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 13:48:29 -0700
X-CSE-ConnectionGUID: EYT/lspoRoWpWZtvYqhwwQ==
X-CSE-MsgGUID: vSbBj6eCQve3B6Mx1ProTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="237305484"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2026 13:48:27 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLob2-000000001PV-262W;
	Sat, 09 May 2026 20:48:24 +0000
Date: Sun, 10 May 2026 04:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH] irqchip/mbigen: add COMPILE_TEST support
Message-ID: <202605100403.PpIGk90i-lkp@intel.com>
References: <20260508021352.1635187-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508021352.1635187-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/irqchip-mbigen-add-COMPILE_TEST-support/20260509-194636
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260508021352.1635187-1-rosenp%40gmail.com
patch subject: [PATCH] irqchip/mbigen: add COMPILE_TEST support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605100403.PpIGk90i-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100403.PpIGk90i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100403.PpIGk90i-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-mbigen.c:195:36: error: unknown type name 'msi_alloc_info_t'
     195 | static void mbigen_domain_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
         |                                    ^~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:201:21: error: variable 'mbigen_msi_template' has initializer but incomplete type
     201 | static const struct msi_domain_template mbigen_msi_template = {
         |                     ^~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:202:10: error: 'const struct msi_domain_template' has no member named 'chip'
     202 |         .chip = {
         |          ^~~~
>> drivers/irqchip/irq-mbigen.c:202:17: error: extra brace group at end of initializer
     202 |         .chip = {
         |                 ^
   drivers/irqchip/irq-mbigen.c:202:17: note: (near initialization for 'mbigen_msi_template')
>> drivers/irqchip/irq-mbigen.c:202:17: warning: excess elements in struct initializer
   drivers/irqchip/irq-mbigen.c:202:17: note: (near initialization for 'mbigen_msi_template')
>> drivers/irqchip/irq-mbigen.c:211:10: error: 'const struct msi_domain_template' has no member named 'ops'
     211 |         .ops = {
         |          ^~~
   drivers/irqchip/irq-mbigen.c:211:16: error: extra brace group at end of initializer
     211 |         .ops = {
         |                ^
   drivers/irqchip/irq-mbigen.c:211:16: note: (near initialization for 'mbigen_msi_template')
>> drivers/irqchip/irq-mbigen.c:212:43: error: 'mbigen_domain_set_desc' undeclared here (not in a function)
     212 |                 .set_desc               = mbigen_domain_set_desc,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mbigen.c:211:16: warning: excess elements in struct initializer
     211 |         .ops = {
         |                ^
   drivers/irqchip/irq-mbigen.c:211:16: note: (near initialization for 'mbigen_msi_template')
>> drivers/irqchip/irq-mbigen.c:216:10: error: 'const struct msi_domain_template' has no member named 'info'
     216 |         .info = {
         |          ^~~~
   drivers/irqchip/irq-mbigen.c:216:17: error: extra brace group at end of initializer
     216 |         .info = {
         |                 ^
   drivers/irqchip/irq-mbigen.c:216:17: note: (near initialization for 'mbigen_msi_template')
>> drivers/irqchip/irq-mbigen.c:218:43: error: 'MSI_FLAG_USE_DEV_FWNODE' undeclared here (not in a function)
     218 |                 .flags                  = MSI_FLAG_USE_DEV_FWNODE,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mbigen.c:216:17: warning: excess elements in struct initializer
     216 |         .info = {
         |                 ^
   drivers/irqchip/irq-mbigen.c:216:17: note: (near initialization for 'mbigen_msi_template')
   In file included from include/asm-generic/bug.h:7,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from drivers/irqchip/irq-mbigen.c:8:
   drivers/irqchip/irq-mbigen.c: In function 'mbigen_create_device_domain':
>> drivers/irqchip/irq-mbigen.c:225:35: error: 'struct dev_msi_info' has no member named 'domain'
     225 |         if (WARN_ON_ONCE(!dev->msi.domain))
         |                                   ^
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   drivers/irqchip/irq-mbigen.c:225:13: note: in expansion of macro 'WARN_ON_ONCE'
     225 |         if (WARN_ON_ONCE(!dev->msi.domain))
         |             ^~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:228:16: error: implicit declaration of function 'msi_create_device_irq_domain'; did you mean 'mbigen_create_device_domain'? [-Werror=implicit-function-declaration]
     228 |         return msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                mbigen_create_device_domain
   drivers/irqchip/irq-mbigen.c: At top level:
>> drivers/irqchip/irq-mbigen.c:201:41: error: storage size of 'mbigen_msi_template' isn't known
     201 | static const struct msi_domain_template mbigen_msi_template = {
         |                                         ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/msi_alloc_info_t +195 drivers/irqchip/irq-mbigen.c

9650c60ebfec05f Ma Jun          2015-12-17  194  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @195  static void mbigen_domain_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  196  {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  197  	arg->desc = desc;
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  198  	arg->hwirq = (u32)desc->data.icookie.value;
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  199  }
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  200  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @201  static const struct msi_domain_template mbigen_msi_template = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @202  	.chip = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  203  		.name			= "mbigen-v2",
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  204  		.irq_mask		= irq_chip_mask_parent,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  205  		.irq_unmask		= irq_chip_unmask_parent,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  206  		.irq_eoi		= mbigen_eoi_irq,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  207  		.irq_set_type		= mbigen_set_type,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  208  		.irq_write_msi_msg	= mbigen_write_msi_msg,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  209  	},
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  210  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @211  	.ops = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @212  		.set_desc		= mbigen_domain_set_desc,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  213  		.msi_translate		= mbigen_domain_translate,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  214  	},
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  215  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @216  	.info = {
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  217  		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @218  		.flags			= MSI_FLAG_USE_DEV_FWNODE,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  219  	},
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  220  };
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  221  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  222  static bool mbigen_create_device_domain(struct device *dev, unsigned int size,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  223  					struct mbigen_device *mgn_chip)
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  224  {
752e021f5b9be0a Thomas Gleixner 2024-06-23 @225  	if (WARN_ON_ONCE(!dev->msi.domain))
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  226  		return false;
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  227  
fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @228  	return msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  229  					    &mbigen_msi_template, size,
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  230  					    NULL, mgn_chip->base);
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  231  }
fbfe7e13641efe8 Thomas Gleixner 2024-06-23  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
