Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302914;
	b=1+9bgUn15mArGSwU0fvoBhAT7RgAx/dKLbMq8PGrdVOXhoWreBCZYMuS7wrr6AbsWpU/
	 WW7jEvsQ1TSHSzYOzOykNn5LQZphyB8Ue0/l1VbNSBQoddUguqrHc7KJG02Ma2nn9VStf
	 bgdlpwJEhFf8cg5NNMQh7urkaKNSs/XYzmW5bTmNBr5sjMypii7O18UM5ZmrrpWHXJQLc
	 XX6xLRp8qOMyL4wiEyujz3l8dyT3gMmazWkMsYpupu0mckTWDfHYpvgU/2tKiK6SJlfuJ
	 S0XUMa4OZX70XJWHoexIUVoO9/X5O0TNAfzalNKzfJ6XUo6sJaj/ALySVXP7OdWHAVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302914;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s5leVkL/2KXw7OuK6d1T3vsmrk9Q+eKiqOXv4Ih/4VQ=;
	b=UJpk52xXZx0rI8fNv0BN+rF5RsjI4yu8k1JW47CSGHOqk8yFW7T5wq6EGLOySe85JcPk
	 nyeAY47N463lunp/Jl9Xln0Ir14xNFlgpZ5JjjxENXdZWPWBoehK90DNf4KXYhBK/2heq
	 HmAy6jLKP/BmB5O35mwjZW3Fr482toaiZf/iur9EEe0ugp0mtEErNL46oHp9rrZunzID5
	 +0pSFxVCHLYMCO2Wle9QcRf8Px6t4Q4dkdokdzUavHEwobgW42H6nyQjlqiLdngmznCme
	 0XAPrE1YAnvrxD1uaSNGCv2i6nfZzWscs6DLXtqsvHFSGexHgOqFG/srFO9LT54+PMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FTyW+3ZI;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E7606BF24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 09:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A0E7606BF24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FTyW+3ZI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794302913; x=1825838913;
  h=date:from:to:cc:subject:message-id;
  bh=EZXS/PW8Fw+w0NNkBkkzc7zWOj0A37jwbOFbpP/HzhQ=;
  b=FTyW+3ZI307Aqfo9SHJ1OoUcNbdBDs6/TcA7RAc/Fv4YDq2MRgxFy6+M
   LDT6603QH8s6y4RRrDUI2dOOez7UgN4V0Cre0c8kg6EhsZdNMfoDu+lT3
   hD5PVMHmoYkU0Fv8TljoCykrOeL47WYRY0ZprOdKCs9a0/UG/Bs1TEv/E
   9mkppujJTpL9UYLi8bAFgAtXFLb1jHieDDSebO6iUl9SDqV0UkQDZJ5oC
   kLA7N1oTi3inniBg0JPSBsXUw9B1j3/7a7U6nTyS5ZZf0zXMojIZCNpEm
   xxwiL5oEJ7Fu7LVdPavP8jPEhKu16Xz0Fp/ZMk37/G6nzrGkeH6Ed+9cG
   A==;
X-CSE-ConnectionGUID: fXIn7r2WSu6fcNq78Hg/7A==
X-CSE-MsgGUID: +acj+ojdRSO1BKuRIq49qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3032202"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3032202"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:28:32 -0800
X-CSE-ConnectionGUID: XOqCikYKTh+GwraTnSkZbA==
X-CSE-MsgGUID: Tnk28WWCT5G/vNKkbHotjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8277582"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2026 01:28:29 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQi9T-00000000wWZ-2hy2;
	Tue, 10 Nov 2026 09:28:27 +0000
Date: Tue, 10 Nov 2026 17:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 1/1] Warning:
 drivers/md/dm-default-key.c:50 expecting prototype for struct dm_default_c.
 Prototype was for struct default_key_c instead
Message-ID: <202611101706.jtuBCJkZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   4391a92327528479c6bf80ea286a37b872917b9b
commit: e9b494f04d4f01eca4146d044b6143afde11c3ff [1/1] Merge 2b60145734a0 ("Merge tag 'wq-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq") into android-mainline
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261110/202611101706.jtuBCJkZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101706.jtuBCJkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101706.jtuBCJkZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/md/dm-default-key.c:50 expecting prototype for struct dm_default_c. Prototype was for struct default_key_c instead
--
>> Warning: net/netfilter/xt_quota2.c:47 Cannot find identifier on line:
    * @lock:       lock to protect quota writers from each other
   Warning: net/netfilter/xt_quota2.c:48 Cannot find identifier on line:
    */
   Warning: net/netfilter/xt_quota2.c:49 Cannot find identifier on line:
   struct xt_quota_counter {
   Warning: net/netfilter/xt_quota2.c:50 Cannot find identifier on line:
           u_int64_t quota;
   Warning: net/netfilter/xt_quota2.c:51 Cannot find identifier on line:
           spinlock_t lock;
   Warning: net/netfilter/xt_quota2.c:52 Cannot find identifier on line:
           struct list_head list;
   Warning: net/netfilter/xt_quota2.c:53 Cannot find identifier on line:
           atomic_t ref;
   Warning: net/netfilter/xt_quota2.c:54 Cannot find identifier on line:
           char name[sizeof(((struct xt_quota_mtinfo2 *)NULL)->name)];
>> Warning: net/netfilter/xt_quota2.c:56 bad line: };
   Warning: net/netfilter/xt_quota2.c:57 bad line: 
>> Warning: net/netfilter/xt_quota2.c:58 bad line: #ifdef CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG
>> Warning: net/netfilter/xt_quota2.c:60 static int qlog_nl_event = 112; error: Cannot parse struct or union!
   Warning: net/netfilter/xt_quota2.c:200 function parameter 'q' not described in 'q2_get_counter'
   Warning: net/netfilter/xt_quota2.c:200 function parameter 'q' not described in 'q2_get_counter'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
