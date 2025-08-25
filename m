Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219151E8342
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129299; cv=none; b=k4ZfudQW8W0zsHAuSzqoMkrPJmtlACII6NZFCcrTRQMTs+9MXdEHuc5Z9GiYtd1b83ahcFI6VoAo1CA96WrsdtZrlKjnn82zWnGpTQDyI3TIYgKs56MoWTZMPLkp2ZwC97y2Pe4nH4gHPE2rKGgY26C0Cr9LHjFzr2LKcF4MlLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129299; c=relaxed/simple;
	bh=SWHp8D0sr8HRoFOBN/gpSlKRzyhEwCk/pVxqQx+NDzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivPvAoGvBAXp2iYseZdl/Rop64HZE3FkRaik/Jc2rOU8qA8fyDx3lFjL5xp5MAeeckmCO3P5xmDQGA46tff+P5sfFraeVHlw5JtqYrlFWL6kQgoGZ8784d42e6PA7Yzw8kdEoASiwltfb8Evb8Z22BBeaT4awgNFqklG9EryhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMFtbFbH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMFtbFbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756129297; x=1787665297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWHp8D0sr8HRoFOBN/gpSlKRzyhEwCk/pVxqQx+NDzA=;
  b=gMFtbFbH7YFrIqRdRcHYvIEsQc+H5OZz3nx9PP6B2WLIV3pd51Bi1LcM
   gwbbRz2NQtyXqd2c+ZwPdg3znAMNppXGUN7NMGqjVvwbQ8yW4AGKU1sT2
   8UjpyaQW9sfIbW97WgeWM+eSDXwH8M/fIXKU4Qjh6P/HmY1x655H1x3AR
   mg2x3yj0cgVhv9ulpDYXlpeMT2xaGVKLwMoTUEzQqxc7eLyfbHGW015HX
   jjuXf2vmp9LAyBsxX7fCa+UoSx64XFGNSC3rAIlzT/dA54ze44vGB+QN6
   weHsWu0iBaJTZoKpblMIW57MzLg8DIwURLiqQpWSVBlq322diHyPBB079
   w==;
X-CSE-ConnectionGUID: d0n2qet5ROSgFmeu7riZwA==
X-CSE-MsgGUID: y2Jeq+RiTTWrygeIzCCx/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69055854"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69055854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 06:41:35 -0700
X-CSE-ConnectionGUID: hUKHoMwMRs+dWtl2S3K0SA==
X-CSE-MsgGUID: Wuqix5GZQXKkdtYAz9NI5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="170126328"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2025 06:41:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqXR7-000Njj-1Y;
	Mon, 25 Aug 2025 13:40:50 +0000
Date: Mon, 25 Aug 2025 21:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pan Deng <dengpan13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1761/1761]
 include/uapi/../../drivers/scsi/isci/isci.h:531:1: error: attempted to
 randomize userland API struct sci_base_state
Message-ID: <202508252122.UpJYI1df-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6140b9e22a5c2bec953454ba4737dd9cd2a1f754
commit: 28617d9631dc65be773b8a28718e8614558caa5f [1761/1761] scsi: libsas: Abort all in-flight requests when device is gone
config: arm64-randconfig-001-20250825 (https://download.01.org/0day-ci/archive/20250825/202508252122.UpJYI1df-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508252122.UpJYI1df-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508252122.UpJYI1df-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/../../drivers/scsi/isci/remote_node_context.h:67:0,
                    from include/uapi/../../drivers/scsi/isci/remote_device.h:61,
                    from drivers/scsi/libsas/sas_discover.c:36:
>> include/uapi/../../drivers/scsi/isci/isci.h:531:1: error: attempted to randomize userland API struct sci_base_state
    };
    ^
   In file included from drivers/scsi/libsas/sas_discover.c:30:0:
   drivers/scsi/libsas/sas_discover.c: In function 'sas_discover_domain':
   drivers/scsi/libsas/sas_internal.h:37:31: warning: this statement may fall through [-Wimplicit-fallthrough=]
    #define SAS_DPRINTK(fmt, ...) printk(KERN_DEBUG "sas: " fmt, ## __VA_ARGS__)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_discover.c:512:3: note: in expansion of macro 'SAS_DPRINTK'
      SAS_DPRINTK("ATA device seen but CONFIG_SCSI_SAS_ATA=N so cannot attach\n");
      ^~~~~~~~~~~
   drivers/scsi/libsas/sas_discover.c:515:2: note: here
     default:
     ^~~~~~~


vim +531 include/uapi/../../drivers/scsi/isci/isci.h

12ef65444de9d3 Edmund Nadolski 2011-06-02  527  
12ef65444de9d3 Edmund Nadolski 2011-06-02  528  struct sci_base_state {
12ef65444de9d3 Edmund Nadolski 2011-06-02  529  	sci_state_transition_t enter_state;	/* Called on state entry */
12ef65444de9d3 Edmund Nadolski 2011-06-02  530  	sci_state_transition_t exit_state;	/* Called on state exit */
12ef65444de9d3 Edmund Nadolski 2011-06-02 @531  };
12ef65444de9d3 Edmund Nadolski 2011-06-02  532  

:::::: The code at line 531 was first introduced by commit
:::::: 12ef65444de9d387a383b9991960848bed5bbe74 isci: additional state machine cleanup

:::::: TO: Edmund Nadolski <edmund.nadolski@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
