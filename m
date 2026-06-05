Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74D3F39C7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654218; cv=none; b=r+vD6mCj4Q3wEwsbI6mRhxLTx4MaFKo5s8S8PK7lwG8Q9sSzm1UtGzvG7JTluYdvHxS6HOzDqj7e0MVXST+lmA1hazrgJ8SsQjDe9eEPlMGP4c9gnYvn8HuDauefYGil1zP59/r3vk1t3jszbBsbB324DmLK8zgj2jKhTnzCBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654218; c=relaxed/simple;
	bh=OniSiIUZfkX9DzebqNGw39xDzYzBX34avMJiWZQ0/+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ5q7B1JNLqRDfLYusI2Oy1ofBks+kkQg01Hf8qVXkZHpIINMqjvT09Y1noA0VkyAMiAV5tWXWMPub2I1hiKX4HlEc585Uye/A+kCIKBh3w2eXB8r0LCW2r+j+zlGFhP+D/etT8BNoMpgsF5E21o47F/3c6IWDzG8GpSLVTdhc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URp803Lx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URp803Lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780654217; x=1812190217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OniSiIUZfkX9DzebqNGw39xDzYzBX34avMJiWZQ0/+w=;
  b=URp803LxFNUrYFOpFIYLbhbgW0/r/POCTwYaBjiH9mg+L3Fx1d2BgQ9s
   4ahWS892YFIlLnl19TTnhu+AFSgWXweugET9WeFLn7CxLDpgyrXqDhTJG
   hEe32cfSZTBd2LVe8R489k0W5lkgIeMGgwyuHW3mQV9ugC4HJBSB1lKRP
   UZ/Sm+/uq9oI9bFor9pdcVURoZ/XcFwanPfy6d4aLyzTmaI8ftR9JbRjP
   tAKh/J1UiOm+PGhcb59iWskNn96pbJOu4Fj/EeePZ3T+hZ9QBdlKpZKZN
   ooNOvpZHTpXJmMRMin+USk1QbbibkOhD/qcG60DeiiaGoPcojKdtL3lKP
   A==;
X-CSE-ConnectionGUID: xAieVKW4TmSYEr2ZWaKlJQ==
X-CSE-MsgGUID: TbqNpSkPSe+pvFhrbqIU4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="99060919"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="99060919"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:10:15 -0700
X-CSE-ConnectionGUID: G2iaHSZwT8WTfLzUaJEI1g==
X-CSE-MsgGUID: pueleeM3QFS0yypcI/V8zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="268499513"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2026 03:10:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVRVD-000000002Y5-3MAz;
	Fri, 05 Jun 2026 10:10:11 +0000
Date: Fri, 5 Jun 2026 12:09:42 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 wireless-next] wifi: mac80211: fold tid_ampdu_rx
 allocations into a flexible array
Message-ID: <202606051234.K5D1iGLy-lkp@intel.com>
References: <20260605005627.317194-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605005627.317194-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v7.1-rc6 next-20260604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/wifi-mac80211-fold-tid_ampdu_rx-allocations-into-a-flexible-array/20260605-085839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260605005627.317194-1-rosenp%40gmail.com
patch subject: [PATCHv2 wireless-next] wifi: mac80211: fold tid_ampdu_rx allocations into a flexible array
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606051234.K5D1iGLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051234.K5D1iGLy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
   ------------------------------------------------------------------------------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
   --------------------------------------------------------------------------------------------^
>> Documentation/driver-api/80211/mac80211-advanced:228: ./net/mac80211/sta_info.h:229: WARNING: Inline strong start-string without end-string. [docutils]
>> Documentation/driver-api/80211/mac80211-advanced:228: ./net/mac80211/sta_info.h:229: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
