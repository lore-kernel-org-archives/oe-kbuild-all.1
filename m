Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943327FB0E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762188426; cv=none; b=bFXByK1WWp1szkLDdyPrH8NxC3bzWC7lqHieMFQ33wcf18kwdnEPZdlI+KxlKWKvVfFkSN6vLUBiKJMnst0ZrgdezQiO2hPCtr1J/aCy/xYLt6PpY5Jv/Jgxtn+E19TNBgvAg+yuIjRcwYRq+V1hyhQA0X8i1PcFYlgToue0ClQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762188426; c=relaxed/simple;
	bh=I4nRuYkou8hpPPiqmMUcZqVzseujjF7kVic3SnG5yMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c96ogea0WYv3aFJPlv5xZvpdLgkA9HX8W0GnFwNmBC836GOTk9OS6fre4L94fUVPLHYjyje6i+8kj72qsq/5CrFU6DRw6PMNHuXDG9Nh0sAVoO+6sztySEinX89a6e+wRqoD2ebDdPmoyotEM0KSCUXicZzdiKRyHo4MSZqzjBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpoUOfAx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpoUOfAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762188426; x=1793724426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4nRuYkou8hpPPiqmMUcZqVzseujjF7kVic3SnG5yMU=;
  b=kpoUOfAxefnNmMgfiH+mYmOpkB92aeiXb9cPy62Jv72H4B+v1XQZNu8b
   weZBcbgfSsvD8klaGK+VJzqwfQrdYsUHuKR7CC05r9XdtxY+UYY8CdIHq
   YJcm+GER6XxtlzIPtsAMs7IUkB/iGqkuwff7CpgLaCxZUz6rnWOh5lGa9
   Yen/lLQ5OuyYo1LD2K2H1UZ/3Jn/6PWJj9YHY8rCvqsrrYXKUC/vYqDZT
   yULL/mAfWe05Hy+5AtGXruZabHU1/m8kMUIZxFHFMF+rEF5BWwN5SinHi
   3kaCmTfG9HaLqv9PI0JF9DtOeR33lReRj1LFyQ6CQYIxE/djFCVcHSBht
   Q==;
X-CSE-ConnectionGUID: 7t7eINg1QIWf8OhTj0m3gA==
X-CSE-MsgGUID: NlGuUCc/TiOfHryOc7wc4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64173077"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64173077"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 08:47:05 -0800
X-CSE-ConnectionGUID: 69O/rS0BSQKQFSbC/XrP/A==
X-CSE-MsgGUID: nqpC7sywQOWWHywiMlfmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186589410"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2025 08:47:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxht-000QMM-1e;
	Mon, 03 Nov 2025 16:47:01 +0000
Date: Tue, 4 Nov 2025 00:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw/v2-test-unfinished 5/12] bdev.c:(.text+0x13fc):
 relocation truncated to fit: R_NIOS2_CALL26 against `blk_mq_dma_map'
Message-ID: <202511040008.B6xZB8jm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw/v2-test-unfinished
head:   e693ed6721c39c7abddc6cfa222e7a443a2da12d
commit: fc6369495a6ef8337df6a7dd322aeec059e0b377 [5/12] block: add infra to handle dmabuf tokens
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251104/202511040008.B6xZB8jm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040008.B6xZB8jm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040008.B6xZB8jm-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: block/bdev.o: in function `blkdev_dma_map':
   bdev.c:(.text+0x13fc): undefined reference to `blk_mq_dma_map'
>> bdev.c:(.text+0x13fc): relocation truncated to fit: R_NIOS2_CALL26 against `blk_mq_dma_map'
   nios2-linux-ld: block/blk-mq.o: in function `blk_mq_submit_bio':
   blk-mq.c:(.text+0x6e70): undefined reference to `blk_rq_assign_dma_map'
>> blk-mq.c:(.text+0x6e70): relocation truncated to fit: R_NIOS2_CALL26 against `blk_rq_assign_dma_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
