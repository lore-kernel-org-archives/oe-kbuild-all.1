Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D695695
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712277441; cv=none; b=FduUMm4fx+nLVXmj+P+pdY2rrsvHOgYqz7Ru4AR0XQhQfB2+WiyBBsyMoe8vAvcx4HLhoDESjJPyTM/Rz6+/D/6gVLWj3bE++JDHfKIyxKz62ncCdjeehwxmoU5/HFcw4NMOOHD6PWvJ88ssmTAkuDRjEYco45KRTcMUEWWg6Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712277441; c=relaxed/simple;
	bh=ZqmrN1o1nt+8gcMeOY9wkEDrmZEqOdq5QhlQuygRfV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4gKSJ0jwRrUfCx566vnvS8CwX7i9fvrrYTJgLGsOGO/c06tFeKZIVH7SBqAgcY53d6UafryZ+h8ZmAcvG6ISrwk94Uz1vny4LOxyEySx3wFQwmXGLuqvOP/5ijYGoXRxdI/Px4QPWgOPIC+xli8HzPJ4iCcNHLTu1WKyep4CdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsBe+2gJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsBe+2gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712277439; x=1743813439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZqmrN1o1nt+8gcMeOY9wkEDrmZEqOdq5QhlQuygRfV4=;
  b=lsBe+2gJnNMXrAMghUhYAjxWftK7Uu6xAOiy39qrLJV1o4584AL4nnAF
   4nssn6hTIU8H8D2xpfQJmCK68MA9FJhW5N7LvIPsOc6P/cqvvKlwhQtZ2
   TIN1rA9vCjJwA6y8gQQDZHSzBzxE0qBz5Ac9PT0WdbQCktb016UKQLhUs
   7iJKMgDeAng1WLevkqE/92U7J+V79K/YwOl5o5omIBamhyOCG8jHKHVmi
   7J7ypklbjdTg20FjJsvruqPwk6cfSVatix2QP0ByxrzMN6N99WriuwWZ1
   MCW7eHqnXGh/C67NdmcgTjD4MkQvdOyE/1VaZMUH+pNxq0hl8j+RfrxFJ
   A==;
X-CSE-ConnectionGUID: eDYx3rgfRrG0TK3MoVKAHg==
X-CSE-MsgGUID: CrZBEzY3SMGRc+wuai4ckg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7755939"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7755939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 17:37:18 -0700
X-CSE-ConnectionGUID: SmrRtuJJQ9apGxIPjf/stg==
X-CSE-MsgGUID: PYEUh55nQGa46dWLo42gFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18915536"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2024 17:37:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsXZy-0001fy-2N;
	Fri, 05 Apr 2024 00:37:14 +0000
Date: Fri, 5 Apr 2024 08:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/29] drivers/char/tpm/tpm_vtpm_proxy.c:73:
 warning: Function parameter or struct member 'iocb' not described in
 'vtpm_proxy_fops_read'
Message-ID: <202404050814.YtF51MB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   34a49de340a534b0cb222309e73d1ef215ff4db6
commit: a60eb2a07b5eb5064a5636204550c1df87d20751 [8/29] char: convert drivers to use ->read_iter() and ->write_iter()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240405/202404050814.YtF51MB7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050814.YtF51MB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050814.YtF51MB7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm_vtpm_proxy.c:73: warning: Function parameter or struct member 'iocb' not described in 'vtpm_proxy_fops_read'
>> drivers/char/tpm/tpm_vtpm_proxy.c:73: warning: Function parameter or struct member 'to' not described in 'vtpm_proxy_fops_read'
>> drivers/char/tpm/tpm_vtpm_proxy.c:73: warning: Excess function parameter 'filp' description in 'vtpm_proxy_fops_read'
>> drivers/char/tpm/tpm_vtpm_proxy.c:73: warning: Excess function parameter 'buf' description in 'vtpm_proxy_fops_read'
>> drivers/char/tpm/tpm_vtpm_proxy.c:73: warning: Excess function parameter 'count' description in 'vtpm_proxy_fops_read'
>> drivers/char/tpm/tpm_vtpm_proxy.c:73: warning: Excess function parameter 'off' description in 'vtpm_proxy_fops_read'
>> drivers/char/tpm/tpm_vtpm_proxy.c:128: warning: Function parameter or struct member 'iocb' not described in 'vtpm_proxy_fops_write'
>> drivers/char/tpm/tpm_vtpm_proxy.c:128: warning: Function parameter or struct member 'from' not described in 'vtpm_proxy_fops_write'
>> drivers/char/tpm/tpm_vtpm_proxy.c:128: warning: Excess function parameter 'filp' description in 'vtpm_proxy_fops_write'
>> drivers/char/tpm/tpm_vtpm_proxy.c:128: warning: Excess function parameter 'buf' description in 'vtpm_proxy_fops_write'
>> drivers/char/tpm/tpm_vtpm_proxy.c:128: warning: Excess function parameter 'count' description in 'vtpm_proxy_fops_write'
>> drivers/char/tpm/tpm_vtpm_proxy.c:128: warning: Excess function parameter 'off' description in 'vtpm_proxy_fops_write'


vim +73 drivers/char/tpm/tpm_vtpm_proxy.c

6f99612e250041 Stefan Berger  2016-04-18   56  
6f99612e250041 Stefan Berger  2016-04-18   57  /*
6f99612e250041 Stefan Berger  2016-04-18   58   * Functions related to 'server side'
6f99612e250041 Stefan Berger  2016-04-18   59   */
6f99612e250041 Stefan Berger  2016-04-18   60  
6f99612e250041 Stefan Berger  2016-04-18   61  /**
6f99612e250041 Stefan Berger  2016-04-18   62   * vtpm_proxy_fops_read - Read TPM commands on 'server side'
6f99612e250041 Stefan Berger  2016-04-18   63   *
93c12f293f8798 Winkler, Tomas 2016-11-23   64   * @filp: file pointer
93c12f293f8798 Winkler, Tomas 2016-11-23   65   * @buf: read buffer
93c12f293f8798 Winkler, Tomas 2016-11-23   66   * @count: number of bytes to read
93c12f293f8798 Winkler, Tomas 2016-11-23   67   * @off: offset
93c12f293f8798 Winkler, Tomas 2016-11-23   68   *
93c12f293f8798 Winkler, Tomas 2016-11-23   69   * Return:
6f99612e250041 Stefan Berger  2016-04-18   70   *	Number of bytes read or negative error code
6f99612e250041 Stefan Berger  2016-04-18   71   */
a60eb2a07b5eb5 Jens Axboe     2024-04-03   72  static ssize_t vtpm_proxy_fops_read(struct kiocb *iocb, struct iov_iter *to)
6f99612e250041 Stefan Berger  2016-04-18  @73  {
a60eb2a07b5eb5 Jens Axboe     2024-04-03   74  	struct proxy_dev *proxy_dev = iocb->ki_filp->private_data;
a60eb2a07b5eb5 Jens Axboe     2024-04-03   75  	size_t count = iov_iter_count(to);
6f99612e250041 Stefan Berger  2016-04-18   76  	size_t len;
6f99612e250041 Stefan Berger  2016-04-18   77  	int sig, rc;
6f99612e250041 Stefan Berger  2016-04-18   78  
6f99612e250041 Stefan Berger  2016-04-18   79  	sig = wait_event_interruptible(proxy_dev->wq,
6f99612e250041 Stefan Berger  2016-04-18   80  		proxy_dev->req_len != 0 ||
6f99612e250041 Stefan Berger  2016-04-18   81  		!(proxy_dev->state & STATE_OPENED_FLAG));
6f99612e250041 Stefan Berger  2016-04-18   82  	if (sig)
6f99612e250041 Stefan Berger  2016-04-18   83  		return -EINTR;
6f99612e250041 Stefan Berger  2016-04-18   84  
6f99612e250041 Stefan Berger  2016-04-18   85  	mutex_lock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18   86  
6f99612e250041 Stefan Berger  2016-04-18   87  	if (!(proxy_dev->state & STATE_OPENED_FLAG)) {
6f99612e250041 Stefan Berger  2016-04-18   88  		mutex_unlock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18   89  		return -EPIPE;
6f99612e250041 Stefan Berger  2016-04-18   90  	}
6f99612e250041 Stefan Berger  2016-04-18   91  
6f99612e250041 Stefan Berger  2016-04-18   92  	len = proxy_dev->req_len;
6f99612e250041 Stefan Berger  2016-04-18   93  
e52432e1642309 Kees Cook      2022-01-19   94  	if (count < len || len > sizeof(proxy_dev->buffer)) {
6f99612e250041 Stefan Berger  2016-04-18   95  		mutex_unlock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18   96  		pr_debug("Invalid size in recv: count=%zd, req_len=%zd\n",
6f99612e250041 Stefan Berger  2016-04-18   97  			 count, len);
6f99612e250041 Stefan Berger  2016-04-18   98  		return -EIO;
6f99612e250041 Stefan Berger  2016-04-18   99  	}
6f99612e250041 Stefan Berger  2016-04-18  100  
a60eb2a07b5eb5 Jens Axboe     2024-04-03  101  	rc = copy_to_iter_full(proxy_dev->buffer, len, to);
6f99612e250041 Stefan Berger  2016-04-18  102  	memset(proxy_dev->buffer, 0, len);
6f99612e250041 Stefan Berger  2016-04-18  103  	proxy_dev->req_len = 0;
6f99612e250041 Stefan Berger  2016-04-18  104  
a60eb2a07b5eb5 Jens Axboe     2024-04-03  105  	if (rc)
6f99612e250041 Stefan Berger  2016-04-18  106  		proxy_dev->state |= STATE_WAIT_RESPONSE_FLAG;
6f99612e250041 Stefan Berger  2016-04-18  107  
6f99612e250041 Stefan Berger  2016-04-18  108  	mutex_unlock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18  109  
a60eb2a07b5eb5 Jens Axboe     2024-04-03  110  	if (!rc)
6f99612e250041 Stefan Berger  2016-04-18  111  		return -EFAULT;
6f99612e250041 Stefan Berger  2016-04-18  112  
6f99612e250041 Stefan Berger  2016-04-18  113  	return len;
6f99612e250041 Stefan Berger  2016-04-18  114  }
6f99612e250041 Stefan Berger  2016-04-18  115  
6f99612e250041 Stefan Berger  2016-04-18  116  /**
6f99612e250041 Stefan Berger  2016-04-18  117   * vtpm_proxy_fops_write - Write TPM responses on 'server side'
6f99612e250041 Stefan Berger  2016-04-18  118   *
93c12f293f8798 Winkler, Tomas 2016-11-23  119   * @filp: file pointer
93c12f293f8798 Winkler, Tomas 2016-11-23  120   * @buf: write buffer
93c12f293f8798 Winkler, Tomas 2016-11-23  121   * @count: number of bytes to write
93c12f293f8798 Winkler, Tomas 2016-11-23  122   * @off: offset
93c12f293f8798 Winkler, Tomas 2016-11-23  123   *
93c12f293f8798 Winkler, Tomas 2016-11-23  124   * Return:
6f99612e250041 Stefan Berger  2016-04-18  125   *	Number of bytes read or negative error value
6f99612e250041 Stefan Berger  2016-04-18  126   */
a60eb2a07b5eb5 Jens Axboe     2024-04-03  127  static ssize_t vtpm_proxy_fops_write(struct kiocb *iocb, struct iov_iter *from)
6f99612e250041 Stefan Berger  2016-04-18 @128  {
a60eb2a07b5eb5 Jens Axboe     2024-04-03  129  	struct proxy_dev *proxy_dev = iocb->ki_filp->private_data;
a60eb2a07b5eb5 Jens Axboe     2024-04-03  130  	size_t count = iov_iter_count(from);
6f99612e250041 Stefan Berger  2016-04-18  131  
6f99612e250041 Stefan Berger  2016-04-18  132  	mutex_lock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18  133  
6f99612e250041 Stefan Berger  2016-04-18  134  	if (!(proxy_dev->state & STATE_OPENED_FLAG)) {
6f99612e250041 Stefan Berger  2016-04-18  135  		mutex_unlock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18  136  		return -EPIPE;
6f99612e250041 Stefan Berger  2016-04-18  137  	}
6f99612e250041 Stefan Berger  2016-04-18  138  
6f99612e250041 Stefan Berger  2016-04-18  139  	if (count > sizeof(proxy_dev->buffer) ||
6f99612e250041 Stefan Berger  2016-04-18  140  	    !(proxy_dev->state & STATE_WAIT_RESPONSE_FLAG)) {
6f99612e250041 Stefan Berger  2016-04-18  141  		mutex_unlock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18  142  		return -EIO;
6f99612e250041 Stefan Berger  2016-04-18  143  	}
6f99612e250041 Stefan Berger  2016-04-18  144  
6f99612e250041 Stefan Berger  2016-04-18  145  	proxy_dev->state &= ~STATE_WAIT_RESPONSE_FLAG;
6f99612e250041 Stefan Berger  2016-04-18  146  
6f99612e250041 Stefan Berger  2016-04-18  147  	proxy_dev->req_len = 0;
6f99612e250041 Stefan Berger  2016-04-18  148  
a60eb2a07b5eb5 Jens Axboe     2024-04-03  149  	if (!copy_from_iter_full(proxy_dev->buffer, count, from)) {
6f99612e250041 Stefan Berger  2016-04-18  150  		mutex_unlock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18  151  		return -EFAULT;
6f99612e250041 Stefan Berger  2016-04-18  152  	}
6f99612e250041 Stefan Berger  2016-04-18  153  
6f99612e250041 Stefan Berger  2016-04-18  154  	proxy_dev->resp_len = count;
6f99612e250041 Stefan Berger  2016-04-18  155  
6f99612e250041 Stefan Berger  2016-04-18  156  	mutex_unlock(&proxy_dev->buf_lock);
6f99612e250041 Stefan Berger  2016-04-18  157  
6f99612e250041 Stefan Berger  2016-04-18  158  	wake_up_interruptible(&proxy_dev->wq);
6f99612e250041 Stefan Berger  2016-04-18  159  
6f99612e250041 Stefan Berger  2016-04-18  160  	return count;
6f99612e250041 Stefan Berger  2016-04-18  161  }
6f99612e250041 Stefan Berger  2016-04-18  162  

:::::: The code at line 73 was first introduced by commit
:::::: 6f99612e250041a2402d3b1694bccb149cd424a4 tpm: Proxy driver for supporting multiple emulated TPMs

:::::: TO: Stefan Berger <stefanb@linux.vnet.ibm.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
