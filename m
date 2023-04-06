Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC696FD0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680791157; x=1712327157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vpxskJbUfeKYEHHzcQYARfwlJt722iSt3t9s2bMjA6c=;
  b=N91XnYvYe2prkAmGsrDxlM8I66XNGEesgxHFyeobDcg8leN8jmAJwhJU
   A7PAUJRx6t3H0KSa3vADQWsLy3Ur19WoqEra7jAEdXa6eY4g1zlK2LZIv
   t1HBm0Ln/yUr6wTP0gN8HiONcIa8/YmBnB5kRGvoi7ycvGSHTKh19vriu
   aBnsqLQRuh5IoftwDSb63M0Ta++qp6LP9rkv8nQOBRYnd68QFWj1advZD
   sKVD+PCwvdggDT/g3rkuYJ1SghAD+yzCb7pkRVJqj1txb78mlvu5L8qDm
   1nBY4VsneysP/bnMfIfhsTLp2sjVhjd9RlLspfIqoUabibtxXRTwLBfAU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="342753780"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="342753780"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 07:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="830765883"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="830765883"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2023 07:25:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkQYk-000RQo-2T;
	Thu, 06 Apr 2023 14:25:54 +0000
Date: Thu, 6 Apr 2023 22:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.2.y 681/2027] drivers/gpu/drm/i915/i915.o: warning:
 objtool: ct_handle_response+0x46b: relocation to !ENDBR:
 ct_process_request+0x0
Message-ID: <202304062236.tMp8PCv9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.2.y
head:   cb9384f7deb195360e7cb2a1aee2a31792c4106c
commit: 76751e14d179119739c548cc95ffbaa6ff52785d [681/2027] Compiler attributes: GCC cold function alignment workarounds
config: x86_64-randconfig-r021-20230403 (https://download.01.org/0day-ci/archive/20230406/202304062236.tMp8PCv9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=76751e14d179119739c548cc95ffbaa6ff52785d
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-6.2.y
        git checkout 76751e14d179119739c548cc95ffbaa6ff52785d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062236.tMp8PCv9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0x47ee7
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0x4e4b7
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0x4fbc7
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0x60a57
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0x67e07
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0x7cce7
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0xba4b7
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0xc4ab7
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0xd1b17
   drivers/gpu/drm/i915/i915.o: warning: objtool: i915_request_await_start+0x635: relocation to !ENDBR: .text+0xd837a
   drivers/gpu/drm/i915/i915.o: warning: objtool: __guc_action_self_cfg+0x1a7: relocation to !ENDBR: .text+0xf595c
>> drivers/gpu/drm/i915/i915.o: warning: objtool: ct_handle_response+0x46b: relocation to !ENDBR: ct_process_request+0x0
   drivers/gpu/drm/i915/i915.o: warning: objtool: intel_gt_is_wedged+0xb2: relocation to !ENDBR: .text+0x105497


objdump-func vmlinux.o ct_handle_response:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
