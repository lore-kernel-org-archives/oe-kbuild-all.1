Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263C14BF92
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772822139; cv=none; b=frw+Lc+Bd7rjjRVDCTzi0fB6EcQGH8SnuA5hDRoTBb/2e+23IHKD7ZUENnTbJ+JUebSQUEWwyOThLy0HVDUwfHzCasB8LXAuyanbRRXk8EjJZ2iI8Qwc1GbSfdW8EAX2qu4q5rRwz569X1Y8kES7eRLTHbhg6yq5EMNUmOnDM/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772822139; c=relaxed/simple;
	bh=kmZjjSiuLBYvgcc1pXOatvZsm8PEOVKnaVSem0/g2HA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RGkK4FLFNuQH6DGGellp8FzoAVXwUGPZGJ2N6HFWWAP1NyOOKwEHAis+2tbOZp8lE8+HSLxi2I82zdfU9ct5fLuC39Ur186NKgPhSB6Q0blCHYEyDUm49NWytp0TNtk5QZl21e1skDu2vvcBTK04uZragMs6D+AXVxPdixA0xnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fhv4VNAf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fhv4VNAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772822138; x=1804358138;
  h=date:from:to:cc:subject:message-id;
  bh=kmZjjSiuLBYvgcc1pXOatvZsm8PEOVKnaVSem0/g2HA=;
  b=Fhv4VNAf0boWY/yBAqBZRoJZn5MokVlrCKYDj49DZXV41vQ5/vWvpPxN
   YcMJUJ0lFTFFEV4Llfofr8kogOSu4+ZJPVZYqLYOuclSIeS/qARKnfz7z
   9OiHzhUW/5dqDo1x+UztTShAHh+GycTj1q5ij4WQs8pjrDezWxH5shFUg
   hl+JLXI7QhF1qqGhV3d+IXM4IrBy7BAhM74fo3h5+b2WRcF8ga/1Izcv4
   WVMnzM3wgfmyqzQhidutDgnv67SehbL/GbEddE9Kve2yQJEjjhw8jHO9u
   rMaK6t4+/s5WQYk52sL8T7qIjd1RiFHH8rYb0/etzasdpfAxRzrJGTY1z
   w==;
X-CSE-ConnectionGUID: FI1+ADfcRjak8sRZUIsNFw==
X-CSE-MsgGUID: GwwPwXP/TQScegQtrZeYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77785287"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77785287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 10:35:37 -0800
X-CSE-ConnectionGUID: 61bhAVUDSmuKaS8SL3x6zA==
X-CSE-MsgGUID: jBciZKk2SzW4Cq/8G0XdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223577094"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 10:35:36 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vya1N-000000001EJ-0eVE;
	Fri, 06 Mar 2026 18:35:33 +0000
Date: Sat, 07 Mar 2026 02:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 8/10] kernel/nscommon.c:139:31:
 error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
Message-ID: <202603070252.erKBYRsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   4d7cad2f077449767de4cc8ab6d869f080a121a2
commit: f47f26c89ec2f958b9f90f1fe8b4a011b7cb4224 [8/10] fanotify: add support for watching the namespaces tree
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603070252.erKBYRsN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070252.erKBYRsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070252.erKBYRsN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/nscommon.c:139:31: error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                        ~~~~~~~~~~~~  ^
>> kernel/nscommon.c:139:31: error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                        ~~~~~~~~~~~~  ^
>> kernel/nscommon.c:139:31: error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                        ~~~~~~~~~~~~  ^
>> kernel/nscommon.c:139:31: error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                        ~~~~~~~~~~~~  ^
>> kernel/nscommon.c:139:31: error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                        ~~~~~~~~~~~~  ^
>> kernel/nscommon.c:139:31: error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                        ~~~~~~~~~~~~  ^
>> kernel/nscommon.c:139:31: error: no member named 'n_fsnotify_marks' in 'struct user_namespace'
     139 |         if (!READ_ONCE(owner_userns->n_fsnotify_marks))
         |                        ~~~~~~~~~~~~  ^
>> kernel/nscommon.c:142:2: error: call to undeclared function 'fsnotify_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     142 |         fsnotify_ns(mask, owner_userns, ns->ns_id,
         |         ^
   kernel/nscommon.c:142:2: note: did you mean 'fsnotify_mnt'?
   include/linux/fsnotify_backend.h:997:20: note: 'fsnotify_mnt' declared here
     997 | static inline void fsnotify_mnt(__u32 mask, struct mnt_namespace *ns, struct vfsmount *mnt)
         |                    ^
   8 errors generated.


vim +139 kernel/nscommon.c

   127	
   128	static void ns_common_notify(__u32 mask, struct ns_common *ns)
   129	{
   130		struct user_namespace *owner_userns;
   131	
   132		if (!IS_ENABLED(CONFIG_FSNOTIFY))
   133			return;
   134	
   135		owner_userns = ns_direct_owner(ns);
   136		if (!owner_userns)
   137			return;
   138	
 > 139		if (!READ_ONCE(owner_userns->n_fsnotify_marks))
   140			return;
   141	
 > 142		fsnotify_ns(mask, owner_userns, ns->ns_id,
   143			    to_ns_common(owner_userns)->ns_id);
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
