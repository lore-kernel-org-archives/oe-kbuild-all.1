Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB634B1AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412297; cv=none; b=TCs+k9kbUfode6cuPcOsOe8FZ0Wy/vxjxTRdFg3fH5/uRqp+721TAHaHxwR2l53u8HCm90hgAHR+OD+PHmORHf0TzOw6LN1+bP6gJg6FaQcyYOE4Dn9N5RfrsvC5W/F6imOPhLGo8TuqGlvqE6sQSPVqldthxfR7BMypBWyxG74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412297; c=relaxed/simple;
	bh=Cz81KbW3O3iCjIt1gMq6wc017QE7/h+YurErZx0NnmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oaJwXpaCrPZFsC7j9iYNZLSq6xW4z/8Ni/Vzk5IGgcujj7MjCLhiZyG67Ng6SIH9srXAgD5gqCGE1b89a4uTGGHO/wjR/HSSTX/Rx1NKyT//EXf+7yUMWpSkkTwh8m0RNelopQ55QwBoFpuarH2Q7YwuctjTXxd049ATlf6BX3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSdOqHjG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSdOqHjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763412293; x=1794948293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cz81KbW3O3iCjIt1gMq6wc017QE7/h+YurErZx0NnmQ=;
  b=DSdOqHjGrsA91gFzofgtzqzqS993CGDYw15itd24Kft2wkFxsojn91kG
   3mLGzmNjRejSKRk3m2hTzvlKQNvhFO39+ITwrWStW3UEDj/3GSGJPhEBX
   b6pjNzyEeLNnoT0E+rNmprdJyoyR2iaiDso/NTKSNx8HLIzxlJ7Mb+ELr
   7PdbEKXwG8u37HD1amzLjVc8n3huuPGapitgj067+P5niL2qdc49TKga/
   p/RscGdIAksWpGNFIZq0lUuq8ZcDMs63Md+bT/9ruEffrORJtV/0vEx+/
   vhSLXXMagB42ucQB2Je423C5ddPhkvK2WAtCf6Z5IgpKzr4URpPfP/O7b
   A==;
X-CSE-ConnectionGUID: d54JqjBDTxSP+QnL+Vzkdw==
X-CSE-MsgGUID: Q0ssJJD4TeKXKer5HBP5+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76884539"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76884539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:44:50 -0800
X-CSE-ConnectionGUID: abhtl5ZRRCyvXH9w+SScZw==
X-CSE-MsgGUID: nPRLN5GlQq6wEx2W59HD/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="189849389"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 12:44:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL65e-000137-2O;
	Mon, 17 Nov 2025 20:44:46 +0000
Date: Tue, 18 Nov 2025 04:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214]
 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:779:20: error: incomplete
 definition of type 'struct acpi_device'
Message-ID: <202511180448.bJpcAwU9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi LeoLiu-oc,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   17cadcdf512f891675c3c9df62bcf05511293ae9
commit: 5d01c9ec4f3b95b0629a38d936f69bc05e494cc9 [3214/3214] pinctrl: Zhaoxin: Add KH-50000 support
config: x86_64-buildonly-randconfig-004-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180448.bJpcAwU9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180448.bJpcAwU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180448.bJpcAwU9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:123:6: warning: variable 'value_back' set but not used [-Wunused-but-set-variable]
     123 |         u16 value_back = 0;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:249:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     249 |         int pin;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:270:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     270 |         int pin;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:330:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     330 |         int base_offset = 0;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:363:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     363 |         int base_offset = 0;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:487:6: warning: variable 'test_mask' set but not used [-Wunused-but-set-variable]
     487 |         u16 test_mask;
         |             ^
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:779:20: error: incomplete definition of type 'struct acpi_device'
     779 |                         if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
         |                                     ~~~~^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/acpi.h:798:8: note: forward declaration of 'struct acpi_device'
     798 | struct acpi_device;
         |        ^
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:779:20: error: incomplete definition of type 'struct acpi_device'
     779 |                         if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
         |                                     ~~~~^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/acpi.h:798:8: note: forward declaration of 'struct acpi_device'
     798 | struct acpi_device;
         |        ^
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:779:20: error: incomplete definition of type 'struct acpi_device'
     779 |                         if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
         |                                     ~~~~^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/acpi.h:798:8: note: forward declaration of 'struct acpi_device'
     798 | struct acpi_device;
         |        ^
   6 warnings and 3 errors generated.


vim +779 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c

996e18349e58a3 leoliu-oc 2024-02-04  765  
996e18349e58a3 leoliu-oc 2024-02-04  766  const struct zhaoxin_pinctrl_soc_data *zhaoxin_pinctrl_get_soc_data(struct platform_device *pdev)
996e18349e58a3 leoliu-oc 2024-02-04  767  {
996e18349e58a3 leoliu-oc 2024-02-04  768  	const struct zhaoxin_pinctrl_soc_data *data = NULL;
996e18349e58a3 leoliu-oc 2024-02-04  769  	const struct zhaoxin_pinctrl_soc_data **table;
996e18349e58a3 leoliu-oc 2024-02-04  770  	struct acpi_device *adev;
996e18349e58a3 leoliu-oc 2024-02-04  771  	unsigned int i;
996e18349e58a3 leoliu-oc 2024-02-04  772  
996e18349e58a3 leoliu-oc 2024-02-04  773  	adev = ACPI_COMPANION(&pdev->dev);
996e18349e58a3 leoliu-oc 2024-02-04  774  	if (adev) {
996e18349e58a3 leoliu-oc 2024-02-04  775  		const void *match = device_get_match_data(&pdev->dev);
996e18349e58a3 leoliu-oc 2024-02-04  776  
996e18349e58a3 leoliu-oc 2024-02-04  777  		table = (const struct zhaoxin_pinctrl_soc_data **)match;
996e18349e58a3 leoliu-oc 2024-02-04  778  		for (i = 0; table[i]; i++) {
996e18349e58a3 leoliu-oc 2024-02-04 @779  			if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
996e18349e58a3 leoliu-oc 2024-02-04  780  				data = table[i];
996e18349e58a3 leoliu-oc 2024-02-04  781  				break;
996e18349e58a3 leoliu-oc 2024-02-04  782  			}
996e18349e58a3 leoliu-oc 2024-02-04  783  		}
996e18349e58a3 leoliu-oc 2024-02-04  784  	} else {
996e18349e58a3 leoliu-oc 2024-02-04  785  		const struct platform_device_id *id;
996e18349e58a3 leoliu-oc 2024-02-04  786  
996e18349e58a3 leoliu-oc 2024-02-04  787  		id = platform_get_device_id(pdev);
996e18349e58a3 leoliu-oc 2024-02-04  788  		if (!id)
996e18349e58a3 leoliu-oc 2024-02-04  789  			return ERR_PTR(-ENODEV);
996e18349e58a3 leoliu-oc 2024-02-04  790  
996e18349e58a3 leoliu-oc 2024-02-04  791  		table = (const struct zhaoxin_pinctrl_soc_data **)id->driver_data;
996e18349e58a3 leoliu-oc 2024-02-04  792  		data = table[pdev->id];
996e18349e58a3 leoliu-oc 2024-02-04  793  	}
996e18349e58a3 leoliu-oc 2024-02-04  794  
996e18349e58a3 leoliu-oc 2024-02-04  795  	return data ?: ERR_PTR(-ENODATA);
996e18349e58a3 leoliu-oc 2024-02-04  796  }
996e18349e58a3 leoliu-oc 2024-02-04  797  EXPORT_SYMBOL_GPL(zhaoxin_pinctrl_get_soc_data);
996e18349e58a3 leoliu-oc 2024-02-04  798  

:::::: The code at line 779 was first introduced by commit
:::::: 996e18349e58a3ace519f9c0f32f4e62fc46ec2c Add support Zhaoxin GPIO pinctrl

:::::: TO: leoliu-oc <leoliu-oc@zhaoxin.com>
:::::: CC: leoliu-oc <leoliu-oc@zhaoxin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
