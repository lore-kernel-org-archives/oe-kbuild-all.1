Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3827412C80B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713357740; cv=none; b=bbCvQG/YwhdRmykelXkpszBmb/P9Xyh1BQn1xhtOZfmYf29xbsSy3IA6AFe7N7rLmm5V9Fh3Z2zk0342B6q1I03vaaPLO5krXoe+cGM9GLyqjaDFEOdIj7dtpl/1UP4WMJ6gY4l2HcKuwQ5Kc8DbgG9GteO1ZawVr0jZbjjM42k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713357740; c=relaxed/simple;
	bh=cQ/0FPz7Fn7khjpnU/x3K1CLUw/2ApOerZYJHOB9gW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLk5uPcUoleeJ3uIx7u3LKUhAXc+4VNWyYQs5OB3Dlc9QWUSgxLPObNjkFKai7v5hUMeORlV/Zfwj2LnsqNq7OcVNAHESB/UWD/6v044NA4BuLpYsVF6hnEUGj+XfusXezp8Yndwb7tjkWPAMDi+ob4GviCa+cCewZ0VRhdOEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdTq/NYq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdTq/NYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713357738; x=1744893738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQ/0FPz7Fn7khjpnU/x3K1CLUw/2ApOerZYJHOB9gW8=;
  b=GdTq/NYqK60rdT/4WLacrA2MsWbg4ysOhVPs8+PfMlo/hMxL43cc9sNs
   w0qPqPndP7p7+WUNoIymz2xddBG/ZVN4hGgTlye8cFPBKDs0YwWO+mJ70
   R+2hRR+XPBs/b60d1rb1XsxQmS/DR5e/pYMXQt5+JyadYPfHKDdqg6pWJ
   3xCb2h86jHfwUJbMoz0b58PgV8O7108m/JAcuVGJy7wT2/Ii79ooAg8k/
   0Lmhf/vICZV0H+bvie3cMz+5P5wbCULk4RMgPYDwJVzA8/wkIjBHGgQLg
   HWO8wEQI0hniDOgnSnyPVdUE5C3T3cd3Kblp6RPC9d8ZBunTR9VdagZhR
   Q==;
X-CSE-ConnectionGUID: ZOGUBMQxSTqLLRlLglJz5Q==
X-CSE-MsgGUID: wY7Oxx4MTNGshH6JKjhOYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19450789"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="19450789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 05:42:17 -0700
X-CSE-ConnectionGUID: +t5pbQ+8SZ+7GUzzSqvqYQ==
X-CSE-MsgGUID: cLt4wpGMRaqkSkdS4LjwxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22668851"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2024 05:42:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx4c9-0006aG-2P;
	Wed, 17 Apr 2024 12:42:13 +0000
Date: Wed, 17 Apr 2024 20:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 222/226] drivers/hwtracing/intel_th/msu.c:1434:
 warning: Function parameter or struct member 'to' not described in
 'msc_win_to_user_struct'
Message-ID: <202404172040.hA0I8JYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   fe753ea36f846c5a5638f1db502ba023e76132ae
commit: e95c20aadd66e465c1fb23c890ac43a39612a99c [222/226] intel_th: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240417/202404172040.hA0I8JYX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404172040.hA0I8JYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404172040.hA0I8JYX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c:77: warning: Function parameter or struct member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:122: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'msu_base' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'mbuf_priv' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'work' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'switch_on_unlock' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'orig_addr' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'orig_sz' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'iter_list' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'stop_on_full' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'do_irq' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'multi_is_broken' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:1309: warning: Function parameter or struct member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1309: warning: Function parameter or struct member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1309: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'
>> drivers/hwtracing/intel_th/msu.c:1434: warning: Function parameter or struct member 'to' not described in 'msc_win_to_user_struct'
>> drivers/hwtracing/intel_th/msu.c:1434: warning: Function parameter or struct member 'iocb' not described in 'msc_win_to_user_struct'
>> drivers/hwtracing/intel_th/msu.c:1434: warning: Excess struct member 'buf' description in 'msc_win_to_user_struct'
>> drivers/hwtracing/intel_th/msu.c:1434: warning: Excess struct member 'offset' description in 'msc_win_to_user_struct'


vim +1434 drivers/hwtracing/intel_th/msu.c

ba82664c134ef7 Alexander Shishkin 2015-09-22  1425  
ba82664c134ef7 Alexander Shishkin 2015-09-22  1426  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22  1427   * struct msc_win_to_user_struct - data for copy_to_user() callback
ba82664c134ef7 Alexander Shishkin 2015-09-22  1428   * @buf:	userspace buffer to copy data to
ba82664c134ef7 Alexander Shishkin 2015-09-22  1429   * @offset:	running offset
ba82664c134ef7 Alexander Shishkin 2015-09-22  1430   */
ba82664c134ef7 Alexander Shishkin 2015-09-22  1431  struct msc_win_to_user_struct {
e95c20aadd66e4 Jens Axboe         2024-04-08  1432  	struct iov_iter	*to;
e95c20aadd66e4 Jens Axboe         2024-04-08  1433  	struct kiocb	*iocb;
ba82664c134ef7 Alexander Shishkin 2015-09-22 @1434  };
ba82664c134ef7 Alexander Shishkin 2015-09-22  1435  

:::::: The code at line 1434 was first introduced by commit
:::::: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
