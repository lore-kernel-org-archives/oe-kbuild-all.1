Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE431A061
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 18:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776362953; cv=none; b=F68rq1NYZVIwSohsRqC7H0WTBMWu1am2488dFIx5zU5DxTjAssxeNaS6iZVsvCoobJRu5yiqnpsHREVQug4CwEdjd6z7MXfEaJvW+/aLdqbOWsaQvYAsubUlsr0aKUbbkLxKG/0KvZUI1YiXVikcUeQOfVfjaz22b0DnVeRTsfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776362953; c=relaxed/simple;
	bh=z0bCy4aJ7oS9ddB3N8vnd+W2VrpX5httpB7zO/Oar/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xx9DPD/SGc8b6ZdGk1Oen2ZvdGf3z9NQ3NOU2WtfENkmhDOGtJscri+pfZBGUOnSXCxR06IL9gQNhfaID4jGAO/LxgHZosKr2wgP5BYlHEh4xAFkBUlPZtKkjb+uRuXOnKWA+J9YhXS9TAzGQfaGLwDbE3h7el6PyBfP11PnrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5ZtAxpq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5ZtAxpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362951; x=1807898951;
  h=date:from:to:cc:subject:message-id;
  bh=z0bCy4aJ7oS9ddB3N8vnd+W2VrpX5httpB7zO/Oar/g=;
  b=M5ZtAxpqxMUm3CJpXx0LNcJXHBrCVopU6Vl+LMc9QKYTPLbfxQ1AphrJ
   9K7T1lqLU3HuEi4JQspoa9mQv4CX89cie5pvvw2J/9UKnVAcOeEbGxk0f
   0WSjltDjbvkrDcHGyq66FZbKYCCHaB8NaodbLuk89zDF/ttJk1z6yKuOF
   tIPjXAbA/IrrkgUTDYV8HIS8jruzWSlaP26Hihc7/Wcy4sKblQA3r11Ck
   K9VmB/3xZyujRdw8yH8Gs1xsLB/McNgHOGOI1otO0/fPp4/Sy2gKvG6I7
   Igg5WAzIbrjCB2j5w1MeGH6pRyW17QlKHacPcs869d52HzcWEgpOc4qTq
   g==;
X-CSE-ConnectionGUID: jgAHjIA1SfC5JZHZe0zHvQ==
X-CSE-MsgGUID: P6NdOcHRSy6qrG8cd1n31g==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77073413"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77073413"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 11:09:11 -0700
X-CSE-ConnectionGUID: UZSX6vngS6mdmB2vOVjmTg==
X-CSE-MsgGUID: pjmRQsNgRfGgM+NSbLL6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="231057731"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Apr 2026 11:09:10 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDR9H-000000001pu-0DrR;
	Thu, 16 Apr 2026 18:09:07 +0000
Date: Fri, 17 Apr 2026 02:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 21/35] filecache.c:undefined reference to
 `nfsd_handle_dir_event'
Message-ID: <202604170114.2f7SZA5p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   33d1e1b4930eaa439a5cfa710fd1a814e8c64362
commit: 7be14cee4bbb5857edf6eca28bb74bd48bc677f2 [21/35] nfsd: add notification handlers for dir events
config: powerpc-xes_mpc85xx_defconfig (https://download.01.org/0day-ci/archive/20260417/202604170114.2f7SZA5p-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170114.2f7SZA5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170114.2f7SZA5p-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/nfsd/filecache.o: in function `nfsd_dir_fsnotify_handle_event':
>> filecache.c:(.text+0x94): undefined reference to `nfsd_handle_dir_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
