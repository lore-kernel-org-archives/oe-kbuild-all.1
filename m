Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D220C480
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483706; cv=none; b=hLSiG7E2N0ynxtkPM88EsWuX0cbYkXDv2kErvGXXB3pdBBfMix58JNLBZzwt+c+X7nrhfLlE2OS2v8WMIxqDItJGW5/DwD+dhJEisQcPHwirt9+cgjM8lUNcWD4holdKFs29aG0Fh+H/hMtDRh4QNos/038iz9I1dm9+K9T4F3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483706; c=relaxed/simple;
	bh=oLninvSAGUYHt2k8oA6A6XsoeCG63qFLupVzHad1EYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8AS/MA5RjnHFATN40y//XeFhPo7MxCh13fB20aKqYloO9MjMYuqV0eJxOmzmRrK5R1EmSqDzrNpxO3iOm9r2mLkqCf5r2AlL4nCPeA3f2jMhT3tHyOBxjqMWIUG15teO7ZnUXSOhHjGnwA6lpPjmq9YJ98fYryNYYVAzFF9+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXdOMtx6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXdOMtx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749483704; x=1781019704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLninvSAGUYHt2k8oA6A6XsoeCG63qFLupVzHad1EYM=;
  b=TXdOMtx6YgSolh40ldW/yOVLogiVMEEJ8eZTSM/8n89qcUT7FpTDoW5d
   IKX7xDSRZ3Fs+adOs1Ocy0+TPct18GtvD22HtwSguSATLF3MDlLmxUag6
   bocf3yIxpltMBpdq4f5JN3Tr1+9CBJd2PKjI74roNF9GnQm+e6FTNhbPm
   Cp24Buv5r2AF5/cw3Hs263KyBWiltQwu/Xvi+16zAtQ4lXL6K7ugdJ5mj
   rkvpT0ClFq0fBXvvbgtMLgCh3FRN9LCWF/+SnxOC5I2/NKRv4skb9qQaa
   CmWH369WLGTgub/kAug++tTZG2PR+L8t5xRT4NiJzSooG9dAkRsnqFr6y
   A==;
X-CSE-ConnectionGUID: MUFYQiNsQ9WY3v1Yw2zPmA==
X-CSE-MsgGUID: wqrpsXHgRImoIxMo9MLP/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51476344"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51476344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 08:41:41 -0700
X-CSE-ConnectionGUID: ZG1wlEDuTmWBChkjQMEgyw==
X-CSE-MsgGUID: IPmBLu+KS2mHIke0OJNJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177455852"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jun 2025 08:41:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOeca-000797-2c;
	Mon, 09 Jun 2025 15:41:12 +0000
Date: Mon, 9 Jun 2025 23:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: add mmap_prepare() compatibility layer for nested
 file systems
Message-ID: <202506092301.jUMzAZW1-lkp@intel.com>
References: <20250609092413.45435-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609092413.45435-1-lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-add-mmap_prepare-compatibility-layer-for-nested-file-systems/20250609-172628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250609092413.45435-1-lorenzo.stoakes%40oracle.com
patch subject: [PATCH] mm: add mmap_prepare() compatibility layer for nested file systems
config: arc-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250609/202506092301.jUMzAZW1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506092301.jUMzAZW1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506092301.jUMzAZW1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/mmap.c:1921 function parameter 'vma' not described in 'compat_vma_mmap_prepare'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
