Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F837BB1D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 05:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720684; cv=none; b=NSKkRXNhY3+7oekoZcOWzqnoX2Q7BzmOl1+MsBxac9o8LYvviqxK/3LJOeDwyLxLqtTibHdWgDH0OYsDFy0kyFzhAGZwpYIJCaZES/ZbqW+7cRSEDDz/lIbNy8RGYWziaqrYLxOaeu0EB+rdHSyLEVX8Oy+BPJovSjgd5GsRT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720684; c=relaxed/simple;
	bh=+uszGQygTgEhZQEKq/ELrxbs7+rjhtj0vaIUT19kvSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldcFSi3UO3DXx2GyxV07qithrPjXA3d86xCcawSrBjqkscGybmyw2QloewOMod4+LfnJl/J7g4zaunbPpgpDXpQaOV2MDLD1tfohdnarKv9m9wxLwU7f5djg5Q0MT0kXXRFr3/weqhzz3OyiCeOmGeslJcqNjDZAjB3ZhiVTapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btttioXB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btttioXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720684; x=1765256684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+uszGQygTgEhZQEKq/ELrxbs7+rjhtj0vaIUT19kvSA=;
  b=btttioXB9ClvqFGYQU0uYWg39m3Vc5bjnZxuPIqfRmtqIhQ/dv8njH7y
   FNpnkvF8kZH2D4O7UyxZL5DvnzBLD56YZMZxB9oeQhJiYLsqT7e7EsQCf
   x/2BPJzwpB0b+HWVgG0R9IEQbawQLJMIEdEyLkV+Yc3v7lXiyrZoQ+WUo
   2W3qcrNxActhoMbuDOVysYxutOkZYVaYtVxlLy/THNUChwyI1YDnMDXMS
   SQ+GSOXERSrD9Z2kdyMHfv8s/BaX4ENIl8SB/+Pn/VMJgUKwFZZjNHqIp
   cF22TbxoqDPRberZu7J45cEXQ48ed3LJRUta7YNDXJA207kNzf2Vea3um
   A==;
X-CSE-ConnectionGUID: Ow6SlMf0Sba9zf6g2OFu9g==
X-CSE-MsgGUID: tLw06ctrQBWFUsRMApPrUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34148496"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34148496"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:04:43 -0800
X-CSE-ConnectionGUID: 7qd/1W/ZSOemWTHmxvikQA==
X-CSE-MsgGUID: k6QSZCUNRVexY42faNl/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94766311"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 21:04:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVwl-0003xN-0Q;
	Mon, 09 Dec 2024 05:04:39 +0000
Date: Mon, 9 Dec 2024 13:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Roger L. Beckermeyer III" <beckerlee3@gmail.com>,
	linux-btrfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	"Roger L. Beckermeyer III" <beckerlee3@gmail.com>
Subject: Re: [PATCH] btrfs: edits tree_insert() to use rb helpers
Message-ID: <202412090944.g3jpT1Cz-lkp@intel.com>
References: <5e023dcf8f086296da987f8ba2b43be0aca15b86.1733695544.git.beckerlee3@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e023dcf8f086296da987f8ba2b43be0aca15b86.1733695544.git.beckerlee3@gmail.com>

Hi Roger,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.13-rc2 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-L-Beckermeyer-III/btrfs-edits-tree_insert-to-use-rb-helpers/20241209-064230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/5e023dcf8f086296da987f8ba2b43be0aca15b86.1733695544.git.beckerlee3%40gmail.com
patch subject: [PATCH] btrfs: edits tree_insert() to use rb helpers
config: arc-randconfig-002-20241209 (https://download.01.org/0day-ci/archive/20241209/202412090944.g3jpT1Cz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412090944.g3jpT1Cz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090944.g3jpT1Cz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/btrfs/delayed-ref.c: In function 'tree_insert':
>> fs/btrfs/delayed-ref.c:342:17: error: implicit declaration of function 'rb_find_add_cached'; did you mean 'rb_find_add_rcu'? [-Werror=implicit-function-declaration]
     342 |         exist = rb_find_add_cached(node, root, comp_refs_node);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 rb_find_add_rcu
>> fs/btrfs/delayed-ref.c:342:15: warning: assignment to 'struct rb_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     342 |         exist = rb_find_add_cached(node, root, comp_refs_node);
         |               ^
   cc1: some warnings being treated as errors


vim +342 fs/btrfs/delayed-ref.c

   334	
   335	static struct btrfs_delayed_ref_node* tree_insert(struct rb_root_cached *root,
   336			struct btrfs_delayed_ref_node *ins)
   337	{
   338		struct rb_node *node = &ins->ref_node;
   339		struct rb_node *exist;
   340		struct btrfs_delayed_ref_node *entry;
   341	
 > 342		exist = rb_find_add_cached(node, root, comp_refs_node);
   343		if (exist != NULL) {
   344			entry = rb_entry(exist, struct btrfs_delayed_ref_node, ref_node);
   345			return entry;
   346		}
   347		return NULL;
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
