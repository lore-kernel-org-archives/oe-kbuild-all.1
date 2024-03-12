Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C9142907
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 21:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710278424; cv=none; b=OgLYrOMjzztF2skdYXSg73cAZNPxI9sqXhjXLFbGW7CTuqeEqcsMVCnQGSwXoW1O13AkZAg5tCvYoN2Lg0JS16Y9rZPJw0o5V2Um4VnNyAuEzF7PA5MSHTd3npo6Svv2gTLe8ep2UZonIGCY1FypsgbOEEfTwO4LmZ+xf3Zqg0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710278424; c=relaxed/simple;
	bh=F2lZ3mc80BSjnjwph8GqHoJG1Ffcwa561moXxKwFS4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDHgDWsfJKrLtcxxCH2g0h6R7YwTONRT71strtKfx5SEVUnYDr/CH2gQugWe1bt+GDRvNFTPOR10byh8pLAHf/xbfQYDO4iNUC2xbtZxJZOe/jXKXXIzmby+xbS4NX2qyoGQkQ3KMAwRikYcstqvtD4zs+1uwK2ulTUWtEVVuvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QU03ZLYw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QU03ZLYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710278423; x=1741814423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F2lZ3mc80BSjnjwph8GqHoJG1Ffcwa561moXxKwFS4g=;
  b=QU03ZLYwSbhR9oL+RtFJXALHQRQnMuj+KALG7KEg3eqPtlq7pVFBEzZA
   exrW9FVUM7AutL/vPQJ01IpJ+90RKhXUUBTaUeuS6TT5nlMIOrlvislwI
   9RxvPBsQnu6nfw3TNFC+/c0hBpbbWE5hCqz6MC7hc9p6wd23/uXMweqU+
   J3BCQcfrXh0OkAN32V1USGbTjasjiVo5Bs+36L/eiO4TsUB7DKYDr1u/5
   jfn5GkXe3Fll2vNcEVhbUlI3W5G+rZ+z+W35FDpIZokNvzRWFAfNOqx2b
   aZZCPMUNwx+6NEC2c8OSpUPeqKKmzzbQhflwuNMKeFkksrF5AhG3JfdBw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5144172"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5144172"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 14:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="34829361"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2024 14:20:20 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk9Xm-000Bgd-1F;
	Tue, 12 Mar 2024 21:20:18 +0000
Date: Wed, 13 Mar 2024 05:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 1546/13337] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data31' from `kernel/ptrace.o' being placed in section
 `.bss..Lubsan_data31'
Message-ID: <202403130532.8ECfgZ6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a1184cae56bcb96b86df3ee0377cec507a3f56e0
commit: f568a3d49af9aed813a184353592efe29b0e3d16 [1546/13337] bpf,lsm: Add BPF token LSM hooks
config: powerpc-randconfig-r024-20220921 (https://download.01.org/0day-ci/archive/20240313/202403130532.8ECfgZ6p-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130532.8ECfgZ6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130532.8ECfgZ6p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data31' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data31'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data31' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data31'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data31' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data31'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
