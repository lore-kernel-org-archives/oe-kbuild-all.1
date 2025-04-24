Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EE184F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475582; cv=none; b=OfaY1bvhy/X1FsLox4jK+EPy1oge7anMtLAGcclyW04xhxFbCCUWRjOxgvGyMfzHFk5RZBGGCG9qGx15mcXYnjAinad53QlCwqL037ryAeP46tY51lUgD5knPwIRFCuHO6WvE6RxiF/p7HtSkj5TYqsAyRn7gK61TOQoq7Rj+mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475582; c=relaxed/simple;
	bh=Koszc5P/TrKRYp0ISXfKq1422dKy7icL3cMmXUvf33Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XG9ovFOqgXe6HHI25Md/+qRS/gKNZH3zzguwrU9nk3+B7CKjw+2ll8zZpBrsfeEuCQGSPeuiY6jTSSADUlVzWnaQ1ZjybMmc5jFe7/33yUIF772jsT9x6mUvNA9LY7J7UVgDxvgxil7rV1KuQtmoQEa9TPro9AWX10lrkhLk2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FptvxRAa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FptvxRAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745475580; x=1777011580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Koszc5P/TrKRYp0ISXfKq1422dKy7icL3cMmXUvf33Y=;
  b=FptvxRAawtGSfZVUP/pR7xslbcT7rbxd+P/K6KjoMfSyhOWD/yjOTtq7
   gCp3R/ulhkbfSP43gbCYBFsm9g8SQ+EiICj1PcVWWtFIJPgDroJJNUWPA
   f4oaj51F8pgoh53Qw/eZcxd2PumSYZSvd8MZBWBSrg2g8z8Ht8mZKEmui
   4hzchbLbDYqglESswcdP4AUw1Ch8S/MoF5GYoxGlQeMufKnIEiCuWJM/D
   yZ+eIRpodRAmypDQ7j76kAdS9PI8A7SMyVhxKefWQZWT1nYYwRxzUcBat
   /L5vgjsoBhbEOwnZNlRvVqum+9D3pZFDnd9HlGauNYm0q7TFsbIJx1lD6
   g==;
X-CSE-ConnectionGUID: LOet6phQTS6b8CQKXlE36A==
X-CSE-MsgGUID: kq3W890XQWaeOhNjZVBpmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58084638"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="58084638"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 23:19:38 -0700
X-CSE-ConnectionGUID: Cq83Zs2/TsG4KoBC7y58xA==
X-CSE-MsgGUID: o6z90u1vSAivz8q7dH78Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132828418"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Apr 2025 23:19:37 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7pvq-0003ub-1c;
	Thu, 24 Apr 2025 06:19:34 +0000
Date: Thu, 24 Apr 2025 14:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Josef Bacik <josef@toxicpanda.com>
Subject: [btrfs:pr/1157 91/97] fs/btrfs/messages.h:181:29: error: expected
 ')' before '__VA_OPT__'
Message-ID: <202504241458.DGT7MuTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   10c06ead9f79886df92197deb8d5c7bc37d52971
commit: 3050d7e09e5d7781bd9cfd8a27fc3d942afcd15c [91/97] btrfs: enhance ASSERT() to take optional format string
config: arm-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241458.DGT7MuTv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241458.DGT7MuTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241458.DGT7MuTv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/ctree.c:11:0:
   fs/btrfs/compression.h: In function 'btrfs_calc_input_length':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/compression.h:83:2: note: in expansion of macro 'ASSERT'
     ASSERT(folio_pos(folio) <= cur);
     ^~~~~~
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/compression.h:84:2: note: in expansion of macro 'ASSERT'
     ASSERT(cur < folio_end);
     ^~~~~~
   fs/btrfs/extent_io.h: In function 'offset_in_eb_folio':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/extent_io.h:132:2: note: in expansion of macro 'ASSERT'
     ASSERT(eb->folio_size);
     ^~~~~~
   fs/btrfs/btrfs_inode.h: In function 'btrfs_assert_inode_locked':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/btrfs_inode.h:515:2: note: in expansion of macro 'ASSERT'
     ASSERT(inode_is_locked(&inode->vfs_inode));
     ^~~~~~
   fs/btrfs/delayed-ref.h: In function 'btrfs_ref_type':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/delayed-ref.h:441:2: note: in expansion of macro 'ASSERT'
     ASSERT(ref->type == BTRFS_REF_DATA || ref->type == BTRFS_REF_METADATA);
     ^~~~~~
   fs/btrfs/volumes.h: In function 'btrfs_free_chunk_map':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.h:634:3: note: in expansion of macro 'ASSERT'
      ASSERT(RB_EMPTY_NODE(&map->rb_node));
      ^~~~~~
   fs/btrfs/volumes.h: In function 'btrfs_chunk_item_size':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.h:687:2: note: in expansion of macro 'ASSERT'
     ASSERT(num_stripes);
     ^~~~~~
   fs/btrfs/ctree.c: In function 'btrfs_read_node_slot':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:824:2: note: in expansion of macro 'ASSERT'
     ASSERT(level);
     ^~~~~~
   fs/btrfs/ctree.c: In function 'balance_level':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:864:2: note: in expansion of macro 'ASSERT'
     ASSERT(level > 0);
     ^~~~~~
   fs/btrfs/ctree.c: In function 'read_block_for_search':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1515:4: note: in expansion of macro 'ASSERT'
       ASSERT(!tmp_locked);
       ^~~~~~
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1542:3: note: in expansion of macro 'ASSERT'
      ASSERT(ret == -EAGAIN);
      ^~~~~~
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1569:3: note: in expansion of macro 'ASSERT'
      ASSERT(!tmp_locked);
      ^~~~~~
   fs/btrfs/ctree.c: In function 'btrfs_find_item':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1651:2: note: in expansion of macro 'ASSERT'
     ASSERT(path);
     ^~~~~~
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1652:2: note: in expansion of macro 'ASSERT'
     ASSERT(found_key);
     ^~~~~~
   fs/btrfs/ctree.c: In function 'btrfs_search_slot_get_root':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1694:3: note: in expansion of macro 'ASSERT'
      ASSERT(p->skip_locking == 1);
      ^~~~~~
   fs/btrfs/ctree.c: In function 'finish_need_commit_sem_search':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1779:2: note: in expansion of macro 'ASSERT'
     ASSERT(path->need_commit_sem);
     ^~~~~~
   fs/btrfs/ctree.c: In function 'search_leaf':
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1852:4: note: in expansion of macro 'ASSERT'
       ASSERT(btrfs_header_nritems(leaf) > 0);
       ^~~~~~
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1924:4: note: in expansion of macro 'ASSERT'
       ASSERT(ins_len >= sizeof(struct btrfs_item));
       ^~~~~~
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1928:3: note: in expansion of macro 'ASSERT'
      ASSERT(leaf_free_space >= 0);
      ^~~~~~
>> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:1935:4: note: in expansion of macro 'ASSERT'
       ASSERT(err <= 0);
       ^~~~~~
   fs/btrfs/ctree.c: In function 'btrfs_search_slot':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:2010:2: note: in expansion of macro 'ASSERT'
     ASSERT(!p->nowait || !cow);
     ^~~~~~
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:2037:3: note: in expansion of macro 'ASSERT'
      ASSERT(p->search_commit_root);
      ^~~~~~
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:2122:5: note: in expansion of macro 'ASSERT'
        ASSERT(write_lock_level >= 1);
        ^~~~~~
   fs/btrfs/ctree.c: In function 'btrfs_search_old_slot':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/ctree.c:2246:2: note: in expansion of macro 'ASSERT'
     ASSERT(!p->nowait);
     ^~~~~~
   fs/btrfs/ctree.c: In function 'split_node':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
..


vim +181 fs/btrfs/messages.h

   177	
   178	/* Take the first token if any. */
   179	#define __FIRST_ARG(_, ...) _
   180	/* Skip the first token and return the rest, if it's empty the comma is dropped. */
 > 181	#define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
