Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C20258ED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760185857; cv=none; b=D3Vnj8d2PM3AxA3PpfNFc/4X2trQQQ4i7pfPTKiOGI+Igwzjg+cuqv4Fnmhsj7s8cvP0og5S9tqFVmTd+hQrKhob0qbsMBQL1+lXbeQHEbV8iYQ5N8S1osjywAILuLOaY/WsK8hIGsrz0B2+matW+juSI0N8P7ri4aBEAEuHa6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760185857; c=relaxed/simple;
	bh=4ZQe1QH21/G3wVU4OYEDGTgJMn8/bOF/LpTuOIDx6lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0kgyUh7/0p3qa0vUKZ+1H0WGMDRFRck5GEm2jDzoa7FWb1Jw3ntmrktCq249hCTeBE5tGzwKT9DNl6KMZIMUryFr8DrnTNifjPFakANMekfYx+FVgTfn2MzNZ/SJ5Ns7EXrSpNlXffL5YXs0mpznHmcbxI5QTOlWQ+RO1srTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELTqWblS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELTqWblS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760185852; x=1791721852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ZQe1QH21/G3wVU4OYEDGTgJMn8/bOF/LpTuOIDx6lw=;
  b=ELTqWblS9fzzXgqWnehIpCTp0AkV+5uyds/C40utCjja4+6boTbMWZu2
   yv3yKo2hxLznVvjJ0njFdGDxwKDYmADmQPQO5QH05voVNqqO7FNZkbfI8
   0Ka6qHmz7RaSOuA6IYgCCaqDpJlCl8HLpaYEl/t1+PjPapf+C1nL4NUby
   2u5TCnkdUYaMH7Hk7N274y8syGWiiaPI+ZI152d8AJHpkRNnv6VDMxaFD
   ppjf/7HFDQGeM01+XZ/TV3qxky/mooYjDQQqg3vEJLpfmVFIbRZ+tX8L6
   awval0vBGV1RkjULLcVUsEk4V98BIH4PsxnaF4Rl4LID9hrF74FmC8QgP
   Q==;
X-CSE-ConnectionGUID: nA0Reii7TPuA388TGB9Plg==
X-CSE-MsgGUID: 0DCB6doUS36A4rpv3CLVfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61418152"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="61418152"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 05:30:52 -0700
X-CSE-ConnectionGUID: +XQb7OwbRMWvGct/k7dW8w==
X-CSE-MsgGUID: 7ugVx6tGSAGnfyCIlHVCRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="181957154"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Oct 2025 05:30:51 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7YkL-0003lP-0O;
	Sat, 11 Oct 2025 12:30:49 +0000
Date: Sat, 11 Oct 2025 20:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:asi/next 12/50] make[5]: *** No rule to make target
 'arch/x86/mm/init_test.o', needed by 'arch/x86/mm/built-in.a'.
Message-ID: <202510112033.q6VkuG4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   a6190e0f5b9d575cc97ef8289a7a6c5b0106fc4b
commit: 2cc804bf952e0feac37034ec79885be15dc675ed [12/50] KUnit test to run phys_p4d_init()
config: i386-buildonly-randconfig-003-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112033.q6VkuG4B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112033.q6VkuG4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112033.q6VkuG4B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'arch/x86/mm/init_test.o', needed by 'arch/x86/mm/built-in.a'.
   make[5]: Target 'arch/x86/mm/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
