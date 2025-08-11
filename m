Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E12D781D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922792; cv=none; b=JQc/AwMKuhwjfLAhSl1J18mpEluu2KBxPeTbL/KVWiHadUOcdEDYxHWVvt3S8/bvKC4ZCbbzp1PK/up0IDllA9yHa3VmhASz5u3H7uxj1wnkMBJ+dsKjM4mTk7WXrMqQU1pe2An2peCaqzoqqopYq/cm91BRhPLugKza2X+ELqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922792; c=relaxed/simple;
	bh=5paxwdviACP6oZczoRviyAOCpNZoqMVYMXP3uar7kC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QE/i9TSylIzLQHu7+MPSIuYytg0Nbvptjs3Bw6XMWk61D4krANxyH4DPeiZe2/GI9kWkYkqPQflhlBzPGqgzwlI97iwp36Zh7K9AoIOqh57mTGw728leseYrtC3izrGFl8/UWjdMJUC+7qSwwVst29bh8hf1pn+QKEQNPE7X0ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBnbWOKn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBnbWOKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754922790; x=1786458790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5paxwdviACP6oZczoRviyAOCpNZoqMVYMXP3uar7kC0=;
  b=nBnbWOKnfA21166ksqMYW3lKJDs33p2na13ZewyQdYT1u5aAAgGri+Mq
   q8zP4UTweQeQj7fBYLggUnifAikFX46A0Xpb0slGTP1zOAxN6coxP1Tli
   /j3jk/zi8EvLnTghf3xuPtg6BCR3FLqsULzOwCu6G1/48MPLKhriCskE9
   1mZ1UyRS250OWU4HyMn6xKZExEq8hL1m7sH32y4RJWqGAgK8Uns4+lE5/
   ZxFdfEU9S6TvZFoikH9NnGLNyVfqh+wBbLB9uRFaPz/veOE4Env5pMV1+
   1OLsk/+gRN019sibRdqFWjy6T77KBlrKyZ4GqcuK6wsTCrQr6dZ99H7uf
   Q==;
X-CSE-ConnectionGUID: 6wj1b8TfRBuidF4eoi5leA==
X-CSE-MsgGUID: oQXjCY63QNONd2qGXYaODw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60978567"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60978567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 07:33:09 -0700
X-CSE-ConnectionGUID: iGB9o8SMQUGhbgKz+Balpg==
X-CSE-MsgGUID: Tv6YpdZ8Rn682ykk/Iu3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165564560"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2025 07:33:08 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulTaE-00034l-0j;
	Mon, 11 Aug 2025 14:33:06 +0000
Date: Mon, 11 Aug 2025 16:32:41 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-has-macros 15/16]
 arch/sparc/vdso/vdso32/../vdso-layout.lds.S:12:3: error: #error unknown VDSO
 target
Message-ID: <202508111621.BUqvfCbC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-has-macros
head:   6f2fed05c5204246a56d08bb95faf682c678a8d4
commit: d4c76cfe3dd5c2cdd869777f9a8cc18b171cb723 [15/16] BUILD_VDSO32
config: sparc-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111621.BUqvfCbC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111621.BUqvfCbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111621.BUqvfCbC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/vdso/vdso32/vdso32.lds.S:9:
>> arch/sparc/vdso/vdso32/../vdso-layout.lds.S:12:3: error: #error unknown VDSO target
      12 | # error unknown VDSO target
         |   ^~~~~


vim +12 arch/sparc/vdso/vdso32/../vdso-layout.lds.S

9a08862a5d2e266 Nagarathnam Muthusamy 2017-09-21 @12  # error unknown VDSO target
9a08862a5d2e266 Nagarathnam Muthusamy 2017-09-21  13  #endif
9a08862a5d2e266 Nagarathnam Muthusamy 2017-09-21  14  

:::::: The code at line 12 was first introduced by commit
:::::: 9a08862a5d2e266ecea1865547463da2745fc687 vDSO for sparc

:::::: TO: Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
