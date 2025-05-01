Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE73944F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746084567; cv=none; b=Cb9AI1uzadp8xf80+p5dKBFA3z86+UyzFoIfw261VjWe1jTCCnBFQfWSqMF1oUYsbu9fWEusSfg0YTY+FC/XBFk3ts7RL5yQioChQZvqWxQK3RSnR1SFxPSOL6TbH930AZl51iC63P/1tE+csF8tbU+NzlgU1HItTespJCX9UeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746084567; c=relaxed/simple;
	bh=xafmZIHjlHQVb1GANgmiDROC9/VGqVODAgl9hfP2Obk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kUCQMEWeORqJJhGRr8wgSEFLnS4ze/RvFbJtKhjLaI0Kithoaxuv2wYItme20w4FKfSfpsqUWQKg9FwB0Kh5ze+yM5DIAzRLrB1LJMeMBk2xY1k5DOxsu4fckUh8gyO7w6oBkd6Mg99NkZxth5g5mq11TTN6/duW7FyilDE6dZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVwQZpmL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVwQZpmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746084565; x=1777620565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xafmZIHjlHQVb1GANgmiDROC9/VGqVODAgl9hfP2Obk=;
  b=iVwQZpmLrLb2uCD9/52AeOmGvMW6k2Zmw+htOJ8OXlMfT/VTXhptqRYI
   G48KVtN01xTtbTb5vRajPpDFOfAQ6cgSu/GcpX0fK4OvVv+kp1ALkIAaX
   ifN3VtY50TGonrOG2Fq1fB6/QhakqCceHMQxcwnHSOicHACGf7q6DJ/8J
   IvgS6p8LycJUsusMXRqZo9JtoPYW4YFK12++egKrEHsO2zihg04zECQ3I
   54DMc33fGMUvi5DvOTYR3KgVcZruSqBBtbxGdmJ6aAKvfU+cJi2xr2r+F
   zarXkZf9W6FiSH241rsWptLuUzrhUM+YinUgrZnPnUvApz64WpLg//r6e
   g==;
X-CSE-ConnectionGUID: efOpKEYMSOOYgJQaztRkNg==
X-CSE-MsgGUID: Ch/JroPOSLSMSFhtl/IdvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47892910"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="47892910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 00:29:24 -0700
X-CSE-ConnectionGUID: gbTHpsiCRq6DDDUyb3PAqQ==
X-CSE-MsgGUID: GF3wZwH5TTyfEc08KvInGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="135291639"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 May 2025 00:29:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAOMD-00041V-11;
	Thu, 01 May 2025 07:29:21 +0000
Date: Thu, 1 May 2025 15:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 26/34] arch/arc/include/asm/jump_label.h:65:8:
 error: redefinition of 'struct jump_entry'
Message-ID: <202505011535.zDeP82ke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   69a817d602ee843bd52388638c4d2fdce7c20fa7
commit: b28d1ed99a57c85da1d595604fc812dfb69f9dfa [26/34] x86/alternative: Create symbols for special section entries
config: arc-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011535.zDeP82ke-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011535.zDeP82ke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011535.zDeP82ke-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/jump_label.h:122,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:616,
                    from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> arch/arc/include/asm/jump_label.h:65:8: error: redefinition of 'struct jump_entry'
      65 | struct jump_entry {
         |        ^~~~~~~~~~
   include/linux/jump_label.h:116:8: note: originally defined here
     116 | struct jump_entry {
         |        ^~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: kernel/bounds.s] Error 1 shuffle=101999338
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=101999338
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=101999338
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=101999338
   make: Target 'prepare' not remade because of errors.


vim +65 arch/arc/include/asm/jump_label.h

f091d5a426447cc Eugeniy Paltsev 2019-11-08  64  
f091d5a426447cc Eugeniy Paltsev 2019-11-08 @65  struct jump_entry {
f091d5a426447cc Eugeniy Paltsev 2019-11-08  66  	jump_label_t code;
f091d5a426447cc Eugeniy Paltsev 2019-11-08  67  	jump_label_t target;
f091d5a426447cc Eugeniy Paltsev 2019-11-08  68  	jump_label_t key;
f091d5a426447cc Eugeniy Paltsev 2019-11-08  69  };
f091d5a426447cc Eugeniy Paltsev 2019-11-08  70  

:::::: The code at line 65 was first introduced by commit
:::::: f091d5a426447cc427680bdd3adc7773aa2867df ARC: ARCv2: jump label: implement jump label patching

:::::: TO: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
