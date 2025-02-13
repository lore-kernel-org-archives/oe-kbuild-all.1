Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7395202F90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739461857; cv=none; b=uGyA5gp90FvSRwdk7B5PDktxRl8H5WZCEQhRzmXpzQATIUTJOJyX9TZ/hVkaX7PwOc8BJWziKNQJ+Tj/eR1BPc/NqmW1s//RxP0fqR4qaCfBP6d4g84sJP6sDPZFg6HaGr47lxvnaTr+jO6KG8bSj/P4L+HRkFsdI20wFNqcztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739461857; c=relaxed/simple;
	bh=wj/7U3tBJGXTbyZ1bQdMa3XdpWjOUa+5Mw3qqrQVTpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OM4VceWAgFklO6xvCI+Js6ZFTgWHSr4cpS7wXOXT5H8tIh9NvBaRoC9wDdC4Jx+b8afllR6qr7hZGS+/El4Q5EFRAvwrmZZs7VIACVGyBNgGP6nbXy7KEdvExyl77umA5UtUpoAfI3nF+KVvCA+Qq8QFjd4WLrI4lvxaBHlNZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZvyqi/V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZvyqi/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739461855; x=1770997855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wj/7U3tBJGXTbyZ1bQdMa3XdpWjOUa+5Mw3qqrQVTpE=;
  b=SZvyqi/V7mKgC/YXEW9hFVbOyN4sJ11K3yL1ripNzhznfuAOfZgyOwcV
   LpHXtx41HNwunt5C6cJ9SnCcUAce38mJipA3d+84Hs0KsfKj84CFqW6n/
   BIeyFHAt9YcCCcp58KNh36w70BzBVdylurJmbMiaqbqxVkdQF/BtDRyxf
   QnYA6oQif0oBhJpbU2KRXOrBSnEz36+bNK0CUvxmjvQQ4ZBSwVut5i5s0
   BX11CJAMgtO0mZ0b7IH8rvJGh/mMw47RZInFJDgX+tx+x7vDuw2+cCoy8
   tkCnBCIe9ekYhcI/gl5KiwGzsKZoV0udBRZdPbszBZCDBOuUtV6BQyh0B
   A==;
X-CSE-ConnectionGUID: mucYrckMQ1ak5tlOLmR0ow==
X-CSE-MsgGUID: psUJLdHITa2mxCdn5I2Zhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50817243"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="50817243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 07:50:55 -0800
X-CSE-ConnectionGUID: 4vyRlrApQr6UZH/EJNNVLQ==
X-CSE-MsgGUID: 6HLs93HaQzmJDkpWEm1QFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118192378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2025 07:50:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tibUJ-0018Nm-2F;
	Thu, 13 Feb 2025 15:50:51 +0000
Date: Thu, 13 Feb 2025 23:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [peterz-queue:sched/core 1/5] kernel/sched/fair.c:902:13: error:
 void value not ignored as it ought to be
Message-ID: <202502132351.QViEezZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   f5e5644f37620a7177ec30bf771fe90926ed9e7a
commit: a776cf5efa44410204ec367cd593ad56b9d3df5e [1/5] sched: Cancel the slice protection of the idle entity
config: i386-buildonly-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132351.QViEezZj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502132351.QViEezZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502132351.QViEezZj-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'protect_slice':
   kernel/sched/fair.c:897:18: warning: statement with no effect [-Wunused-value]
     897 |         se->vlag == se->deadline;
         |         ~~~~~~~~~^~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'cancel_protect_slice':
>> kernel/sched/fair.c:902:13: error: void value not ignored as it ought to be
     902 |         if (protect_slice(se))
         |             ^~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'pick_eevdf':
   kernel/sched/fair.c:942:50: error: void value not ignored as it ought to be
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |                                                  ^~~~~~~~~~~~~~~~~~~


vim +902 kernel/sched/fair.c

   899	
   900	static inline void cancel_protect_slice(struct sched_entity *se)
   901	{
 > 902		if (protect_slice(se))
   903			se->vlag = se->deadline + 1;
   904	}
   905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
