Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32679810
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 03:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689131860; x=1720667860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I7ENjvMNFmNDB5Qmeu976Bp6osqsr9cMOH+K30QQ1UQ=;
  b=EmeN33C9DAJWUWcHBnim0EpwZ5M09mlDbeachTL3ixqE/lKNVWbt5QnP
   k7B1qw1nwtaxLf/dk2GkrYq/4ukoYSLp+1IEut11wVRw+DThS0+ndumz5
   3WeVpuklFDNSCsCXjNERBDuS245VsA7H3XxZzF/E/CBIsOAht/bwseHAw
   B6z1Enn80+u8guS9xnmQdbAkcvXpG1h9WHEnkKg/T+ZDx65XCEyGHzNaW
   wLKJNovR8RHPBwpigVIyEiGgM6KV+1KNfCrpHv2cNofLabweNrCn02vWB
   D3iLKh/KFyc6cce5Hdxco/9xi5YXoNSOS2QB/PmmzmeoGzzT/YfGsscSA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362255980"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="362255980"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 20:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845498301"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="845498301"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 20:17:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJQMD-0005LB-0p;
	Wed, 12 Jul 2023 03:17:37 +0000
Date: Wed, 12 Jul 2023 11:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [linux-stable-rc:linux-4.14.y 4901/4953] drivers/gpu/drm/drm_edid.o:
 warning: objtool: mode_in_range()+0xda: return with modified stack frame
Message-ID: <202307121101.pcTfAwIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   bc1094b213929360a2dd73e3ff406b6e1504e0da
commit: 1b71ea8e041f793200fc977b3bf4ee25bfb5aa47 [4901/4953] drm/edid: Fix uninitialized variable in drm_cvt_modes()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230712/202307121101.pcTfAwIA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121101.pcTfAwIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121101.pcTfAwIA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_edid.o: warning: objtool: mode_in_range()+0xda: return with modified stack frame
>> drivers/gpu/drm/drm_edid.o: warning: objtool: mode_in_range()+0x0: stack state mismatch: cfa1=7+104 cfa2=7+8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
