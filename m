Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132022425F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260866; cv=none; b=nRAg27xVa5nd2UegdGyC40j1nf/CV7osRDzFbdM2lZiMU1WJitYr3/aIDB9LSVfpo9GSXcl3RBF6rK7L1BjjN+i54A6HkHUBaoAqIYodLA0Q75R8+ZR3Bhpaqg8USD+CteBm+9cnOF8sI73QdHTa46gaRggYRId3qK5HDiteo+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260866; c=relaxed/simple;
	bh=LuE5DAhaIJMtvUncvN+eded3NgHkTZsdipnO966K5cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fU5CT1t6+Ykm5OGdekyiiIli88Bq6/fhM+mXIrYNMiM9Fi7TlDBJ87bemg6vfXGJRUBufFK8d4zJS1lNp+0A14F9bogAjedPdxPbYE7vw+1I3F/OCM+AVHK0y48ccXfmtANafOLIUbgdXlHMurs9PYe8WInL+xprmgBrQeqEG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRCDg7BT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRCDg7BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747260865; x=1778796865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LuE5DAhaIJMtvUncvN+eded3NgHkTZsdipnO966K5cM=;
  b=cRCDg7BTccUlECoVKEExH45nodmJPfPw9vdOokHsmEU3IZH9L+VhD3BI
   MW2BrNgZbTfORSS2PQVWjzySdOfvfE8lgDaFfEjHMo26X2wQLwMVVtlbG
   WW4rxJ5BuF73zp6dWmwON0bVosRZbB7LTIACmf0MhrvJEANHYy5+q6NtK
   wwzBpwwU1Ny/z3jnB2kV1+NI6IoDMMNZ0P+/gm3/lLdhLg16QpJW0rjZ0
   v3Y1OwxtT5rdxrJXslcnOjIuuHwh+YX29tOzWO10PkKUKpUpP0zK/ehnw
   r4ex25UGQszl3Dn91i/BEW0Ecey7nkSi8JLe8g/OwQZgqNAao5sRKGOwn
   Q==;
X-CSE-ConnectionGUID: l3norVqGQr+LFcnetFQa1A==
X-CSE-MsgGUID: IS0MY4GGQJq2IZELkGBPqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48292788"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="48292788"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 15:14:23 -0700
X-CSE-ConnectionGUID: lRZknXsiReyLgGCpzf2DNA==
X-CSE-MsgGUID: rMgKuw0UT1eLt6xW+RfgGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138090087"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2025 15:14:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFKMl-000Hdf-1E;
	Wed, 14 May 2025 22:14:19 +0000
Date: Thu, 15 May 2025 06:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 4/4] fs/binfmt_elf.c:2162:19:
 error: 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202505150602.VXdNBTbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [4/4] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-103-20250513 (https://download.01.org/0day-ci/archive/20250515/202505150602.VXdNBTbQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150602.VXdNBTbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150602.VXdNBTbQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^
--
   In file included from fs/compat_binfmt_elf.c:144:
   fs/binfmt_elf.c: In function 'init_compat_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
