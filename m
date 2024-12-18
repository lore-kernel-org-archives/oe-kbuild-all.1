Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F5B1991AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734556772; cv=none; b=e8gCIWy2l9APPNNwdDvxOrOLb5fewiXLiFkyCQjZYjQisl4zoD+JQRb5XvtwrgAQFD5Dlllrb4DEcvBwL7KOov1lkyMwhIYEmGG2APhpivVt1pF3vP+AONYb3wEoPKmpUaOku6TYNkVCvCtDyrA1ZPq0K3qh0n/VX2W5s9HHflw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734556772; c=relaxed/simple;
	bh=ExiQFn0r8puZpxEGJkDQc8ABYwRiPfJ6IruE/mQ2jNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ioIEJe8SXQL38OQzBgokqSKD/nBX9LuYsHNSQy3NiNsOwQQecWcgfQxWpsKOa7eqRnXZhkX4iqm3m7ZPmGcUDCh15qcaavml7xhBCOAgjUUzjBmyJZYtbNPHhrP3ZRCiW0kcXs7e7IeTxF9uuhuPHJd2PLFMBF3Ow9VfjuJwGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIop/PKq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIop/PKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734556770; x=1766092770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ExiQFn0r8puZpxEGJkDQc8ABYwRiPfJ6IruE/mQ2jNM=;
  b=UIop/PKqFtFpWIEm1kDI+neurs1TPIWdgZ/euamhFGh411lqDdimd+8I
   aivupej4qzwhqfljZjHZ7nIeUyKwVGwqeiZYcgx1/aF7lxZxfAlbdkU14
   WTwBNedc8m3NND2xEgMX4QhtG7pdqTanOWYIKgvz/1vP8QAa5cfBFFcQ+
   VLLwb0sy3D2i++DiX0n2sOSPopCXLGs3SvufEzRTnjF6FNjhJS8ubKdGv
   NpqojXHSEIrzfvqMnSyZSzqT1rWgWINkhdOE7SIfTYAzyABSOPgbK0hrd
   3Jsot7Sk8jrwwbDCIO4JMUc9iem9G4RMzVWsz3SjpUB8rSt2JpmWwNaAS
   Q==;
X-CSE-ConnectionGUID: D7rJka7eRWyB6qCf9aYiLw==
X-CSE-MsgGUID: x/t2PjraRaug3hdW9UASeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34775411"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="34775411"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 13:19:30 -0800
X-CSE-ConnectionGUID: VEgO2w5RSZCzqQHmCdquiQ==
X-CSE-MsgGUID: 0ZlYUyhfTJmy3BM8Wceqbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="98040357"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Dec 2024 13:19:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO1S1-000Gdr-2Q;
	Wed, 18 Dec 2024 21:19:25 +0000
Date: Thu, 19 Dec 2024 05:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/token.c:50:6-27: WARNING: atomic_dec_and_test variation
 before object free at line 54.
Message-ID: <202412190521.9R1HKuug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c061cf420ded391e32f99cd483e1e0107f213b12
commit: 35f96de04127d332a5c5e8a155d31f452f88c76d bpf: Introduce BPF token object
date:   11 months ago
config: hexagon-randconfig-r051-20241218 (https://download.01.org/0day-ci/archive/20241219/202412190521.9R1HKuug-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190521.9R1HKuug-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/token.c:50:6-27: WARNING: atomic_dec_and_test variation before object free at line 54.

vim +50 kernel/bpf/token.c

    44	
    45	void bpf_token_put(struct bpf_token *token)
    46	{
    47		if (!token)
    48			return;
    49	
  > 50		if (!atomic64_dec_and_test(&token->refcnt))
    51			return;
    52	
    53		INIT_WORK(&token->work, bpf_token_put_deferred);
  > 54		schedule_work(&token->work);
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
