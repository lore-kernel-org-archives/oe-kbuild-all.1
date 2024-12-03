Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7233981
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733187782; cv=none; b=I74jX42b7jlh1fyY1B1NGBKDWMe5S2s5YOLFhrxqGK6JIkaCyIEwnSLMLN3bm+iyy1i892z4vOJB2fj1eJBYkyK/PzAPIaMXEElAAiauGZtuSinFFDn2xg9uTo1hJPCap084X+d9uaAIBT/w+XfuHdrbTV/Wxa+fK7FR9KQaD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733187782; c=relaxed/simple;
	bh=4POFwrP5w7Ia/lQZSGjXnFzy6QodMbqKniWvlOsJ47M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jzfeiAXB7KeJB+PA4GkDzNximq25XMjyrvZkDfSjC7KttuPYaxbe+2Ph9tpNnf53oo6oYwto6blfnY+C0CabirpEMdPQFCjjKMf+IoxVHcez50S6862xQVZDaY4gSTTplHS+NRcehS23kJ07ePujc1vi+xKo1mUqMPlmhMwjzUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5di93Xg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5di93Xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733187780; x=1764723780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4POFwrP5w7Ia/lQZSGjXnFzy6QodMbqKniWvlOsJ47M=;
  b=W5di93Xg2k6XzwhS9uOcIluOCpSZZeJcEfc6o+T+29gFdKj3nUo8KPSm
   RWJ4voKc6fV1lV3oLN6Hae6nUQS1yViWeFLZNnw6/vVIm8+rorHpinsih
   eCcLGtTdA2rjzGn5G9/B/njEKAbB6jCJxLCTbKpz7fVNCGzj0WunzhCkA
   j+7f2ncdPZvOQaTkf2PDdP2bTY3o0Id+QSzffZERWZ1joFMeMv80IOBTm
   +Nb0mrzz9SieVKgfx/e6wtQ0kWCOjW5V10n/hbJjwR7rFoPhrOBKpZ+jR
   FaXuezWeILzD7LYIrZLW0UwM+U+W5te2jGSemWQUeBnGAlbaJVxSVkKFJ
   g==;
X-CSE-ConnectionGUID: NI0mgVuqTia7/AJNbsEFOg==
X-CSE-MsgGUID: 8/N3+ci+TQOKrWwM4/VS4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33512479"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33512479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:02:59 -0800
X-CSE-ConnectionGUID: cG7cpD1/TW2DNl7/3eJurg==
X-CSE-MsgGUID: K9X3QMJKQg2Qz8gqX9K7dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93599355"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2024 17:02:52 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHJR-000369-1N;
	Tue, 03 Dec 2024 01:02:49 +0000
Date: Tue, 3 Dec 2024 09:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:secure-concat.v12 5/10]
 include/linux/nvme-keyring.h:21:20: warning: 'nvme_tls_psk_refresh' defined
 but not used
Message-ID: <202412030908.fXE7v8XZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v12
head:   93a284266ba999106a528e21d3ce5e9662b326fc
commit: e43b364dcb5a092b3f2dd2efdc604a4ad84ca5d4 [5/10] nvme-keyring: add nvme_tls_psk_refresh()
config: arc-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030908.fXE7v8XZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030908.fXE7v8XZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030908.fXE7v8XZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/configfs.c:18:
>> include/linux/nvme-keyring.h:21:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
      21 | static struct key *nvme_tls_psk_refresh(struct key *keyring,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/nvme_tls_psk_refresh +21 include/linux/nvme-keyring.h

    20	
  > 21	static struct key *nvme_tls_psk_refresh(struct key *keyring,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
