Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD340816
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 06:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712386346; cv=none; b=O68LLfE9uf5YYnzhc1kSAuQR7zwa3NfGjqODCxU9yz87vkBziiRNdmA5rZBu9Y12nxUIi/ztjjleQc+spQ6+kU4O3AfoJvCpwz3Zne9Pa+J2uKg1HwOPOUU0DS/vcTl+f6NLH1S/adduFYVT2NjXSd7iV5VaNx/BCXcA7WqFYu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712386346; c=relaxed/simple;
	bh=bYoVeIqw/HM0PjZMSQPG4prTNAlO239JjRn7eLo6Yhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FzasH9HsfOYF2ByLXOd72a6RPa89+iY1TzQ9prf7M3/EvLfq/HXKkvWwlSB8zcJdo17e04ra44TrNb5E+yksxHQVsm8jxl5wA5cioAeOjNYPtYDUqG+eRqynqtNO/3KEJNtNwRQj4+PDjrAJqlIOyZ60irZavv/UCa9v02AFmeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOtbMHn5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOtbMHn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712386344; x=1743922344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYoVeIqw/HM0PjZMSQPG4prTNAlO239JjRn7eLo6Yhk=;
  b=kOtbMHn5I5HfVp5onUWFEhKvFRIQNZF0je06O3iCpQ59MQqByj6SivlL
   5Kn4pkeoL7ASYKXmAVzG/Hds4KB4KLSmqAVYrhFLWWVxz9m7cjW3L485L
   LQuT3JiE2SpVsrdERRrrFhp8zrCSLQUzVYWqco3nQbhDA+0I4qYzjYPq0
   6U+MWgNjSg8+J4n/VEB9BTyKhqbfweVoevya7qil8T1bFN/LLN3WsSR+7
   I0lOSwFCiwR8XHuutPstS3L5VXBIzOiiqOktdCw/dkbKBkvle0+t8oH6H
   lEuKpEZTht6nqcdr7U5Qps3xcRh98GlRkSglgZA/Sn1+78GoIC4Xc/7U7
   A==;
X-CSE-ConnectionGUID: /8dYYLYHQja+8bZQkEAd2Q==
X-CSE-MsgGUID: llVAL2jjRB6jaj/cPwswtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7893712"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7893712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 23:52:23 -0700
X-CSE-ConnectionGUID: Qn+R2TtET4m+W1IIIi47BA==
X-CSE-MsgGUID: eGri+pG/RhSZBJTDWw70QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19454240"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2024 23:52:22 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rszuV-0003DA-06;
	Sat, 06 Apr 2024 06:52:19 +0000
Date: Sat, 6 Apr 2024 14:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 101/105] arch/x86/kernel/kdebugfs.c:66:1:
 warning: control reaches end of non-void function
Message-ID: <202404061420.7N9XnLYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bb4803260393a54d3b254c2abfe121ab89cce776
commit: 3965099c682e2bdbd4e5f6ef81beef00806350a4 [101/105] arch/x86: convert to read/write iterators
config: i386-buildonly-randconfig-005-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061420.7N9XnLYG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061420.7N9XnLYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061420.7N9XnLYG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/kdebugfs.c: In function 'setup_data_read':
   arch/x86/kernel/kdebugfs.c:43:6: error: 'count' undeclared (first use in this function); did you mean 'ucounts'?
     if (count > node->len - pos)
         ^~~~~
         ucounts
   arch/x86/kernel/kdebugfs.c:43:6: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/kdebugfs.c:56:12: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
     remain = !copy_to_iter_full(p, count, to);
               ^~~~~~~~~~~~~~~~~
               copy_to_user_nofault
>> arch/x86/kernel/kdebugfs.c:66:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors


vim +66 arch/x86/kernel/kdebugfs.c

c14b2adf19b5d3 Huang, Ying            2008-03-28  28  
3965099c682e2b Jens Axboe             2024-04-05  29  static ssize_t setup_data_read(struct kiocb *iocb, struct iov_iter *to)
c14b2adf19b5d3 Huang, Ying            2008-03-28  30  {
3965099c682e2b Jens Axboe             2024-04-05  31  	struct setup_data_node *node = iocb->ki_filp->private_data;
c14b2adf19b5d3 Huang, Ying            2008-03-28  32  	unsigned long remain;
3965099c682e2b Jens Axboe             2024-04-05  33  	loff_t pos = iocb->ki_pos;
c14b2adf19b5d3 Huang, Ying            2008-03-28  34  	void *p;
c14b2adf19b5d3 Huang, Ying            2008-03-28  35  	u64 pa;
c14b2adf19b5d3 Huang, Ying            2008-03-28  36  
c14b2adf19b5d3 Huang, Ying            2008-03-28  37  	if (pos < 0)
c14b2adf19b5d3 Huang, Ying            2008-03-28  38  		return -EINVAL;
390cd85c8ae4dc Jaswinder Singh Rajput 2009-03-21  39  
c14b2adf19b5d3 Huang, Ying            2008-03-28  40  	if (pos >= node->len)
c14b2adf19b5d3 Huang, Ying            2008-03-28  41  		return 0;
c14b2adf19b5d3 Huang, Ying            2008-03-28  42  
c14b2adf19b5d3 Huang, Ying            2008-03-28 @43  	if (count > node->len - pos)
c14b2adf19b5d3 Huang, Ying            2008-03-28  44  		count = node->len - pos;
390cd85c8ae4dc Jaswinder Singh Rajput 2009-03-21  45  
b3c72fc9a78e74 Daniel Kiper           2019-11-12  46  	pa = node->paddr + pos;
b3c72fc9a78e74 Daniel Kiper           2019-11-12  47  
b3c72fc9a78e74 Daniel Kiper           2019-11-12  48  	/* Is it direct data or invalid indirect one? */
b3c72fc9a78e74 Daniel Kiper           2019-11-12  49  	if (!(node->type & SETUP_INDIRECT) || node->type == SETUP_INDIRECT)
b3c72fc9a78e74 Daniel Kiper           2019-11-12  50  		pa += sizeof(struct setup_data);
b3c72fc9a78e74 Daniel Kiper           2019-11-12  51  
f7750a79568788 Tom Lendacky           2017-07-17  52  	p = memremap(pa, count, MEMREMAP_WB);
c14b2adf19b5d3 Huang, Ying            2008-03-28  53  	if (!p)
f7750a79568788 Tom Lendacky           2017-07-17  54  		return -ENOMEM;
c14b2adf19b5d3 Huang, Ying            2008-03-28  55  
3965099c682e2b Jens Axboe             2024-04-05  56  	remain = !copy_to_iter_full(p, count, to);
c14b2adf19b5d3 Huang, Ying            2008-03-28  57  
f7750a79568788 Tom Lendacky           2017-07-17  58  	memunmap(p);
c14b2adf19b5d3 Huang, Ying            2008-03-28  59  
c14b2adf19b5d3 Huang, Ying            2008-03-28  60  	if (remain)
c14b2adf19b5d3 Huang, Ying            2008-03-28  61  		return -EFAULT;
c14b2adf19b5d3 Huang, Ying            2008-03-28  62  
3965099c682e2b Jens Axboe             2024-04-05  63  	iocb->ki_pos = pos + count;
c14b2adf19b5d3 Huang, Ying            2008-03-28  64  
c14b2adf19b5d3 Huang, Ying            2008-03-28  65  	return count;
c14b2adf19b5d3 Huang, Ying            2008-03-28 @66  }
c14b2adf19b5d3 Huang, Ying            2008-03-28  67  

:::::: The code at line 66 was first introduced by commit
:::::: c14b2adf19b5d35aff91280b1a73c41a4dcabfe3 x86, boot: export linked list of struct setup_data via debugfs

:::::: TO: Huang, Ying <ying.huang@intel.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
