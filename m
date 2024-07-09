Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C0157E7D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720525289; cv=none; b=ecxoGTtWc45NvQQs9NbyOTAf0XUrqwSD/rls2JdZGVouRMWAoa++eumdiUOCnDlzx6I+ZcBAZ97EgZSz9hchbv6ETVyqPFauEodkm4bNi8mlVlRhHQC44UrBfKi72nvfEZfCNfkscXFEP7+FxbobEF6KiTcZBZZGK8D39hwZfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720525289; c=relaxed/simple;
	bh=RP32T3RKQMQt+vShPXINsjabD/ZiGWavrgUppvPjLTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrfDkQVImljzE6W6o0A1CBWB1YEsH+5IrvODorXT1HSQ5m8N3POECNc3vHBrGDwQB4iUQpLaO3QXo3vuFoP9qrfW9tTGhhISvtFFhEe/M82tjtNVS2dkP75tpdLh++drx9hAY/WvGVtnLvQdSJ/MutJoDuEc70ATMAU0fOh/k4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrrnfaux; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrrnfaux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720525287; x=1752061287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RP32T3RKQMQt+vShPXINsjabD/ZiGWavrgUppvPjLTA=;
  b=nrrnfauxz2cLnLs2NivJrNRKBSaCVa1Z1JlTkvmRQx1USrk9LUT4e7h0
   6/JBhjatas60/5PwuO1mvjjB0a/t85HH/wF42NEJp+puGQ5dBsyipd9jc
   PdbjBK8bpRVCqOBb32dbsY+RI/Aw4Iwg619BqGBCgJJvTArLJKNYWrUTD
   Cinqcp/ih8fOMO8iZ7aM3GOAoVtxQCCDnFW5lyFaNUAEShgV3Gx/0kn73
   0OtNEnY3qs6QU7YYDScXtMc7YT2myUiutHmlk2XTxKQTHWf+H/LZxzxSU
   MeEDbL7KvLIEHnRK2WmRDE7FRfTusoNXPuHK50dHqgK38U1uegud8nlTP
   A==;
X-CSE-ConnectionGUID: eyubhAu0SVWtU7AFb0jtfw==
X-CSE-MsgGUID: nZq0Flb2TnSRllxNrA6DLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17642826"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17642826"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 04:41:26 -0700
X-CSE-ConnectionGUID: GjLOCiQoSoSfgSNueGojzQ==
X-CSE-MsgGUID: h6VGuvMzRLao1b8rIoCisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47615286"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2024 04:41:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR9Dm-000Wcp-2s;
	Tue, 09 Jul 2024 11:41:22 +0000
Date: Tue, 9 Jul 2024 19:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 5/13] inode.c:undefined reference to
 `__invalid_cmpxchg_size'
Message-ID: <202407091931.mztaeJHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   81b2439edd7c9f966afcb091f414b7f219cda8f6
commit: 2265b64634f4af479ffb0c478409cfd56ec6dc4d [5/13] fs: add infrastructure for multigrain timestamps
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240709/202407091931.mztaeJHw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091931.mztaeJHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091931.mztaeJHw-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: fs/inode.o: in function `inode_set_ctime_current':
>> inode.c:(.text+0x167a): undefined reference to `__invalid_cmpxchg_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
