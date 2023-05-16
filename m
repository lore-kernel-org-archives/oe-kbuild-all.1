Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB723C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 06:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684219923; x=1715755923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/R8cuiDCCt74WS8984+AUGqTxJugBAftHTBDVwSYq8=;
  b=eY7Rj3MAfPzl+KB0tECJGY0sf4KRpzfZcFeU/th4vxdDmC3//Ozfzg+2
   R9eYbgNWhcxEu17jI9pswF36TIz8gHnTlpXHi5m08jYH7OjdyQyRonjxs
   mit5cpnTlpmipTwWf9qUqNJEGXYad1p+U6b4cNdYGbZhPLyVqeGin0v8f
   jwAQ/NbDpa81cYLRwYFGGqllGhFrbJklRH85o33jtIOdG7jWXMx/S89Vy
   8uyq78m8J34ZXxzDDZfnBwiMjraZrZSo7n8n8oD+nTPZh2Dytqy1IFagK
   FpO7SAdX0w0RJOynwjw+TxCyuaKBLDuP1y1Wv6DM7+tjeNedEJa11RFWu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331760317"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="331760317"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 23:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947725332"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="947725332"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 May 2023 23:51:59 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyoXO-00077c-2o;
	Tue, 16 May 2023 06:51:58 +0000
Date: Tue, 16 May 2023 14:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.1.y 287/5720] drivers/gpu/drm/i915/i915.o: warning:
 objtool: __i915_gem_object_release_mmap_gtt.cold+0x97: relocation to !ENDBR:
 i915_gem_object_runtime_pm_release_mmap_offset.cold+0x0
Message-ID: <202305161422.IQqXiF0f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anshuman,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   bf4ad6fa4e5332e53913b073d0219319a4091619
commit: bd449cadc8db481eeaa4fe2f051e30b288a34933 [287/5720] drm/i915/dgfx: Grab wakeref at i915_ttm_unmap_virtual
config: x86_64-randconfig-x083 (https://download.01.org/0day-ci/archive/20230516/202305161422.IQqXiF0f-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=bd449cadc8db481eeaa4fe2f051e30b288a34933
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-6.1.y
        git checkout bd449cadc8db481eeaa4fe2f051e30b288a34933
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161422.IQqXiF0f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915.o: warning: objtool: gen6_alloc_va_range.cold+0xfe: relocation to !ENDBR: gen6_ppgtt_pin.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: gen8_ppgtt_insert.cold+0x42: relocation to !ENDBR: gen8_ppgtt_create.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_engine_setup.cold+0x2b3: relocation to !ENDBR: intel_engines_release.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: eb_move_to_gpu.cold+0x39: relocation to !ENDBR: i915_reset_gen7_sol_offsets.cold+0x0
>> drivers/gpu/drm/i915/i915.o: warning: objtool: __i915_gem_object_release_mmap_gtt.cold+0x97: relocation to !ENDBR: i915_gem_object_runtime_pm_release_mmap_offset.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: __i915_gem_object_set_pages.cold+0x1f1: relocation to !ENDBR: ____i915_gem_object_get_pages.cold+0x0


objdump-func vmlinux.o __i915_gem_object_release_mmap_gtt.cold:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
