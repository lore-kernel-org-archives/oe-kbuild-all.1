Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0044C97
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 00:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746664484; cv=none; b=PIgAhdFWDW9Zq7PLn/SBMVAvDV2l/nZCyjWKKdKJd8G2nAhI7Jnhi6Ks7UZKwYAgKo0eom2Opc6mUQb6AEbxD4zenj9jKff/Vd3+azO+US9cgLLYNMFUo+tqBAhgGqSsw80daDvqyhrjnUZWJt2QE4TGXm0FnHXq5ApvmdMLY8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746664484; c=relaxed/simple;
	bh=6LUij0oBumKLG4TrG9zUuxYkDYGAgKRWPdkSN7TtH+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttVS41eWbguuwmVoRtqIphE/ULecEmSzOuE5mHCQ+oJZAd0ZeaoVKHdNlnLdJ4xDd5bndllCFlZ8ZG4aXvMby4dpOWWokkkmuCtgoukAD2UVCPvfC2ALAtEQw6OguTgUahsVDIrSfw/h80n9FnoKdaKmmvVA+7hItnzCV/OrxJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1HCUAy0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1HCUAy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746664483; x=1778200483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LUij0oBumKLG4TrG9zUuxYkDYGAgKRWPdkSN7TtH+Q=;
  b=k1HCUAy0NTZtfsz3Fc6qgrve7dMB1Msli3ZEfHdkw0SyqjqxxDWQ5Nd0
   /ItFuzsIdAGAFD99m5PgHrH98Grwy71r4elcrNgodA/AgmqNobWxj1RlN
   y3nt8OiQH/I0XaLGZGhfmoMzTPort4Laf2tXjsJEu3KDPieYTN1TfqYTF
   DVCFpxJghf6u2f3n/Og2zl8ce205gMlFySeW2W6Un5tfXEgr2U2U4LNu6
   CZ6ViuBOrLJ1bdF/Fdw86waLI7XbNgyYTHA3/ZEyCeVHdr1pWujMywJhF
   Lwe9dVuzWZA9bQ1ue2axKIJw7QKjBuC5uPTOGDDtZQaWfS3Ffm2CExXkW
   w==;
X-CSE-ConnectionGUID: 1Ftko0mKRdO3zAS69Hp8lA==
X-CSE-MsgGUID: E+SL23pEQkeNWhEejw4sqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58622068"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="58622068"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 17:34:42 -0700
X-CSE-ConnectionGUID: c1jpqAqtRzuNCzMuVrlBug==
X-CSE-MsgGUID: WeFsFKIGQf6OeR6a6unU6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="167072134"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 17:34:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCpDi-00099f-0p;
	Thu, 08 May 2025 00:34:38 +0000
Date: Thu, 8 May 2025 08:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202505080851.Q40tjX6F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   f4fe09c3ea58e0ea446946a3bc71e768430341f2
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [2/2] ANDROID: GKI: enable hidden configs for DMA
config: i386-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250508/202505080851.Q40tjX6F-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250508/202505080851.Q40tjX6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080851.Q40tjX6F-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
