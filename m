Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157F426D4C0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754586650; cv=none; b=UdCeX7RdfQ8NDCOSxWxCLzhwwHMuA2waY6L4nBokyu68rScB3mNiFD7P+7J7PH6mlMbgOuT/u5pRah+5vLNUWm9Ggl6YRZ+6kiuMT6gFx/bZk2CEIKKNvOvVpLIXiR5C3mPXRmYq1KnwcLGGdHuHxhvnH4xvEJ0eOW1RCpd7RGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754586650; c=relaxed/simple;
	bh=Y38UI/7O/dLQom3TFYwIG5afvOxlm/YYZzcfPmScoZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQoCl4WM2erfUwZhBT4Ectz1vCF6BlsUZmehTovWx/3w9onDVhCmUfk6CvWAolwF3m84Le7Nt7DLkafc5egesLoqv4DLhoPTLjOWE3EF+JdMhsbLc17Ou93hJrwJ9PPzqT1c5jEE6l5ynjMUgaGYNjwfgk3uZN8Uq2ynDJ2TdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUr8h8hg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUr8h8hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754586650; x=1786122650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y38UI/7O/dLQom3TFYwIG5afvOxlm/YYZzcfPmScoZw=;
  b=kUr8h8hglu5bAEylXBk/cYhLX7VRqutvwI/nZzf7hCeyJmzEAW7NjeFj
   gwsvaVSLfmE+f0chYWVOFfN90NAjXhXEedJZwUpcKPGGFLcA5NPTmIM1C
   wue+MX0F7XZRjNHnXDC4WoIM7YaGObK9YRtFbRJNMBgGs4GvNskcVK0cN
   lwXYQ4hW4x4NcXeWRNUKkFELFJbWUoKi33BnLu1SzE/RFIci/P2uSVufA
   jioe9Tmpcz7g2mjZ4c07+aCvVf3+4vJxuDejmGirt5QGua1pt/gDiCOQl
   wRqKKfkR/mQdyeP05ry2hWfUG7qBYwTjuukRIN/7nTGKP318wK+30qV79
   A==;
X-CSE-ConnectionGUID: jPQxzPigQNWEHnOobX4uxw==
X-CSE-MsgGUID: /m4DWmLgTciz6rgoaQs1kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68388991"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68388991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:10:49 -0700
X-CSE-ConnectionGUID: i6A5qj8PRSCet1NAqpUvlw==
X-CSE-MsgGUID: jwTPk0WkTZimWF9LLD2TQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164345348"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Aug 2025 10:10:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk48I-00032C-32;
	Thu, 07 Aug 2025 17:10:33 +0000
Date: Fri, 8 Aug 2025 01:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: prey169 <francisdrossi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/932 260/261]
 fs/bcachefs/sb-counters_format.h:129:27: error: label at end of compound
 statement
Message-ID: <202508080034.o1yK71Oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/932
head:   590c23c3974360a4fca96bbfeeb79bd860a5645b
commit: baec94c2772407d9791a3560e7fbf5f3042a1876 [260/261] Switch statment evaluate ids and confirm they are unique going forward
config: arm-randconfig-004-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080034.o1yK71Oq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080034.o1yK71Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080034.o1yK71Oq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs_format.h:524,
                    from fs/bcachefs/bcachefs.h:218,
                    from fs/bcachefs/io_misc.c:6:
   fs/bcachefs/sb-counters_format.h: In function 'check_bch_counter_ids_unique':
>> fs/bcachefs/sb-counters_format.h:129:27: error: label at end of compound statement
    #define x(t, n, ...) case (n):
                              ^
   fs/bcachefs/sb-counters_format.h:106:2: note: in expansion of macro 'x'
     x(error_throw,     93, TYPE_COUNTER)
     ^
   fs/bcachefs/sb-counters_format.h:130:9: note: in expansion of macro 'BCH_PERSISTENT_COUNTERS'
            BCH_PERSISTENT_COUNTERS()
            ^~~~~~~~~~~~~~~~~~~~~~~


vim +129 fs/bcachefs/sb-counters_format.h

   126	
   127	static inline void __maybe_unused check_bch_counter_ids_unique(void) {
   128		switch(0){
 > 129	#define x(t, n, ...) case (n):
   130	        BCH_PERSISTENT_COUNTERS()
   131	#undef x
   132		}
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
