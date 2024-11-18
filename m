Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5EA360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731888457; cv=none; b=CT4FKPBVd3raG1TxRF8baGUMVN5zTEwsHo/cTzITp52qN1Qi8LNO+lJ0VGF4r/zMnfad37907UD34a0Z+KLzPwNdmHdJYaWU6OYj+77KZlrUUBzpzgim0yml1KQ3GqcxGc1tmTIpfGO1xiZ/faqDyN9QipIa46B7bqjPj5KU43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731888457; c=relaxed/simple;
	bh=a5zo/AwwvvQolzEt20IxLWMN9CkfA4h3WfEyxfhu4LI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AzIYvNkIxh9hW+EaSMuklq1KfW61h7xYwyGXGacmuU2vSE5anKxF6kEJXtLX/1cywJINN3VgqYhO2DXbE4nQrXWZ7oxPMLmVm3uoLqMxEv4ERgymR3e0sSRvmEijLtJxTj9xsJXaSBG/HxVnLHvqOSuuO+Bre7ou4jLQZsSO1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aETHrLYM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aETHrLYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731888455; x=1763424455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a5zo/AwwvvQolzEt20IxLWMN9CkfA4h3WfEyxfhu4LI=;
  b=aETHrLYMMPK8GE+It8JjvXOtLUmh9t4iB4cBxYkqKiskqv/RjldqXsn3
   M7jlxpL78RiygUottiimpeoCbm1PwIUJMzcSvcbnskuY58pFvXvqvje+u
   ZfuQ86Ba69P+TrkcDZHE5nRxywsCbglHiI285GHjqUI84aSWyY5OUQdgo
   bMMbZ6jGGl083q/CX2a2dyv5qK+k2cdifJRPdCE564C2GaOIhah5qNOed
   PnW2soeqZ99wssdErRFG9+PC5Kp1GA5orMFWgsDW5sh2JdraW6Os5yZME
   C415IHHtJ/j/pOqtVxXMB36ASauY5scyeYbIOw8MSj35MPqNR3/ZpOscp
   g==;
X-CSE-ConnectionGUID: fR5xX0bqSeObkczEhUrfFg==
X-CSE-MsgGUID: vo7J+PmdTiCgDiI8hY8irg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31679429"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31679429"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 16:07:35 -0800
X-CSE-ConnectionGUID: 22hsaqBFQ6KwPgrJfUKOIQ==
X-CSE-MsgGUID: 52FUon80TZ2hVgVrOsbE8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93526988"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 16:07:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCpIg-00028b-2e;
	Mon, 18 Nov 2024 00:07:30 +0000
Date: Mon, 18 Nov 2024 08:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 57/64] ERROR: modpost:
 "minmax_running_min" [net/rxrpc/rxrpc.ko] undefined!
Message-ID: <202411180802.wegeqtb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   2f36eeb32c6d169f6def5f26b80a769ce6e47821
commit: 4edfde64fe9c9f12a4681434d61f4a70e1f7dfff [57/64] rxrpc: Generate rtt_min
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411180802.wegeqtb9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180802.wegeqtb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180802.wegeqtb9-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

net/rxrpc/rtt.c: In function 'rxrpc_update_rtt_min':
>> net/rxrpc/rtt.c:133:25: warning: integer overflow in expression of type 'long int' results in '705032704' [-Woverflow]
133 |         u32 wlen_us = 5 * NSEC_PER_SEC / 1024;
|                         ^
--
>> ERROR: modpost: "minmax_running_min" [net/rxrpc/rxrpc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
