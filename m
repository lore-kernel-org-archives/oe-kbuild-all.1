Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999A3C1408
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935605; cv=none; b=KI1ehlFflN9YA1HUdvPZwwhh9MBukte5f1Y/0vsRI+WNxvcm2OyBH63wXIT9VaOE13KlxUZCkHpI1EyM9SudbAiaqcJ8CDzLaAW+UXD32UCnpZs8ep+xN6Tk9PN1u2dDY8QgTkLtVWSCpsIyHVNfH4LuXVC77KkaazVfEFR9nYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935605; c=relaxed/simple;
	bh=pnHfAii+WPGQfY9ohtt9IqX3DAiLC4U3svoX8qAJues=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J6vagM5wVMxNbuT6bE8uPXq4t1ZBR6jArUXi1k9uKmHfyIyXQim6gXfwEV5ZMD28cT6MItO4QP8E5Fpnz/C9TtcUBtuMU6Ey5ABQV9V52+9qNPacaOi5WC6zbjIWkHXJfyHEHJcrraxdOrLQcolKiMIrQyvLCPKn+1IypfedHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YthY0wPl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YthY0wPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773935603; x=1805471603;
  h=date:from:to:cc:subject:message-id;
  bh=pnHfAii+WPGQfY9ohtt9IqX3DAiLC4U3svoX8qAJues=;
  b=YthY0wPlRnx4JICeqMPiVG8uWAzjytJQZ3Lm49N4onRg1n0jdbFkzf4C
   ip+OO+om3b1NkbeP3pB5IXvQ52Pq4V6sBZLDTaqI8NDXi3DR5Qf9qcG6M
   zR/+vmvJsqrLz9LIiwKpB3zByaiPPswzdrG3uV99xrE085lboc7KiNEcA
   k07JsCHf2uLWlDZSBepJKpENkk5oeEbOuU+86cUw5QvDuD5o6X6RDkw8Q
   q//I+X8CFo0gda3xK/aoZtIWGvm6Qw3FS7FcuZxoXXWNiOYLBopXPLZcm
   ocrUsAIynpwVLgSkkBW8v2fXAC0gjD3+RWmLbM4zkExs1exLNqtizi/kI
   w==;
X-CSE-ConnectionGUID: nvgVRAeDQe6WnKDL4eBOoA==
X-CSE-MsgGUID: AJzJmGmaSserLuAdYGQrxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74712319"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74712319"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:53:23 -0700
X-CSE-ConnectionGUID: 5wx+bvIbSyG2eQHoliQJnw==
X-CSE-MsgGUID: mNunFN3/QIuspYRt2/JKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260895910"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 08:53:21 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3FgV-000000004rp-1aoy;
	Thu, 19 Mar 2026 15:53:19 +0000
Date: Thu, 19 Mar 2026 16:52:35 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:user_path_file 3/6]
 security/apparmor/apparmorfs.c:209:13: warning: 'aa_get_common_ref' defined
 but not used
Message-ID: <202603191614.4O8bQiFT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux user_path_file
head:   7b2bd4225923afea7b2ae5736a18783d96a3b456
commit: f2b9cb55540b0f2da08380cd369a496542fcb717 [3/6] Merge remote-tracking branch 'vfs/vfs-7.1.directory' into next
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260319/202603191614.4O8bQiFT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191614.4O8bQiFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191614.4O8bQiFT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/apparmorfs.c:209:13: warning: 'aa_get_common_ref' defined but not used [-Wunused-function]
     209 | static void aa_get_common_ref(struct aa_common_ref *ref)
         |             ^~~~~~~~~~~~~~~~~


vim +/aa_get_common_ref +209 security/apparmor/apparmorfs.c

8e135b8aee5a06 John Johansen 2026-03-01  208  
8e135b8aee5a06 John Johansen 2026-03-01 @209  static void aa_get_common_ref(struct aa_common_ref *ref)
8e135b8aee5a06 John Johansen 2026-03-01  210  {
8e135b8aee5a06 John Johansen 2026-03-01  211  	kref_get(&ref->count);
8e135b8aee5a06 John Johansen 2026-03-01  212  }
8e135b8aee5a06 John Johansen 2026-03-01  213  

:::::: The code at line 209 was first introduced by commit
:::::: 8e135b8aee5a06c52a4347a5a6d51223c6f36ba3 apparmor: fix race between freeing data and fs accessing it

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
