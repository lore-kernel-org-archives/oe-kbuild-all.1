Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBE917745
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712620214; cv=none; b=paGjLkHoDRZV0P66SlmUSMbyBUt4fwyQUsfb4/ZdNbcIRRYciZhInr0FBtN3BqBqGZOadz1BeTMuYbsSKP6KVJMXQwXM88VtWhzq3VpPI25tUjRPAUjHcoRtPTwGIJT2evKxHy9hzxSSTtSPzd1NeEEtOO/thdNantH28EFJlEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712620214; c=relaxed/simple;
	bh=gf43HoJhlad57VfvpwYw07hnTbt779oNpascERMsEZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ymb0kHqfgrih7C/48UuCaN+EiHv32peQj+ERx7En8e8AUDkuKt19PG5kvt7+ITzDDCdKGYXgmpXdB1nkB/Hi9cVbs8eYayMyO6HP/S2ItBs1xlNdp80XjOXew7IizSYWUuRblD7J3F12WKMGxdWI0Y+RyP2Uxzud7r/m/j6jc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5ZjbsbK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5ZjbsbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712620211; x=1744156211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gf43HoJhlad57VfvpwYw07hnTbt779oNpascERMsEZw=;
  b=T5ZjbsbKr05ctg3vxgOwntChGUpto887YRtRkmFrNte7Dxuy4qYQa5A2
   oGYsJAFLLWVn+1ZybU2/alEDD//fDtk6swmR40S9ecNj16OUygXE9nZUp
   mONGzU1j5+sYNXHu00ZRH2/mesGA9iHYUHKjReHEIJfvfgpjIigTrhw+F
   maIrx/pnebbl3FTCGjgTsKc2EWwL44UBR4fJAnTIL5XqXA4dw7PkQR53V
   S0cYygkv5HMJZydYWDucWb4ONMxp8e6k8vkN9ahO4pep262I1z16I2+Q0
   OMdJuYLAzRTKxrtOCK2i6Yvhdg6Qf3AiXmQe0055GnvQaEFZdJZ1yQGP/
   g==;
X-CSE-ConnectionGUID: y/QDQVYMQXuJNIt9f5jMjg==
X-CSE-MsgGUID: XeNw/Rn1RguOjKX+eBeHgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="25365769"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="25365769"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 16:50:08 -0700
X-CSE-ConnectionGUID: O+raOdqyRFGzx358xd8Kvg==
X-CSE-MsgGUID: 3kdloFjtSSCyYjJtfwywQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24674847"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2024 16:50:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtykW-0005Yk-0R;
	Mon, 08 Apr 2024 23:50:04 +0000
Date: Tue, 9 Apr 2024 07:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 103/144]
 drivers/net/wireless/marvell/libertas/debugfs.c:764: warning: Function
 parameter or struct member 'iocb' not described in 'lbs_debugfs_read'
Message-ID: <202404090715.qB8gL1qh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   e7bbb29bad7bb57e91d8a49a5aab3797680b1560
commit: 0b792de2740f1fc36f735fa607027c533e47dd2f [103/144] drivers/net/wireless/marvell: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240409/202404090715.qB8gL1qh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090715.qB8gL1qh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090715.qB8gL1qh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/marvell/libertas/debugfs.c:764: warning: Function parameter or struct member 'iocb' not described in 'lbs_debugfs_read'
>> drivers/net/wireless/marvell/libertas/debugfs.c:764: warning: Function parameter or struct member 'to' not described in 'lbs_debugfs_read'
>> drivers/net/wireless/marvell/libertas/debugfs.c:764: warning: Excess function parameter 'file' description in 'lbs_debugfs_read'
>> drivers/net/wireless/marvell/libertas/debugfs.c:764: warning: Excess function parameter 'userbuf' description in 'lbs_debugfs_read'
>> drivers/net/wireless/marvell/libertas/debugfs.c:764: warning: Excess function parameter 'count' description in 'lbs_debugfs_read'
>> drivers/net/wireless/marvell/libertas/debugfs.c:764: warning: Excess function parameter 'ppos' description in 'lbs_debugfs_read'
>> drivers/net/wireless/marvell/libertas/debugfs.c:810: warning: Function parameter or struct member 'iocb' not described in 'lbs_debugfs_write'
>> drivers/net/wireless/marvell/libertas/debugfs.c:810: warning: Function parameter or struct member 'from' not described in 'lbs_debugfs_write'
>> drivers/net/wireless/marvell/libertas/debugfs.c:810: warning: Excess function parameter 'f' description in 'lbs_debugfs_write'
>> drivers/net/wireless/marvell/libertas/debugfs.c:810: warning: Excess function parameter 'buf' description in 'lbs_debugfs_write'
>> drivers/net/wireless/marvell/libertas/debugfs.c:810: warning: Excess function parameter 'cnt' description in 'lbs_debugfs_write'
>> drivers/net/wireless/marvell/libertas/debugfs.c:810: warning: Excess function parameter 'ppos' description in 'lbs_debugfs_write'


vim +764 drivers/net/wireless/marvell/libertas/debugfs.c

876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  752  
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  753  /**
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  754   * lbs_debugfs_read - proc read function
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  755   *
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  756   * @file:	file to read
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  757   * @userbuf:	pointer to buffer
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  758   * @count:	number of bytes to read
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  759   * @ppos:	read data starting position
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  760   *
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  761   * returns:	amount of data read or negative error code
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  762   */
0b792de2740f1f drivers/net/wireless/marvell/libertas/debugfs.c Jens Axboe      2024-04-05  763  static ssize_t lbs_debugfs_read(struct kiocb *iocb, struct iov_iter *to)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10 @764  {
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  765  	int val = 0;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  766  	size_t pos = 0;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  767  	ssize_t res;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  768  	char *p;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  769  	int i;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  770  	struct debug_data *d;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  771  	unsigned long addr = get_zeroed_page(GFP_KERNEL);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  772  	char *buf = (char *)addr;
ad43f8bfb7b9a6 drivers/net/wireless/libertas/debugfs.c         Kiran Divekar   2009-08-28  773  	if (!buf)
ad43f8bfb7b9a6 drivers/net/wireless/libertas/debugfs.c         Kiran Divekar   2009-08-28  774  		return -ENOMEM;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  775  
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  776  	p = buf;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  777  
0b792de2740f1f drivers/net/wireless/marvell/libertas/debugfs.c Jens Axboe      2024-04-05  778  	d = iocb->ki_filp->private_data;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  779  
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  780  	for (i = 0; i < num_of_items; i++) {
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  781  		if (d[i].size == 1)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  782  			val = *((u8 *) d[i].addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  783  		else if (d[i].size == 2)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  784  			val = *((u16 *) d[i].addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  785  		else if (d[i].size == 4)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  786  			val = *((u32 *) d[i].addr);
4269e2ad83036e drivers/net/wireless/libertas/debugfs.c         Dan Williams    2007-05-10  787  		else if (d[i].size == 8)
4269e2ad83036e drivers/net/wireless/libertas/debugfs.c         Dan Williams    2007-05-10  788  			val = *((u64 *) d[i].addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  789  
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  790  		pos += sprintf(p + pos, "%s=%d\n", d[i].name, val);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  791  	}
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  792  
0b792de2740f1f drivers/net/wireless/marvell/libertas/debugfs.c Jens Axboe      2024-04-05  793  	res = simple_copy_to_iter(p, &iocb->ki_pos, pos, to);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  794  
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  795  	free_page(addr);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  796  	return res;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  797  }
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  798  
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  799  /**
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  800   * lbs_debugfs_write - proc write function
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  801   *
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  802   * @f:		file pointer
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  803   * @buf:	pointer to data buffer
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  804   * @cnt:	data number to write
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  805   * @ppos:	file position
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  806   *
8973a6e770fc89 drivers/net/wireless/libertas/debugfs.c         Randy Dunlap    2011-04-26  807   * returns:	amount of data written
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  808   */
0b792de2740f1f drivers/net/wireless/marvell/libertas/debugfs.c Jens Axboe      2024-04-05  809  static ssize_t lbs_debugfs_write(struct kiocb *iocb, struct iov_iter *from)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10 @810  {
0b792de2740f1f drivers/net/wireless/marvell/libertas/debugfs.c Jens Axboe      2024-04-05  811  	size_t cnt = iov_iter_count(from);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  812  	int r, i;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  813  	char *pdata;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  814  	char *p;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  815  	char *p0;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  816  	char *p1;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  817  	char *p2;
0b792de2740f1f drivers/net/wireless/marvell/libertas/debugfs.c Jens Axboe      2024-04-05  818  	struct debug_data *d = iocb->ki_filp->private_data;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  819  
a497e47d4aec37 drivers/net/wireless/libertas/debugfs.c         Dan Carpenter   2013-10-30  820  	if (cnt == 0)
a497e47d4aec37 drivers/net/wireless/libertas/debugfs.c         Dan Carpenter   2013-10-30  821  		return 0;
a497e47d4aec37 drivers/net/wireless/libertas/debugfs.c         Dan Carpenter   2013-10-30  822  
0b792de2740f1f drivers/net/wireless/marvell/libertas/debugfs.c Jens Axboe      2024-04-05  823  	pdata = iterdup_nul(from, cnt);
f0fc86966253ad drivers/net/wireless/libertas/debugfs.c         Al Viro         2015-12-24  824  	if (IS_ERR(pdata))
f0fc86966253ad drivers/net/wireless/libertas/debugfs.c         Al Viro         2015-12-24  825  		return PTR_ERR(pdata);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  826  
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  827  	p0 = pdata;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  828  	for (i = 0; i < num_of_items; i++) {
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  829  		do {
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  830  			p = strstr(p0, d[i].name);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  831  			if (p == NULL)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  832  				break;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  833  			p1 = strchr(p, '\n');
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  834  			if (p1 == NULL)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  835  				break;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  836  			p0 = p1++;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  837  			p2 = strchr(p, '=');
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  838  			if (!p2)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  839  				break;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  840  			p2++;
d2f11e0991e379 drivers/net/wireless/libertas/debugfs.c         Tony Breeds     2007-03-09  841  			r = simple_strtoul(p2, NULL, 0);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  842  			if (d[i].size == 1)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  843  				*((u8 *) d[i].addr) = (u8) r;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  844  			else if (d[i].size == 2)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  845  				*((u16 *) d[i].addr) = (u16) r;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  846  			else if (d[i].size == 4)
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  847  				*((u32 *) d[i].addr) = (u32) r;
4269e2ad83036e drivers/net/wireless/libertas/debugfs.c         Dan Williams    2007-05-10  848  			else if (d[i].size == 8)
4269e2ad83036e drivers/net/wireless/libertas/debugfs.c         Dan Williams    2007-05-10  849  				*((u64 *) d[i].addr) = (u64) r;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  850  			break;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  851  		} while (1);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  852  	}
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  853  	kfree(pdata);
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  854  
4269e2ad83036e drivers/net/wireless/libertas/debugfs.c         Dan Williams    2007-05-10  855  	return (ssize_t)cnt;
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  856  }
876c9d3aeb989c drivers/net/wireless/libertas/debugfs.c         Marcelo Tosatti 2007-02-10  857  

:::::: The code at line 764 was first introduced by commit
:::::: 876c9d3aeb989cf1961f2c228d309ba5dcfb1172 [PATCH] Marvell Libertas 8388 802.11b/g USB driver

:::::: TO: Marcelo Tosatti <marcelo@kvack.org>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
