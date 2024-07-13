Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C085125B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720901147; cv=none; b=H13UMedv5msGBal9mlCX+DK7d0oGxm7VnFR1sdoqSRqIVGyre4bsf6hNLyMxmKe+6Ps0UjZAZYqtH9TpQ3CIoctJGbV97eJxZ4zP4HE7bY7kL08LaL7vZINl3Qvltf7JzRpVA53LUf9KJ7uskErmYFBIXsYLo81b1VzMyGcxkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720901147; c=relaxed/simple;
	bh=GVr6IDMqTTpRc2P+sMQI3KkKKWauvABuT1HX6DkSu+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNn+hnlL0PGcssXpVV7/b56ZqC8uME8lclKqzf63mCF5Mi7WafshJ7yhrc9LH+ccVxnS+ILNPNtB2gct/UhoiwWbWucJ2NJqW++BgBv3eqYDBx+G9q7mqHosz6RLol5/MljKG2NRP+dgUU7SsPoBWSyptQrWLWi1oP+QI1kdsHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KS8Xr7No; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KS8Xr7No"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720901145; x=1752437145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVr6IDMqTTpRc2P+sMQI3KkKKWauvABuT1HX6DkSu+Q=;
  b=KS8Xr7NofMuA2noRhSzP6u99mB1swBxTOy51ZecHwHw/OidHUkLWDGC0
   G8fQW6WZWlFJAse2QXKkeaDCzVAe938QCjiNNDB1CmzMiUnmo9mVvuQPg
   obdV/fZ8r3qZmOnSuV+NY+57aI3iZ76w4Wz8qDkagGKBsyiVjwoNYKpAJ
   HG1W4unzNAevhWmO6CT/9kGNTKXyE6I5Wkx+NMxFR0f22wmCReVrDJPW7
   b8i29Jvdi66dUs66NIScWJtvuBWEuyOOx+7vid3SiRsVT4OT9DP9eCR5d
   QYkzw6mLhC6OgodnBracG3eI/tcpnfInIe4UjECB61o31RVTLdmFo+XBA
   g==;
X-CSE-ConnectionGUID: vKbnz6+URCa2Eo1P0jwpgg==
X-CSE-MsgGUID: B0Dk1ykURQWJWGrHXh//qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="12536523"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="12536523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 13:05:45 -0700
X-CSE-ConnectionGUID: yRl7om74QJCmlUOUQnVxeQ==
X-CSE-MsgGUID: Ghj8WNouRlOwnizIp8GLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49101861"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jul 2024 13:05:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSj01-000chO-1q;
	Sat, 13 Jul 2024 20:05:41 +0000
Date: Sun, 14 Jul 2024 04:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 3/23] fs/nfs/nfs2xdr.c:65:12: error:
 static declaration of 'nfs_stat_to_errno' follows non-static declaration
Message-ID: <202407140300.53HVgOPs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   85d53fa650a024c154c0befa31a72b4484290c47
commit: 85c08fd7310ca8076283e88773002df86cf23ac6 [3/23] nfs_common: factor out nfs_errtbl and nfs_stat_to_errno
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240714/202407140300.53HVgOPs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140300.53HVgOPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140300.53HVgOPs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/nfs2xdr.c:65:12: error: static declaration of 'nfs_stat_to_errno' follows non-static declaration
      65 | static int nfs_stat_to_errno(enum nfs_stat);
         |            ^~~~~~~~~~~~~~~~~
   In file included from fs/nfs/nfs2xdr.c:25:
   include/linux/nfs_common.h:14:5: note: previous declaration of 'nfs_stat_to_errno' with type 'int(enum nfs_stat)'
      14 | int nfs_stat_to_errno(enum nfs_stat status);
         |     ^~~~~~~~~~~~~~~~~
   fs/nfs/nfs2xdr.c:65:12: warning: 'nfs_stat_to_errno' used but never defined
      65 | static int nfs_stat_to_errno(enum nfs_stat);
         |            ^~~~~~~~~~~~~~~~~


vim +/nfs_stat_to_errno +65 fs/nfs/nfs2xdr.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  64  
5e7e5a0da28216 Bryan Schumaker 2012-05-10 @65  static int nfs_stat_to_errno(enum nfs_stat);
25a0866cc63281 Chuck Lever     2010-12-14  66  

:::::: The code at line 65 was first introduced by commit
:::::: 5e7e5a0da28216fb9d0a49e93ee27668ef4f04f7 NFS: Create an NFS v3 stat_to_errno()

:::::: TO: Bryan Schumaker <bjschuma@netapp.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
