Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987710A1A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 06:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712384424; cv=none; b=cMe4wz33QeYpsHbpDQdtgLkqoh8Pv1lRgNZfzYcYO4xudemW/svlAwO7lPnrJIomxec2Mbfgwx2uIC1fpXlLBqWX4wE4ykVmUD3hPtF9ceuwsH06iQRsLgs11h7yNJ9pVAD87rNhOpHCHt8KseLiQSckeoCRSGlwg5ubhLI9gHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712384424; c=relaxed/simple;
	bh=O+i7iqtVNjH9G0zLhsNZ1a1CulDxQQtqja2u6QTaSS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bELdql1yhB8XyzVW4rB82JBQ9q6qaBgXYFhU9gh1wYlHu2on0LOMJMTuGI5mRRLl3Ull2S3Ih2pmo9shyCqf1LlOi9t+HGZPhf/rpdMXCGBuAVS2AI55IrhJ/8xHChfkOHFXUIyf9oKAvUekGViVIZOxTXCnYU/zZFE25zwCguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WknHvoca; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WknHvoca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712384422; x=1743920422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+i7iqtVNjH9G0zLhsNZ1a1CulDxQQtqja2u6QTaSS0=;
  b=WknHvocaYWox1idr+H/nmKvJURj0QtmFv7TX8yHHk7ym4NcfQtLKyLUF
   yMMbcIoLmqZxUjqNdrrUOX37D7bVRa+cASQV+snJy5Bhd043RLxSkolF0
   nmmAoRs1N1tvYIkVbH1flvifMYKAHfUSS+7HJt1ImrZvs6dwFe4ixEkej
   Qds/bmYywXtxd1ClXEnBzgngyWQjuZll45RhHYqWDBI1d1UamCR+7P39o
   qos5zpx0lGUUQI6JrnzogxU+nePNtAIkqZbV/7MSDMTs2GD8Do4eQtq9V
   rx0fuJUO5EL8WdWUKkSsDreav9k7NAuVnzM6DvJcNXA1ufNFTq20D2vP4
   g==;
X-CSE-ConnectionGUID: 6ftMqK9iQoi9pGyXz18WJA==
X-CSE-MsgGUID: 8HwOkiiUQqmI5s9p7Uzq/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="8299138"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="8299138"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 23:20:21 -0700
X-CSE-ConnectionGUID: NzlA0ydYReysv80aZR8iMg==
X-CSE-MsgGUID: IOS+zk03T7OMCjMJLOQNdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19811818"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Apr 2024 23:20:21 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rszPW-0003C0-1F;
	Sat, 06 Apr 2024 06:20:18 +0000
Date: Sat, 6 Apr 2024 14:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 101/105] arch/x86/mm/tlb.c:1317:24: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404061417.ofqdy8UV-lkp@intel.com>
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
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240406/202404061417.ofqdy8UV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061417.ofqdy8UV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061417.ofqdy8UV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/tlb.c: In function 'tlbflush_write_file':
>> arch/x86/mm/tlb.c:1317:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    1317 |         size_t count = iov_iter_count(from);
         |                        ^~~~~~~~~~~~~~
>> arch/x86/mm/tlb.c:1323:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
    1323 |         if (!copy_from_iter_full(buf, len, from))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   cc1: some warnings being treated as errors


vim +/iov_iter_count +1317 arch/x86/mm/tlb.c

  1314	
  1315	static ssize_t tlbflush_write_file(struct kiocb *iocb, struct iov_iter *from)
  1316	{
> 1317		size_t count = iov_iter_count(from);
  1318		char buf[32];
  1319		ssize_t len;
  1320		int ceiling;
  1321	
  1322		len = min(count, sizeof(buf) - 1);
> 1323		if (!copy_from_iter_full(buf, len, from))
  1324			return -EFAULT;
  1325	
  1326		buf[len] = '\0';
  1327		if (kstrtoint(buf, 0, &ceiling))
  1328			return -EINVAL;
  1329	
  1330		if (ceiling < 0)
  1331			return -EINVAL;
  1332	
  1333		tlb_single_page_flush_ceiling = ceiling;
  1334		return count;
  1335	}
  1336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
