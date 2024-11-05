Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7491EBFF1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730838470; cv=none; b=hqN7kg37XaUZhquc8ONzwpKHdkuv8u5L/00N8XRHCJbb5lojLq/58xINVIvJbiZ7gc3EqaUALBmP+i2FWNLJth7CpmO0IMe7BVHc4nCBEyESb2u5wfv39EQvT1TF5oH9Ar++ciFsjM7mwMNdvWAz3suiRqau78bDvaEfq2zrlxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730838470; c=relaxed/simple;
	bh=MvNubbByM4lG6G2luFibLaEiYIRz8TfPFSv7tNE2a84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q9HMEt8Jh2LMaZ+I6NZVSawddAzQywx9P7coomVrcSmhYtzST/xJ96Kelxpt3QIXJWNiczOlej0f9eXgm3Sm+E7Q6lmBwNJZ/loaw7Eweyy+8G3CPIrcRliyLIf9HXG9vkVQ9s7Y9V0UrfkuEcdfZVrMFe0FfizbMNz3RSk/8n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPBnU1Gp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPBnU1Gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730838468; x=1762374468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MvNubbByM4lG6G2luFibLaEiYIRz8TfPFSv7tNE2a84=;
  b=IPBnU1Gp82fgGVzsCFh7Ct/5gfrsGuUMGB0tyIOnKEzGjyoAx4tHP0vq
   Zzi3HdfRZotecfEdOHlP8xzbJFuQICMPUSKZ8uEprddcVOajdTUqnUO5p
   G9fR//s+9kwDPGJUm/oH2GXxymmgEtN0i3iriLPsY9Ah/cco1EQwvtRrk
   af4DuHyV1KKaxYizPU0PEA/0MH/wsEwi7FQn07lRWP0dvm302wAFDbaXh
   uAlzjGd1Y6e8dL4iBc6SmlECpbEZkM7X/8vvoLPmFOmNvUxaL686i7LK5
   YFSsYZ1xIERm9gTj4DWpx3N85RBTdXPW+ZWzNwKvL4ldoSNQo+aAJ6c2i
   Q==;
X-CSE-ConnectionGUID: f7hcxQLCRhaS2Dgu/vh7RQ==
X-CSE-MsgGUID: CXvIPzNhQNe5guGdyDYLcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30775281"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30775281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 12:27:48 -0800
X-CSE-ConnectionGUID: OkQZtOOZTTKMwgK2GFh2RA==
X-CSE-MsgGUID: qaEjaafyRG2AVnhM9k0/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84983616"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2024 12:27:47 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Q9Q-000mQR-27;
	Tue, 05 Nov 2024 20:27:44 +0000
Date: Wed, 6 Nov 2024 04:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt 19/25] sound/pci/intel8x0.c:31:12:
 warning: 'index' defined but not used
Message-ID: <202411060403.qrKw0jlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt
head:   ea12a7f9c1697d73061d2c3627052fc528e238a1
commit: 538aa4dff7cbb83642feed8922eb41bf1e315efe [19/25] uprobes: Add mapping for optimized uprobe trampolines
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20241106/202411060403.qrKw0jlI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060403.qrKw0jlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060403.qrKw0jlI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:16,
                    from include/asm-generic/fixmap.h:19,
                    from arch/csky/include/asm/fixmap.h:27,
                    from arch/csky/include/asm/pgtable.h:6,
                    from include/linux/pgtable.h:6,
                    from arch/csky/include/asm/io.h:6,
                    from include/linux/io.h:14,
                    from sound/pci/intel8x0.c:14:
   include/linux/uprobes.h:126:33: error: field 'tramp_mutex' has incomplete type
     126 |         struct mutex            tramp_mutex;
         |                                 ^~~~~~~~~~~
>> sound/pci/intel8x0.c:31:12: warning: 'index' defined but not used [-Wunused-variable]
      31 | static int index = SNDRV_DEFAULT_IDX1;  /* Index 0-MAX */
         |            ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/index +31 sound/pci/intel8x0.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  30  
b7fe46220487f6 Clemens Ladisch    2005-10-04 @31  static int index = SNDRV_DEFAULT_IDX1;	/* Index 0-MAX */
b7fe46220487f6 Clemens Ladisch    2005-10-04  32  static char *id = SNDRV_DEFAULT_STR1;	/* ID for this card */
6581f4e74d8541 Takashi Iwai       2006-05-17  33  static int ac97_clock;
b7fe46220487f6 Clemens Ladisch    2005-10-04  34  static char *ac97_quirk;
a67ff6a54095e2 Rusty Russell      2011-12-15  35  static bool buggy_semaphore;
beef08a54524e4 Takashi Iwai       2005-10-27  36  static int buggy_irq = -1; /* auto-check */
a67ff6a54095e2 Rusty Russell      2011-12-15  37  static bool xbox;
a9e996604f77be Takashi Iwai       2006-11-24  38  static int spdif_aclink = -1;
228cf79376f13b Konstantin Ozerkov 2011-10-26  39  static int inside_vm = -1;
b7fe46220487f6 Clemens Ladisch    2005-10-04  40  

:::::: The code at line 31 was first introduced by commit
:::::: b7fe46220487f684abc858865cff817389af5c76 [ALSA] highlanderize motherboard AC97/HDA drivers

:::::: TO: Clemens Ladisch <clemens@ladisch.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
