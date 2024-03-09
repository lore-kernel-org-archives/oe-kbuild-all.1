Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD31208A8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709965459; cv=none; b=DD2fscdqSHz/iWxzjX4gKxqChvLZsuMitcbCY6gGZfqPza+wyel825bSV/HjE3n/o1QSp9g3jGNrPawdnryVTFW+HxiiwOvaLDA482wTDbaWtBx7+2xrvnGbBGHU2JVsg2V9LC6h/5rZdfFKd0kk0MgoX420jmz6HHwM3/PysTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709965459; c=relaxed/simple;
	bh=x4CFRJy9DTgl1Dfgd0zHHG7xGY+cCaJ4kFAL3vZzIDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI+8Fzyi6/DT5XC/joL7ZmMFssxqeWpCHD8YT1Mt2uGZh14vPYGoDn0UmdYruFUCu5hSX1AXCuJAN/Fbrboq3FiK43SxXfndztnGAZQhHtYnzZmBOgSiBN4tWC5WA+NJpvAjZlmEF+LLiYnANtsLsoH7PL3Sk6Ihm/MKYfy1lFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSvc3HEw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSvc3HEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709965457; x=1741501457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x4CFRJy9DTgl1Dfgd0zHHG7xGY+cCaJ4kFAL3vZzIDA=;
  b=bSvc3HEwelZU/xcbKo7cV/5a3g+Ed1DpbbszMJ6dRlbVZnhpoJlB27Qo
   r3MDXn7ct4zWP6K011nz3W7iXLynn3mMkFKfKC0RH6Mggr2OgafdaHx7z
   TOGQi93pUnqsRzWBoADxuNdVYZKQFuokGfdTGnyp0GUeUQAkg2s02NqwP
   m3jJcZqXCJ3kVPiBfSLgPl1ge0N0D/QwIA0+2F9nqOQWE8WB5F0UML3W2
   Lo+0azkPZlrkCBxC8+YeCRA0OlfJHaWYm9h8dOeqMd3XI6ASxJV647iv8
   rAnF+tvwYOaw5MZpIPIH8rWvgKe2r3mszHTatRNNCtlL4zNVCz+7IlrZl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4868503"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="4868503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 22:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="11099340"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Mar 2024 22:24:15 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riq7w-00072t-1J;
	Sat, 09 Mar 2024 06:24:12 +0000
Date: Sat, 9 Mar 2024 14:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rebase 142/215] undefined reference to
 `rz_mtu3_shared_reg_read'
Message-ID: <202403091457.7awmpJRF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rebase
head:   f90f013c2bbc84d0e83846f335a3a9b2e392ceb5
commit: 762ea0f962386996f75e984c5a82914dfa7956d8 [142/215] mfd: rz-mtu3: Link time dependencies
config: alpha-randconfig-r121-20240309 (https://download.01.org/0day-ci/archive/20240309/202403091457.7awmpJRF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240309/202403091457.7awmpJRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091457.7awmpJRF-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_ext_input_phase_clock_select_get':
>> (.text+0x78): undefined reference to `rz_mtu3_shared_reg_read'
>> alpha-linux-ld: (.text+0x80): undefined reference to `rz_mtu3_shared_reg_read'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_lock_if_counter_is_valid':
   (.text+0x1a0): undefined reference to `rz_mtu3_shared_reg_read'
   alpha-linux-ld: (.text+0x1a8): undefined reference to `rz_mtu3_shared_reg_read'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_direction_read':
>> (.text+0x5b0): undefined reference to `rz_mtu3_8bit_ch_read'
>> alpha-linux-ld: (.text+0x5bc): undefined reference to `rz_mtu3_8bit_ch_read'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_write':
>> (.text+0x718): undefined reference to `rz_mtu3_16bit_ch_write'
>> alpha-linux-ld: (.text+0x728): undefined reference to `rz_mtu3_16bit_ch_write'
>> alpha-linux-ld: (.text+0x790): undefined reference to `rz_mtu3_32bit_ch_write'
   alpha-linux-ld: (.text+0x7a0): undefined reference to `rz_mtu3_32bit_ch_write'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_read':
>> (.text+0x86c): undefined reference to `rz_mtu3_16bit_ch_read'
>> alpha-linux-ld: (.text+0x870): undefined reference to `rz_mtu3_16bit_ch_read'
>> alpha-linux-ld: (.text+0x8e0): undefined reference to `rz_mtu3_32bit_ch_read'
   alpha-linux-ld: (.text+0x8e8): undefined reference to `rz_mtu3_32bit_ch_read'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_function_write':
>> (.text+0xbe4): undefined reference to `rz_mtu3_8bit_ch_write'
>> alpha-linux-ld: (.text+0xbf0): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_function_read':
   (.text+0xd20): undefined reference to `rz_mtu3_8bit_ch_read'
   alpha-linux-ld: (.text+0xd2c): undefined reference to `rz_mtu3_8bit_ch_read'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_enable_read':
>> (.text+0xf08): undefined reference to `rz_mtu3_is_enabled'
>> alpha-linux-ld: (.text+0xf10): undefined reference to `rz_mtu3_is_enabled'
   alpha-linux-ld: (.text+0xf90): undefined reference to `rz_mtu3_is_enabled'
   alpha-linux-ld: (.text+0xf98): undefined reference to `rz_mtu3_is_enabled'
   alpha-linux-ld: (.text+0xfb4): undefined reference to `rz_mtu3_is_enabled'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o:(.text+0xfbc): more undefined references to `rz_mtu3_is_enabled' follow
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_ceiling_write':
   (.text+0x10e0): undefined reference to `rz_mtu3_16bit_ch_write'
   alpha-linux-ld: (.text+0x10f0): undefined reference to `rz_mtu3_16bit_ch_write'
   alpha-linux-ld: (.text+0x1100): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x1110): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x11b8): undefined reference to `rz_mtu3_32bit_ch_write'
   alpha-linux-ld: (.text+0x11c8): undefined reference to `rz_mtu3_32bit_ch_write'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_initialize_counter':
   (.text+0x1300): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x1318): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x1328): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x1338): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x1348): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o:(.text+0x1358): more undefined references to `rz_mtu3_8bit_ch_write' follow
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_initialize_counter':
>> (.text+0x1368): undefined reference to `rz_mtu3_enable'
>> alpha-linux-ld: (.text+0x136c): undefined reference to `rz_mtu3_enable'
   alpha-linux-ld: (.text+0x14a0): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x14b0): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x14c0): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x14d0): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: (.text+0x14e0): undefined reference to `rz_mtu3_8bit_ch_write'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o:(.text+0x14ec): more undefined references to `rz_mtu3_8bit_ch_write' follow
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_initialize_counter':
   (.text+0x14fc): undefined reference to `rz_mtu3_enable'
   alpha-linux-ld: (.text+0x1500): undefined reference to `rz_mtu3_enable'
   alpha-linux-ld: (.text+0x1510): undefined reference to `rz_mtu3_enable'
   alpha-linux-ld: (.text+0x1518): undefined reference to `rz_mtu3_enable'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_action_read':
   (.text+0x1668): undefined reference to `rz_mtu3_8bit_ch_read'
   alpha-linux-ld: (.text+0x1678): undefined reference to `rz_mtu3_8bit_ch_read'
   alpha-linux-ld: (.text+0x17b0): undefined reference to `rz_mtu3_shared_reg_read'
   alpha-linux-ld: (.text+0x17bc): undefined reference to `rz_mtu3_shared_reg_read'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_count_enable_write':
>> (.text+0x19ec): undefined reference to `rz_mtu3_disable'
>> alpha-linux-ld: (.text+0x19f0): undefined reference to `rz_mtu3_disable'
   alpha-linux-ld: (.text+0x1aec): undefined reference to `rz_mtu3_disable'
   alpha-linux-ld: (.text+0x1af0): undefined reference to `rz_mtu3_disable'
   alpha-linux-ld: (.text+0x1b00): undefined reference to `rz_mtu3_disable'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o:(.text+0x1b08): more undefined references to `rz_mtu3_disable' follow
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_ext_input_phase_clock_select_set':
>> (.text+0x1b88): undefined reference to `rz_mtu3_shared_reg_update_bit'
>> alpha-linux-ld: (.text+0x1b98): undefined reference to `rz_mtu3_shared_reg_update_bit'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_cascade_counts_enable_set':
   (.text+0x1c98): undefined reference to `rz_mtu3_shared_reg_update_bit'
   alpha-linux-ld: (.text+0x1ca8): undefined reference to `rz_mtu3_shared_reg_update_bit'
   alpha-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function `rz_mtu3_cascade_counts_enable_get':
   (.text+0x1da8): undefined reference to `rz_mtu3_shared_reg_read'
   alpha-linux-ld: (.text+0x1db0): undefined reference to `rz_mtu3_shared_reg_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
