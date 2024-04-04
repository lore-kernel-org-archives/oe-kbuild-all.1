Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11870CC9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 22:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712271199; cv=none; b=aLIf0pN4j863qEFKKRxxSraQCew8biOUr4Zi1iF9Msx7/J+/F/9sJle/4ziKo5mWAAzIyLRyOYV/p9TFXnXeJiQ5mNy1edyUcjEPip2tq6q5LRpYBiZEqHs/oNW0XoOhh1Gx/tTqz33Diu1Gf/hK1GZIsOvJkX3AjTHBlAjbJHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712271199; c=relaxed/simple;
	bh=DdHSJbQXkUM/WeqD4WbFh9HGnfllVEVTAPWvPU4nMNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E4/+COWVCy4Pb6gUQTzFhrIjYiGRyX7gbrMTIyJjLo7U1x42KvdC1dxMMTB5XYat7lKABpHyy1LtJNZv6GfgeIpAJPae+6o9NXOy4o/HCO9uqHSF2OPT+ruq3OJ78ievpBN72SkNVViQvXSl6Dmhts0JYt2A6oWcr/W496qFo0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBJ/p04I; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBJ/p04I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712271198; x=1743807198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DdHSJbQXkUM/WeqD4WbFh9HGnfllVEVTAPWvPU4nMNM=;
  b=hBJ/p04I7TJmjOyvTbN2Ig2Zbg96PbnsWmsNj0KTW3JaRLUnn3D/heGD
   4bfOl8UOfwOcWQNk0trxpnYYVQFP6PD0ZbWbJWSxcOXwgsifo9HT621kO
   uQGlSopSgdAnWvhmN87W1LzhsnkSM/PSXDM0lReR1r3EOaUuqmEv/BBiQ
   KkUdikZiIEercpo2TWzd1C7Wr1Snw2eU/OWoMHg8eq712DqEgFRFvALhI
   HU5p99hivl2EAL7ZQJ9qubdIApjfgP9VeIumSUNm3uI6FWaVZ4WBhFUuU
   zZEuTl/8LIRIyrLduMf+e4tx/gCIGcBzBbqPGXmtS7hfmXAIPIgOp40Qh
   g==;
X-CSE-ConnectionGUID: G0S+AyLVRbmYUZVAZA/WdQ==
X-CSE-MsgGUID: S9yr0EXaSOOPWwcj9YES6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7747163"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7747163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 15:53:16 -0700
X-CSE-ConnectionGUID: HI3qsCMbRVa31P2l9EHvhA==
X-CSE-MsgGUID: rBh0gZffSIOHUZIYaiBn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="50191960"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 15:53:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsVxH-0001bB-2k;
	Thu, 04 Apr 2024 22:53:11 +0000
Date: Fri, 5 Apr 2024 06:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 19/28] kernel/trace/trace.c:5355:14: error:
 implicit declaration of function 'copy_from_iter_full'; did you mean
 'copy_from_user_nofault'?
Message-ID: <202404050640.zWofItrp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f43454f1aaa3229f819380d12166825180ccee0e
commit: 02b8fcd817e5dbfce4b90bc975bbb4b7c0934cd9 [19/28] kernel: convert to read/write iterators
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050640.zWofItrp-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050640.zWofItrp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050640.zWofItrp-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'tracing_write_stub':
   kernel/trace/trace.c:5020:16: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    5020 |         return iov_iter_count(to);
         |                ^~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'tracing_trace_options_write':
>> kernel/trace/trace.c:5355:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
    5355 |         if (!copy_from_iter_full(buf, cnt, from))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   kernel/trace/trace.c: In function 'tracing_clock_write':
   kernel/trace/trace.c:7089:14: error: implicit declaration of function 'copy_from_iter'; did you mean 'copy_from_user'? [-Werror=implicit-function-declaration]
    7089 |         if (!copy_from_iter(buf, cnt, from))
         |              ^~~~~~~~~~~~~~
         |              copy_from_user
   kernel/trace/trace.c: In function 'tracing_buffers_read':
>> kernel/trace/trace.c:7966:15: error: implicit declaration of function 'copy_to_iter'; did you mean 'copy_to_user'? [-Werror=implicit-function-declaration]
    7966 |         ret = copy_to_iter(trace_data + info->read, size, to);
         |               ^~~~~~~~~~~~
         |               copy_to_user
   cc1: some warnings being treated as errors


vim +5355 kernel/trace/trace.c

  5342	
  5343	static ssize_t tracing_trace_options_write(struct kiocb *iocb,
  5344						   struct iov_iter *from)
  5345	{
  5346		struct seq_file *m = iocb->ki_filp->private_data;
  5347		struct trace_array *tr = m->private;
  5348		size_t cnt = iov_iter_count(from);
  5349		char buf[64];
  5350		int ret;
  5351	
  5352		if (cnt >= sizeof(buf))
  5353			return -EINVAL;
  5354	
> 5355		if (!copy_from_iter_full(buf, cnt, from))
  5356			return -EFAULT;
  5357	
  5358		buf[cnt] = 0;
  5359	
  5360		ret = trace_set_options(tr, buf);
  5361		if (ret < 0)
  5362			return ret;
  5363	
  5364		iocb->ki_pos += cnt;
  5365	
  5366		return cnt;
  5367	}
  5368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
