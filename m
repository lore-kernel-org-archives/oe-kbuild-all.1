Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35631A702
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 05:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719464782; cv=none; b=OSyP2HHM55xQFs2o6a9dMy9vpKUL73mxt+qYN5zmZUQ3HsUNuY5isd5YjT6/FQupXQeAxYWfIaQ8SGfXzeUVGKb4bG8b+e9MKL7Vpb/7gXv6dLPA3Jzqp3EVFw83hAYjUbYXF8WwKzDXRT4ToDVzb1fPCndHclGXcI7HEhOz7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719464782; c=relaxed/simple;
	bh=VSY6CV9r3h5ldVQQCk36fBJ+IAneAtNPfyxvmoMnC+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=js8DrGyXAFVip9QERt6z5Qa9prfMpqahf04iaOjD5uemh6qxBP876MblZM6idxxLom9sBwMAMREaONLiL4GLgeEucUu/2/ynE8lLlsRlB5b2JajK6YypbF6Xy7446m+wJ2xLlJQa1l5MzNYbWfFftqEuUZ/VnptqFpFHtQadd2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmOtBQ7p; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmOtBQ7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719464780; x=1751000780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSY6CV9r3h5ldVQQCk36fBJ+IAneAtNPfyxvmoMnC+I=;
  b=SmOtBQ7pAvrytvoqm4s7Voh6ypIPIjD6JHjGSDc9Pqo9ph47Nvi8iUjj
   ZhtLZDygzy9oMsNOtj+7RlSxtsBH52irPXydnh2zumyNrwWshXudPEGJ7
   XDV0tEYbBXJinBp6Vs0TFZngOHqxEY6Ea4EUvurYEsfn6EyVyyh7Rctmv
   kPnBN3Ic068k1Xj7QiirOLoUfNTD66eH/RfHvuc0QO2sJ2xVwkN95Clfj
   j+JdLQnHF1VB/qHDTMpmjSx2T7bVtUqktAIquYytxOCKr/N5nYGcWN75w
   W95hH3A2tK3a2UKBbgzCZPY5Yv/r5twSXkM20hYrAy6RQStOnojh2rl3J
   A==;
X-CSE-ConnectionGUID: wT4EF0HUTfuM8aAhoG7uZw==
X-CSE-MsgGUID: MpQIUK4KQH6Pwk9ZeXBVQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20391189"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="20391189"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 22:06:20 -0700
X-CSE-ConnectionGUID: qjNrYmIYRXmZ4m6hiJ2zig==
X-CSE-MsgGUID: 5afUiqqmTCaevvPxIP2eLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44085925"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2024 22:06:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMhKr-000FuX-0A;
	Thu, 27 Jun 2024 05:06:17 +0000
Date: Thu, 27 Jun 2024 13:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 8115/8719] drivers/iio/gyro/adis16260.o: warning:
 objtool: adis16260_write_raw+0x108: can't find jump dest instruction at
 .text+0xdb2
Message-ID: <202406271353.tkzKn7Tm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 8d61d01cdec275719b70295e98e4d45c5f284f29 [8115/8719] iio: gyro: adis16260: make use of the new lock helpers
config: x86_64-randconfig-102-20240626 (https://download.01.org/0day-ci/archive/20240627/202406271353.tkzKn7Tm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271353.tkzKn7Tm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271353.tkzKn7Tm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/gyro/adis16260.o: warning: objtool: adis16260_write_raw+0x108: can't find jump dest instruction at .text+0xdb2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
