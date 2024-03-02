Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAF710A0A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 06:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709360100; cv=none; b=CIpaQ6+4JDbATQIup/pJI5SzCDc5K1m4skYEFrLI0M8TDUJ+Ch2Mg1KpKR1HRI5mKuz45xNn8a1+yXVjjYpQX5f4pHobbU9eEQIBDhjuBXGKipTcP4rbdm8TCjcylfeZAnrV7BY2HhVq9Acn6i2isBASM+BvQU5KjA5jLxcQDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709360100; c=relaxed/simple;
	bh=NCASstsyb7CnZiTaiqfLMchPl73OdY0wpjR3ODO+Mgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXKb/LGarjt6xYl6GUXVQVxSzjRAHleVIFv9prxAcNEzfSASuvfu1c2pDgMmLsVyeP8jyn7a89X69XCUna9RSPAZiYqgJe8oHZ4QItyvvNBfIJFl/c8BidXGhbvRiYN/wbY8xIY45ceOwdc6fPyTbWOXlz9se1+b37U1JEGyxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkO/1Y2a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkO/1Y2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709360098; x=1740896098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCASstsyb7CnZiTaiqfLMchPl73OdY0wpjR3ODO+Mgk=;
  b=WkO/1Y2aZ1jC7NYZYinkMNAukaxIDWdVbetdnoUDpX6SztqYGJq6LQnD
   ytbAFbHYBuabkt1iOMlTVMX0hL2BHP6/bORe0FzF4hREDXwIvGhsHGUIB
   8QPfE/cZWvsteRV8OO11p+n4vxp1StzSlKFWyN8w1CT6TLH0rC/TY2KZT
   YeqzwiZ+izQsVTVuXY+SLL8c5GJs5j0JI4PRqKhQbI7/1ZvvBeMEmffOj
   SOcgSMHnA9Pwf7fyuniUbw7zIaC+GCS9AJAY6wjisDdwt1EvirKikNNw1
   slD12dCwYYVLYESBHQzCrw3abwh+X5D/lgSXgaISxS+61/VlQ+VoFO6ra
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="29333266"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="29333266"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 22:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="13004944"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2024 22:14:56 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgIe6-000EMz-03;
	Sat, 02 Mar 2024 06:14:54 +0000
Date: Sat, 2 Mar 2024 14:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [linux-next:master 10409/11394] ERROR: modpost: "__fentry__"
 [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko]
 undefined!
Message-ID: <202403021440.Rs4qG6fP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marcos,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: 539cd3f4da3fdbe7dc353634e004e4b0e725c35a [10409/11394] selftests: lib.mk: Do not process TEST_GEN_MODS_DIR
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021440.Rs4qG6fP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021440.Rs4qG6fP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: Module.symvers is missing.
Modules may not have dependencies or modversions.
You may get many unresolved symbol errors.
You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
if you want to proceed at your own risk.
>> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
>> ERROR: modpost: "klp_enable_patch" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
>> ERROR: modpost: "seq_printf" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
>> ERROR: modpost: "param_ops_int" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
>> ERROR: modpost: "module_layout" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
>> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
>> ERROR: modpost: "flush_work" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
>> ERROR: modpost: "_printk" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
>> ERROR: modpost: "complete" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
>> ERROR: modpost: "msleep" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
WARNING: modpost: suppressed 80 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
