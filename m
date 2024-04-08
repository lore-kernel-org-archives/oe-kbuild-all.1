Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99037482
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 20:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712608327; cv=none; b=bk50dwFDRv76QY48Ugqca6JuvRXoZGKPQSqGS1cxewLjA2UieoA3HKQIuuiEqfw7Q4c0NEIEaJVNsWtESNUwcXMLBosbJLHd9F1VgpW7SSTyIxRHyLQg6i98QFMJg2HR44dntu8jkX3YhK1YuTdM+ecKUu2+CrQXxmZC7JN5H1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712608327; c=relaxed/simple;
	bh=UoKgT1p8UQX0H0Mc1pg5UY7wmnV4mHtUIlA38Z1lIcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Twxbfs4VXCZT2L4bAS7O8A/5GTdOaoFRriXVqpPhGqPwiGNfIjZ452k8nnXYq2AqKquzhrNr3eT4bullyamjkdv+yybTU4TW8PJZpgqF1Jqpe1kveBjIhzqXZUCvCTGAMFr65wlzWXP1AkqtwAGnwFfwPO8+apZRDw+NHrFB+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp2NVzPB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp2NVzPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712608325; x=1744144325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UoKgT1p8UQX0H0Mc1pg5UY7wmnV4mHtUIlA38Z1lIcQ=;
  b=Sp2NVzPBsbDvU7iiGSKqIZyRAWAPrxhTh14TcUTXif3+Dg06Aa7Iu5Wf
   faPfrfYWcFXhAsqLMyF4V9128h2YcgWPtr24yzGcsSVIF88L6s3g0NkLb
   EW6OOawo4Pa79jPRNtVxdSxRmaY8+mCUy92X/5sT36TMm7eEg+F6gGyqx
   e2+4jdiJsEFcfrlEki6eQQe7curIXVNNL92uZrgd7xSFfupG8XH1CQSvS
   8hm84B/i4JdcoGvXBgDEIiPJ0QUVLdJun1B5YwCZIcUljMGdZSsPRBHzI
   pOucwtqwLqE7bnmK/0KR4RNLY7Esr7k+dSWrDNyzHU+tIkW77KsVMPZPV
   A==;
X-CSE-ConnectionGUID: H/nib02oSQ2KDipwjqS2JA==
X-CSE-MsgGUID: +ZtHj80xQEW39B7FQLWqyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7774230"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7774230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 13:32:04 -0700
X-CSE-ConnectionGUID: UPd5fCcFQG6cfxjvkth87Q==
X-CSE-MsgGUID: M1zMGNgMSZWhd+nC2Hrwdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20559071"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Apr 2024 13:32:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtveq-0005TK-1l;
	Mon, 08 Apr 2024 20:32:00 +0000
Date: Tue, 9 Apr 2024 04:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 17/144] fs/ecryptfs/miscdev.c:355: warning:
 Function parameter or struct member 'iocb' not described in
 'ecryptfs_miscdev_write'
Message-ID: <202404090405.h9P7f5kf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b32f790cdb298ce85171870c8bf5557dc35a51a5
commit: 955f0bac24d7ca64c900aa4381002b1b67895534 [17/144] fs: convert remaining users of ->read and ->write to iterator variants
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240409/202404090405.h9P7f5kf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090405.h9P7f5kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090405.h9P7f5kf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ecryptfs/miscdev.c:355: warning: Function parameter or struct member 'iocb' not described in 'ecryptfs_miscdev_write'
>> fs/ecryptfs/miscdev.c:355: warning: Function parameter or struct member 'from' not described in 'ecryptfs_miscdev_write'
>> fs/ecryptfs/miscdev.c:355: warning: Excess function parameter 'file' description in 'ecryptfs_miscdev_write'
>> fs/ecryptfs/miscdev.c:355: warning: Excess function parameter 'buf' description in 'ecryptfs_miscdev_write'
>> fs/ecryptfs/miscdev.c:355: warning: Excess function parameter 'count' description in 'ecryptfs_miscdev_write'
>> fs/ecryptfs/miscdev.c:355: warning: Excess function parameter 'ppos' description in 'ecryptfs_miscdev_write'


vim +355 fs/ecryptfs/miscdev.c

8bf2debd5f7bf1 Michael Halcrow 2008-04-29  343  
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  344  /**
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  345   * ecryptfs_miscdev_write - handle write to daemon miscdev handle
2ecaf55db6dcf4 Tyler Hicks     2012-06-11  346   * @file: File for misc dev handle
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  347   * @buf: Buffer containing user data
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  348   * @count: Amount of data in @buf
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  349   * @ppos: Pointer to offset in file (ignored)
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  350   *
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  351   * Returns the number of bytes read from @buf
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  352   */
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  353  static ssize_t
955f0bac24d7ca Jens Axboe      2024-04-03  354  ecryptfs_miscdev_write(struct kiocb *iocb, struct iov_iter *from)
8bf2debd5f7bf1 Michael Halcrow 2008-04-29 @355  {
79bc12a0a09c2e Al Viro         2008-05-21  356  	__be32 counter_nbo;
79bc12a0a09c2e Al Viro         2008-05-21  357  	u32 seq;
48399c0b0e6172 Tyler Hicks     2012-01-14  358  	size_t packet_size, packet_size_length;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  359  	char *data;
48399c0b0e6172 Tyler Hicks     2012-01-14  360  	unsigned char packet_size_peek[ECRYPTFS_MAX_PKT_LEN_SIZE];
955f0bac24d7ca Jens Axboe      2024-04-03  361  	size_t count = iov_iter_count(from);
7f133504249afa Tyler Hicks     2012-01-14  362  	ssize_t rc;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  363  
db10e556518eb9 Tyler Hicks     2012-01-12  364  	if (count == 0) {
7f133504249afa Tyler Hicks     2012-01-14  365  		return 0;
48399c0b0e6172 Tyler Hicks     2012-01-14  366  	} else if (count == MIN_NON_MSG_PKT_SIZE) {
db10e556518eb9 Tyler Hicks     2012-01-12  367  		/* Likely a harmless MSG_HELO or MSG_QUIT - no packet length */
db10e556518eb9 Tyler Hicks     2012-01-12  368  		goto memdup;
48399c0b0e6172 Tyler Hicks     2012-01-14  369  	} else if (count < MIN_MSG_PKT_SIZE || count > MAX_MSG_PKT_SIZE) {
db10e556518eb9 Tyler Hicks     2012-01-12  370  		printk(KERN_WARNING "%s: Acceptable packet size range is "
0996b67df6c135 Colin Ian King  2016-09-27  371  		       "[%d-%zu], but amount of data written is [%zu].\n",
48399c0b0e6172 Tyler Hicks     2012-01-14  372  		       __func__, MIN_MSG_PKT_SIZE, MAX_MSG_PKT_SIZE, count);
db10e556518eb9 Tyler Hicks     2012-01-12  373  		return -EINVAL;
db10e556518eb9 Tyler Hicks     2012-01-12  374  	}
db10e556518eb9 Tyler Hicks     2012-01-12  375  
955f0bac24d7ca Jens Axboe      2024-04-03  376  	if (!copy_from_iter_full(packet_size_peek, sizeof(packet_size_peek),
955f0bac24d7ca Jens Axboe      2024-04-03  377  				 from)) {
db10e556518eb9 Tyler Hicks     2012-01-12  378  		printk(KERN_WARNING "%s: Error while inspecting packet size\n",
db10e556518eb9 Tyler Hicks     2012-01-12  379  		       __func__);
db10e556518eb9 Tyler Hicks     2012-01-12  380  		return -EFAULT;
db10e556518eb9 Tyler Hicks     2012-01-12  381  	}
db10e556518eb9 Tyler Hicks     2012-01-12  382  
db10e556518eb9 Tyler Hicks     2012-01-12  383  	rc = ecryptfs_parse_packet_length(packet_size_peek, &packet_size,
db10e556518eb9 Tyler Hicks     2012-01-12  384  					  &packet_size_length);
db10e556518eb9 Tyler Hicks     2012-01-12  385  	if (rc) {
db10e556518eb9 Tyler Hicks     2012-01-12  386  		printk(KERN_WARNING "%s: Error parsing packet length; "
7f133504249afa Tyler Hicks     2012-01-14  387  		       "rc = [%zd]\n", __func__, rc);
db10e556518eb9 Tyler Hicks     2012-01-12  388  		return rc;
db10e556518eb9 Tyler Hicks     2012-01-12  389  	}
db10e556518eb9 Tyler Hicks     2012-01-12  390  
48399c0b0e6172 Tyler Hicks     2012-01-14  391  	if ((PKT_TYPE_SIZE + PKT_CTR_SIZE + packet_size_length + packet_size)
48399c0b0e6172 Tyler Hicks     2012-01-14  392  	    != count) {
db10e556518eb9 Tyler Hicks     2012-01-12  393  		printk(KERN_WARNING "%s: Invalid packet size [%zu]\n", __func__,
db10e556518eb9 Tyler Hicks     2012-01-12  394  		       packet_size);
db10e556518eb9 Tyler Hicks     2012-01-12  395  		return -EINVAL;
db10e556518eb9 Tyler Hicks     2012-01-12  396  	}
fd56d242b3b80b Li Zefan        2009-04-08  397  
db10e556518eb9 Tyler Hicks     2012-01-12  398  memdup:
955f0bac24d7ca Jens Axboe      2024-04-03  399  	data = iterdup(from, count);
fd56d242b3b80b Li Zefan        2009-04-08  400  	if (IS_ERR(data)) {
fd56d242b3b80b Li Zefan        2009-04-08  401  		printk(KERN_ERR "%s: memdup_user returned error [%ld]\n",
fd56d242b3b80b Li Zefan        2009-04-08  402  		       __func__, PTR_ERR(data));
7f133504249afa Tyler Hicks     2012-01-14  403  		return PTR_ERR(data);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  404  	}
48399c0b0e6172 Tyler Hicks     2012-01-14  405  	switch (data[PKT_TYPE_OFFSET]) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  406  	case ECRYPTFS_MSG_RESPONSE:
48399c0b0e6172 Tyler Hicks     2012-01-14  407  		if (count < (MIN_MSG_PKT_SIZE
48399c0b0e6172 Tyler Hicks     2012-01-14  408  			     + sizeof(struct ecryptfs_message))) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  409  			printk(KERN_WARNING "%s: Minimum acceptable packet "
df261c52abdef1 Michael Halcrow 2009-01-06  410  			       "size is [%zd], but amount of data written is "
df261c52abdef1 Michael Halcrow 2009-01-06  411  			       "only [%zd]. Discarding response packet.\n",
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  412  			       __func__,
48399c0b0e6172 Tyler Hicks     2012-01-14  413  			       (MIN_MSG_PKT_SIZE
48399c0b0e6172 Tyler Hicks     2012-01-14  414  				+ sizeof(struct ecryptfs_message)), count);
7f133504249afa Tyler Hicks     2012-01-14  415  			rc = -EINVAL;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  416  			goto out_free;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  417  		}
48399c0b0e6172 Tyler Hicks     2012-01-14  418  		memcpy(&counter_nbo, &data[PKT_CTR_OFFSET], PKT_CTR_SIZE);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  419  		seq = be32_to_cpu(counter_nbo);
955f0bac24d7ca Jens Axboe      2024-04-03  420  		rc = ecryptfs_miscdev_response(iocb->ki_filp->private_data,
48399c0b0e6172 Tyler Hicks     2012-01-14  421  				&data[PKT_LEN_OFFSET + packet_size_length],
2ecaf55db6dcf4 Tyler Hicks     2012-06-11  422  				packet_size, seq);
7f133504249afa Tyler Hicks     2012-01-14  423  		if (rc) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  424  			printk(KERN_WARNING "%s: Failed to deliver miscdev "
7f133504249afa Tyler Hicks     2012-01-14  425  			       "response to requesting operation; rc = [%zd]\n",
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  426  			       __func__, rc);
7f133504249afa Tyler Hicks     2012-01-14  427  			goto out_free;
7f133504249afa Tyler Hicks     2012-01-14  428  		}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  429  		break;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  430  	case ECRYPTFS_MSG_HELO:
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  431  	case ECRYPTFS_MSG_QUIT:
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  432  		break;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  433  	default:
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  434  		ecryptfs_printk(KERN_WARNING, "Dropping miscdev "
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  435  				"message of unrecognized type [%d]\n",
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  436  				data[0]);
7f133504249afa Tyler Hicks     2012-01-14  437  		rc = -EINVAL;
7f133504249afa Tyler Hicks     2012-01-14  438  		goto out_free;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  439  	}
7f133504249afa Tyler Hicks     2012-01-14  440  	rc = count;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  441  out_free:
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  442  	kfree(data);
7f133504249afa Tyler Hicks     2012-01-14  443  	return rc;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  444  }
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  445  

:::::: The code at line 355 was first introduced by commit
:::::: 8bf2debd5f7bf12d122124e34fec14af5b1e8ecf eCryptfs: introduce device handle for userspace daemon communications

:::::: TO: Michael Halcrow <mhalcrow@us.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
