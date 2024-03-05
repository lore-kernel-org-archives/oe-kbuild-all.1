Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03CF7E581
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 23:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709681948; cv=none; b=Wa+y2AP7YU3WiB8rwgENLMmHVbLUnrjH4q9xl+qQXT0L+fC5rfh5p/BaEIEYlXP0IfggU1QAdyzEOCAK1k9pmESsfDo/eyjwfGb2+f2Se3KXLEu0vv6Gjxm9ZslL7JQmj/IMXOW0CK/AzVFodlmc5j5Ed59GcXkEy/FLJOsg2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709681948; c=relaxed/simple;
	bh=bvtLEKHXl8mNW/WiOhDkkKmagqxochrrj3gMDiMRK+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bt2jQ3TDvY1mriuMRQfCxH0eRuI4jYwgaeTqcXOXPq/nwGFLuAqjDs3L0B1+fOy9Vsjwf/AjaWX/0XH/dY9igzx/+DEOirB2z9nrViiPAxez1nZNwD/6Fi2qMoM6ghnqN6CCHurq7UUEFgUKlYfpOiN34C/Pb3F7J0Dgr6K05HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5b0rMYt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5b0rMYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709681946; x=1741217946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvtLEKHXl8mNW/WiOhDkkKmagqxochrrj3gMDiMRK+I=;
  b=k5b0rMYtvNaidZEpEPmbEipOk9R1FOUjmOZl7h4Jq9HxPN3DUleja5Na
   YCiSoObVsWnrK4VHTTh3Noc21oapi5LrK6lg51uN0NUbCDyQTYSxlaGN1
   9TwCqWqUyyatyk+UDhdFeml6a0XCwsTm57qvAE3lF6TLkAm5vSBinB6Uk
   ghrgyX78fTYqQt/kMg3Ey+/f6zgNzWCoZ9aphQ4CCSKYAzg5KUMlmexKk
   uu+Z0Xbkw5LsjYyCMENy9CwLoOTFTr2ZGY6/fsolh4kpLO6Dz1YlGGOov
   qd5Ub5ZTo7+3jxeTBJ0qB0QF1DPQywW2tiOPvJeBANsF4IFytx1cddXeq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21725098"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="21725098"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 15:39:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9444472"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2024 15:39:03 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rheNB-0003kH-0B;
	Tue, 05 Mar 2024 23:39:01 +0000
Date: Wed, 6 Mar 2024 07:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>, Jens Axboe <axboe@kernel.dk>
Subject: [brauner-vfs:vfs.fixes 3/3] fs/coredump.c:923:40: warning: left-hand
 operand of comma expression has no effect
Message-ID: <202403060728.Y1kmJLFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   4630f2caafcd87230ec0503bf3e809fd5367a407
commit: dc12d343473e426a5a0f48bf5d472b5f19b08276 [3/3] coredump: get machine check errors early rather than during iov_iter
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240306/202403060728.Y1kmJLFq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060728.Y1kmJLFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060728.Y1kmJLFq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/coredump.c: In function 'dump_user_range':
>> fs/coredump.c:923:40: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     923 | #define dump_page_copy(src, dst) ((dst), (src))
         |                                        ^
   fs/coredump.c:948:58: note: in expansion of macro 'dump_page_copy'
     948 |                         int stop = !dump_emit_page(cprm, dump_page_copy(page, dump_page));
         |                                                          ^~~~~~~~~~~~~~


vim +923 fs/coredump.c

   920	
   921	#define dump_page_alloc() ((struct page *)8) // Not NULL
   922	#define dump_page_free(x) do { } while (0)
 > 923	#define dump_page_copy(src, dst) ((dst), (src))
   924	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
