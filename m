Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0052C33C198
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789214996; cv=none; b=eaAjpEkXhf7E+C2g1BJ+p28t4C0uNwV/hlUHFQSA9vHupOwoS343mnn4yYK7w5dFz7lJWMAvH5bOo07JBKb9i6DN9b3WvTLtZbh3ht2OzgqOzk08ZQlb/jcAnRlIKWfYieLw8AXtoaDN1e2GxuXoTg2jmzQqMlZNg+dWxhQEHUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789214996; c=relaxed/simple;
	bh=drjHOUOGKSHs66md94K6G1lMAzAWmoqu9cekFFZ/8vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D5/edCf0WUMBKEYsVqeCY4sncMtxaZPcKKWCpeuRpqU5ZryZIZ0x064RR0rVdlCn+NiO45pu9iYz7xJAtShQTGvONSMLmHatIgrgilhOYXLLJtBso6/gRFb4l8XxJA0gBldPi7X1gcZ+bgDGDQ7lCRf93x6JIaqvkWJTgI2fFEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9uJqzq/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9uJqzq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789214995; x=1820750995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=drjHOUOGKSHs66md94K6G1lMAzAWmoqu9cekFFZ/8vs=;
  b=L9uJqzq/5rvZFWzxaUw7OH5KPd7dbVq/9Y/Kn6RNjja6IJLeVK/y75tE
   n3R0pjcYaAMblcY8X75ne/oYG3Mhqerelex1FCTuEp2MqZtGjKhJoHR2q
   8kq4IKd3LfcgzHQMmXeKL0maIuwR+U75tNDfL0KTOAEIMkjUESZpFxm7o
   +g2y8dACOlmbG46L8t8ZSzVQRx1lNgrVnHEi2WNboZtnvpr2XXHdO+R0R
   NttyCDpB7Ov4md+eDOHiF612b9KAntFVrk16Sh87g15pniP9vuJhaszuP
   E9CvmN5glcre5BXKeFEnby5JwQslp7DtOPp8eJmDE7UWXPlc7Y6anEMpp
   Q==;
X-CSE-ConnectionGUID: U8+IoPQxQHmIU2utFhjI8w==
X-CSE-MsgGUID: LG8LayZdTC26PvT5KhjCDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="107028064"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="107028064"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 05:09:54 -0700
X-CSE-ConnectionGUID: pnyOQJT4RxWCN4dBKN0+vA==
X-CSE-MsgGUID: oXwbx8TTTSyiA+YwHkj46w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="412681"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 12 Sep 2026 05:09:53 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5MYH-0000000015r-4B5d;
	Sat, 12 Sep 2026 12:09:49 +0000
Date: Sat, 12 Sep 2026 14:09:05 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 16/42] Warning:
 kernel/time/timekeeping.c:256 function parameter 'mono_converted' not
 described in 'ktime_aux_before_mono_and_convert'
Message-ID: <202609121450.VyUyfsg9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   368883ddc7ac709883254193a4588fdf9b2da65a
commit: 815c6e1f4450ab55c2d456a43121bd9556bc83f0 [16/42] timekeeping: Add facilities to convert between monotonic and auxiliary clock timestamps
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260912/202609121450.VyUyfsg9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121450.VyUyfsg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121450.VyUyfsg9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/timekeeping.c:256 function parameter 'mono_converted' not described in 'ktime_aux_before_mono_and_convert'
>> Warning: kernel/time/timekeeping.c:256 Excess function parameter 'mono_coverted' description in 'ktime_aux_before_mono_and_convert' (did you mean one of: 'mono_converted', 'mono_ref')
>> Warning: kernel/time/timekeeping.c:256 function parameter 'mono_converted' not described in 'ktime_aux_before_mono_and_convert'
>> Warning: kernel/time/timekeeping.c:256 Excess function parameter 'mono_coverted' description in 'ktime_aux_before_mono_and_convert' (did you mean one of: 'mono_converted', 'mono_ref')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
