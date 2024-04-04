Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2E684047
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233557; cv=none; b=eo7UMkOieHEhleTViNRg6ii9urLm5ZE4DoA0mvAscRatTS4NRAIWIfPUKxXsAXipUb7Tlk/3eq7lO4NbdcwSY9+Rw4orbpo5cjzjCN5Uq+9uztu6FxxpzPXpa4osckqYEGCPVXP87v9Sv0XxW+3kHLW4J/8aYYJxU7WSy6YIgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233557; c=relaxed/simple;
	bh=HdefQjRR3T5pDj15/HtNGREAjU/jGpGzOA3ql95rIl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl6PB8U52FVTWgeOjiVedZhPv8PWKho71XXT9a2amE3ZJi5EHwWjBqAuZuSziVBlqEY2ejpOvxg0JbEyWrp4SXM1c9QAcRYCPXupIWC40XnruXe90itmRZZxVZUx4lwALdVwLiqh1mmLwDRPJ4LMBkLBbGFBmxr9jIQK82vk134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTGYJcY6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTGYJcY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712233554; x=1743769554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdefQjRR3T5pDj15/HtNGREAjU/jGpGzOA3ql95rIl0=;
  b=BTGYJcY6qugu0j8C2Ed2QotoE8bj35XOlNbIf0bxclbJka3yD2eef/QY
   KCmkjLj2thlBKvN8pyrVtjJPBkmZs4qxr5r00Xnk4hxTYQBXRQ1RsQiTT
   36gw4Afcmt6HoYrr2zdZ+Y8QqW8ef6ntQlJgWYF9H5vFaIkPpYSBJHJDf
   M/Mg81rR4ydLVgFTFfW8CNxpbbBa7OUCJI960ohQvfR3fMVUoe2yi4DAe
   jWzYI6art9Beiuftku0GeSPMEFqXubWBmhqTi/luNKnXGnik/QTuBr1cx
   wY2mSv9JcbMNrQKCEu8QFZEjYHf5IvM7i7fWbGgr3nM+CScCzrJIEaIUE
   Q==;
X-CSE-ConnectionGUID: xqyJJRckTF6FBFJIQsDolg==
X-CSE-MsgGUID: lNlnrCmbROGdZK4bZSw+WA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18664149"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18664149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 05:25:50 -0700
X-CSE-ConnectionGUID: 8AkEoDsPT1KqKslFXcsf+A==
X-CSE-MsgGUID: OWBrrYg8RQ+2WJCzdbR33A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="41928522"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Apr 2024 05:25:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsMA5-00012C-2R;
	Thu, 04 Apr 2024 12:25:45 +0000
Date: Thu, 4 Apr 2024 20:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/20] security/smack/smackfs.c:1609: warning:
 Function parameter or struct member 'iocb' not described in 'smk_read_doi'
Message-ID: <202404042049.yxkjauwh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   434bfd4fff7ae30ffe26a2e330ed50ff5bb34ee4
commit: 3094d40caca196d182c0f820b0d52e0fe7a5bf2f [16/20] security: convert to read/write iterators
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240404/202404042049.yxkjauwh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404042049.yxkjauwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404042049.yxkjauwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/smack/smackfs.c:1609: warning: Function parameter or struct member 'iocb' not described in 'smk_read_doi'
>> security/smack/smackfs.c:1609: warning: Function parameter or struct member 'to' not described in 'smk_read_doi'
>> security/smack/smackfs.c:1609: warning: Excess function parameter 'filp' description in 'smk_read_doi'
>> security/smack/smackfs.c:1609: warning: Excess function parameter 'buf' description in 'smk_read_doi'
>> security/smack/smackfs.c:1609: warning: Excess function parameter 'count' description in 'smk_read_doi'
>> security/smack/smackfs.c:1609: warning: Excess function parameter 'ppos' description in 'smk_read_doi'
>> security/smack/smackfs.c:1632: warning: Function parameter or struct member 'iocb' not described in 'smk_write_doi'
>> security/smack/smackfs.c:1632: warning: Function parameter or struct member 'from' not described in 'smk_write_doi'
>> security/smack/smackfs.c:1632: warning: Excess function parameter 'file' description in 'smk_write_doi'
>> security/smack/smackfs.c:1632: warning: Excess function parameter 'buf' description in 'smk_write_doi'
>> security/smack/smackfs.c:1632: warning: Excess function parameter 'count' description in 'smk_write_doi'
>> security/smack/smackfs.c:1632: warning: Excess function parameter 'ppos' description in 'smk_write_doi'
>> security/smack/smackfs.c:1674: warning: Function parameter or struct member 'iocb' not described in 'smk_read_direct'
>> security/smack/smackfs.c:1674: warning: Function parameter or struct member 'to' not described in 'smk_read_direct'
>> security/smack/smackfs.c:1674: warning: Excess function parameter 'filp' description in 'smk_read_direct'
>> security/smack/smackfs.c:1674: warning: Excess function parameter 'buf' description in 'smk_read_direct'
>> security/smack/smackfs.c:1674: warning: Excess function parameter 'count' description in 'smk_read_direct'
>> security/smack/smackfs.c:1674: warning: Excess function parameter 'ppos' description in 'smk_read_direct'
>> security/smack/smackfs.c:1697: warning: Function parameter or struct member 'iocb' not described in 'smk_write_direct'
>> security/smack/smackfs.c:1697: warning: Function parameter or struct member 'from' not described in 'smk_write_direct'
   security/smack/smackfs.c:1697: warning: Excess function parameter 'file' description in 'smk_write_direct'
   security/smack/smackfs.c:1697: warning: Excess function parameter 'buf' description in 'smk_write_direct'
   security/smack/smackfs.c:1697: warning: Excess function parameter 'count' description in 'smk_write_direct'
   security/smack/smackfs.c:1697: warning: Excess function parameter 'ppos' description in 'smk_write_direct'
   security/smack/smackfs.c:1751: warning: Function parameter or struct member 'iocb' not described in 'smk_read_mapped'
   security/smack/smackfs.c:1751: warning: Function parameter or struct member 'to' not described in 'smk_read_mapped'
   security/smack/smackfs.c:1751: warning: Excess function parameter 'filp' description in 'smk_read_mapped'
   security/smack/smackfs.c:1751: warning: Excess function parameter 'buf' description in 'smk_read_mapped'
   security/smack/smackfs.c:1751: warning: Excess function parameter 'count' description in 'smk_read_mapped'
   security/smack/smackfs.c:1751: warning: Excess function parameter 'ppos' description in 'smk_read_mapped'
   security/smack/smackfs.c:1774: warning: Function parameter or struct member 'iocb' not described in 'smk_write_mapped'
   security/smack/smackfs.c:1774: warning: Function parameter or struct member 'from' not described in 'smk_write_mapped'
   security/smack/smackfs.c:1774: warning: Excess function parameter 'file' description in 'smk_write_mapped'
   security/smack/smackfs.c:1774: warning: Excess function parameter 'buf' description in 'smk_write_mapped'
   security/smack/smackfs.c:1774: warning: Excess function parameter 'count' description in 'smk_write_mapped'
   security/smack/smackfs.c:1774: warning: Excess function parameter 'ppos' description in 'smk_write_mapped'
   security/smack/smackfs.c:1828: warning: Function parameter or struct member 'iocb' not described in 'smk_read_ambient'
   security/smack/smackfs.c:1828: warning: Function parameter or struct member 'to' not described in 'smk_read_ambient'
   security/smack/smackfs.c:1828: warning: Excess function parameter 'filp' description in 'smk_read_ambient'
   security/smack/smackfs.c:1828: warning: Excess function parameter 'buf' description in 'smk_read_ambient'
   security/smack/smackfs.c:1828: warning: Excess function parameter 'cn' description in 'smk_read_ambient'
   security/smack/smackfs.c:1828: warning: Excess function parameter 'ppos' description in 'smk_read_ambient'
   security/smack/smackfs.c:2110: warning: Function parameter or struct member 'iocb' not described in 'smk_read_unconfined'
   security/smack/smackfs.c:2110: warning: Function parameter or struct member 'to' not described in 'smk_read_unconfined'
   security/smack/smackfs.c:2110: warning: Excess function parameter 'filp' description in 'smk_read_unconfined'
   security/smack/smackfs.c:2110: warning: Excess function parameter 'buf' description in 'smk_read_unconfined'
   security/smack/smackfs.c:2110: warning: Excess function parameter 'cn' description in 'smk_read_unconfined'
   security/smack/smackfs.c:2110: warning: Excess function parameter 'ppos' description in 'smk_read_unconfined'
   security/smack/smackfs.c:2203: warning: Function parameter or struct member 'iocb' not described in 'smk_read_logging'
   security/smack/smackfs.c:2203: warning: Function parameter or struct member 'to' not described in 'smk_read_logging'
   security/smack/smackfs.c:2203: warning: Excess function parameter 'filp' description in 'smk_read_logging'
   security/smack/smackfs.c:2203: warning: Excess function parameter 'buf' description in 'smk_read_logging'
   security/smack/smackfs.c:2203: warning: Excess function parameter 'count' description in 'smk_read_logging'
   security/smack/smackfs.c:2203: warning: Excess function parameter 'ppos' description in 'smk_read_logging'
   security/smack/smackfs.c:2225: warning: Function parameter or struct member 'iocb' not described in 'smk_write_logging'
   security/smack/smackfs.c:2225: warning: Function parameter or struct member 'from' not described in 'smk_write_logging'
   security/smack/smackfs.c:2225: warning: Excess function parameter 'file' description in 'smk_write_logging'
   security/smack/smackfs.c:2225: warning: Excess function parameter 'buf' description in 'smk_write_logging'
   security/smack/smackfs.c:2225: warning: Excess function parameter 'count' description in 'smk_write_logging'
   security/smack/smackfs.c:2225: warning: Excess function parameter 'ppos' description in 'smk_write_logging'
   security/smack/smackfs.c:2708: warning: Function parameter or struct member 'iocb' not described in 'smk_read_syslog'
   security/smack/smackfs.c:2708: warning: Function parameter or struct member 'to' not described in 'smk_read_syslog'
   security/smack/smackfs.c:2708: warning: Excess function parameter 'filp' description in 'smk_read_syslog'
   security/smack/smackfs.c:2708: warning: Excess function parameter 'buf' description in 'smk_read_syslog'
   security/smack/smackfs.c:2708: warning: Excess function parameter 'cn' description in 'smk_read_syslog'
   security/smack/smackfs.c:2708: warning: Excess function parameter 'ppos' description in 'smk_read_syslog'
   security/smack/smackfs.c:2910: warning: Function parameter or struct member 'iocb' not described in 'smk_read_ptrace'
   security/smack/smackfs.c:2910: warning: Function parameter or struct member 'to' not described in 'smk_read_ptrace'
   security/smack/smackfs.c:2910: warning: Excess function parameter 'filp' description in 'smk_read_ptrace'
   security/smack/smackfs.c:2910: warning: Excess function parameter 'buf' description in 'smk_read_ptrace'
   security/smack/smackfs.c:2910: warning: Excess function parameter 'count' description in 'smk_read_ptrace'
   security/smack/smackfs.c:2910: warning: Excess function parameter 'ppos' description in 'smk_read_ptrace'
   security/smack/smackfs.c:2930: warning: Function parameter or struct member 'iocb' not described in 'smk_write_ptrace'
   security/smack/smackfs.c:2930: warning: Function parameter or struct member 'to' not described in 'smk_write_ptrace'
   security/smack/smackfs.c:2930: warning: Excess function parameter 'file' description in 'smk_write_ptrace'
   security/smack/smackfs.c:2930: warning: Excess function parameter 'buf' description in 'smk_write_ptrace'
   security/smack/smackfs.c:2930: warning: Excess function parameter 'count' description in 'smk_write_ptrace'
   security/smack/smackfs.c:2930: warning: Excess function parameter 'ppos' description in 'smk_write_ptrace'
--
>> security/tomoyo/securityfs_if.c:106: warning: Function parameter or struct member 'iocb' not described in 'tomoyo_read_self'
>> security/tomoyo/securityfs_if.c:106: warning: Function parameter or struct member 'to' not described in 'tomoyo_read_self'
>> security/tomoyo/securityfs_if.c:106: warning: Excess function parameter 'file' description in 'tomoyo_read_self'
>> security/tomoyo/securityfs_if.c:106: warning: Excess function parameter 'buf' description in 'tomoyo_read_self'
>> security/tomoyo/securityfs_if.c:106: warning: Excess function parameter 'count' description in 'tomoyo_read_self'
>> security/tomoyo/securityfs_if.c:106: warning: Excess function parameter 'ppos' description in 'tomoyo_read_self'
--
>> security/integrity/evm/evm_secfs.c:40: warning: Function parameter or struct member 'iocb' not described in 'evm_read_key'
>> security/integrity/evm/evm_secfs.c:40: warning: Function parameter or struct member 'to' not described in 'evm_read_key'
>> security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'filp' description in 'evm_read_key'
>> security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'buf' description in 'evm_read_key'
>> security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'count' description in 'evm_read_key'
>> security/integrity/evm/evm_secfs.c:40: warning: Excess function parameter 'ppos' description in 'evm_read_key'
>> security/integrity/evm/evm_secfs.c:132: warning: Function parameter or struct member 'iocb' not described in 'evm_read_xattrs'
>> security/integrity/evm/evm_secfs.c:132: warning: Function parameter or struct member 'to' not described in 'evm_read_xattrs'
>> security/integrity/evm/evm_secfs.c:132: warning: Excess function parameter 'filp' description in 'evm_read_xattrs'
>> security/integrity/evm/evm_secfs.c:132: warning: Excess function parameter 'buf' description in 'evm_read_xattrs'
>> security/integrity/evm/evm_secfs.c:132: warning: Excess function parameter 'count' description in 'evm_read_xattrs'
>> security/integrity/evm/evm_secfs.c:132: warning: Excess function parameter 'ppos' description in 'evm_read_xattrs'


vim +1609 security/smack/smackfs.c

6d3dc07cbb1e88 Casey Schaufler 2008-12-31  1598  
e114e473771c84 Casey Schaufler 2008-02-04  1599  /**
e114e473771c84 Casey Schaufler 2008-02-04  1600   * smk_read_doi - read() for /smack/doi
e114e473771c84 Casey Schaufler 2008-02-04  1601   * @filp: file pointer, not actually used
e114e473771c84 Casey Schaufler 2008-02-04  1602   * @buf: where to put the result
e114e473771c84 Casey Schaufler 2008-02-04  1603   * @count: maximum to send along
e114e473771c84 Casey Schaufler 2008-02-04  1604   * @ppos: where to start
e114e473771c84 Casey Schaufler 2008-02-04  1605   *
e114e473771c84 Casey Schaufler 2008-02-04  1606   * Returns number of bytes read or error code, as appropriate
e114e473771c84 Casey Schaufler 2008-02-04  1607   */
3094d40caca196 Jens Axboe      2024-04-03  1608  static ssize_t smk_read_doi(struct kiocb *iocb, struct iov_iter *to)
e114e473771c84 Casey Schaufler 2008-02-04 @1609  {
e114e473771c84 Casey Schaufler 2008-02-04  1610  	char temp[80];
e114e473771c84 Casey Schaufler 2008-02-04  1611  	ssize_t rc;
e114e473771c84 Casey Schaufler 2008-02-04  1612  
3094d40caca196 Jens Axboe      2024-04-03  1613  	if (iocb->ki_pos != 0)
e114e473771c84 Casey Schaufler 2008-02-04  1614  		return 0;
e114e473771c84 Casey Schaufler 2008-02-04  1615  
e114e473771c84 Casey Schaufler 2008-02-04  1616  	sprintf(temp, "%d", smk_cipso_doi_value);
3094d40caca196 Jens Axboe      2024-04-03  1617  	rc = simple_copy_to_iter(temp, &iocb->ki_pos, strlen(temp), to);
e114e473771c84 Casey Schaufler 2008-02-04  1618  
e114e473771c84 Casey Schaufler 2008-02-04  1619  	return rc;
e114e473771c84 Casey Schaufler 2008-02-04  1620  }
e114e473771c84 Casey Schaufler 2008-02-04  1621  
e114e473771c84 Casey Schaufler 2008-02-04  1622  /**
e114e473771c84 Casey Schaufler 2008-02-04  1623   * smk_write_doi - write() for /smack/doi
251a2a958b0455 Randy Dunlap    2009-02-18  1624   * @file: file pointer, not actually used
e114e473771c84 Casey Schaufler 2008-02-04  1625   * @buf: where to get the data from
e114e473771c84 Casey Schaufler 2008-02-04  1626   * @count: bytes sent
e114e473771c84 Casey Schaufler 2008-02-04  1627   * @ppos: where to start
e114e473771c84 Casey Schaufler 2008-02-04  1628   *
e114e473771c84 Casey Schaufler 2008-02-04  1629   * Returns number of bytes written or error code, as appropriate
e114e473771c84 Casey Schaufler 2008-02-04  1630   */
3094d40caca196 Jens Axboe      2024-04-03  1631  static ssize_t smk_write_doi(struct kiocb *iocb, struct iov_iter *from)
e114e473771c84 Casey Schaufler 2008-02-04 @1632  {
3094d40caca196 Jens Axboe      2024-04-03  1633  	size_t count = iov_iter_count(from);
e114e473771c84 Casey Schaufler 2008-02-04  1634  	char temp[80];
e114e473771c84 Casey Schaufler 2008-02-04  1635  	int i;
e114e473771c84 Casey Schaufler 2008-02-04  1636  
1880eff77e7a7c Casey Schaufler 2012-06-05  1637  	if (!smack_privileged(CAP_MAC_ADMIN))
e114e473771c84 Casey Schaufler 2008-02-04  1638  		return -EPERM;
e114e473771c84 Casey Schaufler 2008-02-04  1639  
e114e473771c84 Casey Schaufler 2008-02-04  1640  	if (count >= sizeof(temp) || count == 0)
e114e473771c84 Casey Schaufler 2008-02-04  1641  		return -EINVAL;
e114e473771c84 Casey Schaufler 2008-02-04  1642  
3094d40caca196 Jens Axboe      2024-04-03  1643  	if (!copy_from_iter(temp, count, from))
e114e473771c84 Casey Schaufler 2008-02-04  1644  		return -EFAULT;
e114e473771c84 Casey Schaufler 2008-02-04  1645  
e114e473771c84 Casey Schaufler 2008-02-04  1646  	temp[count] = '\0';
e114e473771c84 Casey Schaufler 2008-02-04  1647  
e114e473771c84 Casey Schaufler 2008-02-04  1648  	if (sscanf(temp, "%d", &i) != 1)
e114e473771c84 Casey Schaufler 2008-02-04  1649  		return -EINVAL;
e114e473771c84 Casey Schaufler 2008-02-04  1650  
e114e473771c84 Casey Schaufler 2008-02-04  1651  	smk_cipso_doi_value = i;
e114e473771c84 Casey Schaufler 2008-02-04  1652  
e114e473771c84 Casey Schaufler 2008-02-04  1653  	smk_cipso_doi();
e114e473771c84 Casey Schaufler 2008-02-04  1654  
e114e473771c84 Casey Schaufler 2008-02-04  1655  	return count;
e114e473771c84 Casey Schaufler 2008-02-04  1656  }
e114e473771c84 Casey Schaufler 2008-02-04  1657  
e114e473771c84 Casey Schaufler 2008-02-04  1658  static const struct file_operations smk_doi_ops = {
3094d40caca196 Jens Axboe      2024-04-03  1659  	.read_iter	= smk_read_doi,
3094d40caca196 Jens Axboe      2024-04-03  1660  	.write_iter	= smk_write_doi,
6038f373a3dc1f Arnd Bergmann   2010-08-15  1661  	.llseek		= default_llseek,
e114e473771c84 Casey Schaufler 2008-02-04  1662  };
e114e473771c84 Casey Schaufler 2008-02-04  1663  
e114e473771c84 Casey Schaufler 2008-02-04  1664  /**
e114e473771c84 Casey Schaufler 2008-02-04  1665   * smk_read_direct - read() for /smack/direct
e114e473771c84 Casey Schaufler 2008-02-04  1666   * @filp: file pointer, not actually used
e114e473771c84 Casey Schaufler 2008-02-04  1667   * @buf: where to put the result
e114e473771c84 Casey Schaufler 2008-02-04  1668   * @count: maximum to send along
e114e473771c84 Casey Schaufler 2008-02-04  1669   * @ppos: where to start
e114e473771c84 Casey Schaufler 2008-02-04  1670   *
e114e473771c84 Casey Schaufler 2008-02-04  1671   * Returns number of bytes read or error code, as appropriate
e114e473771c84 Casey Schaufler 2008-02-04  1672   */
3094d40caca196 Jens Axboe      2024-04-03  1673  static ssize_t smk_read_direct(struct kiocb *iocb, struct iov_iter *to)
e114e473771c84 Casey Schaufler 2008-02-04 @1674  {
e114e473771c84 Casey Schaufler 2008-02-04  1675  	char temp[80];
e114e473771c84 Casey Schaufler 2008-02-04  1676  	ssize_t rc;
e114e473771c84 Casey Schaufler 2008-02-04  1677  
3094d40caca196 Jens Axboe      2024-04-03  1678  	if (iocb->ki_pos != 0)
e114e473771c84 Casey Schaufler 2008-02-04  1679  		return 0;
e114e473771c84 Casey Schaufler 2008-02-04  1680  
e114e473771c84 Casey Schaufler 2008-02-04  1681  	sprintf(temp, "%d", smack_cipso_direct);
3094d40caca196 Jens Axboe      2024-04-03  1682  	rc = simple_copy_to_iter(temp, &iocb->ki_pos, strlen(temp), to);
e114e473771c84 Casey Schaufler 2008-02-04  1683  
e114e473771c84 Casey Schaufler 2008-02-04  1684  	return rc;
e114e473771c84 Casey Schaufler 2008-02-04  1685  }
e114e473771c84 Casey Schaufler 2008-02-04  1686  
e114e473771c84 Casey Schaufler 2008-02-04  1687  /**
e114e473771c84 Casey Schaufler 2008-02-04  1688   * smk_write_direct - write() for /smack/direct
251a2a958b0455 Randy Dunlap    2009-02-18  1689   * @file: file pointer, not actually used
e114e473771c84 Casey Schaufler 2008-02-04  1690   * @buf: where to get the data from
e114e473771c84 Casey Schaufler 2008-02-04  1691   * @count: bytes sent
e114e473771c84 Casey Schaufler 2008-02-04  1692   * @ppos: where to start
e114e473771c84 Casey Schaufler 2008-02-04  1693   *
e114e473771c84 Casey Schaufler 2008-02-04  1694   * Returns number of bytes written or error code, as appropriate
e114e473771c84 Casey Schaufler 2008-02-04  1695   */
3094d40caca196 Jens Axboe      2024-04-03  1696  static ssize_t smk_write_direct(struct kiocb *iocb, struct iov_iter *from)
e114e473771c84 Casey Schaufler 2008-02-04 @1697  {
3094d40caca196 Jens Axboe      2024-04-03  1698  	size_t count = iov_iter_count(from);
f7112e6c9abf1c Casey Schaufler 2012-05-06  1699  	struct smack_known *skp;
e114e473771c84 Casey Schaufler 2008-02-04  1700  	char temp[80];
e114e473771c84 Casey Schaufler 2008-02-04  1701  	int i;
e114e473771c84 Casey Schaufler 2008-02-04  1702  
1880eff77e7a7c Casey Schaufler 2012-06-05  1703  	if (!smack_privileged(CAP_MAC_ADMIN))
e114e473771c84 Casey Schaufler 2008-02-04  1704  		return -EPERM;
e114e473771c84 Casey Schaufler 2008-02-04  1705  
e114e473771c84 Casey Schaufler 2008-02-04  1706  	if (count >= sizeof(temp) || count == 0)
e114e473771c84 Casey Schaufler 2008-02-04  1707  		return -EINVAL;
e114e473771c84 Casey Schaufler 2008-02-04  1708  
3094d40caca196 Jens Axboe      2024-04-03  1709  	if (!copy_from_iter(temp, count, from))
e114e473771c84 Casey Schaufler 2008-02-04  1710  		return -EFAULT;
e114e473771c84 Casey Schaufler 2008-02-04  1711  
e114e473771c84 Casey Schaufler 2008-02-04  1712  	temp[count] = '\0';
e114e473771c84 Casey Schaufler 2008-02-04  1713  
e114e473771c84 Casey Schaufler 2008-02-04  1714  	if (sscanf(temp, "%d", &i) != 1)
e114e473771c84 Casey Schaufler 2008-02-04  1715  		return -EINVAL;
e114e473771c84 Casey Schaufler 2008-02-04  1716  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1717  	/*
f7112e6c9abf1c Casey Schaufler 2012-05-06  1718  	 * Don't do anything if the value hasn't actually changed.
f7112e6c9abf1c Casey Schaufler 2012-05-06  1719  	 * If it is changing reset the level on entries that were
f7112e6c9abf1c Casey Schaufler 2012-05-06  1720  	 * set up to be direct when they were created.
f7112e6c9abf1c Casey Schaufler 2012-05-06  1721  	 */
f7112e6c9abf1c Casey Schaufler 2012-05-06  1722  	if (smack_cipso_direct != i) {
f7112e6c9abf1c Casey Schaufler 2012-05-06  1723  		mutex_lock(&smack_known_lock);
f7112e6c9abf1c Casey Schaufler 2012-05-06  1724  		list_for_each_entry_rcu(skp, &smack_known_list, list)
f7112e6c9abf1c Casey Schaufler 2012-05-06  1725  			if (skp->smk_netlabel.attr.mls.lvl ==
f7112e6c9abf1c Casey Schaufler 2012-05-06  1726  			    smack_cipso_direct)
f7112e6c9abf1c Casey Schaufler 2012-05-06  1727  				skp->smk_netlabel.attr.mls.lvl = i;
e114e473771c84 Casey Schaufler 2008-02-04  1728  		smack_cipso_direct = i;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1729  		mutex_unlock(&smack_known_lock);
f7112e6c9abf1c Casey Schaufler 2012-05-06  1730  	}
e114e473771c84 Casey Schaufler 2008-02-04  1731  
e114e473771c84 Casey Schaufler 2008-02-04  1732  	return count;
e114e473771c84 Casey Schaufler 2008-02-04  1733  }
e114e473771c84 Casey Schaufler 2008-02-04  1734  
e114e473771c84 Casey Schaufler 2008-02-04  1735  static const struct file_operations smk_direct_ops = {
3094d40caca196 Jens Axboe      2024-04-03  1736  	.read_iter	= smk_read_direct,
3094d40caca196 Jens Axboe      2024-04-03  1737  	.write_iter	= smk_write_direct,
6038f373a3dc1f Arnd Bergmann   2010-08-15  1738  	.llseek		= default_llseek,
e114e473771c84 Casey Schaufler 2008-02-04  1739  };
e114e473771c84 Casey Schaufler 2008-02-04  1740  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1741  /**
f7112e6c9abf1c Casey Schaufler 2012-05-06  1742   * smk_read_mapped - read() for /smack/mapped
f7112e6c9abf1c Casey Schaufler 2012-05-06  1743   * @filp: file pointer, not actually used
f7112e6c9abf1c Casey Schaufler 2012-05-06  1744   * @buf: where to put the result
f7112e6c9abf1c Casey Schaufler 2012-05-06  1745   * @count: maximum to send along
f7112e6c9abf1c Casey Schaufler 2012-05-06  1746   * @ppos: where to start
f7112e6c9abf1c Casey Schaufler 2012-05-06  1747   *
f7112e6c9abf1c Casey Schaufler 2012-05-06  1748   * Returns number of bytes read or error code, as appropriate
f7112e6c9abf1c Casey Schaufler 2012-05-06  1749   */
3094d40caca196 Jens Axboe      2024-04-03  1750  static ssize_t smk_read_mapped(struct kiocb *iocb, struct iov_iter *to)
f7112e6c9abf1c Casey Schaufler 2012-05-06 @1751  {
f7112e6c9abf1c Casey Schaufler 2012-05-06  1752  	char temp[80];
f7112e6c9abf1c Casey Schaufler 2012-05-06  1753  	ssize_t rc;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1754  
3094d40caca196 Jens Axboe      2024-04-03  1755  	if (iocb->ki_pos != 0)
f7112e6c9abf1c Casey Schaufler 2012-05-06  1756  		return 0;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1757  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1758  	sprintf(temp, "%d", smack_cipso_mapped);
3094d40caca196 Jens Axboe      2024-04-03  1759  	rc = simple_copy_to_iter(temp, &iocb->ki_pos, strlen(temp), to);
f7112e6c9abf1c Casey Schaufler 2012-05-06  1760  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1761  	return rc;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1762  }
f7112e6c9abf1c Casey Schaufler 2012-05-06  1763  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1764  /**
f7112e6c9abf1c Casey Schaufler 2012-05-06  1765   * smk_write_mapped - write() for /smack/mapped
f7112e6c9abf1c Casey Schaufler 2012-05-06  1766   * @file: file pointer, not actually used
f7112e6c9abf1c Casey Schaufler 2012-05-06  1767   * @buf: where to get the data from
f7112e6c9abf1c Casey Schaufler 2012-05-06  1768   * @count: bytes sent
f7112e6c9abf1c Casey Schaufler 2012-05-06  1769   * @ppos: where to start
f7112e6c9abf1c Casey Schaufler 2012-05-06  1770   *
f7112e6c9abf1c Casey Schaufler 2012-05-06  1771   * Returns number of bytes written or error code, as appropriate
f7112e6c9abf1c Casey Schaufler 2012-05-06  1772   */
3094d40caca196 Jens Axboe      2024-04-03  1773  static ssize_t smk_write_mapped(struct kiocb *iocb, struct iov_iter *from)
f7112e6c9abf1c Casey Schaufler 2012-05-06 @1774  {
3094d40caca196 Jens Axboe      2024-04-03  1775  	size_t count = iov_iter_count(from);
f7112e6c9abf1c Casey Schaufler 2012-05-06  1776  	struct smack_known *skp;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1777  	char temp[80];
f7112e6c9abf1c Casey Schaufler 2012-05-06  1778  	int i;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1779  
1880eff77e7a7c Casey Schaufler 2012-06-05  1780  	if (!smack_privileged(CAP_MAC_ADMIN))
f7112e6c9abf1c Casey Schaufler 2012-05-06  1781  		return -EPERM;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1782  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1783  	if (count >= sizeof(temp) || count == 0)
f7112e6c9abf1c Casey Schaufler 2012-05-06  1784  		return -EINVAL;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1785  
3094d40caca196 Jens Axboe      2024-04-03  1786  	if (!copy_from_iter(temp, count, from))
f7112e6c9abf1c Casey Schaufler 2012-05-06  1787  		return -EFAULT;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1788  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1789  	temp[count] = '\0';
f7112e6c9abf1c Casey Schaufler 2012-05-06  1790  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1791  	if (sscanf(temp, "%d", &i) != 1)
f7112e6c9abf1c Casey Schaufler 2012-05-06  1792  		return -EINVAL;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1793  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1794  	/*
f7112e6c9abf1c Casey Schaufler 2012-05-06  1795  	 * Don't do anything if the value hasn't actually changed.
f7112e6c9abf1c Casey Schaufler 2012-05-06  1796  	 * If it is changing reset the level on entries that were
f7112e6c9abf1c Casey Schaufler 2012-05-06  1797  	 * set up to be mapped when they were created.
f7112e6c9abf1c Casey Schaufler 2012-05-06  1798  	 */
f7112e6c9abf1c Casey Schaufler 2012-05-06  1799  	if (smack_cipso_mapped != i) {
f7112e6c9abf1c Casey Schaufler 2012-05-06  1800  		mutex_lock(&smack_known_lock);
f7112e6c9abf1c Casey Schaufler 2012-05-06  1801  		list_for_each_entry_rcu(skp, &smack_known_list, list)
f7112e6c9abf1c Casey Schaufler 2012-05-06  1802  			if (skp->smk_netlabel.attr.mls.lvl ==
f7112e6c9abf1c Casey Schaufler 2012-05-06  1803  			    smack_cipso_mapped)
f7112e6c9abf1c Casey Schaufler 2012-05-06  1804  				skp->smk_netlabel.attr.mls.lvl = i;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1805  		smack_cipso_mapped = i;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1806  		mutex_unlock(&smack_known_lock);
f7112e6c9abf1c Casey Schaufler 2012-05-06  1807  	}
f7112e6c9abf1c Casey Schaufler 2012-05-06  1808  
f7112e6c9abf1c Casey Schaufler 2012-05-06  1809  	return count;
f7112e6c9abf1c Casey Schaufler 2012-05-06  1810  }
f7112e6c9abf1c Casey Schaufler 2012-05-06  1811  

:::::: The code at line 1609 was first introduced by commit
:::::: e114e473771c848c3cfec05f0123e70f1cdbdc99 Smack: Simplified Mandatory Access Control Kernel

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
