Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A041A071C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719525852; cv=none; b=EYi9GDBhDvDo5aQJLxM+BSz4TnoyvYbtWh5qtt+m36+LEnNuUzpT1OhaqbmKqlJAX5LCfHDI0paRbPuHTthInC7cF/HI4dr6hXHcsiloIklLPgCj95HGeYLiOfI9TWhuCFCMf0Fj58qkdku8tpO2u9RuxKvxJ66LkvKDPawK9KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719525852; c=relaxed/simple;
	bh=1E+oiq46nJRx2oa1QS7F7rivreukck31xug9BYteN8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=in6LeUh02WeJaOvF7n1e9eV5ddW68V5V/ze6Kr2gqfRTBZyiJ/QRjKVq5E3fv+Lezp2MIEA1w9ywHmKv5GJa+aBtIQro6nHzF51guEOobXAfw9fOwOZSaiux3KGJcV15VPeKjJkVvhzlVfoWPPPbjrdiOI1Lp1xQYlCxtgMXIGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9vmHNJt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9vmHNJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719525851; x=1751061851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1E+oiq46nJRx2oa1QS7F7rivreukck31xug9BYteN8s=;
  b=X9vmHNJt7A/2UqbLYCZmsJqFM5eEb13CxEmdG6Y2GcKHCaO8MSWxaoMf
   CFbxEbQvyqbRvVXONhIE/eJ8L5m/bucfSB+RR1V48V8xKlRp0VYW/3igF
   wbCFcl5svl2yu18G1e2aMtiY3IwPOLdnJqj3Re3RimGC/w3F4QWdM0Q/1
   ZYu/Efb7MXoa0Cmah+xVJwZO+9I/VZM148se2vBfeIpymI40ikph3tmzR
   OoVhYsIe//vE5wuc5Il/ydpaJXzLAseaP9GeECgC6UfEdfGV8gw/kOXM9
   4zyrLoetf4GtpWLc1Bt5Ufo+YEZJabTISKadd0FzDneXjKYn0dgtRJD/c
   g==;
X-CSE-ConnectionGUID: o4pvqDKmQnGjltSz6yJ1Ng==
X-CSE-MsgGUID: vniHeBeLSkCeVLdH0ZTwig==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16913612"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16913612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 15:04:10 -0700
X-CSE-ConnectionGUID: +1qrNcaDSX+IjBJ2icHDzw==
X-CSE-MsgGUID: UZwBcrJ/RHuSZv7ls85z9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="75284307"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2024 15:04:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMxDq-000GaL-2k;
	Thu, 27 Jun 2024 22:04:06 +0000
Date: Fri, 28 Jun 2024 06:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.pidfs 11/12] fs/internal.h:324:27: warning:
 'struct ns_common' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202406280524.UzxDU1Go-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.pidfs
head:   bd53bc0c807b64ea98685d70beff1a3246dd8db9
commit: 7bb123ea6cc01f9ebd111a9b35ea17897f41382c [11/12] nsfs: add open_namespace()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240628/202406280524.UzxDU1Go-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280524.UzxDU1Go-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280524.UzxDU1Go-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/char_dev.c:26:
>> fs/internal.h:324:27: warning: 'struct ns_common' declared inside parameter list will not be visible outside of this definition or declaration
     324 | int open_namespace(struct ns_common *ns);
         |                           ^~~~~~~~~
--
   In file included from fs/iomap/direct-io.c:17:
>> fs/iomap/../internal.h:324:27: warning: 'struct ns_common' declared inside parameter list will not be visible outside of this definition or declaration
     324 | int open_namespace(struct ns_common *ns);
         |                           ^~~~~~~~~


vim +324 fs/internal.h

   310	
   311	/*
   312	 * fs/attr.c
   313	 */
   314	struct mnt_idmap *alloc_mnt_idmap(struct user_namespace *mnt_userns);
   315	struct mnt_idmap *mnt_idmap_get(struct mnt_idmap *idmap);
   316	void mnt_idmap_put(struct mnt_idmap *idmap);
   317	struct stashed_operations {
   318		void (*put_data)(void *data);
   319		int (*init_inode)(struct inode *inode, void *data);
   320	};
   321	int path_from_stashed(struct dentry **stashed, struct vfsmount *mnt, void *data,
   322			      struct path *path);
   323	void stashed_dentry_prune(struct dentry *dentry);
 > 324	int open_namespace(struct ns_common *ns);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
