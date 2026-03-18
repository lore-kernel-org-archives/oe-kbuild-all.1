Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D23DA5BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843065; cv=none; b=HxzJhHYg7E8HoG9Zbnc7C2Sm2Y/9iR9NbBvT1/NxA86YPU9MzUPaaNUfvt1gFpqAicwhdC/HsKMn37zFhZr2svC3FTQLe3qsSZJPZWGkQ/11HTr4aj6wSjcM0RQYg0dPMC04lTw0bGYdTPGWq3dLTotXgROswwFLKgvqKdhiyIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843065; c=relaxed/simple;
	bh=79Tf1acVksL15V+Qy+QlCwaK27MpG2AB4SnLyc8R4+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sxINPsKDz6DzfaOFR5JVdq0xQAn54dAlfenF+h8n0Z46EXpR51YVD2IVnd+j711B7iYo8gWp0/M89pGcVlLgmIUJJ8eoPq7YXwNsGNA6iUpRTIVFwocQHfzjzk7hjG7eIqd4IRg/T+YxqVbUltVfWnUfnzVgqtaHF00SLwsE35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUbHU/jg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUbHU/jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773843064; x=1805379064;
  h=date:from:to:cc:subject:message-id;
  bh=79Tf1acVksL15V+Qy+QlCwaK27MpG2AB4SnLyc8R4+I=;
  b=HUbHU/jgjYhTNKlbx40NHjPEIXZ4AvaBcX35PdqR/MqxNkODtR6iF5B2
   4EwjU7n8+NREcciwtXv0bhsfG7zcG8X0Dx6q+gXJyNqZ6Z9ybYYHeLXkU
   22M/db/3q2qm+PZL5oKWivuWowy6oazT19z4GrBgmeuotN7hHtp6QhWgt
   qoxNr/monQmOtDXJihS3T0CtR9eXk8QpTkqHcHCh2zsi/iu3gf4NhB+BV
   qUS2+nCiTkyefjNR04q51CA8M6QUnW6qm9ZotROwapylaV7xgmonN7y3w
   OQVg1TmjbTEq03D/7sOUF7vbgEub0QPCw7wDQOX+ppklqPZgrvllt3LaD
   Q==;
X-CSE-ConnectionGUID: 8VAfUynwTOKt0AL5EkzeGg==
X-CSE-MsgGUID: S5M3v8mfT6++mNb0LRqddw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85214439"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85214439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:11:04 -0700
X-CSE-ConnectionGUID: 7koU/BqQTY+AAh3Ul4I1Ag==
X-CSE-MsgGUID: m8dtSJFURWCkrjWO2s62pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227325308"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 07:11:01 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2rbv-000000002z7-2XEe;
	Wed, 18 Mar 2026 14:10:59 +0000
Date: Wed, 18 Mar 2026 22:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Johannes Berg <johannes.berg@intel.com>
Subject: [iwlwifi-next:nan_mac80211_phase2 19/57] ERROR: modpost:
 "__umoddi3" [drivers/net/wireless/virtual/mac80211_hwsim.ko] undefined!
Message-ID: <202603182237.3N9fkLeP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   2d6c6fa9647943d4c8ff3d8a6f82c00ea1edd2f4
commit: a7e7568d2380a7711f52acac0b7572e2c2dbf679 [19/57] wifi: mac80211_hwsim: register beacon timer by calculating TBTT
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182237.3N9fkLeP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182237.3N9fkLeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182237.3N9fkLeP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/net/wireless/virtual/mac80211_hwsim.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
