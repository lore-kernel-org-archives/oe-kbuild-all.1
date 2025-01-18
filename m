Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860A1925A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737216573; cv=none; b=aHu5Mh/L09Ksntby2O+Em0AuMTVuYskwd9OZpZ206X1VaKs8QSPMDfUJDcvT8ensgacfpGQfziVrZs9QhCarXrXnt8pFV43RC+zCTQKbY8kVqwWdeMGgfab1rWihzRpSggwBAuki8aXjoIOspwWmzPI7GZZ8tqYPnlu0x0IhWbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737216573; c=relaxed/simple;
	bh=5nbVJyuhvMbqhDzG5WpkVBpyGJBdoFQdzvfsPfWpIFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1s7xXhCSAR7gmJBID/WCANUtg1bcFyk+CawBtzG10by+PdoT8AUT6qnVLu7rISH1zE3TZR52ptcDmq1fj/tA8FlEzAFNip1C1qHr9PqEgVZ8oY2XSSpoZuh9Mv7s+SzIj9eFhCWVxZBZJ4dOFhbnaNA2iFlxoeIwMDrbHef16c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mydwUbVr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mydwUbVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737216572; x=1768752572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nbVJyuhvMbqhDzG5WpkVBpyGJBdoFQdzvfsPfWpIFk=;
  b=mydwUbVr00CtToqTu43MP6HzawnTH6/DyjEI91a8OENHYNg83FMCjNqY
   75VTgbMDP2pMhQe6dkca2fpo/q9UAuIjXE5VEZvZ3axl6p1ZFtxuql+wn
   NcB/38V5+Sf+31s35rsn+K3H9AlYZexiUy/Aas0pQ9uw0/2uEWEnv69l7
   k38CtuUYcmViW6rYQL/xJzgz2hljqOB6rpVJr0ypMfyT/A0TnCiZ+1jxh
   oqeIGHk4BIAJh/vsqD9dOB353lAUK/CdKvHkIsTh6NDvNiOocl1z325eM
   J9TdzZZ1Fy6OmKS9+s2SuTg9VYgEJTv3bJ7EbN5i0L2Sl+oemErGvGZoy
   w==;
X-CSE-ConnectionGUID: Zz35mEX5SS2pe5f64LOWtA==
X-CSE-MsgGUID: t9Q59qz1QE2VeVYSzeoL3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="36853926"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="36853926"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 08:09:31 -0800
X-CSE-ConnectionGUID: hZPkZtdLRmWVNRbQrZhcnw==
X-CSE-MsgGUID: mNvMBU9WRAyrdKOCoyUneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="106677116"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jan 2025 08:09:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZBO3-000Uar-3D;
	Sat, 18 Jan 2025 16:09:27 +0000
Date: Sun, 19 Jan 2025 00:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: WARNING: modpost: "cmpxchg8b_emu" [fs/btrfs/btrfs.ko] has no CRC!
Message-ID: <202501190030.Jlbk07o8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Filipe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 1020443840569535f6025a855958f07ea3eebf71 btrfs: make the extent map shrinker run asynchronously as a work queue job
date:   10 weeks ago
config: um-randconfig-r054-20230701 (https://download.01.org/0day-ci/archive/20250119/202501190030.Jlbk07o8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190030.Jlbk07o8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190030.Jlbk07o8-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.
Is "cmpxchg8b_emu" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial_copy_generic" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial_copy_generic" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "csum_partial" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "cmpxchg8b_emu" [fs/btrfs/btrfs.ko] has no CRC!
WARNING: modpost: "cmpxchg8b_emu" [fs/ceph/ceph.ko] has no CRC!
WARNING: modpost: "cmpxchg8b_emu" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "csum_partial" [drivers/net/vxlan/vxlan.ko] has no CRC!
WARNING: modpost: "csum_partial" [drivers/net/geneve.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/sched/act_csum.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/sched/act_mpls.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv4/fou.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/ip6_tunnel.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/dsa/dsa_core.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/dsa/tag_dsa.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/dsa/tag_lan9303.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/dsa/tag_ocelot.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/wireless/cfg80211.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/sunrpc/sunrpc.ko] has no CRC!
WARNING: modpost: "cmpxchg8b_emu" [net/sunrpc/auth_gss/rpcsec_gss_krb5.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/mac80211/mac80211.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/batman-adv/batman-adv.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/openvswitch/openvswitch.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
