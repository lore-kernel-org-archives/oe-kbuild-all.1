Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD145CBD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 04:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712810831; cv=none; b=Zk+xpC55HItXkqr6KReG1D+RjDDEhphTOWNfKW/QcaScaiXPPjk9kfOYvdawDSGkovITm2a/HQgNrT2oPobe+Z1YaDsL1Hi77NTmEfWRwDbGZI2qalun/VBhTucggiiSVaO6rINScZSYKT9xNRdSG5dCYzzsXMHAXq8jOVhbheM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712810831; c=relaxed/simple;
	bh=muqVXNMDnuI1sCxETA9R6URMZTFcSIY4wVoZfODIweI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXuuGr8apvskTIQoKORbO7f3TfQnW1Lx/VTU229P++rLhd+XNTQFBIaBbnpmRJnBnl6xjfjx9qEKLaKCXWRyZwF9wNcMVtmAtz6JyahVUXEffhPgSoqsjihYfUAOx9CI2y/Zk1yLIMrhVGBgzlLIcm+5alyfekbvGZX3gLAj/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNZcZA8L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNZcZA8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712810829; x=1744346829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=muqVXNMDnuI1sCxETA9R6URMZTFcSIY4wVoZfODIweI=;
  b=HNZcZA8LfHqrPFYIdEqh427KCbFtOoc4MSzLiOXh0lwE7GeDX07Tm5X4
   MPJoFbWvkxz3SVhgsKllZ4JNsBUca9MIhYBvFMBacEDPGHjTn4sUFaSsG
   Au7buEigigKjGfQXZfSb4RVN8+g13/yPkGpQl1fo1PCAvu/Pqr2r7dLIu
   SwMBt+ZJZdIyzEJGEIeRGVKaH8NFzgIyn1IhDNh9Z2OGenETHhB/O6ZDS
   OnnicV8ad0w7sGRFd0IK/OMyi23/Hht/gMaYFHiYJMCdCEZs9TB9PEUdz
   lhoGBY6+qDMA6VxCDDp6LMUTvKW9gkl8fHjNUT3MRTJ26/0xOn/euEjY/
   A==;
X-CSE-ConnectionGUID: 5T9uZCWAR8OW6KOvnHa5ug==
X-CSE-MsgGUID: 9E4pIlVvR6WzV44gnZ9qhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11164484"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="11164484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:47:08 -0700
X-CSE-ConnectionGUID: M39kVbqwTFCmS6KUNr18LA==
X-CSE-MsgGUID: 5Qe/lwmeQq+jaFD1q3APfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="51976861"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2024 21:47:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rumL2-0008EP-1e;
	Thu, 11 Apr 2024 04:47:04 +0000
Date: Thu, 11 Apr 2024 12:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 94/415] security/integrity/evm/evm_secfs.c:66:
 warning: Function parameter or struct member 'iocb' not described in
 'evm_write_key'
Message-ID: <202404111224.Y5td3JfO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: f1e85e7dbdc0bfbb5ac2b732e6a66064daa1a308 [94/415] integrity: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111224.Y5td3JfO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111224.Y5td3JfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111224.Y5td3JfO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/integrity/evm/evm_secfs.c:40: warning: Function parameter or struct member 'iocb' not described in 'evm_read_key'
   security/integrity/evm/evm_secfs.c:40: warning: Function parameter or struct member 'to' not described in 'evm_read_key'
   security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'filp' description in 'evm_read_key'
   security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'buf' description in 'evm_read_key'
   security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'count' description in 'evm_read_key'
   security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'ppos' description in 'evm_read_key'
>> security/integrity/evm/evm_secfs.c:66: warning: Function parameter or struct member 'iocb' not described in 'evm_write_key'
>> security/integrity/evm/evm_secfs.c:66: warning: Function parameter or struct member 'from' not described in 'evm_write_key'
>> security/integrity/evm/evm_secfs.c:66: warning: Excess function parameter 'file' description in 'evm_write_key'
>> security/integrity/evm/evm_secfs.c:66: warning: Excess function parameter 'buf' description in 'evm_write_key'
>> security/integrity/evm/evm_secfs.c:66: warning: Excess function parameter 'count' description in 'evm_write_key'
>> security/integrity/evm/evm_secfs.c:66: warning: Excess function parameter 'ppos' description in 'evm_write_key'
   security/integrity/evm/evm_secfs.c:127: warning: Function parameter or struct member 'iocb' not described in 'evm_read_xattrs'
   security/integrity/evm/evm_secfs.c:127: warning: Function parameter or struct member 'to' not described in 'evm_read_xattrs'
   security/integrity/evm/evm_secfs.c:127: warning: Excess function parameter 'filp' description in 'evm_read_xattrs'
   security/integrity/evm/evm_secfs.c:127: warning: Excess function parameter 'buf' description in 'evm_read_xattrs'
   security/integrity/evm/evm_secfs.c:127: warning: Excess function parameter 'count' description in 'evm_read_xattrs'
   security/integrity/evm/evm_secfs.c:127: warning: Excess function parameter 'ppos' description in 'evm_read_xattrs'
>> security/integrity/evm/evm_secfs.c:179: warning: Function parameter or struct member 'iocb' not described in 'evm_write_xattrs'
>> security/integrity/evm/evm_secfs.c:179: warning: Function parameter or struct member 'from' not described in 'evm_write_xattrs'
>> security/integrity/evm/evm_secfs.c:179: warning: Excess function parameter 'file' description in 'evm_write_xattrs'
>> security/integrity/evm/evm_secfs.c:179: warning: Excess function parameter 'buf' description in 'evm_write_xattrs'
>> security/integrity/evm/evm_secfs.c:179: warning: Excess function parameter 'count' description in 'evm_write_xattrs'
>> security/integrity/evm/evm_secfs.c:179: warning: Excess function parameter 'ppos' description in 'evm_write_xattrs'


vim +66 security/integrity/evm/evm_secfs.c

66dbc325afcef9 Mimi Zohar         2011-03-15   52  
66dbc325afcef9 Mimi Zohar         2011-03-15   53  /**
66dbc325afcef9 Mimi Zohar         2011-03-15   54   * evm_write_key - write() for <securityfs>/evm
66dbc325afcef9 Mimi Zohar         2011-03-15   55   * @file: file pointer, not actually used
66dbc325afcef9 Mimi Zohar         2011-03-15   56   * @buf: where to get the data from
66dbc325afcef9 Mimi Zohar         2011-03-15   57   * @count: bytes sent
66dbc325afcef9 Mimi Zohar         2011-03-15   58   * @ppos: where to start
66dbc325afcef9 Mimi Zohar         2011-03-15   59   *
66dbc325afcef9 Mimi Zohar         2011-03-15   60   * Used to signal that key is on the kernel key ring.
66dbc325afcef9 Mimi Zohar         2011-03-15   61   * - get the integrity hmac key from the kernel key ring
66dbc325afcef9 Mimi Zohar         2011-03-15   62   * - create list of hmac protected extended attributes
66dbc325afcef9 Mimi Zohar         2011-03-15   63   * Returns number of bytes written or error code, as appropriate
66dbc325afcef9 Mimi Zohar         2011-03-15   64   */
f1e85e7dbdc0bf Jens Axboe         2024-04-10   65  static ssize_t evm_write_key(struct kiocb *iocb, struct iov_iter *from)
66dbc325afcef9 Mimi Zohar         2011-03-15  @66  {
f1e85e7dbdc0bf Jens Axboe         2024-04-10   67  	size_t count = iov_iter_count(from);
49219d9b8785ba Mimi Zohar         2021-04-26   68  	unsigned int i;
49219d9b8785ba Mimi Zohar         2021-04-26   69  	int ret;
66dbc325afcef9 Mimi Zohar         2011-03-15   70  
ae1ba1676b88e6 Matthew Garrett    2017-11-07   71  	if (!capable(CAP_SYS_ADMIN) || (evm_initialized & EVM_SETUP_COMPLETE))
66dbc325afcef9 Mimi Zohar         2011-03-15   72  		return -EPERM;
66dbc325afcef9 Mimi Zohar         2011-03-15   73  
f1e85e7dbdc0bf Jens Axboe         2024-04-10   74  	ret = kstrtouint_from_iter(from, count, 0, &i);
66dbc325afcef9 Mimi Zohar         2011-03-15   75  
f00d7975071251 Matthew Garrett    2017-10-11   76  	if (ret)
f00d7975071251 Matthew Garrett    2017-10-11   77  		return ret;
66dbc325afcef9 Mimi Zohar         2011-03-15   78  
f00d7975071251 Matthew Garrett    2017-10-11   79  	/* Reject invalid values */
f00d7975071251 Matthew Garrett    2017-10-11   80  	if (!i || (i & ~EVM_INIT_MASK) != 0)
66dbc325afcef9 Mimi Zohar         2011-03-15   81  		return -EINVAL;
66dbc325afcef9 Mimi Zohar         2011-03-15   82  
9acc89d31f0c94 Roberto Sassu      2021-05-14   83  	/*
9acc89d31f0c94 Roberto Sassu      2021-05-14   84  	 * Don't allow a request to enable metadata writes if
9acc89d31f0c94 Roberto Sassu      2021-05-14   85  	 * an HMAC key is loaded.
ae1ba1676b88e6 Matthew Garrett    2017-11-07   86  	 */
ae1ba1676b88e6 Matthew Garrett    2017-11-07   87  	if ((i & EVM_ALLOW_METADATA_WRITES) &&
9acc89d31f0c94 Roberto Sassu      2021-05-14   88  	    (evm_initialized & EVM_INIT_HMAC) != 0)
ae1ba1676b88e6 Matthew Garrett    2017-11-07   89  		return -EPERM;
ae1ba1676b88e6 Matthew Garrett    2017-11-07   90  
f00d7975071251 Matthew Garrett    2017-10-11   91  	if (i & EVM_INIT_HMAC) {
f00d7975071251 Matthew Garrett    2017-10-11   92  		ret = evm_init_key();
f00d7975071251 Matthew Garrett    2017-10-11   93  		if (ret != 0)
f00d7975071251 Matthew Garrett    2017-10-11   94  			return ret;
f00d7975071251 Matthew Garrett    2017-10-11   95  		/* Forbid further writes after the symmetric key is loaded */
ae1ba1676b88e6 Matthew Garrett    2017-11-07   96  		i |= EVM_SETUP_COMPLETE;
f00d7975071251 Matthew Garrett    2017-10-11   97  	}
f00d7975071251 Matthew Garrett    2017-10-11   98  
f00d7975071251 Matthew Garrett    2017-10-11   99  	evm_initialized |= i;
7626676320f398 Dmitry Kasatkin    2015-10-22  100  
ae1ba1676b88e6 Matthew Garrett    2017-11-07  101  	/* Don't allow protected metadata modification if a symmetric key
ae1ba1676b88e6 Matthew Garrett    2017-11-07  102  	 * is loaded
ae1ba1676b88e6 Matthew Garrett    2017-11-07  103  	 */
ae1ba1676b88e6 Matthew Garrett    2017-11-07  104  	if (evm_initialized & EVM_INIT_HMAC)
ae1ba1676b88e6 Matthew Garrett    2017-11-07  105  		evm_initialized &= ~(EVM_ALLOW_METADATA_WRITES);
ae1ba1676b88e6 Matthew Garrett    2017-11-07  106  
66dbc325afcef9 Mimi Zohar         2011-03-15  107  	return count;
66dbc325afcef9 Mimi Zohar         2011-03-15  108  }
66dbc325afcef9 Mimi Zohar         2011-03-15  109  
66dbc325afcef9 Mimi Zohar         2011-03-15  110  static const struct file_operations evm_key_ops = {
f1e85e7dbdc0bf Jens Axboe         2024-04-10  111  	.read_iter	= evm_read_key,
f1e85e7dbdc0bf Jens Axboe         2024-04-10  112  	.write_iter	= evm_write_key,
66dbc325afcef9 Mimi Zohar         2011-03-15  113  };
66dbc325afcef9 Mimi Zohar         2011-03-15  114  
fa516b66a1bfce Matthew Garrett    2018-05-15  115  #ifdef CONFIG_EVM_ADD_XATTRS
fa516b66a1bfce Matthew Garrett    2018-05-15  116  /**
fa516b66a1bfce Matthew Garrett    2018-05-15  117   * evm_read_xattrs - read() for <securityfs>/evm_xattrs
fa516b66a1bfce Matthew Garrett    2018-05-15  118   *
fa516b66a1bfce Matthew Garrett    2018-05-15  119   * @filp: file pointer, not actually used
fa516b66a1bfce Matthew Garrett    2018-05-15  120   * @buf: where to put the result
fa516b66a1bfce Matthew Garrett    2018-05-15  121   * @count: maximum to send along
fa516b66a1bfce Matthew Garrett    2018-05-15  122   * @ppos: where to start
fa516b66a1bfce Matthew Garrett    2018-05-15  123   *
fa516b66a1bfce Matthew Garrett    2018-05-15  124   * Returns number of bytes read or error code, as appropriate
fa516b66a1bfce Matthew Garrett    2018-05-15  125   */
f1e85e7dbdc0bf Jens Axboe         2024-04-10  126  static ssize_t evm_read_xattrs(struct kiocb *iocb, struct iov_iter *to)
fa516b66a1bfce Matthew Garrett    2018-05-15  127  {
fa516b66a1bfce Matthew Garrett    2018-05-15  128  	char *temp;
fa516b66a1bfce Matthew Garrett    2018-05-15  129  	int offset = 0;
fa516b66a1bfce Matthew Garrett    2018-05-15  130  	ssize_t rc, size = 0;
fa516b66a1bfce Matthew Garrett    2018-05-15  131  	struct xattr_list *xattr;
fa516b66a1bfce Matthew Garrett    2018-05-15  132  
f1e85e7dbdc0bf Jens Axboe         2024-04-10  133  	if (iocb->ki_pos != 0)
fa516b66a1bfce Matthew Garrett    2018-05-15  134  		return 0;
fa516b66a1bfce Matthew Garrett    2018-05-15  135  
fa516b66a1bfce Matthew Garrett    2018-05-15  136  	rc = mutex_lock_interruptible(&xattr_list_mutex);
fa516b66a1bfce Matthew Garrett    2018-05-15  137  	if (rc)
fa516b66a1bfce Matthew Garrett    2018-05-15  138  		return -ERESTARTSYS;
fa516b66a1bfce Matthew Garrett    2018-05-15  139  
8c7a703ec9787a Roberto Sassu      2021-05-28  140  	list_for_each_entry(xattr, &evm_config_xattrnames, list) {
8c7a703ec9787a Roberto Sassu      2021-05-28  141  		if (!xattr->enabled)
8c7a703ec9787a Roberto Sassu      2021-05-28  142  			continue;
8c7a703ec9787a Roberto Sassu      2021-05-28  143  
fa516b66a1bfce Matthew Garrett    2018-05-15  144  		size += strlen(xattr->name) + 1;
8c7a703ec9787a Roberto Sassu      2021-05-28  145  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  146  
fa516b66a1bfce Matthew Garrett    2018-05-15  147  	temp = kmalloc(size + 1, GFP_KERNEL);
b5c90a7526fe39 Dan Carpenter      2018-06-01  148  	if (!temp) {
b5c90a7526fe39 Dan Carpenter      2018-06-01  149  		mutex_unlock(&xattr_list_mutex);
fa516b66a1bfce Matthew Garrett    2018-05-15  150  		return -ENOMEM;
b5c90a7526fe39 Dan Carpenter      2018-06-01  151  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  152  
fa516b66a1bfce Matthew Garrett    2018-05-15  153  	list_for_each_entry(xattr, &evm_config_xattrnames, list) {
8c7a703ec9787a Roberto Sassu      2021-05-28  154  		if (!xattr->enabled)
8c7a703ec9787a Roberto Sassu      2021-05-28  155  			continue;
8c7a703ec9787a Roberto Sassu      2021-05-28  156  
fa516b66a1bfce Matthew Garrett    2018-05-15  157  		sprintf(temp + offset, "%s\n", xattr->name);
fa516b66a1bfce Matthew Garrett    2018-05-15  158  		offset += strlen(xattr->name) + 1;
fa516b66a1bfce Matthew Garrett    2018-05-15  159  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  160  
fa516b66a1bfce Matthew Garrett    2018-05-15  161  	mutex_unlock(&xattr_list_mutex);
f1e85e7dbdc0bf Jens Axboe         2024-04-10  162  	rc = simple_copy_to_iter(temp, &iocb->ki_pos, strlen(temp), to);
fa516b66a1bfce Matthew Garrett    2018-05-15  163  
825b8650dc3dd0 Colin Ian King     2018-05-27  164  	kfree(temp);
825b8650dc3dd0 Colin Ian King     2018-05-27  165  
fa516b66a1bfce Matthew Garrett    2018-05-15  166  	return rc;
fa516b66a1bfce Matthew Garrett    2018-05-15  167  }
fa516b66a1bfce Matthew Garrett    2018-05-15  168  
fa516b66a1bfce Matthew Garrett    2018-05-15  169  /**
fa516b66a1bfce Matthew Garrett    2018-05-15  170   * evm_write_xattrs - write() for <securityfs>/evm_xattrs
fa516b66a1bfce Matthew Garrett    2018-05-15  171   * @file: file pointer, not actually used
fa516b66a1bfce Matthew Garrett    2018-05-15  172   * @buf: where to get the data from
fa516b66a1bfce Matthew Garrett    2018-05-15  173   * @count: bytes sent
fa516b66a1bfce Matthew Garrett    2018-05-15  174   * @ppos: where to start
fa516b66a1bfce Matthew Garrett    2018-05-15  175   *
fa516b66a1bfce Matthew Garrett    2018-05-15  176   * Returns number of bytes written or error code, as appropriate
fa516b66a1bfce Matthew Garrett    2018-05-15  177   */
f1e85e7dbdc0bf Jens Axboe         2024-04-10  178  static ssize_t evm_write_xattrs(struct kiocb *iocb, struct iov_iter *from)
fa516b66a1bfce Matthew Garrett    2018-05-15 @179  {
fa516b66a1bfce Matthew Garrett    2018-05-15  180  	int len, err;
fa516b66a1bfce Matthew Garrett    2018-05-15  181  	struct xattr_list *xattr, *tmp;
fa516b66a1bfce Matthew Garrett    2018-05-15  182  	struct audit_buffer *ab;
fa516b66a1bfce Matthew Garrett    2018-05-15  183  	struct iattr newattrs;
fa516b66a1bfce Matthew Garrett    2018-05-15  184  	struct inode *inode;
f1e85e7dbdc0bf Jens Axboe         2024-04-10  185  	size_t count = iov_iter_count(from);
fa516b66a1bfce Matthew Garrett    2018-05-15  186  
fa516b66a1bfce Matthew Garrett    2018-05-15  187  	if (!capable(CAP_SYS_ADMIN) || evm_xattrs_locked)
fa516b66a1bfce Matthew Garrett    2018-05-15  188  		return -EPERM;
fa516b66a1bfce Matthew Garrett    2018-05-15  189  
f1e85e7dbdc0bf Jens Axboe         2024-04-10  190  	if (iocb->ki_pos != 0)
fa516b66a1bfce Matthew Garrett    2018-05-15  191  		return -EINVAL;
fa516b66a1bfce Matthew Garrett    2018-05-15  192  
fa516b66a1bfce Matthew Garrett    2018-05-15  193  	if (count > XATTR_NAME_MAX)
fa516b66a1bfce Matthew Garrett    2018-05-15  194  		return -E2BIG;
fa516b66a1bfce Matthew Garrett    2018-05-15  195  
a1aa08a01f734d Richard Guy Briggs 2019-03-26  196  	ab = audit_log_start(audit_context(), GFP_KERNEL,
a1aa08a01f734d Richard Guy Briggs 2019-03-26  197  			     AUDIT_INTEGRITY_EVM_XATTR);
d721c15fd519c0 Roberto Sassu      2021-05-28  198  	if (!ab && IS_ENABLED(CONFIG_AUDIT))
3dd0f18c70d94c Wei Yongjun        2018-07-11  199  		return -ENOMEM;
fa516b66a1bfce Matthew Garrett    2018-05-15  200  
fa516b66a1bfce Matthew Garrett    2018-05-15  201  	xattr = kmalloc(sizeof(struct xattr_list), GFP_KERNEL);
fa516b66a1bfce Matthew Garrett    2018-05-15  202  	if (!xattr) {
fa516b66a1bfce Matthew Garrett    2018-05-15  203  		err = -ENOMEM;
fa516b66a1bfce Matthew Garrett    2018-05-15  204  		goto out;
fa516b66a1bfce Matthew Garrett    2018-05-15  205  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  206  
8c7a703ec9787a Roberto Sassu      2021-05-28  207  	xattr->enabled = true;
f1e85e7dbdc0bf Jens Axboe         2024-04-10  208  	xattr->name = iterdup_nul(from, count);
fa516b66a1bfce Matthew Garrett    2018-05-15  209  	if (IS_ERR(xattr->name)) {
fa516b66a1bfce Matthew Garrett    2018-05-15  210  		err = PTR_ERR(xattr->name);
fa516b66a1bfce Matthew Garrett    2018-05-15  211  		xattr->name = NULL;
fa516b66a1bfce Matthew Garrett    2018-05-15  212  		goto out;
fa516b66a1bfce Matthew Garrett    2018-05-15  213  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  214  
fa516b66a1bfce Matthew Garrett    2018-05-15  215  	/* Remove any trailing newline */
fa516b66a1bfce Matthew Garrett    2018-05-15  216  	len = strlen(xattr->name);
a41d80acfa2764 Dan Carpenter      2018-05-29  217  	if (len && xattr->name[len-1] == '\n')
fa516b66a1bfce Matthew Garrett    2018-05-15  218  		xattr->name[len-1] = '\0';
fa516b66a1bfce Matthew Garrett    2018-05-15  219  
a1aa08a01f734d Richard Guy Briggs 2019-03-26  220  	audit_log_format(ab, "xattr=");
a1aa08a01f734d Richard Guy Briggs 2019-03-26  221  	audit_log_untrustedstring(ab, xattr->name);
a1aa08a01f734d Richard Guy Briggs 2019-03-26  222  
fa516b66a1bfce Matthew Garrett    2018-05-15  223  	if (strcmp(xattr->name, ".") == 0) {
fa516b66a1bfce Matthew Garrett    2018-05-15  224  		evm_xattrs_locked = 1;
fa516b66a1bfce Matthew Garrett    2018-05-15  225  		newattrs.ia_mode = S_IFREG | 0440;
fa516b66a1bfce Matthew Garrett    2018-05-15  226  		newattrs.ia_valid = ATTR_MODE;
fa516b66a1bfce Matthew Garrett    2018-05-15  227  		inode = evm_xattrs->d_inode;
fa516b66a1bfce Matthew Garrett    2018-05-15  228  		inode_lock(inode);
c1632a0f112093 Christian Brauner  2023-01-13  229  		err = simple_setattr(&nop_mnt_idmap, evm_xattrs, &newattrs);
fa516b66a1bfce Matthew Garrett    2018-05-15  230  		inode_unlock(inode);
fa516b66a1bfce Matthew Garrett    2018-05-15  231  		if (!err)
fa516b66a1bfce Matthew Garrett    2018-05-15  232  			err = count;
fa516b66a1bfce Matthew Garrett    2018-05-15  233  		goto out;
fa516b66a1bfce Matthew Garrett    2018-05-15  234  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  235  
fa516b66a1bfce Matthew Garrett    2018-05-15  236  	if (strncmp(xattr->name, XATTR_SECURITY_PREFIX,
fa516b66a1bfce Matthew Garrett    2018-05-15  237  		    XATTR_SECURITY_PREFIX_LEN) != 0) {
fa516b66a1bfce Matthew Garrett    2018-05-15  238  		err = -EINVAL;
fa516b66a1bfce Matthew Garrett    2018-05-15  239  		goto out;
fa516b66a1bfce Matthew Garrett    2018-05-15  240  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  241  
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  242  	/*
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  243  	 * xattr_list_mutex guards against races in evm_read_xattrs().
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  244  	 * Entries are only added to the evm_config_xattrnames list
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  245  	 * and never deleted. Therefore, the list is traversed
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  246  	 * using list_for_each_entry_lockless() without holding
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  247  	 * the mutex in evm_calc_hmac_or_hash(), evm_find_protected_xattrs()
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  248  	 * and evm_protected_xattr().
770f60586d2af0 Madhuparna Bhowmik 2020-04-30  249  	 */
fa516b66a1bfce Matthew Garrett    2018-05-15  250  	mutex_lock(&xattr_list_mutex);
fa516b66a1bfce Matthew Garrett    2018-05-15  251  	list_for_each_entry(tmp, &evm_config_xattrnames, list) {
fa516b66a1bfce Matthew Garrett    2018-05-15  252  		if (strcmp(xattr->name, tmp->name) == 0) {
fa516b66a1bfce Matthew Garrett    2018-05-15  253  			err = -EEXIST;
8c7a703ec9787a Roberto Sassu      2021-05-28  254  			if (!tmp->enabled) {
8c7a703ec9787a Roberto Sassu      2021-05-28  255  				tmp->enabled = true;
8c7a703ec9787a Roberto Sassu      2021-05-28  256  				err = count;
8c7a703ec9787a Roberto Sassu      2021-05-28  257  			}
fa516b66a1bfce Matthew Garrett    2018-05-15  258  			mutex_unlock(&xattr_list_mutex);
fa516b66a1bfce Matthew Garrett    2018-05-15  259  			goto out;
fa516b66a1bfce Matthew Garrett    2018-05-15  260  		}
fa516b66a1bfce Matthew Garrett    2018-05-15  261  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  262  	list_add_tail_rcu(&xattr->list, &evm_config_xattrnames);
fa516b66a1bfce Matthew Garrett    2018-05-15  263  	mutex_unlock(&xattr_list_mutex);
fa516b66a1bfce Matthew Garrett    2018-05-15  264  
fa516b66a1bfce Matthew Garrett    2018-05-15  265  	audit_log_format(ab, " res=0");
fa516b66a1bfce Matthew Garrett    2018-05-15  266  	audit_log_end(ab);
fa516b66a1bfce Matthew Garrett    2018-05-15  267  	return count;
fa516b66a1bfce Matthew Garrett    2018-05-15  268  out:
8c7a703ec9787a Roberto Sassu      2021-05-28  269  	audit_log_format(ab, " res=%d", (err < 0) ? err : 0);
fa516b66a1bfce Matthew Garrett    2018-05-15  270  	audit_log_end(ab);
72acd64df45615 Colin Ian King     2018-05-27  271  	if (xattr) {
fa516b66a1bfce Matthew Garrett    2018-05-15  272  		kfree(xattr->name);
fa516b66a1bfce Matthew Garrett    2018-05-15  273  		kfree(xattr);
72acd64df45615 Colin Ian King     2018-05-27  274  	}
fa516b66a1bfce Matthew Garrett    2018-05-15  275  	return err;
fa516b66a1bfce Matthew Garrett    2018-05-15  276  }
fa516b66a1bfce Matthew Garrett    2018-05-15  277  

:::::: The code at line 66 was first introduced by commit
:::::: 66dbc325afcef909043c30e90930a36823fc734c evm: re-release

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: Mimi Zohar <zohar@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
