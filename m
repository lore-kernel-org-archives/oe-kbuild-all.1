Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881517C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 00:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710549752; cv=none; b=SOi1/DuKWkHoIpaYbpdHslQHRcAEP7OX7cFvr0vWrb6Bq6GxmkXL9ykbBTvWUFaaIrcl+wBB9bgHtfQVEvQeu62ZuRX4BS7Gs5lEtyTwXa3UPVQOGq667pUWTwJICdYZJ0p99iBneuKGxpG9zjJpn5sUOfjfIrgP9x/xMXY5XrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710549752; c=relaxed/simple;
	bh=zYgVHzUYqQ+9URvNp6T38ODmjxLvOauD4taGcjZxi3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EesXNmU7RGBswm05jcMU+/6BWgVUcHM86QitORlZwAzXFxneFXcYTt53jMg6PPkJqbDDZ27IpkJ9wpqXAgTkDAfwBGWm963ahpJxRt/ZD+ZwsvJor8UhRrpoVL5Q1OXTPYdkoaHCoqPDQ/iZRaEAscEmyOdyE4Q209v8fdSLeT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhcPtA/j; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhcPtA/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710549748; x=1742085748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zYgVHzUYqQ+9URvNp6T38ODmjxLvOauD4taGcjZxi3M=;
  b=FhcPtA/jKeRcDxsHPdTTSfhYsChro4AQgI0JtYZJo6fu3Gtw2eFIed/A
   tT816gcZyUi2Rz+uEXMKYWdF4l595wPX++oCuZEIgv4YRHOtJII9oZsIN
   18+pxCIv5/sQViIFhrbu5ztxGuP8NK7RsA13E2w/5xHmsqWB9Md1cgP1i
   wKhUPKB+pSUy0BGQIGHyRWDCu4wgxpPqhYhSxJVyEz0VcuRt9q9GT0Cic
   bcJDFbDh1AVp71Knh9s47tBeg6FOZiAYwpT3NyZqoWVsJiEBSe7QNIBIw
   gjy6yYlb7O0/twMN06pw3AiC12IPsSQrxtwSugU/QrawfUANTJiWx0U5g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16583566"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="16583566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 17:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="43758359"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Mar 2024 17:42:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlI80-000Evj-2F;
	Sat, 16 Mar 2024 00:42:24 +0000
Date: Sat, 16 Mar 2024 08:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/21] aarch64-linux-ld:
 client.c:undefined reference to `netfs_write_subrequest_terminated'
Message-ID: <202403160811.7gd7rRB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   be938ad004e7a8f28cc6fc8500c120c7687339f7
commit: 0ae2fe605a739d267125eb3c62534722dca7ad41 [21/21] netfs: Use writeback_iter() and improve the writeback algorithm
config: arm64-randconfig-003-20240315 (https://download.01.org/0day-ci/archive/20240316/202403160811.7gd7rRB1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160811.7gd7rRB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160811.7gd7rRB1-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: net/9p/client.o: in function `p9_client_write_subreq':
   client.c:(.text+0x72c4): undefined reference to `netfs_write_subrequest_terminated'
>> aarch64-linux-ld: client.c:(.text+0x7374): undefined reference to `netfs_write_subrequest_terminated'
   aarch64-linux-ld: client.c:(.text+0x7394): undefined reference to `netfs_write_subrequest_terminated'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
