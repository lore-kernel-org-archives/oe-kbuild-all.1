Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B42F30
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143036; cv=none; b=pfcgVLFH3L7WDL0SXYLan1/b96gu7PouVoi6sckiOy9bdFxdJguTAsrcgYaiCR+MHKdx+vfX80ewTs6Ra4KP99QTAEgufjenqXBr/yt5qYojpSg82Hw7E/essxbChO/uZhLpivOup1iQoBHLEuwXpu5xFUK7U04dgcyCd5HcCPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143036; c=relaxed/simple;
	bh=9yqaudjBOhKXmKyZcLLhM7GhvFEVdHcot5Lv66UpueE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CoWEJBsLoKEyL8Fki1RpaKfFuX4R/tGrhc9dnbqClQxmWc5JQVXpi4h5POK01n0HSSRdALxXGgRBOZLfT84CqrZp+qiWP8tsIVj4t3Fe/x+pIbcUPk2OeKvlkxs2MkoM7Km5SejbUKbITRBLtun/hKjUzcAYu0sQkGTYjHAPcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVinljfa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVinljfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786143034; x=1817679034;
  h=date:from:to:cc:subject:message-id;
  bh=9yqaudjBOhKXmKyZcLLhM7GhvFEVdHcot5Lv66UpueE=;
  b=aVinljfaeNNJF4jOQ/H3tf06GQQw0ousTL2PE1XuYD9kCF1nucTqQsh/
   HGsSMkzN6jlNN1ProAECsDj01gKioRhHwY5NPGRDNzF+EhmOU2h5oiCA1
   0ZMvlZ+yeb5V89TSyAhLQH/C0Od2wOnuZ5/LP7RZ1EHR4+ZTP65ecK6fb
   v9i+oM4c6ejqG6I3VkrWjMWX7HXjbuqhsVJ/gCDCCoGHopYMr9YBEzYj2
   85dBGnU4T7JOYD9jm+dZgAcJPc5CjzdxQlnxXg7lFhlWd1N766ZPSy4DG
   Vj+dWotkx3l0Wltsa42dVbi5UQlZV4Im3bTuT+ZMrRPM3Y9TmCJrhGxyw
   g==;
X-CSE-ConnectionGUID: ZpLK5RkjR/aivq1Mcw/fpA==
X-CSE-MsgGUID: XcXkid5QQQamGCocDJQ6MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="85731852"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="85731852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 15:50:34 -0700
X-CSE-ConnectionGUID: PuJp4hxeRWiD8GnfEp1twg==
X-CSE-MsgGUID: TyQFZPbZRC6CO/2yMRB7KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="256280531"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2026 15:50:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsTOY-00000000JRB-0o1K;
	Fri, 07 Aug 2026 22:50:30 +0000
Date: Sat, 08 Aug 2026 06:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 14/14]
 security/apparmor/net.c:320:9: warning: the address of 'needput' will always
 evaluate as 'true'
Message-ID: <202608080638.kMrWPZSd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   bbb153c86dafaa6497b8a0a5372d1e79be8a7617
commit: bbb153c86dafaa6497b8a0a5372d1e79be8a7617 [14/14] apparmor: optimize current_label_crit_section() with needput
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260808/202608080638.kMrWPZSd-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080638.kMrWPZSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080638.kMrWPZSd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/net.c: In function 'aa_sk_perm':
>> security/apparmor/net.c:320:9: warning: the address of 'needput' will always evaluate as 'true' [-Waddress]
     320 |         end_current_label_crit_section(label, &needput);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +320 security/apparmor/net.c

   307	
   308	int aa_sk_perm(const char *op, u32 request, struct sock *sk)
   309	{
   310		struct aa_label *label;
   311		bool needput;
   312		int error;
   313	
   314		AA_BUG(!sk);
   315		AA_BUG(in_interrupt());
   316	
   317		/* TODO: switch to begin_current_label ???? */
   318		label = begin_current_label_crit_section(&needput);
   319		error = aa_label_sk_perm(current_cred(), label, op, request, sk);
 > 320		end_current_label_crit_section(label, &needput);
   321	
   322		return error;
   323	}
   324	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
