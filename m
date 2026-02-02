Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E153023D2B4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021694; cv=none; b=TH8hNLY/iV9fP6okLjkyYLwMnUHDukfloI1brgM0R8CskEK2A2LlIMZwTRqbyWZWYVntjvZfrvdRlj7L8x+aBoZuKM1PAtn7vGRyZdDgWstjgBX9H/jg7PwseHuXMR78lmwvQ3tbvjv13rJ5ega2R7+/5gDWlvvBYRji8RiOC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021694; c=relaxed/simple;
	bh=rAngXPcWHBH5GPQBGLGf0j5c5va9Jz/fX0AvBSxlXbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sN63gc3BxYpg6l+KHwbPM41Km1oNfcG8PPLb1FFyA4qFTCnZ9Wq6SgdKiCwtIBK9Gyza1Gy4W8zNbY3DXZiUo8f362ojdu+wBNUcsdlwUqoMDCntuEGwMljMSFAfz6yZdZ6W/CCaH3qO8fGvoYu5yZ76oPjJfkEmaT+h/T/h200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIoZZOfC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIoZZOfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770021693; x=1801557693;
  h=date:from:to:cc:subject:message-id;
  bh=rAngXPcWHBH5GPQBGLGf0j5c5va9Jz/fX0AvBSxlXbU=;
  b=SIoZZOfCyp5+CCQUwuz8eWAV7PycIsKRRdNrv6/qsJOq8NPg94McAZtq
   r5LzokmOg8gcS2Oe7jdrU9By7pv62hRVThtjGQolcA8tlNF0qFQwWvz1s
   FSWCwngD5Vu5BdVR2m5XYjrTEJQqh+mp+U7GwUaRKfvuxlMPrjLpAsF9q
   RDekig91azmHejlExJIcD3Q2xrXUaW8nOo/kI+aTQf50WIevsskN4nNlj
   4vWQC/Wumikh/dHEOIl+dL56+qZP/AZcREU4tQktMn5QFTpDN86VPfktt
   X8zBaEiJZ5fwkYS1FqTjP5r+Wvq9zv2mfKwnZzd2UHSkAa/iGjTUa1MfZ
   w==;
X-CSE-ConnectionGUID: e/qibHjcSweFFu+P7i+6Hw==
X-CSE-MsgGUID: 0gTWlU4WSQyM2e64F/mlMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82284599"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="82284599"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:41:32 -0800
X-CSE-ConnectionGUID: OjyeD+ScSYOJqE7NMpK3dg==
X-CSE-MsgGUID: dJrHY6roSb+B0nI4EoT1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="232397565"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Feb 2026 00:41:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmpUu-00000000fMC-2sSk;
	Mon, 02 Feb 2026 08:41:28 +0000
Date: Mon, 02 Feb 2026 16:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 23/29]
 security/apparmor/label.c:1406:13: warning: unused variable 'tmp'
Message-ID: <202602021628.pNEFfoCm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   173a18bf6c87bb337d2fe8d59b5a41b3cfa38fda
commit: a4c9efa4dbad6dacad6e8b274e30e814c8353097 [23/29] apparmor: make label_match return a consistent value
config: microblaze-randconfig-r073-20260202 (https://download.01.org/0day-ci/archive/20260202/202602021628.pNEFfoCm-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021628.pNEFfoCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021628.pNEFfoCm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/label.c: In function 'aa_label_match':
>> security/apparmor/label.c:1406:13: warning: unused variable 'tmp' [-Wunused-variable]
     aa_state_t tmp = label_compound_match(profile, rules, label, state, subns,
                ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


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
