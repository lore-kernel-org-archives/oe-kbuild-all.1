Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4A10EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 01:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691804640; x=1723340640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDHLPtoSt23Lyd2EaCyUPcJ00851gfO9F1aEA5xZoYw=;
  b=UwF+uZ1N2ljQAVkqJ4wLVMmK8/28AQXhd3dEibPAZ3zJgCDVrfsbcH5r
   kIrkYOpZyz0qCuyJtSNbXIRgtuE70kXdeyqJ79DKmZzUNCpuIbjjs4nuP
   cHxg310CsSqER7Vh8YfXiC1X+HcgdPkB/ntAvVkYWP2AhyjMc/tNrkxRe
   Sz/Wf4bBPUK3nLRD0o69aoBdQQwEBorLfTMR6zWBFnYmz49sTrf3Qz/pf
   Z9hCfyyUSeCaIxmsPw5dchwkuZlmQSfWpp8vhidk7MedyX9gWL6s/mpY6
   o0QQ0V7qzvO8vGE2aQ1sCxiC5trEwkg2et95601JQgNW0zC97usyIuYUr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369264759"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="369264759"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767845468"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="767845468"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 18:43:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUdfZ-0008BQ-0L;
	Sat, 12 Aug 2023 01:43:57 +0000
Date: Sat, 12 Aug 2023 09:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/pcm-iov_iter 3/25] sound/core/memory.c:108:53:
 warning: passing argument 2 of 'copy_from_iter' makes integer from pointer
 without a cast
Message-ID: <202308120931.Aj1gaY7K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/pcm-iov_iter
head:   da1be13e050f24d088d24fd65517d56f27a2eeb1
commit: 516e284c8b17a5129fcfbfb1f2f4e11093e13d3f [3/25] ALSA: core: Add memory copy helpers between iov_iter and iomem
config: i386-randconfig-r033-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120931.Aj1gaY7K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120931.Aj1gaY7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120931.Aj1gaY7K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/memory.c: In function 'copy_from_iter_toio':
>> sound/core/memory.c:108:53: warning: passing argument 2 of 'copy_from_iter' makes integer from pointer without a cast [-Wint-conversion]
     108 |         return !copy_from_iter((void __force *)dst, src, count) ? -EFAULT : 0;
         |                                                     ^~~
         |                                                     |
         |                                                     struct iov_iter *
   In file included from include/sound/pcm.h:19,
                    from sound/core/memory.c:12:
   include/linux/uio.h:199:42: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct iov_iter *'
     199 | size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
         |                                   ~~~~~~~^~~~~
>> sound/core/memory.c:108:58: warning: passing argument 3 of 'copy_from_iter' makes pointer from integer without a cast [-Wint-conversion]
     108 |         return !copy_from_iter((void __force *)dst, src, count) ? -EFAULT : 0;
         |                                                          ^~~~~
         |                                                          |
         |                                                          size_t {aka unsigned int}
   include/linux/uio.h:199:66: note: expected 'struct iov_iter *' but argument is of type 'size_t' {aka 'unsigned int'}
     199 | size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
         |                                                 ~~~~~~~~~~~~~~~~~^


vim +/copy_from_iter +108 sound/core/memory.c

    93	
    94	/**
    95	 * copy_from_iter_toio - copy data from iov_iter to mmio-space
    96	 * @dst: the destination pointer on mmio-space
    97	 * @src: the source iov_iter
    98	 * @count: the data size to copy in bytes
    99	 *
   100	 * Copies the data from iov_iter to mmio-space.
   101	 * Only the single segment iov_iter is assumed for now.
   102	 *
   103	 * Return: Zero if successful, or non-zero on failure.
   104	 */
   105	int copy_from_iter_toio(void __iomem *dst, struct iov_iter *src, size_t count)
   106	{
   107	#if defined(__i386__) || defined(CONFIG_SPARC32)
 > 108		return !copy_from_iter((void __force *)dst, src, count) ? -EFAULT : 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
