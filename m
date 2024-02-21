Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2033F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 21:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551835; cv=none; b=RkfbjHSoyUbH4gHNNFrfW9RKaDEmxNK4OgsqL4hRWQF3nDKUtJWp5jXQSTxaEKQdGmqZ87plqTJi9beHAnIPTDn7TK7QioHeoYyoYVPEGv/W6ntncZRtpWqflrjRfSmZgzgyYaLdPe3IUb/Dq7N9FGM+fZGMOvhucL5yF/YprLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551835; c=relaxed/simple;
	bh=x2utgjD1rmn+xvPVt3ijWvVFec4R8LXY6aJI2keoiyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWA3MRelLMlJAWy0hM+A460j1xsVfHC5U7HEKq5sl0bVqMlACD5AJZkszPED4uLeAskeb/oiILqz5mxWN747d34IMuCUsGuX0O0rYUQp9CCUV3DTYyipaIpma6TgbHEQBfcGsw+4Pj97rPgQMHQLWWMkCvB7na+YuFKVb3KvM7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+juIxF6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+juIxF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708551833; x=1740087833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x2utgjD1rmn+xvPVt3ijWvVFec4R8LXY6aJI2keoiyQ=;
  b=g+juIxF66q41mX3U2B/ZDsO6kQJtf7iNabs0ec41yqdnMaQBquc3muuQ
   7JzEMHvGM6MWFPbCqNOlxnI1gPX+iv/idNPRD5g9bZUm7Jsr0Bku9Y+KV
   seMsyzVQ91uFVnWhQOB9ccxjoZOq7XQfFtQ3ZWk/GY7v0HRf/MYXbGBBE
   ZLS4vGKfslNfrNSEPg5flY23+QNxKCcvYbsdynciyiTwGz2YX+f2nAWTS
   l8GZcsO2DE3tlipgCf6O0aztO1YAH4sXBGfKZLMsWl5NDnEuZMj5U39Bz
   ZzlQ1q9YlQgpYKmQ/fCO3ZSkZO3sK9OHX/0jcBhTCKC4F11rhj1f2WTHZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14163429"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="14163429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 13:43:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28399493"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2024 13:43:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcuNY-0005jc-37;
	Wed, 21 Feb 2024 21:43:48 +0000
Date: Thu, 22 Feb 2024 05:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-for-next 1/1] scsi_debug_main.c:undefined reference
 to `prot_verify_write'
Message-ID: <202402220524.hKY3uBay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-for-next
head:   c39613cd636d1827a559c8ddf8bf6eaa8a8dbc44
commit: c39613cd636d1827a559c8ddf8bf6eaa8a8dbc44 [1/1] scsi_debug: Make CRC_T10DIF support optional
config: riscv-randconfig-r052-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220524.hKY3uBay-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220524.hKY3uBay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220524.hKY3uBay-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/scsi/scsi_debug_main.o: in function `.L3197':
>> scsi_debug_main.c:(.text+0x11838): undefined reference to `prot_verify_write'
   riscv64-linux-ld: drivers/scsi/scsi_debug_main.o: in function `.L3428':
   scsi_debug_main.c:(.text+0x12794): undefined reference to `prot_verify_write'
   riscv64-linux-ld: drivers/scsi/scsi_debug_main.o: in function `.L3528':
>> scsi_debug_main.c:(.text+0x131a0): undefined reference to `prot_verify_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
