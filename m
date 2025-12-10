Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9F3286418
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765383090; cv=none; b=QPl27mqp3dtdRC1YOyJDPrIUXBm30pOagTnJ2UAaGegNGao7qAGR2Vk1CpX4mt2p+coD25B5YPfhCFLgxm76ZToIKvR+mYJlQOabpAXn1CNttVL4I0Iozq12TYyhMqWrxcKNQWT0N7LG1lne7GWsjFsqWc8JRh0u3nWjhkmM6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765383090; c=relaxed/simple;
	bh=Di/WP+nSr/JauRjCgsw7HrEXK98vexWLZAetj/pL1PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBHORrK06buWibcD2grIEr1o3zwjuE4n/t8uDrErohZCk+a44yH4DbfsQszn7BEnBcRj3XyZq5PO2giG0FGR1oWOZ+5AoWv3JlwEYQDzXI5Apqs/kMg9iMRfRKQCj/dn9cwz1Hxc5Ugd294PFGW0w40PzDtAGgGosIlDkjCt/YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEHwr7Ce; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEHwr7Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765383089; x=1796919089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Di/WP+nSr/JauRjCgsw7HrEXK98vexWLZAetj/pL1PM=;
  b=OEHwr7CeF8ekyj0E8PztkerfAzSLkVAVdgcK1l1T57JdvwkDkCEzKPD2
   q116PGuy3tRQxW46FKX0HiHRowO/Q6bg8j1cJZTmfskBx5YvV2U/D1Xv9
   LcElynQbZOfgHW/U2SujK3PZgLAjsXQc9blrt8OS0c0N8TlKDoAaz18ES
   3lSt5KS00YWby4PTunpdwuqjAT93orgLTjoDJVs4uR5ndCt5W8ipFijK5
   MEtk3zP/Q3uUmffnU4/ld6jPiDE1hk33rU9/fTY303bIwgZP2FGyJ9Kok
   BF6Wnam74/6OhNgUPAPZERwXv4/XA9DF+IFv2BmhE0ydwpSwRT+8jmNO/
   g==;
X-CSE-ConnectionGUID: 228ipf+ySmiP4bdisl/bqw==
X-CSE-MsgGUID: xpAPdDyHSyuuZ/9vi+gZlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66536411"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="66536411"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 08:11:28 -0800
X-CSE-ConnectionGUID: iDdEoQHlQ3Gua1IkR4hgNQ==
X-CSE-MsgGUID: Wb+0eWo8TneQUXZC8OODGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="219892349"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 08:11:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTMmj-000000003NJ-1Q51;
	Wed, 10 Dec 2025 16:11:25 +0000
Date: Thu, 11 Dec 2025 00:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] fs/binfmt_misc.c:682: warning:
 Excess function parameter 'misc' description in 'remove_binfmt_handler'
Message-ID: <202512110057.RvRfmSQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   0ac176d7ef4de55cd6a1c781a92212aa6ef316f8
commit: 53477032977930f459293b7c244c348d5667c574 [1/1] binfmt_misc: cleanup on filesystem umount
config: x86_64-randconfig-076-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110057.RvRfmSQ1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110057.RvRfmSQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110057.RvRfmSQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/binfmt_misc.c:95: warning: Excess function parameter 'misc' description in 'search_binfmt_handler'
   fs/binfmt_misc.c:144: warning: Excess function parameter 'misc' description in 'get_binfmt_handler'
>> fs/binfmt_misc.c:682: warning: Excess function parameter 'misc' description in 'remove_binfmt_handler'


vim +682 fs/binfmt_misc.c

   668	
   669	/**
   670	 * remove_binfmt_handler - remove a binary type handler
   671	 * @misc: handle to binfmt_misc instance
   672	 * @e: binary type handler to remove
   673	 *
   674	 * Remove a binary type handler from the list of binary type handlers and
   675	 * remove its associated dentry. This is called from
   676	 * binfmt_{entry,status}_write(). In the future, we might want to think about
   677	 * adding a proper ->unlink() method to binfmt_misc instead of forcing caller's
   678	 * to use writes to files in order to delete binary type handlers. But it has
   679	 * worked for so long that it's not a pressing issue.
   680	 */
   681	static void remove_binfmt_handler(Node *e)
 > 682	{
   683		write_lock(&entries_lock);
   684		list_del_init(&e->list);
   685		write_unlock(&entries_lock);
   686		unlink_binfmt_dentry(e->dentry);
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
