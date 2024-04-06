Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00728E6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712362754; cv=none; b=S4lvXszjYJryvflaywbwIae1vAwsFbD0bcI1oV+r5fi3KEQamEnYYpf6DTa1zwJ0HiARaNIMnvgjHTzgV8p3VC7zJEshl0QrTLm2WD8oltpbMizcHpe7P9fCwo3mF8pe8NPqzsmnh3To2EzOW2Ho4MhaEHsUgVIxrC5+X8CNrus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712362754; c=relaxed/simple;
	bh=WREnUc7CGbNB9tefmsHuA4aUC35LQUeafg89DVjPa/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofAfkrrLlhBSM+lYtiVD9FXr7wwkJZsht4atumjFHfNPO8N3BP+j/m9swmuRgtmnFuNU82f9N9PjEatPsacn9wlhT2Rh8beHHycNud6y5OBTIoS9UPyHrWl2sf0haXpaStSf4u+3AfJFdkyW/B61teQZu3epZ9MLg56jyB2FkWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJwSQ8QN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJwSQ8QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712362752; x=1743898752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WREnUc7CGbNB9tefmsHuA4aUC35LQUeafg89DVjPa/U=;
  b=ZJwSQ8QNdcnQOHTcAhSr1S2bryYOpZPLRlFjgF+Rn+d8zna3omBIxrnV
   uxfhwJ4YydfK3NEz8nE3mtV4g47zN6wJRwuimWWlF3dFxN5LQ8i2ZhQxc
   LlI6VpSIHLvY4DieVdCmbetwBp/0vXNBvjjRiTBd7+pDNX9uZMLRt/R69
   e0evV6eWluIUyfwaiRSEBqbQOnKexNtXbTmJE9Mu1rJ8T48CRhQH5DcED
   WGUwXolap+mrOB5wQfIq7hkCqk/SWsLfSRM1xG+ycHWJQottact77Aidv
   YGLBHwP3h+d8BzU26um5gNaNGz8uEFiVxmaphvJqfnT65n/puXaHl1jIT
   g==;
X-CSE-ConnectionGUID: IwcxXpjnRD+hKOTHJTd5Rw==
X-CSE-MsgGUID: nx/P9TyMTqKRThmBD/0Hvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="25151530"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="25151530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 17:19:12 -0700
X-CSE-ConnectionGUID: znZHlLI+RYiD8qvb/Coy1A==
X-CSE-MsgGUID: p2UztvgQT7KRJPmBfvGg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19243502"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 17:19:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rstm0-0002uO-1N;
	Sat, 06 Apr 2024 00:19:08 +0000
Date: Sat, 6 Apr 2024 08:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 76/93] drivers/misc/lkdtm/core.c:300:24: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404060825.JvYUcE4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   222e1965f038cbce873a9392d6b9e0df82837498
commit: 5f44157c2a3b1257016bb0bd4257c96d1a126723 [76/93] misc: lkdtm: convert to read/write iterators
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060825.JvYUcE4D-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060825.JvYUcE4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060825.JvYUcE4D-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/lkdtm/core.c: In function 'direct_entry':
>> drivers/misc/lkdtm/core.c:300:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     300 |         size_t count = iov_iter_count(from);
         |                        ^~~~~~~~~~~~~~
>> drivers/misc/lkdtm/core.c:312:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_page'? [-Werror=implicit-function-declaration]
     312 |         if (!copy_from_iter_full(buf, count, from)) {
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_page
   cc1: some warnings being treated as errors


vim +/iov_iter_count +300 drivers/misc/lkdtm/core.c

   295	
   296	/* Special entry to just crash directly. Available without KPROBEs */
   297	static ssize_t direct_entry(struct kiocb *iocb, struct iov_iter *from)
   298	{
   299		const struct crashtype *crashtype;
 > 300		size_t count = iov_iter_count(from);
   301		char *buf;
   302		int err;
   303	
   304		if (count >= PAGE_SIZE)
   305			return -EINVAL;
   306		if (count < 1)
   307			return -EINVAL;
   308	
   309		buf = (char *)__get_free_page(GFP_KERNEL);
   310		if (!buf)
   311			return -ENOMEM;
 > 312		if (!copy_from_iter_full(buf, count, from)) {
   313			free_page((unsigned long) buf);
   314			return -EFAULT;
   315		}
   316		/* NULL-terminate and remove enter */
   317		buf[count] = '\0';
   318		strim(buf);
   319	
   320		crashtype = find_crashtype(buf);
   321		free_page((unsigned long) buf);
   322		if (!crashtype)
   323			return -EINVAL;
   324	
   325		pr_info("Performing direct entry %s\n", crashtype->name);
   326		err = lkdtm_do_action(crashtype);
   327		iocb->ki_pos += count;
   328	
   329		if (err)
   330			return err;
   331		return count;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
