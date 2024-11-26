Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF91DA63C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 17:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732643184; cv=none; b=dEi+SIdVqZ2UPMD3+oMuo+wxLuVV0p5Atc3bR1uCfprdkypyqOnYcZbJh7EiwEkyt/LmWSAkqaraq/QEH62pE/huWq0iDZwGMOSU6m9OT41l60T6AjWgbD2L/NWH5NadtqS7RXTQymsZRajslWKPfAd2+FG6YGYDzP07xU0wjgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732643184; c=relaxed/simple;
	bh=BMa5/bXYc5Z7XA++LL3G3T+8iEHBPsz3V6xDqYT5yvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTrqDRVJ2c4DOm9d1Bx6/JruF0J4T/AHjevefO4eJ5NA3vpJMw5frz5wwBNwn3wQ/9gKqeFPZ7GIEgAfGTUtkh0dqmlQ72dEbpFA/zwg+Qsx81LLOf63ZiUMN7bhpMVqKqx78B6qdWiBSKljAwymNApkNfOyyI9OHrXfTK085y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkqP62qz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkqP62qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732643182; x=1764179182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMa5/bXYc5Z7XA++LL3G3T+8iEHBPsz3V6xDqYT5yvQ=;
  b=mkqP62qz/MXO+fmQng4xrnXwfo4Iqo+/LPG52+W0oXQM5cA/PkIGWUvQ
   rsT5dSGSAmo4G1UJegvizjHPO7VYQiWXNptqfVPVNJ+KaMAG7We1IYGhk
   8bg6CnwmfE7xH9mc8mWCyox8p83+gBjPYH8q28YnmxF+CkVxJZMOs2TcS
   RccxuiNk92tmwnlgdB+YHKGVAUpV1MTqn8aXSlTBgXQbQD6SiA9aYzxTB
   PBW6/hGotmWyszt2zZAVX+8nKKL765vxOU6d4TXfurVVABmcSTtcCCV1r
   QyYazi1mcnQuHjxg0Auaw8/kU+l6GJdi0pEmoU2QPv5IL0YLrWIVKlTTU
   g==;
X-CSE-ConnectionGUID: GcI3dilUTuCyi9MbL96rKA==
X-CSE-MsgGUID: MJQ6OhcqQn2CivyxsakmfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44207975"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="44207975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:46:22 -0800
X-CSE-ConnectionGUID: okpzxB+PRBatwZEwKTBYAA==
X-CSE-MsgGUID: gg048xEpQ82JFrpO7RRt0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="91633042"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2024 09:46:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFzdi-0007Sd-0I;
	Tue, 26 Nov 2024 17:46:18 +0000
Date: Wed, 27 Nov 2024 01:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Subject: [linux-next:master 2363/12757] rust/helpers/pid_namespace.c:6:22:
 sparse: sparse: symbol 'rust_helper_get_pid_ns' was not declared. Should it
 be static?
Message-ID: <202411270156.WAADCrxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed9a4ad6e5bd3a443e81446476718abebee47e82
commit: e0020ba6cbcbfbaaa50c3d4b610c7caa36459624 [2363/12757] rust: add PidNamespace
config: um-randconfig-r111-20241126 (https://download.01.org/0day-ci/archive/20241127/202411270156.WAADCrxb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270156.WAADCrxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270156.WAADCrxb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/mutex.c:11:6: sparse: sparse: symbol 'rust_helper___mutex_init' was not declared. Should it be static?
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
>> rust/helpers/pid_namespace.c:6:22: sparse: sparse: symbol 'rust_helper_get_pid_ns' was not declared. Should it be static?
>> rust/helpers/pid_namespace.c:11:6: sparse: sparse: symbol 'rust_helper_put_pid_ns' was not declared. Should it be static?
>> rust/helpers/pid_namespace.c:17:22: sparse: sparse: symbol 'rust_helper_task_get_pid_ns' was not declared. Should it be static?
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/helpers.c: note: in included file:
   rust/helpers/spinlock.c:16:6: sparse: sparse: context imbalance in 'rust_helper_spin_lock' - wrong count at exit
   rust/helpers/spinlock.c:21:6: sparse: sparse: context imbalance in 'rust_helper_spin_unlock' - unexpected unlock

vim +/rust_helper_get_pid_ns +6 rust/helpers/pid_namespace.c

     5	
   > 6	struct pid_namespace *rust_helper_get_pid_ns(struct pid_namespace *ns)
     7	{
     8		return get_pid_ns(ns);
     9	}
    10	
  > 11	void rust_helper_put_pid_ns(struct pid_namespace *ns)
    12	{
    13		put_pid_ns(ns);
    14	}
    15	
    16	/* Get a reference on a task's pid namespace. */
  > 17	struct pid_namespace *rust_helper_task_get_pid_ns(struct task_struct *task)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
