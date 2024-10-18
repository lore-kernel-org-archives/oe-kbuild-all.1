Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B0920100B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249834; cv=none; b=HhJKC1nqgdYunFAD9n12rncDn27p1nLixXjOvT0vPb4XO3qgLuAeWD7ZrR2+TxtxoVk9CJUuZGUNpqhg93KX5IqcH7PAD87rpfbgmkzZ0oRDrw0sa5IPaJ1GrbjKGHCkY+K99kCzdC7nIiMs0eXcpvnciYK8ywHA7JXjTrjVvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249834; c=relaxed/simple;
	bh=9kQ0aehlkfjzhgdUQq8hOfNiaNyZj1Cmb1e5IjKHAN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCc28wqMhkUG6v+q9cUKmTuS3TSsGNnuacUiF7euvaxPwv8pGXCgQf1fNRJqd2Sf9amsSKqN/Ui7kml/zgC9dVbRRpJ0v7yzO3NSqRak0cE654ydn8hpFFMS+6Lnh1z163Ca6YoIRkDgaIGyC/sad7UzLwo+7wkSUW8xA+lRYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dY8oHpCh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dY8oHpCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729249833; x=1760785833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9kQ0aehlkfjzhgdUQq8hOfNiaNyZj1Cmb1e5IjKHAN8=;
  b=dY8oHpCh7aIfhUQcof8SWOw4hZ9tYYbFKrctNY9fWHPugKfIRZk1HccL
   JPl2xtV58da21JLHjNQnOMAy5vb2vQCNhVI6j88aIHD9M2Ccc0KbEODLX
   ib07QVJRktAenZE+0RFvsPq4/FMg3BXW2REVaBK/D7BjcyRJy7cPBQoic
   OuQD10guRDaRZmXt71pMZGnOJZuXfIL/SzPcJsGmf4T7hJkRS1yIs1ZAd
   4Lgck0GJd/ROlfzKlmO5G+q2+gxi1xzoKEjKR/xToE8Rxxo7AX7IU5Hmo
   eWQpPT/1T4flUCSoqXYqW75kEbsaQ2dTa0NSmWwqu6t76UgBNUh0PfAMj
   g==;
X-CSE-ConnectionGUID: cbPvWxgjRPy+eN9VYwx4Xw==
X-CSE-MsgGUID: tJO69I/BQyWctckKqyKH4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28985103"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28985103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 04:10:32 -0700
X-CSE-ConnectionGUID: 0GftOv7iSjS4tNcDi1tSyQ==
X-CSE-MsgGUID: SEVx6i9HRfeCWg7nUTGG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="79264534"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 04:10:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1ksG-000Nil-0E;
	Fri, 18 Oct 2024 11:10:28 +0000
Date: Fri, 18 Oct 2024 19:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] f2fs: zone: don't block IO if there is remained open
 zone
Message-ID: <202410181912.Jw6P9S73-lkp@intel.com>
References: <20241017081421.2213743-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017081421.2213743-1-chao@kernel.org>

Hi Chao,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-zone-don-t-block-IO-if-there-is-remained-open-zone/20241017-162658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20241017081421.2213743-1-chao%40kernel.org
patch subject: [PATCH v7] f2fs: zone: don't block IO if there is remained open zone
config: openrisc-randconfig-r072-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181912.Jw6P9S73-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181912.Jw6P9S73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181912.Jw6P9S73-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_blkzoned_submit_merged_write':
>> fs/f2fs/data.c:666:69: error: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
     666 |         io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
         |                                                                     ^~~
         |                                                                     |
         |                                                                     struct f2fs_sb_info *
   In file included from fs/f2fs/data.c:24:
   fs/f2fs/f2fs.h:3762:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
    3762 | int f2fs_get_segment_temp(int seg_type);
         |                           ~~~~^~~~~~~~
>> fs/f2fs/data.c:666:47: error: too many arguments to function 'f2fs_get_segment_temp'
     666 |         io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3762:5: note: declared here
    3762 | int f2fs_get_segment_temp(int seg_type);
         |     ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c: In function 'f2fs_mpage_readpages':
   fs/f2fs/data.c:2426:17: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2426 |         pgoff_t index;
         |                 ^~~~~
--
   fs/f2fs/segment.c: In function 'restore_curseg_summaries':
>> fs/f2fs/segment.c:4324:54: error: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
    4324 |                         temp = f2fs_get_segment_temp(sbi, type);
         |                                                      ^~~
         |                                                      |
         |                                                      struct f2fs_sb_info *
   fs/f2fs/segment.c:3610:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
    3610 | int f2fs_get_segment_temp(int seg_type)
         |                           ~~~~^~~~~~~~
>> fs/f2fs/segment.c:4324:32: error: too many arguments to function 'f2fs_get_segment_temp'
    4324 |                         temp = f2fs_get_segment_temp(sbi, type);
         |                                ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:3610:5: note: declared here
    3610 | int f2fs_get_segment_temp(int seg_type)
         |     ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c: In function 'destroy_curseg':
   fs/f2fs/segment.c:5666:69: error: passing argument 1 of 'f2fs_get_segment_temp' makes integer from pointer without a cast [-Wint-conversion]
    5666 |                         enum temp_type temp = f2fs_get_segment_temp(sbi, i);
         |                                                                     ^~~
         |                                                                     |
         |                                                                     struct f2fs_sb_info *
   fs/f2fs/segment.c:3610:31: note: expected 'int' but argument is of type 'struct f2fs_sb_info *'
    3610 | int f2fs_get_segment_temp(int seg_type)
         |                           ~~~~^~~~~~~~
   fs/f2fs/segment.c:5666:47: error: too many arguments to function 'f2fs_get_segment_temp'
    5666 |                         enum temp_type temp = f2fs_get_segment_temp(sbi, i);
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:3610:5: note: declared here
    3610 | int f2fs_get_segment_temp(int seg_type)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/f2fs_get_segment_temp +666 fs/f2fs/data.c

   657	
   658	void f2fs_blkzoned_submit_merged_write(struct f2fs_sb_info *sbi, int type)
   659	{
   660	#ifdef CONFIG_BLK_DEV_ZONED
   661		struct f2fs_bio_info *io;
   662	
   663		if (!f2fs_sb_has_blkzoned(sbi))
   664			return;
   665	
 > 666		io = sbi->write_io[PAGE_TYPE(type)] + f2fs_get_segment_temp(sbi, type);
   667	
   668		f2fs_down_write(&io->io_rwsem);
   669		if (io->zone_opened) {
   670			if (io->bio) {
   671				io->close_zone = true;
   672				__submit_merged_bio(io);
   673			} else {
   674				up(&sbi->available_open_zones);
   675				io->zone_opened = false;
   676			}
   677		}
   678		f2fs_up_write(&io->io_rwsem);
   679	#endif
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
