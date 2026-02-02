Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB3A2206B1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 05:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770008977; cv=none; b=DCEXhZaGlxe7CAhhmio6/ArxgEZXHLgmFShbHCyH0x/CzwNOheHWht3ptvDM2O5s9/IGxos4EohhzZ1pmGY878DsaFBPIC6NOfFc4SsS1VZJTs2wSpYWaHa2Otk27CvT51KDkNEEjLZIUoMG+mPK8AWOW6GCMU8F/9E+pF93g/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770008977; c=relaxed/simple;
	bh=ImPACu7n839frMRvMoHqsBidyOVOtxbXfuv2bO7AKjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dJRTvurrLj0GyDcECi+053lZspM+I8VFY9QFuUjwXUHtqgTRnJEvDlJ0Gmxx5ZI3LfU13KXvo/REZbxoba0Y8886y4zuBnejSB11+MERm7JdbGavVoscimNlupX9/xgBoYhsQZnhxFoxukOpkJ0GIDgYRxGmg8R3WDdOMu1rxsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuelRdl6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuelRdl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770008975; x=1801544975;
  h=date:from:to:cc:subject:message-id;
  bh=ImPACu7n839frMRvMoHqsBidyOVOtxbXfuv2bO7AKjQ=;
  b=DuelRdl6BVQW4LTrSlBe10p6y/I5OlxXsXnIdi7VyTcQPiMjryEY19DS
   L7a5Dor6aRUlEe1wZonQw+xvwLQYtMxXsNRry3Nyuu5BnVNIAOcR4oEko
   4mZC9at5l8HDc+K48GFTPD5dwCj7vrF+sDL1Rvw1YjGNHS+CSLoMPhxKL
   5cR92vnPdlDvM9ZAhEnqZu4MZZ3ol34Q5AwRPHy67bJYgmBuYjTEZcpT3
   BpIk8UMDOY65e88JjxaKNIm88Jku6U1/vNCpdn9p7xKF18OxntOsPzXYH
   ctz7uTldNMeR5zb2ht0V7FaOC8XJ/hkSw/o09mLqHc2XjyujR+kgtFjm/
   g==;
X-CSE-ConnectionGUID: CLVlmbo/T4C9rhtIMv+k/Q==
X-CSE-MsgGUID: d9lIbl0ITE2cwqb0yIeGGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81477465"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="81477465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 21:09:34 -0800
X-CSE-ConnectionGUID: Gwpx/extQHS/czaq2lSmtg==
X-CSE-MsgGUID: fiWS3bsfQfSCo4NWBDipDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="213515061"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 01 Feb 2026 21:09:33 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmmBm-0000000032f-0w8m;
	Mon, 02 Feb 2026 05:09:30 +0000
Date: Mon, 02 Feb 2026 06:09:00 +0100
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 23/29]
 security/apparmor/label.c:1406:20: warning: unused variable 'tmp'
Message-ID: <202602020631.wXgZosyU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   173a18bf6c87bb337d2fe8d59b5a41b3cfa38fda
commit: a4c9efa4dbad6dacad6e8b274e30e814c8353097 [23/29] apparmor: make label_match return a consistent value
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260202/202602020631.wXgZosyU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020631.wXgZosyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020631.wXgZosyU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/label.c: In function 'aa_label_match':
>> security/apparmor/label.c:1406:20: warning: unused variable 'tmp' [-Wunused-variable]
    1406 |         aa_state_t tmp = label_compound_match(profile, rules, label, state, subns,
         |                    ^~~


vim +/tmp +1406 security/apparmor/label.c

  1389	
  1390	/**
  1391	 * aa_label_match - do a multi-component label match
  1392	 * @profile: profile to match against (NOT NULL)
  1393	 * @rules: ruleset to search
  1394	 * @label: label to match (NOT NULL)
  1395	 * @state: state to start in
  1396	 * @subns: whether to match subns components
  1397	 * @request: permission request
  1398	 * @perms: Returns computed perms (NOT NULL)
  1399	 *
  1400	 * Returns: the state the match finished in, may be the none matching state
  1401	 */
  1402	int aa_label_match(struct aa_profile *profile, struct aa_ruleset *rules,
  1403			   struct aa_label *label, aa_state_t state, bool subns,
  1404			   u32 request, struct aa_perms *perms)
  1405	{
> 1406		aa_state_t tmp = label_compound_match(profile, rules, label, state, subns,
  1407						request, perms);
  1408		if ((perms->allow & request) == request)
  1409			return 0;
  1410	
  1411		/* failed compound_match try component matches */
  1412		*perms = allperms;
  1413		return label_components_match(profile, rules, label, state, subns,
  1414					      request, perms);
  1415	}
  1416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
