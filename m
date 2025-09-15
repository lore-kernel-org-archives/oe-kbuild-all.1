Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264C20CCCA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925490; cv=none; b=UOyw1fn1OWd0BUJC8DDlzU12lppDQjwCVWXtvr0cH8lNWHJwtjIpFjLZfs9o8TAsMbcA9hYy/NndWtCQmVzjt0qEd0Rb7fOfFYIc3J6cbOaj6G0shbcWgvS+xhiVOKV1xP3KgvWIlMJsjGSmX2oIFAvNcze2Ud65SErg87gcCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925490; c=relaxed/simple;
	bh=wd0Vp4C6ExLowX04zl/gbuybqk07Bc2K0CPAyQvBmyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ks07ce3f/LCRo9hSOwSJdGJwnXGr/d2IBGVcPYHjZcYYAsoYTL5w5xAKMwrdlpWtPw86dQCDm3P5IMrOfFJoER30W2IowhXpDFbjQWJEpvpmo7nIEiDz9RIzkPFIa6YNxXRuZYNNs6iqYgyYE2ygBOrAMihTbxC/cXTX02WKKPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXvuJmcx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXvuJmcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757925489; x=1789461489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wd0Vp4C6ExLowX04zl/gbuybqk07Bc2K0CPAyQvBmyM=;
  b=LXvuJmcxP0f1PHpz7rt0WtjUBJSQtu/1ocm2tdJEi2B63OVu8ZmadnkC
   t6TfIGLC/CLK126mQxw8sVHLeaMgC06elyhVe2HGJPpontkcNu21OzQa/
   0l3InrqoSGkJjA4jZ9QuiqXsF4HWjqT91GV3EmyOSpOAZ5q+Pt6CBqZjt
   bbbFSL3xshvBqYoAGgqqmt9K9EouJWROwgnD3l2o0fbmrbtWtxIIBs1s0
   8pCe5RGoUc1vd5MG3KrAMD9EJ6C+uXexQn/QVS/OZi5d37qxp9LffnFkE
   bUooq4v/+MSQZE+6p7zSV6nRUeCsBBbR3Vr7BNYqjgobHfk0ac+5qPlC9
   A==;
X-CSE-ConnectionGUID: Ffe8ioqUQ5m5y/t1Uzz0FQ==
X-CSE-MsgGUID: /hnw0DoSTd27TR0iOLWOcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="71596918"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="71596918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 01:38:08 -0700
X-CSE-ConnectionGUID: xcnmK1hqR/uNMpdljLEDmw==
X-CSE-MsgGUID: Fc35NLgKSeyNKO6C6FWRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="198264323"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2025 01:38:07 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uy4iq-00003v-29;
	Mon, 15 Sep 2025 08:38:04 +0000
Date: Mon, 15 Sep 2025 16:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7645/8719] include/linux/io_uring/cmd.h:130:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202509151616.3I4SZP72-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: 088af5db48959dbe4def44ec832b786ec8e1effe [7645/8719] io_uring/uring_cmd: correct signature for io_uring_mshot_cmd_post_cqe()
config: x86_64-buildonly-randconfig-006-20250915 (https://download.01.org/0day-ci/archive/20250915/202509151616.3I4SZP72-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509151616.3I4SZP72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509151616.3I4SZP72-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/ioctl.c:15:
>> include/linux/io_uring/cmd.h:130:1: error: expected identifier or '(' before '{' token
     130 | {
         | ^
   include/linux/io_uring/cmd.h:128:20: warning: 'io_uring_mshot_cmd_post_cqe' declared 'static' but never defined [-Wunused-function]
     128 | static inline bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +130 include/linux/io_uring/cmd.h

6746ee4c3a189f Pavel Begunkov      2024-09-11   75  
620a50c927004f Ming Lei            2025-08-21   76  /*
620a50c927004f Ming Lei            2025-08-21   77   * Select a buffer from the provided buffer group for multishot uring_cmd.
620a50c927004f Ming Lei            2025-08-21   78   * Returns the selected buffer address and size.
620a50c927004f Ming Lei            2025-08-21   79   */
620a50c927004f Ming Lei            2025-08-21   80  struct io_br_sel io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd,
620a50c927004f Ming Lei            2025-08-21   81  					    unsigned buf_group, size_t *len,
620a50c927004f Ming Lei            2025-08-21   82  					    unsigned int issue_flags);
620a50c927004f Ming Lei            2025-08-21   83  
620a50c927004f Ming Lei            2025-08-21   84  /*
620a50c927004f Ming Lei            2025-08-21   85   * Complete a multishot uring_cmd event. This will post a CQE to the completion
620a50c927004f Ming Lei            2025-08-21   86   * queue and update the provided buffer.
620a50c927004f Ming Lei            2025-08-21   87   */
620a50c927004f Ming Lei            2025-08-21   88  bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
620a50c927004f Ming Lei            2025-08-21   89  				 struct io_br_sel *sel, unsigned int issue_flags);
620a50c927004f Ming Lei            2025-08-21   90  
b66509b8497f2b Pavel Begunkov      2023-12-01   91  #else
0c542a69cbcd1f Caleb Sander Mateos 2025-02-28   92  static inline int
0c542a69cbcd1f Caleb Sander Mateos 2025-02-28   93  io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
0c542a69cbcd1f Caleb Sander Mateos 2025-02-28   94  			  struct iov_iter *iter, struct io_uring_cmd *ioucmd,
69d483d5f43e7a Pavel Begunkov      2025-02-24   95  			  unsigned int issue_flags)
b66509b8497f2b Pavel Begunkov      2023-12-01   96  {
b66509b8497f2b Pavel Begunkov      2023-12-01   97  	return -EOPNOTSUPP;
b66509b8497f2b Pavel Begunkov      2023-12-01   98  }
ef490275297267 Pavel Begunkov      2025-03-21   99  static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
ef490275297267 Pavel Begunkov      2025-03-21  100  						const struct iovec __user *uvec,
ef490275297267 Pavel Begunkov      2025-03-21  101  						size_t uvec_segs,
ef490275297267 Pavel Begunkov      2025-03-21  102  						int ddir, struct iov_iter *iter,
ef490275297267 Pavel Begunkov      2025-03-21  103  						unsigned issue_flags)
ef490275297267 Pavel Begunkov      2025-03-21  104  {
ef490275297267 Pavel Begunkov      2025-03-21  105  	return -EOPNOTSUPP;
ef490275297267 Pavel Begunkov      2025-03-21  106  }
dd386b0d5e6155 Caleb Sander Mateos 2025-09-01  107  static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret,
a07d2d7930c75e Bernd Schubert      2024-12-03  108  		u64 ret2, unsigned issue_flags)
b66509b8497f2b Pavel Begunkov      2023-12-01  109  {
b66509b8497f2b Pavel Begunkov      2023-12-01  110  }
6b04a3737057dd Pavel Begunkov      2023-12-01  111  static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
473efbc3ca29f7 Jens Axboe          2025-09-08  112  			    io_uring_cmd_tw_t task_work_cb, unsigned flags)
b66509b8497f2b Pavel Begunkov      2023-12-01  113  {
b66509b8497f2b Pavel Begunkov      2023-12-01  114  }
b66509b8497f2b Pavel Begunkov      2023-12-01  115  static inline void io_uring_cmd_mark_cancelable(struct io_uring_cmd *cmd,
b66509b8497f2b Pavel Begunkov      2023-12-01  116  		unsigned int issue_flags)
b66509b8497f2b Pavel Begunkov      2023-12-01  117  {
b66509b8497f2b Pavel Begunkov      2023-12-01  118  }
6746ee4c3a189f Pavel Begunkov      2024-09-11  119  static inline void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
6746ee4c3a189f Pavel Begunkov      2024-09-11  120  {
6746ee4c3a189f Pavel Begunkov      2024-09-11  121  }
620a50c927004f Ming Lei            2025-08-21  122  static inline struct io_br_sel
620a50c927004f Ming Lei            2025-08-21  123  io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd, unsigned buf_group,
620a50c927004f Ming Lei            2025-08-21  124  			   size_t *len, unsigned int issue_flags)
620a50c927004f Ming Lei            2025-08-21  125  {
620a50c927004f Ming Lei            2025-08-21  126  	return (struct io_br_sel) { .val = -EOPNOTSUPP };
620a50c927004f Ming Lei            2025-08-21  127  }
620a50c927004f Ming Lei            2025-08-21  128  static inline bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
088af5db48959d Jens Axboe          2025-09-10  129  				struct io_br_sel *sel, unsigned int issue_flags);
620a50c927004f Ming Lei            2025-08-21 @130  {
620a50c927004f Ming Lei            2025-08-21  131  	return true;
620a50c927004f Ming Lei            2025-08-21  132  }
b66509b8497f2b Pavel Begunkov      2023-12-01  133  #endif
b66509b8497f2b Pavel Begunkov      2023-12-01  134  

:::::: The code at line 130 was first introduced by commit
:::::: 620a50c927004f5c9420a7ca9b1a55673dbf3941 io_uring: uring_cmd: add multishot support

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
