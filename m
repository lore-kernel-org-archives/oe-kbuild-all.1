Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595151531D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 23:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725059385; cv=none; b=MmArKpvZ0Str5YDjwHZWznIdQyHr3B/GUe8GrEsHHQSyfKY9aGH0qObqDWpNoHmHpFuKBykuxDgWR0FTsLx62ARxjWrBnm33d2d6LMwU+q7/u/U1Ea1XWuOJ+OSbr8YdxBTMOV9okEdDMAMbJ+s+2ZbiuKvMTZqPFEr9wHwmqko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725059385; c=relaxed/simple;
	bh=hKEtyGMIvQIKLM+rOfNdBXcMAgNaVXH803DaPCaFwPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5nrXudszGXkKf3Gv+F5f+WSMLDfuue5fzex5pG4hwgLu/iSt+USupWxk1XMafAfv/C00VTHnPGUIJa663NoJzilAIzhoxynit5gXegSniOnDX9sZuytnP8GPNajcbV0eDWUaGWiwoxSEx6pKion/AZJg7x/DZEktIo/s8A1Eg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIE7lAlO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIE7lAlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725059384; x=1756595384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hKEtyGMIvQIKLM+rOfNdBXcMAgNaVXH803DaPCaFwPQ=;
  b=QIE7lAlO4xqAOU+yCRR+c2PproQxoJ1vXr9Fg7vXtcDYcvYb3YR8olca
   k0oL1VfvXbFFbhGnwJvEgQLW1yBYAXZyOGFdXjh1CdtbHuy3kkJydWM7Q
   qfhRNYh+SDABkmyBlWiQmAusN6MlGOmJNjavF4DO1fP0HlhB2rejC1dAq
   BNfxNcj3HjI4OWGpW9fnW/HYusxm4FQ7Oh/4rlMpN6QNsWHM3VV1qMIU2
   tVXIAvMXro9hYyH6R3X71+QkLOWU8US/DADU7h4JriXJ6keKeEZU/7giU
   wbMVqipVhFwOWLxqXo8dbGHRpb6z6yTLvc/uyOJjIKzTDCpLOHA/Qjpo9
   w==;
X-CSE-ConnectionGUID: iIBxVzDCRDycoa2px3OHZg==
X-CSE-MsgGUID: KYiLrn1aQlCUOcGvVJideg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13305122"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="13305122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 16:09:43 -0700
X-CSE-ConnectionGUID: CQ5JerKfTQqfjppGgmT/qA==
X-CSE-MsgGUID: /BhuuwWOSw+0bbtiU5HEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68876432"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Aug 2024 16:09:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skAkN-0002CE-1I;
	Fri, 30 Aug 2024 23:09:39 +0000
Date: Sat, 31 Aug 2024 07:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] btrfs: constify more pointer parameters
Message-ID: <202408310654.O4kPlMjW-lkp@intel.com>
References: <e163012ed80a4f55ce17641586681c6ac4ff9018.1724859620.git.dsterba@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e163012ed80a4f55ce17641586681c6ac4ff9018.1724859620.git.dsterba@suse.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master next-20240830]
[cannot apply to v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Sterba/btrfs-rework-BTRFS_I-as-macro-to-preserve-parameter-const/20240828-234222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/e163012ed80a4f55ce17641586681c6ac4ff9018.1724859620.git.dsterba%40suse.com
patch subject: [PATCH 2/2] btrfs: constify more pointer parameters
config: x86_64-randconfig-123-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310654.O4kPlMjW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310654.O4kPlMjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310654.O4kPlMjW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/block-group.c:1762:51: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct btrfs_fs_info *fs_info @@     got struct btrfs_fs_info const *fs_info @@
   fs/btrfs/block-group.c:1762:51: sparse:     expected struct btrfs_fs_info *fs_info
   fs/btrfs/block-group.c:1762:51: sparse:     got struct btrfs_fs_info const *fs_info

vim +1762 fs/btrfs/block-group.c

2ca0ec770c62b32 Johannes Thumshirn 2021-10-14  1758  
17ca64afd0470e9 David Sterba       2024-08-28  1759  static inline bool btrfs_should_reclaim(const struct btrfs_fs_info *fs_info)
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1760  {
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1761  	if (btrfs_is_zoned(fs_info))
3687fcb0752ac9c Johannes Thumshirn 2022-03-29 @1762  		return btrfs_zoned_should_reclaim(fs_info);
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1763  	return true;
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1764  }
3687fcb0752ac9c Johannes Thumshirn 2022-03-29  1765  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
