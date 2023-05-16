Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4276EE57D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 04:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684211880; x=1715747880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J2lYYoTJC7RHsNi1751n9LpXKriHDkCoW8+5uzDLxOU=;
  b=H2aCF7ENGJWSZfUBK1FQb3CQYM+U1HV3GjIj9kqFV0nNGR/jfrlw8LLL
   EOi4v9Jtxl3NWPx2v2QMlWc5fCjv1XVs4EpjJLx6BNB7zuCj0GMDBtyy0
   H4n3YnZ/R/mbd+wIMGYKGks4uQZXU9mD31dnlQIvGoJOTDYbm0iQJPiEB
   be8ZlvbnDvR+3av6ER14eMmGYtlLkEHMqqiN8epN7HA9Ax/xLVFg5P5SM
   M4qHdGyI1J2fG4sWEpN6OansUh3/2MLHCbKYVuXUc7ERwFH5nr7t78pZP
   txPGfOgflqh/aAuaJ1ETugasQykdxwKyq7fqNXRn4mTNHqlkxNTuMKGSS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350215131"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="350215131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 21:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731859853"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="731859853"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 May 2023 21:37:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pymRc-0006y8-1Y;
	Tue, 16 May 2023 04:37:52 +0000
Date: Tue, 16 May 2023 12:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.1.y 259/5720] drivers/gpu/drm/i915/i915.o: warning:
 objtool: intel_engine_setup.cold+0x2b3: relocation to !ENDBR:
 intel_engines_release.cold+0x0
Message-ID: <202305161207.N08Ev23T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   bf4ad6fa4e5332e53913b073d0219319a4091619
commit: 5459eaca151dcf1a31fd54a4ce8a874c9ebce1ca [259/5720] drm/i915: Fix compute pre-emption w/a to apply to compute engines
config: x86_64-randconfig-x083 (https://download.01.org/0day-ci/archive/20230516/202305161207.N08Ev23T-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=5459eaca151dcf1a31fd54a4ce8a874c9ebce1ca
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-6.1.y
        git checkout 5459eaca151dcf1a31fd54a4ce8a874c9ebce1ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161207.N08Ev23T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915.o: warning: objtool: gen6_alloc_va_range.cold+0xfe: relocation to !ENDBR: gen6_ppgtt_pin.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: gen8_ppgtt_insert.cold+0x42: relocation to !ENDBR: gen8_ppgtt_create.cold+0x0
>> drivers/gpu/drm/i915/i915.o: warning: objtool: intel_engine_setup.cold+0x2b3: relocation to !ENDBR: intel_engines_release.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: eb_move_to_gpu.cold+0x39: relocation to !ENDBR: i915_reset_gen7_sol_offsets.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: __i915_gem_object_release_mmap_gtt.cold+0x97: relocation to !ENDBR: i915_gem_mmap.cold+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: __i915_gem_object_set_pages.cold+0x1f1: relocation to !ENDBR: ____i915_gem_object_get_pages.cold+0x0


objdump-func vmlinux.o intel_engine_setup.cold:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
