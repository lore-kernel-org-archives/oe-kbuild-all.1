Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CACE5695
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 00:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712278101; cv=none; b=cg5ITIUFTHFOHwSmiliLt38XUqh1ZsLX3GEOw6oSAcXmo0kaN5jyKJztUBrTyR/pmXczKDx2LTOo90Zm5n6X0EcOoWp2a8Laz3NXlVs+LUJ4WM8IUvC6fp16aGrXAzP0u+4NvWKjP/rTZ/sttyu8XqvyzIFWLKmYHIpQaQ6qTPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712278101; c=relaxed/simple;
	bh=FWQE+t3LxfnSDk5Kfl0eX6fRzCd/ISJ0/qnWHrQ0WUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqrbxQvFhOOu5VlG0wtPtxuXNPicTbIcFWRcPzPnojg1hEua96pLajwdlM1pRh1qamTqDOg6nIbEd1KBl+F5wIPFLMT1DwdvckDNF+/bf4TDYX+OzebOEG5l1xlpU8O4vWn6+kQlhj3YdxRtgc18ZAeZCmCw1fPqIzUgdFraWUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2KKuGRo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2KKuGRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712278099; x=1743814099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWQE+t3LxfnSDk5Kfl0eX6fRzCd/ISJ0/qnWHrQ0WUE=;
  b=Y2KKuGRoBjfi7lwcEB2wXQnj+WPeEiGXDSXwcPrUEjIbinz64I5PCFe8
   zOP+jtcjdsF4h6Y1rJ/SdOLnKithYtsOAWJ1In1J/d/OrGhEph6KQrSL9
   EbxhIMUzGBTbxLQNvKdU02qKaGLVpSRriDQIulV2L8fhMnMdIidcpWDoU
   LtggvFkh6Wes8ijYfvWwRwOVrSBUmq4+6QCgy158J10xAqU/bSiKtoSnd
   GN7rUB6zbjVn7PLTJ7GAUN+YdkZexWku2t7Jpw+yh7l7rv3x/QmY60874
   8fcr+FAHqJ9iJ/rcAL/8KYF0IZZq3VKU0SCuOneo5T76oLPRIBs341ts9
   g==;
X-CSE-ConnectionGUID: sjYcE3NxQFuzMn6w6Ew5rg==
X-CSE-MsgGUID: ySYO5+dbRMSoW5E2lV6GhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25104189"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="25104189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 17:48:19 -0700
X-CSE-ConnectionGUID: mFcN1vRQQMit4WhLKeLEnQ==
X-CSE-MsgGUID: Kqhd90vRSF2nGSKrjdUMhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19398819"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2024 17:48:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsXkd-0001gg-0U;
	Fri, 05 Apr 2024 00:48:15 +0000
Date: Fri, 5 Apr 2024 08:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 29/29] fs/fsopen.c:29:22: error: implicit
 declaration of function 'iov_iter_count'
Message-ID: <202404050859.FdVacHE1-lkp@intel.com>
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
commit: 34a49de340a534b0cb222309e73d1ef215ff4db6 [29/29] WIP
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240405/202404050859.FdVacHE1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050859.FdVacHE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050859.FdVacHE1-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fsopen.c: In function 'fscontext_read':
>> fs/fsopen.c:29:22: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
      29 |         size_t len = iov_iter_count(to);
         |                      ^~~~~~~~~~~~~~
>> fs/fsopen.c:57:14: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
      57 |         if (!copy_to_iter_full(p, n, to) != 0)
         |              ^~~~~~~~~~~~~~~~~
         |              copy_to_user_nofault
   cc1: some warnings being treated as errors
--
   fs/proc/base.c: In function 'comm_write':
>> fs/proc/base.c:1664:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    1664 |         size_t count = iov_iter_count(from);
         |                        ^~~~~~~~~~~~~~
>> fs/proc/base.c:1669:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
    1669 |         if (!copy_from_iter_full(buffer, count > maxlen ? maxlen : count, from))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   cc1: some warnings being treated as errors


vim +/iov_iter_count +29 fs/fsopen.c

    20	
    21	/*
    22	 * Allow the user to read back any error, warning or informational messages.
    23	 */
    24	static ssize_t fscontext_read(struct kiocb *iocb, struct iov_iter *to)
    25	{
    26		struct fs_context *fc = iocb->ki_filp->private_data;
    27		struct fc_log *log = fc->log.log;
    28		unsigned int logsize = ARRAY_SIZE(log->buffer);
  > 29		size_t len = iov_iter_count(to);
    30		ssize_t ret;
    31		char *p;
    32		bool need_free;
    33		int index, n;
    34	
    35		ret = mutex_lock_interruptible(&fc->uapi_mutex);
    36		if (ret < 0)
    37			return ret;
    38	
    39		if (log->head == log->tail) {
    40			mutex_unlock(&fc->uapi_mutex);
    41			return -ENODATA;
    42		}
    43	
    44		index = log->tail & (logsize - 1);
    45		p = log->buffer[index];
    46		need_free = log->need_free & (1 << index);
    47		log->buffer[index] = NULL;
    48		log->need_free &= ~(1 << index);
    49		log->tail++;
    50		mutex_unlock(&fc->uapi_mutex);
    51	
    52		ret = -EMSGSIZE;
    53		n = strlen(p);
    54		if (n > len)
    55			goto err_free;
    56		ret = -EFAULT;
  > 57		if (!copy_to_iter_full(p, n, to) != 0)
    58			goto err_free;
    59		ret = n;
    60	
    61	err_free:
    62		if (need_free)
    63			kfree(p);
    64		return ret;
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
